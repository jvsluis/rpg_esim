#include <esim/visualization/text_file_publisher.hpp>
#include <esim/common/utils.hpp>

#include <gflags/gflags.h>
#include <glog/logging.h>

DEFINE_string(path_to_events_text_file, "",
"Path to the text file in which to write the events.");

namespace event_camera_simulator {

TextFilePublisher::TextFilePublisher(const std::string& path_to_events_text_file, size_t num_cameras)
{
  CHECK_EQ(num_cameras, 1) << "TextFilePublisher implemented for one camera only";
  //events_text_file_.open(path_to_events_text_file);
  pBinFile_ = fopen(path_to_events_text_file, "wb");
}

TextFilePublisher::~TextFilePublisher()
{
    fclose(pBinFile_);
    //events_text_file_.close();
}

Publisher::Ptr TextFilePublisher::createFromGflags(size_t num_cameras)
{
  if(FLAGS_path_to_events_text_file == "")
  {
    LOG(WARNING) << "Empty events text file path: will not write events to a text file.";
    return nullptr;
  }

  return std::make_shared<TextFilePublisher>(FLAGS_path_to_events_text_file,
                                             num_cameras);
}

void TextFilePublisher::eventsCallback(const EventsVector& events)
{
    CHECK_EQ(events.size(), 1);
    for(const Event& e : events[0])
    {
        /*

  uint16_t x;
  uint16_t y;
  Time t;
  bool pol;
        */
        fwrite(e.t, sizeof(Time), 1, pBinFile_);
        fwrite(e.x, sizeof(uint16_t), 1, pBinFile_);
        fwrite(e.y, sizeof(uint16_t), 1, pBinFile_);
        fwrite(e.pol, sizeof(bool), 1, pBinFile_);
        //events_text_file_ << e.t << " " << e.x << " " << e.y << " " << e.pol << std::endl;
    }
}

} // namespace event_camera_simulator