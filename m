Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22654E4275
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 16:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293526.498634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWg0h-0001DK-9u; Tue, 22 Mar 2022 15:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293526.498634; Tue, 22 Mar 2022 15:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWg0h-0001AQ-6w; Tue, 22 Mar 2022 15:01:23 +0000
Received: by outflank-mailman (input) for mailman id 293526;
 Tue, 22 Mar 2022 15:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYg4=UB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nWg0g-0001AK-7a
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 15:01:22 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee301269-a9f0-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 16:01:20 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 175645C01AC;
 Tue, 22 Mar 2022 11:01:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 22 Mar 2022 11:01:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 11:01:12 -0400 (EDT)
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
X-Inumbo-ID: ee301269-a9f0-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GxtxbYlkQTbFTYtUr
	iPtKmGLveyF5aFZoWRUrcmK4M0=; b=izl52bQ34EikLTdZczh3GO0AA2b5AEPZW
	mH+m0qymVjppkvPWjZjrxcLfYkxZy1/Vt1+Q/LA3+G6FqEcHYdSIQTclSNYyEHw9
	pZDzMSVF+AunWw6s9k37IgFJJaAgQBNSh1jN4q+3D7JSnwXWIJDQb8R3o4CSKkdb
	Qv7ZEC0OEoSvr5FH43sUci7xgL+TLzwkf2hqJTuvn+BKRvooYUOoai/a36oVBszB
	zyS/3HTf/fi0ldwpSX54MVhWrQ9d5l599nFVIT20+16g8xbJV+OB6oRzYR552Soq
	F2Cp0mt8UGWJ7056hpU1MciVoeiRMduBB5EnLBTRAZtkzr4/gyfdA==
X-ME-Sender: <xms:uOQ5YjPZ6nVOXyb10yztOtQ-A3pmYAudZoCBistpDSRXH7X0Tc_JtA>
    <xme:uOQ5Yt9oHPEu7CkwD99vlsBOadONIGu68EKdqLqzrU-SGqiiNJj92Yg68HHu30BwP
    Y66TLSbBC9nOA>
X-ME-Received: <xmr:uOQ5YiRZRTbXhvNsbCsuZSGzgtP_m2WjDYApaMdTRsNk8hbUqmFJq38gCp6IPbGeesSm7PR4m8CSO7ySDYhpwHLWepgaKxsx9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeghedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ueQ5Ynu4sBMPGhuOKPzkZ4a-Ox9gL-MnUL5Xg_DK83gkt6QRwFzEvQ>
    <xmx:ueQ5YrfSpB-3LZX20rY9TWG_lxIB3NTEIgvppSUOOEsBdGj0lRs9hA>
    <xmx:ueQ5Yj2-GAJjphaNwXG-wUDhYIIW126t9eLVqMud849zrW8O93_Lsg>
    <xmx:v-Q5Yrn2znepdKRzTKlGldeqo8vqO38Yk_JGZQxPjcwaM2qU1c7IcA>
Date: Tue, 22 Mar 2022 16:01:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: "BUG: using smp_processor_id() in preemptible" on resume from S3
Message-ID: <YjnktbWvwGLC7ltk@mail-itl>
References: <Yjj7liZrbRUXXrvi@mail-itl>
 <be9f7249-4449-c46f-fad3-b1adbc8d7ea5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XcaPvB+fuLrp42Of"
Content-Disposition: inline
In-Reply-To: <be9f7249-4449-c46f-fad3-b1adbc8d7ea5@suse.com>


--XcaPvB+fuLrp42Of
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Mar 2022 16:01:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: "BUG: using smp_processor_id() in preemptible" on resume from S3

On Tue, Mar 22, 2022 at 08:12:53AM +0100, Juergen Gross wrote:
> Hi Marek,
>=20
> On 21.03.22 23:26, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > After updating from 5.14.15 dom0 kernel to 5.16.13 I started getting
> > this on resume from S3:
> >=20
> > [   88.082751] ACPI: PM: Low-level resume complete
> > [   88.087933] ACPI: EC: EC started
> > [   88.091464] ACPI: PM: Restoring platform NVS memory
> > [   88.097166] xen_acpi_processor: Uploading Xen processor PM info
> > [   88.103850] Enabling non-boot CPUs ...
> > [   88.108128] installing Xen timer for CPU 1
> > [   88.112763] BUG: using smp_processor_id() in preemptible [00000000] =
code: systemd-sleep/7138
> > [   88.122256] caller is is_xen_pmu+0x12/0x30
> > [   88.126937] CPU: 0 PID: 7138 Comm: systemd-sleep Tainted: G        W=
         5.16.13-2.fc32.qubes.x86_64 #1
> > [   88.137939] Hardware name: Star Labs StarBook/StarBook, BIOS 7.97 03=
/21/2022
> > [   88.145930] Call Trace:
> > [   88.148757]  <TASK>
> > [   88.151193]  dump_stack_lvl+0x48/0x5e
> > [   88.155381]  check_preemption_disabled+0xde/0xe0
> > [   88.160641]  is_xen_pmu+0x12/0x30
> > [   88.164441]  xen_smp_intr_init_pv+0x75/0x100
> > [   88.169311]  ? xen_read_cr0+0x20/0x20
> > [   88.173502]  xen_cpu_up_prepare_pv+0x3e/0x90
>=20
> Thanks for the report.
>=20
> Could you please test whether the attached patch is helping?

Yes, that helps, thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XcaPvB+fuLrp42Of
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmI55LUACgkQ24/THMrX
1ywH/wf/fz7xF8GffGsD5ae2XQIDIG1d2fUPPKasp/0sICeB/mUkm+6r1xZY6T4F
pXWX1NEfJs0OHxluE6A61sm7cTY4pzeLvwg/i+2oc+fdKq0Ozr7dEYc8xfd6z81b
iDGjFCDbWWMdCcRu17FKKUGztlVMU+bdYA2IM/DJ3ZvU4vWomZxnHD/cmUTAOb5X
RC7YX/KKnjsVC3IBrgNb+HcPv5n7uhECk9eipWFeBcjPMmSMsDbhnJ20dAgSi1i6
DYCBOD7+mdoP2XXArmIrvx7Ia9U0hhNwDgPcGd5CmlbEQykRjTfsRybG4RdW1c3F
TL8tHROtE0GGs491mYGxrwWMz8Zkqg==
=PnIr
-----END PGP SIGNATURE-----

--XcaPvB+fuLrp42Of--

