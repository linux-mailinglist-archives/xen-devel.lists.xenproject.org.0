Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8F1994CD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 13:11:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEiL-0005RK-Tg; Tue, 31 Mar 2020 11:05:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJEiK-0005RD-K8
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 11:05:48 +0000
X-Inumbo-ID: 92a1d98a-733f-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92a1d98a-733f-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 11:05:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 691FEAD86;
 Tue, 31 Mar 2020 11:05:46 +0000 (UTC)
Subject: Re: [PATCH 1/3] xen/x86: ioapic: Use true/false in
 bad_ioapic_register()
To: Julien Grall <julien@xen.org>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-2-julien@xen.org>
 <20200328110138.inohkfimiiij73vk@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0285ca55-ebaf-efad-efdb-418578034db5@suse.com>
Date: Tue, 31 Mar 2020 13:05:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200328110138.inohkfimiiij73vk@debian>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.03.2020 12:01, Wei Liu wrote:
> On Fri, Mar 27, 2020 at 07:05:44PM +0000, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> bad_ioapic_register() is return a bool, so we should switch to
>> true/false.
> 
> is return -> returns / is returning
> 
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Wei Liu <wl@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


