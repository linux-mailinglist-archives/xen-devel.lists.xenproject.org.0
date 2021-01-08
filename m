Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B72EF16F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63361.112506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxq3j-0002uK-Nf; Fri, 08 Jan 2021 11:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63361.112506; Fri, 08 Jan 2021 11:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxq3j-0002tv-KD; Fri, 08 Jan 2021 11:35:59 +0000
Received: by outflank-mailman (input) for mailman id 63361;
 Fri, 08 Jan 2021 11:35:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BSv=GL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxq3i-0002tq-4j
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:35:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc282051-6e08-4363-8302-06881f2a60bd;
 Fri, 08 Jan 2021 11:35:56 +0000 (UTC)
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
X-Inumbo-ID: fc282051-6e08-4363-8302-06881f2a60bd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610105756;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=idcnS/vRE+nEDYv/+bPIRP55UxI+LlENxhqXjtZZPlg=;
  b=Uzrytowm00uYD+c4r01DirUCoSY3+Kw9vLO9smZP1ktzSksSCfceGZ63
   8UK+uEiJx56GpMc/ZFETB+l9iGoYmN0dKWZ8PZHPDYXwg+OPI4pAFWPkk
   EhM4ei6oN20u2pqV2Tts74wgrteqHajQ31USDvAhlEBFayTQf3Ku2ir+9
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1oolqDOOCqiQYgrPIkyBhoH6l4/G77s4EWYqCQmoGzfkM/etVkQv3Yl71MWHYjEnGl6FMcjlQK
 aZjCMmFmr0wIaAbrDt/sbt2BKL/f1Pn4dvXbLCF3KcGDUQ/vkHeDEuinrf/AvzEI7YOQ0Ebznd
 S4rov9FoLXvoW8L/TwEKjNSBQ0uTTh0dhBWLEgBAxtFEaEJyvJ9LX4bzFOfj9OR/8toLQ5fB2k
 L634ViR4EuJ0MG17v3iJnHQmE/NZxp0hTJ1UJNTQbFpYC6qjqofTevAmTzmd39K9HnltUITmv2
 yI0=
X-SBRS: 5.2
X-MesageID: 34687651
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,330,1602561600"; 
   d="scan'208";a="34687651"
Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
To: <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <1610066796-17266-2-git-send-email-igor.druzhinin@citrix.com>
 <00a001d6e599$a07c8380$e1758a80$@xen.org>
 <c09f1304-c08f-1f18-319d-62aa518a89d1@citrix.com>
 <00a101d6e5b2$276b2140$764163c0$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <e24a438e-3705-d035-2dd6-34fd4f558898@citrix.com>
Date: Fri, 8 Jan 2021 11:35:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00a101d6e5b2$276b2140$764163c0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/01/2021 11:33, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 08 January 2021 11:30
>> To: paul@xen.org; xen-devel@lists.xenproject.org
>> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
>> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; sstabellini@kernel.org;
>> roger.pau@citrix.com
>> Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
>>
>> On 08/01/2021 08:38, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Sent: 08 January 2021 00:47
>>>> To: xen-devel@lists.xenproject.org
>>>> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
>>>> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
>>>> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Subject: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
>>>>
>>>> If Viridian extensions are enabled, Windows wouldn't currently allow
>>>> a hotplugged vCPU to be brought up dynamically. We need to expose a special
>>>> bit to let the guest know we allow it. It appears we can just start exposing
>>>> it without worrying too much about compatibility - see relevant QEMU
>>>> discussion here:
>>>>
>>>> https://patchwork.kernel.org/project/qemu-devel/patch/1455364815-19586-1-git-send-email-
>>>> den@openvz.org/
>>>
>>> I don't think that discussion really confirmed it was safe... just that empirically it appeared to
>> be so. I think we should err on
>>> the side of caution and have this behind a feature flag (but I'm happy for it to default to on).
>>
>> QEMU was having this code since 2016 and nobody complained is good
>> enough for me - but if you insist we need an option - ok, I will add one.
>>
> 
> Given that it has not yet been in a release, perhaps you could just guard this and the implementation of leaf 0x40000005 using HVMPV_ex_processor_masks?

That looks sloppy and confusing to me - let's have a separate option instead.

Igor

