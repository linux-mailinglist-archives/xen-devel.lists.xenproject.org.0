Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32586F46DE
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 17:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528720.822228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrky-0003YK-Gf; Tue, 02 May 2023 15:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528720.822228; Tue, 02 May 2023 15:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrky-0003Vw-C8; Tue, 02 May 2023 15:17:32 +0000
Received: by outflank-mailman (input) for mailman id 528720;
 Tue, 02 May 2023 15:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptrkw-0003Vq-VQ
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 15:17:31 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 734e5329-e8fc-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 17:17:28 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz42FHRdnY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 17:17:27 +0200 (CEST)
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
X-Inumbo-ID: 734e5329-e8fc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683040647; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Wa57NokZYMCCzcN803tea9dgEoWAtmCZHOIBOey296a6pkqxIZXnNjZ8UMJwAV7obC
    Z1Hnptv5PcI4mT7GOtWARy5HQk/0V/Q1pK4D4JWpo3b5YOk9Gs+MBWAFPeZSOblrBPeJ
    JH7JF0ZNFHC0VZcrykd6vkKrd5aRNmZEiJRVSbUPWNfvqSuDjwDy+JNKD6ZkBMdN8eOg
    r0+0MZnnLqyghtBjYmVy0NY9WlWdNnsfGhB3U9TXRkMQ7/2gbUX1g4G7FpV68gl25QN4
    Dpcl+64MnjyvVtG/f9pktdVQynXCujpubHCqqpwwZNSa8q4HuQYg71FQxks8ZNE2IT+Z
    CgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683040647;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Fwogx588Aaq2W17horur++XnjoVqpQdEpobUSP19l0k=;
    b=tCvtVlzx69JaEKJFbncI1ojaEt+7jWmnG27jF90to4daDrBRi8t6lhKZ8ZY4Ofsypk
    Bmvlyu097P/GBwoyJDmZ2HMic9jD/jVrqLogsvY7Vd9EIsNILVPwnHwPhi5vwLDRn/mj
    N2j7DgUUv63jezP5Qoz6KsVimd2eLMlSUFUJ4u4INv6dTsneZl3F5g6cEKkVMSZ8+fx2
    3MRA7yRyWIpDC97RmnxaFMOxPHROclUYDIE8er3jS06LDsDlM0An5qOj8lWdMzXPhodP
    px0FxytJhhv1C2CMZLYgwZPDMHaUOFOMFe8d8cAdxta88Ypd8k4O3ofDAWA9lyx3o8LZ
    dyWQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683040647;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Fwogx588Aaq2W17horur++XnjoVqpQdEpobUSP19l0k=;
    b=QBncioqE5fe9U6uDbElKvJHsPyNUd9YyBEjutjToQrAPTAD/5/hQU+FEG7xqTUuZ6k
    elo5QLVcEUw743fpp48jdF4KBOfWcjqFT9eg8HN8NTtE1ge4dsOi2XorIW7NkTYPfiZ6
    xriap2gL9ohVosD8PdKNp7eTEJyvVzjvlDkFdjPzh/xUuFXEyMngvmpb0Ir+uFKzoUf7
    isqnU5rzRRziy+4kYhfwhKUb3t2OfTp3zJYAGEldXgJRiHtJ5Je6lEoH6NS+1D0hwWTD
    /Y9zhLfDa/r4iBDIXM4jaGeUJFQK6DGL8qtEgCKGLTEGC/t+27o7bTDkREd2aKGrph7w
    u0sA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683040647;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Fwogx588Aaq2W17horur++XnjoVqpQdEpobUSP19l0k=;
    b=vNi8eV540a1kJ62UpVgJaLrN32m9t0liS3ULrEqaEBerzfymeoHenJ2FhTwPlTAc1x
    YhFY6ZvI+7mdKxGviZDw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BxOIbBnsc1fym1gFvNQ7EzMpH+yFJc4aADp/8Q=="
Date: Tue, 2 May 2023 17:17:20 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: HAS_CC_CET_IBT misdetected
Message-ID: <20230502171720.7970f914.olaf@aepfle.de>
In-Reply-To: <bb07dd8a-598a-564c-3dbd-457e982fd5d0@citrix.com>
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
	<43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
	<20230502133313.2192eb99.olaf@aepfle.de>
	<20230502140444.1dacdb33.olaf@aepfle.de>
	<bb07dd8a-598a-564c-3dbd-457e982fd5d0@citrix.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w5sxl/Ob8gw=tMiashUNBs0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/w5sxl/Ob8gw=tMiashUNBs0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 2 May 2023 14:41:25 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> Does this improve things for you?

./checker: /lib64/libc.so.6: version `GLIBC_2.34' not found (required by ./=
checker)
make[2]: *** [Makefile:24: check-headers] Error 1

I think as soon as tools/ or stubdom/ is built, more issues like that will =
appear.


Olaf

--Sig_/w5sxl/Ob8gw=tMiashUNBs0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRRKYAACgkQ86SN7mm1
DoBiQQ//coHthXXsKJimfjYYvq/c2zdS+1YE4v6VW3u1EGTrJvGkIt/HOtLnEuk5
iZm9d/CAigEB998Cg5cZJADDJUhriYkH7b7wmypwfL+Sn5UXZrZwZVzugQ/fwBBI
uHSu5/exah/fV0vz58+WRT8Lg4ka791nBmzWZPd0A10z57RUlZtGez6vgGU/YHw/
7iAIrkPaA+MaQ6iPY7rhGoBBFrYwajRo1AZ6aAqO/790zlTKAuEAn9TOT6AbmkqA
okYhEHQ+iKKEZ+zhIINu4yDcH9+HnC6I6J0lhSdSIAz4RDqbttJ0ZyiSO88o4WW3
0J7+pEMJripV2CgYxAHjTdmrcnWYLtOUasmHtM96bbGYVrZtkMz9vExtIB0Nu3Rc
AcmUEy/JwvJLK69fJ112AGoqNuFiR9QWYtzVdUWPdSFYyVWWo2US6HnimQEKA8gW
aGSs8F/+yPrsENEaRBtQbvNydWiczyAHxi2RFD8UZAcVRl7CZe7MOWYykzWaPfSV
nDf20UbtOXtC27h5gb0Y/kVzb2nlfSN+8fzgMJhsl2pyUDeKWYG1KbXra44BA+ya
5TJqbonsLXWjLMx5HK2JmeGP2pfFYvsOqQoL5Coez4qIkl5LBvv/HnKxL7dphs+s
NWXolq+wz5D9PlRS/ERw+gZsqZyyBng1xcN0JlYr4XSvhWhaBuQ=
=HcC5
-----END PGP SIGNATURE-----

--Sig_/w5sxl/Ob8gw=tMiashUNBs0--

