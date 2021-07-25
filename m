Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E33D4DDF
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jul 2021 15:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160785.295269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7ebp-0007Bl-6S; Sun, 25 Jul 2021 13:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160785.295269; Sun, 25 Jul 2021 13:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7ebp-00079n-38; Sun, 25 Jul 2021 13:56:01 +0000
Received: by outflank-mailman (input) for mailman id 160785;
 Sun, 25 Jul 2021 13:55:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WkCe=MR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1m7ebn-00079h-LQ
 for xen-devel@lists.xenproject.org; Sun, 25 Jul 2021 13:55:59 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09761af4-ed50-11eb-95b7-12813bfff9fa;
 Sun, 25 Jul 2021 13:55:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id CA4AA32002B6;
 Sun, 25 Jul 2021 09:55:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 25 Jul 2021 09:55:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jul 2021 09:55:55 -0400 (EDT)
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
X-Inumbo-ID: 09761af4-ed50-11eb-95b7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=08rFA/
	d8vo4Nilc3ee66a2YWpeMAhVSiJ9vOIKznIw8=; b=bkZEYJ8GhdOQe+pSLjH8w3
	5M1/IaVYjzGR6lF90Nktvf+9UQxwkKLGh4wvxtANjxC0z/Zpp3aJSVmlwrZkhOvD
	I8xFYNsdLOlPLksK2fctxQim6yKSXdV8Cwa2WgmHN3w48GK4mx4LjDNwnPtz+bTJ
	YJo6TBsQEnFcuhONHyW++ZvhwXby5HEOuRu4/yDseAf0o+Af6737KCiFQezXDByR
	R1F06xQMoajCW3s3NcHw/BX9MSks+hoV5wjhAuM5R8nLrso2IcOS0vSup9PH6oX3
	V4Yh+N7Z29HAKksEMRQzdFitQ2dTPqgZoKa4OkZrdhRy4hmgMOyUtMzNE+4jJ4fg
	==
X-ME-Sender: <xms:bG39YAiXK7WSKWPZZACClLncV1JSUjaczLGuLcLVwB3B0u1C-j33Hg>
    <xme:bG39YJCalsCNkxLoZ1mLa0OyL10kcKsbn2uzBtfqy2jdna1Rx_dabi6GyF__pyHT-
    -gfhKDSmodnYg>
X-ME-Received: <xmr:bG39YIGHHaMZgRO9OnevAs-XjVOsQnILwQhcON0K5xWLu6A279D4eXOjGCrrpWDraX1ioUEKk_8n5spJZ3s6sSXxucPIgi-h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgedvgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeetveffiefghfekhffggeeffffhgeevieektedthfehveei
    heeiiedtudegfeetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:bG39YBQEIAk-KOOHV8MlZ64WC26-WO3MJUVqC5tUXAxVuSfHOP1b_g>
    <xmx:bG39YNx4__xmkdmxIG3JForrGNyXlIrHDsYABCpym-1heKaevg1Yyg>
    <xmx:bG39YP65EvNWEYJ5MiAgzjqWqQV-uKOY-xkPm3F8E2ttukfb4GczYg>
    <xmx:bG39YGuP_ZMCBLWJODA0x75cOnK_9YpkMmclY7QL8twpzkeeuUJk0g>
Date: Sun, 25 Jul 2021 15:55:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: luja <luja@openhardware.de>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen-Error: Disabling IOMMU on Stepping C2 5520 Host-Bridge
Message-ID: <YP1taH2Xl/jxjNRz@mail-itl>
References: <43-60fd5980-39-6ab37100@54709844>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lvRJv7tasDQjGW5e"
Content-Disposition: inline
In-Reply-To: <43-60fd5980-39-6ab37100@54709844>


--lvRJv7tasDQjGW5e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Jul 2021 15:55:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: luja <luja@openhardware.de>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen-Error: Disabling IOMMU on Stepping C2 5520 Host-Bridge

On Sun, Jul 25, 2021 at 02:31:17PM +0200, luja wrote:
> Hi Marek, Hi all,

Hi luja,

First of all, please use appropriate mailing list for such emails, not
email individual developers privately. I'm adding xen-devel here.

>=20
> On a HP Z600 I am trying to run qubes.
> The Xen log says that the Chipset is affected by Intel-Errate #47, #53
>=20
> the code in Xen is this:
>=20
> "
> /* 5500/5520/X58 Chipset Interrupt remapping errata, for stepping B-3.
> * Fixed in stepping C-2. */
> static void __init tylersburg_intremap_quirk(void)
> {
> uint32_t bus, device;
> uint8_t rev;
>=20
> for ( bus =3D 0; bus < 0x100; bus++ )
> {
> /* Match on System Management Registers on Device 20 Function 0 */
> device =3D pci_conf_read32(0, bus, 20, 0, PCI_VENDOR_ID);
> rev =3D pci_conf_read8(0, bus, 20, 0, PCI_REVISION_ID);
>=20
> if ( rev =3D=3D 0x13 && device =3D=3D 0x342e8086 )
> {
> printk(XENLOG_WARNING VTDPREFIX
> "Disabling IOMMU due to Intel 5500/5520/X58 Chipset errata #47, #53\n");
> iommu_enable =3D 0;
> break;
> }
> }
> }
>=20
> "
>=20
> But! rev 0x13 is not suficient to detect the "wrong" host bridge.

According to the spec by Intel (page 11 in the PDF you attached), it is.

> This Z600 is equipped with 0B54h mainboard as can be seen with dmi-decode.
>=20
> The manual states that 0B54h mainboard has the "newer C2 stepping",
> so it is *not* affected by Intel "spec update" (nota bene: Intel updates =
the
> spec, others report erratas) bugs =C2=A0

The code above checks for rev 0x13, and the spec (page 11) clearly says tha=
t rev
0x13 is stepping B-3. Stepping C-2 is rev 0x22. So, if this check
triggers for you, I'm afraid you have the affected chipset.

According to HP doc you attached, you can additionally confirm it via
BIOS:
    To determine if a specific HP Z600 system
    has the C2 revision of the chipset:
    1. Use the BIOS setup menu to access the =E2=80=9CBoot
    Block Date=E2=80=9D from the =E2=80=9CSystem Information Menu.=E2=80=9D
    All B3-based systems will have a =E2=80=9C1/30/09=E2=80=9D
    date and C2-based systems will have a
    =E2=80=9C01/07/10=E2=80=9D date.

> So the way Xen detects the "bug" (pci rev 13) is not sufficient, as my Z6=
00
> shows pci rev13 with lspci but 0xB54h (board rev only on Z600) with dmide=
code
> I would suggest first to have an override xen kernel boot option to disab=
le the disablement in this code section. Or just patch this part out of the=
 Xen code and rebuild xen. If this stuff really crashes, one will see it.

Patching it out is out of the question, this check if there for a
reason.

> So please build a new xen without this stupid disablement or please add a=
n override boot command for it.
>=20
> Please see the attached upgrade manual of Z600 and the errata "spec updat=
e" by Intel.
> You see that the C2 stepping is not affected by the bugs refered to in th=
e xen code,
> so removing that section or adding better detection of the mask revision =
(B3 vs. C2)=C2=A0 of 5520 host bridge would allow=C2=A0 many users to opera=
te Qubes4.

Maybe someone else has an alternative idea?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lvRJv7tasDQjGW5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmD9bWcACgkQ24/THMrX
1ywhZAf+NTvq4qc4cnnddsLuWr6zil7r0vbEfC3JBuwL3W9YIvhS+ZsTAZzW8pZy
IHPNVfoQszOc59WWIW/VBmgy5UHr3tHFS9a8Aftw67XKDuSpvWcvleGeyzQdYJlL
qKl5QCzE5CBlnYIRVtKZpOuQTr6tosouqNyrfVU+24AnLGAA8qIPAKtO6Ev54Rnd
YRYwV/SiLX8KZl0rOHOvgIXx5bBixJ1zrh0H5xJNZskOwNbhOFuzxdv9Mo2HZ/MT
3LubfOGPsqNYsh1xbaLPOwH/g2AQt86viWcKLPb9Mub8pxylTSM6urwJ+Kpi3pJU
iWbe2ERwVfX9y3G/2D317/y7pnaMuw==
=GNLl
-----END PGP SIGNATURE-----

--lvRJv7tasDQjGW5e--

