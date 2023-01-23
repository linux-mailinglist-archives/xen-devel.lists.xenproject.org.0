Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8306780F9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483104.749045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzOp-0003BF-2v; Mon, 23 Jan 2023 16:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483104.749045; Mon, 23 Jan 2023 16:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzOo-00037y-VY; Mon, 23 Jan 2023 16:10:22 +0000
Received: by outflank-mailman (input) for mailman id 483104;
 Mon, 23 Jan 2023 16:10:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FuoH=5U=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pJzOn-00037r-Qb
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:10:22 +0000
Received: from m228-12.mailgun.net (m228-12.mailgun.net [159.135.228.12])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 6d4d47f0-9b38-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 17:10:18 +0100 (CET)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169]) by
 13593c2b9515 with SMTP id 63ceb166196255da45dc598d (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 23 Jan 2023 16:10:14 GMT
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-4ff07dae50dso133284737b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 08:10:14 -0800 (PST)
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
X-Inumbo-ID: 6d4d47f0-9b38-11ed-b8d1-410ff93cb8f0
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1674490216; x=1674497416; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=wM1Uaew0DbHCJGVY5lMyeejCeJvbZTTwMjzi9q79dCE=;
 b=I69SNRYy7bmLuxBmneyWatDgUVs60yYMzszTMcXBhLAxaxSwmhX4uXOsK+j8Ds4qFc8JDjJQMj1RVzW/HBMh3kWZO0fXp3yB1A7ETCgSG8z/s4Je+ZfwytaRNQK43WXX7rE5InOYYONIASffkIm6rZtZTz0FURUxMSC5BHpjOeglCkdwpfP3uiYvRBHjL9wClBepkio4fPx9ursi5et3t638QFfGYnQVBaFHEzWEq6Br3DDqNVNo1S/5uJr984zrdoxcOl3FhcYtBZ7/HbP6B6/XbJig4FvaIghQYAZh4FRg08zfSL2mwc5syL8gpzC5egaDvrEjjZzZ02g6n0+KoQ==
X-Mailgun-Sending-Ip: 159.135.228.12
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AFqh2koo+10EuePwV4cI8ge+Cv1vhvOo6v3T8gVJ80mhxHBeJmg25KP9
	QsQaHBTcU+vJ2mBA6tJCj5vBV6rscpzur2s+0rs=
X-Google-Smtp-Source: AMrXdXuX8sOqi8JeKpXJ8d/tuLr0cO/+U0tfae0MLIkDVbuiiZs1R12R2GZkyymHBJ19RGgHNgyFg7zFOhPPDuUG9pg=
X-Received: by 2002:a0d:db95:0:b0:4ff:f7a4:56d1 with SMTP id
 d143-20020a0ddb95000000b004fff7a456d1mr860258ywe.23.1674490213786; Mon, 23
 Jan 2023 08:10:13 -0800 (PST)
MIME-Version: 1.0
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com> <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com>
In-Reply-To: <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 23 Jan 2023 11:09:37 -0500
X-Gmail-Original-Message-ID: <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
Message-ID: <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest areas
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000005f6bb505f2f0a22f"

--0000000000005f6bb505f2f0a22f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, add the necessary fork handling (with the
> backing function yet to be filled in).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>  }
>
> +static int copy_guest_area(struct guest_area *cd_area,
> +                           const struct guest_area *d_area,
> +                           struct vcpu *cd_vcpu,
> +                           const struct domain *d)
> +{
> +    mfn_t d_mfn, cd_mfn;
> +
> +    if ( !d_area->pg )
> +        return 0;
> +
> +    d_mfn = page_to_mfn(d_area->pg);
> +
> +    /* Allocate & map a page for the area if it hasn't been already. */
> +    if ( !cd_area->pg )
> +    {
> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> +        p2m_type_t p2mt;
> +        p2m_access_t p2ma;
> +        unsigned int offset;
> +        int ret;
> +
> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> +        {
> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain,
0);
> +
> +            if ( !pg )
> +                return -ENOMEM;
> +
> +            cd_mfn = page_to_mfn(pg);
> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> +
> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,
p2m_ram_rw,
> +                                 p2m->default_access, -1);
> +            if ( ret )
> +                return ret;
> +        }
> +        else if ( p2mt != p2m_ram_rw )
> +            return -EBUSY;
> +
> +        /*
> +         * Simply specify the entire range up to the end of the page.
All the
> +         * function uses it for is a check for not crossing page
boundaries.
> +         */
> +        offset = PAGE_OFFSET(d_area->map);
> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
> +                             PAGE_SIZE - offset, cd_area, NULL);
> +        if ( ret )
> +            return ret;
> +    }
> +    else
> +        cd_mfn = page_to_mfn(cd_area->pg);

Everything to this point seems to be non mem-sharing/forking related. Could
these live somewhere else? There must be some other place where allocating
these areas happens already for non-fork VMs so it would make sense to just
refactor that code to be callable from here.

> +
> +    copy_domain_page(cd_mfn, d_mfn);
> +
> +    return 0;
> +}
> +
>  static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
>  {
>      struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> @@ -1745,6 +1804,16 @@ static int copy_vcpu_settings(struct dom
>              copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
>          }
>
> +        /* Same for the (physically registered) runstate and time info
areas. */
> +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
> +                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
> +        if ( ret )
> +            return ret;
> +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
> +                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
> +        if ( ret )
> +            return ret;
> +
>          ret = copy_vpmu(d_vcpu, cd_vcpu);
>          if ( ret )
>              return ret;
> @@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain
>
>   state:
>      if ( reset_state )
> +    {
>          rc = copy_settings(d, pd);
> +        /* TBD: What to do here with -ERESTART? */

Where does ERESTART coming from?

--0000000000005f6bb505f2f0a22f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; In preparation of the introduction of new vCPU operations allowing=
 to<br>&gt; register the respective areas (one of the two is x86-specific) =
by<br>&gt; guest-physical address, add the necessary fork handling (with th=
e<br>&gt; backing function yet to be filled in).<br>&gt;<br>&gt; Signed-off=
-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com=
</a>&gt;<br>&gt;<br>&gt; --- a/xen/arch/x86/mm/mem_sharing.c<br>&gt; +++ b/=
xen/arch/x86/mm/mem_sharing.c<br>&gt; @@ -1653,6 +1653,65 @@ static void co=
py_vcpu_nonreg_state(struc<br>&gt; =C2=A0 =C2=A0 =C2=A0hvm_set_nonreg_state=
(cd_vcpu, &amp;nrs);<br>&gt; =C2=A0}<br>&gt;<br>&gt; +static int copy_guest=
_area(struct guest_area *cd_area,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct gu=
est_area *d_area,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vcpu *cd_vcpu,<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 const struct domain *d)<br>&gt; +{<br>&gt; + =C2=A0 =
=C2=A0mfn_t d_mfn, cd_mfn;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0if ( !d_area-&g=
t;pg )<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>&gt; +<br>&gt; + =
=C2=A0 =C2=A0d_mfn =3D page_to_mfn(d_area-&gt;pg);<br>&gt; +<br>&gt; + =C2=
=A0 =C2=A0/* Allocate &amp; map a page for the area if it hasn&#39;t been a=
lready. */<br>&gt; + =C2=A0 =C2=A0if ( !cd_area-&gt;pg )<br>&gt; + =C2=A0 =
=C2=A0{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0gfn_t gfn =3D mfn_to_gfn(d, d_=
mfn);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0struct p2m_domain *p2m =3D p2m_g=
et_hostp2m(cd_vcpu-&gt;domain);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_ty=
pe_t p2mt;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_access_t p2ma;<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int offset;<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int ret;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn=
 =3D p2m-&gt;get_entry(p2m, gfn, &amp;p2mt, &amp;p2ma, 0, NULL, NULL);<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( mfn_eq(cd_mfn, INVALID_MFN) )<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0struct page_info *pg =3D alloc_domheap_page(cd_vcpu-&gt;domain, 0=
);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !pg )<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EN=
OMEM;<br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =
=3D page_to_mfn(pg);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set=
_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));<br>&gt; +<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D p2m-&gt;set_entry(p2m, gfn, cd_mfn, =
PAGE_ORDER_4K, p2m_ram_rw,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
2m-&gt;default_access, -1);<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if ( ret )<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0else if ( p2mt !=3D p2m_ram_rw )<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>&gt; +<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/*<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Simply speci=
fy the entire range up to the end of the page. All the<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * function uses it for is a check for not crossing page b=
oundaries.<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0offset =3D PAGE_OFFSET(d_area-&gt;map);<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret =3D map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset=
,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_SIZE - offset, cd_area, NULL);<br>&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return ret;<br>&gt; + =C2=A0 =C2=A0}<br>&gt; + =C2=A0 =
=C2=A0else<br><div>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D page_to_mfn=
(cd_area-&gt;pg);</div><div><br></div><div>Everything to this point seems t=
o be non mem-sharing/forking related. Could these live somewhere else? Ther=
e must be some other place where allocating these areas happens already for=
 non-fork VMs so it would make sense to just refactor that code to be calla=
ble from here.<br></div><div><br></div>&gt; +<br>&gt; + =C2=A0 =C2=A0copy_d=
omain_page(cd_mfn, d_mfn);<br>&gt; +<br>&gt; + =C2=A0 =C2=A0return 0;<br>&g=
t; +}<br>&gt; +<br>&gt; =C2=A0static int copy_vpmu(struct vcpu *d_vcpu, str=
uct vcpu *cd_vcpu)<br>&gt; =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0struct vpmu_=
struct *d_vpmu =3D vcpu_vpmu(d_vcpu);<br>&gt; @@ -1745,6 +1804,16 @@ static=
 int copy_vcpu_settings(struct dom<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);<br>&gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Same for the (physically registered) runstate and time info ar=
eas. */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D copy_guest_area(&amp;c=
d_vcpu-&gt;runstate_guest_area,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;d_vcpu-&gt;runstate_guest_area, cd_vcpu, d);<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ( ret )<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn ret;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D copy_guest_area(&amp;=
cd_vcpu-&gt;arch.time_guest_area,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;d_vcpu-&gt;arch.time_guest_area, cd_vcpu, d);<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ( ret )<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return ret;<br>&gt; +<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D cop=
y_vpmu(d_vcpu, cd_vcpu);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret=
 )<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&=
gt; @@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain<br>&gt;=
<br>&gt; =C2=A0 state:<br>&gt; =C2=A0 =C2=A0 =C2=A0if ( reset_state )<br>&g=
t; + =C2=A0 =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D copy_s=
ettings(d, pd);<br><div>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TBD: What to d=
o here with -ERESTART? */</div><div><br></div><div>Where does ERESTART comi=
ng from?<br></div></div>

--0000000000005f6bb505f2f0a22f--

