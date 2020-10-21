Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976F52951C8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 19:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10137.26804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVIEj-0007Tq-0M; Wed, 21 Oct 2020 17:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10137.26804; Wed, 21 Oct 2020 17:49:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVIEi-0007TR-TQ; Wed, 21 Oct 2020 17:49:20 +0000
Received: by outflank-mailman (input) for mailman id 10137;
 Wed, 21 Oct 2020 17:49:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVIEh-0007TM-N2
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 17:49:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13779129-d811-48ac-8c7a-6ce4c0cdd585;
 Wed, 21 Oct 2020 17:49:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yt4r=D4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVIEh-0007TM-N2
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 17:49:19 +0000
X-Inumbo-ID: 13779129-d811-48ac-8c7a-6ce4c0cdd585
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 13779129-d811-48ac-8c7a-6ce4c0cdd585;
	Wed, 21 Oct 2020 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603302558;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=+HYpv9sM4gfGI+KPF7hJF4XqQpPinO3QulYldAM9FU4=;
  b=Ynjnc+0F+gg9pvHNPd8/jdDz82TrecUhMnvqFfxRtjtBUPzRcPFYOIKJ
   gn3ceXC7e3H4imJrEpBH2SuglO8Rr0pmnV5S9pEzAgaFuNWWghlP1N7wH
   l3MKGCgIjr0GOVjT8ijphCxs909y5IeX+7isqDhOceAmvvmDjaJ67N8vI
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nSO4HHEtLjwvDW/mEN8htJRTsK8GuD0HOuDkGRe3CuG6tN7+WZnk3CXKBzh1ILLLFb6iyGvhZ0
 Kx4I/xGKFiewTWRUuo+Q6RwEeUU5icU+fI69dXLInAMlhp/l5VGfmZbUv1OnmS3HknGlyGgh5x
 qSgVMRD6w3Yh6PcUXi1Ch8UdoUsrZM+jCE6vAHlcsplawvGZd5AlpKDmjNMxzhzlgjjPv2x60z
 5vR9d49mlmq2IsZBvuAFYy8RqFr85Ra5vB7ecSgYhYoASgF39GOkKMPtUj50kyAkpwH2W+mkVf
 zQw=
X-SBRS: 2.5
X-MesageID: 29562355
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29562355"
Subject: Re: [PATCH v2 01/14] kernel-doc: public/arch-arm.h
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <george.dunlap@citrix.com>, <ian.jackson@eu.citrix.com>,
	<jbeulich@suse.com>, <julien@xen.org>, <wl@xen.org>,
	<Bertrand.Marquis@arm.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
 <20201021000011.15351-1-sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1659282c-dc07-ee3e-9c1d-654861643b72@citrix.com>
Date: Wed, 21 Oct 2020 18:47:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021000011.15351-1-sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 21/10/2020 00:59, Stefano Stabellini wrote:
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index c365b1b39e..409697dede 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -201,7 +208,9 @@ typedef uint64_t xen_pfn_t;
>  #define PRI_xen_pfn PRIx64
>  #define PRIu_xen_pfn PRIu64
>  
> -/*
> +/**
> + * DOC: XEN_LEGACY_MAX_VCPUS
> + *
>   * Maximum number of virtual CPUs in legacy multi-processor guests.
>   * Only one. All other VCPUS must use VCPUOP_register_vcpu_info.
>   */

I suppose I don't really want to know why this exists in the ARM ABI? 
It looks to be a misfeature.

Shouldn't it be labelled as obsolete ?  (Is that even a thing you can do
in kernel-doc?  It surely must be...)

> @@ -299,26 +308,28 @@ struct vcpu_guest_context {
>  typedef struct vcpu_guest_context vcpu_guest_context_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  
> -/*
> +
> +/**
> + * struct xen_arch_domainconfig - arch-specific domain creation params
> + *
>   * struct xen_arch_domainconfig's ABI is covered by
>   * XEN_DOMCTL_INTERFACE_VERSION.
>   */
> +struct xen_arch_domainconfig {
> +    /** @gic_version: IN/OUT parameter */
>  #define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
>  #define XEN_DOMCTL_CONFIG_GIC_V2        1
>  #define XEN_DOMCTL_CONFIG_GIC_V3        2
> -
> +    uint8_t gic_version;

Please can we have a newline in here, and elsewhere separating blocks of
logically connected field/constant/comments.

It will make a world of difference to the readability of the header
files themselves.

~Andrew

