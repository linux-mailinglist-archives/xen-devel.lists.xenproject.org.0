Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446571F1412
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 10:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiCiR-0006Di-W3; Mon, 08 Jun 2020 08:01:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iYtX=7V=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jiCiQ-0006Dd-6s
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 08:01:06 +0000
X-Inumbo-ID: 32719ece-a95e-11ea-b24f-12813bfff9fa
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32719ece-a95e-11ea-b24f-12813bfff9fa;
 Mon, 08 Jun 2020 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591603262;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=bSjwCiDwxf/twq5csyarYSAu99LG1JqWBEtyE1q/jkg=;
 b=owSTsRKFnxw957baNu3iUIgP43KzpC7dq2yiuhowovmJmNhz4NzLPfwwzQl/Vrbtie
 ueGNp4XasZQYKBmGKPNue8xTIAMcsVaGBzex4O2A1n+gP96WhBN6oaNrbzGhUUasFbT5
 C+g8Hy46o0UnndVF9EvUU4zlG69/r9Fpf9LLJAFoYPZPtpvfm1wizGzUtHjNhd3aM8M2
 CyAdyaaMXta7viSlnqjrdYEjINQ60Lq5jLkXYp4TjB4ZVPzwt394H1vVnDPBR03rgcuM
 HeAKA2gI3RQlfAsfMrHaAZ11P86LdS/CGYBnJsRjUzm5q8bMvuXF63UEPLFm5BhT3eS6
 rKzA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w5880qEx6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Jun 2020 10:00:52 +0200 (CEST)
Date: Mon, 8 Jun 2020 10:00:51 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] tools: fix usage of strncpy
Message-ID: <20200608100051.16be834e.olaf@aepfle.de>
In-Reply-To: <20200608072855.26589-1-olaf@aepfle.de>
References: <20200608072855.26589-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/h/LRu=eyo==R_G_y0k3hjvf"; protocol="application/pgp-signature"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/h/LRu=eyo==R_G_y0k3hjvf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon,  8 Jun 2020 09:28:54 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> off-by-one error in libxl__prepare_sockaddr_un

There is none, I had read the code backwards...

Olaf

--Sig_/h/LRu=eyo==R_G_y0k3hjvf
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7d8DMACgkQ86SN7mm1
DoDIMBAAnNpxWXo20pSSHTEtL98Jc+kysWtGpPZYnRzhNlSfQ4YwXrWR0jQ8GEAM
TeHOPEr/Zpcrq3LqCuNWeGN8uvVvXb1LPwo5bq5pyISU2WOuKm78bmdoZAXUzr1I
Oy+HhX8XDorHh9ursnweO4/z1o5daNeZYVJSfeuoPNnEgrGULshSX/VVTgZFDfp/
6rRcqzc8O1mWFWToLdrZ43rMv3c3oSkefaU7E91+CcKcjI7tdtM2lmzigdaOQZQ5
SDhNGOmDIs1XF95Kyt4fjgkKV7wecGOOAwQZZ1MpP+cpRo72oKbq2JHbrUuL3LQ5
CQzIJY+LIe0syo/yA8EyDfYjf0lTNqyo9hY7YOBem5TbKqI/mB38MEel6Ot8nG58
p89iGK4BOGd0cTokeWq+S/ryT4IJEBiVjGBT8sp4n8NGp8sGPdxntFyXMV6b37me
I4XQp1jXRl7ZZHIuWe1aFXfI3q26TeBI54Gry4cdHn6MjhPdT/1KIkea9KPTaBlv
8QsSpimlQQVgVJOlKToPkPxmFKvfyxVDJSyT4ORGnpQRyhTovw976OxiW7ylZhc7
JOb/Wat1srIyW1NgC+mK5fNtOYWrKJ3Dt7zbDTEzdOwzAA9P/YcvHShLdX+kyj2n
NyGxLDbMW1lbTXeOh88AGTJ1qf9W7aTxBVe56A03k+FIGvjlJXU=
=o5jT
-----END PGP SIGNATURE-----

--Sig_/h/LRu=eyo==R_G_y0k3hjvf--

