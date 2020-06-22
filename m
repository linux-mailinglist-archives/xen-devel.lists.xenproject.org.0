Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C2C202E89
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 04:58:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnCeD-0008Dg-Cp; Mon, 22 Jun 2020 02:57:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnCeC-0008Db-5F
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 02:57:24 +0000
X-Inumbo-ID: 173176a8-b434-11ea-be2b-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 173176a8-b434-11ea-be2b-12813bfff9fa;
 Mon, 22 Jun 2020 02:57:21 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 52F14A272F;
 Mon, 22 Jun 2020 04:57:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3E947A272E;
 Mon, 22 Jun 2020 04:57:19 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id sAousFnn5qOW; Mon, 22 Jun 2020 04:57:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 19A8BA272F;
 Mon, 22 Jun 2020 04:57:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fvZdZZPu0WMs; Mon, 22 Jun 2020 04:57:17 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D8219A272E;
 Mon, 22 Jun 2020 04:57:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id C167C21BA4;
 Mon, 22 Jun 2020 04:56:47 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wN6l0XzX0Eh5; Mon, 22 Jun 2020 04:56:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id AB50521BAA;
 Mon, 22 Jun 2020 04:56:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ixqhfdNQ-5o5; Mon, 22 Jun 2020 04:56:41 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7ADC421BA4;
 Mon, 22 Jun 2020 04:56:41 +0200 (CEST)
Date: Mon, 22 Jun 2020 04:56:41 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <227951948.10901979.1592794601349.JavaMail.zimbra@cert.pl>
In-Reply-To: <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: hSzh8Vr462omVBiCuz/GiNtdRkOdyEuhVFaUn2lwLpo=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "Kang,
 Luwei" <luwei.kang@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 19 cze 2020 o 1:41, Micha=C5=82 Leszczy=C5=84ski michal.leszczynski@c=
ert.pl napisa=C5=82(a):

> Provide an interface for privileged domains to manage
> external IPT monitoring. Guest IPT state will be preserved
> across vmentry/vmexit using ipt_state structure.
>=20
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
> xen/arch/x86/hvm/hvm.c             | 167 +++++++++++++++++++++++++++++
> xen/arch/x86/hvm/vmx/vmx.c         |  24 +++++
> xen/arch/x86/mm.c                  |  37 +++++++
> xen/common/domain.c                |   1 +
> xen/include/asm-x86/hvm/vmx/vmcs.h |  16 +++
> xen/include/public/hvm/hvm_op.h    |  23 ++++
> xen/include/public/hvm/params.h    |   5 +-
> xen/include/public/memory.h        |   1 +
> xen/include/xen/sched.h            |   3 +
> 9 files changed, 276 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 5bb47583b3..145ad053d2 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1612,6 +1612,24 @@ int hvm_vcpu_initialise(struct vcpu *v)
>     return rc;
> }
>=20
> +void hvm_vmtrace_destroy(struct vcpu *v)
> +{
> +    unsigned int i;
> +    struct page_info *pg;
> +    struct ipt_state *ipt =3D v->arch.hvm.vmx.ipt_state;
> +    mfn_t buf_mfn =3D ipt->output_base >> PAGE_SHIFT;
> +    size_t buf_size =3D ipt->output_mask.size + 1;
> +
> +    xfree(ipt);
> +    v->arch.hvm.vmx.ipt_state =3D NULL;
> +
> +    for ( i =3D 0; i < (buf_size >> PAGE_SHIFT); i++ )
> +    {
> +        pg =3D mfn_to_page(_mfn(mfn_add(buf_mfn, i)));
> +        free_domheap_page(pg);
> +    }
> +}
> +
> void hvm_vcpu_destroy(struct vcpu *v)
> {
>     viridian_vcpu_deinit(v);
> @@ -1631,6 +1649,8 @@ void hvm_vcpu_destroy(struct vcpu *v)
>     vlapic_destroy(v);
>=20
>     hvm_vcpu_cacheattr_destroy(v);
> +
> +    hvm_vmtrace_destroy(v);
> }
>=20
> void hvm_vcpu_down(struct vcpu *v)
> @@ -4066,6 +4086,51 @@ static int hvmop_set_evtchn_upcall_vector(
>     return 0;
> }
>=20
> +static int hvm_set_vmtrace_pt_size(struct domain *d, uint64_t value)
> +{
> +    void *buf;
> +    unsigned int buf_order;
> +    struct page_info *pg;
> +    struct ipt_state *ipt;
> +    struct vcpu *v;
> +
> +    if ( value < PAGE_SIZE ||
> +         value > GB(4) ||
> +         ( value & (value - 1) ) ) {
> +        /* we don't accept trace buffer size smaller than single page
> +         * and the upper bound is defined as 4GB in the specification */
> +        return -EINVAL;
> +    }
> +
> +    for_each_vcpu ( d, v )
> +    {
> +        buf_order =3D get_order_from_bytes(value);
> +        pg =3D alloc_domheap_pages(d, buf_order, MEMF_no_refcount);
> +
> +        if ( !pg )
> +            return -EFAULT;
> +
> +        buf =3D page_to_virt(pg);
> +
> +        if ( vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
> +            return -EFAULT;
> +
> +        ipt =3D xmalloc(struct ipt_state);
> +
> +        if ( !ipt )
> +            return -EFAULT;
> +
> +        ipt->output_base =3D virt_to_mfn(buf) << PAGE_SHIFT;
> +        ipt->output_mask.raw =3D value - 1;
> +        ipt->status =3D 0;
> +        ipt->active =3D 0;
> +
> +        v->arch.hvm.vmx.ipt_state =3D ipt;
> +    }
> +
> +    return 0;
> +}
> +
> static int hvm_allow_set_param(struct domain *d,
>                                uint32_t index,
>                                uint64_t new_value)
> @@ -4127,6 +4192,7 @@ static int hvm_allow_set_param(struct domain *d,
>     case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
>     case HVM_PARAM_ALTP2M:
>     case HVM_PARAM_MCA_CAP:
> +    case HVM_PARAM_VMTRACE_PT_SIZE:
>         if ( value !=3D 0 && new_value !=3D value )
>             rc =3D -EEXIST;
>         break;
> @@ -4328,6 +4394,9 @@ static int hvm_set_param(struct domain *d, uint32_t=
 index,
> uint64_t value)
>     case HVM_PARAM_MCA_CAP:
>         rc =3D vmce_enable_mca_cap(d, value);
>         break;
> +    case HVM_PARAM_VMTRACE_PT_SIZE:
> +        rc =3D hvm_set_vmtrace_pt_size(d, value);
> +        break;
>     }
>=20
>     if ( !rc )
> @@ -4949,6 +5018,100 @@ static int compat_altp2m_op(
>     return rc;
> }
>=20
> +static int do_vmtrace_op(XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    struct xen_hvm_vmtrace_op a;
> +    struct domain *d;
> +    int rc;
> +    struct vcpu *v;
> +    struct ipt_state *ipt;
> +
> +    if ( !hvm_pt_supported() )
> +        return -EOPNOTSUPP;
> +
> +    if ( copy_from_guest(&a, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( a.version !=3D HVMOP_VMTRACE_INTERFACE_VERSION )
> +        return -EINVAL;
> +
> +    d =3D rcu_lock_domain_by_any_id(a.domain);
> +    spin_lock(&d->vmtrace_lock);
> +
> +    if ( d =3D=3D NULL )
> +        return -ESRCH;
> +
> +    if ( !is_hvm_domain(d) )
> +    {
> +        rc =3D -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    domain_pause(d);
> +
> +    if ( a.vcpu >=3D d->max_vcpus )
> +    {
> +        rc =3D -EINVAL;
> +        goto out;
> +    }
> +
> +    v =3D d->vcpu[a.vcpu];
> +    ipt =3D v->arch.hvm.vmx.ipt_state;
> +
> +    if ( !ipt )
> +    {
> +        /*
> +=09 * PT must be first initialized upon domain creation.
> +=09 */
> +        rc =3D -EINVAL;
> +        goto out;
> +    }
> +
> +    switch ( a.cmd )
> +    {
> +    case HVMOP_vmtrace_ipt_enable:
> +        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL,
> +                               RTIT_CTL_TRACEEN | RTIT_CTL_OS |
> +                               RTIT_CTL_USR | RTIT_CTL_BRANCH_EN) )
> +        {
> +            rc =3D -EFAULT;
> +            goto out;
> +        }
> +
> +        ipt->active =3D 1;
> +        break;
> +    case HVMOP_vmtrace_ipt_disable:
> +        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL, 0) )
> +        {
> +            rc =3D -EFAULT;
> +            goto out;
> +        }
> +
> +        ipt->active =3D 0;
> +        break;
> +    case HVMOP_vmtrace_ipt_get_offset:
> +        a.offset =3D ipt->output_mask.offset;
> +        break;
> +    default:
> +        rc =3D -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    rc =3D -EFAULT;
> +    if ( __copy_to_guest(arg, &a, 1) )
> +      goto out;
> +    rc =3D 0;
> +
> + out:
> +    domain_unpause(d);
> +    spin_unlock(&d->vmtrace_lock);
> +    rcu_unlock_domain(d);
> +
> +    return rc;
> +}
> +
> +DEFINE_XEN_GUEST_HANDLE(compat_hvm_vmtrace_op_t);
> +
> static int hvmop_get_mem_type(
>     XEN_GUEST_HANDLE_PARAM(xen_hvm_get_mem_type_t) arg)
> {
> @@ -5101,6 +5264,10 @@ long do_hvm_op(unsigned long op,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>         rc =3D current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_=
op(arg);
>         break;
>=20
> +    case HVMOP_vmtrace:
> +        rc =3D do_vmtrace_op(arg);
> +        break;
> +
>     default:
>     {
>         gdprintk(XENLOG_DEBUG, "Bad HVM op %ld.\n", op);
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index ab19d9424e..51f0046483 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -508,11 +508,25 @@ static void vmx_restore_host_msrs(void)
>=20
> static void vmx_save_guest_msrs(struct vcpu *v)
> {
> +    uint64_t rtit_ctl;
> +
>     /*
>      * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
>      * be updated at any time via SWAPGS, which we cannot trap.
>      */
>     v->arch.hvm.vmx.shadow_gs =3D rdgsshadow();
> +
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
> v->arch.hvm.vmx.ipt_state->active) )
> +    {
> +        smp_rmb();
> +        rdmsrl(MSR_RTIT_CTL, rtit_ctl);
> +
> +        if ( rtit_ctl & RTIT_CTL_TRACEEN )
> +            BUG();
> +
> +        rdmsrl(MSR_RTIT_STATUS, v->arch.hvm.vmx.ipt_state->status);
> +        rdmsrl(MSR_RTIT_OUTPUT_MASK,
> v->arch.hvm.vmx.ipt_state->output_mask.raw);
> +    }
> }


It was suggested to move this piece of code from vm-entry/vm-exit handling =
to
vmx_save_guest_msrs/vmx_restore_guest_msrs functions.

Please note that we do need to periodically read MSR_RTIT_OUTPUT_MASK in or=
der
to know how much data was written into the buffer by the processor. During =
tests,
I've spotted that in some cases vCPUs get out of scope very rarely.

For instance: when IPT gets enabled, xc_vmtrace_ipt_get_offset() is returni=
ng zero
value for the first few seconds, because it's relying on the value of
v->arch.hvm.vmx.ipt_state->output_mask which we only read in vmx_save_guest=
_msrs()
and in some cases this occurs very rarely.

Could you guys suggest some solution to the problem? If we would leave this=
 value
dirty in hardware, AFAIK we have no possibility to directly access it,
but observing this particular value is very important in the runtime.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska


>=20
> static void vmx_restore_guest_msrs(struct vcpu *v)
> @@ -524,6 +538,16 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
>=20
>     if ( cpu_has_msr_tsc_aux )
>         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> +
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
> v->arch.hvm.vmx.ipt_state->active) )
> +    {
> +        wrmsrl(MSR_RTIT_OUTPUT_BASE,
> +            v->arch.hvm.vmx.ipt_state->output_base);
> +        wrmsrl(MSR_RTIT_OUTPUT_MASK,
> +            v->arch.hvm.vmx.ipt_state->output_mask.raw);
> +        wrmsrl(MSR_RTIT_STATUS,
> +            v->arch.hvm.vmx.ipt_state->status);
> +    }
> }
>=20
> void vmx_update_cpu_exec_control(struct vcpu *v)
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index e376fc7e8f..e4658dc27f 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4624,6 +4624,43 @@ int arch_acquire_resource(struct domain *d, unsign=
ed int
> type,
>         }
>         break;
>     }
> +
> +    case XENMEM_resource_vmtrace_buf:
> +    {
> +        mfn_t mfn;
> +        unsigned int i;
> +        struct ipt_state *ipt;
> +
> +        if ( id >=3D d->max_vcpus )
> +        {
> +            rc =3D -EINVAL;
> +            break;
> +        }
> +
> +        ipt =3D d->vcpu[id]->arch.hvm.vmx.ipt_state;
> +
> +        if ( !ipt )
> +        {
> +            rc =3D -EINVAL;
> +            break;
> +        }
> +
> +        mfn =3D mfn_x(ipt->output_base >> PAGE_SHIFT);
> +
> +        if (nr_frames > ( ( ipt->output_mask.size + 1 ) >> PAGE_SHIFT ))
> +        {
> +            rc =3D -EINVAL;
> +            break;
> +        }
> +
> +        rc =3D 0;
> +        for ( i =3D 0; i < nr_frames; i++ )
> +        {
> +            mfn_list[i] =3D mfn_add(mfn, i);
> +        }
> +
> +        break;
> +    }
> #endif
>=20
>     default:
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7cc9526139..6f6458cd5b 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -414,6 +414,7 @@ struct domain *domain_create(domid_t domid,
>     d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
>=20
>     spin_lock_init(&d->pbuf_lock);
> +    spin_lock_init(&d->vmtrace_lock);
>=20
>     rwlock_init(&d->vnuma_rwlock);
>=20
> diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h
> b/xen/include/asm-x86/hvm/vmx/vmcs.h
> index 4c81093aba..9fc4653777 100644
> --- a/xen/include/asm-x86/hvm/vmx/vmcs.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
> @@ -104,6 +104,19 @@ struct pi_blocking_vcpu {
>     spinlock_t           *lock;
> };
>=20
> +struct ipt_state {
> +    uint64_t active;
> +    uint64_t status;
> +    uint64_t output_base;
> +    union {
> +        uint64_t raw;
> +        struct {
> +            uint32_t size;
> +            uint32_t offset;
> +        };
> +    } output_mask;
> +};
> +
> struct vmx_vcpu {
>     /* Physical address of VMCS. */
>     paddr_t              vmcs_pa;
> @@ -186,6 +199,9 @@ struct vmx_vcpu {
>      * pCPU and wakeup the related vCPU.
>      */
>     struct pi_blocking_vcpu pi_blocking;
> +
> +    /* State of Intel Processor Trace feature */
> +    struct ipt_state     *ipt_state;
> };
>=20
> int vmx_create_vmcs(struct vcpu *v);
> diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm=
_op.h
> index 870ec52060..8cd0b6ea49 100644
> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -382,6 +382,29 @@ struct xen_hvm_altp2m_op {
> typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
> DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
>=20
> +/* HVMOP_vmtrace: Perform VM tracing related operation */
> +#define HVMOP_vmtrace 26
> +
> +#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001
> +
> +struct xen_hvm_vmtrace_op {
> +    /* IN variable */
> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
> +    uint32_t cmd;
> +/* Enable/disable external vmtrace for given domain */
> +#define HVMOP_vmtrace_ipt_enable      1
> +#define HVMOP_vmtrace_ipt_disable     2
> +#define HVMOP_vmtrace_ipt_get_offset  3
> +    domid_t domain;
> +    uint32_t vcpu;
> +    uint64_t size;
> +
> +    /* OUT variable */
> +    uint64_t offset;
> +};
> +typedef struct xen_hvm_vmtrace_op xen_hvm_vmtrace_op_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_hvm_vmtrace_op_t);
> +
> #endif /* __XEN_PUBLIC_HVM_HVM_OP_H__ */
>=20
> /*
> diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/par=
ams.h
> index 0a91bfa749..adbc7e5d08 100644
> --- a/xen/include/public/hvm/params.h
> +++ b/xen/include/public/hvm/params.h
> @@ -300,6 +300,9 @@
> #define XEN_HVM_MCA_CAP_LMCE   (xen_mk_ullong(1) << 0)
> #define XEN_HVM_MCA_CAP_MASK   XEN_HVM_MCA_CAP_LMCE
>=20
> -#define HVM_NR_PARAMS 39
> +/* VM trace capabilities */
> +#define HVM_PARAM_VMTRACE_PT_SIZE 39
> +
> +#define HVM_NR_PARAMS 40
>=20
> #endif /* __XEN_PUBLIC_HVM_PARAMS_H__ */
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index dbd35305df..f823c784c3 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -620,6 +620,7 @@ struct xen_mem_acquire_resource {
>=20
> #define XENMEM_resource_ioreq_server 0
> #define XENMEM_resource_grant_table 1
> +#define XENMEM_resource_vmtrace_buf 2
>=20
>     /*
>      * IN - a type-specific resource identifier, which must be zero
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ac53519d7f..b3a36f3788 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,9 @@ struct domain
>     unsigned    pbuf_idx;
>     spinlock_t  pbuf_lock;
>=20
> +    /* Used by vmtrace domctls */
> +    spinlock_t  vmtrace_lock;
> +
>     /* OProfile support. */
>     struct xenoprof *xenoprof;
>=20
> --
> 2.20.1

