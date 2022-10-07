Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407315F78DA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 15:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417992.662738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognHH-0008F8-MC; Fri, 07 Oct 2022 13:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417992.662738; Fri, 07 Oct 2022 13:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ognHH-0008CP-JU; Fri, 07 Oct 2022 13:20:35 +0000
Received: by outflank-mailman (input) for mailman id 417992;
 Fri, 07 Oct 2022 13:20:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ognHF-0008CJ-Nv
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 13:20:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ognHB-0002M5-N3; Fri, 07 Oct 2022 13:20:29 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.20.83]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ognHB-0003wQ-G6; Fri, 07 Oct 2022 13:20:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Y6Wy04WMTYYKn5t5tiiQfG7z4acdned1ldL9zc9bi04=; b=SBdmihUr8VyPtW/E7Qs/Yqa0CA
	fII7QTA+jNrJUHxsySFys1WCyr41B6n1lLZ8Bk2P4RSIrYA9tqJ2cIhBDpCyA4Z9NqkeYvogdwkDb
	Uu0c5TMVWMRcZCevmikbC53dm/o/DaM4dk9LbAI23cofzrLiztg+jfmcPz7yOHQ+Gkjc=;
Message-ID: <e5314094-862e-9022-3707-7e308e9f2e67@xen.org>
Date: Fri, 7 Oct 2022 14:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH 1/3] process/release-technician-checklist: Explain how the
 banner in README is generated
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221007091341.58542-1-julien@xen.org>
 <20221007091341.58542-2-julien@xen.org>
 <60eda03c-9e40-2a99-dfe5-7ba1407961ad@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <60eda03c-9e40-2a99-dfe5-7ba1407961ad@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/10/2022 12:02, Jan Beulich wrote:
> On 07.10.2022 11:13, Julien Grall wrote:
>> --- a/docs/process/release-technician-checklist.txt
>> +++ b/docs/process/release-technician-checklist.txt
>> @@ -49,6 +49,7 @@ t=RELEASE-$r
>>   * consider bumping sonames of shlibs
>>   
>>   * change xen-unstable README (should say "Xen 4.5" in releases and on stable branches, "Xen 4.5-unstable" on unstable)
> 
> This line may also want updating, to include the 4.5-rc case as well.

Good point. I will respin this patch.

Cheers,

> 
> Jan
> 
>> +*   The banner is generated using figlet
>>   * change xen-unstable Config.mk
>>   #   QEMU_UPSTREAM_REVISION,
>>   #   QEMU_TRADITIONAL_REVISION
> 

-- 
Julien Grall

