Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3A1FD53B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 21:14:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jldVM-000298-P9; Wed, 17 Jun 2020 19:13:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1O8=76=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jldVL-000293-7u
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 19:13:47 +0000
X-Inumbo-ID: a9e746da-b0ce-11ea-ba16-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9e746da-b0ce-11ea-ba16-12813bfff9fa;
 Wed, 17 Jun 2020 19:13:45 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6957BA2C6C;
 Wed, 17 Jun 2020 21:13:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 59450A1E06;
 Wed, 17 Jun 2020 21:13:43 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QcdfFw0QIu1N; Wed, 17 Jun 2020 21:13:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5A624A2C6C;
 Wed, 17 Jun 2020 21:13:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Hcot-ETBUUZk; Wed, 17 Jun 2020 21:13:42 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2D3E2A1BE2;
 Wed, 17 Jun 2020 21:13:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 15A6920755;
 Wed, 17 Jun 2020 21:13:12 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ltjCRaiJ2KCw; Wed, 17 Jun 2020 21:13:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 021F02097A;
 Wed, 17 Jun 2020 21:13:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4SqaTcL2sq0T; Wed, 17 Jun 2020 21:13:05 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id CE98A20755;
 Wed, 17 Jun 2020 21:13:05 +0200 (CEST)
Date: Wed, 17 Jun 2020 21:13:05 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <998292451.9258672.1592421185726.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200616172352.GT735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: 2F7rUJxrX+qiejqyNWQFiyWrG+s5iA==
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 16 cze 2020 o 19:23, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Tue, Jun 16, 2020 at 05:22:06PM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>> Provide an interface for privileged domains to manage
>> external IPT monitoring.
>>=20
>> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
>=20
> Thanks for the patch! I have some questions below which require your
> input.
>=20
>> ---
>>  xen/arch/x86/hvm/hvm.c          | 170 ++++++++++++++++++++++++++++++++
>>  xen/include/public/hvm/hvm_op.h |  27 +++++
>>  2 files changed, 197 insertions(+)
>>=20
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 5bb47583b3..9292caebe0 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -4949,6 +4949,172 @@ static int compat_altp2m_op(
>>      return rc;
>>  }
>> =20
>> +static int do_vmtrace_op(
>> +    XEN_GUEST_HANDLE_PARAM(void) arg)
>=20
> No need for the newline, this can fit on a single line.
>=20
>> +{
>> +    struct xen_hvm_vmtrace_op a;
>> +    struct domain *d =3D NULL;
>=20
> I don't think you need to init d to NULL (at least by looking at the
> current code below).
>=20
>> +    int rc =3D -EFAULT;
>=20
> No need to init rc.
>=20
>> +    int i;
>=20
> unsigned since it's used as a loop counter.
>=20
>> +    struct vcpu *v;
>> +    void* buf;
>=20
> Nit: '*' should be prepended to the variable name.
>=20
>> +    uint32_t buf_size;
>=20
> size_t
>=20
>> +    uint32_t buf_order;
>=20
> Order is generally fine using unsigned int, no need to use a
> specifically sized type.
>=20
>> +    uint64_t buf_mfn;
>=20
> Could this use the mfn type?
>=20
>> +    struct page_info *pg;
>> +
>> +    if ( !hvm_ipt_supported() )
>> +        return -EOPNOTSUPP;
>> +
>> +    if ( copy_from_guest(&a, arg, 1) )
>> +        return -EFAULT;
>> +
>> +    if ( a.version !=3D HVMOP_VMTRACE_INTERFACE_VERSION )
>> +        return -EINVAL;
>> +
>> +    switch ( a.cmd )
>> +    {
>> +    case HVMOP_vmtrace_ipt_enable:
>> +    case HVMOP_vmtrace_ipt_disable:
>> +    case HVMOP_vmtrace_ipt_get_buf:
>> +    case HVMOP_vmtrace_ipt_get_offset:
>> +        break;
>> +
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    d =3D rcu_lock_domain_by_any_id(a.domain);
>> +
>> +    if ( d =3D=3D NULL )
>> +        return -ESRCH;
>> +
>> +    if ( !is_hvm_domain(d) )
>> +    {
>> +        rc =3D -EOPNOTSUPP;
>> +        goto out;
>> +    }
>> +
>> +    domain_pause(d);
>> +
>> +    if ( a.vcpu >=3D d->max_vcpus )
>> +    {
>> +        rc =3D -EINVAL;
>> +        goto out;
>> +    }
>> +
>> +    v =3D d->vcpu[a.vcpu];
>> +
>> +    if ( a.cmd =3D=3D HVMOP_vmtrace_ipt_enable )
>=20
> Please use a switch here, you might even consider re-using the switch
> from above and moving the domain checks before actually checking the
> command field, so that you don't need to perform two switches against
> a.cmd.
>=20
>> +    {
>> +        if ( v->arch.hvm.vmx.ipt_state ) {
>=20
> Coding style, brace should be on newline (there are more below which
> I'm not going to comment on).
>=20
>> +            // already enabled
>=20
> Comments should use /* ... */, there multiple instances of this below
> which I'm not going to comment on, please check CODING_STYLE.
>=20
> Also, the interface looks racy, I think you are missing a lock to
> protect v->arch.hvm.vmx.ipt_state from being freed under your feet if
> you issue concurrent calls to the interface.
>=20
>> +            rc =3D -EINVAL;
>> +            goto out;
>> +        }
>> +
>> +        if ( a.size < PAGE_SIZE || a.size > 1000000 * PAGE_SIZE ) {
>=20
> You can use GB(4) which is easier to read. Should the size also be a
> multiple of a PAGE_SIZE?
>=20
>> +            // we don't accept trace buffer size smaller than single pa=
ge
>> +            // and the upper bound is defined as 4GB in the specificati=
on
>> +            rc =3D -EINVAL;
>> +            goto out;
>> +=09}
>=20
> Stray tab.
>=20
>> +
>> +        buf_order =3D get_order_from_bytes(a.size);
>> +
>> +        if ( (a.size >> PAGE_SHIFT) !=3D (1 << buf_order) ) {
>=20
> Oh here is the check. I think you can move this with the checks above
> by doing a.size & ~PAGE_MASK.


I belive it's more strict than a.size & ~PAGE_MASK. I think that CPU expect=
s that the buffer size is a power of 2, so you can have 64 MB or 128 MB, bu=
t not 96 MB buffer.


>=20
>> +            rc =3D -EINVAL;
>> +            goto out;
>> +        }
>> +
>> +        buf =3D page_to_virt(alloc_domheap_pages(d, buf_order,
>> MEMF_no_refcount));
>=20
> What if alloc_domheap_pages return NULL?
>=20
> Since I think you only what the linear address of the page to zero it
> I would suggest using clear_domain_page.
>=20

Hmm. This was fixed already. Most probably I did something strange with git=
 and this change was not stored. I will correct this with patch v2.


>> +        buf_size =3D a.size;
>> +
>> +        if ( !buf ) {
>> +            rc =3D -EFAULT;
>> +            goto out;
>> +        }
>> +
>> +        memset(buf, 0, buf_size);
>> +
>> +        for ( i =3D 0; i < (buf_size >> PAGE_SHIFT); i++ ) {
>> +            share_xen_page_with_privileged_guests(virt_to_page(buf) + i=
,
>> SHARE_ro);
>=20
> This line (and some more below) exceeds 80 characters, please split
> it.
>=20
>> +        }
>> +
>> +        v->arch.hvm.vmx.ipt_state =3D xmalloc(struct ipt_state);
>=20
> You should check that xmalloc has succeeds before trying to access
> ipt_state.
>=20
>> +        v->arch.hvm.vmx.ipt_state->output_base =3D virt_to_mfn(buf) <<
>> PAGE_SHIFT;
>> +        v->arch.hvm.vmx.ipt_state->output_mask =3D buf_size - 1;
>> +        v->arch.hvm.vmx.ipt_state->status =3D 0;
>> +        v->arch.hvm.vmx.ipt_state->ctl =3D RTIT_CTL_TRACEEN | RTIT_CTL_=
OS |
>> RTIT_CTL_USR | RTIT_CTL_BRANCH_EN;
>=20
> Shouldn't the user be able to select what tracing should be enabled?
>=20
>> +    }
>> +    else if ( a.cmd =3D=3D HVMOP_vmtrace_ipt_disable )
>> +    {
>> +        if ( !v->arch.hvm.vmx.ipt_state ) {
>> +            rc =3D -EINVAL;
>> +            goto out;
>> +        }
>> +
>> +        buf_mfn =3D v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHIF=
T;
>> +        buf_size =3D ( v->arch.hvm.vmx.ipt_state->output_mask + 1 ) &
>> 0xFFFFFFFFUL;
>> +
>> +        for ( i =3D 0; i < (buf_size >> PAGE_SHIFT); i++ )
>> +        {
>> +            if ( (mfn_to_page(_mfn(buf_mfn + i))->count_info & PGC_coun=
t_mask)
>> !=3D 1 )
>> +            {
>> +                rc =3D -EBUSY;
>> +                goto out;
>> +            }
>> +        }
>> +
>> +        xfree(v->arch.hvm.vmx.ipt_state);
>> +=09v->arch.hvm.vmx.ipt_state =3D NULL;
>> +
>> +        for ( i =3D 0; i < (buf_size >> PAGE_SHIFT); i++ )
>> +        {
>> +            pg =3D mfn_to_page(_mfn(buf_mfn + i));
>> +            put_page_alloc_ref(pg);
>> +            if ( !test_and_clear_bit(_PGC_xen_heap, &pg->count_info) )
>> +                ASSERT_UNREACHABLE();
>> +            pg->u.inuse.type_info =3D 0;
>> +            page_set_owner(pg, NULL);
>> +            free_domheap_page(pg);
>=20
> Hm, this seems fairly dangerous, what guarantees that the caller is
> not going to map the buffer while you are trying to tear it down?
>=20
> You perform a check before freeing ipt_state, but between the check
> and the actual tearing down the domain might have setup mappings to
> them.
>=20
> I wonder, could you expand a bit on why trace buffers are allocated
> from domheap memory by Xen?


In general, I thought it would be good to account trace buffers for particu=
lar DomUs, so it would be easier to troubleshoot the memory usage.


>=20
> There are a couple of options here, maybe the caller could provide
> it's own buffer, then Xen would take an extra reference to those pages
> and setup them to be used as buffers.
>=20
> Another alternative would be to use domhep memory but not let the
> caller map it directly, and instead introduce a hypercall to copy
> from the internal Xen buffer into a user-provided one.
>=20
> How much memory is used on average by those buffers? That would help
> decide a model that would best fit the usage.


From 4 kB to 4 GB. Right now I use 128 MB buffers and it takes just a few s=
econds to fill them up completely.

I think I've just copied the pattern which is already present in Xen's code=
, e.g. interfaces used by xenbaked/xentrace tools.


>=20
>> +        }
>> +    }
>> +    else if ( a.cmd =3D=3D HVMOP_vmtrace_ipt_get_buf )
>> +    {
>> +        if ( !v->arch.hvm.vmx.ipt_state ) {
>> +            rc =3D -EINVAL;
>> +            goto out;
>> +        }
>> +
>> +        a.mfn =3D v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHIFT;
>=20
> This will not work for translated domains, ie: a PVH or HVM domain
> won't be able to use this interface since it has no way to request the
> mapping of a specific mfn into it's physmap. I think we need to take
> this into account when deciding how the interface should be, so that
> we don't corner ourselves with a PV only interface.

Please be aware that this is only going to be used by Dom0. Is is well-supp=
orted case that somebody is using PVH/HVM Dom0?

I think that all Virtual Machine Introspection stuff currently requires to =
have Dom0 PV. Our main goal is to have this working well in combo with VMI.


>=20
>> +        a.size =3D (v->arch.hvm.vmx.ipt_state->output_mask + 1) & 0xFFF=
FFFFFUL;
>=20
> You can truncate it easier by casting to uint32_t I think.
>=20
> Or even better, you could put output_mask in a union like:
>=20
> union {
>    uint64_t raw;
>    struct {
>        uint32_t size;
>=09uint32_t offset;
>    }
> }
>=20
> Then you can avoid the shifting and the castings.
>=20
>> +    }
>> +    else if ( a.cmd =3D=3D HVMOP_vmtrace_ipt_get_offset )
>> +    {
>> +        if ( !v->arch.hvm.vmx.ipt_state ) {
>> +            rc =3D -EINVAL;
>> +            goto out;
>> +        }
>> +
>> +        a.offset =3D v->arch.hvm.vmx.ipt_state->output_mask >> 32;
>> +    }
>> +
>> +    rc =3D -EFAULT;
>> +    if ( __copy_to_guest(arg, &a, 1) )
>> +      goto out;
>> +    rc =3D 0;
>> +
>> + out:
>> +    smp_wmb();
>=20
> Why do you need a barrier here?
>=20
>> +    domain_unpause(d);
>> +    rcu_unlock_domain(d);
>> +
>> +    return rc;
>> +}
>> +
>> +DEFINE_XEN_GUEST_HANDLE(compat_hvm_vmtrace_op_t);
>> +
>>  static int hvmop_get_mem_type(
>>      XEN_GUEST_HANDLE_PARAM(xen_hvm_get_mem_type_t) arg)
>>  {
>> @@ -5101,6 +5267,10 @@ long do_hvm_op(unsigned long op,
>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>          rc =3D current->hcall_compat ? compat_altp2m_op(arg) : do_altp2=
m_op(arg);
>>          break;
>> =20
>> +    case HVMOP_vmtrace:
>> +        rc =3D do_vmtrace_op(arg);
>> +        break;
>> +
>>      default:
>>      {
>>          gdprintk(XENLOG_DEBUG, "Bad HVM op %ld.\n", op);
>> diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hv=
m_op.h
>> index 870ec52060..3bbcd54c96 100644
>> --- a/xen/include/public/hvm/hvm_op.h
>> +++ b/xen/include/public/hvm/hvm_op.h
>> @@ -382,6 +382,33 @@ struct xen_hvm_altp2m_op {
>>  typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
>>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
>> =20
>> +/* HVMOP_vmtrace: Perform VM tracing related operation */
>> +#define HVMOP_vmtrace 26
>> +
>> +#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001
>> +
>> +struct xen_hvm_vmtrace_op {
>> +    /* IN variable */
>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
>> +    uint32_t cmd;
>> +/* Enable/disable external vmtrace for given domain */
>> +#define HVMOP_vmtrace_ipt_enable      1
>> +#define HVMOP_vmtrace_ipt_disable     2
>> +#define HVMOP_vmtrace_ipt_get_buf     3
>> +#define HVMOP_vmtrace_ipt_get_offset  4
>> +    domid_t domain;
>=20
> You are missing a padding field here AFAICT.
>=20
> Roger.


Thanks for your feedback, I will apply all the remaining suggestions in pat=
ch v2.

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

