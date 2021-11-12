Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104F44E9E0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 16:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225302.389077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlYKt-0005YS-En; Fri, 12 Nov 2021 15:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225302.389077; Fri, 12 Nov 2021 15:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlYKt-0005We-Bs; Fri, 12 Nov 2021 15:19:27 +0000
Received: by outflank-mailman (input) for mailman id 225302;
 Fri, 12 Nov 2021 15:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=an8x=P7=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mlYKs-0005WY-Nw
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 15:19:26 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb526a71-43cb-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 16:19:25 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35956)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mlYKq-000thp-oC (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 12 Nov 2021 15:19:24 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 4A6701FC53;
 Fri, 12 Nov 2021 15:19:24 +0000 (GMT)
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
X-Inumbo-ID: eb526a71-43cb-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH for-4.16 v2] tests/resource: Extend to check that the
 grant frames are mapped correctly
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jane Malalane <jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211112144821.987-1-jane.malalane@citrix.com>
 <YY6FVaA63qwrnj0Y@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <b8555052-23de-130e-8df8-be6217839f2e@srcf.net>
Date: Fri, 12 Nov 2021 15:19:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YY6FVaA63qwrnj0Y@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 12/11/2021 15:16, Roger Pau Monné wrote:
> On Fri, Nov 12, 2021 at 02:48:21PM +0000, Jane Malalane wrote:
>> Previously, we checked that we could map 40 pages with nothing
>> complaining. Now we're adding extra logic to check that those 40
>> frames are "correct".
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> LGTM:
>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
> There are a couple of lines that exceed the 80 column limit that we
> have for other pieces of code, not sure if there's some kind of
> exception for tests. If so it might be easy to either resend or fix at
> commit.

I'll fix on commit.  Thanks.

~Andrew

