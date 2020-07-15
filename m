Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7062221068
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:09:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvj1l-0002ne-F4; Wed, 15 Jul 2020 15:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvj1j-0002nX-OT
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:08:55 +0000
X-Inumbo-ID: 19262482-c6ad-11ea-bca7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19262482-c6ad-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594825736;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UkLPCuhQ/WsRka3FdyCpuF4/kTgr19gqQgiD7k0GE20=;
 b=Qrmj0HvNwqJMCOK7yHJUUtdaj/uHV4/MbbRwfU1flv7US2RV6vG31x1U
 5lgUFERFXxFUlL672LQab0c17yKXzKYTXxy/gypkEDvpMsY+fi9/7Qnob
 9lFqFLJ0k1egpa6jWBXxubt4Pu+/KLJoUKImO34q8NZnFSr21c2Z1PlZe I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fJ1kjlxO2FthyXKxezrLDLEPdr3FBerqSF8kS3NqyqKXs0egrj8AWWYk5WZ30G1heLDvTMglDT
 sfxnBK2Ag+sPLRo98u7JwisWG5X5xHCSuavWq8W64WGIgbeC3FpHhNF9nxVexQFYYQSsWuXYkH
 i5C6KiQFF0SqpjHnfXUYcoGD7ntWhGoW9QnMjfLYCUDuxVUAWkPi3VvW3y6Q0hhmWpM6eJNm4I
 ++ySy62Z9iAqB5wdiEO0UbDYzvTjbXkBMTg5zQDgQXMApcoG612mgyLG1YQsCNHQLoEpNY90bd
 Y3A=
X-SBRS: 2.7
X-MesageID: 22449146
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22449146"
Date: Wed, 15 Jul 2020 17:08:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 04/11] common: add vmtrace_pt_size domain parameter
Message-ID: <20200715150846.GB7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <036bc768bfb074269d9bd4530304a11170b7142d.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <036bc768bfb074269d9bd4530304a11170b7142d.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 07, 2020 at 09:39:43PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Add vmtrace_pt_size domain parameter in live domain and
> vmtrace_pt_order parameter in xen_domctl_createdomain.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/domain.c       | 6 ++++++
>  xen/common/domain.c         | 9 +++++++++
>  xen/include/public/domctl.h | 1 +
>  xen/include/xen/sched.h     | 3 +++
>  4 files changed, 19 insertions(+)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index fee6c3931a..b75017b28b 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -499,6 +499,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           */
>          config->flags |= XEN_DOMCTL_CDF_oos_off;
>  
> +    if ( !hvm && config->processor_trace_buf_kb )
> +    {
> +        dprintk(XENLOG_INFO, "Processor trace is not supported on non-HVM\n");
> +        return -EINVAL;
> +    }
> +
>      return 0;
>  }
>  
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index a45cf023f7..e6e8f88da1 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -338,6 +338,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( config->processor_trace_buf_kb && !vmtrace_supported )
> +    {
> +        dprintk(XENLOG_INFO, "Processor tracing is not supported\n");
> +        return -EINVAL;
> +    }
> +
>      return arch_sanitise_domain_config(config);
>  }
>  
> @@ -443,6 +449,9 @@ struct domain *domain_create(domid_t domid,
>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>  
>          radix_tree_init(&d->pirq_tree);
> +
> +        if ( config->processor_trace_buf_kb )
> +            d->processor_trace_buf_kb = config->processor_trace_buf_kb;
>      }
>  
>      if ( (err = arch_domain_create(d, config)) != 0 )
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 59bdc28c89..7681675a94 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
>      uint32_t max_evtchn_port;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;
> +    uint32_t processor_trace_buf_kb;
>  
>      struct xen_arch_domainconfig arch;
>  };
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ac53519d7f..c046e59886 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,9 @@ struct domain
>      unsigned    pbuf_idx;
>      spinlock_t  pbuf_lock;
>  
> +    /* Used by vmtrace features */
> +    uint32_t    processor_trace_buf_kb;

Any reason for adding it here instead of doing it at the end of the
struct? Also I think this should be unsigned int, there's no reason to
use a specific width type here.

IMO it would be nice to have a Kconfig option for this, so that it can
be build time disabled, and for example disabled by default on Arm (or
on x86 if HVM is not built).

Most recently added features have followed this model for example
Argo, where a Kconfig option is added in order to build time disable
the added feature. Let me know if you need some tips about it, I'm
happy to help in order to try to get this in Kconfig.

Thanks, Roger.

