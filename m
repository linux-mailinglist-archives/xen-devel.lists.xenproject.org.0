Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363376DDE2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 04:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575969.901578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNqH-0002AN-Vt; Thu, 03 Aug 2023 02:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575969.901578; Thu, 03 Aug 2023 02:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNqH-00028J-TF; Thu, 03 Aug 2023 02:13:33 +0000
Received: by outflank-mailman (input) for mailman id 575969;
 Thu, 03 Aug 2023 02:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNqG-00028D-Vv
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 02:13:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 570b0f5c-31a3-11ee-b267-6b7b168915f2;
 Thu, 03 Aug 2023 04:13:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF50761069;
 Thu,  3 Aug 2023 02:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AF7C433C8;
 Thu,  3 Aug 2023 02:13:27 +0000 (UTC)
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
X-Inumbo-ID: 570b0f5c-31a3-11ee-b267-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691028809;
	bh=mHiAOK+yWX5612sP3VmpYF6Q8GiD9sWY3VWtK0hgF7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=skQgGv7XFoePf6wxt5S7WJikW/sEbGi3/IxuB4l4IhuLmjR2qtJBBT8FSAJ6Ny6sl
	 fLJ+x5Vm9Tsa6QGrlpT1+ujh3ukKGhia1TfLcsW57ZnLDQ5qdPe1jYMM70JMPuaY12
	 +i5LQd46uT9eyfVZxW4BZC5nnt27UPoKRUhQ5FCXLRSTfEfVt2sN5NGz6uJxy3TB/a
	 KWHVZY6RoEhiQ7cz4OzixlkE4XdMbJ0+pIMMgJxMhZ5fFTk1dhtXCZJrUJkKF9qDcm
	 yjhRZI4At9C5h7dG2XTKm2Stj5L8QRf8khzzIlSSe3eS27HxCJLdWj57BvIAyckcKZ
	 uCTqJYZy3+WDg==
Date: Wed, 2 Aug 2023 19:13:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
In-Reply-To: <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> Variable declarations between a switch statement guard and before
> any case label are unreachable code, and hence violate Rule 2.1:
> "A project shall not contain unreachable code".
> 
> Therefore the declarations are moved in the smallest enclosing
> scope, near other variable definitions.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/cpuid.c  |  3 +--
>  xen/arch/x86/domain.c | 23 +++++++++++------------
>  xen/arch/x86/irq.c    |  3 +--
>  xen/arch/x86/msr.c    |  3 +--
>  4 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index 455a09b2dd..90e1370e90 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -37,6 +37,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>  {
>      const struct domain *d = v->domain;
>      const struct cpu_policy *p = d->arch.cpu_policy;
> +    const struct cpu_user_regs *regs;
>  
>      *res = EMPTY_LEAF;
>  
> @@ -136,8 +137,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>       */
>      switch ( leaf )
>      {
> -        const struct cpu_user_regs *regs;
> -
>      case 0x1:
>          /* TODO: Rework topology logic. */
>          res->b &= 0x00ffffffu;
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 5f66c2ae33..015f7b14ab 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2268,6 +2268,17 @@ int domain_relinquish_resources(struct domain *d)
>  {
>      int ret;
>      struct vcpu *v;
> +    enum {
> +        PROG_iommu_pagetables = 1,
> +        PROG_shared,
> +        PROG_paging,
> +        PROG_vcpu_pagetables,
> +        PROG_xen,
> +        PROG_l4,
> +        PROG_l3,
> +        PROG_l2,
> +        PROG_done,
> +    };
>  
>      BUG_ON(!cpumask_empty(d->dirty_cpumask));
>  
> @@ -2291,18 +2302,6 @@ int domain_relinquish_resources(struct domain *d)
>  #define PROGRESS(x)                                                     \
>          d->arch.rel_priv = PROG_ ## x; /* Fallthrough */ case PROG_ ## x
>  
> -        enum {
> -            PROG_iommu_pagetables = 1,
> -            PROG_shared,
> -            PROG_paging,
> -            PROG_vcpu_pagetables,
> -            PROG_xen,
> -            PROG_l4,
> -            PROG_l3,
> -            PROG_l2,
> -            PROG_done,
> -        };
> -
>      case 0:
>          ret = pci_release_devices(d);
>          if ( ret )
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 6abfd81621..4fd0cc163d 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1135,6 +1135,7 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
>      struct irq_desc *desc = data;
>      unsigned int i, irq = desc - irq_desc;
>      irq_guest_action_t *action;
> +    cpumask_t *cpu_eoi_map;
>  
>      spin_lock_irq(&desc->lock);
>      
> @@ -1169,8 +1170,6 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
>  
>      switch ( action->ack_type )
>      {
> -        cpumask_t *cpu_eoi_map;

It is only used by case ACKTYPE_EOI so it can be moved there (with a new
block):


    case ACKTYPE_EOI:
    {
        cpumask_t *cpu_eoi_map = this_cpu(scratch_cpumask);
        cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
        spin_unlock_irq(&desc->lock);
        on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
        return;
    }
    }


>      case ACKTYPE_UNMASK:
>          if ( desc->handler->end )
>              desc->handler->end(desc, 0);
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index ecf126566d..0e61e0fe4e 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -335,11 +335,10 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>      const struct cpu_policy *cp = d->arch.cpu_policy;
>      struct vcpu_msrs *msrs = v->arch.msrs;
>      int ret = X86EMUL_OKAY;
> +    uint64_t rsvd;
>  
>      switch ( msr )
>      {
> -        uint64_t rsvd;
> -

It is only used by case MSR_INTEL_MISC_FEATURES_ENABLES so it can be
moved there


>          /* Read-only */
>      case MSR_IA32_PLATFORM_ID:
>      case MSR_CORE_CAPABILITIES:
> -- 
> 2.34.1
> 

