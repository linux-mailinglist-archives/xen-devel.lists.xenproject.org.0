Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7DE21D155
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 10:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jutUb-0002A6-Kl; Mon, 13 Jul 2020 08:07:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jutUa-00029y-3H
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 08:07:16 +0000
X-Inumbo-ID: dce5fdb8-c4df-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dce5fdb8-c4df-11ea-bca7-bc764e2007e4;
 Mon, 13 Jul 2020 08:07:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A39C5AB7D;
 Mon, 13 Jul 2020 08:07:16 +0000 (UTC)
Subject: Re: [PATCH] docs: specify stability of hypfs path documentation
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200713051639.26948-1-jgross@suse.com>
 <057edc96-85ae-2511-9713-99341a6b6486@suse.com>
 <e8187851-9d1f-89d1-6e6b-53881e79a6b8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6187b535-bb04-4b7a-fbc8-7f6c297c1ddc@suse.com>
Date: Mon, 13 Jul 2020 10:07:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8187851-9d1f-89d1-6e6b-53881e79a6b8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.07.2020 10:04, Jürgen Groß wrote:
> On 13.07.20 09:56, Jan Beulich wrote:
>> On 13.07.2020 07:16, Juergen Gross wrote:
>>> @@ -55,6 +58,11 @@ tags enclosed in square brackets.
>>>   * CONFIG_* -- Path is valid only in case the hypervisor was built with
>>>     the respective config option.
>>>   
>>> +Path availability is subject to change, e.g. a specific path specified
>>> +for a single architecture now might be made available for other architectures
>>> +in future, or it could be made conditional by an additional config option
>>> +of the hypervisor.
>>
>> I agree this is worthwhile clarifying. To me, between the lines,
>> this then suggests that paths are entirely unreliable, which I
>> don't think is what we want. So perhaps some further clarification
>> could be added to clarify that we're not going to arbitrarily
>> change paths or their meaning? Or am I mistaken in understanding
>> that this interface is meant to act ABI-like?
> 
> You are right. What about following rewording:
> 
> "In case a tag for a path indicates that this path is available in some
>   case only, this availability might be extended or reduced in future by
>   modification or removal of the tag."

Yes, yet I'd go even further and add "A path once assigned meaning
won't go away altogether or change its meaning, though" or some such.

Jan

