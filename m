Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5323E191426
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 16:23:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGlLy-0005WP-0l; Tue, 24 Mar 2020 15:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jGlLw-0005WI-UA
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 15:20:28 +0000
X-Inumbo-ID: fde63572-6de2-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fde63572-6de2-11ea-a6c1-bc764e2007e4;
 Tue, 24 Mar 2020 15:20:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BBB0AC92;
 Tue, 24 Mar 2020 15:20:27 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200324150015.50496-1-roger.pau@citrix.com>
 <42a7b408-1ea1-04fa-e70b-cbdaba54c558@suse.com>
 <20200324151855.GN24458@Air-de-Roger.citrite.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c00093fe-9b0d-02c1-0525-2a88de78a3a2@suse.com>
Date: Tue, 24 Mar 2020 16:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200324151855.GN24458@Air-de-Roger.citrite.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 1/2] xen: expand BALLOON_MEMORY_HOTPLUG
 description
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.20 16:18, Roger Pau Monné wrote:
> On Tue, Mar 24, 2020 at 04:13:48PM +0100, Jürgen Groß wrote:
>> On 24.03.20 16:00, Roger Pau Monne wrote:
>>> To mention it's also useful for PVH or HVM domains that require
>>> mapping foreign memory or grants.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> Cc: Juergen Gross <jgross@suse.com>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: xen-devel@lists.xenproject.org
>>> ---
>>>    drivers/xen/Kconfig | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
>>> index 61212fc7f0c7..57ddd6f4b729 100644
>>> --- a/drivers/xen/Kconfig
>>> +++ b/drivers/xen/Kconfig
>>> @@ -19,6 +19,10 @@ config XEN_BALLOON_MEMORY_HOTPLUG
>>>    	  It is very useful on critical systems which require long
>>>    	  run without rebooting.
>>> +	  It's also very useful for translated domains (PVH or HVM) to obtain
>>
>> I'd rather say "(non PV)" or "(PVH, HVM or Arm)".
> 
> I'm fine with any of the variants. Would you mind adjusting when
> picking it up or would you like me to resend?

No need to resend. I'll use the "non PV" variant.


Juergen


