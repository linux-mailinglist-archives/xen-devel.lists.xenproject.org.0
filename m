Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E9523C55
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 20:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327158.549899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noqtk-0007Am-Pl; Wed, 11 May 2022 18:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327158.549899; Wed, 11 May 2022 18:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noqtk-00078q-Le; Wed, 11 May 2022 18:17:20 +0000
Received: by outflank-mailman (input) for mailman id 327158;
 Wed, 11 May 2022 18:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXX3=VT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1noqtj-00078k-Kh
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 18:17:19 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9622f67b-d156-11ec-a406-831a346695d4;
 Wed, 11 May 2022 20:17:17 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 56E5F5C015E;
 Wed, 11 May 2022 14:17:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 11 May 2022 14:17:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 14:17:14 -0400 (EDT)
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
X-Inumbo-ID: 9622f67b-d156-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652293035; x=
	1652379435; bh=TO+GqyFnTI/pf072RiK9r3IdYfVARkWkwasT5MlalV8=; b=b
	QXauU/Z3bqqP7RZ/6wMnNif/hgb9dR/OWKx/CX+eP2gCYjfRQdLUJiU19Cz1q47d
	OW2L2pMWrGePPAVJBtcs5369x6WiesFQtp7IH0cVAQPMppkXnLLP4kCPq/pVA0Rc
	DmrSzI2QlBegVsFcMcYJ1ecyeyUNMzsNDtvRE8onm7xaT7acKnC1X9tyc1cu9Ibe
	bSPUEuo8+OOaSF1gzIsZqxXJ1azbXfqtLsmI9nMITlanH7UcxRa/k7iaNhtjUUu1
	eNG+bfJwA7OD/wsuo/GYAnHmp5fhPTaESMqR95iB8EEjEUstjd03MnnsSajyTOXn
	duK5gz0u1UqIig8kp6WPw==
X-ME-Sender: <xms:q_17YviELq8tT6-jcqbadwGi0YIVIhMK6iNG4Uj2znmfLRPdpPqYHg>
    <xme:q_17YsCJ207IRf-C8LKvPy-xWbEJpUx14Rad04v-GBPKrBzVQwk3I4rrefXuqTBrR
    zbO9Lqay1wm2lc>
X-ME-Received: <xmr:q_17YvF-nEUpwLnw8vBQHnltrY6dY_3LtDJDXhdMsz785sLkKSjkIo08uGgE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:q_17YsT-vYZFmlBocf6dNOdxCycdt4Kn76_3Z6jVZn-7hljfcdM7vg>
    <xmx:q_17YsxVvSLjlIpPPWyjYsQEIeiveA4NGhkw0tjCKWmZNm4475QtPQ>
    <xmx:q_17Yi5sqWbQ4LGRmAd6gb_rNtvQDv2SNP90JA7M--vSLhwjiAIHFg>
    <xmx:q_17YpqeZAly9xDGl8PtptSPRQRiPMcnnN8sx5R_ILIzDfLgpPcM-w>
Date: Wed, 11 May 2022 14:17:07 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Mariusz Zaborski <oshogbo@freebsd.org>
Subject: Re: Proposal: use disk sequence numbers to avoid races in blkback
Message-ID: <Ynv9qEU7Sg6B9Uv/@itl-email>
References: <Yf8h36wj5QWSWEud@itl-email>
 <YgaNeZNSt26oCzbZ@itl-email>
 <YkOgDihJCrtWriDq@itl-email>
 <YnRtFBzfba0OYldx@itl-email>
 <YnpFLJwxBSqbshw/@Air-de-Roger>
 <YnqRX2s87cd6jiJf@itl-email>
 <Yntn0iyB7uAOkcxC@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="42BegwPzcK8eA5+l"
Content-Disposition: inline
In-Reply-To: <Yntn0iyB7uAOkcxC@Air-de-Roger>


--42BegwPzcK8eA5+l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 May 2022 14:17:07 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Mariusz Zaborski <oshogbo@freebsd.org>
Subject: Re: Proposal: use disk sequence numbers to avoid races in blkback

On Wed, May 11, 2022 at 09:37:54AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 10, 2022 at 12:22:51PM -0400, Demi Marie Obenour wrote:
> > On Tue, May 10, 2022 at 12:57:48PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, May 05, 2022 at 08:30:17PM -0400, Demi Marie Obenour wrote:
> > > > Proposal: Check disk sequence numbers in blkback
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > >=20
> > > > Currently, adding block devices to a domain is racy.  libxl writes =
the
> > > > major and minor number of the device to XenStore, but it does not k=
eep
> > > > the block device open until blkback has opened it.  This creates a =
race
> > > > condition, as it is possible for the device to be destroyed and ano=
ther
> > > > device allocated with the same major and minor numbers.  Loop devic=
es
> > > > are the most obvious example, since /dev/loop0 can be reused again =
and
> > > > again, but the same problem can also happen with device-mapper devi=
ces.
> > > > If the major and minor numbers are reused before blkback has attach=
ed to
> > > > the device, blkback will pass the wrong device to the domain, with
> > > > obvious security consequences.
> > > >=20
> > > > Other programs on Linux have the same problem, and a solution was
> > > > committed upstream in the form of disk sequence numbers.  A disk
> > > > sequence number, or diskseq, is a 64-bit unsigned monotonically
> > > > increasing counter.  The combination of a major and minor number an=
d a
> > > > disk sequence number uniquely identifies a block device for the ent=
ire
> > > > uptime of the system.
> > >=20
> > > Seems fine to me, this is just an extra check to make sure the block
> > > device opened by blkback is the one that user space intended.  I would
> > > see diskseq as a kind of checksum.
> >=20
> > Ideally, diskseq would be the primary means of identifying a device, but
> > that isn=E2=80=99t an option without more substantial changes, sadly.
> >=20
> > > > I propose that blkback check for an unsigned 64-bit hexadecimal Xen=
Store
> > > > entry named =E2=80=9Cdiskseq=E2=80=9D.  If the entry exists, blkbac=
k checks that the
> > > > number stored there matches the disk sequence number of the device.=
  If
> > > > it does not exist, the check is skipped.  If reading the entry fail=
s for
> > > > any other reason, the entry is malformed, or if the sequence number=
 is
> > > > wrong, blkback refuses to export the device.
> > > >=20
> > > > The toolstack changes are more involved for two reasons:
> > > >=20
> > > > 1. To ensure that loop devices are not leaked if the toolstack cras=
hes,
> > > >    they must be created with the delete-on-close flag set.  This
> > > >    requires that the toolstack hold the device open until blkback h=
as
> > > >    acquired a handle to it.
> > >=20
> > > Does this work with loop devices?  I would expect that you need to
> > > issue a losetup call to detach the device.
> >=20
> > That is what the autoclear flag is for.  It will cause the device to be
> > destroyed by the kernel as soon as the last handle to it has been
> > closed.  This is why the toolstack needs to hold a file descriptor to
> > the device.
>=20
> What would happen if the backend closes the device (because the
> connection is torn down) and then try to open it again (because the
> guest has triggered a reconnection)?

The reconnect attempt will fail for loop devices, and may fail for
device-mapper devices.  Unless somebody holds the device open until it
has been removed from the guest, reconnect is inherently racy.  That
somebody could be the toolstack, a daemon such as libvirtd, or the
kernel.

> > > Even more, the loop device is created by the block script, but there's
> > > also a window between the block script execution and the toolstack
> > > knowing about the device, which could also allow for a leak?
> >=20
> > For this to work, either the toolstack or block script will need to open
> > the file and perform loop(4) ioctls to assign the file descriptor to a
> > loop device.  This cannot be done by a shell script, so I plan on using
> > a C program to perform these tasks.  In Qubes OS, I expect this program
> > to replace the block script entirely, as performance is critical and
> > flexibility less so.  For upstream, I recommend having the block script
> > be a script that calls this C program.
>=20
> block scripts can be plain binary executables, so I think it would be
> fine for libxl to just call the executable directly.

Marek had suggested that keeping the block script a script would be
useful for admins, but I am fine with just using a binary.

> > > > 2. For block devices that are opened by path, the toolstack needs to
> > > >    ensure that the device it has opened is actually the device it
> > > >    intended to open.  This requires device-specific verification of=
 the
> > > >    open file descriptor.  This is not needed for regular files, as =
the
> > > >    LOOP_CONFIGURE ioctl is called on an existing loop device and se=
ts
> > > >    its backing file.
> > > >=20
> > > > The first is fairly easy in C.  It can be accomplished by means of a
> > > > XenStore watch on the =E2=80=9Cstatus=E2=80=9D entry.  Once that wa=
tch fires, blkback
> > > > has opened the device, so the toolstack can safely close its file
> > > > descriptor.
> > >=20
> > > Does the toolstack really need to close the device?  What harm does it
> > > do to keep the handle open until the domain is destroyed?
> >=20
> > This would cause no harm, but it also would not help either, so I do not
> > see any advantages to doing it.
>=20
> Well, seems more complex because you need more synchronization between
> blkback and the toolstack in order to detect when blkback has opened
> the device.  If this is not strictly required I would rather avoid it:
> more complexity just leads to more errors.

All of this synchronization can be handled by the block script.

> > > What about disk hotplug?  Which entity will keep the device opened in
> > > that case?  Is xl block-attach going to block until the device
> > > switches to the connected state?
> >=20
> > Whichever program opens the file will need to do this. =20
>=20
> This is not trivial to implement with xl, as `xl block-attach` is a
> short-lived command that just populates the xenstore entries for the
> to be attached device, runs the hotplug script and exits after that.
> I'm not sure we would want to change `xl block-attach` behavior to
> wait until the backend has opened the device.

Anything else is racy, unless there is some program that could keep the
FD open in the background.  Welcome to the ugly world of Linux block
device semantics.  The problem with not using autoclear is that there is
no race-free way I am aware of to clean up the loop device.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--42BegwPzcK8eA5+l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJ7/acACgkQsoi1X/+c
IsEzpxAArNm7atQOA4S2MeLCdQb3L33jkKrQ/H64q+n0tTzhSKCVI54h0Xvoc/ZM
YwofPukafUY2lca1JUPuz1wVMiO92Bv7/q3Eo001D6PhPaF3DRh4Yr8Bwz4aBe4i
pFA80TU0i8P/82Rac2DJxEzlc+uKAXqJsxHl8DRX5a93GROYQXi1SeJM7YNxS09V
HtuAIx4QUelMtnF70SSbFUNeZGYX2qL9bDHqJAauyAG+X9Mp3QB29soYhJGKH6PG
QToSs2Hf0XbXKhwpr4oodj8AGHetaR2JrJ25bTw7U4l10mjjPBV7legJuL04dY+1
x8lKQT2d685zXCLNOQn/UWVfHUUVc6o08ZbOt+hI879mppimdJa2er492GJMvmzW
7BcJk0dcwxG3Pg6zzcTyick5F1vw7941lHBZgaAhNo6may/puYU7Vzzic0FiYKtl
hg+k/Rpwd+hgFBkkBrotWpzqY1EGq3RzRdOkoBN+ZaS+X2Bh7kaA8Jw6o2cT8gv4
yB0vh/I7uWXsLz9x+lc7b93/jo9t2R/baztvt6r/M+kaL7oKxCPXOUws1Z091Da+
vSZyQmDtbirlPK8UxUqIz1T1gN7/aXm6YaKN7vb+EooxrEtg320Lkk1ItPglJEqk
DLRBCTdxQLRNfYOOIlPGY/GRi9GoZqQMI1h8i/KNNhwioahBaBA=
=uLOb
-----END PGP SIGNATURE-----

--42BegwPzcK8eA5+l--

