Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD60923B19
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 12:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752232.1160405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaUN-0005uH-VU; Tue, 02 Jul 2024 10:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752232.1160405; Tue, 02 Jul 2024 10:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaUN-0005rj-Sh; Tue, 02 Jul 2024 10:11:55 +0000
Received: by outflank-mailman (input) for mailman id 752232;
 Tue, 02 Jul 2024 10:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cybj=OC=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sOaUM-0005jo-7S
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 10:11:54 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 804975f4-385b-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 12:11:52 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 50.5.0 AUTH)
 with ESMTPSA id D05b2e062ABc78A
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 Jul 2024 12:11:38 +0200 (CEST)
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
X-Inumbo-ID: 804975f4-385b-11ef-a59d-41c015c667e1
ARC-Seal: i=1; a=rsa-sha256; t=1719915098; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AmbsJ242lAVe6OuNUJVwuZf28KntQQxaFA8ZtQ5uquN4/lYZy/2p8Ldk1/TiVTVKTI
    FFLHYMpsfA1mhfwW+UjFyj2YUBlpOXAA+RvQZI0wiDRspW54lqu3frMEZC5Rm+KcCU7o
    XchhGw2zHUU5QuusLUYOCbXu/b1P4jKa4n1XtaicHyE30BT0O6nf9Mq7UPIqHDaAunIm
    pBPhkhDbRqLP43aVeTQvOGL3qEXamqDPhIj8uj0qCBk9b82+ZjsEPBWrQkeY1sZZyJAE
    IVXR/cvPTmetbulF4srKsx9LxkDcXjVrn92h91mQNY4npxK0AIkmQzPn8HxiLbOIpVPw
    cTow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1719915098;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=MXIpvH+UsyUajywBv8eacNPmS83RaqL8sBDhu2M2AsY=;
    b=GtXPgNtUzvNrPcFL2dmZpNw7Xfs4d9Ls6fM/0jSuoiZgXUog5sOtaubm0JGpromdFQ
    B2NNh+N4Dl3NRSEUMIygkQpkb/H5zfi4juAu7Cv1StbNZOrH0KoBBXDJinRu2oj0QgRb
    W5WKlNNUYqhgXkZDtHVhze6hBZ2+S7bJCEQHXs0ftPerKwJTAqB5Q8mKan9UNsngykXE
    nR0lfwIdS96rB/Qd2a7hqh+QQ3crHoQ/b7TQARPb9W8l0kE0nLLORYo9Fv4QVI/EzMPK
    fBGerkZSH5rZFxrNYR4IZjXPW/Eb7sU3dGbsQLaiIQsvvrXldjkKjHoeqhwD8smg1Ptw
    XHJg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1719915098;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=MXIpvH+UsyUajywBv8eacNPmS83RaqL8sBDhu2M2AsY=;
    b=in8q6dP8tm5JhJ8Otz7UGN5U09iwjn3qD2+13uEZ4U82IVFj5HTQvV/unzkZh9DSMS
    9YC4QI3s6ZITPZ/D5zKxU0h3XA0ZzkLzgSXzimzQVsjOfA+Jy0YP5WQlgOPH72KI7mQG
    rNbEnCjgE75aJGnG37ZfXjfzUNdGshpjpwLh8zsbP896brWNHwNLMEdljsjxnifozqPG
    OcsJ6BvDRrpxCB4ZGjIvjirLOIQuO0qzB2PGp5Vgr+Yuv86uH8iU/v/tfz74Wb8UN7vb
    eTRmuFmIjC1/kMwR9hT0yY7obo9iWTWBHyvdjY7ENV0R0OC+ZvIBFwdBBxGjJTVOPeyY
    xyWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1719915098;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=MXIpvH+UsyUajywBv8eacNPmS83RaqL8sBDhu2M2AsY=;
    b=1WQfS9CSWx854Bvu6L2j1HtYjh8pSd5u/ZW8jOiXG96OY6R9bMiMs4oK2tCRUCvNga
    EsdYl8eAQWuAjM80RICw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5WhGIbRzste6KTBtrm2+bHoqLihuNINg5CX8XJw=="
Date: Tue, 2 Jul 2024 12:11:29 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org,
 Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: add findutils to suse images
Message-ID: <20240702121129.201a677f.olaf@aepfle.de>
In-Reply-To: <b6f3001f-6ad9-4833-a0cd-3742df49acb7@citrix.com>
References: <20240701151512.10187-1-olaf@aepfle.de>
	<6231910f-b4c9-4604-83dc-c53e53d30409@citrix.com>
	<0551e31b19bbdad8aeacb6c76e7651abe1b8ca4d.camel@gmail.com>
	<b6f3001f-6ad9-4833-a0cd-3742df49acb7@citrix.com>
X-Mailer: Claws Mail (olh) 20240408T134401.7adfa8f7 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sZwy_FO6epfsLHFAcIbeH/H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/sZwy_FO6epfsLHFAcIbeH/H
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tue, 2 Jul 2024 11:02:00 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> This patch is about keeping Gitlab CI running smoothly.=C2=A0 It's not
> related to Xen 4.19, except by chance.

It seems the automation/build directory needs to be purged from
non-staging branches, to make it obvious that images need to be
rebuilt from the staging branch only.


Olaf

--Sig_/sZwy_FO6epfsLHFAcIbeH/H
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmaD0lEACgkQ86SN7mm1
DoBEkA/9Fmd2znvuX6l0oLEO/hKjxnhxc81Qj8DmGRuC2DVTIU21NLLPDNczTJfu
ZIsBRekQj22SAOVHqeicUsWIw16OXn76LGge+M10caZl+oM322SHdX+09MZQvWgf
kSX7I9Wyz3z0s8RQPndZbe6wXOaLQJku/racVm9mIcBQ79TwsUJgGB5CWMNFbXOt
Va7Tn5v7GyfGVEjV753QeV8s7WRbVIvevU12LENgy16tiSz4Im+34+IqYewPRqp4
YiPr+FOxr2J+BFN2GucxIGC6tUoe6ond3vBgEKyFUC+u4C/51unpy0Amv78ubM7+
Dj1IG6Cynf3rJkH/3WADAM+5qW9pd6rNDwakmVLlTMZrNlBsOKiySNz30D0oRH2z
G8nMOFoaez/wJ4XTM0sEHwbwFOKYb4RjwicHdsnTM2tSq7JmJzV/sxX8R8SFRWH5
Iy39Zr6NfRC85fveUxF3nO0f+Pi4xaG+FAGdbbs4KrcORDKqMkURjQd17CvMhK9m
KbXGLTfZGjzxUx8IKflXJVTalXvcfpvLksbZABx1/X2XqpkVS0b53jb7qrYOI07p
1TsvEmkcHIx8kOaOcxPNuBz0I5owXhd/i46m/sHcjLa9EnlSdsI+9ig8UvYIJ8aM
Ws0DekQUWJnigCW7WFqIFThMajW56M14FlEfCYh6sEGUgiLc1Kk=
=w5eE
-----END PGP SIGNATURE-----

--Sig_/sZwy_FO6epfsLHFAcIbeH/H--

