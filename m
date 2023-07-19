Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DBD759107
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565680.884041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM35m-0002pD-9Q; Wed, 19 Jul 2023 09:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565680.884041; Wed, 19 Jul 2023 09:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM35m-0002n2-6k; Wed, 19 Jul 2023 09:03:30 +0000
Received: by outflank-mailman (input) for mailman id 565680;
 Wed, 19 Jul 2023 09:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bnZ=DF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qM35k-0002mu-MX
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:03:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fde304d-2613-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 11:03:27 +0200 (CEST)
Received: from [192.168.1.101] (unknown [37.163.72.116])
 by support.bugseng.com (Postfix) with ESMTPSA id 53E624EE0C89;
 Wed, 19 Jul 2023 11:03:26 +0200 (CEST)
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
X-Inumbo-ID: 1fde304d-2613-11ee-b23a-6b7b168915f2
Message-ID: <716e5ceb-49aa-a83b-b03e-3df199804434@bugseng.com>
Date: Wed, 19 Jul 2023 11:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86: I/O emulation: fix violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <b6ebf3a49de027981505da63aef594cb0dc42ead.1689691260.git.federico.serafini@bugseng.com>
 <be50867f-a3e4-0230-4ca7-bc24cc30b946@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <be50867f-a3e4-0230-4ca7-bc24cc30b946@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/07/23 10:32, Jan Beulich wrote:
> On 19.07.2023 10:24, Federico Serafini wrote:
>> Give a name to unnamed parameters thus fixing violations of
>> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
>> named parameters").
>> Keep consistency between parameter names used in function declarations
>> and names used in the corresponding function definitions thus fixing
>> violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
>> function shall use the same names and type qualifiers").
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/x86/include/asm/hvm/emulate.h |  8 ++++----
>>   xen/arch/x86/include/asm/hvm/io.h      | 14 +++++++-------
>>   2 files changed, 11 insertions(+), 11 deletions(-)
> 
> If it was just the 2nd file, I'd agree with the "I/O" in the title
> (albeit as a minor remark and as mentioned elsewhere, personally I
> think double tags in titles are undesirable, and blanks in tags
> aren't nice either). So perhaps "x86/HVM/emul:" ?

"x86/HVM/emul:" is okay.
I will follow your suggestions in the next patches.

> The code changes themselves look okay to me (no matter that I don't
> like some of them), so
> Acked-by: Jan Beulich <jbeulich@suse.com>
> I'd be happy to make, while committing, whatever title adjustment
> that you can agree with.
> 
> One other note though (there's no good general place to put it):
> I'm also a little unhappy with all of you often using "fix" in the
> titles, when you don't really fix any bugs. There are certainly
> cases where addressing Misra complaints also fixes bugs, but that's
> more the exception than the rule. Could we settle on something
> like "eliminate", "address", "avoid", or alike when changes are
> merely about style or other aspect which don't really correct
> functionality?
> 
> Jan

Sure, "address" seems good to us.
Please, while committing, change the occurrences of "fix" into "address"
for the commit title and and commit description as well
(together with the tag change).

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

