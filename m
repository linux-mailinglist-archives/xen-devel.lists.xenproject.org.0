Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1887E3401D5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 10:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98856.187775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMopO-0002On-GA; Thu, 18 Mar 2021 09:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98856.187775; Thu, 18 Mar 2021 09:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMopO-0002OO-D6; Thu, 18 Mar 2021 09:20:26 +0000
Received: by outflank-mailman (input) for mailman id 98856;
 Thu, 18 Mar 2021 09:20:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMopM-0002OJ-4T
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 09:20:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d493eab5-9dba-40b6-acc3-6a6f4ea05cf7;
 Thu, 18 Mar 2021 09:20:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 831B3AC17;
 Thu, 18 Mar 2021 09:20:22 +0000 (UTC)
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
X-Inumbo-ID: d493eab5-9dba-40b6-acc3-6a6f4ea05cf7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616059222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4PFxnLA5DQDp0QvIsOAuC+OAoMsVHswJZXjWzzVlZKE=;
	b=NXTX+m+833l1c3YAe0guvbw6C39uZV8kgf0HdXiZFaEBdwZHE9IpFhRVKGr5a9vRMk1C4B
	ZXrNmvkOLj4IRUJH5aDioop208NsexkRlldA/RdoBbYuM56hZMSERLBpVAnlMoYIK5sAlv
	l8roX/hYZrns6bz33o7rVTkk2ntUUJg=
Subject: Re: [PATCH v7] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20210315092342.26533-1-michal.orzel@arm.com>
 <3473f8d3-c42a-9182-b4fa-c3eacb44338f@xen.org>
 <75800277-4107-0060-aece-d01cf29d3086@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <728bb60b-adc0-7218-95a5-e733aadd5cfa@suse.com>
Date: Thu, 18 Mar 2021 10:20:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <75800277-4107-0060-aece-d01cf29d3086@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.03.2021 08:21, Michal Orzel wrote:
> Hi Julien,
> 
> On 16.03.2021 15:54, Julien Grall wrote:
>> Hi Michal,
>>
>> On 15/03/2021 09:23, Michal Orzel wrote:
>>> Currently in order to link existing DTB into Xen image
>>> we need to either specify option CONFIG_DTB_FILE on the
>>> command line or manually add it into .config.
>>> Add Kconfig entry: CONFIG_DTB_FILE
>>> to be able to provide the path to DTB we want to embed
>>> into Xen image. If no path provided - the dtb will not
>>> be embedded.
>>>
>>> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>> as it is not needed since Kconfig will define it in a header
>>> with all the other config options.
>>>
>>> Make a change in the linker script from:
>>> _sdtb = .;
>>> to:
>>> PROVIDE(_sdtb = .);
>>> to avoid creation of _sdtb if there is no reference to it.
>>
>> This means that if someone is using #ifdef CONFIG_DTB_FILE rather than .ifnes, _sdtb will get defined.
> 
> Do we really want to overengineer something that simple?
> Why would someone use #ifdef CONFIG_DTB_FILE?
> In my opinion the rule of thumb is that you don't use #ifdef on configs of string type.
> Using #ifdef CONFIG_DTB_FILE means that someone modifying the code did not even spend 1 minute checking the Kconfig.
> 
> If you do not agree, I can modify the code so _sdtb will be created in dtb.S.
> In that case I would like Jan Beulich to give his opinion before I will send v8.

TBH I'd find it more natural in any event if the symbol came from
dtb.S. So far I was assuming there was some (hidden) reason why
this wouldn't work.

Jan

