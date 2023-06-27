Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C073FB29
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 13:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556087.868339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6wT-0002NM-UH; Tue, 27 Jun 2023 11:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556087.868339; Tue, 27 Jun 2023 11:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6wT-0002LO-RZ; Tue, 27 Jun 2023 11:33:05 +0000
Received: by outflank-mailman (input) for mailman id 556087;
 Tue, 27 Jun 2023 11:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pgfp=CP=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qE6wR-0002LI-Km
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 11:33:03 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eb2448d-14de-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 13:33:00 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5RBWglIF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 27 Jun 2023 13:32:42 +0200 (CEST)
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
X-Inumbo-ID: 5eb2448d-14de-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1687865562; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JHvG/liOOg9x6bnQUkcNB+uwuHKGh19BHSc2yGolHCmpCFwyM8g+cf4fSLIGrYPcIQ
    3zl9J56v0bksT6YYxzGc2W3LtPYwxVO+Zs0J1YhjEiY8GfKRUFBRqXtfJFGMCg05nlbe
    4TXF0N/UXVkykrOYwwwXaCiKYRhsWarEC94uXqKMeGApd7ReA5NKGyrQ9c0cUAy4EOTH
    9zYhp8eIHBGPmkWqKa6NO8RH51VvPMTKJqVWd2kTg2hWtFiDFcNYVYQTbmYZsA+61aAE
    imj/+hoV2GEICOIv/FR/WHCRH0sl11I+W+EjzKuP+QJX8H9Xqmu95QWpLu8uVw7jb0kc
    Rkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1687865562;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=3wLDUR1nX20PA1ahDWpaygAfJBpRhBHco6snOa6yefU=;
    b=Pff1dk9aKUS7uTsYK9YBps7/+OabGa4UyCXeC274kjdOQFiM9jOJxti9Cl3qWrNIes
    2pRI9IIUJ06WXXz1oAPlXDk8datpiYAFw8gsylcAZ565s4gBhOHMumKDe2IRRgOdvfbF
    glfDrVxJoc6tKG0CKoveHrtQFKDtEXy+08zloJtGTydraFc17Wx3TdW63fd7M3G3qC4K
    M6j/qyrDwwqWYNEOian0QwooYM7Wq3s3gst0N7ecrn1iII3hEs4tTBG3k/x/SZG+SkhT
    +YgjqsJ+uUXGDfchK3xPjtPiT+RxZ/lO5ES3oW5YQSON5WsZBZfRPN366A6h9XeplfJ5
    ktGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1687865562;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=3wLDUR1nX20PA1ahDWpaygAfJBpRhBHco6snOa6yefU=;
    b=HialoChl9s6Ch3YWMLvvcUSZ0m95Wzq3PsoRwJPTv2DWMjx14jpopvL7CtUEDAcCwZ
    jzNvCZK63rrgvs0HBNx2FDfg44Q0Q2xEvH55rCuBW3YaBEz7TPazUOyjAF0IkOaFzXT3
    /hSZIPB9PaxD89PR6HIsVAhEOCNa/fnX8H/PzmCOgdVaqIsTKFaF/SLO/QmPSlYRUihv
    X9H2BGqeDjsZ0pwJRmORh/T7ZcxDv9DcehQ0AYLF4TEA/pCqDjMjJZ+m8frcjiJA8FCZ
    hJQiZt+N0R87MP1h2bGeHuOwWC5zWFoqvTEVXL+i5NpfJhjjb1k4xAo5sPz3J/AxlnkU
    4f4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1687865562;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=3wLDUR1nX20PA1ahDWpaygAfJBpRhBHco6snOa6yefU=;
    b=jUs35QFYM0UDsF3kErXrKoeYeOdy/tHUl251QMJjmDdApYUsQCVK8SnoFwdxpDwqXM
    nSng0EHsy7BbFM1iT0Aw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXWiuRyeUQh3GC6w0BTiV2X9kN/WAr0rdTE7oY1qJzPNA=="
Date: Tue, 27 Jun 2023 13:32:34 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <20230627133234.400a2ec7.olaf@aepfle.de>
In-Reply-To: <20230626231901.5b5d11c1.olaf@aepfle.de>
References: <20210317070046.17860-1-olaf@aepfle.de>
	<4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
	<20210325121219.7b5daf76.olaf@aepfle.de>
	<dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
	<20230509225818.GA16290@aepfle.de>
	<20230626231901.5b5d11c1.olaf@aepfle.de>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FGoC2=mDpSn8iKH.kGPuoRS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/FGoC2=mDpSn8iKH.kGPuoRS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 26 Jun 2023 23:19:01 +0200 Olaf Hering <olaf@aepfle.de>:

> So far I was unable to decipher how the pci_set_word calls can
> possibly affect the outcome and the owner of memory_region_ops_read.

It is enough to return from piix_ide_reset right after
pci_set_word(pci_conf + PCI_COMMAND, 0) to trigger the issue.


One thing which was not mentioned yet: the order in which kernel drivers
are loaded matters. Usually it is xen-platform-pci/uhci-hcd/ata_piix.

When uhci loads, it scans the USB bus, finds the tablet, loads usbhid.
While this happens, ata_piix loads. It finds the PCI device in state
disabled. The PCI code enables the device. On the qemu side this ends
up in pci_default_write_config for PCI device "piix3-ide" with addr=3D4,
val=3D1, len=3D2. This calls pci_update_mappings, which for region #4
changes the addr from 0xc120 to 0xc100. This causes the issue. Now
usbhid tries to use the USB bus, but uhci_irq fails.

If ata_piix is not loaded, uhci works.
If ata_piix is loaded before uhci-hcd, the USB bus can not be scanned,
udev is killed after a timeout and boot proceeds.
If usbhid is loaded before ata_piix, USB bus discovery usually finishes
before ata_piix enables its PCI device, boot proceeds.


Olaf

--Sig_/FGoC2=mDpSn8iKH.kGPuoRS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSayNIACgkQ86SN7mm1
DoBqPA//dGvrfziGG00PI5ukQu5SnCSppRsgQehXnpEajUx7U9nGEVo3TW9+gGVq
TuPxxstwUwZkmrfAIwKTX32LEGlDswOt7+mzDruAR4mmdwu3B1niqdyFwFRlwRCc
cdMSesNCwhUBxcvdYCofmwurVJhGccEpGWbttXcSTqF6bQztDds3N2b9n1ixwVkW
tHLcuOpTUC8i+sWe26w4MuVQF0A/aYKmIMw4WU5RcDFcAjQWrmb5qcOe6/HIWGW/
N0WBkBy90DkAOEIV9l1jeSVoy5E2Lhrhp0nyR0srPH+RCu8ELQ771mTYQ4co0Duf
CZcXRsji3yI8PL2g514tJGbsEsn7ZgOEbtDKoqUizi3VhaumRpZCAoKTG8VnYVd0
qrw/X4aAU9cH3LL5qxBMsoMEntjmK5+dbZf7iDwQ2QitSsIPWONN/X9KJMV8vmuv
hRxPV+JuQ2qLW8ynMictmd24LhQzDwsFIXktk4NCDdvfXnOJMXH8i2ppgsG7yf3v
CnbgJ+U2bVc0c9+z/F4Cc9Yd6psdb9m8OCcV9hd5aMloJnJ9gB9xJI/oiaXj8LKR
y6nTuN4vp/jEwh4/sQ2qhGhsDurGpJPIcYGieWnKQzPYnRsl1ZjZyvTX/aOvnhPG
Cp6KHHdCxSv4K4BIVyLaAArluBIi/MuT1uuXEWGi9BFDsWgk5pY=
=lOjw
-----END PGP SIGNATURE-----

--Sig_/FGoC2=mDpSn8iKH.kGPuoRS--

