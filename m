Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0869823AA2D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 18:06:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2cyw-00048l-3R; Mon, 03 Aug 2020 16:06:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2cyu-00048e-CS
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 16:06:32 +0000
X-Inumbo-ID: 4a9cc0a3-d5a3-11ea-af51-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a9cc0a3-d5a3-11ea-af51-12813bfff9fa;
 Mon, 03 Aug 2020 16:06:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E62FEB6EB;
 Mon,  3 Aug 2020 16:06:45 +0000 (UTC)
Subject: Re: [PATCH v3 05/11] iommu: remove unused iommu_ops method and tasklet
To: Paul Durrant <paul@xen.org>
References: <20200803122914.2259-1-paul@xen.org>
 <20200803122914.2259-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ecdef0ad-79c8-70dc-88c9-1313c4daa38d@suse.com>
Date: Mon, 3 Aug 2020 18:06:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200803122914.2259-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.08.2020 14:29, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The VT-d and AMD IOMMU both use the general x86 IOMMU page table allocator
> and ARM always shares page tables with CPU. Hence there is no need to retain
> the free_page_table() method or the tasklet which invokes it.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

