Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE55637CD7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 16:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447979.704684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyE39-0000hc-GS; Thu, 24 Nov 2022 15:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447979.704684; Thu, 24 Nov 2022 15:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyE39-0000fB-CA; Thu, 24 Nov 2022 15:22:03 +0000
Received: by outflank-mailman (input) for mailman id 447979;
 Thu, 24 Nov 2022 15:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EC/E=3Y=citrix.com=prvs=320cd9450=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oyE37-0000f5-RT
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 15:22:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc86227f-6c0b-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 16:22:00 +0100 (CET)
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
X-Inumbo-ID: bc86227f-6c0b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669303319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mzlr09z995zdUh6ynEFT2+xHtAeZpxOVWS5vpRPvMCE=;
  b=NuccLP9c8W6mWRwGOi5WIdda6EJXJI1j/w0eV/DxQpB9YUGd1O4Pdeup
   038u2f1QxK4XpfggNewue3OvpHqzeux5EoRdM63ORpV8AlGp2H1q164Ys
   r8lW6mEDZG8Co/alkwGaG4VMy1NZAFbviV4vIEuf8WCmSzoeogQ5lEXSN
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85923034
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q8wDT6JzTpAOsU8sFE+RK5UlxSXFcZb7ZxGr2PjKsXjdYENShTMEy
 GdJCmmGO/fZMGGjetwkat+xoEsHv8eAnYcySQRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wZiPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pOX1W8
 +UiBgsVdwHS2LKwwfG6dMNz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozXFJ8Oxh3Ez
 o7A11W6Ik8KH9m78Cec2W6Wq8/TpSjpBI1HQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3L
 1Ef/yslpqk13EOuR9j5GRa/pRasuxcGUN0WCOo+6QyXy4LR4gCUHHYNVS9aLsArv89ebT4lz
 FiShPvyGCdi9raSTBq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIa+h8fxHnf2x
 DaDsC8WgrQVgNQV3r6q5hbbjjmszrDASAIv6wyRVGu+8gR/ZaagZoql80bS9udbapqURVnpl
 H0NgcOZqvsJCZCAji2lXeMMGbaz6rCELFXhbUVHRsd7sW73ojj6IN4WsGoWyFpV3tgsJwf1e
 EnKgy1q/IZCbST6a640YrybFJF/pUT/LujNWvfRZ9tIR5F+cg6b4S1jDXKtM3DRfFsEyv9mZ
 8rCGSq4JTNDUPk8kmLqLwsI+eVzrh3S018/UnwSI/6P9bOFLECYRr4eWLdlRrBotfjUyOk5H
 js2Cidr9/m9eLemCsU02dRJRbzvEUXX/bis96Rqmhere2KL2AgJUpc9O48JdY1/hLhynezV5
 Hy7UUIw4AOh2yydc1XWOiA4MuuHsXNDQZUTZHxEALpV8yJ7PdbHAFk3KfPbgoXLBMQ8lKUpH
 pHpiu2LA+hVSySvxtjuRcCVkWGjHTz17T+z092NOmZgJ88+HVeTq7cJvGLHrUEzM8Z+juNmy
 5XI6+8RacNrq9hKZCoOVM+S8g==
IronPort-HdrOrdr: A9a23:czhVW6Dim9rlV1DlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85923034"
Date: Thu, 24 Nov 2022 15:21:48 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: <xen-devel@lists.xenproject.org>, <marco.solieri@unimore.it>,
	<andrea.bastoni@minervasys.tech>, <lucmiccio@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Marco Solieri
	<marco.solieri@minervasys.tech>
Subject: Re: [PATCH v3 4/9] tools/xl: add support for cache coloring
 configuration
Message-ID: <Y3+MDElm8YQ7/2nS@perard.uk.xensource.com>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-5-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221022155120.7000-5-carlo.nonato@minervasys.tech>

On Sat, Oct 22, 2022 at 05:51:15PM +0200, Carlo Nonato wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b2901e04cf..5f53cec8bf 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2880,6 +2880,16 @@ Currently, only the "sbsa_uart" model is supported for ARM.
>  
>  =back
>  
> +=over 4
> +
> +=item B<colors=[ "COLORS_RANGE", "COLORS_RANGE", ...]>

Instead of COLORS_RANGE, maybe NUMBER_RANGE? Or just RANGE?

> +Specify the LLC color configuration for the guest. B<COLORS_RANGE> can be either
> +a single color value or a hypen-separated closed interval of colors
> +(such as "0-4").

Does "yellow-blue" works? Or "red-violet", to have a rainbow? :-)

So, "colors" as the name of a new configuration option isn't going to
work. To me, that would refer to VM managment, like maybe help to
categorise VM in some kind of tools, and not a part of the configuration
of the domain.

Could you invent a name that is more specific? Maybe "cache_colors" or
something, or "vcpu_cache_colors".

> +=back
> +
>  =head3 x86
>  
>  =over 4
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index b9dd2deedf..94c511912c 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -615,6 +615,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>      struct xs_permissions rwperm[1];
>      struct xs_permissions noperm[1];
>      xs_transaction_t t = 0;
> +    DECLARE_HYPERCALL_BUFFER(unsigned int, colors);
>  
>      /* convenience aliases */
>      libxl_domain_create_info *info = &d_config->c_info;
> @@ -676,6 +677,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>              goto out;
>          }
>  
> +        if (d_config->b_info.num_colors) {
> +            size_t bytes = sizeof(unsigned int) * d_config->b_info.num_colors;
> +            colors = xc_hypercall_buffer_alloc(ctx->xch, colors, bytes);

Hypercall stuff is normally done in another library, libxenctrl (or
maybe others like libxenguest). Is there a reason to do that here?

> +            memcpy(colors, d_config->b_info.colors, bytes);
> +            set_xen_guest_handle(create.arch.colors, colors);
> +            create.arch.num_colors = d_config->b_info.num_colors;
> +            create.arch.from_guest = 1;

"arch" stuff is better dealt with in libxl__arch_domain_prepare_config().
(unless it isn't arch specific in the next revision of the series)

> +            LOG(DEBUG, "Setup %u domain colors", d_config->b_info.num_colors);



> +        }
> +
>          for (;;) {
>              uint32_t local_domid;
>              bool recent;
> @@ -922,6 +933,7 @@ retry_transaction:
>      rc = 0;
>   out:
>      if (t) xs_transaction_end(ctx->xsh, t, 1);
> +    if (colors) xc_hypercall_buffer_free(ctx->xch, colors);
>      return rc;
>  }
>  
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index d634f304cd..642173af1a 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -557,6 +557,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("ioports",          Array(libxl_ioport_range, "num_ioports")),
>      ("irqs",             Array(uint32, "num_irqs")),
>      ("iomem",            Array(libxl_iomem_range, "num_iomem")),
> +    ("colors",           Array(uint32, "num_colors")),

So the colors is added to arch specific config in
xen_domctl_createdomain, maybe we should do the same here and move it to
the "arch_arm" struct. Or if that is declared common in hypervisor, then
it is file to leave it here.

Also, "colors" needs to be rename to something more specific.

>      ("claim_mode",	     libxl_defbool),
>      ("event_channels",   uint32),
>      ("kernel",           string),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1b5381cef0..e6b2c7acff 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1220,8 +1220,9 @@ void parse_config_data(const char *config_source,
>      XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
>                     *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
>      XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
> -                   *mca_caps;
> -    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
> +                   *mca_caps, *colors;
> +    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps,
> +        num_colors;

Please, add a new lines instead of increasing the number of declared
variable on a single line.

>      int pci_power_mgmt = 0;
>      int pci_msitranslate = 0;
>      int pci_permissive = 0;
> @@ -1370,6 +1371,53 @@ void parse_config_data(const char *config_source,
>      if (!xlu_cfg_get_long (config, "maxmem", &l, 0))
>          b_info->max_memkb = l * 1024;
>  
> +    if (!xlu_cfg_get_list(config, "colors", &colors, &num_colors, 0)) {
> +        int k, p, cur_index = 0;
> +
> +        b_info->num_colors = 0;
> +        /* Get number of colors based on ranges */
> +        for (i = 0; i < num_colors; i++) {
> +            uint32_t start = 0, end = 0;
> +
> +            buf = xlu_cfg_get_listitem(colors, i);
> +            if (!buf) {
> +                fprintf(stderr,
> +                    "xl: Unable to get element %d in colors range list\n", i);
> +                exit(1);
> +            }
> +
> +            if (sscanf(buf, "%u-%u", &start, &end) != 2) {
> +                if (sscanf(buf, "%u", &start) != 1) {

I think you want %"SCNu32" instead of %u as both start and end are
uint32_t.

> +                    fprintf(stderr, "xl: Invalid color range: %s\n", buf);
> +                    exit(1);
> +                }
> +                end = start;
> +            }
> +            else if (start > end) {

Can you put the "else" on the same line as "}" ?
> +                fprintf(stderr,
> +                        "xl: Start color is greater than end color: %s\n", buf);
> +                exit(1);
> +            }
> +
> +            /* Check for overlaps */
> +            for (k = start; k <= end; k++) {
> +                for (p = 0; p < b_info->num_colors; p++) {
> +                    if (b_info->colors[p] == k) {
> +                        fprintf(stderr, "xl: Overlapped ranges not allowed\n");

Why is that an issue? Could overlap just been ignored?

> +                        exit(1);
> +                    }
> +                }
> +            }
> +
> +            b_info->num_colors += (end - start) + 1;
> +            b_info->colors = (uint32_t *)realloc(b_info->colors,
> +                                sizeof(*b_info->colors) * b_info->num_colors);
> +
> +            for (k = start; k <= end; k++)
> +                b_info->colors[cur_index++] = k;

This `b_info->colors` feels like it could be a bitmap like for "vcpus"
or other config that deal with ranges.

libxl has plenty of functions to deal with bitmap that xl can use,
starting with libxl_bitmap_alloc(), maybe it would make dealing with
cache color easier, like no need to check for overlaps, but there
doesn't seems to be a function to deal with a growing bitmap so one
would have to find the highest cache value before allocating the bitmap
are deal with realloc.

I guess using bitmap or not kind of depend of the interface with the
hypervisor, if it take a list of number, then a list of number is fine
here too.


Thanks,

-- 
Anthony PERARD

