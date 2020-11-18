Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EA12B79B8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29535.59042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJJZ-0001RF-B7; Wed, 18 Nov 2020 08:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29535.59042; Wed, 18 Nov 2020 08:59:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJJZ-0001Qq-8B; Wed, 18 Nov 2020 08:59:45 +0000
Received: by outflank-mailman (input) for mailman id 29535;
 Wed, 18 Nov 2020 08:59:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfJAt-0006e0-6w
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:50:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bf40fbe-c935-4e0e-a096-066fb9325f3c;
 Wed, 18 Nov 2020 08:50:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80D87AD45;
 Wed, 18 Nov 2020 08:50:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfJAt-0006e0-6w
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:50:47 +0000
X-Inumbo-ID: 8bf40fbe-c935-4e0e-a096-066fb9325f3c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8bf40fbe-c935-4e0e-a096-066fb9325f3c;
	Wed, 18 Nov 2020 08:50:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605689403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyU5ejWfgwEnjWjOuAgNBFVH+se8h5ZxMHqQu86/6+A=;
	b=Lplaa1xOPrE/jDH4KfJhgBZ4ybKF6cgmPiszyNju5YYcFJmyOP/6VzRKhetQ6N8kBkmzYg
	48wK07+NjYad+HnBCd8RvKLT+6LLQPyRSks9/UDfrEoHLdn0I+JWJgTdJM8BgHTvzrc8rU
	rjAeRtBBRqfZO8fn6sn/BcDo/gJtFaQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 80D87AD45;
	Wed, 18 Nov 2020 08:50:03 +0000 (UTC)
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "julien@xen.org"
 <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201118005051.26115-1-sstabellini@kernel.org>
 <0A50C952-B9D8-44C3-9326-A0555B435693@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c59a1540-2dd0-2813-9fe5-d5be2335fe9b@suse.com>
Date: Wed, 18 Nov 2020 09:50:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <0A50C952-B9D8-44C3-9326-A0555B435693@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.11.2020 09:45, Bertrand Marquis wrote:
>> On 18 Nov 2020, at 00:50, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -102,8 +102,8 @@ config HVM
>> 	  If unsure, say Y.
>>
>> config XEN_SHSTK
>> -	bool "Supervisor Shadow Stacks"
>> -	depends on HAS_AS_CET_SS && EXPERT
>> +	bool "Supervisor Shadow Stacks (UNSUPPORTED)"
>> +	depends on HAS_AS_CET_SS && UNSUPPORTED
> 
> This one is not following the standard scheme with “if UNSUPPORTED"

There's no standard scheme here: There's one case where the entire
option depends on some other setting (e.g. UNSUPPORTED) and another
where just the prompt (i.e. giving the user a choice) does. The
difference becomes obvious when the option has a default other than
"no": Despite the invisible prompt, it may get turned on. In the
case here (serving as a good example), "default y" would mean the
feature gets turned on when "if UNSUPPORTED" would be added to the
prompt and when UNSUPPORTED is itself off.

Jan

