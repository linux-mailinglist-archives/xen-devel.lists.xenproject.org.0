Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C76283E23
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 20:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3077.8910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPV4X-0000Io-3Y; Mon, 05 Oct 2020 18:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3077.8910; Mon, 05 Oct 2020 18:18:53 +0000
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
	id 1kPV4X-0000IP-0C; Mon, 05 Oct 2020 18:18:53 +0000
Received: by outflank-mailman (input) for mailman id 3077;
 Mon, 05 Oct 2020 18:18:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LJO=DM=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kPV4V-0000IK-Fi
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 18:18:51 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a159c5e6-d111-4224-a8d0-cbf5adb34919;
 Mon, 05 Oct 2020 18:18:50 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kPV4U-00043H-0E; Mon, 05 Oct 2020 18:18:50 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kPV4T-0004A2-Gg; Mon, 05 Oct 2020 18:18:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9LJO=DM=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kPV4V-0000IK-Fi
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 18:18:51 +0000
X-Inumbo-ID: a159c5e6-d111-4224-a8d0-cbf5adb34919
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a159c5e6-d111-4224-a8d0-cbf5adb34919;
	Mon, 05 Oct 2020 18:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DocFb8exhfUXSoZBKE3Y45sf3gaeuZsjqUNzJjJ4OXQ=; b=ubzNNhWRXYmNL10IK204xrjoqE
	Pn0xi7QMHXGykASr/hURFXjqqO3F3l7tnHrSOKNQmBRbNJwjbQMP4sPc0Wnf2wziEkkFnEtsRPfvs
	eOxUJMwEzkmxdZuF9SM8DqXkUvo6/yy8fJ72lM2JJMNTBZzSLnpNUquhj1Jfv7uC1JPg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kPV4U-00043H-0E; Mon, 05 Oct 2020 18:18:50 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kPV4T-0004A2-Gg; Mon, 05 Oct 2020 18:18:49 +0000
Subject: Re: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn
 correctly
To: Masami Hiramatsu <mhiramat@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 takahiro.akashi@linaro.org
References: <160190516028.40160.9733543991325671759.stgit@devnote2>
From: Julien Grall <julien@xen.org>
Message-ID: <b205ec9c-c307-2b67-c43a-cf2a67179484@xen.org>
Date: Mon, 5 Oct 2020 19:18:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <160190516028.40160.9733543991325671759.stgit@devnote2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Masami,

On 05/10/2020 14:39, Masami Hiramatsu wrote:
> Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu
> address conversion.
> 
> In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted
> to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)
> assumes the given virtual address is in contiguous kernel memory
> area, it can not convert the per-cpu memory if it is allocated on
> vmalloc area (depends on CONFIG_SMP).

Are you sure about this? I have a .config with CONFIG_SMP=y where the 
per-cpu region for CPU0 is allocated outside of vmalloc area.

However, I was able to trigger the bug as soon as CONFIG_NUMA_BALANCING 
was enabled.

[...]

> Fixes: 250c9af3d831 ("arm/xen: Add support for 64KB page granularity")

FWIW, I think the bug was already present before 250c9af3d831.

> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> ---
>   arch/arm/xen/enlighten.c |    2 +-
>   include/xen/arm/page.h   |    3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index e93145d72c26..a6ab3689b2f4 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -150,7 +150,7 @@ static int xen_starting_cpu(unsigned int cpu)
>   	pr_info("Xen: initializing cpu%d\n", cpu);
>   	vcpup = per_cpu_ptr(xen_vcpu_info, cpu);
>   
> -	info.mfn = virt_to_gfn(vcpup);
> +	info.mfn = percpu_to_gfn(vcpup);
>   	info.offset = xen_offset_in_page(vcpup);
>   
>   	err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
> diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
> index 39df751d0dc4..ac1b65470563 100644
> --- a/include/xen/arm/page.h
> +++ b/include/xen/arm/page.h
> @@ -83,6 +83,9 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
>   	})
>   #define gfn_to_virt(m)		(__va(gfn_to_pfn(m) << XEN_PAGE_SHIFT))
>   
> +#define percpu_to_gfn(v)	\
> +	(pfn_to_gfn(per_cpu_ptr_to_phys(v) >> XEN_PAGE_SHIFT))
> +
>   /* Only used in PV code. But ARM guests are always HVM. */
>   static inline xmaddr_t arbitrary_virt_to_machine(void *vaddr)
>   {
> 

Cheers,

-- 
Julien Grall

