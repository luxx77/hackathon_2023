import React, { Suspense } from "react";
import {Layout} from "./components/Layout";
import {Route, Routes} from "react-router";

import {DashboardPage} from "./pages/DashboardPage";

import NotFound from "./pages/NotFound.jsx";
import {EventsPage} from "./pages/EventsPage";
import { SOSMapPage } from "./pages/SOSMapPage";
import { AddPage } from "./pages/AddPage";

const App = () => {

  return (
      <Suspense fallback="loading">
          <Routes>
              <Route path='/' element={<Layout />}>
                  <Route index element={<DashboardPage />} />
                  <Route path="/events" element={<EventsPage />} />
                  <Route path="/events_add" element={<AddPage />} />
                  <Route path="/sos_map" element={<SOSMapPage />} />
              </Route>
              <Route path='*' element={<NotFound />} />
          </Routes>
       </Suspense>
  );
}

export default App;
