Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE82A0D4A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 19:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16144.39451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZ2U-0007cn-Le; Fri, 30 Oct 2020 18:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16144.39451; Fri, 30 Oct 2020 18:22:14 +0000
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
	id 1kYZ2U-0007cO-Ib; Fri, 30 Oct 2020 18:22:14 +0000
Received: by outflank-mailman (input) for mailman id 16144;
 Fri, 30 Oct 2020 18:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYZ2S-0007cJ-MU
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:22:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74303daa-b9f6-4838-a41d-8a79d7eed617;
 Fri, 30 Oct 2020 18:22:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYZ2D-0007eb-GT; Fri, 30 Oct 2020 18:21:57 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYZ2D-0001Hk-6J; Fri, 30 Oct 2020 18:21:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYZ2S-0007cJ-MU
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:22:12 +0000
X-Inumbo-ID: 74303daa-b9f6-4838-a41d-8a79d7eed617
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 74303daa-b9f6-4838-a41d-8a79d7eed617;
	Fri, 30 Oct 2020 18:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=eGreG2lvXzvJMpkXHnPENV4rs64oUHIRpQ132Y2vEYg=; b=3wNEEJNaaEbnAVSmCZ6UrK37XA
	xFCTc8UrMGeR4xOxVPYmhrYIc8gV3+d8FuJQH5+Pmp7lxvik50gbdXwvvPJirMIan83RnovO1B3Ml
	L9tA2xA1/NasjbQRd6DqYKoxASccLm89cvA+OWZBsvSgesjBF8kg4pa3EpagpyyVvoXY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYZ2D-0007eb-GT; Fri, 30 Oct 2020 18:21:57 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYZ2D-0001Hk-6J; Fri, 30 Oct 2020 18:21:57 +0000
Subject: Re: [PATCH v2 2/7] xen/arm: acpi: The fixmap area should always be
 cleared during failure/unmap
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Rahul.Singh@arm.com, Julien Grall
 <jgrall@amazon.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Wei Xu <xuwei5@hisilicon.com>
References: <20201023154156.6593-1-julien@xen.org>
 <20201023154156.6593-3-julien@xen.org>
 <alpine.DEB.2.21.2010231714510.12247@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <6038f41f-594c-e573-9126-f31291af9c38@xen.org>
Date: Fri, 30 Oct 2020 18:21:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010231714510.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/10/2020 01:16, Stefano Stabellini wrote:
> On Fri, 23 Oct 2020, Julien Grall wrote:
>>   bool __acpi_unmap_table(const void *ptr, unsigned long size)
>>   {
>>       vaddr_t vaddr = (vaddr_t)ptr;
>> +    unsigned int idx;
>> +
>> +    /* We are only handling fixmap address in the arch code */
>> +    if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
>> +         (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END)) )
> 
> Is it missing "+ PAGE_SIZE"?
> 
>     if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
>          (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) )

Yes it should be + PAGE_SIZE. Do you mind if I fix it on commit?

Cheers,

-- 
Julien Grall

