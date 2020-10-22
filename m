Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4302964BA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 20:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10630.28355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVfTr-0003Bs-6B; Thu, 22 Oct 2020 18:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10630.28355; Thu, 22 Oct 2020 18:38:31 +0000
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
	id 1kVfTr-0003BT-32; Thu, 22 Oct 2020 18:38:31 +0000
Received: by outflank-mailman (input) for mailman id 10630;
 Thu, 22 Oct 2020 18:38:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GjE6=D5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVfTq-0003BO-4I
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 18:38:30 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f8278ce-56e1-4bc2-8810-3cb69b57df61;
 Thu, 22 Oct 2020 18:38:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVfTo-0007o3-2O; Thu, 22 Oct 2020 18:38:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVfTn-0005bY-Pd; Thu, 22 Oct 2020 18:38:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GjE6=D5=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVfTq-0003BO-4I
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 18:38:30 +0000
X-Inumbo-ID: 8f8278ce-56e1-4bc2-8810-3cb69b57df61
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8f8278ce-56e1-4bc2-8810-3cb69b57df61;
	Thu, 22 Oct 2020 18:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=dEPy2ktksSRMlir51+QXQcs9YqL40/F70X9QC8tXbkc=; b=yPOAIrN9RLzlS4wxFD6g1nhvb4
	Qhd5x39W2uT2lwtZmygDmUY2IPM3Ab9nyT5jW5wUpqjqa0gZHixioIFYHc6uZyzqijmET2Vc2Xl+3
	hPz6gTb4UowzyQxYM4KnoctDVikBYuIhoqqUtcvluMM8ldlh8eeB/tIMdwZh8Bn2lgHo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVfTo-0007o3-2O; Thu, 22 Oct 2020 18:38:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVfTn-0005bY-Pd; Thu, 22 Oct 2020 18:38:27 +0000
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
To: Elliott Mitchell <ehem+xen@m5p.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201021221253.GA73207@mattapan.m5p.com>
 <a960dd45-2867-5ef6-970c-952c03aa8cef@suse.com>
 <20201022171328.GA81455@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <001018b4-f700-6143-3fbf-a98c627e11bf@xen.org>
Date: Thu, 22 Oct 2020 19:38:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201022171328.GA81455@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 22/10/2020 18:13, Elliott Mitchell wrote:
> On Thu, Oct 22, 2020 at 09:42:17AM +0200, Jan Beulich wrote:
>> On 22.10.2020 00:12, Elliott Mitchell wrote:
>>> --- a/xen/arch/arm/acpi/domain_build.c
>>> +++ b/xen/arch/arm/acpi/domain_build.c
>>> @@ -42,17 +42,18 @@ static int __init acpi_iomem_deny_access(struct domain *d)
>>>       status = acpi_get_table(ACPI_SIG_SPCR, 0,
>>>                               (struct acpi_table_header **)&spcr);
>>>   
>>> -    if ( ACPI_FAILURE(status) )
>>> +    if ( ACPI_SUCCESS(status) )
>>>       {
>>> -        printk("Failed to get SPCR table\n");
>>> -        return -EINVAL;
>>> +        mfn = spcr->serial_port.address >> PAGE_SHIFT;
>>> +        /* Deny MMIO access for UART */
>>> +        rc = iomem_deny_access(d, mfn, mfn + 1);
>>> +        if ( rc )
>>> +            return rc;
>>> +    }
>>> +    else
>>> +    {
>>> +        printk("Failed to get SPCR table, Xen console may be unavailable\n");
>>>       }
>>
>> Nit: While I see you've got Stefano's R-b already, I Xen we typically
>> omit the braces here.
> 
> Personally, I prefer that myself, but was unsure of the preference here.

I don't think we are very consistent here... I would not add them 
myself, but I don't particularly mind them (I know some editors will add 
them automatically).

I will keep them while committing. For the patch:

Acked-by: Julien Grall <jgrall@amazon.com>

> I've seen multiple projects which *really* dislike using having brackets
> for some clauses, but not others (ie they want either all clauses with or
> all clauses without; instead of only if required).
> 
> I sent what I thought was the more often used format.  (I also like tabs,
> and dislike having so many spaces; alas my preferences are apparently
> uncommon)

We have a few files in Xen using tabs (yes, we like mixing coding style!).

Cheers,

-- 
Julien Grall

