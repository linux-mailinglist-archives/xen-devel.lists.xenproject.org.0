Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD64220962
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:02:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveEz-0005nX-Au; Wed, 15 Jul 2020 10:02:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jveEy-0005mg-0g
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:02:16 +0000
X-Inumbo-ID: 425ab334-c682-11ea-93a9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 425ab334-c682-11ea-93a9-12813bfff9fa;
 Wed, 15 Jul 2020 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594807336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2PkuJRZvitgqE+amfJqSAmUoUPpETQKF/MbZNepc2qc=;
 b=I1ALDFenHUJKJ9YnKC9+Q45EAjFq8vzyzoTG/sB/vL6N64k4Ov8cX8NF
 RiRwOO5EfUHma/RZsXhIs5PCvYCkOKeZc0bzqztP7o5rj8nREocUfZkyQ
 P7TWZhn2lsTOgJrmQWb+rvhHCEFXVgFTO5WkwZRCDkQd0JDLr3pXxbwsE s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7zvnMzgC+7l7iVz1Pww9tMWX6sfYz4Ey5w4ngFuEnAIurqo5ZZcLlNbzhzcrZKNTz2sje5hulf
 xa0R2Yrh1xFLhVK5kEJk3eJd5X0wZXzF9z/znJorovciIUbdGrtzUYdpTJYlRv4HyifTS9/50E
 BotuTlcCfb0wF5KM8UawopcGneZO2rEQeKyEsPvx+8vzaWGPYqs/xbEHjPoI30guvzTr+6oMQO
 24HVNL/t0MuYO+iGqW3s2v22Upe4U5THbnCTxmVuhnUlLiwpxXSsRy4Ff4Cu3DHYEqlG+Y//J5
 G0U=
X-SBRS: 2.7
X-MesageID: 22420329
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,354,1589256000"; d="scan'208";a="22420329"
Date: Wed, 15 Jul 2020 12:02:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 03/11] x86/vmx: add IPT cpu feature
Message-ID: <20200715100207.GV7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <4d6eac657d082efaa0e7d141b5c9a07791b31f94.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d6eac657d082efaa0e7d141b5c9a07791b31f94.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 07, 2020 at 09:39:42PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Check if Intel Processor Trace feature is supported by current
> processor. Define vmtrace_supported global variable.

IIRC there was some discussion in previous versions about whether
vmtrace_supported should be globally exposed to all arches, since I
see the symbol is defined in a common file I assume Arm maintainers
agree to this approach, and hence it would be helpful to add a note to
the commit message, ie:

"The vmtrace_supported global variable is defined in common code with
the expectation that other arches also supporting processor tracing
can make use of it."

> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>

LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
>  xen/arch/x86/hvm/vmx/vmcs.c                 | 15 ++++++++++++++-
>  xen/common/domain.c                         |  2 ++
>  xen/include/asm-x86/cpufeature.h            |  1 +
>  xen/include/asm-x86/hvm/vmx/vmcs.h          |  1 +
>  xen/include/public/arch-x86/cpufeatureset.h |  1 +
>  xen/include/xen/domain.h                    |  2 ++
>  6 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index ca94c2bedc..3a53553f10 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -291,6 +291,20 @@ static int vmx_init_vmcs_config(void)
>          _vmx_cpu_based_exec_control &=
>              ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
>  
> +    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
> +
> +    /* Check whether IPT is supported in VMX operation. */
> +    if ( !smp_processor_id() )
> +        vmtrace_supported = cpu_has_ipt &&
> +                            (_vmx_misc_cap & VMX_MISC_PROC_TRACE);

Andrew also suggested to set vmtrace_supported to the value of
cpu_has_ipt during CPU identification and then clear it here if VMX
doesn't support IPT. Since this implementation won't add support for
PV guests I'm not specially trilled and I think this approach is fine
for the time being. If/When PV support is added we will have to
re-arrange this a bit.

Thanks.

