Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFCNEkS0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6532482CC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208896.1521027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBdV-0003qB-00; Tue, 20 Jan 2026 13:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208896.1521027; Tue, 20 Jan 2026 13:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBdU-0003nO-TW; Tue, 20 Jan 2026 13:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1208896;
 Tue, 20 Jan 2026 13:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xHLI=7Z=bounce.vates.tech=bounce-md_30504962.696f80c4.v1-05aa0d6be7e14def852090f37a81eab6@srs-se1.protection.inumbo.net>)
 id 1viBdT-0003Jg-10
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:19:07 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 959bbeb5-f602-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 14:19:01 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dwSZr22GyzBsV0KN
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 13:19:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 05aa0d6be7e14def852090f37a81eab6; Tue, 20 Jan 2026 13:19:00 +0000
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
X-Inumbo-ID: 959bbeb5-f602-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768915140; x=1769185140;
	bh=WkIIMde5sciFLIx0qV4+ykvVAFvf3u+QJqei95/bfSo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=N1asEcGt7zOkrCZk1XnFFUbAwoy0KbKcVebgJSLeWnuFxezJgfFdEYXx1AMSkD9xS
	 E1o3iNInE47UaKEYRUIy53wE1H/nUC7RLXSK0ON7qhSMGVZGWGPHon7n7nyf2IPpuh
	 HZna6uS8NmS/AOeezuwxSqW8jeV6MFdAP+mTid94zute8/dBCLuoC4FYfE7ZUgqzOJ
	 MFitjt9PW2JxxgLk9Sd8BbdpXc/h6ifZAoPPwL28WeS85CFXAXWrWUvn2quHdSXYYQ
	 bHbId7MAhIcKa6kdgojdDz6wM5Kygj98whxrTrYEnzVTFEgYDw3/nZvPBMqqPZC/1c
	 cYYgCoVjERjeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768915140; x=1769175640; i=teddy.astie@vates.tech;
	bh=WkIIMde5sciFLIx0qV4+ykvVAFvf3u+QJqei95/bfSo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e6JYbsKSD6rYwZ4aIZEM4+IhyjcTFqp0m2cPFrDlvZhdKoEkxYcJ6kg8i8gMotiwC
	 v7bdURTQbHlSK9XW5iYcXLBG1BBcc9mbwPwSejllBzlyYQ7Eawfx6BbFnclOa9Puij
	 biWbolcxyCF4sQyPpyZR4+3MDug0dNKsnifz8AaFNFsoU13TvApnIBQnbWNtpeA0CI
	 Era6Kc4wLrNrmn1F//3iLItI5iysiXmMiA9qCWO06MCGiSVI2JqyIFiWXLBr7vVoDu
	 R0Dx/Aj42+a85mTvilJd2mbMeiyoJW3S/AjpEoE+L6x1yg0DRJ64ZyGgFb/3NHwzwX
	 058ssLy36s8cg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20x86/svm:=20Add=20infrastructure=20for=20Bus=20Lock=20Threshold?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768915138738
Message-Id: <9097240c-a892-41e8-a686-b89d84d0c03f@vates.tech>
To: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com> <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
In-Reply-To: <20260120095353.2778-2-alejandro.garciavallejo@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.05aa0d6be7e14def852090f37a81eab6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260120:md
Date: Tue, 20 Jan 2026 13:19:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:email,vates.tech:dkim,vates.tech:mid,vates.tech:url,mandrillapp.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C6532482CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Le 20/01/2026 =C3=A0 10:56, Alejandro Vallejo a =C3=A9crit=C2=A0:
> Add missing scaffolding to enable BusLock Threshold. That is:
> 
>    * Add general_intercepts_3.
>    * Add missing VMEXIT
>    * Adjust NPF perf counter base to immediately after the buslock counte=
r
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   xen/arch/x86/hvm/svm/svm.c            |  1 +
>   xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
>   xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
>   xen/arch/x86/include/asm/perfc_defn.h |  2 +-
>   4 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 5d23603fc1..9748df87d8 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm(=
void)
>       P(cpu_has_tsc_ratio, "TSC Rate MSR");
>       P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
>       P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
> +    P(cpu_has_bus_lock_thresh, "BusLock-Intercept Filter");
>   #undef P
>   
>       if ( !printed )
> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
> index ba554a9644..85e194f247 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -65,6 +65,11 @@ enum GenericIntercept2bits
>       GENERAL2_INTERCEPT_RDPRU   =3D 1 << 14,
>   };
>   
> +/* general 2 intercepts */

nit, you want to says general 3 intercepts

> +enum GenericIntercept3bits
> +{
> +    GENERAL3_INTERCEPT_BUS_LOCK_THRESH =3D 1 << 5,
> +};
>   
>   /* control register intercepts */
>   enum CRInterceptBits
> @@ -289,6 +294,7 @@ enum VMEXIT_EXITCODE
>       VMEXIT_MWAIT_CONDITIONAL=3D 140, /* 0x8c */
>       VMEXIT_XSETBV           =3D 141, /* 0x8d */
>       VMEXIT_RDPRU            =3D 142, /* 0x8e */
> +    VMEXIT_BUSLOCK          =3D 165, /* 0xa5 */
>       /* Remember to also update VMEXIT_NPF_PERFC! */
>       VMEXIT_NPF              =3D 1024, /* 0x400, nested paging fault */
>       /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
> @@ -405,7 +411,8 @@ struct vmcb_struct {
>       u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
>       u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
>       u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
> -    u32 res01[10];
> +    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
> +    u32 res01[9];
>       u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
>       u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
>       u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
> @@ -489,7 +496,10 @@ struct vmcb_struct {
>       u64 nextrip;                /* offset 0xC8 */
>       u8  guest_ins_len;          /* offset 0xD0 */
>       u8  guest_ins[15];          /* offset 0xD1 */
> -    u64 res10a[100];            /* offset 0xE0 pad to save area */
> +    u64 res10a[8];              /* offset 0xE0 */
> +    u16 bus_lock_thresh;        /* offset 0x120 */
> +    u16 res10b[3];              /* offset 0x122 */
> +    u64 res10c[91];             /* offset 0x128 pad to save area */
>   
>       union {
>           struct segment_register sreg[6];
> @@ -583,6 +593,7 @@ VMCB_ACCESSORS(dr_intercepts, intercepts)
>   VMCB_ACCESSORS(exception_intercepts, intercepts)
>   VMCB_ACCESSORS(general1_intercepts, intercepts)
>   VMCB_ACCESSORS(general2_intercepts, intercepts)
> +VMCB_ACCESSORS(general3_intercepts, intercepts)
>   VMCB_ACCESSORS(pause_filter_count, intercepts)
>   VMCB_ACCESSORS(pause_filter_thresh, intercepts)
>   VMCB_ACCESSORS(tsc_offset, intercepts)
> diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/as=
m/hvm/svm.h
> index a6d7e4aed3..14fe4abf96 100644
> --- a/xen/arch/x86/include/asm/hvm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm.h
> @@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
>   #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
>   #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>   #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
> +#define SVM_FEATURE_BUS_LOCK_THRESH 29 /* Bus Lock Threshold */
>   
>   static inline bool cpu_has_svm_feature(unsigned int feat)
>   {
> @@ -56,6 +57,7 @@ static inline bool cpu_has_svm_feature(unsigned int fea=
t)
>   #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE=
)
>   #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
>   #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL=
)
> +#define cpu_has_bus_lock_thresh cpu_has_svm_feature(SVM_FEATURE_BUS_LOCK=
_THRESH)
>   
>   #define MSR_INTERCEPT_NONE    0
>   #define MSR_INTERCEPT_READ    1
> diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include=
/asm/perfc_defn.h
> index d6127cb91e..ac7439b992 100644
> --- a/xen/arch/x86/include/asm/perfc_defn.h
> +++ b/xen/arch/x86/include/asm/perfc_defn.h
> @@ -7,7 +7,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
>   #ifdef CONFIG_HVM
>   
>   #define VMX_PERF_EXIT_REASON_SIZE 76
> -#define VMEXIT_NPF_PERFC 143
> +#define VMEXIT_NPF_PERFC 166
>   #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
>   PERFCOUNTER_ARRAY(vmexits,              "vmexits",
>                     MAX(VMX_PERF_EXIT_REASON_SIZE, SVM_PERF_EXIT_REASON_S=
IZE))

With that changed, Reviewed-by: Teddy Astie <teddy.astie@vates.tech>



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



