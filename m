Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D2EA10541
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871196.1282244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf2A-00020b-2b; Tue, 14 Jan 2025 11:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871196.1282244; Tue, 14 Jan 2025 11:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf29-0001xP-Uu; Tue, 14 Jan 2025 11:24:33 +0000
Received: by outflank-mailman (input) for mailman id 871196;
 Tue, 14 Jan 2025 11:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xX/k=UG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tXf27-0001rd-V4
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:24:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f6e324a-d26a-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 12:24:31 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 094144EE0744;
 Tue, 14 Jan 2025 12:24:30 +0100 (CET)
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
X-Inumbo-ID: 1f6e324a-d26a-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1736853870; bh=pSws+Pj3GYkNKzRRRPKoqIIdaeT4u0bilmb/sAqvtnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=koTlI43P6a2gdUFDIUOVdoTKdXHlzKbyEbTXHmKGjRZZLkovW/jcgqcA2Krkg02zz
	 CwDkozrCKezSAmoBYkHMwVDNtlVzBAzTLVqu8Un+rYdaEEK6mu7yoUhm/VVaEVOI0T
	 bYd7w1SNIpTq7mKGVSHciVSwpXi2+7hNv73MHZC6oA5nKl7Q9RTWmdsMgrrTOsKee3
	 jm4RtJ9sey95rGzUZfQBgpDuiVBOdmtygdKyXlEFBqjDhf358LoXzgjiVkxpVt8TZK
	 V6xOfOwOTAXqLCliOT4ZnebhfP+tpUy5Uq/HIkfmmSiw1lG5LrddtqgMZs/cDhBwZ9
	 +QySPGjDMPCcw==
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 12:24:30 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] automation/eclair: make Misra rule 20.7 blocking
 for x86 also
In-Reply-To: <Z4ZI-WfUv73iQLI1@macbook.local>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-3-roger.pau@citrix.com>
 <Z4ZI-WfUv73iQLI1@macbook.local>
Message-ID: <54a6f4337e2f9bfc1f295b3c1e9a0897@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-01-14 12:22, Roger Pau Monné wrote:
> Hello Oleksii,
> 
> This is in principle ready to go in now (I'm currently running a
> private Eclair scan to ensure the patch is still OK against current
> staging).  I would like to ask for a release Ack.
> 

One nit below, which I overlooked initially

> Thanks, Roger.
> 
> On Tue, Nov 26, 2024 at 10:35:08AM +0100, Roger Pau Monne wrote:
>> There are no violations left, make the rule globally blocking for both 
>> x86 and
>> ARM.
>> 
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>>  automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl 
>> b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> index 755ea3271fc9..cb4e233e838d 100644
>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> @@ -80,6 +80,7 @@ MC3R1.R20.2||
>>  MC3R1.R20.3||
>>  MC3R1.R20.4||
>>  MC3R1.R20.6||
>> +MC3R1.R20.7||
>>  MC3R1.R20.9||
>>  MC3R1.R20.11||
>>  MC3R1.R20.12||
>> @@ -116,7 +117,7 @@ if(string_equal(target,"x86_64"),
>>  )

this hunk will not apply because it uses MC3R1, rather than MC3R2. 
Should be an easy fix.

>> 
>>  if(string_equal(target,"arm64"),
>> -    
>> service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
>> +    
>> service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6"})
>>  )

here as well

>> 
>>  
>> -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
>> --
>> 2.46.0
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

