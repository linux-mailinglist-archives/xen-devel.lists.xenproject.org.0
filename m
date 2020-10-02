Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3633D280CF1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 06:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1661.5028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOD1m-0004Py-0a; Fri, 02 Oct 2020 04:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1661.5028; Fri, 02 Oct 2020 04:50:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOD1l-0004PZ-T9; Fri, 02 Oct 2020 04:50:41 +0000
Received: by outflank-mailman (input) for mailman id 1661;
 Fri, 02 Oct 2020 04:50:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOD1j-0004PU-QG
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 04:50:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c38b9e92-c5e8-470d-9eb9-3413a05eee0e;
 Fri, 02 Oct 2020 04:50:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 450E9AD04;
 Fri,  2 Oct 2020 04:50:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOD1j-0004PU-QG
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 04:50:39 +0000
X-Inumbo-ID: c38b9e92-c5e8-470d-9eb9-3413a05eee0e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c38b9e92-c5e8-470d-9eb9-3413a05eee0e;
	Fri, 02 Oct 2020 04:50:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601614236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/idnfpv/lIDFEdq+x6upDoD3zsCzNiwA4jbuPtNVBQ=;
	b=HKxElXgq8DYYV/9IkUwE2TxRxC46woRPr7S/o6FFNNi5MHDqW7kuZma7sIjDNTU2vPduKP
	u4In4r/Cb0KFYS6Zm6agqMor98qGWMtd0qD7FzYXjFi/Kfi3D8zSV15OZQG6e0bkqVWSE4
	MEckAO/zGyNmFip6mPLJTgoDuDeXO3U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 450E9AD04;
	Fri,  2 Oct 2020 04:50:36 +0000 (UTC)
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
 <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
Date: Fri, 2 Oct 2020 06:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.10.20 18:38, Bertrand Marquis wrote:
> Hi Juergen,
> 
>> On 14 Sep 2020, at 11:58, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
>>
>>
>>
>>> On 12 Sep 2020, at 14:08, Juergen Gross <jgross@suse.com> wrote:
>>>
>>> Making getBridge() static triggered a build error with some gcc versions:
>>>
>>> error: 'strncpy' output may be truncated copying 15 bytes from a string of
>>> length 255 [-Werror=stringop-truncation]
>>>
>>> Fix that by using a buffer with 256 bytes instead.
>>>
>>> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Sorry i have to come back on this one.
> 
> I still see an error compiling with Yocto on this one:
> |     inlined from 'xenstat_collect_networks' at xenstat_linux.c:306:2:
> | xenstat_linux.c:81:6: error: 'strncpy' output may be truncated copying 255 bytes from a string of length 255 [-Werror=stringop-truncation]
> |    81 |      strncpy(result, de->d_name, resultLen);
> |       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> To solve it, I need to define devBridge[257] as devNoBrideg.

IMHO this is a real compiler error.

de->d_name is an array of 256 bytes, so doing strncpy() from that to
another array of 256 bytes with a length of 256 won't truncate anything.

Making devBridge one byte longer would be dangerous, as this would do
a strncpy with length of 257 from a source with a length of 256 bytes
only.

BTW, I think Andrew? has tested my patch with a recent gcc which threw
the original error without my patch, and it was fine with the patch.
Either your compiler (assuming you are using gcc) has gained that error
or you are missing an update fixing it.


Juergen

