#import <Cocoa/Cocoa.h>

int main(int argc, char** argv) {
  if (argc != 2 && argc != 3) {
    fprintf(stderr, "Usage: set-icon <file_path> <icon_path>\n");
    return 1;
  }
  NSString* filePath = @(argv[1]);
  // doing this because https://stackoverflow.com/questions/33608339/nsworkspace-seticon-not-updating-application-icon-on-el-capitan
  [NSWorkspace.sharedWorkspace setIcon:nil forFile:filePath options:0];
  if (argc == 2) return 0;
  NSString* iconPath = @(argv[2]);
  fprintf(stderr, "Changing icon for %s to %s", [filePath UTF8String], [iconPath UTF8String]);
  NSImage* icon = [NSImage.alloc initWithContentsOfFile: iconPath];
  if (icon == nil) {
    fprintf(stderr, "Cannot construct NSImage with %s\n", [iconPath UTF8String]);
    return 1;
  }
  [NSWorkspace.sharedWorkspace setIcon:icon forFile:filePath options:0];
}
