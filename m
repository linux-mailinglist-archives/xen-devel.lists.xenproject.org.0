Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F461F816
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 16:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439482.693493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os4W8-0005Wu-1r; Mon, 07 Nov 2022 15:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439482.693493; Mon, 07 Nov 2022 15:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os4W7-0005TS-Uj; Mon, 07 Nov 2022 15:58:31 +0000
Received: by outflank-mailman (input) for mailman id 439482;
 Mon, 07 Nov 2022 15:58:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1os4W6-0005TM-88
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 15:58:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os4W1-0002BX-Pq; Mon, 07 Nov 2022 15:58:25 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1os4W1-00012I-IB; Mon, 07 Nov 2022 15:58:25 +0000
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
	bh=gawfQ8fum69TFLpKUxVmO2FsjqpivGtcUv2O0y1BViw=; b=qVYITVL8hRJyzIP0lsolelWyXe
	ePt8UaijlE5slmaYFmMYNkw6wJghKjBitaIvp+9P9kCWdncUYD6GZZTmJm0w8+oAkQJbZXi1KxiKO
	DbbE+UBPyM0VIL99hufRIIcS/sNGj6h9iVJcfxyOh1Cn+qwPf4yPiNyrcIAW9x37Vtm0=;
Message-ID: <51eef76f-5b2e-c558-5caa-f457a9555f44@xen.org>
Date: Mon, 7 Nov 2022 15:58:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [linux-linus test] 174539: regressions - FAIL
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <osstest-174539-mainreport@xen.org>
 <3c8a3be2-db65-253d-94ae-1bfcad1b94e2@suse.com>
 <ea2ac746-bed1-c43a-62e5-d2e693bef6f6@suse.com>
 <3BA37602-681E-4A1F-8C01-0DAB8FB9262B@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3BA37602-681E-4A1F-8C01-0DAB8FB9262B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/2022 17:43, Bertrand Marquis wrote:
> Hi,

Hi Bertrand,

> 
> +Julien and Stefano
> 
>> On 2 Nov 2022, at 09:58, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 01.11.2022 08:56, Juergen Gross wrote:
>>> On 29.10.22 23:50, osstest service owner wrote:
>>>> flight 174539 linux-linus real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/174539/
>>>>
>>>> Regressions :-(
>>>
>>> I'm rather sure this is not kernel related, as the issue is occurring only on
>>> Arm and it doesn't seem to be an architecture related issue (the volume group
>>> containing the root file system couldn't be found).
>>>
>>> Could it be an infrastructure problem?
>>
>> Why would such manifest on only linux-linus? Along the lines of what I
>> did say in reply to flight 173480's report I continue to think that
>> there's an issue with the loading of a driver, perhaps because of a
>> bad / missing dependency just on Arm. Sadly the log doesn't have any
>> data in that regard (perhaps because of too low verbosity), so I
>> suspect finding out can only be done by someone with actual access to
>> one of the affected systems.
> 
> @Julien or Stefano: Can one of you check this ?

Sorry I was away part of last week. I will have a look this week.

Cheers,

-- 
Julien Grall

