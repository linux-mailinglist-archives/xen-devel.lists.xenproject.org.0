Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B236813C9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 15:52:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487025.754504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMVV6-0005PF-Qc; Mon, 30 Jan 2023 14:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487025.754504; Mon, 30 Jan 2023 14:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMVV6-0005Mh-N9; Mon, 30 Jan 2023 14:51:16 +0000
Received: by outflank-mailman (input) for mailman id 487025;
 Mon, 30 Jan 2023 14:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SNTu=53=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pMVV5-0005Mb-GU
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 14:51:15 +0000
Received: from ppsw-42.srv.uis.cam.ac.uk (ppsw-42.srv.uis.cam.ac.uk
 [131.111.8.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 886e52e4-a0ad-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 15:51:09 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:52714)
 by ppsw-42.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pMVUu-000RxM-EY (Exim 4.96) (return-path <amc96@srcf.net>);
 Mon, 30 Jan 2023 14:51:04 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 4EDAB1FBD6;
 Mon, 30 Jan 2023 14:51:04 +0000 (GMT)
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
X-Inumbo-ID: 886e52e4-a0ad-11ed-b8d1-410ff93cb8f0
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9abcfc06-1401-cdb7-a1f1-670cd307a593@srcf.net>
Date: Mon, 30 Jan 2023 14:51:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20230120220004.7456-1-andrew.cooper3@citrix.com>
 <AS8PR08MB79918B0D0329A2B722B773EB92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] Changelog: Add details about new features for SPR
In-Reply-To: <AS8PR08MB79918B0D0329A2B722B773EB92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/01/2023 11:40 am, Henry Wang wrote:
> Hi Andrew,
>
>> -----Original Message-----
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Subject: [PATCH] Changelog: Add details about new features for SPR
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Thanks for remembering this :)
>
> Acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks.

I'll commit this when OSSTest has become unblocked.

>
>> ---
>> A reminder to everyone, write the changelog as it happens, rather than
>> scrambling to remember 8 months of development just as the release is
>> happening.
> I wonder if there is a way to automate this in our CI so we can avoid
> forgetting this. But currently I am not really sure if the solution in my mind
> is simple enough... I will try to keep this issue in my mind so that probably I
> can come back with some solutions.

The automated version is `git log $PREV_RELEASE > changelog.log`, and
this is very deliberately not that.

It needs the maintainers / committers to keep "interesting user visible
changes" in mind at some point after the patches have gone in, are
logically complete, and have been around long enough that major
catastrophes (i.e. those liable to incur a full revert) are likely to
have happened.

But I would like to stress.  While it is the Release Maintainer's job to
make sure this gets done, it is not the Release Maintainers job to write
it.  That is an unreasonable burden.

~Andrew

