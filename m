Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1063871F6
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128736.241632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litIO-0001AB-Ik; Tue, 18 May 2021 06:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128736.241632; Tue, 18 May 2021 06:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litIO-00018H-FP; Tue, 18 May 2021 06:33:36 +0000
Received: by outflank-mailman (input) for mailman id 128736;
 Tue, 18 May 2021 06:33:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1litIM-000187-7f
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:33:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8951687a-a21a-4ab7-bbc5-a26f613f3890;
 Tue, 18 May 2021 06:33:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0C5AAFEF;
 Tue, 18 May 2021 06:33:32 +0000 (UTC)
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
X-Inumbo-ID: 8951687a-a21a-4ab7-bbc5-a26f613f3890
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621319612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hl44uEQtqJbnIvb/ZnExV6o4e3Y1rACn6HN7F+6vs8E=;
	b=C5ThG2csbrrjGMIetdHXRKuyYipdYp0UAsvz2mDPkf4r6wAwyMGFXYOuX+Y0sK41bBi/3M
	mczsLvGrFvarrCEOERTcVEpWVVKZsSrkVBapyXZB5ebSSYa0+0uD2DdeLaksr/J54/Bxh7
	RoJnnrSauTALcGcwCAkjHGqvHogwYgw=
Subject: Re: [PATCH v3 4/5] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
 <ce3ff72e-611b-3b9c-96fa-afc9e8767681@suse.com>
 <95399fcf-54b0-828f-b3cb-9332ad779f68@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1f551526-dde9-8641-ea41-915dbaac9c46@suse.com>
Date: Tue, 18 May 2021 08:33:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <95399fcf-54b0-828f-b3cb-9332ad779f68@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 06:58, Connor Davis wrote:
> On 5/17/21 5:51 AM, Jan Beulich wrote:
>> On 14.05.2021 20:53, Connor Davis wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/configs/riscv64_defconfig
>>> @@ -0,0 +1,12 @@
>>> +# CONFIG_SCHED_CREDIT is not set
>>> +# CONFIG_SCHED_RTDS is not set
>>> +# CONFIG_SCHED_NULL is not set
>>> +# CONFIG_SCHED_ARINC653 is not set
>>> +# CONFIG_TRACEBUFFER is not set
>>> +# CONFIG_DEBUG is not set
>>> +# CONFIG_DEBUG_INFO is not set
>>> +# CONFIG_HYPFS is not set
>>> +# CONFIG_GRANT_TABLE is not set
>>> +# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
>>> +
>>> +CONFIG_EXPERT=y
>> These are rather odd defaults, more like for a special purpose
>> config than a general purpose one. None of what you turn off here
>> will guarantee to be off for people actually trying to build
>> things, so it's not clear to me what the idea here is. As a
>> specific remark, especially during bringup work I think it is
>> quite important to not default DEBUG to off: You definitely want
>> to see whether any assertions trigger.
> The idea was to turn off as much stuff as possible to get a minimal
> build (involving xen/common) working. Although now that we're focused on
> only a few files at a time, they could be enabled without adding any
> undue burden (at least for now).
> 
> Perhaps it would be best to rename the file to include "tiny" or something,
> and then add a normal defconfig once things are actually running?

Yes please.

Jan

