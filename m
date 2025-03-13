Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02785A5E9FF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 03:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911135.1317656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsYVV-0006MV-Ng; Thu, 13 Mar 2025 02:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911135.1317656; Thu, 13 Mar 2025 02:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsYVV-0006K6-KX; Thu, 13 Mar 2025 02:41:13 +0000
Received: by outflank-mailman (input) for mailman id 911135;
 Thu, 13 Mar 2025 02:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L04T=WA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tsYVU-0006K0-Om
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 02:41:12 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fb8ca25-ffb4-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 03:41:11 +0100 (CET)
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
X-Inumbo-ID: 9fb8ca25-ffb4-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741833670; x=1742092870;
	bh=grk1MRaKPZU7AU1uEI5ELCfZkc3UcabMef2F1CTXJOc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dNAcITirqMGOO2XDkTgiKXwbwiu5mIDAml+DAOQxol45sgRuM0dbhkafbCJzR8gqI
	 V2mKNtk7ZFeJMYyRjQoQQEHaFk9XcD+Ge54r+XbvjRrttH4O3HWs4hw4EPFCVDcsLG
	 o5Se82hkJriVAmACip+oUxclcBXW1R7O7QXZc0r1pHLSUf4DgUig+FBAQNiiIRn2kp
	 BSgQUfISPFeaknZCD02AMtzOQrEJEFUVCahLpnczvKC1YJl5M5ZT95bAdhVW29lJnv
	 b+BZvsVMpixMvISqUNggdLyzeGM8vcFP1w9eH8qxdISKwrYDAEyeE4x6/7Z2gdw8qo
	 V2uKxeBeXriNw==
Date: Thu, 13 Mar 2025 02:41:04 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm: add HVM-specific Kconfig
Message-ID: <WA1oO_KWxB7ea-iyR665qjWssaqcWn6Wb0mRglHdw63-mr0cwb0IF5XO2voATCU5H4kimxAloJJpQxHVcPwDNyxFsuggFA_MxAylLIXmZOo=@proton.me>
In-Reply-To: <c037b420-d732-45fd-adc5-12792c1bc187@suse.com>
References: <20250207220302.4190210-1-dmukhin@ford.com> <c037b420-d732-45fd-adc5-12792c1bc187@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 877fd3e22d5336af9c03cdd293835972ff180892
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, March 10th, 2025 at 3:36 AM, Jan Beulich <jbeulich@suse.com> wro=
te:

>=20
>=20
> On 07.02.2025 23:03, dmkhn@proton.me wrote:
>=20
> > Add separate menu for configuring HVM build-time settings to help organ=
izing
> > HVM-specific options.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
>=20
> I think it would be nice if "organizing" was further qualified, to really=
 see
> why the change is being made. A particular benefit that Roger points out =
is
> that this way all HVM-dependent options moved here will then appear in a =
sub-
> menu like fashion in the tool.
>=20
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -30,7 +30,6 @@ config X86
> > select HAS_SCHED_GRANULARITY
> > select HAS_UBSAN
> > select HAS_VMAP
> > - select HAS_VPCI if HVM
> > select NEEDS_LIBELF
>=20
>=20
> As said before, personally I'd prefer if this didn't move.

Fixed in v2, sorry overlooked that.

>=20
> > --- /dev/null
> > +++ b/xen/arch/x86/hvm/Kconfig
> > @@ -0,0 +1,73 @@
> > +menuconfig HVM
> > + bool "HVM support"
> > + depends on !PV_SHIM_EXCLUSIVE
> > + default !PV_SHIM
> > + select COMPAT
> > + select HAS_VPCI
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
> > +config AMD_SVM
> > + bool "AMD-V" if EXPERT
> > + default y
> > + help
> > + Enables virtual machine extensions on platforms that implement the
> > + AMD Virtualization Technology (AMD-V).
> > + If your system includes a processor with AMD-V support, say Y.
> > + If in doubt, say Y.
> > +
> > +config INTEL_VMX
> > + bool "Intel VT-x" if EXPERT
> > + default y
> > + select ARCH_VCPU_IOREQ_COMPLETION
> > + help
> > + Enables virtual machine extensions on platforms that implement the
> > + Intel Virtualization Technology (Intel VT-x).
> > + If your system includes a processor with Intel VT-x support, say Y.
> > + If in doubt, say Y.
>=20
>=20
> Perhaps not to be done right here, but still: I guess the "default" of th=
ese
> want to change to use AMD / INTEL respectively. While we permit enabling =
the
> virt extension support separately, generally there's little point doing s=
o
> by default when the corresponding CPU support code was disabled.

Addressed.

>=20
> > +config ALTP2M
> > + bool "Alternate P2M support" if EXPERT
> > + depends on INTEL_VMX
> > + default y
> > + help
> > + Alternate-p2m allows a guest to manage multiple p2m guest physical
> > + "memory views" (as opposed to a single p2m).
> > + Useful for memory introspection.
> > +
> > + If unsure, stay with defaults.
> > +
> > +config MEM_PAGING
> > + bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
> > +
> > +config MEM_SHARING
> > + bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
> > +
> > +config HVM_FEP
> > + bool "HVM Forced Emulation Prefix support (UNSUPPORTED)" if UNSUPPORT=
ED
> > + default DEBUG
> > + help
> > + Compiles in a feature that allows HVM guest to arbitrarily
> > + exercise the instruction emulator.
> > +
> > + This feature can only be enabled during boot time with
> > + appropriate hypervisor command line option. Please read
> > + hypervisor command line documentation before trying to use
> > + this feature.
> > +
> > + This is strictly for testing purposes, and not appropriate
> > + for use in production.
> > +
> > + If unsure, say N.
>=20
>=20
> Please can this move ahead of at least the two MEM_* ones, maybe even ahe=
ad
> of ALTP2M?

Done.

>=20
> Jan

