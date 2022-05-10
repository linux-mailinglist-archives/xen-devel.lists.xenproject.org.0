Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F79052211F
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 18:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325879.548653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSdZ-0006Ic-PF; Tue, 10 May 2022 16:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325879.548653; Tue, 10 May 2022 16:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSdZ-0006Fd-JR; Tue, 10 May 2022 16:23:01 +0000
Received: by outflank-mailman (input) for mailman id 325879;
 Tue, 10 May 2022 16:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oBD8=VS=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1noSdY-0006FX-1O
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 16:23:00 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74432bad-d07d-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 18:22:58 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A84FA5C010B;
 Tue, 10 May 2022 12:22:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 10 May 2022 12:22:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 12:22:57 -0400 (EDT)
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
X-Inumbo-ID: 74432bad-d07d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652199777; x=
	1652286177; bh=1UppJaWRmY+TpH9pFD4Bb1MUuqhQ2NuSH1H9Qg1JflE=; b=y
	Ya8NVX/ZsHe2CeMLX9qVmRa/CqR8I8YlTDyWnO/O9DD9aONO3AHc1LQM0WTpn6+E
	9BYKbjZRuqdIDCuaGc8mTF9gjbwFzTt3CEn18ijMIyGceQzYGwNvnLsZsuJhNa07
	5yAQDwfJ7qQMMXBWSMK8KfHKUESIsGQt3weWzcD7P24Xdtxx7NiyTsF4QV0iJ3oO
	OIINy1+17/ldfino/HGI3/chx8T0wg+E4j/VooULXUvqdwGXCpRb8+xVXrAd02aN
	6O1i8kpwyBIZT1XRxCPghmhSEZB34HSkjWSpJWsd5WgkTsaRqtJI5UXR/MTP0A0r
	I/CgRQ7dBXxT699aDh6Ww==
X-ME-Sender: <xms:YZF6YliWCOFICoV7V-pluhCOIE_1BKhbe7JVGegrm9f0GgG9Q6H8-g>
    <xme:YZF6YqAv0bgJNTuMqy0KqxcZMF1uAOXItyCGPBo1EK_lKNx3-xDduFwZDXAsiSNhE
    YlXc-dH7FTyleU>
X-ME-Received: <xmr:YZF6YlFfu0B6_Z7DlYTp6j-cTK6RJKAAeHvbD-pEwl6Xg-K2zMAWN4xVHGbL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:YZF6YqTH-UiwVlRLQoSVgZGJtkjZ0Wy1diPLrNQl1usOuHCpUbJ8Og>
    <xmx:YZF6YiwdK_v2lmDCPIFHZ39JCmAV6_i_EbZ6ldlQGQiqBjqkemXQfg>
    <xmx:YZF6Yg6QBzvk-5ukaKhYfOnLzLXgU8E-UxTbkwTCKNEPrZS_vQ-j1g>
    <xmx:YZF6YnqjPF3paE8Ez4oDPJwg_43XzNDnVs16ECYNYNLJMH4hUbHwtA>
Date: Tue, 10 May 2022 12:22:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Mariusz Zaborski <oshogbo@freebsd.org>
Subject: Re: Proposal: use disk sequence numbers to avoid races in blkback
Message-ID: <YnqRX2s87cd6jiJf@itl-email>
References: <Yf8h36wj5QWSWEud@itl-email>
 <YgaNeZNSt26oCzbZ@itl-email>
 <YkOgDihJCrtWriDq@itl-email>
 <YnRtFBzfba0OYldx@itl-email>
 <YnpFLJwxBSqbshw/@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KflJpp5jPHHKA+Y8"
Content-Disposition: inline
In-Reply-To: <YnpFLJwxBSqbshw/@Air-de-Roger>


--KflJpp5jPHHKA+Y8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 May 2022 12:22:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Mariusz Zaborski <oshogbo@freebsd.org>
Subject: Re: Proposal: use disk sequence numbers to avoid races in blkback

On Tue, May 10, 2022 at 12:57:48PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, May 05, 2022 at 08:30:17PM -0400, Demi Marie Obenour wrote:
> > Proposal: Check disk sequence numbers in blkback
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Currently, adding block devices to a domain is racy.  libxl writes the
> > major and minor number of the device to XenStore, but it does not keep
> > the block device open until blkback has opened it.  This creates a race
> > condition, as it is possible for the device to be destroyed and another
> > device allocated with the same major and minor numbers.  Loop devices
> > are the most obvious example, since /dev/loop0 can be reused again and
> > again, but the same problem can also happen with device-mapper devices.
> > If the major and minor numbers are reused before blkback has attached to
> > the device, blkback will pass the wrong device to the domain, with
> > obvious security consequences.
> >=20
> > Other programs on Linux have the same problem, and a solution was
> > committed upstream in the form of disk sequence numbers.  A disk
> > sequence number, or diskseq, is a 64-bit unsigned monotonically
> > increasing counter.  The combination of a major and minor number and a
> > disk sequence number uniquely identifies a block device for the entire
> > uptime of the system.
>=20
> Seems fine to me, this is just an extra check to make sure the block
> device opened by blkback is the one that user space intended.  I would
> see diskseq as a kind of checksum.

Ideally, diskseq would be the primary means of identifying a device, but
that isn=E2=80=99t an option without more substantial changes, sadly.

> > I propose that blkback check for an unsigned 64-bit hexadecimal XenStore
> > entry named =E2=80=9Cdiskseq=E2=80=9D.  If the entry exists, blkback ch=
ecks that the
> > number stored there matches the disk sequence number of the device.  If
> > it does not exist, the check is skipped.  If reading the entry fails for
> > any other reason, the entry is malformed, or if the sequence number is
> > wrong, blkback refuses to export the device.
> >=20
> > The toolstack changes are more involved for two reasons:
> >=20
> > 1. To ensure that loop devices are not leaked if the toolstack crashes,
> >    they must be created with the delete-on-close flag set.  This
> >    requires that the toolstack hold the device open until blkback has
> >    acquired a handle to it.
>=20
> Does this work with loop devices?  I would expect that you need to
> issue a losetup call to detach the device.

That is what the autoclear flag is for.  It will cause the device to be
destroyed by the kernel as soon as the last handle to it has been
closed.  This is why the toolstack needs to hold a file descriptor to
the device.

> Even more, the loop device is created by the block script, but there's
> also a window between the block script execution and the toolstack
> knowing about the device, which could also allow for a leak?

For this to work, either the toolstack or block script will need to open
the file and perform loop(4) ioctls to assign the file descriptor to a
loop device.  This cannot be done by a shell script, so I plan on using
a C program to perform these tasks.  In Qubes OS, I expect this program
to replace the block script entirely, as performance is critical and
flexibility less so.  For upstream, I recommend having the block script
be a script that calls this C program.

> > 2. For block devices that are opened by path, the toolstack needs to
> >    ensure that the device it has opened is actually the device it
> >    intended to open.  This requires device-specific verification of the
> >    open file descriptor.  This is not needed for regular files, as the
> >    LOOP_CONFIGURE ioctl is called on an existing loop device and sets
> >    its backing file.
> >=20
> > The first is fairly easy in C.  It can be accomplished by means of a
> > XenStore watch on the =E2=80=9Cstatus=E2=80=9D entry.  Once that watch =
fires, blkback
> > has opened the device, so the toolstack can safely close its file
> > descriptor.
>=20
> Does the toolstack really need to close the device?  What harm does it
> do to keep the handle open until the domain is destroyed?

This would cause no harm, but it also would not help either, so I do not
see any advantages to doing it.

> What about disk hotplug?  Which entity will keep the device opened in
> that case?  Is xl block-attach going to block until the device
> switches to the connected state?

Whichever program opens the file will need to do this.  This could be
the program that is using libxl or the block script that libxl invokes.
I am not familiar with xl block-attach as Qubes OS uses a custom wrapper
around libvirt.

> > The second is significantly more difficult.  It requires the block
> > script to be aware of at least device-mapper devices and LVM2 logical
> > volumes.  The general technique is common to all block devices: obtain
> > the sequence number (via the BLKGETDISKSEQ() ioctl) and its major and
> > minor numbers (via fstat()).  Then open /sys/dev/block/MAJOR:MINOR to
> > get a directory file descriptor, and use openat(2) and read(2) to get
> > various sysfs attributes.  Finally, read the diskseq sysfs attribute and
> > check that it matches the sequence number from BLKGETDISKSEQ().
> > Alternatively, one can use device-specific methods, such as
> > device-mapper ioctls.
> >=20
> > Device-mapper devices can be detected via the =E2=80=98dm/name=E2=80=99=
 sysfs attribute,
> > which must match the name under =E2=80=98/dev/mapper/=E2=80=99.  If the=
 name is of the
> > form =E2=80=98/dev/X/Y=E2=80=99, and the =E2=80=98dm/uuid=E2=80=99 attr=
ibute starts with the literal
> > string =E2=80=9CLVM-=E2=80=9D, then the expected =E2=80=98dm/name=E2=80=
=99 attribute should be found by
> > doubling all =E2=80=98-=E2=80=99 characters in X and Y, and then joinin=
g X and Y with
> > another =E2=80=98-=E2=80=99.  This accounts for LVM2 logical volumes.  =
Alternatively,
> > one can use device-mapper ioctls to both check if a device is a
> > device-mapper device, and to obtain its name and UUID.  I plan on going
> > with the latter route.
>=20
> Likely a stupid remark, but needs obviously needs to be kept to Linux
> only.

Indeed so.  I have CC=E2=80=99d Mariusz Zaborski to check if FreeBSD needs =
any
similar changes.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--KflJpp5jPHHKA+Y8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJ6kV8ACgkQsoi1X/+c
IsE8IQ//fpGTDbYyMzWRW9vIKj8K6G5tMSNbiWfo9ZrADxDGh10O2fuRmMAn0NHq
7BKfJ8xqe545XlU0pglm2FHG9EwqEtyY+LXItY7OYJlxznJ82688vQ/p2wGHNNsy
UUh4IUUE4CRjJdqj86pGQKzdUO2vPCNmul6wak4oC2SHe3Y0oI9VIb3jbKHvBUgi
44oezeoQQDDDmjQrD+2uhDU1pPIHqO+iFynlYLYrd26AzyiysXxRwbmb6jDE8DU5
5llD0JCrPhlklgjPfnUvShGzzp1phWBl/Kzhh1MoMlTuRI65adwZS3JQ/1EZzKw8
URBYK+zPhR0MDdAeBIVUey8vRpCS+CUboH1Q6j2RrTCrIUj4o/OfiG7swqiBNutp
TZ/2qO8OBkmmiu4Z2w8GuvVULBukjytcjlG1gDjlV4FyPmemKofqOHrod1vWcLht
Woy9x6qqJJGqOLRIsSaGmrPcTwF3ab4hQ0cjmwPh6UesSNsDrns+4LD9JjD/vbGG
j3VZm+kQhjQQM27XZfRveUbunszTvBWaL4ZPqHwA5v4DHV5nwxxit+9hfpMBDlI0
JAAnyyKATYvFhrCCCHf2W4I2qGD/9C7+WEgekoQjqjDH2si00ggD8fKtwNV6mLYm
Q0wUfNdVtACwAywuilBT00NpBhAYU8vyOEv2Mbk38iGbz1Bsm9Q=
=edMS
-----END PGP SIGNATURE-----

--KflJpp5jPHHKA+Y8--

