Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABE2EAA7B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:14:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61847.109004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlE7-0001Xy-Oi; Tue, 05 Jan 2021 12:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61847.109004; Tue, 05 Jan 2021 12:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlE7-0001Xc-LZ; Tue, 05 Jan 2021 12:14:15 +0000
Received: by outflank-mailman (input) for mailman id 61847;
 Tue, 05 Jan 2021 12:14:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YjHi=GI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kwlE6-0001XX-Tk
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:14:14 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e40627be-d0a4-446d-85ad-aa757948ada3;
 Tue, 05 Jan 2021 12:14:13 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id h0968ex05CE50gt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Jan 2021 13:14:05 +0100 (CET)
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
X-Inumbo-ID: e40627be-d0a4-446d-85ad-aa757948ada3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609848852;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:From:
	Subject:Sender;
	bh=FjTuLPxKIbT8iYTtqvBI41sxL/Ufdq8VUPoYGkhkJaw=;
	b=VO4zy5JtF8MiOGyaQpWGjZ80q3viEjgBbkVBtQUOiUsaJ7D72jNokJ2C1Sc6Z/zluH
	d2LrfMNlCaEVxNmx1Ufcv2Xljg2bhCUAN/hptg5aQUlfhBojBG/zmRNciHdvPC+YXDBi
	yjvgbjWuBG7U3148oatJUFyGUBw/df+6CE6Eb7b84gDCoX5TdbvbMo/Tf8UflUlqhQZ1
	Hi9jvK28mq1YRf0SZCySKwd3t1EtwTgoAERtINUNvMm7ofM3DpS+gxHSZ5/kASOEjHcO
	rSFirO1XyLeI/kO1dzWT3AvOos/g+ZzO5Iv1NAq9sQKTKJjdQsHT2p6ry5ESY9BuTd70
	5rfg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWOr7/A=="
X-RZG-CLASS-ID: mo00
Date: Tue, 5 Jan 2021 13:13:52 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Maximilian Engelhardt <maxi@daemonizer.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2] docs: set date to SOURCE_DATE_EPOCH if available
Message-ID: <20210105131352.31c9feda.olaf@aepfle.de>
In-Reply-To: <8b4564696cae00041848af8c5793172b80edadd5.1608742171.git.maxi@daemonizer.de>
References: <8b4564696cae00041848af8c5793172b80edadd5.1608742171.git.maxi@daemonizer.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VBrpYdPv3rC8rTcisupMW32"; protocol="application/pgp-signature"

--Sig_/VBrpYdPv3rC8rTcisupMW32
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 23 Dec 2020 17:56:53 +0100
schrieb Maximilian Engelhardt <maxi@daemonizer.de>:

> reproducible builds

Just wipe all built-in timestamps.
They serve no purpose.
Use git hashes to refer to specific build.

Olaf

--Sig_/VBrpYdPv3rC8rTcisupMW32
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/0WAEACgkQ86SN7mm1
DoCjyRAAjUvu363K6Rvs/6aqZX9I+YH+pUSB+yJH28W1csV0jlZPnBQmusvJj1oO
dXZRkpU9V0Xy+I52K4MlMFPdvg+WCU8VRIdOimk4bOKyY4IhATvD+CThD9AWg/kI
gKwa952Fng7cg2RCNKZBCoVYz8eXdJqBROQWHKF7BfEGbd3IRyGvt3kUQuleTbVc
V0Y0lMnxahJm21OI9jcvzy+rMqqJsnlBZbWpH/6KTLMRT2WhJB9PvJT73Oh8XN1c
TBN4Dk9Pc67DFwm1WMTZmJN7jnxPl256oKPLc4dzuObxvikYOFx/GUNHSLlgHsrc
KjsUVJqKwqgUb6RG31wA63NmEKF4Hx8JBjEz6ici+kKiRZ4TrQrvgnKeUqvMKsrU
zsI+uTBKyl7kCE4ct/dysS5qUemAGP17daFKmHhwVu4IDQpgko9KqAAjpj40M/Da
xywftEv8rQdBwuk4k65s1CA2ndtUPi+hCbzFSuPLoPstvl2f3kE1Pp8Hi5ZCAF9b
2TWN9bT7lPFQ7xmWEe9TbohmQwmsUkeAqVAvxS6wqXMKtp+WRFb6vKe85k9jCV+4
bAIwRHhjN3MnVBRbIpJAxhnv7WJQJKBVsEL9AXFOznf0RjKQYeP2V0CChl3pk9LM
OajGBtL0WCPbrwEzwciUDFaZIPlF8r+eSxrIfPJRqxDMz34+01w=
=RxKS
-----END PGP SIGNATURE-----

--Sig_/VBrpYdPv3rC8rTcisupMW32--

