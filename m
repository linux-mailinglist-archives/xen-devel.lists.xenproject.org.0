Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B51B8FB1B3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 14:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735391.1141578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESqo-0007k5-Up; Tue, 04 Jun 2024 12:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735391.1141578; Tue, 04 Jun 2024 12:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESqo-0007hT-Ra; Tue, 04 Jun 2024 12:01:14 +0000
Received: by outflank-mailman (input) for mailman id 735391;
 Tue, 04 Jun 2024 12:01:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0gD=NG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sESqn-0007aT-RB
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 12:01:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2368c2cf-226a-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 14:01:13 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 616554EE073C;
 Tue,  4 Jun 2024 14:01:12 +0200 (CEST)
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
X-Inumbo-ID: 2368c2cf-226a-11ef-90a1-e314d9c70b13
MIME-Version: 1.0
Date: Tue, 04 Jun 2024 14:01:12 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: add more clean MISRA
 guidelines
In-Reply-To: <11c999212a75ea0f043e90128d5321b41a79c305.camel@gmail.com>
References: <3af20044d2906a6f873aac1b6dd2b41c5b9e0507.1717269049.git.nicola.vetrini@bugseng.com>
 <11c999212a75ea0f043e90128d5321b41a79c305.camel@gmail.com>
Message-ID: <06615fc65a59dbe950bc462030a54906@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-04 13:39, Oleksii K. wrote:
> On Sat, 2024-06-01 at 21:13 +0200, Nicola Vetrini wrote:
>> Rules 20.9, 20.12 and 14.4 are now clean on ARM and x86, so they are
>> added
>> to the list of clean guidelines.
>> 
>> Some guidelines listed in the additional clean section for ARM are
>> also
>> clean on x86, so they can be removed from there.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> +Cc Oleksii for an opinion on the inclusion for 4.19
>> 
>> This is a follow-up to series
>> https://lore.kernel.org/xen-devel/cover.1717236930.git.nicola.vetrini@bugseng.com/
>> and depends on it (otherwise the gitlab MISRA analysis would fail on
>> violations of Rule 20.12).
>> If it is decided that the dependent series should go in for 4.19,
>> then
>> my suggestion is to include this as well, to the gating on more
>> guidelines.
>> ---
> I just want to clarify if I understand you correctly. Do you mean taht
> the current one patch will be merged without dependent series that
> gitlab MISRA analysis would fail? IIUUC then I am not sure that we have
> an option to have this patch without the dependent patch series.
> 

Exactly, that's why I specified the dependency. This patch should have 
been part of the series, but I forgot to include it.

> ~ Oleksii
>>  automation/eclair_analysis/ECLAIR/tagging.ecl | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl
>> b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> index a354ff322e03..b829655ca0bc 100644
>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> @@ -60,6 +60,7 @@ MC3R1.R11.7||
>>  MC3R1.R11.9||
>>  MC3R1.R12.5||
>>  MC3R1.R14.1||
>> +MC3R1.R14.4||
>>  MC3R1.R16.7||
>>  MC3R1.R17.1||
>>  MC3R1.R17.3||
>> @@ -73,6 +74,7 @@ MC3R1.R20.4||
>>  MC3R1.R20.6||
>>  MC3R1.R20.9||
>>  MC3R1.R20.11||
>> +MC3R1.R20.12||
>>  MC3R1.R20.13||
>>  MC3R1.R20.14||
>>  MC3R1.R21.3||
>> @@ -105,7 +107,7 @@ if(string_equal(target,"x86_64"),
>>  )
>>  
>>  if(string_equal(target,"arm64"),
>> -   
>> service_selector({"additional_clean_guidelines","MC3R1.R14.4||MC3R1.R
>> 16.6||MC3R1.R20.12||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||M
>> C3R1.R8.6||MC3R1.R9.3"})
>> +   
>> service_selector({"additional_clean_guidelines","MC3R1.R16.6||MC3R1.R
>> 2.1||MC3R1.R5.3||MC3R1.R7.3"})
>>  )
>>  
>>  -
>> reports+={clean:added,"service(clean_guidelines_common||additional_cl
>> ean_guidelines)"}

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

