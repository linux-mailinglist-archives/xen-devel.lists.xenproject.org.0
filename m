Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD75A137D7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 11:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873467.1284441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYN6q-0003YG-Ae; Thu, 16 Jan 2025 10:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873467.1284441; Thu, 16 Jan 2025 10:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYN6q-0003Wh-87; Thu, 16 Jan 2025 10:28:20 +0000
Received: by outflank-mailman (input) for mailman id 873467;
 Thu, 16 Jan 2025 10:28:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMgP=UI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tYN6o-0003WW-Gk
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 10:28:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9829547f-d3f4-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 11:28:15 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4FC584EED422;
 Thu, 16 Jan 2025 11:28:14 +0100 (CET)
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
X-Inumbo-ID: 9829547f-d3f4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1737023294; bh=AUwWCNjvcshp1xbXU9Tk31xqxAFJO1NKUVDP+VWCffc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cbE7avJ0Ee2wGfzR/NVEfGUswCf/fzOJhaQwLinqNIfk/vV4gNUAlEnbApC2MirnD
	 Ge1mObVIrGZTwnDznn6mdzd5bdGMS4mc1/FOhxuudGO47DsmMIrFq8lkYsoDLr4xw5
	 ck9aesQROo6axhXS5l4qbXppaJzACcGd1LGdTR+QGFEKVitrDDv/vI4U3DQliXAmk/
	 eHtNJc4exqRkv4DiyX1EwxDT4ePbsvBay3yLAJ5zhJoIqtFnemf+6JKZNkrziIAF0N
	 +aN6Lw+hS3gfTeDKveijsCsQWazB68INTra27ErEGY8IEGy0IIE7rzzZhthXu7vlMn
	 zwIw9qCh9LFLw==
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 11:28:14 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] docs/misra: Document ECLAIR extension to Rule 20.7
In-Reply-To: <d90e5496-cccf-4670-8332-8d2e5f482c5e@suse.com>
References: <77354513a986a14c37ec2dfc45cf3534b08b5e85.1736972547.git.nicola.vetrini@bugseng.com>
 <d90e5496-cccf-4670-8332-8d2e5f482c5e@suse.com>
Message-ID: <48035a91703c82c82e9c5239fb6373a7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-01-16 10:51, Jan Beulich wrote:
> On 16.01.2025 10:31, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states:
>> "Expressions resulting from the expansion of macro parameters shall
>> be enclosed in parentheses".
>> 
>> Document the behaviour of ECLAIR with respect to the CPP extension
>> that allows variable macro arguments to be named.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  docs/misra/rules.rst | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>> 
>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>> index e7763795b826..13890f6d8852 100644
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -671,7 +671,14 @@ maintainers if you want to suggest a change.
>>         shall be enclosed in parentheses
>>       - Extra parentheses are not required when macro parameters are 
>> used
>>         as function arguments, as macro arguments, array indices, lhs 
>> in
>> -       assignments or as initializers in initalizer lists.
>> +       assignments or as initializers in initalizer lists. In 
>> addition,
>> +       the use of a named variable argument in a macro that would 
>> constitute
>> +       a violation of the rule is allowed by ECLAIR as an extension 
>> of the
>> +       MISRA, since it may not always be possible to parenthesize 
>> such
> 
> Just one nit / question (addressable while committing, if desired): I
> wouldn't have expected "the" before "MISRA". Is that conventional 
> wording
> in your environment?
> 
> Jan

Hi Jan,

that was just a typo. It should have been "the MISRA guideline".
Thanks for catching that

> 
>> +       argument and the feature is non-standard::
>> +
>> +         #define M(args...) args
>> +         #if M(1) + 0
>> 
>>     * - `Rule 20.9 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_09.c>`_
>>       - Required

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

