Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645C11A6842
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 16:41:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jO0GY-00043t-5P; Mon, 13 Apr 2020 14:40:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bkRy=55=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jO0GW-00043m-0D
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 14:40:48 +0000
X-Inumbo-ID: c33489f8-7d94-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c33489f8-7d94-11ea-b58d-bc764e2007e4;
 Mon, 13 Apr 2020 14:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=iG1fEbVBVOASbBGIGoNkV4/Ci4Hax3sGlwZy/6m68GA=; b=aimsvq7amG3V1KoBufqyW/7PXa
 CJWCR9uf/ZvjaWFu2pJLEutevKUAOdt+g0OnYI0Q9ShFiFKZBy1IIwL/jMvGbJ8nbMtPQaOsODq0G
 tQQVYZVxI18b2qhAKYwvf7ttd2ZAKGIqQaQ/p0+HbJH65RCa3Dv6YbIjRwUfamuZ+Kic=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jO0GR-0002t5-S7; Mon, 13 Apr 2020 14:40:43 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jO0GR-0006P1-IS; Mon, 13 Apr 2020 14:40:43 +0000
Date: Mon, 13 Apr 2020 15:40:40 +0100
From: Wei Liu <wl@xen.org>
To: Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH V8] x86/altp2m: Hypercall to set altp2m view visibility
Message-ID: <20200413144040.xaprxsniujid53zf@debian>
References: <20200413065113.27744-1-aisaila@bitdefender.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413065113.27744-1-aisaila@bitdefender.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 13, 2020 at 09:51:13AM +0300, Alexandru Isaila wrote:
[...]
> ---
>  tools/libxc/include/xenctrl.h   |  7 +++++++
>  tools/libxc/xc_altp2m.c         | 24 +++++++++++++++++++++++

Acked-by: Wei Liu <wl@xen.org>

>  xen/arch/x86/hvm/hvm.c          | 14 ++++++++++++++
>  xen/arch/x86/hvm/vmx/vmx.c      |  2 +-
>  xen/arch/x86/mm/hap/hap.c       | 15 +++++++++++++++
>  xen/arch/x86/mm/p2m-ept.c       |  1 +
>  xen/arch/x86/mm/p2m.c           | 34 +++++++++++++++++++++++++++++++--
>  xen/include/asm-x86/domain.h    |  1 +
>  xen/include/asm-x86/p2m.h       |  4 ++++
>  xen/include/public/hvm/hvm_op.h |  9 +++++++++
>  10 files changed, 108 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index 58fa931de1..5f25c5a6d4 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -1943,6 +1943,13 @@ int xc_altp2m_change_gfn(xc_interface *handle, uint32_t domid,
>                           xen_pfn_t new_gfn);
>  int xc_altp2m_get_vcpu_p2m_idx(xc_interface *handle, uint32_t domid,
>                                 uint32_t vcpuid, uint16_t *p2midx);
> +/*
> + * Set view visibility for xc_altp2m_switch_to_view and vmfunc.
> + * Note: If altp2m mode is set to mixed the guest is able to change the view
> + * visibility and then call vmfunc.
> + */
> +int xc_altp2m_set_visibility(xc_interface *handle, uint32_t domid,
> +                             uint16_t view_id, bool visible);
>  
>  /** 
>   * Mem paging operations.
> diff --git a/tools/libxc/xc_altp2m.c b/tools/libxc/xc_altp2m.c
> index 46fb725806..6987c9541f 100644
> --- a/tools/libxc/xc_altp2m.c
> +++ b/tools/libxc/xc_altp2m.c
> @@ -410,3 +410,27 @@ int xc_altp2m_get_vcpu_p2m_idx(xc_interface *handle, uint32_t domid,
>      xc_hypercall_buffer_free(handle, arg);
>      return rc;
>  }
> +
> +int xc_altp2m_set_visibility(xc_interface *handle, uint32_t domid,
> +                             uint16_t view_id, bool visible)
> +{
> +    int rc;
> +
> +    DECLARE_HYPERCALL_BUFFER(xen_hvm_altp2m_op_t, arg);
> +
> +    arg = xc_hypercall_buffer_alloc(handle, arg, sizeof(*arg));
> +    if ( arg == NULL )
> +        return -1;
> +
> +    arg->version = HVMOP_ALTP2M_INTERFACE_VERSION;
> +    arg->cmd = HVMOP_altp2m_set_visibility;
> +    arg->domain = domid;
> +    arg->u.set_visibility.altp2m_idx = view_id;
> +    arg->u.set_visibility.visible = visible;
> +
> +    rc = xencall2(handle->xcall, __HYPERVISOR_hvm_op, HVMOP_altp2m,
> +                  HYPERCALL_BUFFER_AS_ARG(arg));
> +
> +    xc_hypercall_buffer_free(handle, arg);
> +    return rc;
> +}
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c

