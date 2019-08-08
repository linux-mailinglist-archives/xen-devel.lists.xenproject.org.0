Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E63866B6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 18:11:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvkxf-0006E5-86; Thu, 08 Aug 2019 16:08:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o++3=WE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvkxd-0006E0-9J
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 16:08:17 +0000
X-Inumbo-ID: b9c7dd1e-b9f6-11e9-9226-efd58542822e
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9c7dd1e-b9f6-11e9-9226-efd58542822e;
 Thu, 08 Aug 2019 16:08:14 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id F40DB19F9;
 Thu,  8 Aug 2019 12:08:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 08 Aug 2019 12:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1GqiCz
 Y67G2OhFp6L3373R0fpZ6dcARUGGvYXd79yEo=; b=eFTnj7M+aENEbpPhFizxtz
 ttobLJ0G+Y1x5m2+/ELQfpW7rFPTVSCj3Y3lVLnCEw046ACJa7iyru9XdvYG/Wg7
 cwAN7mqFHejOxWYPv6+Qsx2bccmcyxLFNQIJuk7QjCt/TcK5uocC48s9DBvsIqC3
 NFBsd1qtvd0zdJxJsidwrOnx1B6zsLePUCnjTuIQEcmynKkf8ar4n8e9GaFhsfNY
 JhwQty715g470V4ZAhRs2+YvXxAwlpL03EwVAwDCLw/73RMTmwAE9mX+NGxOvJXn
 0aVCatHGUOMIiDRx1gcdkifEQNW+kx9qrazOswqYdmDoKu8vK7sXbvgEgSm1ZRew
 ==
X-ME-Sender: <xms:7UhMXaDieZw8kJwSsD_I0YlE1I3gD83u29bWtplFuCmXwPcL0445eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduhedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepkeefrdeljedrvdefrddv
 leenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:7UhMXWPZXWAHsVjVZX4L3iU851HJ84C9VOl2QiDWFlSsVEXlJZQkvw>
 <xmx:7UhMXRAyh5eWPlzQTpDjQo2gfZ2FfYYh6Lx5FVmztJ_WjTQajP3VKQ>
 <xmx:7UhMXYmmuVsjIAUfzlJ8sC4rv4SV8LE0HMOm4G4WqsVx_P-deMi1-A>
 <xmx:7UhMXbmp1xPskkCqeZORGdRPBob5OMWvaLb9OF_HM1C6M0SNg6k4mQ>
Received: from mail-itl (unknown [83.97.23.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id 982DA8005B;
 Thu,  8 Aug 2019 12:08:10 -0400 (EDT)
Date: Thu, 8 Aug 2019 18:08:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190808160806.GI3257@mail-itl>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
 <fc039376-dfc6-b281-c00d-3d1d263744c6@suse.com>
 <20190808092154.GG3257@mail-itl>
 <4d5cdd7d-c73f-88f6-0680-97a67506f095@suse.com>
MIME-Version: 1.0
In-Reply-To: <4d5cdd7d-c73f-88f6-0680-97a67506f095@suse.com>
Subject: Re: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi=
 early
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6017835308263125631=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6017835308263125631==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kH8JNVvasRCCW1Oz"
Content-Disposition: inline


--kH8JNVvasRCCW1Oz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:25:19PM +0000, Jan Beulich wrote:
> On 08.08.2019 11:21, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Thu, Aug 08, 2019 at 08:21:54AM +0000, Jan Beulich wrote:
> >> On 08.08.2019 02:31, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> When booting Xen via xen.efi, there is /mapbs option to workaround
> >>> certain platform issues (added in f36886bdf4 "EFI/early: add /mapbs to
> >>> map EfiBootServices{Code,Data}"). Add support for efi=3Dmapbs on Xen
> >>> cmdline for the same effect and parse it very early in the
> >>> multiboot2+EFI boot path.
> >>>
> >>> Normally cmdline is parsed after relocating MB2 structure, which happ=
ens
> >>> too late. To have efi=3D parsed early enough, save cmdline pointer in
> >>> head.S and pass it as yet another argument to efi_multiboot2(). This
> >>> way we avoid introducing yet another MB2 structure parser.
> >>
> >> I can where you're coming from here, but I'm not at all happy to
> >> see the amount of assembly code further grow.
> >=20
> > I need to add some anyway, because otherwise efi_multiboot2() don't have
> > pointer to MB2 structure. But yes, it would probably be less new asm
> > code. Just to be clear: do you prefer third MB2 parser instead of adding
> > this into the one in head.S?
>=20
> No, I don't. I'm not happy about either variant. Looking at the
> code I can't help thinking that it shouldn't be overly difficult
> to have mbi_reloc2() peek into the command line as it relocates
> it. head.S would simply need to pass in the address of opt_map_bs
> (or a suitable intermediate variable / structure) as it seems.

I was considering that too, but unfortunately mbi_reloc2() is too late.
It's after efi_multiboot2() which needs the parameter parsed already.

> >>> --- a/xen/arch/x86/efi/efi-boot.h
> >>> +++ b/xen/arch/x86/efi/efi-boot.h
> >>> @@ -315,8 +315,10 @@ static void __init efi_arch_handle_cmdline(CHAR1=
6 *image_name,
> >>>            name.s =3D "xen";
> >>>        place_string(&mbi.cmdline, name.s);
> >>>   =20
> >>> -    if ( mbi.cmdline )
> >>> +    if ( mbi.cmdline ) {
> >>>            mbi.flags |=3D MBI_CMDLINE;
> >>> +        efi_early_parse_cmdline(mbi.cmdline);
> >>> +    }
> >>
> >> Why? This is the xen.efi boot path, isn't it?
> >=20
> > Yes, as explained in commit message, this is to make it less confusing
> > what option can be used when. To say "efi=3Dmapbs does X" instead of
> > "efi=3Dmapbs does X, but only if Y, Z and K".
>=20
> Otoh it is going to be confusing why there are two ways of setting
> this with xen.efi.

TBH I think it's more confusing that /mapbs can be specified only on
xen.efi cmdline, but for example efi=3Dno-rs can be used on both xen.efi
cmdline and normal xen options. Once efi=3D is parsed early, I would
consider deprecating xen.efi specific options (you can use efi=3D there
already) and move other xen.efi specific options as efi=3D.

> >>> @@ -1412,16 +1417,32 @@ static int __init parse_efi_param(const char =
*s)
> >>>               else
> >>>                   rc =3D -EINVAL;
> >>>           }
> >>> +        else if ( (val =3D parse_boolean("mapbs", s, ss)) >=3D 0 )
> >>> +        {
> >>> +            map_bs =3D val;
> >>> +        }
> >>
> >> This may _not_ be accepted when called the "normal" way, since it
> >> would then fail to affect efi_arch_process_memory_map(), but it
> >> would affect efi_init_memory().
> >=20
> > What do you mean? Have I missed some EFI boot code path? Where it would
> > miss to affect efi_arch_process_memory_map() ?
>=20
> I'm implying the change to efi_arch_handle_cmdline() above to
> not be there. And I'm also considering the case where, due to
> some oversight (like is the case here as mentioned in other
> places), the two command line processing steps potentially
> produce different results (the example with the current code
> would be "efi=3Dno-rs efi=3Dmapbs").

Yes, buggy handling multiple efi=3D or other cases you mentioned is a bug
that needs to be fixed. But I don't think it should prevent _unifying_
EFI options handling. Now (without this patch) we have some EFI options
that can be utilized only in some EFI boot paths. This is IMO bigger
issue.

Anyway, your concern about map_bs being set only later can be solved by
parsing relevant efi=3D options early _only_ (in efi_early_parse_cmdline()
directly) and ignore them in parse_efi_param(). What do you think?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--kH8JNVvasRCCW1Oz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1MSOcACgkQ24/THMrX
1yzQUAf+IiDEw6Xb3qZGZQDydRyY1cNYwjAIYsV2reu4v/tkbbXaXz4PnqDNNfui
WmNgIp+JiYxwARCLfV9i9SaGs86d6OiqR+jmniCrdPbRnhJy2coxx1+syRaDiAOT
ciuC/rnLYUHIiAOwzhpLWAKxwMjOSCn/5LcyOGqebik/yhrL8+SkSwpYmIowervK
kMzUq/zT3aL2aPLyvIQVNYWH8vqyVyBHSh01LBUX2KatiOqWgh+fCcSz9Lq1/yr4
+Ppo0ewlPqlIHHXgCSYC7CfsYXjrLyY6u+EK4SU9pVa8a60NFrpBFTwhuiKcngPf
IFUFgQkjICcSVvDjUW84V3WmYCw22A==
=85nz
-----END PGP SIGNATURE-----

--kH8JNVvasRCCW1Oz--


--===============6017835308263125631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6017835308263125631==--

