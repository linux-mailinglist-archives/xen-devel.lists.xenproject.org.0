Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1D62F3B6C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 21:15:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66006.117044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQ4o-0001Rp-Az; Tue, 12 Jan 2021 20:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66006.117044; Tue, 12 Jan 2021 20:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQ4o-0001RQ-7a; Tue, 12 Jan 2021 20:15:38 +0000
Received: by outflank-mailman (input) for mailman id 66006;
 Tue, 12 Jan 2021 20:15:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DecX=GP=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1kzQ4n-0001RL-3d
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 20:15:37 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aedaccfa-5c81-4f0d-83b9-e9a8dfdf72a4;
 Tue, 12 Jan 2021 20:15:35 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cm17so3790878edb.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 12:15:35 -0800 (PST)
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
X-Inumbo-ID: aedaccfa-5c81-4f0d-83b9-e9a8dfdf72a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pa4YwUz3gVRwOxrGyjeiRt58ZnozzfRFG0IV0fKcZkc=;
        b=nLWLpCef4jkS6aMtY8Q6P7bFK/O30Xw4tSHZ4vHka22ITqleK43aNyT+enkWyXq4hA
         2DhVDtHjOSL1dPp6OrM1R9oXUWWPbmz11QBNYXP/voo8EROa42btkB9Y9Msmgfj+WZC1
         2tx9IqR94B6l4OGf2LpuxsQYyZZB+YnND67JZ+pmxuS/IUigKh9Qu/vNCQ4VQ2++9Nu4
         aZt9e+JCAZhVwk7dnauNoiU4jNvUldsg9jA87HXxZXLRacC+Og3wylm9HFr6inZ+rzdR
         nlK4HVGEE2Zl0BpmUxwQAph05fsmohHLjELCByl7ASf7KRB+Ht40NYajGucug0FlfNY0
         EJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pa4YwUz3gVRwOxrGyjeiRt58ZnozzfRFG0IV0fKcZkc=;
        b=cLONxvMLSrZ5MC5O85LmaIpJ/kvnJaGEY19ewbPketGYMHaHs4GGhn2O/arJ3NnqH9
         /S02a8HHNxPzddO6LIWXH7J3kDE/OIm2N99Xioj64irShKEZNV7VfROctofHFzZngeaj
         dWAYyoQR25H98i6nmNl48fhks6xqrGTdDlcJjero/Tq0VGUMndGBuaoazr/WPND/jHBq
         H+1KUgKeORT+U7JKTWtax8yHIlzvbK38Qz0lMNYEEVCGTXRf/yNxMEgs0Z5mWp2WmqAc
         WLNoEuO3es2peMjdblOILNtROhbZKIeFrXzO4YL6kxly95AuAJJAF+rSZQKZceIvAr7J
         c4aQ==
X-Gm-Message-State: AOAM533l8X6jrfv2Zr5tyC+nOxIVEkiRs1IBdyqv9AVYJ+cV+wQT2dbZ
	zrtENPSOBjkN3XbNqFiF7bppFZjIj97Q9D14zYI=
X-Google-Smtp-Source: ABdhPJwKn4axKlAZn5PleNMhKGuCNIn8SDnQeZ8gIRUFkAloMl853jHXX5V0RoUcoLGpeVwK7Sdf6qjgMJJb+r9oY+I=
X-Received: by 2002:a05:6402:5193:: with SMTP id q19mr714293edd.264.1610482534303;
 Tue, 12 Jan 2021 12:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20210112194841.1537-1-andrew.cooper3@citrix.com> <20210112194841.1537-3-andrew.cooper3@citrix.com>
In-Reply-To: <20210112194841.1537-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 12 Jan 2021 20:15:23 +0000
Message-ID: <CAJ=z9a30MFcV4=5YU9O2oHmNeMU3vdPwSJ6vYCpDi5Zoi6aNtQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] xen/memory: Fix acquire_resource size semantics
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>, 
	Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, 12 Jan 2021 at 19:49, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>
> Calling XENMEM_acquire_resource with a NULL frame_list is a request for t=
he
> size of the resource, but the returned 32 is bogus.
>
> If someone tries to follow it for XENMEM_resource_ioreq_server, the acqui=
re
> call will fail as IOREQ servers currently top out at 2 frames, and it is =
only
> half the size of the default grant table limit for guests.

I haven't yet looked at the code, just wanted to seek some clarification he=
re.
Are we expecting someone else outside the tools (e.g. QEMU) to rely on
the new behavior? If so, what would happen if such code ran on older
Xen?

IOW, will that code require some compatibility layer to function?

>
> Also, no users actually request a resource size, because it was never wir=
ed up
> in the sole implementaion of resource acquisition in Linux.

s/implementation/

>
> Introduce a new resource_max_frames() to calculate the size of a resource=
, and
> implement it the IOREQ and grant subsystems.

in the?



>
> It is impossible to guarantee that a mapping call following a successful =
size
> call will succeed (e.g. The target IOREQ server gets destroyed, or the do=
main
> switches from grant v2 to v1).  Document the restriction, and use the
> flexibility to simplify the paths to be lockless.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
>
> v3:
>  * Use const struct domain *
>  * Fold goto out paths
> v2:
>  * Spelling fixes
>  * Add more local variables.
>  * Don't return any status frames on ARM where v2 support is compiled out=
.
> ---
>  xen/arch/x86/mm.c             | 20 +++++++++++++++++
>  xen/common/grant_table.c      | 23 ++++++++++++++++++++
>  xen/common/memory.c           | 50 ++++++++++++++++++++++++++++++++-----=
------
>  xen/include/asm-x86/mm.h      |  3 +++
>  xen/include/public/memory.h   | 16 ++++++++++----
>  xen/include/xen/grant_table.h |  8 +++++++
>  xen/include/xen/mm.h          |  6 ++++++
>  7 files changed, 109 insertions(+), 17 deletions(-)
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 63e9fae919..7a2e94cd6f 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4587,6 +4587,26 @@ static int handle_iomem_range(unsigned long s, uns=
igned long e, void *p)
>      return err || s > e ? err : _handle_iomem_range(s, e, p);
>  }
>
> +unsigned int arch_resource_max_frames(
> +    const struct domain *d, unsigned int type, unsigned int id)
> +{
> +    unsigned int nr =3D 0;
> +
> +    switch ( type )
> +    {
> +#ifdef CONFIG_HVM
> +    case XENMEM_resource_ioreq_server:
> +        if ( !is_hvm_domain(d) )
> +            break;
> +        /* One frame for the buf-ioreq ring, and one frame per 128 vcpus=
. */
> +        nr =3D 1 + DIV_ROUND_UP(d->max_vcpus * sizeof(struct ioreq), PAG=
E_SIZE);
> +        break;
> +#endif
> +    }
> +
> +    return nr;
> +}
> +
>  int arch_acquire_resource(struct domain *d, unsigned int type,
>                            unsigned int id, unsigned long frame,
>                            unsigned int nr_frames, xen_pfn_t mfn_list[])
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index f560c250d7..bd99dddbf6 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,29 @@ static int gnttab_get_shared_frame_mfn(struct doma=
in *d,
>      return 0;
>  }
>
> +unsigned int gnttab_resource_max_frames(const struct domain *d, unsigned=
 int id)
> +{
> +    const struct grant_table *gt =3D d->grant_table;
> +    unsigned int nr =3D 0;
> +
> +    /* Don't need the grant lock.  This limit is fixed at domain create =
time. */
> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        nr =3D gt->max_grant_frames;
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        if ( GNTTAB_MAX_VERSION < 2 )
> +            break;
> +
> +        nr =3D grant_to_status_frames(gt->max_grant_frames);
> +        break;
> +    }
> +
> +    return nr;
> +}
> +
>  int gnttab_acquire_resource(
>      struct domain *d, unsigned int id, unsigned long frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[])
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 82cf7b41ee..beefa6a313 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1052,6 +1052,26 @@ static long xatp_permission_check(struct domain *d=
, unsigned int space)
>      return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
>  }
>
> +/*
> + * Return 0 on any kind of error.  Caller converts to -EINVAL.
> + *
> + * All nonzero values should be repeatable (i.e. derived from some fixed
> + * property of the domain), and describe the full resource (i.e. mapping=
 the
> + * result of this call will be the entire resource).
> + */
> +static unsigned int resource_max_frames(const struct domain *d,
> +                                        unsigned int type, unsigned int =
id)
> +{
> +    switch ( type )
> +    {
> +    case XENMEM_resource_grant_table:
> +        return gnttab_resource_max_frames(d, id);
> +
> +    default:
> +        return arch_resource_max_frames(d, type, id);
> +    }
> +}
> +
>  static int acquire_resource(
>      XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
>  {
> @@ -1063,6 +1083,7 @@ static int acquire_resource(
>       * use-cases then per-CPU arrays or heap allocations may be required=
.
>       */
>      xen_pfn_t mfn_list[32];
> +    unsigned int max_frames;
>      int rc;
>
>      /*
> @@ -1079,19 +1100,6 @@ static int acquire_resource(
>      if ( xmar.pad !=3D 0 )
>          return -EINVAL;
>
> -    if ( guest_handle_is_null(xmar.frame_list) )
> -    {
> -        if ( xmar.nr_frames )
> -            return -EINVAL;
> -
> -        xmar.nr_frames =3D ARRAY_SIZE(mfn_list);
> -
> -        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
> -            return -EFAULT;
> -
> -        return 0;
> -    }
> -
>      if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
>          return -E2BIG;
>
> @@ -1103,6 +1111,22 @@ static int acquire_resource(
>      if ( rc )
>          goto out;
>
> +    max_frames =3D resource_max_frames(d, xmar.type, xmar.id);
> +
> +    rc =3D -EINVAL;
> +    if ( !max_frames )
> +        goto out;
> +
> +    if ( guest_handle_is_null(xmar.frame_list) )
> +    {
> +        if ( xmar.nr_frames )
> +            goto out;
> +
> +        xmar.nr_frames =3D max_frames;
> +        rc =3D __copy_field_to_guest(arg, &xmar, nr_frames) ? -EFAULT : =
0;
> +        goto out;
> +    }
> +
>      switch ( xmar.type )
>      {
>      case XENMEM_resource_grant_table:
> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
> index deeba75a1c..a40a7fa024 100644
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -639,6 +639,9 @@ static inline bool arch_mfn_in_directmap(unsigned lon=
g mfn)
>      return mfn <=3D (virt_to_mfn(eva - 1) + 1);
>  }
>
> +unsigned int arch_resource_max_frames(const struct domain *d,
> +                                      unsigned int type, unsigned int id=
);
> +
>  int arch_acquire_resource(struct domain *d, unsigned int type,
>                            unsigned int id, unsigned long frame,
>                            unsigned int nr_frames, xen_pfn_t mfn_list[]);
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index 21d483298e..d7eb34f167 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -639,10 +639,18 @@ struct xen_mem_acquire_resource {
>  #define XENMEM_resource_grant_table_id_status 1
>
>      /*
> -     * IN/OUT - As an IN parameter number of frames of the resource
> -     *          to be mapped. However, if the specified value is 0 and
> -     *          frame_list is NULL then this field will be set to the
> -     *          maximum value supported by the implementation on return.
> +     * IN/OUT
> +     *
> +     * As an IN parameter number of frames of the resource to be mapped.
> +     *
> +     * When frame_list is NULL and nr_frames is 0, this is interpreted a=
s a
> +     * request for the size of the resource, which shall be returned in =
the
> +     * nr_frames field.
> +     *
> +     * The size of a resource will never be zero, but a nonzero result d=
oesn't
> +     * guarantee that a subsequent mapping request will be successful.  =
There
> +     * are further type/id specific constraints which may change between=
 the
> +     * two calls.
>       */
>      uint32_t nr_frames;
>      uint32_t pad;
> diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.=
h
> index 5a2c75b880..015704bebc 100644
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -57,6 +57,8 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, gra=
nt_ref_t ref,
>  int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn,
>                       mfn_t *mfn);
>
> +unsigned int gnttab_resource_max_frames(const struct domain *d, unsigned=
 int id);
> +
>  int gnttab_acquire_resource(
>      struct domain *d, unsigned int id, unsigned long frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[]);
> @@ -93,6 +95,12 @@ static inline int gnttab_map_frame(struct domain *d, u=
nsigned long idx,
>      return -EINVAL;
>  }
>
> +static inline unsigned int gnttab_resource_max_frames(
> +    const struct domain *d, unsigned int id)
> +{
> +    return 0;
> +}
> +
>  static inline int gnttab_acquire_resource(
>      struct domain *d, unsigned int id, unsigned long frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[])
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index e62a5b726e..2a919fbcb4 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -703,6 +703,12 @@ static inline void put_page_alloc_ref(struct page_in=
fo *page)
>  }
>
>  #ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
> +static inline unsigned int arch_resource_max_frames(
> +    const struct domain *d, unsigned int type, unsigned int id)
> +{
> +    return 0;
> +}
> +
>  static inline int arch_acquire_resource(
>      struct domain *d, unsigned int type, unsigned int id, unsigned long =
frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[])
> --
> 2.11.0
>

