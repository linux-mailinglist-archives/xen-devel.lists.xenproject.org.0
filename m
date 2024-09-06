Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA496EBC1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 09:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791588.1201489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smTBH-0002Gk-1l; Fri, 06 Sep 2024 07:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791588.1201489; Fri, 06 Sep 2024 07:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smTBG-0002Eb-UT; Fri, 06 Sep 2024 07:14:54 +0000
Received: by outflank-mailman (input) for mailman id 791588;
 Fri, 06 Sep 2024 07:14:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbPG=QE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1smTBE-0002EV-N3
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 07:14:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5432650-6c1f-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 09:14:51 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 856244EE07D9;
 Fri,  6 Sep 2024 09:14:50 +0200 (CEST)
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
X-Inumbo-ID: b5432650-6c1f-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725606890; bh=h+f/h2xQ+0phzksRu0vjM4bGnCzqTfY2+cRR1Bwqhz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bLz8mfvA1O+wJx6P2Vl/3SU84JNPpAiBdqBxrrwmCGJV6snNak9QHBDeHf6wjZ4mH
	 /CVSrkGCy/dtr84rg27f4+asHK21AVJQS2v7JQmjzSWP0Wgxx3WFfdasF0pY+s82Py
	 RjPUJ8A3gbGD13WvlAisLlwd6XRtlBl4XsG2g8ZAadHLRLG/RCwblYdQUw4Yhw5xa7
	 G9aov1j3FQb5QQkFO/db1I2+wP2KDzzqTnomAQ6/bmSW+p6Ikmb5McA57dYC27zbWm
	 TI6b/9OybIqtuH+AtFeOUZg6ayayErev6Oo564jH+dAHm1HenN+Z0A+Fw1TmnrqmHj
	 pp6OunW/Xw3xg==
MIME-Version: 1.0
Date: Fri, 06 Sep 2024 09:14:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] automation/eclair_analysis: address violations of
 Rule 18.2
In-Reply-To: <be454840-76ae-409a-89c5-255cff3be00a@suse.com>
References: <e36f121a91d229ca5edfc8102c4513c2e0530230.1725554126.git.nicola.vetrini@bugseng.com>
 <be454840-76ae-409a-89c5-255cff3be00a@suse.com>
Message-ID: <9ae8cb3f11a6dbc7276a65531a1ae78f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-06 08:03, Jan Beulich wrote:
> On 05.09.2024 18:37, Nicola Vetrini wrote:
>> MISRA C Rule 18.2 states: "Subtraction between pointers shall
>> only be applied to pointers that address elements of the same array".
>> 
>> Subtractions between pointer where at least one symbol is a
>> symbol defined by the linker are safe and thus deviated, because
>> the compiler cannot exploit the undefined behaviour that would
>> arise from violating the rules in this case.
>> 
>> To create an ECLAIR configuration that contains the list of
>> linker-defined symbols, the script "linker-symbols.sh" is used
>> after a build of xen (without static analysis) is performed.
>> The generated file "linker_symbols.ecl" is then used as part of the
>> static analysis configuration.
>> 
>> Additional changes to the ECLAIR integration are:
>> - perform a build of xen without static analysis during prepare.sh
>> - run the scripts to generated ECL configuration during the 
>> prepare.sh,
>>   rather than analysis.sh
>> - export ECLAIR_PROJECT_ROOT earlier, to allow such generation
>> 
>> Additionally, the macro page_to_mfn performs a subtraction that is 
>> safe,
>> so its uses are deviated.
>> 
>> No functional changes.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Macro page_to_pdx is also the cause of some caution reports:
>> perhaps that should be deviated as well, since its definition is very
>> similar to page_to_mfn.
>> 
>> Relevant CI runs:
>> 
>> - arm64: 
>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/ARM64/7754928624/PROJECT.ecd;/by_service/MC3R1.R18.2.html
>> 
>> - x86_64: 
>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/X86_64/7754928613/PROJECT.ecd;/by_service/MC3R1.R18.2.html
>> - x86_64 (without page_to_pdx reports): 
>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MC3R1.R18.2/X86_64/7754928613/PROJECT.ecd;/by_service/MC3R1.R18.2.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":false,"selector":{"enabled":true,"negated":false,"kind":0,"domain":"message","inputs":[{"enabled":true,"text":"^.*expanded 
>> from macro `page_to_pdx'"}]}}}
>> ---
>>  automation/eclair_analysis/ECLAIR/analyze.sh  |  6 ----
>>  .../eclair_analysis/ECLAIR/deviations.ecl     | 11 +++++++
>>  .../eclair_analysis/ECLAIR/generate_ecl.sh    |  3 ++
>>  .../ECLAIR/generate_linker_symbols.sh         | 31 
>> +++++++++++++++++++
>>  automation/eclair_analysis/prepare.sh         |  6 +++-
>>  automation/scripts/eclair                     |  3 ++
>>  docs/misra/deviations.rst                     | 10 ++++++
>>  7 files changed, 63 insertions(+), 7 deletions(-)
>>  create mode 100755 
>> automation/eclair_analysis/ECLAIR/generate_linker_symbols.sh
> 
> Nit: Dashes instead of underscores in names of new files, please.
> 
> Jan

Thanks. Perhaps is will be a good idea to make a follow-up patch to use 
dashes consistently.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

