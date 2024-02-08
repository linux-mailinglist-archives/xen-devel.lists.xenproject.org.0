Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D084E4C5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678324.1055472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY713-000493-FR; Thu, 08 Feb 2024 16:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678324.1055472; Thu, 08 Feb 2024 16:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY713-00046a-Cs; Thu, 08 Feb 2024 16:12:45 +0000
Received: by outflank-mailman (input) for mailman id 678324;
 Thu, 08 Feb 2024 16:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z5WF=JR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rY712-00046S-10
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:12:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f3166b-c69c-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:12:42 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8DE014EE0739;
 Thu,  8 Feb 2024 17:12:41 +0100 (CET)
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
X-Inumbo-ID: e2f3166b-c69c-11ee-98f5-efadbce2ee36
MIME-Version: 1.0
Date: Thu, 08 Feb 2024 17:12:41 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] docs/misra: add asm-offset.c to exclude-list
In-Reply-To: <891e8cc2-e073-4cd3-9998-4c01ae775a3b@suse.com>
References: <09b659e19bf2cc6b3ee4320e019bdfa7def5f3b8.1707406598.git.nicola.vetrini@bugseng.com>
 <891e8cc2-e073-4cd3-9998-4c01ae775a3b@suse.com>
Message-ID: <6521ace1928267e8d6690265181deba8@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-08 16:56, Jan Beulich wrote:
> On 08.02.2024 16:50, Nicola Vetrini wrote:
>> These files contain several deliberate violations of MISRA C rules and
>> they are not linked in the final Xen binary, therefore they can be 
>> exempted
>> from MISRA compliance.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
> 
>> --- a/docs/misra/exclude-list.json
>> +++ b/docs/misra/exclude-list.json
>> @@ -101,6 +101,10 @@
>>              "rel_path": "arch/x86/efi/check.c",
>>              "comment": "The resulting code is not included in the 
>> final Xen binary, ignore for now"
>>          },
>> +        {
>> +          "rel_path": "arch/*/*/asm-offsets.c",
>> +          "comment": "The resulting code is not included in the final 
>> Xen binary, ignore for now"
>> +        },
>>          {
>>              "rel_path": "common/coverage/*",
>>              "comment": "Files to support gcov, ignore for now"
> 
> ... something looks odd with indentation; can probably be adjusted
> while committing.
> 
> Jan

Sorry, I didn't notice the wrong indentation.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

