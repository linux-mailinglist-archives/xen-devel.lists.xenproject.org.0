Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FHpL/VjcmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:52:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C626BBDA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211777.1523258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyrF-00051d-AB; Thu, 22 Jan 2026 17:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211777.1523258; Thu, 22 Jan 2026 17:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyrF-0004zX-7Y; Thu, 22 Jan 2026 17:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1211777;
 Thu, 22 Jan 2026 17:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZU2=73=bounce.vates.tech=bounce-md_30504962.697263df.v1-7089f4cc05dc4590a2b89501733fc802@srs-se1.protection.inumbo.net>)
 id 1viyrD-0004zR-SI
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:52:35 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20ba887c-f7bb-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 18:52:33 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4dxpYW5KbzzK5vgYq
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 17:52:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7089f4cc05dc4590a2b89501733fc802; Thu, 22 Jan 2026 17:52:31 +0000
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
X-Inumbo-ID: 20ba887c-f7bb-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769104351; x=1769374351;
	bh=jDz1kCRPSCjxFunO8fX8LckS3KZrAMoSwm9tsDuQVEI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lhY7tfovkwgz4u5hTr6ovJ/hX4O7o+6Vv9oM576jLowNw/5nyPzhU92oTGpOFKXsI
	 yckXMUwMrtTxTNUViG8tXybh6EbKPl3YArrctEcevkDGEwslTEckEdQamK9NrN5PHa
	 TnPU+lmRXYWihhJOig/QkQuCWkcXdZ77VL9KcCIwwn96x/zqOEeIVnUntzP+RJM0+x
	 O5qBD9gipvDkMQ9yFe2E9zH1nBhG3Mu+sJSVpLsmz9Iq6M7N69vhIqeCyJ2SB2Q/Pu
	 z/zhdKXrD+zWcRidgZLbPtlNu01/xvzMPwOie7VhgSovECDpaHweqECgqSZTHkZ+Xu
	 ti2Os1PcicwiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769104351; x=1769364851; i=teddy.astie@vates.tech;
	bh=jDz1kCRPSCjxFunO8fX8LckS3KZrAMoSwm9tsDuQVEI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=N2UnO3T+Mzyj7sM5bQoPo9ZXs5G8kZ9nQBsE9kgdrAO2YCkSspSODxbz3Q8p2p9d3
	 p8IE79xP3JgNKwTAx3aCJYsS68z7GIb1hXompHGiya5rIvht5Rkx2Eg5uqQqIGyuSR
	 DkrUbWTKRgg+jXSs/8OYlljdq9W4w5MdQ+Eohb3GEVHU/se7TntFlwvhBx7K13seZ4
	 6pjVReKVBEnwJTMwYpN6NZQMyhAlvoMznLKiBLs3KHYNmVVogh0Y675cXgbr3p9l5M
	 Xl2TYiQbcuMMdTjKMW/4o6EkybPrz8awXgg5Fhpwqo4/hG8kB7L9AiSb8VTCWGPWf/
	 X7fHTmmsTJhLQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=204/4]=20x86/svm:=20Drop=20emulation=20of=20Intel's=20SYSENTER=20behaviour?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769104350376
Message-Id: <8b0eed14-e35c-46b4-b414-1f0309a27a60@vates.tech>
To: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com> <20260122164943.20691-5-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260122164943.20691-5-alejandro.garciavallejo@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7089f4cc05dc4590a2b89501733fc802?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260122:md
Date: Thu, 22 Jan 2026 17:52:31 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.892];
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
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 30C626BBDA
X-Rspamd-Action: no action

Le 22/01/2026 =C3=A0 17:51, Alejandro Vallejo a =C3=A9crit=C2=A0:
> With cross-vendor support gone, it's no longer needed.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   xen/arch/x86/hvm/svm/svm.c               | 42 +++++++++++-------------
>   xen/arch/x86/hvm/svm/vmcb.c              |  3 ++
>   xen/arch/x86/include/asm/hvm/svm-types.h | 10 ------
>   3 files changed, 22 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 0658ca990f..e8f19dec04 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -401,10 +401,6 @@ static int svm_vmcb_save(struct vcpu *v, struct hvm_=
hw_cpu *c)
>   {
>       struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>   
> -    c->sysenter_cs =3D v->arch.hvm.svm.guest_sysenter_cs;
> -    c->sysenter_esp =3D v->arch.hvm.svm.guest_sysenter_esp;
> -    c->sysenter_eip =3D v->arch.hvm.svm.guest_sysenter_eip;
> -
>       if ( vmcb->event_inj.v &&
>            hvm_event_needs_reinjection(vmcb->event_inj.type,
>                                        vmcb->event_inj.vector) )
> @@ -468,11 +464,6 @@ static int svm_vmcb_restore(struct vcpu *v, struct h=
vm_hw_cpu *c)
>       svm_update_guest_cr(v, 0, 0);
>       svm_update_guest_cr(v, 4, 0);
>   
> -    /* Load sysenter MSRs into both VMCB save area and VCPU fields. */
> -    vmcb->sysenter_cs =3D v->arch.hvm.svm.guest_sysenter_cs =3D c->sysen=
ter_cs;
> -    vmcb->sysenter_esp =3D v->arch.hvm.svm.guest_sysenter_esp =3D c->sys=
enter_esp;
> -    vmcb->sysenter_eip =3D v->arch.hvm.svm.guest_sysenter_eip =3D c->sys=
enter_eip;
> -
>       if ( paging_mode_hap(v->domain) )
>       {
>           vmcb_set_np(vmcb, true);
> @@ -501,6 +492,9 @@ static void svm_save_cpu_state(struct vcpu *v, struct=
 hvm_hw_cpu *data)
>   {
>       struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>   
> +    data->sysenter_cs      =3D vmcb->sysenter_cs;
> +    data->sysenter_esp     =3D vmcb->sysenter_esp;
> +    data->sysenter_eip     =3D vmcb->sysenter_eip;
>       data->shadow_gs        =3D vmcb->kerngsbase;
>       data->msr_lstar        =3D vmcb->lstar;
>       data->msr_star         =3D vmcb->star;
> @@ -512,11 +506,14 @@ static void svm_load_cpu_state(struct vcpu *v, stru=
ct hvm_hw_cpu *data)
>   {
>       struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>   
> -    vmcb->kerngsbase =3D data->shadow_gs;
> -    vmcb->lstar      =3D data->msr_lstar;
> -    vmcb->star       =3D data->msr_star;
> -    vmcb->cstar      =3D data->msr_cstar;
> -    vmcb->sfmask     =3D data->msr_syscall_mask;
> +    vmcb->sysenter_cs  =3D data->sysenter_cs;
> +    vmcb->sysenter_esp =3D data->sysenter_esp;
> +    vmcb->sysenter_eip =3D data->sysenter_eip;
> +    vmcb->kerngsbase   =3D data->shadow_gs;
> +    vmcb->lstar        =3D data->msr_lstar;
> +    vmcb->star         =3D data->msr_star;
> +    vmcb->cstar        =3D data->msr_cstar;
> +    vmcb->sfmask       =3D data->msr_syscall_mask;
>       v->arch.hvm.guest_efer =3D data->msr_efer;
>       svm_update_guest_efer(v);
>   }

I think we should merge svm_save_cpu_state/svm_vmcb_save into 
svm_save_vmcb_ctxt and similarly for svm_load_cpu_state/svm_vmcb_restore 
into svm_load_vmcb_ctxt to avoid having multiple functions as a part of 
the same logic.

That could be done in a separate patch (or series).

> @@ -1720,12 +1717,9 @@ static int cf_check svm_msr_read_intercept(
>   
>       switch ( msr )
>       {
> -        /*
> -         * Sync not needed while the cross-vendor logic is in unilateral=
 effect.
>       case MSR_IA32_SYSENTER_CS:
>       case MSR_IA32_SYSENTER_ESP:
>       case MSR_IA32_SYSENTER_EIP:
> -         */
>       case MSR_STAR:
>       case MSR_LSTAR:
>       case MSR_CSTAR:
> @@ -1740,13 +1734,15 @@ static int cf_check svm_msr_read_intercept(
>       switch ( msr )
>       {
>       case MSR_IA32_SYSENTER_CS:
> -        *msr_content =3D v->arch.hvm.svm.guest_sysenter_cs;
> +        *msr_content =3D vmcb->sysenter_cs;
>           break;
> +
>       case MSR_IA32_SYSENTER_ESP:
> -        *msr_content =3D v->arch.hvm.svm.guest_sysenter_esp;
> +        *msr_content =3D vmcb->sysenter_esp;
>           break;
> +
>       case MSR_IA32_SYSENTER_EIP:
> -        *msr_content =3D v->arch.hvm.svm.guest_sysenter_eip;
> +        *msr_content =3D vmcb->sysenter_eip;
>           break;
>   
>       case MSR_STAR:
> @@ -1940,11 +1936,11 @@ static int cf_check svm_msr_write_intercept(
>           switch ( msr )
>           {
>           case MSR_IA32_SYSENTER_ESP:
> -            vmcb->sysenter_esp =3D v->arch.hvm.svm.guest_sysenter_esp =
=3D msr_content;
> +            vmcb->sysenter_esp =3D msr_content;
>               break;
>   
>           case MSR_IA32_SYSENTER_EIP:
> -            vmcb->sysenter_eip =3D v->arch.hvm.svm.guest_sysenter_eip =
=3D msr_content;
> +            vmcb->sysenter_eip =3D msr_content;
>               break;

>   
>           case MSR_LSTAR:
> @@ -1970,7 +1966,7 @@ static int cf_check svm_msr_write_intercept(
>           break;
>   
>       case MSR_IA32_SYSENTER_CS:
> -        vmcb->sysenter_cs =3D v->arch.hvm.svm.guest_sysenter_cs =3D msr_=
content;
> +        vmcb->sysenter_cs =3D msr_content;
>           break;
>   
>       case MSR_STAR:
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index e583ef8548..76fcaf15c2 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -97,6 +97,9 @@ static int construct_vmcb(struct vcpu *v)
>       svm_disable_intercept_for_msr(v, MSR_LSTAR);
>       svm_disable_intercept_for_msr(v, MSR_STAR);
>       svm_disable_intercept_for_msr(v, MSR_SYSCALL_MASK);
> +    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_CS);
> +    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_EIP);
> +    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_ESP);
>   
>       vmcb->_msrpm_base_pa =3D virt_to_maddr(svm->msrpm);
>       vmcb->_iopm_base_pa =3D __pa(v->domain->arch.hvm.io_bitmap);
> diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/incl=
ude/asm/hvm/svm-types.h
> index 051b235d8f..aaee91b4b6 100644
> --- a/xen/arch/x86/include/asm/hvm/svm-types.h
> +++ b/xen/arch/x86/include/asm/hvm/svm-types.h
> @@ -27,16 +27,6 @@ struct svm_vcpu {
>   
>       /* VMCB has a cached instruction from #PF/#NPF Decode Assist? */
>       uint8_t cached_insn_len; /* Zero if no cached instruction. */
> -
> -    /*
> -     * Upper four bytes are undefined in the VMCB, therefore we can't us=
e the
> -     * fields in the VMCB. Write a 64bit value and then read a 64bit val=
ue is
> -     * fine unless there's a VMRUN/VMEXIT in between which clears the up=
per
> -     * four bytes.
> -     */
> -    uint64_t guest_sysenter_cs;
> -    uint64_t guest_sysenter_esp;
> -    uint64_t guest_sysenter_eip;
>   };
>   
>   struct nestedsvm {

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



