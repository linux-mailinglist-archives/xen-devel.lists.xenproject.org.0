Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD768554572
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353775.580759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3y2z-0005dA-2l; Wed, 22 Jun 2022 10:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353775.580759; Wed, 22 Jun 2022 10:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3y2y-0005Zm-VU; Wed, 22 Jun 2022 10:57:20 +0000
Received: by outflank-mailman (input) for mailman id 353775;
 Wed, 22 Jun 2022 10:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/ZK=W5=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3y2x-0005Zg-0f
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:57:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 14729281-f21a-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 12:57:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 856C613D5;
 Wed, 22 Jun 2022 03:57:16 -0700 (PDT)
Received: from [10.57.38.102] (unknown [10.57.38.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0D983F66F;
 Wed, 22 Jun 2022 03:57:14 -0700 (PDT)
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
X-Inumbo-ID: 14729281-f21a-11ec-bd2d-47488cf2e6aa
Message-ID: <8c1a2037-1bdc-cdb8-7c57-5e84448cc1d0@arm.com>
Date: Wed, 22 Jun 2022 12:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/9] include/public: Use explicitly specified types
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-6-michal.orzel@arm.com>
 <386e765e-8bb8-32a0-9170-11db3978a17a@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <386e765e-8bb8-32a0-9170-11db3978a17a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22.06.2022 12:16, Jan Beulich wrote:
> On 20.06.2022 09:02, Michal Orzel wrote:
>> --- a/xen/include/public/physdev.h
>> +++ b/xen/include/public/physdev.h
>> @@ -211,8 +211,8 @@ struct physdev_manage_pci_ext {
>>      /* IN */
>>      uint8_t bus;
>>      uint8_t devfn;
>> -    unsigned is_extfn;
>> -    unsigned is_virtfn;
>> +    unsigned int is_extfn;
>> +    unsigned int is_virtfn;
> 
> It is wrong for us to use unsigned (or unsigned int) here and in sysctl.h.
> It should be uint32_t instead, and I think this is a great opportunity to
> correct that mistake.
> 
That is perfectly fine for me to do.

> Jan

Cheers,
Michal

