Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C171578B
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 09:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540752.842702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3u4P-0006BT-Vs; Tue, 30 May 2023 07:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540752.842702; Tue, 30 May 2023 07:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3u4P-00069D-Sr; Tue, 30 May 2023 07:47:05 +0000
Received: by outflank-mailman (input) for mailman id 540752;
 Tue, 30 May 2023 07:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZK1=BT=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q3u4O-000697-S7
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 07:47:05 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29de84d1-febe-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 09:47:02 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4U7l1GRk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 30 May 2023 09:47:01 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 29de84d1-febe-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685432821; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=O5pyuOQajUfKJJZelXLlncUTPzw4wa6xYLWChxwlgTdnLlhGpsnBjduSIFjqI6Io5k
    ocGAZQ/HHUUlHn1Jn1j+Rea+YnkoqFh2Geg8IG/5g+4zebFFPW+cglcaoR+dCEKm2y4P
    iElANl/2rFQB37b0If/3oKqVBlRcWcxRV+Oks809Mih7UA4LLxkMXwmvrKcPop1GjZis
    bw3xBHFzezVMnLntvJ9BlmaGt6qjSJ1g0ncu5T4cA9EuKvbejqNuEpaaj0RvCU+kuNch
    Zdf8wwdNSc/Wso267BUf+Msg5zTRDxSr6KjbQojDt5jEtZWWT5KWFomvHJbVtI5CZamu
    wXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685432821;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=H5ed1sClG/HYqUdlEePO7MG/Kd4d6+fyktyGnUhkACg=;
    b=TxZUjPq/fwjKlY6c2zUCqkRJnnE5UALq+Rs3+8AU8bVyjaSfLv1T8RBhzogilKOwaU
    rDHA4qV383QSUv7byKOMigeVtEoMujcL7TJ5O9dGOm3W44qDdXv4SAyh6czOH4zMbCvJ
    vAY9YV0XE9X9eP+zsKybxtgaACXoQOAwt7WecCzFcCTNL3NUU+tCB31H6Kc+1AUTRhGl
    7+Yzh7axqvq0tMw7Nx2gYafF16P1XdVSCdi8jULwngcsHas1DFjOLq/v8CD+R+5OYZRL
    AMrof0b+bLsvZwRm678vEylOP1vGdVFH2hDNQkErhdsf7NhrgMj2h9762vTyGhDyQmGj
    68nQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685432821;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=H5ed1sClG/HYqUdlEePO7MG/Kd4d6+fyktyGnUhkACg=;
    b=QQNHsF23mPH1dl6f4cVBWeoGI2u4GCvu6Av+pnCJ4poNU/jxlaZHdmnN3fuAg8CCls
    zw83E0ItOkVsIS4orwtWC0Ta8HCzn8Hn6w7Yk5F16sXpPq6RLB680fhm5vsLzd+gzryg
    s9vklLIMbVkx8fZAWRiR2IBXMRPF+LZDnUVAXB2HTopUR6FhT921FGliTFR2lqx8viOE
    7pKdQNeGjyWO+am0AAuinq77ICFUgwvBqnv9cQ9BLd/IZq9HzviZJXqe+oLuxx182F2m
    beo+CtaEEBT1UXjYhUGN3Np1pygIeOP3J+gzWWXo5s5WsSv3ibwoTvpXRp1CXOXc/rYn
    WGwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685432821;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=H5ed1sClG/HYqUdlEePO7MG/Kd4d6+fyktyGnUhkACg=;
    b=AKl3jpU53VLlQn2K2dQNCHTu1fjVf8VavxraG4HyN2wbjJRHr/6miAlNrvq++FI+fj
    ETWvnzMUosOXVsVNYuDg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4BhOIaRvsld/sN75OpaIeOWAiVTRkMz6wPlUdSg=="
Date: Tue, 30 May 2023 09:46:54 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: HVM domU not created anymore in staging
Message-ID: <20230530094654.372003a0.olaf@aepfle.de>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a1m.CKEqRsSk3sn4wKm2ua/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/a1m.CKEqRsSk3sn4wKm2ua/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

For some reason the staging branch fails to create HVM domUs for me.
It seems there was some breakage introduced between 20230522T161155.c7908869
and 20230526T091957.40cd186b. I was hoping that osstest will spot this
failure and do the bisect for me, but apparently there is no report yet.
Did osstest actually spot any HVM error?
To me it looks like 180992 shows many failures, but nothing fatal.

The symptom is that xl create just hangs, a domU id is apparently not
even claimed. In case osstest is not busy with any bisect, I will try
to bisect it in my environment.

Olaf

# Xen cmdline:
conring_size=3D1M smt=3D1 loglvl=3Dall guest_loglvl=3Dall crashkernel=3D192=
M,below=3D4G
console=3Dcom1 com1=3D115200 dom0_mem=3D8G dom0_max_vcpus=3D4 dom0_vcpus_pin
maxcpus=3D8 console_timestamps=3Ddatems tbuf_size=3D-1

#domU.cfg:
name=3D"X"
serial=3D'pty'
vcpus=3D'2'
cpus=3D"4-5"
memory=3D'2222'
boot=3D'dc'
disk=3D[
'vdev=3Dhda, backendtype=3Dqdisk, format=3Draw, access=3Drw, target=3D/N/di=
sk0.raw',
]
vif=3D[ 'bridge=3Dbr0,mac=3D00:08:01:18:17:40,type=3Dioemu' ]
builder=3D"hvm"
device_model_override=3D"/usr/lib64/qemu-8.0/bin/qemu-system-i386"
device_model_version=3D"qemu-xen"
usbdevice=3D['tablet']

--Sig_/a1m.CKEqRsSk3sn4wKm2ua/
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmR1qe4ACgkQ86SN7mm1
DoCFag//WxUYGbjZ7V1DoWcMrNFJDPQ+kXwQuMRd0JX0Wjw2hLmZ+ydNuTfh2MVM
2yzqXv6TtmCsrDZ8IluKQsiG331JhDDhO9uGfmCecfA7JCyQ2YElw+szcd+qo99k
3Vuk9yXevw/luRXRklvGZE0TzB3r4ivuW8vjiy6WQK5U9UUFOrQxm/5nyG9bjEfc
xdF28vQWFX2ZCL4ayalI4UyZ+lTUNHH6fXmJk5dVG5pZ1rE8DFQs76BDwtyYOGWe
Mb2TPl9+x6e4M8JKdNZQ2e8kOppodq9p6EU15TVYLywvXBowI8ywJNkeO7VAGtiv
SU2ljM//jPfkkn7B1XC2QDkt8OuHQhH9AaijagQ0HjveLn0n92YSjXVA3UhXqvDJ
eavYBejegKV1jaeXaK0KFQJSsjOlKVoMsC35BJV3GXaKDDqajyoywoRyHoAuZfzk
INv/D7trAX93upz8awfLqSBJikwug0hvf3m/K7/kIHBDAbhfyf5t3p+0GRRk3GHx
cXDoaTUTDhxTS5H8eO9pRohc6VspdNdrrRK30dDgEnAVbh7btYw4eAWlwib8X/09
S1iuXbKPkddL1xSNUAF0TqTz4a4ZswOmzVxTvZhAgmzXHD/pgy8NwLpBdAdSG9mK
2gMSlSjOOptHAfCvOQKtHgoN5+teYXVtoT+AENOwlOm526ABv90=
=XCTd
-----END PGP SIGNATURE-----

--Sig_/a1m.CKEqRsSk3sn4wKm2ua/--

