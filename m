Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F6B15A634
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 11:22:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1p7C-0006VW-2l; Wed, 12 Feb 2020 10:19:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nblm=4A=invisiblethingslab.com=pawel@srs-us1.protection.inumbo.net>)
 id 1j1p4t-0006Rp-4w
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 10:17:07 +0000
X-Inumbo-ID: d229a7d4-4d80-11ea-ade5-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d229a7d4-4d80-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 10:17:06 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6921521AEF;
 Wed, 12 Feb 2020 05:17:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Feb 2020 05:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=x+WutSl6a40M0ORoETUpB6frGE+Fg
 hIGKssLMfBISe4=; b=thuMtgYMYd/yFbwrr2fVNXCXhWCVS42OnxLrI+imattOY
 nK1BLH91XJaTg356Z1avHx2ibAblnz+qfVP0cDzlm73gIKm3d/EXFRjSfi/HfdgO
 nzG+fAmLei54rTt/GCHXbRmqXkGDrXsH2ZtE1Keor5qwTpwtVYNi8GkDU6bOXKq3
 69nnZwVTQUIkDDVPKzbq25CBx5gaPt505ZGcHJ8EXLIxZvRlWL/e1nqeQ9ZlfvQt
 G/+lpycOoQhTOPFHs8mfGPr3/RMlUTEkIkyQS8sT19ecbXUK4OvWVQWOo/CJKHI9
 ADmKO+zHTqZUCNxmNtV50lIbXROdHOfTIjQ3MEJYA==
X-ME-Sender: <xms:otBDXpxIxHuhB7ZkIS-6nUK8PKhtI3oGHnofgTqN1H0MGtN8_drvtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieehgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffukffffgggtgesghdtrefotdefjeenucfhrhhomheprfgrfigvlhcuofgr
 rhgtiigvfihskhhiuceophgrfigvlhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhmqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeelgedrvdehgedr
 uddvkedrfedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepphgrfigvlhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:otBDXnxQJSMNMX2bKFV2V2v-ix4VeOZmGj89bekg7o6qZq5wud8yOg>
 <xmx:otBDXqLIfq3-fxTxKOyNFNjlB58K5NSDMp06ebuEZJDvZ43HSo0c2g>
 <xmx:otBDXrhE-wnFxGl8CQWvKJGn3r6jRb5OjZBOT7uzxFxvV9q3WuEvSQ>
 <xmx:otBDXmIB1wVNIhm2cMTvvn65vFildOB4rXBMmI-qdXrUt-72CY_5ug>
Received: from [10.137.0.16] (user-94-254-128-32.play-internet.pl
 [94.254.128.32])
 by mail.messagingengine.com (Postfix) with ESMTPA id B4ED630606E9;
 Wed, 12 Feb 2020 05:17:05 -0500 (EST)
From: Pawel Marczewski <pawel@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Message-ID: <fdc00be9-11c9-ffbf-af4f-fa22baed9d42@invisiblethingslab.com>
Date: Wed, 12 Feb 2020 11:16:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Feb 2020 10:19:28 +0000
Subject: [Xen-devel] Race condition in console_available callback? (libvirt
 + libxl + xenconsoled)
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
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: multipart/mixed; boundary="===============7816221808101250524=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7816221808101250524==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3ag3L0BHKCp0WT28UiS4xttya4HFgub5Q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3ag3L0BHKCp0WT28UiS4xttya4HFgub5Q
Content-Type: multipart/mixed; boundary="2zOcCWitrK5XgHEPgMT9LpHaW8ugqnHmQ";
 protected-headers="v1"
From: Pawel Marczewski <pawel@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <fdc00be9-11c9-ffbf-af4f-fa22baed9d42@invisiblethingslab.com>
Subject: Race condition in console_available callback? (libvirt + libxl +
 xenconsoled)

--2zOcCWitrK5XgHEPgMT9LpHaW8ugqnHmQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to debug an issue in QubesOS where a domain created by
libvirt often does not have information stored about the console TTY path=
=2E

The relevant part of libvirt creates a domain using
libxl_domain_create_new() and registers a callback (aop_console_how)
that is supposed to fire when the console is available. The callback
then calls libxl_console_get_tty(), but that fails with:

2020-01-06 11:52:30.952+0000: libxl: libxl.c:1853:libxl_console_get_tty:
unable to read console tty path `/local/domain/4/console/tty': Resource
temporarily unavailable

Based on my reading of the libxl code, it's supposed to set the path in
xenstore and then call the console_available callback, but only if the
bootloader is configured. Otherwise, we call console_available at a
later point (in domcreate_attach_devices()) and the path in xenstore is
being set by xenconsoled independently.

However, there is no guarantee that xenconsoled will do that before we
call console_available. And indeed, looking at the traces from
xenstored, the read and write of `.../console/tty` are ordered randomly
depending on the machine.

Should libxl wait for the information appearing in '.../console/tty' at
this point? Perhaps similar as the code I see in xenconsoled client
(xen/tools/console/client.c)?

I would be happy to work on a patch but I'm unfamiliar with the project
so I want to check my assumptions.

(I am testing with Xen 4.8.5 because that's what the stable version of
QubesOS uses, but as far as I can tell, that part has not changed since).=


Original QubesOS bug here:
https://github.com/QubesOS/qubes-issues/issues/5156


--=20
Pawe=C5=82 Marczewski
Invisible Things Lab


--2zOcCWitrK5XgHEPgMT9LpHaW8ugqnHmQ--

--3ag3L0BHKCp0WT28UiS4xttya4HFgub5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE/lXHjcDA2QUg95RNrRTL02Efx6sFAl5D0J4ACgkQrRTL02Ef
x6sg1A/7ByqQ0fU0z1vKZIURONGzCGkg+KRIwdDU04XbO6QqTVRdKVhioXwyx1KZ
AxuUlmR4Pe8/ud1QbVrAqlcyViXcwz/77RCF4aCZvByUbp3HwZD5lX1fCuWgBM0n
2DJthq3YlLFNXfVhddJGZDE8/aNSBYNAiBC/UC0nCMPFgMK7VWg6OQQH08kjo45J
96/gyzFsMuG9kzHgP9fYA+uhKqMz1lcgBFfMdZctfhT5UDEgmHnQWr5i4R98m1xB
yTijZSqiy2rIS1YKsTozr3KB1FgQpc35lUtX9ffVkqUVmF+G1NhKNo3NB6VMBP/p
AnA1C23+O0mtLsaU290Dsag6Imoadqol6o7o/Nm1vfezGUJGrH/SJA5FrAkfXev7
q+zpuFcPZqpEu8+15FsP+Y37EpOUgAEUQdygCVe+hkgF96OIR9Lc+qLdQ2C8ATWg
uB7E373wNlnCWkmpdbDDW16QZlo+756QsLBCjDo7pTthu7Ip4JLagtQgehnRNfBC
zh5uNfbi6tfcuHEoWlEdhkZ5BN95Z78z3x1/LU4DbsC0ACie/h0LB6bf+axnWL0L
ZSvh0CJ1nCb35zOKOfnrezVKbhDtO5z7XuzavKEQD+uiSoyQzfuTogX054YsaPIJ
kg+5ywsDSeBYil0Voq+jPA6hrxrxf+Z1dg39PFLp5JabI5zR3Eo=
=kjkR
-----END PGP SIGNATURE-----

--3ag3L0BHKCp0WT28UiS4xttya4HFgub5Q--


--===============7816221808101250524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7816221808101250524==--

