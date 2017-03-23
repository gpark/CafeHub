json.facility do

    json.name @facility.name
    json.spots @facility.spots
    json.su_start @facility.su_start
    json.su_end @facility.su_end
    json.m_start @facility.m_start
    json.m_end @facility.m_end
    json.tu_start @facility.tu_start
    json.tu_end @facility.tu_end
    json.w_start @facility.w_start
    json.w_end @facility.w_end
    json.th_start @facility.th_start
    json.th_end @facility.th_end
    json.f_start @facility.f_start
    json.f_end @facility.f_end
    json.sa_start @facility.sa_start
    json.sa_end @facility.sa_end
    json.comments @facility.comments

end

