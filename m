Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE311229EBD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 19:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyIsV-0001gO-DV; Wed, 22 Jul 2020 17:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u0rb=BB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyIsT-0001VB-OY
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 17:50:01 +0000
X-Inumbo-ID: c3b30961-cc43-11ea-868a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3b30961-cc43-11ea-868a-bc764e2007e4;
 Wed, 22 Jul 2020 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P2XOLKz2T5YZY3tlrY7kbX9WooD0WJy2qhtjbIWMzzU=; b=vL+p9JumPxUuryntrVnz/Lyc4R
 KUgIUQti0rRTtE4uvrNth8T4hm3VUJsSd7gpFpDvHjoTxQPLMTDgW6+vEXn3ggdlWK+DbUEY5Btve
 HDnbrCFifVdX46HWYCqrq62z+w88AOGGsnjaPKRo3E0uNZ2iROrsABfpvVXia1QFWAJg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyIsO-000512-UR; Wed, 22 Jul 2020 17:49:56 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyIsO-0004NO-Lo; Wed, 22 Jul 2020 17:49:56 +0000
Subject: Re: [PATCH-for-4.14] SUPPORT.md: Set version and release/support dates
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200722165544.557-1-paul@xen.org>
 <7d608d35-e373-07bf-81a4-16f3a4ee03c1@xen.org>
 <001c01d6604b$6fa953b0$4efbfb10$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <75d956f6-055d-b9eb-5128-d44a4005b2f3@xen.org>
Date: Wed, 22 Jul 2020 18:49:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <001c01d6604b$6fa953b0$4efbfb10$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 22/07/2020 18:13, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 22 July 2020 17:59
>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>;
>> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH-for-4.14] SUPPORT.md: Set version and release/support dates
>>
>>
>>
>> On 22/07/2020 17:55, Paul Durrant wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>>> ---
>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Cc: George Dunlap <george.dunlap@citrix.com>
>>> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> Cc: Julien Grall <julien@xen.org>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: Wei Liu <wl@xen.org>
>>>
>>> Obviously this has my implicit Release-acked-by and is to be committed to
>>> the staging-4.14 branch only.
>>
>> I will commit it.
> 
> Thanks,

I ended up to revert the patch as there was some unhappiness on 
#xendevel about committing it.

I will let Ian doing it as part of release deliverables.

Cheers,

-- 
Julien Grall

