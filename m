Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD23B281622
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2213.6524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOMgG-00038x-Oh; Fri, 02 Oct 2020 15:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2213.6524; Fri, 02 Oct 2020 15:09:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOMgG-00038Y-LD; Fri, 02 Oct 2020 15:09:08 +0000
Received: by outflank-mailman (input) for mailman id 2213;
 Fri, 02 Oct 2020 15:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUGt=DJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kOMgF-00038T-MJ
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:09:07 +0000
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 707efc57-a3bd-488d-802c-6ba9609a5b8e;
 Fri, 02 Oct 2020 15:09:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3DC3E5C00EE;
 Fri,  2 Oct 2020 11:09:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 02 Oct 2020 11:09:05 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id B7E0E3064688;
 Fri,  2 Oct 2020 11:09:03 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bUGt=DJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kOMgF-00038T-MJ
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:09:07 +0000
X-Inumbo-ID: 707efc57-a3bd-488d-802c-6ba9609a5b8e
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 707efc57-a3bd-488d-802c-6ba9609a5b8e;
	Fri, 02 Oct 2020 15:09:05 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3DC3E5C00EE;
	Fri,  2 Oct 2020 11:09:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 02 Oct 2020 11:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1C1lvw
	3bIIFsQ68c3jWIJPGVmAXKj8uzwfQOdS6cth8=; b=UagfYQYyX5zdSAaCIWrNnv
	bCRiP0wNOWdsw4XxAquusv8aj0Lx2fXpJhlPUCq/YBCBGd1zp+p9s5bkCR0l9NLR
	7MnsJdQw7G0PoSshgFob7ET8omAVkEHuhIpBrkfvX5Chjplft5K8W0KRgJun62f1
	xINwzBWPoDsuFNilZ2ZIuYe+kHrRdtmwkiAAcjtYZv4i4rXtML4nMqeQYHOyp1Hy
	g6QnHi79zT688i/byzu9MbWhHx5mKo6jmfth6z8T+al9qDAsWQb6TSas5lKUd3ib
	3LU+sxhyh62uXzalmwmVgP/SHvNLjCs9p3ZP+51sSnr2sNCGVHzVbODNChcTsAGg
	==
X-ME-Sender: <xms:kEJ3Xwr1vH23wLYZ5iq-yXzcGjCXw9dVZoBA5v8oXF2rFyXbGKrTNw>
    <xme:kEJ3X2ptySa99uFwIS9yWh453BTGoBOtWLN3j7it82aQetNHYLwhvN_3w_F3NIn7f
    7aEhoxpYKa9Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeigdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeduieeg
    ieffkefguddvteeffeehhfelfeduveeljeevteffudegkeejudffhfefnecuffhomhgrih
    hnpeigvghnrdhorhhgnecukfhppeeluddrieegrddujedtrdekleenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:kEJ3X1MqKT0g2H_934bK5SgRQVRGELYUaJJrfYqIWoP9Lg_d3Feo0A>
    <xmx:kEJ3X34D9UkQmiL0ILbDWVaXnSPkw9N97dY0WK2vFUeBg6nQLitFTw>
    <xmx:kEJ3X_504VboYh8IBXFhHPufImOVF3z4P46-C_COwzyUeMSVB12maQ>
    <xmx:kUJ3X4UjAjGIyaOqMQV1szmhKBA0PwedVGp_EQeCtWNt1SodnWV9Ig>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id B7E0E3064688;
	Fri,  2 Oct 2020 11:09:03 -0400 (EDT)
Date: Fri, 2 Oct 2020 17:08:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Yet another S3 issue in Xen 4.14
Message-ID: <20201002150859.GM3962@mail-itl>
References: <20201001011245.GL3962@mail-itl>
 <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>
 <20201001123129.GJ1482@mail-itl>
 <1e596ccc-a875-93f1-2619-e4dbcbd88b4d@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cGfB/trNgB3WtPHu"
Content-Disposition: inline
In-Reply-To: <1e596ccc-a875-93f1-2619-e4dbcbd88b4d@citrix.com>


--cGfB/trNgB3WtPHu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Yet another S3 issue in Xen 4.14

On Thu, Oct 01, 2020 at 01:43:52PM +0100, Andrew Cooper wrote:
> On 01/10/2020 13:31, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Oct 01, 2020 at 01:59:32PM +0200, Jan Beulich wrote:
> >> On 01.10.2020 03:12, Marek Marczykowski-G=C3=B3recki wrote:
> >>> After patching the previous issue ("x86/S3: Fix Shadow Stack resume
> >>> path") I still encounter issues resume from S3.
> >>> Since I had it working on Xen 4.13 on this particular hardware (Think=
pad
> >>> P52), I bisected it and got this:
> >>>
> >>> commit 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1
> >>> Author: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Date:   Wed Dec 11 20:59:19 2019 +0000
> >>>
> >>>     x86/S3: Drop {save,restore}_rest_processor_state() completely
> >>>    =20
> >>>     There is no need to save/restore FS/GS/XCR0 state.  It will be ha=
ndled
> >>>     suitably on the context switch away from the idle.
> >>>    =20
> >>>     The CR4 restoration in restore_rest_processor_state() was actuall=
y fighting
> >>>     later code in enter_state() which tried to keep CR4.MCE clear unt=
il everything
> >>>     was set up.  Delete the intermediate restoration, and defer final=
 restoration
> >>>     until after MCE is reconfigured.
> >>>    =20
> >>>     Restoring PAT can be done earlier, and ideally before paging is e=
nabled.  By
> >>>     moving it into the trampoline during the setup for 64bit, the cal=
l can be
> >>>     dropped from cpu_init().  The EFI path boot path doesn't disable =
paging, so
> >>>     make the adjustment when switching onto Xen's pagetables.
> >>>    =20
> >>>     The only remaing piece of restoration is load_system_tables(), so=
 suspend.c
> >>>     can be deleted in its entirety.
> >>>    =20
> >>>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> Parent of this commit suspends and resumes just fine. With this commit
> >>> applied, it (I think) it panics, at least I get reboot after 5s. Sadl=
y, I
> >>> don't have serial console there.
> >>>
> >>> I tried also master and stable-4.14 with this commit reverted (and al=
so
> >>> the other fix applied), but it doesn't work. In this case I get a han=
g on
> >>> resume (power led still flashing, but fan woke up). There are probably
> >>> some other dependencies.
> >> Since bisection may also point you at some intermediate breakage, which
> >> these last results of yours seem to support, could you check whether
> >> 55f8c389d434 put immediately on top of the above commit makes a differ=
ence,
> >> and if so resume bisecting from there?
> > Nope, 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1 with 55f8c389d434 on top
> > it still hangs on resume.
>=20
> Ok.=C2=A0 I'll see about breaking the change apart so we can bisect which
> specific bit of code movement broke things.

I've done another bisect on the commit broken up in separate changes
(https://xenbits.xen.org/gitweb/?p=3Dpeople/andrewcoop/xen.git;a=3Dshortlog=
;h=3Drefs/heads/dbg-s3)
and the bad part seems to be this:

=46rom dbdb32f8c265295d6af7cd4cd0aa12b6d04a0430 Mon Sep 17 00:00:00 2001
=46rom: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Fri, 2 Oct 2020 15:40:22 +0100
Subject: [PATCH 1/1] CR4

---
 xen/arch/x86/acpi/power.c   | 9 ++++-----
 xen/arch/x86/acpi/suspend.c | 3 ---
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 6dfd4c7891..0cda362045 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -195,7 +195,6 @@ static int enter_state(u32 state)
     unsigned long flags;
     int error;
     struct cpu_info *ci;
-    unsigned long cr4;
=20
     if ( (state <=3D ACPI_STATE_S0) || (state > ACPI_S_STATES_MAX) )
         return -EINVAL;
@@ -270,15 +269,15 @@ static int enter_state(u32 state)
=20
     system_state =3D SYS_STATE_resume;
=20
-    /* Restore CR4 and EFER from cached values. */
-    cr4 =3D read_cr4();
-    write_cr4(cr4 & ~X86_CR4_MCE);
+    /* Restore EFER from cached value. */
     write_efer(read_efer());
=20
     device_power_up(SAVED_ALL);
=20
     mcheck_init(&boot_cpu_data, false);
-    write_cr4(cr4);
+
+    /* Restore CR4 from cached value, now MCE is set up. */
+    write_cr4(read_cr4());
=20
     printk(XENLOG_INFO "Finishing wakeup from ACPI S%d state.\n", state);
=20
diff --git a/xen/arch/x86/acpi/suspend.c b/xen/arch/x86/acpi/suspend.c
index 060a9313b6..ca987d9019 100644
--- a/xen/arch/x86/acpi/suspend.c
+++ b/xen/arch/x86/acpi/suspend.c
@@ -23,7 +23,4 @@ void save_rest_processor_state(void)
 void restore_rest_processor_state(void)
 {
     load_system_tables();
-
-    /* Restore full CR4 (inc MCE) now that the IDT is in place. */
-    write_cr4(mmu_cr4_features);
 }
--=20
2.20.1

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--cGfB/trNgB3WtPHu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl93QosACgkQ24/THMrX
1yw2Nwf9EZTu//vxGTNaY+7efJeVkx1/Cg93/vXrihs+AOeS2ZUtZxS9rKnQHjbV
QpQ4DMtXi9yPINwY0cgUaDGnmqEKkeYEStiljJ/5VObCdlbvCSEDnG19ie13FSgb
eabCv3WQgzaYMNgojHhPcwA9jQGp0ojLpNqeHizcF4PbOlhHQqwkb9MYFbqzHItL
fyYT6QiCDvRiTf3k0b0A/MYttm767K7Xy7JHPqNtX+uXYpe4MHarqOMxxbBi7+9c
+R1a6I9ViwKrDHWUPGm7PuviJQdnOtZpYjxg5UayhSL8H/DYN/FnNZfF94daxSXx
lwHZSfwBMxa/r1OAuts3EaPZVRS7Xw==
=p/3W
-----END PGP SIGNATURE-----

--cGfB/trNgB3WtPHu--

