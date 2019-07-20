Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D66F0C9
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jul 2019 23:25:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hownT-0004Hi-6U; Sat, 20 Jul 2019 21:21:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cat0=VR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hownR-0004Hd-Bg
 for xen-devel@lists.xenproject.org; Sat, 20 Jul 2019 21:21:37 +0000
X-Inumbo-ID: 58bf41f4-ab34-11e9-826a-1bfebc0f9f09
Received: from new2-smtp.messagingengine.com (unknown [66.111.4.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58bf41f4-ab34-11e9-826a-1bfebc0f9f09;
 Sat, 20 Jul 2019 21:21:32 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 854E116F1;
 Sat, 20 Jul 2019 17:21:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sat, 20 Jul 2019 17:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xbJApb
 jsDCufpf5HDY6dnHWF/eoF0ND/vZTko6r1Y7o=; b=S52xko4soQ4U0V58JBYyvP
 0V+pAD10mpi2FMHcRBXLlXL8fML8hOarKEVNB9g69/3K8AnE16HO68B9OFpqu/R9
 3sIA8jiAFbqtPrDSxpmKjKlf6C1fDVZy1+FPUYJszIrStOLQcJEe5y0QHkkJ3dTI
 l7yp36A7849p0LHIuDbSNM7rLpj4iqLsKs6PRQTgAc4fPFonk+vzRrTkt1hR2jQr
 UO/jUpK/kUy8N1rqxMpodgWklBqpxZsNN6myxljKaEgV58ghnEA1st4oE2I+V5v2
 0kg4YR9VvLCWTMDzpDx5eQ0halsBtylu3YTXYCuMlXisilTy4SMCLvqR8WfbIvaw
 ==
X-ME-Sender: <xms:2oUzXU2CwlXRipi6mP83pOMpP5u2OA3BXrgMFjrfGGj-bPn1vGsv3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrieelgdduieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:2oUzXV-PC0VNLYVIu5YiufGUD9KZYg7qquvO9qlSK6plh3KhE7QX7w>
 <xmx:2oUzXVP4YfmV23B8j8eSMIIuCyH_yrWABW73BbIYF_O8V04FBV6glw>
 <xmx:2oUzXZd39p8gtcuGSPBjfkvuoyF5wbgs8ZYVzEU55MSTrXSAm2jO8A>
 <xmx:3IUzXXe7PQou0epzOr1UsXpYlZVIVYWZ17JdETC2xmXo94gm0ahQWQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 168058005B;
 Sat, 20 Jul 2019 17:21:27 -0400 (EDT)
Date: Sat, 20 Jul 2019 23:21:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190720212102.GC1250@mail-itl>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
 <49a30043-1dd1-0069-1e3b-c593542f425c@arm.com>
MIME-Version: 1.0
In-Reply-To: <49a30043-1dd1-0069-1e3b-c593542f425c@arm.com>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v5 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============4578994259537212913=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4578994259537212913==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/EQiL+SffV/fXkvV"
Content-Disposition: inline


--/EQiL+SffV/fXkvV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2019 at 05:48:56PM +0100, Julien Grall wrote:
> Hi,
>=20
> Sorry for jumping late in the discussion.
>=20
> On 7/17/19 2:00 AM, Marek Marczykowski-G=C3=B3recki wrote:
> > diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> > index 586b783..c7a6a83 100644
> > --- a/xen/include/xen/irq.h
> > +++ b/xen/include/xen/irq.h
> > @@ -91,6 +91,7 @@ typedef struct irq_desc {
> >       spinlock_t lock;
> >       struct arch_irq_desc arch;
> >       cpumask_var_t affinity;
> > +    domid_t creator_domid; /* weak reference to domain handling this I=
RQ */
>=20
> This x86 only. Can this be moved in arch_irq_desc to avoid increasing the
> structure on Arm?

How (if at all) PCI passthrough is supported on ARM? Is qemu involved?
If so, and if that qemu would be isolated in stubdomain, I think ARM
would need a similar feature. If it not the case right now, but it is
planned, do you think it's worth moving it to arch_irq_desc and possibly
move back later?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--/EQiL+SffV/fXkvV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl0zhbsACgkQ24/THMrX
1yx+Uwf/QYXHHc0qj2/T0b8yVh+j/bQEEwhzVAFC2K2BkrP9MApDhKlIFZ1mb+kE
X25AM0HbURtvHn/eYfj+X5tDOcyIBR77Ua8MSXK4PEK5vpJn0QRrB/vBRaiKNbv1
N1bGTSPvv4P5HlSBNo/dfzpOQa9aehd9qLXBbs08YXLTw6I7yjnG6dmlN8Ua/5r/
E0vBqDmjp8QTq1FKcuHBORNRbEgs5mKhxwGx+nuz7j+bvlYo7WbN392WHnod+E58
mSD7f23hjWWvmmZzN8EoSOjJXGjqrRb+4ID5zSIUMEKAKxS07TM0roXBtxnJvcRo
jI9np8oURaYK61WqHtdfWfztDtHglw==
=jw9s
-----END PGP SIGNATURE-----

--/EQiL+SffV/fXkvV--


--===============4578994259537212913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4578994259537212913==--

