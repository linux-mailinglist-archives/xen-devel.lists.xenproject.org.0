Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NEHOqlUhmlzMAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:52:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618F1103465
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223929.1531286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSoX-0008PC-Bn; Fri, 06 Feb 2026 20:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223929.1531286; Fri, 06 Feb 2026 20:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSoX-0008Mt-8v; Fri, 06 Feb 2026 20:52:29 +0000
Received: by outflank-mailman (input) for mailman id 1223929;
 Fri, 06 Feb 2026 20:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUBK=AK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1voSoV-0008Hz-ID
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:52:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd7845b0-039d-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 21:52:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 245A643910;
 Fri,  6 Feb 2026 20:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D8BC116C6;
 Fri,  6 Feb 2026 20:52:22 +0000 (UTC)
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
X-Inumbo-ID: bd7845b0-039d-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770411144;
	bh=uo8ze5SVM4HHEzRgguecAUZD/G9nCX+zUnK5PcRTjZs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tBhc9u81VkaMbZnuFknF8cq09oEyuF9T2+lkaOpUdsd5QLojBXtqmf4FcEnLRRkbv
	 szGJaYptOpCYeo0/rkrPjAMjN8N01Qs18rrU5sCKbg16JVjtkyi32hROfjK4suE+tL
	 17SvfOlEnvoKS0LUXQVk84MnOC2NJQruWk4M7yRhjY0J+wzHytE7yosHSbDbDPhPpg
	 q70f95fnjjF4OC+xb+PZQPt23xEq0W0zUDwugN2qLRxRn143NYv1YIySn9Lx6KWy/E
	 s9vfQ7+u+Rr/Xy2JPppRy3smg8gSF9sv2Hrk2oqCVLULT6my5gG6eeKtLOSQSGiYgU
	 0Vkh8xWSjGudg==
Date: Fri, 6 Feb 2026 12:52:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, jason.andryuk@amd.com, 
    alejandro.garciavallejo@amd.com
Subject: Re: [PATCH] x86/hvm: Add Kconfig option to disable nested
 virtualization
In-Reply-To: <aYWjB-fxIzdk0K6_@Mac.lan>
Message-ID: <alpine.DEB.2.22.394.2602061250560.3668128@ubuntu-linux-20-04-desktop>
References: <20260206015032.4159672-1-stefano.stabellini@amd.com> <aYWjB-fxIzdk0K6_@Mac.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1050394070-1770411124=:3668128"
Content-ID: <alpine.DEB.2.22.394.2602061252160.3668128@ubuntu-linux-20-04-desktop>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 618F1103465
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1050394070-1770411124=:3668128
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2602061252161.3668128@ubuntu-linux-20-04-desktop>

On Fri, 5 Feb 2026, Roger Pau Monné wrote:
> On Thu, Feb 05, 2026 at 05:50:32PM -0800, Stefano Stabellini wrote:
> > Introduce CONFIG_NESTED_VIRT (default y, requires EXPERT to disable)
> > to allow nested virtualization support to be disabled at build time.
> > This is useful for embedded or safety-focused deployments where
> > nested virtualization is not needed, reducing code size and attack
> > surface.
> > 
> > When CONFIG_NESTED_VIRT=n, the following source files are excluded:
> > - arch/x86/hvm/nestedhvm.c
> > - arch/x86/hvm/svm/nestedsvm.c
> > - arch/x86/hvm/vmx/vvmx.c
> > - arch/x86/mm/nested.c
> > - arch/x86/mm/hap/nested_hap.c
> > - arch/x86/mm/hap/nested_ept.c
> > 
> > Add inline stubs where needed in headers.
> > 
> > No functional change when CONFIG_NESTED_VIRT=y.
> 
> You also need to adjust arch_sanitise_domain_config() so it refuses to
> create domains with the XEN_DOMCTL_CDF_nested_virt flag set when
> CONFIG_NESTED_VIRT=n. 

Sounds good


> If you do that I think a bunch of the dummy
> helpers that you add when CONFIG_NESTED_VIRT=n should also gain an
> ASSERT_UNREACHABLE().

OK


> And IMO you will also need to add a new XEN_SYSCTL_PHYSCAP_nestedhvm
> (or alike) to signal the toolstack whether the nested HVM feature is
> available.  Much like we do for HAP/Shadow/gnttab availability.

yeah good point


> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >  xen/arch/x86/hvm/Kconfig                 | 10 ++++++
> >  xen/arch/x86/hvm/Makefile                |  2 +-
> >  xen/arch/x86/hvm/svm/Makefile            |  2 +-
> >  xen/arch/x86/hvm/svm/nestedhvm.h         | 44 +++++++++++++++++++++---
> >  xen/arch/x86/hvm/svm/svm.c               |  6 ++++
> >  xen/arch/x86/hvm/vmx/Makefile            |  2 +-
> >  xen/arch/x86/hvm/vmx/vmx.c               | 10 ++++--
> >  xen/arch/x86/include/asm/hvm/nestedhvm.h | 41 +++++++++++++++++-----
> >  xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 30 ++++++++++++++++
> >  xen/arch/x86/mm/Makefile                 |  2 +-
> >  xen/arch/x86/mm/hap/Makefile             |  4 +--
> >  xen/arch/x86/mm/p2m.h                    |  6 ++++
> >  12 files changed, 137 insertions(+), 22 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> > index f32bf5cbb7..12b5df4710 100644
> > --- a/xen/arch/x86/hvm/Kconfig
> > +++ b/xen/arch/x86/hvm/Kconfig
> > @@ -92,4 +92,14 @@ config MEM_SHARING
> >  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
> >  	depends on INTEL_VMX
> >  
> > +config NESTED_VIRT
> > +	bool "Nested virtualization support" if EXPERT
> > +	depends on AMD_SVM || INTEL_VMX
> > +	default y
> > +	help
> > +	  Enable nested virtualization, allowing guests to run their own
> > +	  hypervisors. This requires hardware support.
> > +
> > +	  If unsure, say Y.
> 
> If we go that route, I think nested virt should become off by default.
> It's not security supported, and known to be broken in many areas.
> 
> I'm also unsure about whether this wants to be gated under EXPERT.
> But I'm not sure I'm any good at knowing whether something should be
> under EXPERT or not.

I am happy either way and I'll others decide on the default. I did it
this way to avoid changes over the current baseline. In case there is
disagreement, I am also happy if it gets changed on commit based on the
latest preference.


> > +
> >  endif
> > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> > index f34fb03934..b8a0a68624 100644
> > --- a/xen/arch/x86/hvm/Makefile
> > +++ b/xen/arch/x86/hvm/Makefile
> > @@ -18,7 +18,7 @@ obj-y += irq.o
> >  obj-y += mmio.o
> >  obj-$(CONFIG_VM_EVENT) += monitor.o
> >  obj-y += mtrr.o
> > -obj-y += nestedhvm.o
> > +obj-$(CONFIG_NESTED_VIRT) += nestedhvm.o
> >  obj-y += pmtimer.o
> >  obj-y += quirks.o
> >  obj-y += rtc.o
> > diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
> > index 8a072cafd5..92418e3444 100644
> > --- a/xen/arch/x86/hvm/svm/Makefile
> > +++ b/xen/arch/x86/hvm/svm/Makefile
> > @@ -2,6 +2,6 @@ obj-y += asid.o
> >  obj-y += emulate.o
> >  obj-bin-y += entry.o
> >  obj-y += intr.o
> > -obj-y += nestedsvm.o
> > +obj-$(CONFIG_NESTED_VIRT) += nestedsvm.o
> >  obj-y += svm.o
> >  obj-y += vmcb.o
> > diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
> > index 9bfed5ffd7..a102c076ea 100644
> > --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> > +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> > @@ -26,6 +26,13 @@
> >  #define nsvm_efer_svm_enabled(v) \
> >      (!!((v)->arch.hvm.guest_efer & EFER_SVME))
> >  
> > +#define NSVM_INTR_NOTHANDLED     3
> > +#define NSVM_INTR_NOTINTERCEPTED 2
> > +#define NSVM_INTR_FORCEVMEXIT    1
> > +#define NSVM_INTR_MASKED         0
> > +
> > +#ifdef CONFIG_NESTED_VIRT
> > +
> >  int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
> >  void nestedsvm_vmexit_defer(struct vcpu *v,
> >      uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
> > @@ -57,13 +64,40 @@ int cf_check nsvm_hap_walk_L1_p2m(
> >      struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
> >      uint8_t *p2m_acc, struct npfec npfec);
> >  
> > -#define NSVM_INTR_NOTHANDLED     3
> > -#define NSVM_INTR_NOTINTERCEPTED 2
> > -#define NSVM_INTR_FORCEVMEXIT    1
> > -#define NSVM_INTR_MASKED         0
> > -
> >  int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
> >  
> > +#else /* !CONFIG_NESTED_VIRT */
> > +
> > +static inline int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
> > +{
> > +    return 0;
> > +}
> > +static inline void nestedsvm_vmexit_defer(struct vcpu *v,
> > +    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2) { }
> > +static inline enum nestedhvm_vmexits nestedsvm_vmexit_n2n1(struct vcpu *v,
> > +    struct cpu_user_regs *regs)
> > +{
> > +    return NESTEDHVM_VMEXIT_ERROR;
> > +}
> > +static inline enum nestedhvm_vmexits nestedsvm_check_intercepts(struct vcpu *v,
> > +    struct cpu_user_regs *regs, uint64_t exitcode)
> > +{
> > +    return NESTEDHVM_VMEXIT_ERROR;
> > +}
> > +static inline void svm_nested_features_on_efer_update(struct vcpu *v) { }
> > +static inline void svm_vmexit_do_clgi(struct cpu_user_regs *regs,
> > +                                      struct vcpu *v) { }
> > +static inline void svm_vmexit_do_stgi(struct cpu_user_regs *regs,
> > +                                       struct vcpu *v) { }
> > +static inline bool nestedsvm_gif_isset(struct vcpu *v) { return true; }
> > +static inline int nestedsvm_vcpu_interrupt(struct vcpu *v,
> > +                                           const struct hvm_intack intack)
> > +{
> > +    return NSVM_INTR_NOTINTERCEPTED;
> > +}
> > +
> > +#endif /* CONFIG_NESTED_VIRT */
> > +
> >  #endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
> >  
> >  /*
> > diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> > index 18ba837738..0234b57afb 100644
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -46,6 +46,10 @@
> >  
> >  void noreturn svm_asm_do_resume(void);
> >  
> > +#ifndef CONFIG_NESTED_VIRT
> > +void asmlinkage nsvm_vcpu_switch(void) { }
> > +#endif
> > +
> >  u32 svm_feature_flags;
> >  
> >  /*
> > @@ -2465,6 +2469,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
> >      .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
> >      .get_insn_bytes       = svm_get_insn_bytes,
> >  
> > +#ifdef CONFIG_NESTED_VIRT
> >      .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
> >      .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
> >      .nhvm_vcpu_reset = nsvm_vcpu_reset,
> > @@ -2474,6 +2479,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
> >      .nhvm_vmcx_hap_enabled = nsvm_vmcb_hap_enabled,
> >      .nhvm_intr_blocked = nsvm_intr_blocked,
> >      .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
> > +#endif
> >  
> >      .get_reg = svm_get_reg,
> >      .set_reg = svm_set_reg,
> > diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makefile
> > index 04a29ce59d..902564b3e2 100644
> > --- a/xen/arch/x86/hvm/vmx/Makefile
> > +++ b/xen/arch/x86/hvm/vmx/Makefile
> > @@ -3,4 +3,4 @@ obj-y += intr.o
> >  obj-y += realmode.o
> >  obj-y += vmcs.o
> >  obj-y += vmx.o
> > -obj-y += vvmx.o
> > +obj-$(CONFIG_NESTED_VIRT) += vvmx.o
> > diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> > index 82c55f49ae..252f27322b 100644
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -55,6 +55,10 @@
> >  #include <public/hvm/save.h>
> >  #include <public/sched.h>
> >  
> > +#ifndef CONFIG_NESTED_VIRT
> > +void asmlinkage nvmx_switch_guest(void) { }
> > +#endif
> > +
> >  static bool __initdata opt_force_ept;
> >  boolean_param("force-ept", opt_force_ept);
> >  
> > @@ -2033,7 +2037,7 @@ static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
> >                   nvmx->intr.intr_info, nvmx->intr.error_code);
> >  }
> >  
> > -static int cf_check nvmx_vmexit_event(
> > +static int cf_check __maybe_unused nvmx_vmexit_event(
> >      struct vcpu *v, const struct x86_event *event)
> >  {
> >      nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
> > @@ -2933,6 +2937,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
> >      .handle_cd            = vmx_handle_cd,
> >      .set_info_guest       = vmx_set_info_guest,
> >      .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
> > +#ifdef CONFIG_NESTED_VIRT
> >      .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
> >      .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
> >      .nhvm_vcpu_reset      = nvmx_vcpu_reset,
> > @@ -2942,8 +2947,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
> >      .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
> >      .nhvm_intr_blocked    = nvmx_intr_blocked,
> >      .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
> > -    .update_vlapic_mode = vmx_vlapic_msr_changed,
> >      .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
> > +#endif
> > +    .update_vlapic_mode = vmx_vlapic_msr_changed,
> >  #ifdef CONFIG_VM_EVENT
> >      .enable_msr_interception = vmx_enable_msr_interception,
> >  #endif
> > diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> > index ea2c1bc328..0372974b24 100644
> > --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> > +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> > @@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
> >  /* Nested HVM on/off per domain */
> >  static inline bool nestedhvm_enabled(const struct domain *d)
> >  {
> > -    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
> > +    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
> > +           (d->options & XEN_DOMCTL_CDF_nested_virt);
> >  }
> >  
> > +/* Nested paging */
> > +#define NESTEDHVM_PAGEFAULT_DONE       0
> > +#define NESTEDHVM_PAGEFAULT_INJECT     1
> > +#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> > +#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> > +#define NESTEDHVM_PAGEFAULT_MMIO       4
> > +#define NESTEDHVM_PAGEFAULT_RETRY      5
> > +#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> > +
> > +#ifdef CONFIG_NESTED_VIRT
> > +
> >  /* Nested VCPU */
> >  int nestedhvm_vcpu_initialise(struct vcpu *v);
> >  void nestedhvm_vcpu_destroy(struct vcpu *v);
> > @@ -38,14 +50,6 @@ bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
> >  #define nestedhvm_vcpu_exit_guestmode(v)  \
> >      vcpu_nestedhvm(v).nv_guestmode = 0
> >  
> > -/* Nested paging */
> > -#define NESTEDHVM_PAGEFAULT_DONE       0
> > -#define NESTEDHVM_PAGEFAULT_INJECT     1
> > -#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> > -#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> > -#define NESTEDHVM_PAGEFAULT_MMIO       4
> > -#define NESTEDHVM_PAGEFAULT_RETRY      5
> > -#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> >  int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
> >                                      struct npfec npfec);
> >  
> > @@ -59,6 +63,25 @@ unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
> >  
> >  void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m);
> >  
> > +#else /* !CONFIG_NESTED_VIRT */
> > +
> > +static inline int nestedhvm_vcpu_initialise(struct vcpu *v) { return 0; }
> > +static inline void nestedhvm_vcpu_destroy(struct vcpu *v) { }
> > +static inline void nestedhvm_vcpu_reset(struct vcpu *v) { }
> > +static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v) { return false; }
> > +static inline int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
> > +                                                  struct npfec npfec)
> > +{
> > +    return NESTEDHVM_PAGEFAULT_L0_ERROR;
> > +}
> > +#define nestedhvm_vcpu_enter_guestmode(v) do { } while (0)
> > +#define nestedhvm_vcpu_exit_guestmode(v)  do { } while (0)
> > +#define nestedhvm_paging_mode_hap(v) false
> > +#define nestedhvm_vmswitch_in_progress(v) false
> > +static inline void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m) { }
> > +
> > +#endif /* CONFIG_NESTED_VIRT */
> > +
> >  static inline bool nestedhvm_is_n2(struct vcpu *v)
> >  {
> >      if ( !nestedhvm_enabled(v->domain) ||
> > diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> > index da10d3fa96..8dc876a4c2 100644
> > --- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> > +++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> > @@ -73,6 +73,8 @@ union vmx_inst_info {
> >      u32 word;
> >  };
> >  
> > +#ifdef CONFIG_NESTED_VIRT
> > +
> >  int cf_check nvmx_vcpu_initialise(struct vcpu *v);
> >  void cf_check nvmx_vcpu_destroy(struct vcpu *v);
> >  int cf_check nvmx_vcpu_reset(struct vcpu *v);
> > @@ -199,5 +201,33 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
> >                          uint64_t *exit_qual, uint32_t *exit_reason);
> >  int nvmx_cpu_up_prepare(unsigned int cpu);
> >  void nvmx_cpu_dead(unsigned int cpu);
> > +
> > +#else /* !CONFIG_NESTED_VIRT */
> > +
> > +static inline void nvmx_update_exec_control(struct vcpu *v, u32 value) { }
> > +static inline void nvmx_update_secondary_exec_control(struct vcpu *v,
> > +                                                      unsigned long value) { }
> > +static inline void nvmx_update_exception_bitmap(struct vcpu *v,
> > +                                                unsigned long value) { }
> > +static inline u64 nvmx_get_tsc_offset(struct vcpu *v) { return 0; }
> > +static inline void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr) { }
> > +static inline bool nvmx_intercepts_exception(struct vcpu *v, unsigned int vector,
> > +                                             int error_code) { return false; }
> > +static inline int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
> > +                                         unsigned int exit_reason) { return 0; }
> > +static inline void nvmx_idtv_handling(void) { }
> > +static inline int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
> > +{
> > +    return 0;
> > +}
> > +static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
> > +                                       unsigned int exit_reason) { return 0; }
> > +static inline int nvmx_cpu_up_prepare(unsigned int cpu) { return 0; }
> > +static inline void nvmx_cpu_dead(unsigned int cpu) { }
> > +
> > +#define get_vvmcs(vcpu, encoding) 0
> > +
> > +#endif /* CONFIG_NESTED_VIRT */
> > +
> >  #endif /* __ASM_X86_HVM_VVMX_H__ */
> >  
> > diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> > index 960f6e8409..aa15811c2e 100644
> > --- a/xen/arch/x86/mm/Makefile
> > +++ b/xen/arch/x86/mm/Makefile
> > @@ -7,7 +7,7 @@ obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
> >  obj-$(CONFIG_VM_EVENT) += mem_access.o
> >  obj-$(CONFIG_MEM_PAGING) += mem_paging.o
> >  obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
> > -obj-$(CONFIG_HVM) += nested.o
> > +obj-$(CONFIG_NESTED_VIRT) += nested.o
> >  obj-$(CONFIG_HVM) += p2m.o
> >  obj-y += p2m-basic.o
> >  obj-$(CONFIG_INTEL_VMX) += p2m-ept.o
> > diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
> > index 67c29b2162..de1bb3abde 100644
> > --- a/xen/arch/x86/mm/hap/Makefile
> > +++ b/xen/arch/x86/mm/hap/Makefile
> > @@ -2,5 +2,5 @@ obj-y += hap.o
> >  obj-y += guest_walk_2.o
> >  obj-y += guest_walk_3.o
> >  obj-y += guest_walk_4.o
> > -obj-y += nested_hap.o
> > -obj-$(CONFIG_INTEL_VMX) += nested_ept.o
> > +obj-$(CONFIG_NESTED_VIRT) += nested_hap.o
> > +obj-$(CONFIG_NESTED_VIRT) += nested_ept.o
> 
> With this change nested_ept.o is no longer gated explicitly on
> CONFIG_INTEL_VMX, which could cause build issues if you have a Kconfig
> like:
> 
> CONFIG_INTEL_VMX=n
> CONFIG_AMD_SVM=y
> CONFIG_NESTED_VIRT=y
> 
> Does the code in nested_ept.o have dependencies on other files gated
> by CONFIG_INTEL_VMX, and hence would fail at the linking stage?  And
> even if it builds, the code in nested_ept.o would be unreachable I
> expect.

It does build, but you are right. I'll improve this.
--8323329-1050394070-1770411124=:3668128--

