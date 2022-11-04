const express = require('express');

const router = express.Router();
const entriesService = require('../service/entries');

// router.get('/', (req, res) => { --> gleich
// entriesService.getEntries --> anders
// service folder entries
// entriesService ist ein Objekt mit Methoden
// u.a. auch getEntries
// getEntries returnes entriesModel.getEntries
// model folder entries
// entriesModel ist ein Objekt mit Methoden
// u.a. auch getEntries
// hier wird Verbindung zur DB aufgebaut
// getEntries gibt bspw. alle Einträge aus entries table zurück

router.get('/', (req, res) => {
  entriesService
    .getEntries()
    .then((data) => res.send(data))
    .catch(() => res.status(500).send());
});

router.get('/:user/:date', (req, res) => {
  entriesService
    .getEntriesByDate(req.params.user, req.params.date)
    .then((data) => res.send(data))
    .catch(() => res.status(500).send());
});

router.post('/', (req, res) => {
  const entry = req.body;
  entriesService
    .addEntry(entry)
    .then((data) => res.send(data))
    .catch((error) => res.status(error.status || 500).send());
});

router.get('/:trackableId/:startDate/:endDate', (req, res) => {
  entriesService
    .getEntriesByDateRange(
      req.params.trackableId,
      req.params.startDate,
      req.params.endDate
    )
    .then((data) => res.send(data))
    .catch(() => res.status(500).send());
});

module.exports = router;
