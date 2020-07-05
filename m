Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE2214EC9
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 21:03:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9up-0007ZF-MX; Sun, 05 Jul 2020 19:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgbI=AQ=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1js9un-0007ZA-Sz
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 19:03:01 +0000
X-Inumbo-ID: 24619920-bef2-11ea-8c05-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24619920-bef2-11ea-8c05-12813bfff9fa;
 Sun, 05 Jul 2020 19:02:59 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 704E0A20CC;
 Sun,  5 Jul 2020 21:02:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6D318A2022;
 Sun,  5 Jul 2020 21:02:57 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id C4JvvuLBAb7c; Sun,  5 Jul 2020 21:02:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7FF2FA20CC;
 Sun,  5 Jul 2020 21:02:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QJNZsigDHHcD; Sun,  5 Jul 2020 21:02:56 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5A114A2022;
 Sun,  5 Jul 2020 21:02:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 4B84822A09;
 Sun,  5 Jul 2020 21:02:26 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0SCzO9XgUyOs; Sun,  5 Jul 2020 21:02:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8F03022C51;
 Sun,  5 Jul 2020 21:02:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3Avyv-nzelws; Sun,  5 Jul 2020 21:02:20 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7148722C50;
 Sun,  5 Jul 2020 21:02:20 +0200 (CEST)
Date: Sun, 5 Jul 2020 21:02:20 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <1763045628.19744689.1593975740414.JavaMail.zimbra@cert.pl>
In-Reply-To: <f7e3c91789a7763b997918b6ebb987be670f9ce5.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <f7e3c91789a7763b997918b6ebb987be670f9ce5.1593974333.git.michal.leszczynski@cert.pl>
Subject: Re: [PATCH v5 05/11] tools/libxl: add vmtrace_pt_size parameter
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: tools/libxl: add vmtrace_pt_size parameter
Thread-Index: r6wk3k4v+wV7+SIKpnvkyBjdP7odSg==
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
Cc: luwei kang <luwei.kang@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 tamas lengyel <tamas.lengyel@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 5 lip 2020 o 20:54, Micha=C5=82 Leszczy=C5=84ski michal.leszczynski@c=
ert.pl napisa=C5=82(a):

> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>=20
> Allow to specify the size of per-vCPU trace buffer upon
> domain creation. This is zero by default (meaning: not enabled).
>=20
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
> docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
> tools/golang/xenlight/helpers.gen.go |  2 ++
> tools/golang/xenlight/types.gen.go   |  1 +
> tools/libxl/libxl.h                  |  8 ++++++++
> tools/libxl/libxl_create.c           |  1 +
> tools/libxl/libxl_types.idl          |  2 ++
> tools/xl/xl_parse.c                  | 22 ++++++++++++++++++++++
> 7 files changed, 47 insertions(+)
>=20
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 0532739c1f..670759f6bd 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -278,6 +278,17 @@ memory=3D8096 will report significantly less memory =
available
> for use
> than a system with maxmem=3D8096 memory=3D8096 due to the memory overhead
> of having to track the unused pages.
>=20
> +=3Ditem B<processor_trace_buffer_size=3DBYTES>
> +
> +Specifies the size of processor trace buffer that would be allocated
> +for each vCPU belonging to this domain. Disabled (i.e.
> +B<processor_trace_buffer_size=3D0> by default. This must be set to
> +non-zero value in order to be able to use processor tracing features
> +with this domain.
> +
> +B<NOTE>: The size value must be between 4 kB and 4 GB and it must
> +be also a power of 2.
> +
> =3Dback
>=20
> =3Dhead3 Guest Virtual NUMA Configuration
> diff --git a/tools/golang/xenlight/helpers.gen.go
> b/tools/golang/xenlight/helpers.gen.go
> index 152c7e8e6b..bfc37b69c8 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1117,6 +1117,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)=
}
> x.ArchArm.GicVersion =3D GicVersion(xc.arch_arm.gic_version)
> x.ArchArm.Vuart =3D VuartType(xc.arch_arm.vuart)
> x.Altp2M =3D Altp2MMode(xc.altp2m)
> +x.VmtracePtOrder =3D int(xc.vmtrace_pt_order)
>=20
>  return nil}
>=20
> @@ -1592,6 +1593,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)=
}
> xc.arch_arm.gic_version =3D C.libxl_gic_version(x.ArchArm.GicVersion)
> xc.arch_arm.vuart =3D C.libxl_vuart_type(x.ArchArm.Vuart)
> xc.altp2m =3D C.libxl_altp2m_mode(x.Altp2M)
> +xc.vmtrace_pt_order =3D C.int(x.VmtracePtOrder)
>=20
>  return nil
>  }
> diff --git a/tools/golang/xenlight/types.gen.go
> b/tools/golang/xenlight/types.gen.go
> index 663c1e86b4..f9b07ac862 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -516,6 +516,7 @@ GicVersion GicVersion
> Vuart VuartType
> }
> Altp2M Altp2MMode
> +VmtracePtOrder int
> }
>=20
> type domainBuildInfoTypeUnion interface {
> diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
> index 1cd6c38e83..4abb521756 100644
> --- a/tools/libxl/libxl.h
> +++ b/tools/libxl/libxl.h
> @@ -438,6 +438,14 @@
>  */
> #define LIBXL_HAVE_CREATEINFO_PASSTHROUGH 1
>=20
> +/*
> + * LIBXL_HAVE_VMTRACE_PT_ORDER indicates that
> + * libxl_domain_create_info has a vmtrace_pt_order parameter, which
> + * allows to enable pre-allocation of processor tracing buffers
> + * with the given order of size.
> + */
> +#define LIBXL_HAVE_VMTRACE_PT_ORDER 1
> +
> /*
>  * libxl ABI compatibility
>  *
> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> index 2814818e34..82b595161a 100644
> --- a/tools/libxl/libxl_create.c
> +++ b/tools/libxl/libxl_create.c
> @@ -608,6 +608,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_co=
nfig
> *d_config,
>             .max_evtchn_port =3D b_info->event_channels,
>             .max_grant_frames =3D b_info->max_grant_frames,
>             .max_maptrack_frames =3D b_info->max_maptrack_frames,
> +            .vmtrace_pt_order =3D b_info->vmtrace_pt_order,
>         };
>=20
>         if (info->type !=3D LIBXL_DOMAIN_TYPE_PV) {
> diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
> index 9d3f05f399..1c5dd43e4d 100644
> --- a/tools/libxl/libxl_types.idl
> +++ b/tools/libxl/libxl_types.idl
> @@ -645,6 +645,8 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>     # supported by x86 HVM and ARM support is planned.
>     ("altp2m", libxl_altp2m_mode),
>=20
> +    ("vmtrace_pt_order", integer),
> +
>     ], dir=3DDIR_IN,
>        copy_deprecated_fn=3D"libxl__domain_build_info_copy_deprecated",
> )
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 61b4ef7b7e..279f7c14d3 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1861,6 +1861,28 @@ void parse_config_data(const char *config_source,
>         }
>     }
>=20
> +    if (!xlu_cfg_get_long(config, "processor_trace_buffer_size", &l, 1) =
&& l) {
> +        int32_t shift =3D 0;
> +
> +        if (l & (l - 1))
> +        {
> +            fprintf(stderr, "ERROR: processor_trace_buffer_size "
> +=09=09=09    "- must be a power of 2\n");
> +            exit(1);
> +        }
> +
> +        while (l >>=3D 1) ++shift;
> +
> +        if (shift <=3D XEN_PAGE_SHIFT)
> +        {
> +            fprintf(stderr, "ERROR: processor_trace_buffer_size "
> +=09=09=09    "- value is too small\n");
> +            exit(1);
> +        }
> +
> +        b_info->vmtrace_pt_order =3D shift - XEN_PAGE_SHIFT;
> +    }
> +
>     if (!xlu_cfg_get_list(config, "ioports", &ioports, &num_ioports, 0)) =
{
>         b_info->num_ioports =3D num_ioports;
>         b_info->ioports =3D calloc(num_ioports, sizeof(*b_info->ioports))=
;
> --
> 2.17.1


As there were many different ideas about how the naming scheme should be
and what kinds of values should be passed where, I would like to discuss
this particular topic. Right now we have it pretty confusing:

* user sets "processor_trace_buffer_size" option in xl.cfg
* domain creation hypercall uses "vmtrace_pt_order" (derived from above)
* hypervisor side stores "vmtrace_pt_size" (converted back to bytes)


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska


