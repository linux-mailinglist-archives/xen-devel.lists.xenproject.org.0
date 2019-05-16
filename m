Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6952058F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREoV-0003u4-Fv; Thu, 16 May 2019 11:44:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hREoT-0003tt-Iy
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:44:42 +0000
X-Inumbo-ID: fbe2dc48-77cf-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::6])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fbe2dc48-77cf-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558007077;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=jRWGqqkBLV1jI/BfiD4AdsPwgtMLNXvNbqAG+TdrjG8=;
 b=Ac1BvOuwRmo2nJvzt3cI3T9wDPRVxMrKBhzgdTcObXUHlty/P2bMEk66Bdciua5Nv/
 NO1BDXNIihhfDulpAqyFV1341YSB1j46X4rATRmNZrr3ymK4400MEqMreM08Z34fsyfx
 jAN3riLAvlWWp/yX0BoU7v4yVraxd8MvUQbK+H/1xKjOkALI3Nq7nSy09QLQo5jIrT6C
 q5KAYDZJoWi12MQxkhRXuTOn7it2HsC5p1uC//zGUn9KsZAnMhYG8hO4+NmaekZbvuyk
 8c9bJpLDZggpptG6g9QElYUr5pKXi/QatkhkoRpKS1O8wHbGScedenjsqyhQCmT8nP7S
 0LEw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4GBiYEhz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 16 May 2019 13:44:34 +0200 (CEST)
Date: Thu, 16 May 2019 13:44:32 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516134432.3029d52a.olaf@aepfle.de>
In-Reply-To: <20190516113902.GZ2798@zion.uk.xensource.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7076955369073338211=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7076955369073338211==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=4RX5jKKcfGsPVsnTZ_Z+J4"; protocol="application/pgp-signature"

--Sig_/=4RX5jKKcfGsPVsnTZ_Z+J4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 12:39:02 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> I guess all I can say at this point is that I haven't done a survey on
> the differences of the autotools shipped in all the distros we care
> about (especially the older ones), so I would err on the safe side to
> keep the in-tree configure script.

Given that all distros for sure did run 'autogen.sh' in a large number
of packages since years it is easy to guess that in general it just works.

And if Xen decides that a certain autoconf version is is the minimum,
configure.ac has a knob for that the minimal required tools version.
As I said, autoools are not runtime dependencies, nor is make|flex|bison.

So, please consider moving these generated files to .gitignore.

Olaf

--Sig_/=4RX5jKKcfGsPVsnTZ_Z+J4
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1NIAAKCRBdQqD6ppg2
fvScAJ0RFYJL8UPWxUkccmZRfaOWWAlQzgCgqDBterXGFwYVKKZafKQz9j+vT58=
=N9Tl
-----END PGP SIGNATURE-----

--Sig_/=4RX5jKKcfGsPVsnTZ_Z+J4--


--===============7076955369073338211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7076955369073338211==--

