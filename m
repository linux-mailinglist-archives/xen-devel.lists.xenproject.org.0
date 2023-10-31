Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B47DCEE6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625820.975498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpaD-0004bW-OY; Tue, 31 Oct 2023 14:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625820.975498; Tue, 31 Oct 2023 14:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpaD-0004ZB-L6; Tue, 31 Oct 2023 14:19:05 +0000
Received: by outflank-mailman (input) for mailman id 625820;
 Tue, 31 Oct 2023 14:19:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxpaB-0004Z5-SO
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:19:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxpaB-0004v7-FH; Tue, 31 Oct 2023 14:19:03 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.9.249]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxpaB-00013D-4j; Tue, 31 Oct 2023 14:19:03 +0000
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
	bh=MkQ97413qbPmZoyIbxIwrbk1LcZBhVg9qoycEZyC9w8=; b=GwZ0JxG3hJ9iVSkcRW8j0s9yIg
	P0j0lqo70PObE6skH4IWDYacYlP8ieDrDUf/Ls3bnY7Z+JIowu3WuiFIJJZAPzVhSaAW0hFFSXX5p
	XuDl1th7mNmctrxwZB/b5HfYCNbsC4ozrcJsFBSLmo0lRHPgNIUbxy7d29W1tQF2lz/E=;
Message-ID: <6eb07e69-c4e8-47ce-b2e9-0fe40c2668fc@xen.org>
Date: Tue, 31 Oct 2023 14:19:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 3/3] CHANGELOG: Keep unstable section
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
 <20231031131954.3310725-4-andrew.cooper3@citrix.com>
 <d2a5b85e-e25a-458e-b3ad-0821eb106e85@xen.org>
 <37bcdf0c-75be-4390-8758-d53f097d5b88@citrix.com>
 <1bac4eda-a0d8-4dd8-83ba-9ad78eb2947e@xen.org>
 <a2c46e32-98e5-407b-8b0d-5f4f319b68f1@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a2c46e32-98e5-407b-8b0d-5f4f319b68f1@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/10/2023 14:06, Andrew Cooper wrote:
> On 31/10/2023 1:45 pm, Julien Grall wrote:
>> If you want to go down that route, then please update the
>> docs/process/branching-checklist.txt. Otherwise, I will continue to do
>> as I did previously.
> 
> It *is* in the checklist, and for all previous releases even 4.17, the
> staging section was opened at the time of branching.

It doesn't tell me when it has to be done. The difference with 4.17 is 
we don't yet have a date for the release. Hence why I delayed.

> 
> The thing that is different between 4.17 and previously is that 4.17
> called it "unstable" where previously (and in the checklist) it says to
> make the new section match the updated Xen major/minor number.


I still don't see the problem of delaying the CHANGELOG as I decided to 
do. If you are not happy with it, how about you take over the release 
technician process? It is already complex enough that I don't need 
someone else to tell me exactly how I should do it.

Cheers,

-- 
Julien Grall

