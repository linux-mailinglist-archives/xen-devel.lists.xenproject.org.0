Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4484C46EA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 14:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279114.476671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNb0X-0002nR-2y; Fri, 25 Feb 2022 13:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279114.476671; Fri, 25 Feb 2022 13:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNb0W-0002lU-Va; Fri, 25 Feb 2022 13:51:40 +0000
Received: by outflank-mailman (input) for mailman id 279114;
 Fri, 25 Feb 2022 13:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DRUi=TI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nNb0V-0002lF-KN
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 13:51:39 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2a4834-9642-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 14:51:37 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 713613202057;
 Fri, 25 Feb 2022 08:51:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 25 Feb 2022 08:51:33 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 08:51:30 -0500 (EST)
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
X-Inumbo-ID: 0b2a4834-9642-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RNgi6dy3JhQ0xZoCo
	wrrqyZIHuYhjGwar6kGMWcvlnQ=; b=DEeAjnbvs/QOeMWuGemMvCxRmXfbbR5ED
	ul0pYSUWM44ht/XfUn0x0fsyDyxx7JxKqOh65dZIB6rwjPwM2U5RwPt+yaO4Q5Nr
	Zu0TVkWCUownsZSPhM5UL6QZDQQzhvfj9XIaOWI2D1qNuZAtAfNLBs/4uNfUw10X
	2k8Il3qkd3RUW6cnQgIyCbuyq+GI1c7X+j8ZqUQDaL3IPGOwGgAr7TNuB/WvQjBX
	vnTNvVOIGcUfJRxar6XEW7lFHYCb9xsX4h1at4DX2XzcDl92SWyc6jD8SVSoWFQe
	JowD29AVKqJ2IHPB1W+L7KBHTVg+t397+5Uw2b2jMNSgSP99cz7DQ==
X-ME-Sender: <xms:494YYv_isixrR4lYA9ELKsHiTUIX-QieTu-85t1ueC3RbioGBmN4vQ>
    <xme:494YYrvcJW3DssEvVVcPNKUtFEH1k1eXV_7fFdckCk4MnIWSKuqFMgq6sf0LSXORc
    MXePUZtULQ40A>
X-ME-Received: <xmr:494YYtBVMxtuB9ZsxfdDLdlxcEGK2lrNFQYFkRQRKyXVfSRBnkJJBVAsFoR4FytGsgVnJtmbHH8i5lN7zJfbKLxnnrFh5x0KBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:494YYrfVl3Tzmx9wJq4jrkS3JKfehVBGc5SxJc0lNA0WRcEvFcIYyw>
    <xmx:494YYkMtoAHvcpLaxk1X9-HVSlBL-7pzQ5fnn0-q-SOe4-MFyh-_Bw>
    <xmx:494YYtkTiO7uiL8A8MnWHziUhJGJGOQVWQKA5SFQOwUND-_2ncX5hA>
    <xmx:5N4YYj0JVHDEPp5z3LlSt14BxP6CcpvOCpi-3n8V9DLK3B3v0No2lw>
Date: Fri, 25 Feb 2022 14:51:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Thiner Logoer <logoerthiner1@163.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
Message-ID: <Yhje4LFNt+RQJ5E0@mail-itl>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
 <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LvOjtPaHYJSux8fC"
Content-Disposition: inline
In-Reply-To: <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>


--LvOjtPaHYJSux8fC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Feb 2022 14:51:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Thiner Logoer <logoerthiner1@163.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received

On Fri, Feb 25, 2022 at 02:19:39PM +0100, Jan Beulich wrote:
> On 25.02.2022 13:28, Andrew Cooper wrote:
> > On 25/02/2022 08:44, Jan Beulich wrote:
> >> On 24.02.2022 20:48, Andrew Cooper wrote:
> >>> In VMX operation, the handling of INIT IPIs is changed.  EXIT_REASON_=
INIT has
> >>> nothing to do with the guest in question, simply signals that an INIT=
 was
> >>> received.
> >>>
> >>> Ignoring the INIT is probably the wrong thing to do, but is helpful f=
or
> >>> debugging.  Crashing the domain which happens to be in context is def=
initely
> >>> wrong.  Print an error message and continue.
> >>>
> >>> Discovered as collateral damage from when an AP triple faults on S3 r=
esume on
> >>> Intel TigerLake platforms.
> >> I'm afraid I don't follow the scenario, which was (only) outlined in
> >> patch 1: Why would the BSP receive INIT in this case?
> >=20
> > SHUTDOWN is a signal emitted by a core when it can't continue.=C2=A0 Tr=
iple
> > fault is one cause, but other sources include a double #MC, etc.
> >=20
> > Some external component, in the PCH I expect, needs to turn this into a
> > platform reset, because one malfunctioning core can't.=C2=A0 It is why a
> > triple fault on any logical processor brings the whole system down.
>=20
> I'm afraid this doesn't answer my question. Clearly the system didn't
> shut down. Hence I still don't see why the BSP would see INIT in the
> first place.
>=20
> >> And it also cannot be that the INIT was received by the vCPU while run=
ning on
> >> another CPU:
> >=20
> > It's nothing (really) to do with the vCPU.=C2=A0 INIT is a external sig=
nal to
> > the (real) APIC, just like NMI/etc.
> >=20
> > It is the next VMEntry on a CPU which received INIT that suffers a
> > VMEntry failure, and the VMEntry failure has nothing to do with the
> > contents of the VMCS.
> >=20
> > Importantly for Xen however, this isn't applicable for scheduling PV
> > vCPUs, which is why dom0 wasn't the one that crashed.=C2=A0 This actual=
ly
> > meant that dom0 was alive an usable, albeit it sharing all vCPUs on a
> > single CPU.
> >=20
> >=20
> > The change in INIT behaviour exists for TXT, where is it critical that
> > software can clear secrets from RAM before resetting.=C2=A0 I'm not wan=
ting
> > to get into any of that because it's far more complicated than I have
> > time to fix.
>=20
> I guess there's something hidden behind what you say here, like INIT
> only being latched, but this latched state then causing the VM entry
> failure. Which would mean that really the INIT was a signal for the
> system to shut down / shutting down. In which case arranging to
> continue by ignoring the event in VMX looks wrong. Simply crashing
> the guest would then be wrong as well, of course. We should shut
> down instead.

A shutdown could be an alternative here, with remark that it would make
debugging such issues significantly harder. Note the INIT is delivered
to BSP, but the actual reason (in this case) is on some AP. Shutdown
(crash) in this case would prevent (still functioning) BSP to show you
the message (unless you have serial console, which is rather rare in
laptops - which are significant target for Qubes OS).

> But I don't think I see the full picture here yet, unless your
> mentioning of TXT was actually implying that TXT was active at the
> point of the crash (which I don't think was said anywhere).

No, TXT wasn't (intentionally) active. I think Andrew mentioned it as
explanation why VMX behaves this way: to let the OS do something _if_ TXT
is active (the check for TXT is the OS responsibility here). But that's
my guess only...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--LvOjtPaHYJSux8fC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIY3uAACgkQ24/THMrX
1yzoxwf/VV/bSEByAwaA8ZfFTzSwEnX0ecC28fSsVvqK0yZZjs8iFOBRAkmZiRFx
1h4a1SEvc6KuaHx8UCgItD0t20ylVwjDy7NE1jKEVdDDed+QREZetnkLDzicYct4
XdTgIN70+G+n6Rs9rLNwTgwX4EVskjAjiW74iTSgh2Wo1+dd4Ow7zE41+HCJccgy
DSmuONtou4Kzm2pd0bSAyyeVdsau1lDWnYKyqfcXE67f1SINYwwORMaQo2xSx+m4
x4zSo2T2bvStHL0Mq5DJPyieQgKmm7p+UHXpn4ZEYacRRt0XaXc+z7MulifSYClb
yfADBRV7YMTuLi8DKj2RjYU++YDkug==
=l1l9
-----END PGP SIGNATURE-----

--LvOjtPaHYJSux8fC--

