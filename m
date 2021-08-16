Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEDA3ED1EE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 12:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167253.305265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFZoe-0004Xu-Tf; Mon, 16 Aug 2021 10:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167253.305265; Mon, 16 Aug 2021 10:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFZoe-0004Um-Qi; Mon, 16 Aug 2021 10:26:00 +0000
Received: by outflank-mailman (input) for mailman id 167253;
 Mon, 16 Aug 2021 10:25:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRT6=NH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFZoc-0004Ug-NO
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 10:25:58 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57b6e6e8-fe7c-11eb-a452-12813bfff9fa;
 Mon, 16 Aug 2021 10:25:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7E07F3200903;
 Mon, 16 Aug 2021 06:25:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 16 Aug 2021 06:25:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Aug 2021 06:25:52 -0400 (EDT)
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
X-Inumbo-ID: 57b6e6e8-fe7c-11eb-a452-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=09soMf
	DyDlFP7loLQAuRNw6NuoM+NouSETA1RvVGBKs=; b=GWkCB4ly2+UZlSZKXtvKjh
	uuF0xXoka0/MvEIHoMHHYYD8V3z2F1HuqY4O6fA55+pRjOj6giJRHCTvquIu17Bc
	6EbUBKlmaY1kCzT7m4tfZFMycnOdrMEGzV2p/Mf18CkgpwfU8F1rHGlZcBuVt75u
	jVDtE8AIIHcO/svnyX8uejb5KqXUUSJsXJ1R/yUWBjM9z0NmiVx8RfMo7wDu/Sm/
	UE2ZDhIJq7Lu0ywDBKiom6gjDVbpUbxN+FahKGU+LdFfat62Kwrbu2m0ahygYgwT
	OLBQ0a59CpIwrp+R+nKdTmhqyup7m1sMPTs3MY7Yucy4TKJDab1pL3AQGts9d1QQ
	==
X-ME-Sender: <xms:Mj0aYayNgpRor_ss4TC5ZrQ-yclb2hRwhsqhpm7Wimd16m89vqrEXQ>
    <xme:Mj0aYWT2ZJH-RDTKiu2Gkw4lR33lGvQVRJf5pK--q5rKp_WMeg2ZsT9__CyGQQu5M
    k58con3pFpLkw>
X-ME-Received: <xmr:Mj0aYcUY63CklJaMSPZ97z2x4QgH-TGkhzlwfyx_fQ0mQIramlN8ouE6EC9ADu9Ahl0AZIH6icyzoLivWXG2GTh1ssfrVq8S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledugddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteekleeh
    heeiudejkeelvddtleehgffgueekkeekfeehtdevudfgtdelueejieeunecuffhomhgrih
    hnpehmrgiglhhinhgvrghrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:Mj0aYQj22TxBRdjWK8xUET_hMaQia_ofLA6fecdzcaOBmw5x2jGUmw>
    <xmx:Mj0aYcC1fLcsr6PVlZcAp9dokMvINU_4L_4FbM8OCxBCEv3sU8hGdQ>
    <xmx:Mj0aYRJ_Srn5fWnHkmK7oL2SxPicKIvJh7gRrTRW6xsE_TnMwiWZKw>
    <xmx:Mz0aYb4I9kgNCX4r2roImJKIdgGRz8cUYTtYNDfGoJFbHNw3sydVGQ>
Date: Mon, 16 Aug 2021 12:25:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support
Message-ID: <YRo9LrkAhkDSF1iq@mail-itl>
References: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
 <20210813183139.391546-2-marmarek@invisiblethingslab.com>
 <0326eebe-2ec8-1c2d-bf2c-8cb4c16312af@suse.com>
 <YRokMeJ2bMLAZFD4@mail-itl>
 <7e88f6f7-afd6-d12c-8a14-a5c3853d0a90@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sv90lLm1Hp4VaMCV"
Content-Disposition: inline
In-Reply-To: <7e88f6f7-afd6-d12c-8a14-a5c3853d0a90@suse.com>


--sv90lLm1Hp4VaMCV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Aug 2021 12:25:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support

On Mon, Aug 16, 2021 at 11:18:31AM +0200, Jan Beulich wrote:
> On 16.08.2021 10:39, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Aug 16, 2021 at 09:55:16AM +0200, Jan Beulich wrote:
> >> On 13.08.2021 20:31, Marek Marczykowski-G=C3=B3recki wrote:
> >>> Besides standard UART setup, this device needs enabling
> >>> (vendor-specific) "Enhanced Control Bits" - otherwise disabling hardw=
are
> >>> control flow (MCR[2]) is ignored. Add appropriate quirk to the
> >>> ns16550_setup_preirq(), similar to the handle_dw_usr_busy_quirk(). The
> >>> new function act on Exar cards only (based on vendor ID).
> >>
> >> While on IRC you did say you have a datasheet or alike for the specific
> >> card you have in use, may I ask that you clarify why the logic is
> >> applicable to all (past, present, and future) Exar cards?
> >=20
> > The spec I looked is specifically about 2-port variant (XR17V352), but
> > there are also 4 and 8 port variants (XR17V354 and XR17V358) and the
> > Linux driver applies this change there as well. But indeed applying it
> > to all the future cards may not be the smartest thing to do.
> >=20
> > The Linux driver checks Exar specific register to identify the device,
> > instead of using PCI product ID, for some reason - I guess they use the
> > same chip in different devices?
> > Would you like thing like that (after checking vendor id), or turn it on
> > just for this product id I have?
>=20
> Hard to tell without knowing whether the extra reg - as per the spec -
> is connected to any of these. Is the spec you have publicly available?

Yes, here: https://www.maxlinear.com/document/index?id=3D1585&languageid=3D=
1033&type=3DDatasheet&partnumber=3DXR17V352&filename=3DXR17V352.pdf&part=3D=
XR17V352
(and few more links on https://www.maxlinear.com/product/interface/uarts/pc=
ie-uarts/xr17v352, but mostly the above PDF)

Hmm, maybe I should add the link to the commit message?

> If so, could you share a pointer? If not, are you permitted to share
> the spec?
>=20
> >>> @@ -169,6 +170,21 @@ static void handle_dw_usr_busy_quirk(struct ns16=
550 *uart)
> >>>      }
> >>>  }
> >>> =20
> >>> +static void enable_exar_enhanced_bits(struct ns16550 *uart)
> >>> +{
> >>> +#ifdef NS16550_PCI
> >>> +    if ( uart->bar &&
> >>> +         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2=
],
> >>> +                         uart->ps_bdf[2]), PCI_VENDOR_ID) =3D=3D PCI=
_VENDOR_ID_EXAR )
> >>> +    {
> >>> +        /* Exar cards ignores setting MCR[2] (hardware flow control)=
 unless
> >>> +         * "Enhanced control bits" is enabled.
> >>> +         */
> >>
> >> Style nit: /* belongs on its own line as per ./CODING_STYLE.
> >>
> >>> +        ns_write_reg(uart, UART_XR_EFR, UART_EFR_ECB);
> >>
> >> Wouldn't this better be a read-modify-write operation?
> >=20
> > Honestly, I'm simply mirroring Linux driver behavior here. But also,
> > all the bits in EFR are 0 after device reset, so it should work fine.
>=20
> Firmware or a boot loader may play with hardware before Xen takes control.
> I'm also not convinced there would have been a device reset in all cases
> where execution may make it here. (Note in particular that the function
> and its caller aren't __init.)
>=20
> A plain write might be okay if the spec for devices with the specific
> device ID documented all other bits as "must be zero" ("reserved" would
> not be sufficient imo), and if the function was invoked for only such
> devices.

Other bits are defined and are things IMO we want to keep disabled. See top
of the page 40 in the PDF.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--sv90lLm1Hp4VaMCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEaPS4ACgkQ24/THMrX
1yzLRwf9HIsHAsFTdIcjp+A8etH5TAZ1DDXAmM8ZM3oYDvNkCcWsxf/h04m+hjq7
A9lIMbz+N/ff5RtTs2ZSRMKe5KQ7VTF9Kh3wB13jlQEga0JRaa3RQDC8hVicMs4A
54U1NEVXHLAdxyMBlOIPYM0LYmGrLA7Sw/sPxNxJPS6npPjdzk+sesxK1gImCnkB
0v3oU61tSs3gUoFF0ekphtB5X1iT2u5bwDmXwZEE7piG5IrZAv/eiJQwvQ0hxVOL
m5kV4WjSHQpF730BB1uGG4ArslWLZo8qe/WFOMJD2+RX3wKUpgo6loVtrgxV2e4R
CE1BA8Ys+GacBXzkGtpJQiD8lrqTQA==
=Dzf2
-----END PGP SIGNATURE-----

--sv90lLm1Hp4VaMCV--

