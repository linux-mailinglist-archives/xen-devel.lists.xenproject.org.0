Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCiVEgZcc2l3vAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 12:31:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B975072
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 12:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212167.1523457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFNM-0002il-PP; Fri, 23 Jan 2026 11:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212167.1523457; Fri, 23 Jan 2026 11:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFNM-0002gl-Li; Fri, 23 Jan 2026 11:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1212167;
 Fri, 23 Jan 2026 11:30:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NUfr=74=bounce.vates.tech=bounce-md_30504962.69735be7.v1-b308e68c6caf4ee09e101bfa99c0b2fb@srs-se1.protection.inumbo.net>)
 id 1vjFNL-0002gF-Cw
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 11:30:51 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e44bbf-f84e-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 12:30:48 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4dyG2b3xrqzK5vgs0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jan 2026 11:30:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b308e68c6caf4ee09e101bfa99c0b2fb; Fri, 23 Jan 2026 11:30:47 +0000
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
X-Inumbo-ID: f6e44bbf-f84e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769167847; x=1769437847;
	bh=EtaiHdgsUpgJN+DDre9rKBu2dtw8GLJBaLQ9+Wfn8bo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UdFZ+BsAzAZwus3QWmJ4SFsnpukN8XYSw9m++rx1/ffPT3p0bU+/3UIstQ0+v+Ugw
	 0HevpFsonVgcBQNAVoCVB2a6LRX7JZArLOfCTrlTO7LwoToxnyz7BPim8bCFLSpKFZ
	 SYYlmSQgH00bjf8hsSuirJkkv3tbT+J5F4EhdgJq+wxy9k+Glj7wIIPIBDtRCVQUbG
	 J7YiC6h0mgzXdnIMsnaEYcoY+lpC3+9q2AzoyZVFw6cf85oV6BmBTs5TCESEzydUTa
	 PWBhfS4gCnSQnVPJmRj77agO47ogk2WNjEerO8YaqQupGYdwwmrP1fK8zILvVutrD3
	 HMqHau16aG3nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769167847; x=1769428347; i=teddy.astie@vates.tech;
	bh=EtaiHdgsUpgJN+DDre9rKBu2dtw8GLJBaLQ9+Wfn8bo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zqHmPxns7041za8nBsoPLW+TggaRVSD9cTD0QgP5Odw7gF5X4EFXYDVZnz2aIO1ij
	 kdQ090h91O0hHCecGikWJeqozUa/HWxAsr5m9rQF3FyQLsyYlEeF8IpfoX75nKCvDR
	 4b+vJ9/TH6EsOnlSMmgsyIeemIN23nuWty8fJHhBwLVXZoCTm2bySQa1w6Tse5cufI
	 Yp9AG5yLQAnfE9Fqs2IX6793ivkRe1C/PqNkTSaX9Oz7tEUeiwLTFNmohdu3tDOO/F
	 ikBnnn3Mk1hGB4m0KGvYfQVhX8FKhcBvrd2Mh9VoY0X/zVlGTis2IwXR21KLr+bote
	 2qaSi2WEEAIZA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2002/16]=20xen/riscv:=20implement=20arch=5Fvcpu=5F{create,destroy}()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769167845821
Message-Id: <4e2bf819-81f6-40f8-9bc3-c53aabf0967c@vates.tech>
To: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Romain Caritey" <Romain.Caritey@microchip.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com> <08b582179ebc4241140000972d89209c84c90fa4.1769099885.git.oleksii.kurochko@gmail.com>
In-Reply-To: <08b582179ebc4241140000972d89209c84c90fa4.1769099885.git.oleksii.kurochko@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b308e68c6caf4ee09e101bfa99c0b2fb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260123:md
Date: Fri, 23 Jan 2026 11:30:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:url,vates.tech:mid];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.985];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6D6B975072
X-Rspamd-Action: no action

Hello,

Le 22/01/2026 =C3=A0 17:49, Oleksii Kurochko a =C3=A9crit=C2=A0:
> Introduce architecture-specific functions to create and destroy VCPUs.
> Note that arch_vcpu_create() currently returns -EOPNOTSUPP, as the virtua=
l
> timer and interrupt controller are not yet implemented.
> 
> As part of this change, add continue_new_vcpu(), which will be used after
> the first context_switch() of a new vCPU. Since this functionality is not
> yet implemented, continue_new_vcpu() is currently provided as a stub.
> 
> Update the STACK_SIZE definition and introduce STACK_ORDER (to align with
> other architectures) for allocating the vCPU stack.
> 
> Introduce struct cpu_info to store per-vCPU state that lives at the top
> of the vCPU's stack.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>   - Drop BUILD_BUG_ON() in arch_vcpu_create() as a check isn't very usefu=
l.
>   - Use vzalloc() instead of alloc_xenheap_page() to use the larger domhe=
ap to
>     allocate vCPU's stack.
>   - Drop printk() inside arch_vcpu_create() to not have potential big noi=
se
>     in console as it could be that an amount of vCPUs is pretty big.
>   - Use XVFREE() instead of free_xenheap_pages() as vCPU's stack allocati=
on
>     happens with a usage of vzalloc() now.
>   - Drop stack field as it is enough to have only cpu_info as stack point=
er
>     could be calculated based on cpu_info.
>   - Drop cast when v.arch.cpu_info is inialized as it is not necessary
>          to have it.
>   - Drop memset() for arch.cpu_info() as it is enough to have vzalloc().
> ---
>   xen/arch/riscv/Makefile              |  1 +
>   xen/arch/riscv/domain.c              | 59 ++++++++++++++++++++++++++++
>   xen/arch/riscv/include/asm/config.h  |  3 +-
>   xen/arch/riscv/include/asm/current.h |  6 +++
>   xen/arch/riscv/include/asm/domain.h  |  2 +
>   xen/arch/riscv/stubs.c               | 10 -----
>   6 files changed, 70 insertions(+), 11 deletions(-)
>   create mode 100644 xen/arch/riscv/domain.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 87c1148b0010..8863d4b15605 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>   obj-y +=3D aplic.o
>   obj-y +=3D cpufeature.o
> +obj-y +=3D domain.o
>   obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
>   obj-y +=3D entry.o
>   obj-y +=3D imsic.o
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> new file mode 100644
> index 000000000000..9c546267881b
> --- /dev/null
> +++ b/xen/arch/riscv/domain.c
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <xen/mm.h>
> +#include <xen/sched.h>
> +#include <xen/vmap.h>
> +
> +static void continue_new_vcpu(struct vcpu *prev)
> +{
> +    BUG_ON("unimplemented\n");
> +}
> +
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /*
> +     * Enforce the requirement documented in struct cpu_info that
> +     * guest_cpu_user_regs must be the first field.
> +     */
> +    BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs) !=3D 0);
> +}
> +
> +int arch_vcpu_create(struct vcpu *v)
> +{
> +    int rc =3D 0;
> +    void *stack =3D vzalloc(STACK_SIZE);
> +

Are there alignment constraints for the stack ?

> +    if ( !stack )
> +        return -ENOMEM;
> +
> +    v->arch.cpu_info =3D stack + STACK_SIZE - sizeof(struct cpu_info);
> +    memset(v->arch.cpu_info, 0, sizeof(*v->arch.cpu_info));
> +

Given that vzalloc ensures that the memory is cleared, you don't need to 
clear it another time.

> +    v->arch.xen_saved_context.sp =3D (register_t)v->arch.cpu_info;
> +    v->arch.xen_saved_context.ra =3D (register_t)continue_new_vcpu;
> +

You probably also want to set the first parameter of continue_new_vcpu 
(struct vcpu *prev), or otherwise I don't think we want the "prev" 
parameter in continue_new_vcpu if it's always going to be 0.

IIRC continue_new_vcpu is only meant to bootstrap the new vCPU, not just 
perform a context switch to it.

> +    /* Idle VCPUs don't need the rest of this setup */
> +    if ( is_idle_vcpu(v) )
> +        return rc;
> +
> +    /*
> +     * As the vtimer and interrupt controller (IC) are not yet implement=
ed,
> +     * return an error.
> +     *
> +     * TODO: Drop this once the vtimer and IC are implemented.
> +     */
> +    rc =3D -EOPNOTSUPP;
> +    goto fail;
> +
> +    return rc;
> +
> + fail:
> +    arch_vcpu_destroy(v);
> +    return rc;
> +}
> +
> +void arch_vcpu_destroy(struct vcpu *v)
> +{
> +    vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info));
> +}

That doesn't look correct, you want to vfree what was allocated as the 
bottom of stack, i.e

v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE

Or alternatively introduce bottom of stack as a additional vcpu_arch field.

> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include=
/asm/config.h
> index 1e08d3bf78be..86a95df018b5 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -143,7 +143,8 @@
>   
>   #define SMP_CACHE_BYTES (1 << 6)
>   
> -#define STACK_SIZE PAGE_SIZE
> +#define STACK_ORDER 3
> +#define STACK_SIZE (PAGE_SIZE << STACK_ORDER)
>   
>   #define IDENT_AREA_SIZE 64
>   
> diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/includ=
e/asm/current.h
> index 0c3ea70c2ec8..58c9f1506b7c 100644
> --- a/xen/arch/riscv/include/asm/current.h
> +++ b/xen/arch/riscv/include/asm/current.h
> @@ -21,6 +21,12 @@ struct pcpu_info {
>   /* tp points to one of these */
>   extern struct pcpu_info pcpu_info[NR_CPUS];
>   
> +/* Per-VCPU state that lives at the top of the stack */
> +struct cpu_info {
> +    /* This should be the first member. */
> +    struct cpu_user_regs guest_cpu_user_regs;
> +};
> +
>   #define set_processor_id(id)    do { \
>       tp->processor_id =3D (id);         \
>   } while (0)
> diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include=
/asm/domain.h
> index 0d9b4c4b525e..ec7786c76199 100644
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -49,6 +49,8 @@ struct arch_vcpu
>           register_t ra;
>       } xen_saved_context;
>   
> +    struct cpu_info *cpu_info;
> +
>       /* CSRs */
>       register_t hedeleg;
>       register_t hideleg;
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 29bdb65afbdf..9e30a9a3b50b 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -121,16 +121,6 @@ void dump_pageframe_info(struct domain *d)
>       BUG_ON("unimplemented");
>   }
>   
> -int arch_vcpu_create(struct vcpu *v)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
> -void arch_vcpu_destroy(struct vcpu *v)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
>   void vcpu_switch_to_aarch64_mode(struct vcpu *v)
>   {
>       BUG_ON("unimplemented");



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



