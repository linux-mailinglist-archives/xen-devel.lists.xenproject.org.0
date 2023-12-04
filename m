Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9E80318F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 12:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646844.1009445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7AP-0005yP-Sf; Mon, 04 Dec 2023 11:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646844.1009445; Mon, 04 Dec 2023 11:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7AP-0005va-Oz; Mon, 04 Dec 2023 11:31:13 +0000
Received: by outflank-mailman (input) for mailman id 646844;
 Mon, 04 Dec 2023 11:31:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rA7AN-0005vU-S3
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 11:31:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rA7AM-0008TB-O5; Mon, 04 Dec 2023 11:31:10 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.23.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rA7AM-0007ZB-GJ; Mon, 04 Dec 2023 11:31:10 +0000
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
	bh=sKeZEULn1zBMx9Gc0uqsKE//ymm9vEyb2hngyXufZkU=; b=uL8d9dqC21w2KhPel3RQHeoUjf
	GmwRjFBBzU9VvzE69+fAXGa0JV1v52zPY5E0lpeTd5aoJ1ObW51ypijNN6ffZQRRvYBswzhyZj+rU
	uSPyxUeQWH8cYNrmKXiVHyDLA7xPY6papOGsKDd75XK3cWBBxGOPKcaF9VnOGGh7ELKY=;
Message-ID: <1038b45c-3427-4d1e-bfed-dbd303b67cd2@xen.org>
Date: Mon, 4 Dec 2023 11:31:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231201184728.31766-1-julien@xen.org>
 <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
 <956BC72E-0898-490F-9881-226EE7224F94@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <956BC72E-0898-490F-9881-226EE7224F94@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 04/12/2023 11:20, Luca Fancellu wrote:
> 
> 
>> On 1 Dec 2023, at 18:49, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 01/12/2023 18:47, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>> Several maintainers have expressed a stronger preference
>>> to use '-' when in filename and option that contains multiple
>>> words.
>>> So document it in CODING_STYLE.
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>>   CODING_STYLE | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>> diff --git a/CODING_STYLE b/CODING_STYLE
>>> index ced3ade5a6fb..afd09177745b 100644
>>> --- a/CODING_STYLE
>>> +++ b/CODING_STYLE
>>> @@ -144,6 +144,15 @@ separate lines and each line should begin with a leading '*'.
>>>    * Note beginning and end markers on separate lines and leading '*'.
>>>    */
>>>   +Naming convention
>>> +-----------------
>>> +
>>> +When command line option or filename contain multiple words, a '-'
>>> +should be to separate them. E.g. 'timer-works'.
>>> +
>>> +Note that some of the option and filename are using '_'. This is now
>>> +deprecated.
>>
>> Urgh, I sent the wrong draft :(. This is the wording I wanted to propose:
>>
>> +Naming convention
>> +-----------------
>> +
>> +'-' should be used to separate words in commandline options and filenames.
>> +E.g. timer-works.
>> +
>> +Note that some of the options and filenames are using '_'. This is now
>> +deprecated.
>> +
>>
> 
> Hi Julien,
> 
> Can we make an exception for python files that are meant to be used as module?
> Because modules containing ‘-‘ cannot be imported using ‘import’ keyword and
> needs another way to do them which is not conventional

I am not sure this needs to be written down explicitely. At the top of 
the file we have:

"The Xen coding style described below is the coding style used by the
Xen hypervisor itself (xen/*) as well as various associated low-level
libraries (e.g. tools/libxc/*).

An exception is made for files which are imported from an external
source. In these cases the prevailing coding style of the upstream
source is generally used (commonly the Linux coding style).

Other parts of the code base may use other coding styles, sometimes
explicitly (e.g. tools/libxl/CODING_STYLE) but often implicitly (Linux
coding style is fairly common). In general you should copy the style
of the surrounding code. If you are unsure please ask."

and I would not describe Python as low-level.

Cheers,

-- 
Julien Grall

