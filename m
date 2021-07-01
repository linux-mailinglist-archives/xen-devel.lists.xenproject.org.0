Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AD43B93B4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 17:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148918.275239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyIy-0000ll-6i; Thu, 01 Jul 2021 15:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148918.275239; Thu, 01 Jul 2021 15:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyyIy-0000jd-3S; Thu, 01 Jul 2021 15:08:40 +0000
Received: by outflank-mailman (input) for mailman id 148918;
 Thu, 01 Jul 2021 15:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyyIw-0000jX-7D
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 15:08:38 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35a43b2c-da7e-11eb-8338-12813bfff9fa;
 Thu, 01 Jul 2021 15:08:37 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61F8U7Pv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 17:08:30 +0200 (CEST)
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
X-Inumbo-ID: 35a43b2c-da7e-11eb-8338-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625152111;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=190ANC80fjmodXC6Is3P8V2pQJsWM0E1YXYCwyxcwEY=;
    b=ZzJGVDtZmXTZ3Ofr3cVbT+YGqtdrDav4z2D6FEYR322AOlY9C8hdZIGlI56RNmzUak
    oaqfcndKl9O3lfchPsQgecXprNAkGovqMV9nKK3bmdyrjgO87HPXvctUammknrRRSrPp
    bSIuaqeMaXNaIfOptH1lzws6g/2GP6W8SLzbee1HCksWIHvrud0uAHb0e3j7Fz7Gi0oP
    y3UV5JOowwXBIdhDwmIjSIgpxmPuXVRFq9j5gt+NhZPn2riIpaDcYEtrOFySU5JrBHZI
    O5mzAbzeCH1gfwvNsvX5vHYcHAD/9jmIgn7ee0XNin2ptzi8+SY9zRrMaMSmt5j7Yhz3
    PBAQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 17:08:21 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210701 03/40] xl: fix description of migrate --debug
Message-ID: <20210701170821.1f6cdd80.olaf@aepfle.de>
In-Reply-To: <c8251c66-0b3c-427b-c459-7d587ab85ba7@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-4-olaf@aepfle.de>
	<038fa686-c7e8-4afc-e84d-216c3a3f6d5b@citrix.com>
	<20210701164055.6f373be1.olaf@aepfle.de>
	<20210701164135.5ba31381.olaf@aepfle.de>
	<c8251c66-0b3c-427b-c459-7d587ab85ba7@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XR_bpdG+7Xi0.jilAwYy4hu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XR_bpdG+7Xi0.jilAwYy4hu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 15:49:08 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> --debug makes no sense at all in a checkpointed stream.

This should probably have become "ctx->save.checkpointed =3D=3D MIG_STREAM_=
NONE".

But this still leaves the question what value this code branch has when ver=
ify_frames does not, and most likely can not, work.
I think fixing it requires to expose details like which pages are grant pag=
es.

Olaf

--Sig_/XR_bpdG+7Xi0.jilAwYy4hu
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDd2mUACgkQ86SN7mm1
DoABWw//VFy/dW3EykCZhfeTJWq51gBWbxz8QeOA1yyeg49Tyskjcr7wPpnWrGv3
whafIYj9nGBlfkdbhWerd4Zv645kYvXteGyPMlQ2MilgtJ2qwYyzuuMXRK50sAjc
sbiAxc56RGc0IgD8cczZIzw/H+6qQ1UQMY2zJcFsbOkplaYTcfbxAgHZuU5Q79lH
s48A8uTf17EVkaU4JNQ92MTzaQ7VeAIZARDWkUol0a1pbCADIw0iTwheATWEodQ3
Ch09e5NHI7wUmb4CMvyaVBeLFKNOjWGZyUszdgscql6YzVT2lc3DeTev2pgqkcAi
1NkUIdi15hB/E/NUcgdCLQhl07JJ3vmCgQRJS09oB4X2aC5Gr/1rwKOuWxOyzGZ4
rtqrRP48dh6xtU3U0+gX+GIGXnK1sEPtGSsVMfSUj51I1jIhp92x1nyeWLJ2m1hQ
5dV6r1fpog080Hg3CJhOeJ6ruqBBF2s4C18gjgVTnPIxB3CiZPegm0Q9piYmGEu9
mfKwd4jo788Vp61Xv5+9cUnXPsf9GV2v/gCURUV75P1DuBJj5jJNlyyWKbw/md8A
1WeEFWZry5p4wuQ+PRp8egsdZZm0n+pGnSvEmDoP0iZIBHj3mo+cyrA34kqzY3t8
/ecZ2MVhLvH5QqgPZcngFi3tkPEIiI7K19QRpb01fi3F1ip9MwQ=
=1izF
-----END PGP SIGNATURE-----

--Sig_/XR_bpdG+7Xi0.jilAwYy4hu--

