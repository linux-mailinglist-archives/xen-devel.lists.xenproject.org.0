Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPX8M0ZecmnbjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:28:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE7B6B471
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211663.1523159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyTe-0003ml-3s; Thu, 22 Jan 2026 17:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211663.1523159; Thu, 22 Jan 2026 17:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyTe-0003kb-0q; Thu, 22 Jan 2026 17:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1211663;
 Thu, 22 Jan 2026 17:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHxm=73=bounce.vates.tech=bounce-md_30504962.69725e28.v1-8cd8f511eebb4c29940059645c0d1088@srs-se1.protection.inumbo.net>)
 id 1viyTc-0003kV-Qi
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:28:12 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8626e57-f7b7-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:28:10 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4dxp1N4Gl0zK5vjPv
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 17:28:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8cd8f511eebb4c29940059645c0d1088; Thu, 22 Jan 2026 17:28:08 +0000
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
X-Inumbo-ID: b8626e57-f7b7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769102888; x=1769372888;
	bh=2CJFtNoeEnYzJ4IdD/VPYcKwKjBorNmJNo2sQS6vEb4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=U3OPOP6F/IikCUMKeHQAQG5eQjVeUN7jtWnXZP9bYJfZ70DWG9/2Mby2b1TkhySrz
	 SNYAtyFiqwXeFzj7p8p2sLN+taVJIg1LhPQgIkkHL58Od3OkSLf5S1HTZyCvhZS9f0
	 TAVF5diLtCrmMwKULy+mhjnPayaB93b7w9neYtwlNPcvSrENPaLMNovd5DPoo6QiP5
	 EgTER/dKqKGRuLFIevKqjkbH/DTxLFIQu+Hs9XPHm3ZeE+5i4r8l0FNDQMptBnAYNZ
	 DOnRUAkVHGTfkU7S63frsCnAQ1PuUasCkFxIgl6tsSgLmhWvf9k6xIJQchsma/pExa
	 54eFT49FLXhoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769102888; x=1769363388; i=teddy.astie@vates.tech;
	bh=2CJFtNoeEnYzJ4IdD/VPYcKwKjBorNmJNo2sQS6vEb4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XkHuV7vhjQlzcKDiF0/XFBJhMoVFwZM0Lv5QR4tcWo0A1uzdHXbxPzRMq99Tem+Mg
	 3WSh/E9GDmr7F2H3oF7mSEkcTu1oWi1Pl7g4340TdJ2cy/PQq4dl2qXAWCUQHF5xzu
	 jwtPNrAm+qk9YTqsLynvZgfzUJvElYw+vLBrEnFoAOBMNiy7SMfZbpanfRnLT9Ltu3
	 u1ELC88ygWPFbuz+++E5YFOQbUyy9H7zAMUiT/qaEdLaeKkTklVFcIn9cMiNmRmiHR
	 6dAreAdj1sjo2a6H/fbEg9bVxol6NmmGqCkt8Sw3l7M+5IT/iIOuszuyf69NgXGjQD
	 UmV0+PNLTNxPw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/4]=20x86/hvm:=20Disable=20non-FEP=20cross-vendor=20handling=20in=20#UD=20handler?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769102887179
Message-Id: <fddfdc4a-3199-499a-9fe6-4d78dc2003de@vates.tech>
To: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com> <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8cd8f511eebb4c29940059645c0d1088?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260122:md
Date: Thu, 22 Jan 2026 17:28:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.894];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3FE7B6B471
X-Rspamd-Action: no action

Le 22/01/2026 =C3=A0 17:52, Alejandro Vallejo a =C3=A9crit=C2=A0:
> Remove cross-vendor support now that VMs can no longer have a different
> vendor than the host, leaving FEP as the sole raison-d'=C3=AAtre for #UD
> interception.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   xen/arch/x86/hvm/hvm.c     | 25 ++++---------------------
>   xen/arch/x86/hvm/svm/svm.c |  4 ++--
>   xen/arch/x86/hvm/vmx/vmx.c |  4 ++--
>   3 files changed, 8 insertions(+), 25 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 4d37a93c57..611ff83a60 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3832,28 +3832,13 @@ int hvm_descriptor_access_intercept(uint64_t exit=
_info,
>       return X86EMUL_OKAY;
>   }
>   
> -static bool cf_check is_cross_vendor(
> -    const struct x86_emulate_state *state, const struct x86_emulate_ctxt=
 *ctxt)
> -{
> -    switch ( ctxt->opcode )
> -    {
> -    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
> -    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
> -    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
> -        return true;
> -    }
> -
> -    return false;
> -}
> -
> +#ifdef CONFIG_HVM_FEP

I'm not sure it is wise to put it being ifdef given that we have it in 
support.h.

Given that this function now assume we have FEP enabled (since it's only 
called in that case), I think we should rename it to reflect that, like 
"hvm_fep_intercept" and drop the non-FEP logic.

>   void hvm_ud_intercept(struct cpu_user_regs *regs)
>   {
>       struct vcpu *cur =3D current;
> -    bool should_emulate =3D
> -        cur->domain->arch.cpuid->x86_vendor !=3D boot_cpu_data.x86_vendo=
r;
>       struct hvm_emulate_ctxt ctxt;
>   
> -    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, r=
egs);
> +    hvm_emulate_init_once(&ctxt, NULL, regs);
>   
>       if ( opt_hvm_fep )
>       {
> @@ -3878,12 +3863,9 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
>                   regs->rip =3D (uint32_t)regs->rip;
>   
>               add_taint(TAINT_HVM_FEP);
> -
> -            should_emulate =3D true;
>           }
>       }
> -
> -    if ( !should_emulate )
> +    else
>       {
>           hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>           return;
> @@ -3903,6 +3885,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
>           break;
>       }
>   }
> +#endif /* CONFIG_HVM_FEP */
>   
>   enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack=
 intack)
>   {
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738..0658ca990f 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -589,8 +589,7 @@ static void cf_check svm_cpuid_policy_changed(struct =
vcpu *v)
>       const struct cpu_policy *cp =3D v->domain->arch.cpu_policy;
>       u32 bitmap =3D vmcb_get_exception_intercepts(vmcb);
>   
> -    if ( opt_hvm_fep ||
> -         (v->domain->arch.cpuid->x86_vendor !=3D boot_cpu_data.x86_vendo=
r) )
> +    if ( opt_hvm_fep )
>           bitmap |=3D (1U << X86_EXC_UD);
>       else
>           bitmap &=3D ~(1U << X86_EXC_UD);
> @@ -2810,6 +2809,7 @@ void asmlinkage svm_vmexit_handler(void)
>           break;
>   
>       case VMEXIT_EXCEPTION_UD:
> +        BUG_ON(!IS_ENABLED(CONFIG_HVM_FEP));
>           hvm_ud_intercept(regs);
>           break;
>   
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 40e4c71244..34e988ee61 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -797,8 +797,7 @@ static void cf_check vmx_cpuid_policy_changed(struct =
vcpu *v)
>       const struct cpu_policy *cp =3D v->domain->arch.cpu_policy;
>       int rc =3D 0;
>   
> -    if ( opt_hvm_fep ||
> -         (v->domain->arch.cpuid->x86_vendor !=3D boot_cpu_data.x86_vendo=
r) )
> +    if ( opt_hvm_fep )
>           v->arch.hvm.vmx.exception_bitmap |=3D (1U << X86_EXC_UD);
>       else
>           v->arch.hvm.vmx.exception_bitmap &=3D ~(1U << X86_EXC_UD);
> @@ -4576,6 +4575,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_=
regs *regs)
>               /* Already handled above. */
>               break;
>           case X86_EXC_UD:
> +            BUG_ON(!IS_ENABLED(CONFIG_HVM_FEP));
>               TRACE(TRC_HVM_TRAP, vector);
>               hvm_ud_intercept(regs);
>               break;



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



