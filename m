Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0D80889D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 13:59:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649855.1014878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDyU-0001tA-Ju; Thu, 07 Dec 2023 12:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649855.1014878; Thu, 07 Dec 2023 12:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDyU-0001ql-G6; Thu, 07 Dec 2023 12:59:30 +0000
Received: by outflank-mailman (input) for mailman id 649855;
 Thu, 07 Dec 2023 12:59:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBDyT-0001qS-GX
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 12:59:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBDyS-0003I5-VX; Thu, 07 Dec 2023 12:59:28 +0000
Received: from [15.248.3.113] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBDyS-0005lR-QO; Thu, 07 Dec 2023 12:59:28 +0000
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
	bh=he/l4mh3M5Y5ajDqo0hFInrdrnr3fL1/BgQL1qRsSxM=; b=WeYJZW5XPd9Tsy8iYXKd0zWh/g
	gRICn3s3WYtIDiyPkiO8IHuK2PyRpTWNLkn08EOYQPqFxz8VuhMbSWMkHSuSezGhDAd7+vbrNNtVb
	poCe3Q9lBnBDyQBLq7eXSk2cVzfcRYiw5VMEU9CSh2YQ/bGSeYfytr7O2YmZjt2jF2Ww=;
Message-ID: <136cbc2c-79ac-44f2-a2e5-356bde561074@xen.org>
Date: Thu, 7 Dec 2023 12:59:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] tools/xenstored: remove some command line options
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231121114048.31294-1-jgross@suse.com>
 <1a6f8027-0e49-4975-8ab1-998a9b4cebee@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1a6f8027-0e49-4975-8ab1-998a9b4cebee@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/12/2023 08:26, Juergen Gross wrote:
> On 21.11.23 12:40, Juergen Gross wrote:
>> Remove some command line options which have no real use case.
>>
>> Changes in V2:
>> - moved removal of "-N" into last patch of the series, as this is the
>>    only option which seems to have a use case (OTOH using it has some
>>    downsides as well).
>>
>> Juergen Gross (5):
>>    tools/xenstored: remove "-D" command line parameter
>>    tools/xenstored: remove "-V" command line option
>>    tools/xenstored: remove the "-P" command line option
>>    tools/xenstored: remove the "-R" command line option
>>    tools/xenstored: remove "-N" command line option
>>
>>   tools/xenstored/core.c | 81 +++++++-----------------------------------
>>   1 file changed, 12 insertions(+), 69 deletions(-)
>>
> 
> I think at least patches 1-4 can go in as they all have the required Acks.

Thanks for the reminder. I have committed patches #1-#4.

Cheers,

-- 
Julien Grall

