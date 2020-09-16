Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BADB26C28B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 14:11:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIWHI-0006Au-EL; Wed, 16 Sep 2020 12:11:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vwKx=CZ=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kIWHH-0006An-Jl
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 12:11:11 +0000
X-Inumbo-ID: a2d6e616-e368-4828-8e84-0be01e3a4f4e
Received: from out4436.biz.mail.alibaba.com (unknown [47.88.44.36])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2d6e616-e368-4828-8e84-0be01e3a4f4e;
 Wed, 16 Sep 2020 12:11:09 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R481e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
 TI=SMTPD_---0U97rCs8_1600258251; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U97rCs8_1600258251) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Sep 2020 20:10:51 +0800
Date: Wed, 16 Sep 2020 20:10:51 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Dan Williams <dan.j.williams@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH] kernel/resource: make iomem_resource implicit in
 release_mem_region_adjustable()
Message-ID: <20200916121051.GA46809@L-31X9LVDL-1304.local>
References: <20200911103459.10306-1-david@redhat.com>
 <20200916073041.10355-1-david@redhat.com>
 <20200916100223.GA46154@L-31X9LVDL-1304.local>
 <d11eba75-71c0-4153-944b-56e22044e0eb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11eba75-71c0-4153-944b-56e22044e0eb@redhat.com>
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
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 16, 2020 at 12:03:20PM +0200, David Hildenbrand wrote:
>On 16.09.20 12:02, Wei Yang wrote:
>> On Wed, Sep 16, 2020 at 09:30:41AM +0200, David Hildenbrand wrote:
>>> "mem" in the name already indicates the root, similar to
>>> release_mem_region() and devm_request_mem_region(). Make it implicit.
>>> The only single caller always passes iomem_resource, other parents are
>>> not applicable.
>>>
>> 
>> Looks good to me.
>> 
>> Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
>>
>
>Thanks for the review!
>

Would you send another version? I didn't take a look into the following
patches, since the 4th is missed.

>-- 
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

