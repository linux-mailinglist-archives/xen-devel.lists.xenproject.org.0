Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AAF1BC266
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:12:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRuZ-0003JX-0h; Tue, 28 Apr 2020 15:12:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTRuX-0003JN-6c
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:12:37 +0000
X-Inumbo-ID: b15503dc-8962-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b15503dc-8962-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 15:12:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05A1CAC8F;
 Tue, 28 Apr 2020 15:12:34 +0000 (UTC)
Subject: Re: [PATCH 2/6] x86_64/mm: map and unmap page tables in
 subarch_init_memory
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <0e14533f516ee5ce410e2cd8050f085aec4b4961.1587116799.git.hongyxia@amazon.com>
 <232de7c3-77bc-1816-150f-082502e8fbff@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ca51b67-cb06-6a96-f848-453aca3ac72f@suse.com>
Date: Tue, 28 Apr 2020 17:12:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <232de7c3-77bc-1816-150f-082502e8fbff@xen.org>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 11:04, Julien Grall wrote:
> On 17/04/2020 10:52, Hongyan Xia wrote:
>> From: Wei Liu <wei.liu2@citrix.com>
>>
>> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


