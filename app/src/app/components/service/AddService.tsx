import {
  Button,
  Label,
  Modal,
  RangeSlider,
  Textarea,
  TextInput,
} from "flowbite-react";
import React, { useState } from "react";

interface AddServiceProps {
  dashboardId: string;
  openModal: boolean;
  setOpenModal: (value: boolean) => void;
  onCreateService: (serviceName: string) => void;
}

export const AddService = ({
  dashboardId,
  openModal,
  setOpenModal,
  onCreateService,
}: AddServiceProps) => {
  const [serviceName, setServiceName] = useState("");

  return (
    <Modal dismissible show={openModal} onClose={() => setOpenModal(false)}>
      <Modal.Header>Join Community</Modal.Header>
      <Modal.Body>
        <div className="space-y-6">
          <div>
            <div className="mb-2 block">
              <Label>Community Id</Label>
            </div>
            <TextInput id="dashboardId" value={dashboardId} disabled />
          </div>
          <div>
            <div className="mb-2 block">
              <Label>Your Name</Label>
            </div>
            <TextInput
              id="serviceName"
              value={serviceName}
              onChange={(event) => setServiceName(event.target.value)}
              required
            />
          </div>
        </div>
      </Modal.Body>
      <Modal.Footer>
        <Button
          onClick={() => {
            setOpenModal(false);
            onCreateService(serviceName);
          }}
          style={{ background: "#51C68E" }}
        >
          Submit
        </Button>
        <Button color="gray" onClick={() => setOpenModal(false)}>
          Cancel
        </Button>
      </Modal.Footer>
    </Modal>
  );
};
