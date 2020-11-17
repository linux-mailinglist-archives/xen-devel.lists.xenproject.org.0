Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BFC2B5E10
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 12:13:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28926.58077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keyuq-0006Ra-Dw; Tue, 17 Nov 2020 11:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28926.58077; Tue, 17 Nov 2020 11:12:52 +0000
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
	id 1keyuq-0006R9-9F; Tue, 17 Nov 2020 11:12:52 +0000
Received: by outflank-mailman (input) for mailman id 28926;
 Tue, 17 Nov 2020 11:12:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1keyuo-0006R4-AB
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 11:12:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f085d7cb-1b1f-490f-b497-af8410ab3946;
 Tue, 17 Nov 2020 11:12:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61645AC2D;
 Tue, 17 Nov 2020 11:12:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1keyuo-0006R4-AB
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 11:12:50 +0000
X-Inumbo-ID: f085d7cb-1b1f-490f-b497-af8410ab3946
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f085d7cb-1b1f-490f-b497-af8410ab3946;
	Tue, 17 Nov 2020 11:12:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605611568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7BvEANOG94S0TBLRcF+255RyHPqVKV4Max7BFcpsB0=;
	b=YFbK06JFEluFgGGg/OZSZxhEkzFMXyKKkrknNUk1J9ThP1++kG34p31isubQVLwzidbHQ8
	8HdDOasNkzmb2R8e6qnF1ox/o3ufdXo4wQVw4VBQTRfNA4ARxTFts92SI2Hy/4LBVqEWFU
	Ee2aQnkQjIXpQHL49pKJ9ZMNy5gg95k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 61645AC2D;
	Tue, 17 Nov 2020 11:12:48 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1605527997.git.rahul.singh@arm.com>
 <efa0c2578a6aabb642b8f38257cf96a983944301.1605527997.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe73928e-bf95-234d-c181-4904a13ad0a1@suse.com>
Date: Tue, 17 Nov 2020 12:12:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <efa0c2578a6aabb642b8f38257cf96a983944301.1605527997.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.11.2020 13:25, Rahul Singh wrote:
> If mem-sharing, mem-paging, or log-dirty functionality is not enabled
> for non-x86 architecture when HAS_PCI is enabled, the compiler will
> throw an error.
> 
> Move code to x86 specific directory to fix compilation error.

Perhaps rather "file" than "directory"?

> Also, modify the code to use likely() in place of unlikley() for each
> condition to make code more optimized.
> 
> No functional change.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

In principle I'm okay with this now, but there continue to be a few
nits:

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -23,6 +23,7 @@
>  #include <asm/hvm/io.h>
>  #include <asm/io_apic.h>
>  #include <asm/setup.h>
> +#include <xen/vm_event.h>

Please insert this alongside the other "#include <xen/...>" higher up.

> @@ -315,6 +316,17 @@ int iommu_update_ire_from_msi(
>             ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>  }
>  
> +bool arch_iommu_use_permitted(const struct domain *d)
> +{
> +    /*
> +     * Prevent device assign if mem paging, mem sharing or log-dirty
> +     * have been enabled for this domain.
> +     */
> +    return d == dom_io ||
> +           (likely(!mem_sharing_enabled(d)) &&
> +            likely(!vm_event_check_ring(d->vm_event_paging)) &&
> +            likely(!p2m_get_hostp2m(d)->global_logdirty));
> +}
>  /*
>   * Local variables:
>   * mode: C

Please don't alter stylistic aspects like this trailing comment
being preceded by a blank line.

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -381,6 +381,8 @@ DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
>  extern struct spinlock iommu_pt_cleanup_lock;
>  extern struct page_list_head iommu_pt_cleanup_list;
>  
> +bool arch_iommu_use_permitted(const struct domain *d);

Just FTR - this way you effectively preclude an arch from
making this a trivial static inline in one of its headers.

Jan

