Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792B4A9AB8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:10:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265588.458997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzHt-0006lM-5d; Fri, 04 Feb 2022 14:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265588.458997; Fri, 04 Feb 2022 14:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzHt-0006jS-2Q; Fri, 04 Feb 2022 14:10:09 +0000
Received: by outflank-mailman (input) for mailman id 265588;
 Fri, 04 Feb 2022 14:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=98b4=ST=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nFzHr-0006jM-NW
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:10:07 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2715d097-85c4-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 15:10:06 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:53484)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nFzHo-000tMw-1L (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 04 Feb 2022 14:10:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 23FD01FBCB;
 Fri,  4 Feb 2022 14:10:04 +0000 (GMT)
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
X-Inumbo-ID: 2715d097-85c4-11ec-8f75-fffcc8bd4f1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <1905e626-da65-0541-802e-34e5d06bc1dc@srcf.net>
Date: Fri, 4 Feb 2022 14:10:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220203181023.1554-1-andrew.cooper3@citrix.com>
 <53b98995-8cef-48b4-7728-3bfbc236af5f@suse.com>
 <f2ce80ee-f30c-dc6f-e4b7-5d8eddb5b3d5@citrix.com>
 <1333696d-d3c2-15a8-1dd5-7cb0a17ef023@suse.com>
 <a28ff9e8-c022-6384-ee04-c21b69a4fdd2@citrix.com>
 <eb818153-3ada-ac46-fb14-da975a61574f@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
In-Reply-To: <eb818153-3ada-ac46-fb14-da975a61574f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/02/2022 13:46, Jan Beulich wrote:
> On 04.02.2022 14:34, Andrew Cooper wrote:
>> On 04/02/2022 13:09, Jan Beulich wrote:
>>> On 04.02.2022 13:12, Andrew Cooper wrote:
>>>> On 04/02/2022 08:31, Jan Beulich wrote:
>>>>> On 03.02.2022 19:10, Andrew Cooper wrote:
>>>>>> It was Xen 4.14 where CPUID data was added to the migration stream, and 4.13
>>>>>> that we need to worry about with regards to compatibility.  Xen 4.12 isn't
>>>>>> relevant.
>>>>>>
>>>>>> Expand and correct the commentary.
>>>>>>
>>>>>> Fixes: 111c8c33a8a1 ("x86/cpuid: do not expand max leaves on restore")
>>>>> But doesn't this commit amend 685e922d6f30 ("tools/libxc: Rework
>>>>> xc_cpuid_apply_policy() to use {get,set}_cpu_policy()"), which is
>>>>> where DEF_MAX_* disappeared?
>>>> No. All that happened in that change was that we switched to using
>>>>
>>>> cpuid.h:89:#define CPUID_GUEST_NR_EXTD_AMD
>>>>
>>>> instead, which remained the same size until Xen 4.15 when e9b4fe26364
>>>> bumped it.
>>> Oh, right. I did try to look for a replacement, but managed to miss
>>> this. But then, as much as 4.12 isn't relevant, isn't it the case
>>> that the fact that CPUID data was added to the stream in 4.14 isn't
>>> relevant here either, and it's instead the bumping in 4.15 which is?
>> The fact that the bump happened is relevant, by virtue of the fact there
>> logic added to cope.  The fact it was in 4.15 is not relevant - this
>> isn't a list of every ABI-relevant change.
>>
>> CPUID data being added to the stream is critically important, because
>> that's the point after which we never enter this compatibility path.
> If the bump happened before CPUID data was added to the stream, logic to
> cope with migrating-in guests would have been required too, wouldn't it.

Yes, it would have been.

It wasn't an accident that none of the max leaves changed while doing
the Xen CPUID work.

We're unfortunately a long way behind on Intel CPUID leaves, but all(?)
of the new leaves need more complicated migration safely logic than the
toolstack currently knows how to do.

> But anyway, just to be done with this:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

