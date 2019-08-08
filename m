Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E285E2D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:24:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvecX-0004Tf-6T; Thu, 08 Aug 2019 09:22:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o++3=WE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvecV-0004Ta-Fz
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:22:03 +0000
X-Inumbo-ID: fa7224ac-b9bd-11e9-9e85-c3691d5093e5
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa7224ac-b9bd-11e9-9e85-c3691d5093e5;
 Thu, 08 Aug 2019 09:22:01 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1DAA41407;
 Thu,  8 Aug 2019 05:22:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 08 Aug 2019 05:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PBE443
 MFLRAaA0uRjTkD6wPxYICsTLtj/ZmHVJq67fs=; b=Z7WfmLhBRFAvOi6iBOJ0B/
 ldGsp8u5zw2D0UFLDLttpNbH0FzlyXkzN/vpWxX0lGVIV27Puo43ywgTcmfQ37Ax
 bO4taxr5ozTLQ78SF6/N32kCXFQ+Mq3n0am6ZJV5UrOyrtVoSv95aUv3eXP5INRj
 SR/dT1E70/J4Lx2koeHIU3JY14cIcQSv5ATexUXnq8dTInFb5ELqrQ5MzcG+Uq7C
 OKS3BmwQNiMK2TRS5fUct1llNb7BeH1QQzKL0lXsf++QN7Pu6uncwY8HNkekkBOz
 T7eQiANTd7IonLn31YngawccgI7dhQgWtFTImtymawNe9PmgKTfqiG/PGPseCzaA
 ==
X-ME-Sender: <xms:t-lLXSz-Q8JmheQ2RGoRiKkybK4vvo9Cy97u2XfEyMQ3_oxDzl20Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduhedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:t-lLXVu4sPdHVx4WylcrJ11U9Z4f2sieTL5NoAdRGTV4Xzb9fAErFA>
 <xmx:t-lLXRtJQk6eb-_HAOiFSHf1mDUvr7kT5LOd0QAfSujdwBasK1TkvQ>
 <xmx:t-lLXSPmlZchfiI2PKOYqI6Z766b3c38e4ZW8G0wniyTxUrs2Fhw0g>
 <xmx:uelLXZePlDDy5g_QKY6TF2RpEZ2LFT9EQT5VbeIghxE0obMC8-SmyQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40261380089;
 Thu,  8 Aug 2019 05:21:58 -0400 (EDT)
Date: Thu, 8 Aug 2019 11:21:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190808092154.GG3257@mail-itl>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
 <fc039376-dfc6-b281-c00d-3d1d263744c6@suse.com>
MIME-Version: 1.0
In-Reply-To: <fc039376-dfc6-b281-c00d-3d1d263744c6@suse.com>
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
Content-Type: multipart/mixed; boundary="===============8747454905077925031=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8747454905077925031==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline


--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 08:21:54AM +0000, Jan Beulich wrote:
> On 08.08.2019 02:31, Marek Marczykowski-G=C3=B3recki  wrote:
> > When booting Xen via xen.efi, there is /mapbs option to workaround
> > certain platform issues (added in f36886bdf4 "EFI/early: add /mapbs to
> > map EfiBootServices{Code,Data}"). Add support for efi=3Dmapbs on Xen
> > cmdline for the same effect and parse it very early in the
> > multiboot2+EFI boot path.
> >=20
> > Normally cmdline is parsed after relocating MB2 structure, which happens
> > too late. To have efi=3D parsed early enough, save cmdline pointer in
> > head.S and pass it as yet another argument to efi_multiboot2(). This
> > way we avoid introducing yet another MB2 structure parser.
>=20
> I can where you're coming from here, but I'm not at all happy to
> see the amount of assembly code further grow.

I need to add some anyway, because otherwise efi_multiboot2() don't have
pointer to MB2 structure. But yes, it would probably be less new asm
code. Just to be clear: do you prefer third MB2 parser instead of adding
this into the one in head.S?

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -886,7 +886,7 @@ disable it (edid=3Dno). This option should not norm=
ally be required
> >   except for debugging purposes.
> >  =20
> >   ### efi
> > -    =3D List of [ rs=3D<bool>, attr=3Dno|uc ]
> > +    =3D List of [ rs=3D<bool>, attr=3Dno|uc, mapbs=3D<bool> ]
> >  =20
> >   Controls for interacting with the system Extended Firmware Interface.
> >  =20
> > @@ -899,6 +899,10 @@ Controls for interacting with the system Extended =
Firmware Interface.
> >       leave the memory regions unmapped, while `attr=3Duc` will map the=
m as fully
> >       uncacheable.
> >  =20
> > +*   The `mapbs=3D` boolean controls whether EfiBootServices{Code,Data}=
 should
> > +    remain mapped after Exit() BootServices call. By default those mem=
ory regions
> > +    will not be mapped after Exit() BootServices call.
>=20
> There are restrictions necessary (see below) which should be
> mentioned here imo.
>=20
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -315,8 +315,10 @@ static void __init efi_arch_handle_cmdline(CHAR16 =
*image_name,
> >           name.s =3D "xen";
> >       place_string(&mbi.cmdline, name.s);
> >  =20
> > -    if ( mbi.cmdline )
> > +    if ( mbi.cmdline ) {
> >           mbi.flags |=3D MBI_CMDLINE;
> > +        efi_early_parse_cmdline(mbi.cmdline);
> > +    }
>=20
> Why? This is the xen.efi boot path, isn't it?=20

Yes, as explained in commit message, this is to make it less confusing
what option can be used when. To say "efi=3Dmapbs does X" instead of
"efi=3Dmapbs does X, but only if Y, Z and K".

> (Also, if this
> change was to stay, the opening brace would need to go on its
> own line.)
>=20
> > @@ -685,6 +688,9 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, =
EFI_SYSTEM_TABLE *SystemTable
> >  =20
> >       efi_init(ImageHandle, SystemTable);
> >  =20
> > +    if (cmdline)
> > +        efi_early_parse_cmdline(cmdline);
>=20
> Style again (missing blanks in if()).
>=20
> > @@ -1412,16 +1417,32 @@ static int __init parse_efi_param(const char *s)
> >              else
> >                  rc =3D -EINVAL;
> >          }
> > +        else if ( (val =3D parse_boolean("mapbs", s, ss)) >=3D 0 )
> > +        {
> > +            map_bs =3D val;
> > +        }
>=20
> This may _not_ be accepted when called the "normal" way, since it
> would then fail to affect efi_arch_process_memory_map(), but it
> would affect efi_init_memory().

What do you mean? Have I missed some EFI boot code path? Where it would
miss to affect efi_arch_process_memory_map() ?

> I therefore think you don't want
> to call this function from efi_early_parse_cmdline(), and instead
> simply ignore the option here.
>=20
> Also (again if for some reason the change was to stay as is) -
> stray braces.
>=20
> >          else
> >              rc =3D -EINVAL;
> > =20
> >          s =3D ss + 1;
> > -    } while ( *ss );
> > +        /*
> > +         * End parsing on both '\0' and ' ',
> > +         * to make efi_early_parse_cmdline simpler.
> > +         */
> > +    } while ( *ss && *ss !=3D ' ');
> >  =20
> >      return rc;
> >  }
> >  custom_param("efi", parse_efi_param);
> >  =20
> > +/* Extract efi=3D param early in the boot */
> > +static void __init efi_early_parse_cmdline(const char *cmdline)
> > +{
> > +    const char *efi_opt =3D strstr(cmdline, "efi=3D");
> > +    if ( efi_opt )
>=20
> Blank line missing above here.
>=20
> > +        parse_efi_param(efi_opt + 4);
> > +}
>=20
> What about multiple "efi=3D" on the command line? And what about
> a (currently bogus) "abcefi=3D" on the command line, or yet some
> other pattern wrongly matching the string you search for?

Good points, I'll extend this function. Unless you can suggest some
existing function that could be used this early instead?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1L6bMACgkQ24/THMrX
1yyqYgf+KdHi4J6mAqe033RBEWUP37FwcyAWbmP0LhNPD5XbyP4cjZlrR66AfCkW
7YbwRpAqJUasObNdFSQCU44T7PO3lgo5yTtuzNFGTxeT6MeP2KHkIAcsu3ZmmkRt
rfzy9rGXZEgJJ0CRNjMg7LntTZv2uil6VFFZ1ETtvJII6VcbFo1scNgvN5Yz1LIk
dIxzTAESRSZRB92pc6rJP0HUdqtKNJQN1WkYufykyiXuAOQvinBUUYB0XUEZqLPY
O2d2++gqB5WJxMQHQBC+7LIGT0qK0hDxUEW8dI/csex46qc743QhI50Kz1zT89Ru
klPSsnTkkAVlD5n06ZMD03kEdnx1sA==
=mOC6
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--


--===============8747454905077925031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8747454905077925031==--

