Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8EF81DCD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hudHw-0006IK-QS; Mon, 05 Aug 2019 13:44:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vjjD=WB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hudHu-0006IF-Tt
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 13:44:35 +0000
X-Inumbo-ID: 26b04ad2-b787-11e9-af52-136e9812ff87
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26b04ad2-b787-11e9-af52-136e9812ff87;
 Mon, 05 Aug 2019 13:44:30 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id B6DDE119C;
 Mon,  5 Aug 2019 09:44:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 05 Aug 2019 09:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=otBe/O
 kVJbOLC2nEaKOhpNDgB9S311HwAPG66JjhXBU=; b=kYYrQvmfvx44AkVx/W37b8
 SxGejPCfeCWIjBHKJul8afgPoQIznUGB0qQmqg3HDOrTLES3p4r5lufZuoIa5cvW
 yrzwldyffvWGAmNN415Id/yz4RmZbZeqjhKoMjXLpo/fO5VvzOnxyWL/hTtPBLAu
 AOokF6IGbcnycXM0UB3veS7gj6B8rPCWRAnKlR4jOEkL4TJflYfsIZrQqllP2uK8
 /3ZI56H/k3ybLXiXwasmk3gFP6PrhkfHOyOiIFxJQs2UHpcgQ40FbVV+pNSOt5aX
 EWnYfJwfkFe/iAtmh/GDTUQxOw6Qb5qFI9dHGCv5OKp6TxzALi0oorYDDuxMQ5lA
 ==
X-ME-Sender: <xms:vTJIXXeSjrrrbXK11Q947pwPo6fbT2vNUuLrnHLvQfeJdFxf17xG0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtjedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:vTJIXXRR6VZoTq1yOG7Wzv6xdskb50ep3K4mh6rgIIn8hhfnGIq6UQ>
 <xmx:vTJIXVcyIF1AyOtreVfYdz0q0wzsfL-X6ZUIB8ZCmvg654y-TMkxhA>
 <xmx:vTJIXQt8Eej11VbXm4aAnajk7FghD6K-WMU9bSVaQ44Ti9_aY8DY3g>
 <xmx:vjJIXWUeqDIAEGEusJgRAfYIakUWqDO3vothxYj_HDUSJ2RInf1ZVg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 19A65380079;
 Mon,  5 Aug 2019 09:44:28 -0400 (EDT)
Date: Mon, 5 Aug 2019 15:44:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190805134424.GJ1549@mail-itl>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
MIME-Version: 1.0
In-Reply-To: <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0846324307992130180=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0846324307992130180==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/8E7gjuj425jZz9t"
Content-Disposition: inline


--/8E7gjuj425jZz9t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2019 at 09:43:26AM +0000, Jan Beulich wrote:
> On 19.07.2019 11:02, Roger Pau Monn=C3=A9  wrote:
> > On Fri, Jul 19, 2019 at 08:04:45AM +0000, Jan Beulich wrote:
> >> On 18.07.2019 18:52, Roger Pau Monn=C3=A9  wrote:
> >>> On Thu, Jul 18, 2019 at 03:17:27PM +0000, Jan Beulich wrote:
> >>>> On 18.07.2019 15:46, Roger Pau Monn=C3=A9  wrote:
> >>>>> In fact I don't think INTx should be enabled when MSI(-X) is disabl=
ed,
> >>>>> QEMU already traps writes to the command register, and it will mana=
ge
> >>>>> INTx enabling/disabling by itself. I think the only check required =
is
> >>>>> that MSI(-X) cannot be enabled if INTx is also enabled. In the same
> >>>>> way both MSI caspabilities cannot be enabled simultaneously. The
> >>>>> function should not explicitly disable any of the other capabilitie=
s,
> >>>>> and just return -EBUSY if the caller attempts for example to enable
> >>>>> MSI while INTx or MSI-X is enabled.
> >>>>
> >>>> You do realize that pci_intx() only ever gets called for Xen
> >>>> internally used interrupts, i.e. mainly the serial console one?
> >>>
> >>> You will have to bear with me because I'm not sure I understand why
> >>> it does matter. Do you mean to point out that dom0 is the one in full
> >>> control of INTx, and thus Xen shouldn't care of whether INTx and
> >>> MSI(-X) are enabled at the same time?
> >>>
> >>> I still think that at least a warning should be printed if a caller
> >>> tries to enable MSI(-X) while INTx is also enabled, but unless there's
> >>> a reason to have both MSI(-X) and INTx enabled at the same time (maybe
> >>> a quirk for some hardware issue?) it shouldn't be allowed on this new
> >>> interface.
> >>
> >> I don't mind improvements to the current situation (i.e. such a
> >> warning may indeed make sense); I merely stated how things currently
> >> are. INTx treatment was completely left aside when MSI support was
> >> introduced into Xen.
> >=20
> > In order to give Marek a more concise reply, would you agree to return
> > -EBUSY (or some error code) and print a warning message if the caller
> > attempts to enable MSI(-X) while INTx is also enabled?
>=20
> As to returning an error - I think so, yes. I'm less sure about logging
> a message.

I'm trying to get it working and it isn't clear to me what should I
check for "INTx is also enabled". I assumed PCI_COMMAND_INTX_DISABLE
bit, but it looks like guest has no control over this bit, even in
permissive mode.  This means enabling MSI(-X) always fails because guest
has no way to set PCI_COMMAND_INTX_DISABLE bit before.

Should I check something different? Or change back to disabling/enabling
INTx as part of msi_control call? Or maybe allow guest/qemu to control
PCI_COMMAND_INTX_DISABLE bit? In that case, I'd have very similar
problem as with MSI - xen-pciback doesn't allow that, so I'd either need
to patch pciback (and I could move this whole patch into Linux
instead), or get around with a hypercall.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--/8E7gjuj425jZz9t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1IMrgACgkQ24/THMrX
1yxSPgf/bIlzpSuwOEVns+3zP7Y8eqDf2hhRRmrebgin50kzFL8zaJMVopBe7IVa
uEq407MH9oOPjBr9L+WLtcwNjE+hpXnOo2kuD5+T6Por7ZCKKopv7GzMpGGRZ7yE
8JZZhdJgpQFmmgRbpgusqhLkZsOIn8xQm0S0Dc0Q2I8XnxjkMiJFeYt4IfSxZ/eO
9MxYuFsXWNk5sIzu/3hfoI08nrLKOui3ZcDCvArhUdfgma6TprpVIKxyumeqGsl8
6bDqX96H0U+2yuqBtR1POe4P2fey9Rpqb/CchVEEJBEsTY7Jk98t7k8pzVuKWXcu
zFtcTMS1IqRnwaAMtfCBsf6bi6yLpg==
=nYXU
-----END PGP SIGNATURE-----

--/8E7gjuj425jZz9t--


--===============0846324307992130180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0846324307992130180==--

