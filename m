Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603D155BEBF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 08:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356978.585366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o64hx-00016Y-Cd; Tue, 28 Jun 2022 06:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356978.585366; Tue, 28 Jun 2022 06:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o64hx-00013I-9v; Tue, 28 Jun 2022 06:28:21 +0000
Received: by outflank-mailman (input) for mailman id 356978;
 Tue, 28 Jun 2022 06:28:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1EI=XD=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o64hw-00013A-AZ
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 06:28:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7f87094d-f6ab-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 08:28:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4571152B;
 Mon, 27 Jun 2022 23:28:17 -0700 (PDT)
Received: from [10.57.39.195] (unknown [10.57.39.195])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCC7C3F5A1;
 Mon, 27 Jun 2022 23:28:16 -0700 (PDT)
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
X-Inumbo-ID: 7f87094d-f6ab-11ec-bd2d-47488cf2e6aa
Message-ID: <9aca51aa-16f5-53de-46b1-94785faccecb@arm.com>
Date: Tue, 28 Jun 2022 08:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/7] xsm/flask: Use unsigned int instead of plain unsigned
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-7-michal.orzel@arm.com>
 <c2b68766-9608-5910-7937-b7747ad189e7@apertussolutions.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <c2b68766-9608-5910-7937-b7747ad189e7@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 27.06.2022 21:19, Daniel P. Smith wrote:
> 
> On 6/27/22 09:15, Michal Orzel wrote:
>> This is just for the style and consistency reasons as the former is
>> being used more often than the latter.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>  xen/xsm/flask/ss/avtab.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
>> index 017f5183de..9761d028d8 100644
>> --- a/xen/xsm/flask/ss/avtab.c
>> +++ b/xen/xsm/flask/ss/avtab.c
>> @@ -349,7 +349,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
>>      struct avtab_key key;
>>      struct avtab_datum datum;
>>      int i, rc;
>> -    unsigned set;
>> +    unsigned int set;
>>  
>>      memset(&key, 0, sizeof(struct avtab_key));
>>      memset(&datum, 0, sizeof(struct avtab_datum));
> 
> Is this not v2? Jason gave a Rb on the similar patch if I am not mistaken.
> 
No it is not. This applies to all the patches in this series that was pushed as
a new one due to different justification/commit titles/commit msgs (see cover letter).

> v/r,
> dps

Cheers,
Michal

