const express = require('express');

const router = express.Router();
const trackablesService = require('../service/trackables');

router.get('/:user', (req, res) => {
  trackablesService
    .getTrackables(req.params.user)
    .then((data) => res.send(data))
    .catch(() => res.status(500).send());
});

router.post('/', (req, res) => {
  const trackable = req.body;
  trackablesService
    .addTrackable(trackable)
    .then((data) => res.send(data))
    .catch(() => res.status(500).send());
});

router.get('/:user/boolean', (req, res) => {
  trackablesService
    .getBooleanTrackables(req.params.user)
    .then((data) => res.send(data))
    .catch(() => res.status(500).send());
});

router.get('/:user/quantitative', (req, res) => {
  trackablesService
    .getQuantitativeTrackables(req.params.user)
    .then((data) => res.send(data))
    .catch(() => res.status(500).send());
});

router.delete('/:id', (req, res) => {
  trackablesService
    .deleteTrackable(req.params.id)
    .then((data) => res.send(data))
    .catch(() => res.status(500).send());
});

module.exports = router;
