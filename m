Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4965BCB23
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmb7-0005pc-G8; Tue, 24 Sep 2019 15:19:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IFUW=XT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iCmb4-0005pW-N6
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:19:23 +0000
X-Inumbo-ID: aeac061e-dede-11e9-bf31-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::5])
 by localhost (Halon) with ESMTPS
 id aeac061e-dede-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569338360;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=8wAUMnTDCsvNakD6JvPBL3z8SQHImW1K1vJC7eeBmqI=;
 b=oEIy+Ul28sjYOxcYfOrFJv+oxW2H+sdBIv1kD8zYcs23RNOaTNIQPvoFzgo7h/GiHl
 OW8WSZpfwCS3Pahc/sVpgAXBcBbVqjf+hO4re6Yc7+jO57ANo1nLTg+xPj6E8V5TJQAN
 mCT6Uirh2N8DYUjNxpiItzEvWOtE+Ce8K1p2BniBi04ym9O4O4SUTeGtcs6saVoypmoe
 vN0bv2Fp9p/cql29sb8d0b7JejklicSzwhcmhdKM5X03w8/7HDquR9XwvDC9YlyL0nNR
 U4iBKoWKAijRPFw3/d+cjlzoRljCAjAelAga/5zPjUkbAgw9oD6AEy4jyZKGXSMHp3Iu
 gq8g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC44eztn93Z9OGdNZlANh"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v8OFJH25m
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 24 Sep 2019 17:19:17 +0200 (CEST)
Date: Tue, 24 Sep 2019 17:19:10 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190924171910.5ff75b9a.olaf@aepfle.de>
In-Reply-To: <23946.9607.887344.235099@mariner.uk.xensource.com>
References: <20190924140319.11303-1-olaf@aepfle.de>
 <20190924140319.11303-3-olaf@aepfle.de>
 <23946.9142.652599.628334@mariner.uk.xensource.com>
 <23946.9607.887344.235099@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RESEND v1 2/8] tools: move scripts from etc
 to libexec
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============7332476196343207044=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7332476196343207044==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3gWFrjBOZMrsBZU83adUIVp"; protocol="application/pgp-signature"

--Sig_/3gWFrjBOZMrsBZU83adUIVp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 24 Sep 2019 15:17:43 +0100
schrieb Ian Jackson <ian.jackson@citrix.com>:

> I think the ability of the admin to edit these scripts is important and I=
 have used it myself in the past.=20

Since they are scripts, they can be edited in any location. To me it is not=
 clear what the case would be to diverge from the vendor provided variant.

IMO these are part of the Xen tools, there is nothing to configure in these=
 scripts. If for whatever reason the local admin must run his own variant, =
at least for disk=3D and vif=3D the location can be changed with 'script=3D=
'.

I'm sure they are in /etc because in the early days of Xen there was a hope=
 the local admin would do all the work to connect backends and frontends in=
 a way he likes. I think this is not true since more than a decade, the scr=
ipts are always tied to the tools version. The API is now mature since a wh=
ile, there are very few changes in the past years.


A configure knob could be added to set XEN_SCRIPT_DIR at build time, if the=
re is really a usecase for such knob.


Olaf

--Sig_/3gWFrjBOZMrsBZU83adUIVp
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl2KM+4ACgkQ86SN7mm1
DoB4SA/+OOAUzq1Ed9N7tJ4MfgPCTLqzeiEEWQcgY3RPDSKtNFY7+Co3lLYDF3+l
UE+rY5xnuN/te1Dnm4tBMBx5a+82NvvGHJNHtDSMNfx5jcQpLrV2YdvhLvFnp+iE
XFO6w04TJET5TRHnVBqR5zdr1pWw+G+xuH4hBRYvopsEGUz9ghLZIavsNzyObMFG
58vcDY7P/KMw9QNfmpraV5IB7QKcqpgeb87eaqzSwwuZ0LIvfsk3NI1m4HX3Jdbx
lCiREAiE8txeIhbx/1Mhs9bF/Y+fg5x/I2sM4Iu+T2K9Es82ugNmcgO6HjfR6HLc
KxYjmqAtqpGQNXkyA6NVGCLgEC51z9qIopRnvjb3ilMSqlGoSojty5BnprUJ05pz
Eg4d2Xhusv62f4a1Zgd0EeeALy67MDKj7bFyTYaUnc3EPsLGvX5ncbrnS4DEceEu
Fe7lXUSKMX4hiAMIijnQCqYVjzy5OaPhe6Dyz4kC2zohJmCH0rFv9bMpmWRnB65I
ESr4LuwilZ4DjWD3B5JW79OWtHACjEy3fx3Sl0ZiCyVwLTpXDAp//xyxr+6b4xny
ib7AWPrgmMgnv2QXQTkp2FumKL+yZ7x2k/OBZYzuY6NZQ5vR+xAHtJAnbdk0TYgp
Bd0vPc8HXLPbCXeydol6ZCv099NspDiIpjSENrNGxSqGE+b8tNY=
=uG/T
-----END PGP SIGNATURE-----

--Sig_/3gWFrjBOZMrsBZU83adUIVp--


--===============7332476196343207044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7332476196343207044==--

