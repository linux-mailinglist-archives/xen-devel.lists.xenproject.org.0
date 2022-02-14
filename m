Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA14B54D6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272448.467294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdME-0000Uo-3O; Mon, 14 Feb 2022 15:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272448.467294; Mon, 14 Feb 2022 15:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdMD-0000Rt-WD; Mon, 14 Feb 2022 15:33:42 +0000
Received: by outflank-mailman (input) for mailman id 272448;
 Mon, 14 Feb 2022 15:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gn9w=S5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nJdMB-0000Rn-Hi
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:33:39 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79e0256c-8dab-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 16:33:37 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3CAEB5C0246;
 Mon, 14 Feb 2022 10:33:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 14 Feb 2022 10:33:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 10:33:34 -0500 (EST)
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
X-Inumbo-ID: 79e0256c-8dab-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=00sLYhy43u8dz4gqS
	AWPW2aSUeo4T6PTO9jyxileyR0=; b=gb1ZmJiaNxYX0944bJb8svuvXxfY9BQyP
	dFjM1sdJ2rbYdL3XlsdxXseXkcNsv7xnHX2zxAj9cwbcQaJi+drjlS1Bqo815R1V
	hcullekRjRX165X+IM3FyQrGJyzqRqABPH+Dog8+a/rvTOlOAFJ0Qbg5jzy+a89I
	PzputjVfcdEV0sF5wMeiW6flxKabD3RmkvYRJ8LEYR+AuAe6N3u2dQkZ1gylIPIm
	oVv2pe3ATlvu8XJFp1kzidaMV6c4jVa077aY3Ro1Le9plamrhSf8zMlohVPU4srQ
	E2grvB88H1J0TP5L3tMqGS5OtCvsahB1kKqG+G/SNUNToGRfOWQqA==
X-ME-Sender: <xms:T3YKYnzkjdrjCrcuRrEsfCWbwERlMRpPzJWvdLf2Veepv_w4SiEYuw>
    <xme:T3YKYvTM9_ujfvDkeT6uama7kmWmcfK4SqG-isJo7Fy7CT-_LQLhCpWHFqo4AI8lj
    S3bQIDvE6iUzw>
X-ME-Received: <xmr:T3YKYhXU9WoZ40K0bOiduG2JULfVACtJucTExDU7EdYY5PibxZxru7CtDchanzB5nl1eBjv39pkq37yf0pjJD1UIbqc80UAmhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepfdhmrghrmhgr
    rhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmfdcuoehmrghrmhgrrh
    gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgv
    rhhnpeehveetfefhfedvtdeuuedvtddtvdeijeeuueejffduvefgvdekledtleduveffve
    enucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:UHYKYhiXdWXiI1i8X5qZLUxNJcAkB1kuYO578uY2OXoKDq2NVq9xcw>
    <xmx:UHYKYpCpNC97lcFFYwwmnO7IUeR4x2RuQtM7Rv1q7i7q6wZjWB7jPA>
    <xmx:UHYKYqIuahvsFO1d-MBElvmePwZHKXbZp-h67HZphKzHYXXDCBe-ig>
    <xmx:UHYKYoMGubzvHxGXuaPZTr-yfTnrwAGTTlt5RXsQXnNegzQewzkglg>
Date: Mon, 14 Feb 2022 16:33:31 +0100
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: SecureBoot and PCI passthrough with kernel lockdown in place (on
 Xen)
Message-ID: <Ygp2SxuxDTznDqyt@mail-itl>
References: <8daad0f6c623a57bc0b047fc2388e8b698135624.camel@suse.com>
 <55436ceb-3c6b-beff-5cac-eb83cb1bc44d@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EoIB2nOmOXhg9dJ9"
Content-Disposition: inline
In-Reply-To: <55436ceb-3c6b-beff-5cac-eb83cb1bc44d@citrix.com>


--EoIB2nOmOXhg9dJ9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Feb 2022 16:33:31 +0100
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: SecureBoot and PCI passthrough with kernel lockdown in place (on
 Xen)

On Mon, Feb 14, 2022 at 03:25:31PM +0000, Andrew Cooper wrote:
> On 14/02/2022 15:02, Dario Faggioli wrote:
> > Hello,
> >
> > We have run into an issue when trying to use PCI passthrough for a Xen
> > VM running on an host where dom0 kernel is 5.14.21 (but we think it
> > could be any kernel > 5.4) and SecureBoot is enabled.
>=20
> Back up a bit...
>=20
> Xen doesn't support SecureBoot and there's a massive pile of work to
> make it function, let alone work in a way that MSFT aren't liable to
> revoke your cert on 0 notice.
>=20
> >
> > The error we get, when (for instance) trying to attach a device to an
> > (HVM) VM, on such system is:
> >
> > # xl pci-attach 2-fv-sles15sp4beta2 0000:58:03.0=20
> > libxl: error: libxl_qmp.c:1838:qmp_ev_parse_error_messages: Domain 12:F=
ailed to initialize 12/15, type =3D 0x1, rc: -1
> > libxl: error: libxl_pci.c:1777:device_pci_add_done: Domain 12:libxl__de=
vice_pci_add failed for PCI device 0:58:3.0 (rc -28)
> > libxl: error: libxl_device.c:1420:device_addrm_aocomplete: unable to ad=
d device
> >
> > QEMU, is telling us the following:
> >
> > [00:04.0] xen_pt_msix_init: Error: Can't open /dev/mem: Operation not p=
ermitted
> > [00:04.0] xen_pt_msix_size_init: Error: Internal error: Invalid xen_pt_=
msix_init.
> >
> > And the kernel reports this:
> >
> > Jan 27 16:20:53 narvi-sr860v2-bps-sles15sp4b2 kernel: Lockdown: qemu-sy=
stem-i38: /dev/mem,kmem,port is restricted; see man kernel_lockdown.7
> >
> > So, it's related to lockdown. Which AFAIUI it's consistent with the
> > fact that the problem only shows up when SecureBoot is enabled, as
> > that's implies lockdown. It's also consistent with the fact that we
> > don't seem to have any problems doing the same with a 5.3.x dom0
> > kernel... As there's no lockdown there!
> >
> > Some digging revealed that QEMU tries to open /dev/mem in
> > xen_pt_msix_init():
> >
> >     fd =3D open("/dev/mem", O_RDWR);
> >     ...
> >     msix->phys_iomem_base =3D
> >             mmap(NULL,
> >                  total_entries * PCI_MSIX_ENTRY_SIZE + msix->table_offs=
et_adjust,
> >                  PROT_READ,
> >                  MAP_SHARED | MAP_LOCKED,
> >                  fd,
> >                  msix->table_base + table_off - msix->table_offset_adju=
st);
> >     close(fd);
>=20
> Yes.=C2=A0 Use of /dev/mem is not permitted in lockdown mode.=C2=A0 This =
wants
> reworking into something which is lockdown compatible.

FWIW, Qubes has PCI passthrough working with qemu in stubdomain, which
works without access to /dev/mem in dom0. We do this, by disabling
MSI-X, including the above piece of code...

https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/blob/master/qemu/pat=
ches/0005-Disable-MSI-X-caps.patch

> The real elephant in the room is that privcmd is not remotely safe to
> use in a SecureBoot environment, because it lets any root userspace
> trivially escalate privilege into the dom0 kernel, bypassing the
> specific protection that SecureBoot is trying to achieve.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--EoIB2nOmOXhg9dJ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIKdkwACgkQ24/THMrX
1yzstwf9H9i1rJxKtby/dgBVYKyTYh9FFqy1q2Q+1hr/wYSrp7eg7+n+9CEPfSBn
Kys4MVk8LlUkl7XRXmJdPlV9A0jLJfjmZn/7P0OGBvBNWrOiUdU51P9ju9zL0zu4
nEKnJj2QwcAI8DjKksY9KQyK+ZS2ep2mzvKPWv4Sn0RtBiZOcF+t7i8mLlGKKrlz
KLf7jLIOLwHuFIGmu2fRloVW67rrCKdYZh8ZpVUImxdBtP/WMAoQHnJC0yyT0vJ3
ddbRJxF6FF0wz4vAzBpEJQpPHjCig7zOfeMJPCQbT9SU20UA6aIlZzr6FSsINfHK
OxL4DTusKg6S8McvgBSGAku5aGPDkw==
=cqqn
-----END PGP SIGNATURE-----

--EoIB2nOmOXhg9dJ9--

