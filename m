Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156CAB32785
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 10:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091011.1447959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upj9i-0003ty-W6; Sat, 23 Aug 2025 07:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091011.1447959; Sat, 23 Aug 2025 07:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upj9i-0003sX-TD; Sat, 23 Aug 2025 07:59:18 +0000
Received: by outflank-mailman (input) for mailman id 1091011;
 Sat, 23 Aug 2025 07:59:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1upj9i-0003sK-27; Sat, 23 Aug 2025 07:59:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1upj9f-002OaF-1B;
 Sat, 23 Aug 2025 07:59:15 +0000
Received: from [2a02:8012:3a1:0:7444:6df7:db1a:3c76]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1upj9f-00EMdN-0z;
 Sat, 23 Aug 2025 07:59:15 +0000
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
	bh=UkPgs6bE6QfgDaM8sbWFjKUvjpYPya6Nvd7QeYLMKkI=; b=sWdumOKOZv/GaZJ3+JY1Vid8YU
	60MByZieTPIyn1trrwn28mDi1m8/W1lDhW2AxqvrJ3WyxbekrCBA1tpEvLozGAIz83G2bY0Lb+EXg
	WKLd70yU+T0YvQE5c1aPJsJHfCaWj/iXDoy8M0itKLu5HX+tMKHTfzZDJcDDpI9/HemM=;
Message-ID: <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
Date: Sat, 23 Aug 2025 08:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
Content-Language: en-GB
To: Elliott Mitchell <ehem+xen@m5p.com>, Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
 xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Paul Leiber <paul@onlineschubla.de>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
 <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 22/08/2025 21:09, Elliott Mitchell wrote:
> Since you're not pointing to anything definite, could it be everything
> has been resolved?

Unfortunately, the situation has not changed since your last thread 
about enabling CONFIG_ACPI=y a couple of years ago. The main feature we 
are lacking is the parsing the IORT (used to discover SMMUs and MSI 
controllers). Without this...

>  We've got at least two people for whom ACPI on ARM
> works pretty well.

... Xen will only properly boot on "simple" case like the Raspberry PI. 
Also, IIRC Xen would use ACPI rather than Device-Tree by default.

> There may be many more using it.  Perhaps this
> should even be done on the 4.20 branch given how long this has been
> working?

I am guessing you mean 4.21 which will be released in a couple of months 
time, correct?

We have been discussing among the committers on whether we are ok to 
enable ACPI despite the fact it is still not feature complete (see 
above). The discussion is not fully finalized but if we were to enable 
CONFIG_ACPI=y by default then I think we would need the following:

  * Select device-tree by default rather than ACPI
  * Go through SUPPORT.MD and check what features we marked as 
SUPPORTED.md but doesn't work on ACPI.

Maybe you can help with that?

Out of interest, sorry if this was already mentioned before, is there 
any reason ACPI is used on the Raspberry PI over Device-Tree? Is there 
any issue with the latter on Xen?

> 
> The one remaining major issue was the state of EFI-FB support.  There
> was a patch which had that working for Linux kernel 5.10, but that might
> need more work for a proper solution.

Yes. And there was no interest from the other members to fix it 
properly. So I gave up that on that work as I don't have a particular 
interest of using FrameBuffer on the raspberry PI. Feel free to revive 
it and I would be happy to review them.

Cheers,

-- 
Julien Grall


