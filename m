Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F43323B4AD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 07:57:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2pwF-0006xx-Cf; Tue, 04 Aug 2020 05:56:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iF6a=BO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2pwE-0006xs-7M
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 05:56:38 +0000
X-Inumbo-ID: 4212b3a0-d617-11ea-9128-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4212b3a0-d617-11ea-9128-bc764e2007e4;
 Tue, 04 Aug 2020 05:56:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CC0DAC7D;
 Tue,  4 Aug 2020 05:56:52 +0000 (UTC)
Subject: Re: [PATCH v3 00/11] fix swiotlb-xen for RPi4
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
References: <alpine.DEB.2.21.2007101521290.4124@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8413f3e2-0bbf-efa3-1a8a-2ae05b1d07c8@suse.com>
Date: Tue, 4 Aug 2020 07:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007101521290.4124@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: hch@infradead.org, xen-devel@lists.xenproject.org, tamas@tklengyel.com,
 linux-kernel@vger.kernel.org, roman@zededa.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.07.20 00:34, Stefano Stabellini wrote:
> Hi all,
> 
> This series is a collection of fixes to get Linux running on the RPi4 as
> dom0. Conceptually there are only two significant changes:
> 
> - make sure not to call virt_to_page on vmalloc virt addresses (patch
>    #1)
> - use phys_to_dma and dma_to_phys to translate phys to/from dma
>    addresses (all other patches)
> 
> 
> I addressed all comments by Christoph to v2 of the series except from
> the one about merging the precursor "add struct device *" patches. I can
> always merge them together at any time as needed.
> 
> 
> Boris gave his Reviewed-by to the whole series v2. I added his
> Reviewed-by to all patches, including the ones with small cosmetic
> fixes, except for patch #8 #9 #10 because they are either new or changed
> significantly in this version of the series.
> 
> I retained Roman and Corey's Tested-by.

Series pushed to: xen/tip.git for-linus-5.9


Juergen

