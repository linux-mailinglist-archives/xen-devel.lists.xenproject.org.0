Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE6190E61
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 14:11:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGjIB-0001W2-7h; Tue, 24 Mar 2020 13:08:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jGjI9-0001Vx-V6
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 13:08:25 +0000
X-Inumbo-ID: 8b2358a6-6dd0-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b2358a6-6dd0-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 13:08:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CDFC0ACA2;
 Tue, 24 Mar 2020 13:08:23 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20200323143835.46117-1-roger.pau@citrix.com>
 <24185.62757.192771.632832@mariner.uk.xensource.com>
 <24185.62908.869446.447190@mariner.uk.xensource.com>
 <20200324120050.GK24458@Air-de-Roger.citrite.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <40b9a119-a787-2e4b-8383-87510a9cccb9@suse.com>
Date: Tue, 24 Mar 2020 14:08:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200324120050.GK24458@Air-de-Roger.citrite.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH OSSTEST] kernel-build: enable
 XEN_BALLOON_MEMORY_HOTPLUG
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.20 13:00, Roger Pau Monné wrote:
> Adding Juergen and Boris for feedback.
> 
> On Tue, Mar 24, 2020 at 11:57:48AM +0000, Ian Jackson wrote:
>> Ian Jackson writes ("Re: [PATCH OSSTEST] kernel-build: enable XEN_BALLOON_MEMORY_HOTPLUG"):
>>> Roger Pau Monne writes ("[PATCH OSSTEST] kernel-build: enable XEN_BALLOON_MEMORY_HOTPLUG"):
>>>> This allows a PVH/HVM domain to use unpopulated memory ranges to map
>>>> foreign memory or grants, and is required for a PVH dom0 to function
>>>> properly.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
>>>
>>> I will push this to pretest immediately.
>>
>> Now done.  Would you consider whether the default should be changed
>> in Linux and prepare a patch to do so if appropriate ?
> 
> DYK if there's any reason why this is not on by default?

AFAIK the default has been off since introduction in 2011.

I don't know the reason for that.


Juergen

