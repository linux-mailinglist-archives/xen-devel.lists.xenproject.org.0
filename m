Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9000F406A4A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 12:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184263.332850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOe0D-0003Ew-R3; Fri, 10 Sep 2021 10:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184263.332850; Fri, 10 Sep 2021 10:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOe0D-0003Ct-Nh; Fri, 10 Sep 2021 10:43:25 +0000
Received: by outflank-mailman (input) for mailman id 184263;
 Fri, 10 Sep 2021 10:43:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyUy=OA=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOe0C-0003Cn-9i
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 10:43:24 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb1eff97-1223-11ec-b226-12813bfff9fa;
 Fri, 10 Sep 2021 10:43:23 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631270597614243.9414157261756;
 Fri, 10 Sep 2021 03:43:17 -0700 (PDT)
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
X-Inumbo-ID: eb1eff97-1223-11ec-b226-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631270601; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gW9dAaSibMbt9EnnYMXY6pFS0ij/1RlWloEiNteT1C1LQ20ei36c/nCuN1U8xEXR/oRUZrFP0PAgCjBDtrox4PcPBwHIuvanM6QbPJw2oIfSnLG9U0EW90phKyeJZ8Q80BHahsCq2RjxtgafEflgCW78EBLCSyG+UNbblOo88PA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631270601; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/4QfoESrYxGzqyr1l71wmYw4NxxbWHrPuKAOvJt+O38=; 
	b=Gvk9wCtgbIo6SNt1L23V0qG7u3AXfXyAXDSbL3AjM9amYOobrzEG4TxjrksQI2ph4+wdot5WMjMseO/E3Aebm48eptVYI06UtUQGRyw0QA8qf9UihkutO1tReFmRQiNN3vBt0Q8ZFszLCuIaVO3PafK8u9UNepFImgKTdh/5jvE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631270601;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/4QfoESrYxGzqyr1l71wmYw4NxxbWHrPuKAOvJt+O38=;
	b=RbToVONKK7G+ay5iiRUFIiwsH2iNtWHxxYgyFU8K5PGnaF9ZXbUpape6vLuonIIY
	ElYS8PlVNEZPHWmY7YSRklYPAZHrAK1Vk7FVUuORe54qLckXG9t3v6FAnzcdJZyLtQz
	B7+bVK0b+zU4OWUMjkhTchaR6cTfTtjjgpRUEVFY=
Subject: Re: [PATCH v5 05/10] xsm: apply coding style
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
 <20210910021236.15082-6-dpsmith@apertussolutions.com>
 <ea0a2e43-6c8c-bfcd-34aa-ec181600ea2d@suse.com>
 <dd15228e-529e-7de6-856a-964d469ef658@apertussolutions.com>
Message-ID: <e6246989-87d8-af25-2430-783f0bd19f90@apertussolutions.com>
Date: Fri, 10 Sep 2021 06:41:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dd15228e-529e-7de6-856a-964d469ef658@apertussolutions.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 9/10/21 6:04 AM, Daniel P. Smith wrote:
> On 9/10/21 2:15 AM, Jan Beulich wrote:
>> On 10.09.2021 04:12, Daniel P. Smith wrote:
>>> @@ -70,7 +73,7 @@ void __xsm_action_mismatch_detected(void);
>>>   #endif /* CONFIG_XSM */
>>>   static always_inline int xsm_default_action(
>>> -    xsm_default_t action, struct domain *src, struct domain *target)
>>> +    xsm_default_t action, struct domain *src, struct domain *target)
>>
>> Here and below you're now introducing hard tabs. In Xen style
>> we don't ever use hard tabs for indentation; this is limited to
>> files inherited from elsewhere.
>>
>> It's also not clear why you've touched this instance at all:
>> The 4 chars indentation was correct already, as previously
>> pointed out by Andrew (on perhaps a different example).
>>
>> Jan
>>
> 
> I honestly don't know what is going on. Since right now my primary focus 
> is on Xen, I have my vimrc set to 4 space tabs with expand tabs and I am 
> not manually changing. I will retab the file in the next submission.

URG, going back to correct it and I now know how it happened. My regex 
substitution to assist in the mass reformating injected a tab that I 
expected expandtab to have expanded for me. I should have known better 
and double checked. My sincere apologies for causing unnecessary noise.

v/r,
dps

