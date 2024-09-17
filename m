Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1646297AB74
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 08:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799841.1209840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqRks-0007fM-15; Tue, 17 Sep 2024 06:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799841.1209840; Tue, 17 Sep 2024 06:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqRkr-0007df-U4; Tue, 17 Sep 2024 06:32:05 +0000
Received: by outflank-mailman (input) for mailman id 799841;
 Tue, 17 Sep 2024 06:32:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkPn=QP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sqRkq-0007dS-6y
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 06:32:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4cc8d0-74be-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 08:32:02 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EF00C4EE079D;
 Tue, 17 Sep 2024 08:32:00 +0200 (CEST)
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
X-Inumbo-ID: 8c4cc8d0-74be-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1726554721; bh=bQRBmHvXvQzfT9HangS6etuL1Sd3CBl1CcmDAD7hkyE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rf+/BVQCnZQhxnAw2w5X7GcUdsBi1HtJRBTa5GwbK9SUPkznrAY7HsCVznqq7TN5y
	 NqgfO6g/ttE7bH5RHNY4GcUi1XASYnqYCSJiXYoIC4ZpMKu8aFn7KWiMnmiTGZJe23
	 mvhZmVyCh8+AM9muHS/mqsCSmksr1nDl1oihQQzBcP+QagQsYtPhokOwLNqwupjeYf
	 dxLTMeSQxzD2GwBheBFnfh7FByYVjBTvGA9KYme3Q/nyVayh9bXZpn2vgnlgrtYTK3
	 3PoZsPPa7dEnhaauViKuX93pXXm9gA6H6wHQvSMs9NJ/BnEwchtKg+yhWRAClhyUyH
	 5qd6soKPNyuWA==
MIME-Version: 1.0
Date: Tue, 17 Sep 2024 08:32:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Michal Orzel
 <michal.orzel@amd.com>
Subject: Re: [PATCH] docs/misra: add R17.2 and R18.2
In-Reply-To: <3DB424D8-8E51-49C0-8B31-5578FF030252@arm.com>
References: <alpine.DEB.2.22.394.2409161559340.1417852@ubuntu-linux-20-04-desktop>
 <3DB424D8-8E51-49C0-8B31-5578FF030252@arm.com>
Message-ID: <2cba41683073c84563faca7991045a0f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-17 08:13, Bertrand Marquis wrote:
> Hi Stefano,
> 
>> On 17 Sep 2024, at 01:02, Stefano Stabellini <sstabellini@kernel.org> 
>> wrote:
>> 
>> The Xen community is already informally following both rules. Let's 
>> make
>> it explicit. Both rules have zero violations, only cautions. While we
>> want to go down to zero cautions in time, adding both rules to 
>> rules.rst
>> enables us to immediately make both rules gating in the ECLAIR job 
>> part
>> of gitlab-ci.
>> 
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> 
>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>> index e99cb81089..9acd92cf78 100644
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -561,6 +561,12 @@ maintainers if you want to suggest a change.
>>      - The features of <stdarg.h> shall not be used
>>      -
>> 
>> +   * - `Rule 17.2 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_02.c>`_
>> +     - Required
>> +     - Functions shall not call themselves, either directly or 
>> indirectly
>> +     - Limited forms of recursion are allowed if the recursion is 
>> bound
>> +       (there is an upper limit and the upper limit is enforced)
> 
> NIT: . missing at the end.
> 
> 
> Should we add a comment to say that the bounding needs to be explained 
> in a comment or in a deviation ?
> 
>> +
>>    * - `Rule 17.3 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_03.c>`_
>>      - Mandatory
>>      - A function shall not be declared implicitly
>> @@ -593,6 +599,12 @@ maintainers if you want to suggest a change.
>>        submitting new patches please try to decrease the number of
>>        violations when possible.
>> 
>> +   * - `Rule 18.1 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_01.c>`_
>> +     - Required
>> +     - A pointer resulting from arithmetic on a pointer operand shall
>> +       address an element of the same array as that pointer operand
> 
> NIT: . missing at the end.
> 
> More than that i do not find the sentence quite clear.
> How about: Pointer arithmetic on an array should only address elements 
> in the given array.
> 
> There might a better way to state that in english.
> Or is this the "extract" from the misra rule directly ?
> 

It is the full rule headline, similar to all other entries in the table.

> 
> Cheers
> Bertrand
> 
>> +     -
>> +
>>    * - `Rule 18.2 
>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_02.c>`_
>>      - Required
>>      - Subtraction between pointers shall only be applied to pointers

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

