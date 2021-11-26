Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF9045F482
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233421.405008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfvO-0004O8-Kj; Fri, 26 Nov 2021 18:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233421.405008; Fri, 26 Nov 2021 18:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfvO-0004L5-Gu; Fri, 26 Nov 2021 18:26:18 +0000
Received: by outflank-mailman (input) for mailman id 233421;
 Fri, 26 Nov 2021 18:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oJOc=QN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1mqfvN-0004Kz-HY
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:26:17 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5617ace9-4ee6-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 19:26:15 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0F6F43201CAE;
 Fri, 26 Nov 2021 13:26:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 26 Nov 2021 13:26:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Nov 2021 13:26:10 -0500 (EST)
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
X-Inumbo-ID: 5617ace9-4ee6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ztJTPm
	cq0+uFyUQaQJxfPkFH/osFX4ZEqTLP+TwzvyI=; b=gdi0n1oDiuHFh+IGeKUqgg
	5sDC9QnM9046tpDs+UyE48WWCieFHmTRttU6WasAPprDlrWE/Y/IZvFDChMc7i0b
	l6rR4f0rzOdMKKWwA02NoaNTSJE3fFO0+PswKNeFyy1Xfzc5sAlE3xZCcTA6gN0b
	UMhUD5c6v/muQjaCETid/ewfjKRc/24KCzHv+reJp+xkvtponRencJ6sSW8DIjEE
	Y5e5sGyORECYSvHFX00nos2NAfHL5ylD2Wi9PFvwf2qDLRwGWLunREPsmx/T9YnU
	VhvGudhISx6ZgKA7we17s0ifAVPrEVL7eNOZGC7CrCO5d+2pnQ8/dklJhPCDDeVg
	==
X-ME-Sender: <xms:wyahYQjkR0foBKjZ3tb_8GLbn0J3ch_tm2e6-FzN91abSk96u3pMeA>
    <xme:wyahYZBj0V_1kJ2PrJvK8HYWnuKWig_4Zd2RVU5mdGbbdkt8pgxCGiMcDgfJK8Q-p
    I-Zzi-S2ienOA>
X-ME-Received: <xmr:wyahYYEcu4tsb8NcOF-PwgajvG9by6T9t_wxX35Bbt28Hhl5hEigyegEq8fAT1QndSy647XuZF69vQg-y2Z2LkmSEHnayypQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:wyahYRR1FgRtcl2tSCBKkvPYelhE1z76ijQQ5o-jPmH1Bk2-I_EcHQ>
    <xmx:wyahYdyVc20H3Jw6LC13-mzyYzT4QKXgAaRnJKiTmdgup3PRzu74gw>
    <xmx:wyahYf4SkeL-220agRAaPUhM9ZOcDw2CGAp0MpcnzptLYGmI912IFQ>
    <xmx:wyahYY8Cke_C37JMucJj5c70SVPKiVvnJHHxjutqyYWMQiS-GQ5o4w>
Date: Fri, 26 Nov 2021 19:26:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 59.5/65] x86: Introduce helpers/checks for endbr64
 instructions
Message-ID: <YaEmv7C4JJtJYe7i@mail-itl>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163340.26714-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FwXODrAYaQ1x/RWb"
Content-Disposition: inline
In-Reply-To: <20211126163340.26714-1-andrew.cooper3@citrix.com>


--FwXODrAYaQ1x/RWb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Nov 2021 19:26:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 59.5/65] x86: Introduce helpers/checks for endbr64
 instructions

On Fri, Nov 26, 2021 at 04:33:40PM +0000, Andrew Cooper wrote:
> ... to prevent the optimiser creating unsafe code.  See the code comment =
for
> full details.
>=20
> Also add a build time check for endbr64 embedded in imm32 operands, which
> catches the obvious cases where the optimiser has done an unsafe thing.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/Makefile       |  4 ++++
>  xen/include/asm-x86/endbr.h | 55 +++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 xen/include/asm-x86/endbr.h
>=20
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 69b6cfaded25..64a5c0d20018 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -190,6 +190,10 @@ $(TARGET)-syms: prelink.o xen.lds
>  	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y=3D $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>  	    $(@D)/.$(@F).1.o -o $@
> +ifeq ($(CONFIG_XEN_IBT),y)
> +	$(OBJDUMP) -d $@ | grep 0xfa1e0ff3 >/dev/null && \
> +		{ echo "Found embedded endbr64 instructions" >&2; false; } || :
> +endif

Some more robust check can be done this way (warning, PoC quality bash):

    objcopy -j .text xen-syms xen-syms.text
    offset=3D$(objdump -h xen-syms -j .text | tail -2|head -1|awk '{printf =
"%x\n", (strtonum("0x" $4) - strtonum("0x" $6))}')
    objdump --adjust-vma=3D-0x$offset -d xen-syms.text|grep endbr | cut -f =
1 -d ':' | tr -d ' ' > valid-addrs
    grep -aob $'\xf3\x0f\x1e\xfa' xen-syms.text|cut -f 1 -d :|xargs printf =
'%x\n' > all-addrs
    join -v 2 <(sort valid-addrs) <(sort all-addrs) | awk '{ printf "%x\n",=
 0x'$offset' + strtonum("0x" $1)}' | addr2line -e xen-syms

Currently it finds just one match:
xen/arch/x86/alternative.c:145

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FwXODrAYaQ1x/RWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmGhJr4ACgkQ24/THMrX
1yxA5wgAjXqRUQdO0qVs33pPUFbGFEvWsreJBdrs68MHMQqs1V9bkGfGhDtIn88G
Pg5RdVvOhlurkJaplJMkOyNNCCtQfM+mHdvtceZ/jY+JTOD+8p+m+GiKWFPrZgo1
c0IHoUhwrokdKmWIQZQjDZfCNTwAdr75IkLjWvu/bMWAwyIvYry6FVY+tledGcwM
+4dadCaADeuAO7248pSpj+cG8VoWzo9RHr9bNZVHBaEnDWGhjA4g46pE0KMInn1k
xP1/U2dytIXAS5LNc7N0mQmNMEmQ4MmftFCUeR4k5udMEryEkc2KbCDPbJ3t8U/H
L/7Kk8l387NySB1AG+HswJH+aRQTDg==
=2gCS
-----END PGP SIGNATURE-----

--FwXODrAYaQ1x/RWb--

