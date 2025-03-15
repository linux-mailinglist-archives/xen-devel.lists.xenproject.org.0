Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7673A623F5
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915686.1321152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttGEU-0008Q4-NG; Sat, 15 Mar 2025 01:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915686.1321152; Sat, 15 Mar 2025 01:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttGEU-0008Oc-Jy; Sat, 15 Mar 2025 01:22:34 +0000
Received: by outflank-mailman (input) for mailman id 915686;
 Sat, 15 Mar 2025 01:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ms5H=WC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ttGES-0008OU-MQ
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:22:33 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6b4250e-013b-11f0-9899-31a8f345e629;
 Sat, 15 Mar 2025 02:22:30 +0100 (CET)
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
X-Inumbo-ID: f6b4250e-013b-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742001749; x=1742260949;
	bh=X1wrzkieJsGu9mFqxc56q7UF9AxyFxr9mRKgYAF0Qc8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=nAss5rVU33uF0rCa4vnSRxVm4yBZqizPSpWcdE0eBpDEtJfqNBFT/z9jdZpaE81I6
	 n0L03luhnlti33S+g8vLmzcpjvKpthOiM8z/iqNyMPoPO3I0aH3YAaTA42DDu5tGBA
	 Y2rDHNr/D/N8b+SNh1wDWDBxloRP1jtM/uBjnpM4tlRSeD6bvV6H1BTbmhQKEkk7Fv
	 +DFTMAV8HbtrgXLeKfMyZCIZ/oKgh9nzIAjIBVCq3hHVgMavXdZIBWloQ5NcIp9dLk
	 G2ebPLlwAHCqxGBUDXN94/+05DLfrMQ5XXpL4/UvozgkRi2EfHhsSpxtUKit6+weF6
	 f9BzFJqikw2Gw==
Date: Sat, 15 Mar 2025 01:22:24 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2] x86/hvm: add HVM-specific Kconfig
Message-ID: <UTuljbp6a7orResha6vhFL5cUCPBArSylv04tzMhcw0TATweLPb_E9cx1xnA0TdsnPKukjCa7XM-23TaWTlZVIYvt2ZW8K3krkaYTCQx5QU=@proton.me>
In-Reply-To: <e9c35acc-007b-4b31-aa27-3a9b852fc0cb@citrix.com>
References: <20250313023822.2523270-1-dmukhin@ford.com> <e9c35acc-007b-4b31-aa27-3a9b852fc0cb@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 813478170ae83f708751dede9b9aeaa9c22b10a8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, March 14th, 2025 at 1:20 PM, Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:

>=20
>=20
> On 13/03/2025 2:39 am, dmkhn@proton.me wrote:
>=20
> > diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> > new file mode 100644
> > index 0000000000..2ca664f36f
> > --- /dev/null
> > +++ b/xen/arch/x86/hvm/Kconfig
> > @@ -0,0 +1,76 @@
> > +menuconfig HVM
> > + bool "HVM support"
> > + depends on !PV_SHIM_EXCLUSIVE
> > + default !PV_SHIM
> > + select COMPAT
> > + select IOREQ_SERVER
> > + select MEM_ACCESS_ALWAYS_ON
> > + help
> > + Interfaces to support HVM domains. HVM domains require hardware
> > + virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
> > + guests which have no specific Xen knowledge.
> > +
> > + This option is needed if you want to run HVM or PVH domains.
> > +
> > + If unsure, say Y.
> > +
> > +if HVM
> > +
> > +menu "Hardware Support for Virtualization"
> > +
> > +config AMD_SVM
> > + bool "AMD-V" if AMD && EXPERT
> > + default y
> > + help
> > + Enables virtual machine extensions on platforms that implement the
> > + AMD Virtualization Technology (AMD-V).
> > + If your system includes a processor with AMD-V support, say Y.
> > + If in doubt, say Y.
> > +
> > +config INTEL_VMX
> > + bool "Intel VT-x" if INTEL && EXPERT
> > + default y
> > + select ARCH_VCPU_IOREQ_COMPLETION
> > + help
> > + Enables virtual machine extensions on platforms that implement the
> > + Intel Virtualization Technology (Intel VT-x).
> > + If your system includes a processor with Intel VT-x support, say Y.
> > + If in doubt, say Y.
> > +
> > +endmenu
>=20
>=20
> Looking at the end result, I'd suggest dropping the menu around SVM and V=
MX.
>=20
> It would be nice to group them under a name called Vendor Support, but I
> don't think the Kconfig language can express this, and the full menu
> becomes empty if both AMD and INTEL are deselected.
>=20
> Having them simply at the top of the HVM menu seems like the less bad
> option.
>=20
> There is a bunch of cleanup which should be done, but explicitly not in
> this patch which is simply restructuring. I'll do a patch in due course.

Addressed:
  https://lore.kernel.org/xen-devel/20250315011945.2927542-1-dmukhin@ford.c=
om

Thanks!

>=20
> ~Andrew

