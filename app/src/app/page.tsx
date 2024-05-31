"use client";

import { USER_ROLES } from "./constants/USER_ROLES";
import { useAuthentication } from "./hooks/useAuthentication";
import foodBackground from "@/app/assets/communityBg.jpeg";

export default function Home() {
  const { handleLoginAs } = useAuthentication();

  return (
    <div className="flex flex-col justify-center items-center w-screen h-screen">
      <div
        className="relative bg-center bg-cover rounded-lg"
        style={{
          height: "calc(100% - 80px)",
          width: "calc(100% - 30px)",
          backgroundImage: `url(${foodBackground.src})`,
          // backgroundPosition: "-80px 60px",
        }}
      >
        <div
          className="flex justify-center items-center space-x-8 grow px-10 py-10 rounded-[62px]"
          style={{
            width: "500px",
            position: "absolute",
            left: "50%",
            bottom: "50%",
            transform: "translateX(-50%)",
          }}
        >
          {Object.values(USER_ROLES)
            .filter((role) => role !== "anonymous")
            .map((role) => (
              <button
                key={role}
                onClick={() => handleLoginAs(role)}
                className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-2 rounded-[38px] w-[900px] h-[62px]"
                style={{
                  background: "#51C68E",
                  color: "#FEFFFF",
                }}
              >
                {role === "user"
                  ? "REVIEWER"
                  : role === "serviceOwner"
                  ? "Join Nearest Community"
                  : "MODERATOR"}
              </button>
            ))}
        </div>
      </div>
    </div>
  );
}
