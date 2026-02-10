Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Kow6IJiSimlOMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 03:06:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F336411624E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 03:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226048.1532598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpd7n-0001u5-LX; Tue, 10 Feb 2026 02:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226048.1532598; Tue, 10 Feb 2026 02:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpd7n-0001rk-Ej; Tue, 10 Feb 2026 02:05:11 +0000
Received: by outflank-mailman (input) for mailman id 1226048;
 Tue, 10 Feb 2026 02:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/Er=AO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vpd7l-0001re-9X
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 02:05:09 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9130a1c-0624-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 03:05:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B05214359C;
 Tue, 10 Feb 2026 02:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0579C116C6;
 Tue, 10 Feb 2026 02:05:00 +0000 (UTC)
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
X-Inumbo-ID: e9130a1c-0624-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770689101;
	bh=LM97bjY8qg88mpoRk8lwuPzp3ZS80JpbUdkIf7gS4+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pPsjZsePw9LJ3opomhquxJ0dJddIhsilYKzPpejm2N2rrXmJf+dEhNa0lNsRwF9p4
	 5z/xnGojdSVqIhZZ2waQUiKd3JX8ZuQaMAxetOOfvrovPmXzyG1MhOc9r75m1JT4OV
	 pftOdwxMgo1vgVJ8gzIcPW/ObLR97K/QM4tZzguIelPs6bmIHbISM1Ghzjo6EAr7vr
	 97RAyQ8Uipe5ZmUPXQ7jMNyleITc38NCZ441K1bXZR2rG8/Y33VTuyxJ+PDLX1WhOe
	 ovIA7foxyBbjRU1POd/93srofk/yBgBM/UohYnayk1c+r5e0C3ZMj4IGCkX9qHUlgC
	 f1COcxU9EQ1gg==
Date: Mon, 9 Feb 2026 18:04:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, jason.andryuk@amd.com, 
    alejandro.garciavallejo@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
In-Reply-To: <42c248e7-9747-4281-9fca-1b9950a06bf8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602091804541.1134401@ubuntu-linux-20-04-desktop>
References: <20260206233005.417233-1-stefano.stabellini@amd.com> <42c248e7-9747-4281-9fca-1b9950a06bf8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stefano.stabellini@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F336411624E
X-Rspamd-Action: no action

On Mon, 9 Feb 2026, Jan Beulich wrote:
> On 07.02.2026 00:30, Stefano Stabellini wrote:> --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -652,7 +652,7 @@ endmenu
> >  
> >  config PM_OP
> >  	bool "Enable Performance Management Operation"
> > -	depends on ACPI && HAS_CPUFREQ && SYSCTL
> > +	depends on ACPI && CPUFREQ && SYSCTL
> >  	default y
> >  	help
> >  	  This option shall enable userspace performance management control
> > @@ -660,7 +660,7 @@ config PM_OP
> >  
> >  config PM_STATS
> >  	bool "Enable Performance Management Statistics"
> > -	depends on ACPI && HAS_CPUFREQ && SYSCTL
> > +	depends on ACPI && CPUFREQ && SYSCTL
> >  	default y
> >  	help
> >  	  Enable collection of performance management statistics to aid in
> 
> Is the original HAS_CPUFREQ misleading here? do_pm_op() (in pm-op.c) is also
> doing some C-state related work. You may not compile that out just because of
> CPUFREQ=n. Same for pmstat.c.

I managed to resolve this with little changes thanks to DCE


> > --- a/xen/drivers/cpufreq/Kconfig
> > +++ b/xen/drivers/cpufreq/Kconfig
> > @@ -1,3 +1,17 @@
> > -
> >  config HAS_CPUFREQ
> >  	bool
> > +
> > +config CPUFREQ
> > +	bool "CPU Frequency scaling"
> > +	default y
> > +	depends on HAS_CPUFREQ
> > +	help
> > +	  Enable CPU frequency scaling and power management governors.
> > +	  This allows Xen to dynamically adjust CPU P-states (performance
> > +	  states) based on system load.
> > +
> > +	  Disabling this option removes all cpufreq governors and power
> > +	  management interfaces. This is useful for real-time systems or
> > +	  minimal hypervisor builds.
> > +
> > +	  If unsure, say Y.
> 
> Looks like we're trying to get rid of such re-stating of what the default
> is.

OK


> > --- a/xen/include/acpi/cpufreq/cpufreq.h
> > +++ b/xen/include/acpi/cpufreq/cpufreq.h
> > @@ -381,8 +381,19 @@ int write_ondemand_up_threshold(unsigned int up_threshold);
> >  
> >  int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
> >  
> > +#ifdef CONFIG_CPUFREQ
> > +int  cpufreq_add_cpu(unsigned int cpu);
> > +int  cpufreq_del_cpu(unsigned int cpu);
> 
> If already you move these, please also get rid of the double blanks.

OK


> >  void cpufreq_dbs_timer_suspend(void);
> >  void cpufreq_dbs_timer_resume(void);
> > +#else
> > +static inline int  cpufreq_add_cpu(unsigned int cpu) { return -ENOSYS; }
> > +static inline int  cpufreq_del_cpu(unsigned int cpu) { return -ENOSYS; }
> 
> Here and below - no use of ENOSYS, please. EOPNOTSUPP it is everywhere else
> (unless dating back very far).

OK


> > --- a/xen/include/xen/acpi.h
> > +++ b/xen/include/xen/acpi.h
> > @@ -185,8 +185,14 @@ static inline unsigned int acpi_get_csubstate_limit(void) { return 0; }
> >  static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
> >  #endif
> >  
> > -#ifdef XEN_GUEST_HANDLE
> 
> If you leave this as-is, ...
> 
> > +#if defined(XEN_GUEST_HANDLE) && defined(CONFIG_CPUFREQ)
> >  int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
> > +#elif defined(XEN_GUEST_HANDLE)
> > +static inline int acpi_set_pdc_bits(unsigned int acpi_id,
> > +                                    XEN_GUEST_HANDLE(uint32) pdc)
> > +{
> > +    return -ENOSYS;
> > +}
> >  #endif
> 
> ... the overall result may be a tiny bit tidier.

OK


> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -1255,9 +1255,14 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
> >  extern bool sched_smt_power_savings;
> >  extern bool sched_disable_smt_switching;
> >  
> > -extern enum cpufreq_controller {
> > +enum cpufreq_controller {
> >      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
> > -} cpufreq_controller;
> 
> This enum would better ...
> 
> > +};
> > +#ifdef CONFIG_CPUFREQ
> > +extern enum cpufreq_controller cpufreq_controller;
> 
> ... stay inside here, then also making the split of type and var decl unnecessary.
>
> The two affected platform-ops likely want compiling out, too.
 
I am not sure I understood your suggestion. If this is what you are
thinking about, it doesn't seem like an improvement.

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1b431fc726..e8f5dfd473 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1255,13 +1255,15 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
 extern bool sched_smt_power_savings;
 extern bool sched_disable_smt_switching;
 
+#ifdef CONFIG_CPUFREQ
 enum cpufreq_controller {
     FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
 };
-#ifdef CONFIG_CPUFREQ
 extern enum cpufreq_controller cpufreq_controller;
 #else
-#define cpufreq_controller FREQCTL_none
+#define FREQCTL_none        0
+#define FREQCTL_dom0_kernel 1
+#define cpufreq_controller  FREQCTL_none
 #endif


