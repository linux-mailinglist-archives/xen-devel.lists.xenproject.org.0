Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E5716EA4
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541383.844104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q45vx-0008Cc-7T; Tue, 30 May 2023 20:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541383.844104; Tue, 30 May 2023 20:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q45vx-00089H-4X; Tue, 30 May 2023 20:27:09 +0000
Received: by outflank-mailman (input) for mailman id 541383;
 Tue, 30 May 2023 20:27:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZK1=BT=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q45vv-000899-Cu
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:27:07 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57787e44-ff28-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 22:27:05 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4UKR4Jzg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 30 May 2023 22:27:04 +0200 (CEST)
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
X-Inumbo-ID: 57787e44-ff28-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685478424; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VnJEUutl4jkMShBSlAMojyxUABKr49OJDLGqYKlf2+zFQD7cFMfWUcQEuXo/BIDRZ7
    Yjg6PCbY5Bo9zzyQnPYUMOJgsrkjs7q5pihBNZcXBDA06GI4psVWQHNGyEConKpX6NEa
    bFgBJxO0BB3VWL9FsSsmq8VT0wxYOM8AKnMNUZiA1JO7T9GQ7iZyQYStrHMbEUxcFiHk
    P0DJBKledmCiFBA1uY7Iqg0++qORJBr/QfB0m0o12uLq/Zozw1TjbcSSbcTVm1vlwRr6
    WuEw+BrFZ7qdO3Unfgk4u1067pOIlhyR7IIRrKWuSBJw+xhpsUzVGnyWpbv7bGBgW+QU
    M4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685478424;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:To:From:Date:Cc:Date:From:
    Subject:Sender;
    bh=s2plSWGis1tu1gHRH55vXU6XuYyXsLmkSD2I2Znt0Lo=;
    b=sroE3XSrUPUHg4MgF8n5rkUgownQW0v4JwcKPGPlSAWW0aLfQhHhPExudm49LKjK92
    qNaPiD/bPOvu8ZtHCmyDv1mb8ZV0SWOv1hXG3qBjuQZz6QoBrpQPAEbVjgORPvbCMTg1
    J6vGgiqGxXd2fM0KSgZfeOI/DRCcVLQ2XFvhUFHGSpS2nUz+Iz0PtCqtGezoBbIYaOws
    dtG9n9OqmNVX2NqWAXiWPtleFEztZCad4yMle9wN9aAvihv0DF6YBJSSkr5dvDTtYVnN
    ftRPhBljXut5H8tYpecgA4BKlyfVlIwQo9DlsvPJ/VsyH+M8Eo6p4cIRUNCZ7S3huBs1
    iRTA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685478424;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:To:From:Date:Cc:Date:From:
    Subject:Sender;
    bh=s2plSWGis1tu1gHRH55vXU6XuYyXsLmkSD2I2Znt0Lo=;
    b=HbJTI4P029QJ2tyWb+HHMeyYokWyzEU9vegdkD8Aivnz7bweLUDdRBh1xJ3Iv0Oe+t
    L6hdMU6GPTCIGJepZL6uxkKTmnlEX34UOAUTOcDr+EKEtswi/4nFy9Ryo5Z5WMDHx3qe
    fIr4P6LZmygjaW8FLw2Fpa4nb2ihIraGL0xRl9LHhl5rYGYMZawPd6UzyA9jDvtztLcl
    UMzLSxEsELk0BSY/67GtgklTttL7NXg50VXuIA54qX1zGM7JJvDn2dmN6wHq2EYq1u/4
    xoQFoFHssqfaehStQPRrwT6Ba44DM6bgISkhqnmUfPmfHzrO2y836upOAOHmpFpHiN5r
    F2Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685478424;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:To:From:Date:Cc:Date:From:
    Subject:Sender;
    bh=s2plSWGis1tu1gHRH55vXU6XuYyXsLmkSD2I2Znt0Lo=;
    b=mmwf29V9qBoLS00pIPCnj94GJVuSsM9ISky1xi1fNvMvguqdIfF/O45FH7JBXslldn
    jgWRxtAUNMjolaM9+UBg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4BhOIaRvsld/sN75OpaIeOWAiVTRkMz6wPlUdSg=="
Date: Tue, 30 May 2023 22:26:56 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: Re: HVM domU not created anymore in staging
Message-ID: <20230530222656.30169b97.olaf@aepfle.de>
In-Reply-To: <20230530094654.372003a0.olaf@aepfle.de>
References: <20230530094654.372003a0.olaf@aepfle.de>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vc1KSlax09WF4JCx0mJkAOd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/vc1KSlax09WF4JCx0mJkAOd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 30 May 2023 09:46:54 +0200 Olaf Hering <olaf@aepfle.de>:

> Did osstest actually spot any HVM error?
> To me it looks like 180992 shows many failures, but nothing fatal.

I think osstest does not run Xen with xentrace enabled,
so it can not spot the failure I'm seeing.

Olaf

--Sig_/vc1KSlax09WF4JCx0mJkAOd
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmR2XBAACgkQ86SN7mm1
DoBqMxAAlBcAIulIXu2AQW8w9Bz+9PIMUiL4/Ac1lPmPTBr2eDv7SVZjDcjrPfQf
0lFJdYzxbX9quh3qFkSEZ/3Q2ZH+hFT3WlwXYJObSPq189QvEaQLZZR/q3THO+VK
va2q91CgQ4cRLLuAvh3PX1UbssLa0JeTrBTzNiav7KflBUltM35r4PSxrcOslwwp
nNKIu1hYTSQah9cTpR9Hi5tLZuN/K3qwfP6lMu9rZPwA8MbIjaD+eBlBSa5RAqpG
k1VZbKGc149A9V2nl3tNB5zG6Dh6JGKJ4Olt4gxOM4y/2Jc6+K3natRKwnKnbnLl
LG1sc3gADh99+CSfDszOshE1NhRxnSf+yW/Hw+c+QSTeC95hkb+i+QZkklNlAXku
eDA0uzMWtVYzzsOIFsTOONsefZ0JsjSRPrxp/NsZW2Jd033Q/NmnxIYAQE/eruQ2
/LzQAU7tjv8iukH6dT4vZVgP5PwIWWu0GFoyrzl1hwyg4HFemzFSJGLIOR+6BnBS
Xkzntx3Za3bjYcryh7kvikKNHGhc5rAmh0dcV3wUHPy+maAR4QpCOw3Sq1sB5srN
00tKBzZr91+nBoDJW46NmmufNUpi0pnXNfCqad7gVEZg1EHHxEB4SaYQ71lhH83Z
ZbB77YOkhWjppfDaPWbWcTMTd/f9VsySBXtlfZJ8C2jDTQqmx7k=
=geh2
-----END PGP SIGNATURE-----

--Sig_/vc1KSlax09WF4JCx0mJkAOd--

