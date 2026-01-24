Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id X3QTIapQdWmEDwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jan 2026 00:07:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD97F2D4
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jan 2026 00:07:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213014.1523757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjmMY-0005Be-9j; Sat, 24 Jan 2026 22:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213014.1523757; Sat, 24 Jan 2026 22:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjmMY-00058d-2A; Sat, 24 Jan 2026 22:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1213014;
 Sat, 24 Jan 2026 22:44:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyvC=75=bounce.vates.tech=bounce-md_30504962.69754b38.v1-22b6ef355cc64e5f95c652d1ed21de65@srs-se1.protection.inumbo.net>)
 id 1vjmMW-00058X-JG
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 22:44:12 +0000
Received: from mail137-14.atl71.mandrillapp.com
 (mail137-14.atl71.mandrillapp.com [198.2.137.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 326671cd-f976-11f0-b15f-2bf370ae4941;
 Sat, 24 Jan 2026 23:44:10 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-14.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dz8x44ckfz705bKY
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jan 2026 22:44:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 22b6ef355cc64e5f95c652d1ed21de65; Sat, 24 Jan 2026 22:44:08 +0000
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
X-Inumbo-ID: 326671cd-f976-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769294648; x=1769564648;
	bh=4mQlw4NYHLnoMJjZf6lpMFq/9uu7VZMQDiPnuC7kldI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=heyCuxPvz+HsQ+UajWs+CrVXVp2TAP4pa8dpzT1QMGE4HffuTrmB7iROumHd/vrfv
	 tMxQwuRj4S8Id/BbIEXJ4aFeoylFc9hKJ7lcEbaNOHhzpEoQq5k51/qd4+Yk0UUNiF
	 zCi4VMyLZ69m3hJ1v5JFYyWeUhXzShDXitr2qT6suraOJ94P1zL+zpbMAP3Tef3zYg
	 mmScHi0TblUC+gz5Br0EXxBAdo9ejPge8mjyK0+qUYhOkr/xQdjnCE9PQACl2s1j71
	 8IobycMjk6wqyPP5RhXVIA1szL1N5fPYnMebjH4ZTniqLrI59fTyV1nDp941RZywsr
	 WCPobtzkwexyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769294648; x=1769555148; i=teddy.astie@vates.tech;
	bh=4mQlw4NYHLnoMJjZf6lpMFq/9uu7VZMQDiPnuC7kldI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rjCUVZ0cappviWvvdRoS5tjhlv1QpJkBfRLmOl6AnfNNPM2eJZ5bIaQZxMNY1cqPE
	 5vP3v+G5Y9lcIRy1de3GbcatpQyHh84NSnX8dYXCVXyeY7M8MGujClviN8CX3/NjTy
	 CQeNjb1RDE9r+KphZ2VBHtYIUrIBbIXWiAAtVCmkZORBPVo7daUA7KHNnjLPN8U3ZW
	 shwmXF1XGrTEU7fyghDFv9pIMcFuFQDMc2RKoy0cIvkSdqW07l/xPa8DjXcN9c/r9V
	 mlbe8sLakQRIpPN6xQldZraO2ozcQ8kQeaZX87t9UYSRcWlJ0Unv2bdNJKMMRKpjNT
	 /mOXkJigau+fw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2003/16]=20xen/riscv:=20implement=20vcpu=5Fcsr=5Finit()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769294646609
Message-Id: <99289a63-b4be-42f8-974b-7445a6a479dc@vates.tech>
To: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Romain Caritey" <Romain.Caritey@microchip.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com> <57ef3bcff854d4b50641641d300b3e8aa715c3c3.1769099885.git.oleksii.kurochko@gmail.com>
In-Reply-To: <57ef3bcff854d4b50641641d300b3e8aa715c3c3.1769099885.git.oleksii.kurochko@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.22b6ef355cc64e5f95c652d1ed21de65?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260124:md
Date: Sat, 24 Jan 2026 22:44:08 +0000
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
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:url,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	GREYLIST(0.00)[pass,body];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C1AD97F2D4
X-Rspamd-Action: no action

Le 22/01/2026 =C3=A0 17:49, Oleksii Kurochko a =C3=A9crit=C2=A0:
> Introduce vcpu_csr_init() to set up the initial hypervisor-visible CSR
> state for a vCPU before it is first scheduled.

To me, "hypervisor-visible CSR state" sounds like some state of the 
guest the hypervisor has view on. But to what I read, it's more 
hypervisor state CSRs regarding what to intercept and various 
virtualization behavior.

> The function configures trap and interrupt delegation to VS-mode by
> setting the appropriate bits in the hedeleg and hideleg registers,
> initializes hstatus so that execution enters VS-mode when control is
> passed to the guest, and restricts guest access to hardware performance
> counters by initializing hcounteren, as unrestricted access would
> require additional handling in Xen.
> When the Smstateen and SSAIA extensions are available, access to AIA
> CSRs and IMSIC guest interrupt files is enabled by setting the
> corresponding bits in hstateen0, avoiding unnecessary traps into Xen
> (note that SVSLCT(Supervisor Virtual Select) name is used intead of
> CSRIND as OpenSBI uses such name and riscv_encoding.h is mostly based
> on it).
> If the Svpbmt extension is supported, the PBMTE bit is set in
> henvcfg to allow its use for VS-stage address translation. Guest
> access to the ENVCFG CSR is also enabled by setting ENVCFG bit in
> hstateen0, as a guest may need to control certain characteristics of
> the U-mode (VU-mode when V=3D1) execution environment.
> 
> For CSRs that may contain read-only bits (e.g. hedeleg, hideleg,
> hstateen0), the written value is re-read from hardware and cached in
> vcpu->arch to avoid divergence between the software state and the actual
> CSR contents.
> 

AFAIU from RISC-V isa document, at least for some CSRs the read-only-0 
bits are well-defined and means "can't be configured" due to not having 
a meaning (e.g hedeleg defines as read-only "Environment call from 
HS-mode" because guest can't be in a "actual" HS-mode).

> As hstatus is not part of struct arch_vcpu (it already resides in
> struct cpu_user_regs), introduce vcpu_guest_cpu_user_regs() to provide
> a uniform way to access hstatus and other guest CPU user registers.
> 
> This establishes a consistent and well-defined initial CSR state for
> vCPUs prior to their first context switch.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>   - As hstatus isn't a part of arch_vcpu structure (as it is already a pa=
rt of
>     cpu_user_regs) introduce vcpu_guest_cpu_user_regs() to be able to acc=
ess
>     hstatus and other CPU user regs.

Sounds like hstatus wants to be splitted from guest_cpu_user_regs (which 
are supposed to be GPR ?).

>   - Sort hideleg bit setting by value. Drop a stray blank.
>   - Drop | when the first initialization of hcounteren and hennvcfg happe=
n.
>   - Introduce HEDELEG_DEFAULT. Sort set bits by value and use BIT() macro=
s
>     instead of open-coding it.
>   - Apply pattern csr_write() -> csr_read() for hedeleg and hideleg inste=
ad
>     of direct bit setting in v->arch.h{i,e}deleg as it could be that for =
some
>     reason some bits of hedeleg and hideleg are r/o.
>     The similar patter is used for hstateen0 as some of the bits could be=
 r/o.
>   - Add check that SSAIA is avaialable before setting of SMSTATEEN0_AIA |
>     SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT bits.
>   - Drop local variables hstatus, hideleg and hedeleg as they aren't used
>     anymore.
> ---
>   xen/arch/riscv/cpufeature.c                 |  1 +
>   xen/arch/riscv/domain.c                     | 73 +++++++++++++++++++++
>   xen/arch/riscv/include/asm/cpufeature.h     |  1 +
>   xen/arch/riscv/include/asm/current.h        |  2 +
>   xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
>   5 files changed, 79 insertions(+)
> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index 02b68aeaa49f..03e27b037be0 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -137,6 +137,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa=
_ext[] =3D {
>       RISCV_ISA_EXT_DATA(zbb),
>       RISCV_ISA_EXT_DATA(zbs),
>       RISCV_ISA_EXT_DATA(smaia),
> +    RISCV_ISA_EXT_DATA(smstateen),
>       RISCV_ISA_EXT_DATA(ssaia),
>       RISCV_ISA_EXT_DATA(svade),
>       RISCV_ISA_EXT_DATA(svpbmt),
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index 9c546267881b..3ae5fa3a8805 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -5,6 +5,77 @@
>   #include <xen/sched.h>
>   #include <xen/vmap.h>
>   
> +#include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +#include <asm/riscv_encoding.h>
> +
> +#define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
> +                         BIT(CAUSE_FETCH_ACCESS, U) | \
> +                         BIT(CAUSE_ILLEGAL_INSTRUCTION, U) | \
> +                         BIT(CAUSE_BREAKPOINT, U) | \
> +                         BIT(CAUSE_MISALIGNED_LOAD, U) | \
> +                         BIT(CAUSE_LOAD_ACCESS, U) | \
> +                         BIT(CAUSE_MISALIGNED_STORE, U) | \
> +                         BIT(CAUSE_STORE_ACCESS, U) | \
> +                         BIT(CAUSE_USER_ECALL, U) | \
> +                         BIT(CAUSE_FETCH_PAGE_FAULT, U) | \
> +                         BIT(CAUSE_LOAD_PAGE_FAULT, U) | \
> +                         BIT(CAUSE_STORE_PAGE_FAULT, U))
> +
> +#define HIDELEG_DEFAULT (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
> +
> +static void vcpu_csr_init(struct vcpu *v)
> +{
> +    register_t hstateen0;
> +
> +    csr_write(CSR_HEDELEG, HEDELEG_DEFAULT);
> +    v->arch.hedeleg =3D csr_read(CSR_HEDELEG);
> +
> +    vcpu_guest_cpu_user_regs(v)->hstatus =3D HSTATUS_SPV | HSTATUS_SPVP;
> +
> +    csr_write(CSR_HIDELEG, HIDELEG_DEFAULT);
> +    v->arch.hideleg =3D csr_read(CSR_HIDELEG);
> +

To me, that feels odd to set machine CSR here. Especially if (I guess) 
that we would update them anyway during context switches.

I think it would be better to have :
- vcpu_csr_init -> sets initial state CSR in vcpu structure, doesn't 
touch machine CSR
- context switching logic -> loads vcpu-specific machine CSR from vcpu 
structure

We would have to make a context switch to enter the vcpu for the first 
time; but that's to be expected.

With my proposal, we would also want to move the vcpu_csr_init() 
invocation to the place we initialize the vcpu_arch structure rather 
than the first time we schedule inside that vcpu.

That would also allow to take account of per-domain configuration if we 
need to (e.g feature flags).

> +    /*
> +     * VS should access only the time counter directly.
> +     * Everything else should trap.
> +     */
> +    v->arch.hcounteren =3D HCOUNTEREN_TM;
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
> +    {
> +        csr_write(CSR_HENVCFG, ENVCFG_PBMTE);
> +        v->arch.henvcfg =3D csr_read(CSR_HENVCFG);
> +    }
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +    {
> +         if (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia))
> +            /*
> +             * If the hypervisor extension is implemented, the same thre=
e
> +             * bitsare defined also in hypervisor CSR hstateen0 but conc=
ern
> +             * only the state potentially accessible to a virtual machin=
e
> +             * executing in privilege modes VS and VU:
> +             *      bit 60 CSRs siselect and sireg (really vsiselect and
> +             *             vsireg)
> +             *      bit 59 CSRs siph and sieh (RV32 only) and stopi (rea=
lly
> +             *             vsiph, vsieh, and vstopi)
> +             *      bit 58 all state of IMSIC guest interrupt files, inc=
luding
> +             *             CSR stopei (really vstopei)
> +             * If one of these bits is zero in hstateen0, and the same b=
it is
> +             * one in mstateen0, then an attempt to access the correspon=
ding
> +             * state from VS or VU-mode raises a virtual instruction exc=
eption.
> +             */
> +            hstateen0 =3D SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0=
_SVSLCT;
> +
> +        /* Allow guest to access CSR_ENVCFG */
> +        hstateen0 |=3D SMSTATEEN0_HSENVCFG;
> +
> +        csr_write(CSR_HSTATEEN0, hstateen0);
> +        v->arch.hstateen0 =3D csr_read(CSR_HSTATEEN0);
> +    }
> +}
> +
>   static void continue_new_vcpu(struct vcpu *prev)
>   {
>       BUG_ON("unimplemented\n");
> @@ -33,6 +104,8 @@ int arch_vcpu_create(struct vcpu *v)
>       v->arch.xen_saved_context.sp =3D (register_t)v->arch.cpu_info;
>       v->arch.xen_saved_context.ra =3D (register_t)continue_new_vcpu;
>   
> +    vcpu_csr_init(v);
> +
>       /* Idle VCPUs don't need the rest of this setup */
>       if ( is_idle_vcpu(v) )
>           return rc;
> diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/inc=
lude/asm/cpufeature.h
> index b69616038888..ef02a3e26d2c 100644
> --- a/xen/arch/riscv/include/asm/cpufeature.h
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -36,6 +36,7 @@ enum riscv_isa_ext_id {
>       RISCV_ISA_EXT_zbb,
>       RISCV_ISA_EXT_zbs,
>       RISCV_ISA_EXT_smaia,
> +    RISCV_ISA_EXT_smstateen,
>       RISCV_ISA_EXT_ssaia,
>       RISCV_ISA_EXT_svade,
>       RISCV_ISA_EXT_svpbmt,
> diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/includ=
e/asm/current.h
> index 58c9f1506b7c..5fbee8182caa 100644
> --- a/xen/arch/riscv/include/asm/current.h
> +++ b/xen/arch/riscv/include/asm/current.h
> @@ -48,6 +48,8 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
>   #define get_cpu_current(cpu)  per_cpu(curr_vcpu, cpu)
>   
>   #define guest_cpu_user_regs() ({ BUG_ON("unimplemented"); NULL; })
> +#define vcpu_guest_cpu_user_regs(vcpu) \
> +    (&(vcpu)->arch.cpu_info->guest_cpu_user_regs)
>   >   #define switch_stack_and_jump(stack, fn) do {               \
>       asm volatile (                                          \
> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv=
/include/asm/riscv_encoding.h
> index 1f7e612366f8..dd15731a86fa 100644
> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -228,6 +228,8 @@
>   #define ENVCFG_CBIE_INV=09=09=09_UL(0x3)
>   #define ENVCFG_FIOM=09=09=09_UL(0x1)
>   
> +#define HCOUNTEREN_TM BIT(1, U)
> +
>   /* =3D=3D=3D=3D=3D User-level CSRs =3D=3D=3D=3D=3D */
>   
>   /* User Trap Setup (N-extension) */



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



