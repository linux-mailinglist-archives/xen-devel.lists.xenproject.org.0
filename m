Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA674AB1B1
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 20:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266345.460030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnIh-0004ht-LK; Sun, 06 Feb 2022 19:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266345.460030; Sun, 06 Feb 2022 19:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnIh-0004fZ-IB; Sun, 06 Feb 2022 19:34:19 +0000
Received: by outflank-mailman (input) for mailman id 266345;
 Sun, 06 Feb 2022 19:34:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nGnIg-0004fT-S4
 for xen-devel@lists.xenproject.org; Sun, 06 Feb 2022 19:34:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnIg-00060A-Ac; Sun, 06 Feb 2022 19:34:18 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.100.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnIg-0007vw-4Q; Sun, 06 Feb 2022 19:34:18 +0000
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
	bh=81bRU4yUN6Mj75pzfVwhkQvRSIUMqjMBT5hMJ6SyBCY=; b=F20uP6BhSo750S/vszhyV0NSz7
	YBkT4710r0MmZWpPbWyuxgbBDldk/GN2QiKonrkx55aANcTAoz2PF+c9G1+Pl1B8z6mcNA41rGux9
	jeQnUuie3EwfoOheEWDjb4sVGUvHYpwv0DtklxYlxrA2jAvJ7FN2gqR/qzSl2Mn9rfyM=;
Message-ID: <4fec5e75-95da-4dc5-ebea-c53c10486a11@xen.org>
Date: Sun, 6 Feb 2022 19:34:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2] docs: document patch rules
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220203125438.21807-1-jgross@suse.com>
 <e91bde3e-dc45-c731-7df6-e0e45039d1b2@xen.org>
 <ce764d2a-7368-6fbc-b44b-5c56f876d4d4@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ce764d2a-7368-6fbc-b44b-5c56f876d4d4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/02/2022 11:13, Juergen Gross wrote:
> On 04.02.22 20:25, Julien Grall wrote:
>> Hi,
>>
>> On 03/02/2022 12:54, Juergen Gross wrote:
>>> +## The commit message
>>> +
>>> +The commit message is free text describing *why* the patch is done and
>>> +*how* the goal of the patch is achieved. A good commit message will 
>>> describe
>>> +the current situation, the desired goal, and the way this goal is being
>>> +achieved. Parts of that can be omitted in obvious cases.
>>> +
>>> +In case additional changes are done in the patch (like e.g. 
>>> cleanups), those
>>> +should be mentioned.
>>> +
>>> +When referencing other patches (e.g. `similar to patch xy ...`) those
>>> +patches should be referenced via their commit id (at least 12 digits)
>>> +and the patch subject, if the very same patch isn't referenced by the
>>> +`Fixes:` tag, too:
>>> +
>>> +    Similar to commit 67d01cdb5518 ("x86: infrastructure to allow 
>>> converting
>>> +    certain indirect calls to direct ones") add ...
>>> +
>>> +The following ``git config`` settings can be used to add a pretty 
>>> format for
>>> +outputting the above style in the ``git log`` or ``git show`` commands:
>>> +
>>> +        [core]
>>> +                abbrev = 12
>>> +        [pretty]
>>> +                fixes = Fixes: %h (\"%s\")
>>> +
>>> +Lines in the commit message should not exceed 75 characters, except 
>>> when
>>
>> I was under the impression that commit message should be wrap to 72 
>> characters. This is because tools like "git log" would indent the 
>> commit message by 8 characters.
> 
> I took that value from the docs/process/tags.pandoc file.

I also checked Linux documentation and they ask to wrap to 75 characters 
as well. Not sure where I got the 72 characters from...

There rest of my comments are NITs so:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

