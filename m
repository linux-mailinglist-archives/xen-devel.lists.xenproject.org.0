Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13B820B0EF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:53:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomub-0002qi-GT; Fri, 26 Jun 2020 11:52:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jomuZ-0002qd-RJ
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:52:51 +0000
X-Inumbo-ID: 8f78cd42-b7a3-11ea-82a7-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f78cd42-b7a3-11ea-82a7-12813bfff9fa;
 Fri, 26 Jun 2020 11:52:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a6so9222377wrm.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 04:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EkhxY+ao3nRfJJXmQYt+sSP5pxPXEoEkVsAek7Jpfco=;
 b=nguc++Aa0v4HcB0eqXcfDng5M1a0FTs1VWrjPWQZaeGMpRzRSGtrpaqKn3Y2cXFlTP
 bGn91KH/dxEn/MDwWkP4Kf2BVj2ajRZjOEFzmgpZhT0ph0rKUmd9uwUmw9FSYlPy5d2V
 Y/9tWyd84uiLUCP/szz+QaOGJVgumL5lf+K84urnfABE3XRh8ybYydy0SCeXPui35pRp
 A4Dpv+V1y97vJl9mN8Hi1FT+PZYSoDNxtz++X462i5Uf96gsDEaDzjB6gcacLHmxccrZ
 U0yfjvQFKc0ap270Y1FOYTEdm8+n3vuy0EXF38MISif8MxX71P2J1Kti2wNTD6zyJ+Xx
 U3wA==
X-Gm-Message-State: AOAM531m6z5l4JcqFNMdChENvkiZY0Ivplmc0YoGsOMsMyYU9vc9rcaI
 uCQzR9bgPTHcDxZEH0LQDLc=
X-Google-Smtp-Source: ABdhPJwFKfgVn8dvuxZ38kkydxqedFEFWzNdLmdI1V6L/7zpM7qjAA84fEvolQzyU55LdEnD130aDQ==
X-Received: by 2002:a5d:40cf:: with SMTP id b15mr3271179wrq.319.1593172369858; 
 Fri, 26 Jun 2020 04:52:49 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s8sm30438524wru.38.2020.06.26.04.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 04:52:49 -0700 (PDT)
Date: Fri, 26 Jun 2020 11:52:47 +0000
From: Wei Liu <wl@xen.org>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v3 6/7] tools/libxl: add vmtrace_pt_size parameter
Message-ID: <20200626115247.rbk74px33iapenzm@liuwe-devbox-debian-v2>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
 <192922589.11444004.1592849546858.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <192922589.11444004.1592849546858.JavaMail.zimbra@cert.pl>
User-Agent: NeoMutt/20180716
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 08:12:26PM +0200, Michał Leszczyński wrote:
> Allow to specify the size of per-vCPU trace buffer upon
> domain creation. This is zero by default (meaning: not enabled).
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  docs/man/xl.cfg.5.pod.in             | 10 ++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/libxl/libxl_create.c           |  1 +
>  tools/libxl/libxl_types.idl          |  2 ++
>  tools/xl/xl_parse.c                  |  4 ++++
>  6 files changed, 20 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 0532739c1f..78f434b722 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -278,6 +278,16 @@ memory=8096 will report significantly less memory available for use
>  than a system with maxmem=8096 memory=8096 due to the memory overhead
>  of having to track the unused pages.
>  
> +=item B<vmtrace_pt_size=BYTES>
> +
> +Specifies the size of processor trace buffer that would be allocated
> +for each vCPU belonging to this domain. Disabled (i.e. B<vmtrace_pt_size=0>
> +by default. This must be set to non-zero value in order to be able to
> +use processor tracing features with this domain.
> +
> +B<NOTE>: The size value must be between 4 kB and 4 GB and it must
> +be also a power of 2.
> +

Is this restriction enforced anywhere? I don't see it in this patch.

>  =back
>  
>  =head3 Guest Virtual NUMA Configuration
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index 935d3bc50a..986ebbd681 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1117,6 +1117,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
>  x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
>  x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
>  x.Altp2M = Altp2MMode(xc.altp2m)
> +x.VmtracePtSize = int(xc.vmtrace_pt_size)
>  
>   return nil}
>  
> @@ -1592,6 +1593,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
>  xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
>  xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
>  xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
> +xc.vmtrace_pt_size = C.int(x.VmtracePtSize)
>  
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 663c1e86b4..41ec7cdd32 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -516,6 +516,7 @@ GicVersion GicVersion
>  Vuart VuartType
>  }
>  Altp2M Altp2MMode
> +VmtracePtSize int
>  }
>  
>  type domainBuildInfoTypeUnion interface {
> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> index 75862dc6ed..32204b83b0 100644
> --- a/tools/libxl/libxl_create.c
> +++ b/tools/libxl/libxl_create.c
> @@ -608,6 +608,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>              .max_evtchn_port = b_info->event_channels,
>              .max_grant_frames = b_info->max_grant_frames,
>              .max_maptrack_frames = b_info->max_maptrack_frames,
> +            .vmtrace_pt_size = b_info->vmtrace_pt_size,
>          };
>  
>          if (info->type != LIBXL_DOMAIN_TYPE_PV) {
> diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
> index 9d3f05f399..04c1704b72 100644
> --- a/tools/libxl/libxl_types.idl
> +++ b/tools/libxl/libxl_types.idl
> @@ -645,6 +645,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      # supported by x86 HVM and ARM support is planned.
>      ("altp2m", libxl_altp2m_mode),
>  
> +    ("vmtrace_pt_size", integer),

When you add a new field please also add a LIBXL_HAVE macro to libxl.h.

> +
>      ], dir=DIR_IN,
>         copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
>  )
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 61b4ef7b7e..6ab98dda55 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1861,6 +1861,10 @@ void parse_config_data(const char *config_source,
>          }
>      }
>  
> +    if (!xlu_cfg_get_long(config, "vmtrace_pt_size", &l, 1)) {
> +        b_info->vmtrace_pt_size = l;
> +    }
> +
>      if (!xlu_cfg_get_list(config, "ioports", &ioports, &num_ioports, 0)) {
>          b_info->num_ioports = num_ioports;
>          b_info->ioports = calloc(num_ioports, sizeof(*b_info->ioports));
> -- 
> 2.20.1
> 
> 

