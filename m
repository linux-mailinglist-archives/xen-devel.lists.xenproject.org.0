Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192B2210AE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:18:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvjAG-0003uA-Sq; Wed, 15 Jul 2020 15:17:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvjAG-0003u5-24
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:17:44 +0000
X-Inumbo-ID: 543f182a-c6ae-11ea-bca7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 543f182a-c6ae-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594826263;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yETrZ0jRFJ21wdLMJaSuvvLmnouw5Q8hyeovgzLGKq0=;
 b=QnLonrapaQUkNuK4oTHI/cqOeZtZJRWmXK1KqV20jnhRhhNKkLdIRf8t
 19DsvxhXwwBQxISdfHIs+V64oFVxIBpbOmkI3XQVN0nMYUuPSR6kere0e
 I52gwQ+sPvkileeTx9LCXP24F7RjD/y0CGnwQjvuWscnU01RiJ5AYsXn+ 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QCX7I9qvL8lSTyGjeqiCzn8Wufn8YQiM5bKagH93Anez7ScorX051BT1NfqxpZK47w17iwPrAt
 vlrW0ZP6kaGlLUh6PrXbNvahQyfKW0d0aAzvN+YQj8H44OTQdyKqlt2xrM15qcTA9BYx2TjxWG
 eTDCGE0zb/Yqhh5W7fGvfwzK6p8Ro9rOuF94XCdt32JZ7r1BTBGhqWp0xx4XfefSdNUT/sR9zu
 BX680PZN1cikLi+JyG4E2z4u+sKNoTtCf1SLHCAkzIzUfTlAkCn+wET5+AdT6SZ/6PSwO6H710
 gZU=
X-SBRS: 2.7
X-MesageID: 23292598
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="23292598"
Date: Wed, 15 Jul 2020 17:17:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 05/11] tools/libxl: add vmtrace_pt_size parameter
Message-ID: <20200715151735.GC7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <ac7b950a7ef86cbf0c63fe428ec94e2b6fe27453.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac7b950a7ef86cbf0c63fe428ec94e2b6fe27453.1594150543.git.michal.leszczynski@cert.pl>
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
Cc: luwei.kang@intel.com, Wei Liu <wl@xen.org>, tamas.lengyel@intel.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 07, 2020 at 09:39:44PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to specify the size of per-vCPU trace buffer upon
> domain creation. This is zero by default (meaning: not enabled).
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/libxl/libxl.h                  |  8 ++++++++
>  tools/libxl/libxl_create.c           |  1 +
>  tools/libxl/libxl_types.idl          |  4 ++++
>  tools/xl/xl_parse.c                  | 22 ++++++++++++++++++++++
>  7 files changed, 51 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 0532739c1f..ddef9b6014 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -683,6 +683,19 @@ If this option is not specified then it will default to B<false>.
>  
>  =back
>  
> +=item B<processor_trace_buf_kb=KBYTES>
> +
> +Specifies the size of processor trace buffer that would be allocated
> +for each vCPU belonging to this domain. Disabled (i.e.
> +B<processor_trace_buf_kb=0> by default. This must be set to
> +non-zero value in order to be able to use processor tracing features
> +with this domain.
> +
> +B<NOTE>: In order to use Intel Processor Trace feature, this value
> +must be between 8 kB and 4 GB and it must be a power of 2.

I think the minimum that we could support is 4KB? (ie: one page?). Not
that it matters much, as I don't think anyone would use such small
buffers.

> diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
> index 9d3f05f399..748fde65ab 100644
> --- a/tools/libxl/libxl_types.idl
> +++ b/tools/libxl/libxl_types.idl
> @@ -645,6 +645,10 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      # supported by x86 HVM and ARM support is planned.
>      ("altp2m", libxl_altp2m_mode),
>  
> +    # Size of preallocated processor trace buffers (in KBYTES).
> +    # Use zero value to disable this feature.
> +    ("processor_trace_buf_kb", integer),

MemKB should be used here instead of integer.

> +
>      ], dir=DIR_IN,
>         copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
>  )
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 61b4ef7b7e..87e373b413 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1861,6 +1861,28 @@ void parse_config_data(const char *config_source,
>          }
>      }
>  
> +    if (!xlu_cfg_get_long(config, "processor_trace_buf_kb", &l, 1) && l) {
> +        if (l & (l - 1)) {
> +            fprintf(stderr, "ERROR: processor_trace_buf_kb"
> +                            " - must be a power of 2\n");
> +            exit(1);
> +        }
> +
> +        if (l < 8) {
> +            fprintf(stderr, "ERROR: processor_trace_buf_kb"
> +                            " - value is too small\n");
> +            exit(1);
> +        }
> +
> +        if (l > 1024*1024*4) {
> +            fprintf(stderr, "ERROR: processor_trace_buf_kb"
> +                            " - value is too large\n");
> +            exit(1);

Those checks shouldn't be here, this is libxl common code, and those
limitations are specific to the Intel implementation. Those should be
inside of the hypervisor IMO, or if we really want to have them in
libxl for some reason they should be moved to libxl_x86.c

Thanks.

