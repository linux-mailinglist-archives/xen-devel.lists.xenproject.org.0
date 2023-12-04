Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B9803E0B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 20:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647276.1010232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEFj-0003nV-TQ; Mon, 04 Dec 2023 19:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647276.1010232; Mon, 04 Dec 2023 19:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAEFj-0003ky-Qm; Mon, 04 Dec 2023 19:05:11 +0000
Received: by outflank-mailman (input) for mailman id 647276;
 Mon, 04 Dec 2023 19:05:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAEFi-0003ks-P9
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 19:05:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAEFg-0001AX-1V; Mon, 04 Dec 2023 19:05:08 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.23.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAEFf-0001LJ-Qx; Mon, 04 Dec 2023 19:05:07 +0000
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
	bh=xcIGVCT+PzjA+edF2JFCki0/42EB50E0k+Jsd503egM=; b=LXxMqiztfjHqxL2lYFFsapxgr5
	+Fy6jPXqH2XQ4ntOvxEP443QFgMhJlSSHd3zfMh6htWxaH51K0o/Ij4UIxDTMB20GaVEALuHh5+RN
	KjSD5mqa6UAGzgLD3J1rocAXgvK56CrShrjvwdjyTVi39WsEdkOsc024BbLr56MRjLAk=;
Message-ID: <f40d6838-9a82-48cd-9a6b-a298c281f8cf@xen.org>
Date: Mon, 4 Dec 2023 19:05:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231201184728.31766-1-julien@xen.org>
 <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
 <cfaf75cf-f658-4df0-b654-f1c3af279b15@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cfaf75cf-f658-4df0-b654-f1c3af279b15@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/12/2023 09:39, Jan Beulich wrote:
> On 01.12.2023 19:49, Julien Grall wrote:
>> +Naming convention
>> +-----------------
>> +
>> +'-' should be used to separate words in commandline options and filenames.
>> +E.g. timer-works.
>> +
>> +Note that some of the options and filenames are using '_'. This is now
>> +deprecated.
> 
> I certainly appreciate and second the intent, yet I'm afraid "Naming convention"
> in the doc would (to me at least) first and foremost talk about identifiers used
> in the various source files. If this really is to be about only file names and
> command line options, then I think the heading would better say so. Alternatively
> a clear indication would want adding that text about identifiers is supposed to
> be here, but is yet to be written. (The text itself, for the intended purpose, > reads fine to me, fwiw.)

Right now, I don't have any plan to document the naming convention for 
identifiers. In fact, I don't know if we have one...

So how about renaming the section to:

"Naming convention for files and comand line options"

Cheers,

-- 
Julien Grall

