Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A8854AD3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680794.1058926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFkS-0003K8-Lj; Wed, 14 Feb 2024 13:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680794.1058926; Wed, 14 Feb 2024 13:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFkS-0003IC-IH; Wed, 14 Feb 2024 13:56:28 +0000
Received: by outflank-mailman (input) for mailman id 680794;
 Wed, 14 Feb 2024 13:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HRx=JX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1raFkQ-000309-Pp
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:56:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7ff73ea-cb40-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 14:56:25 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 23AF04EE0738;
 Wed, 14 Feb 2024 14:56:25 +0100 (CET)
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
X-Inumbo-ID: d7ff73ea-cb40-11ee-8a4d-1f161083a0e0
Message-ID: <3632611e-61ff-455a-9cc1-990a1f663d83@bugseng.com>
Date: Wed, 14 Feb 2024 14:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@amd.com>, roberto.bagnara@bugseng.com
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-2-stefano.stabellini@amd.com>
 <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com>
 <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
 <2da73259-a86e-4a13-9fd4-4217372f4b76@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <2da73259-a86e-4a13-9fd4-4217372f4b76@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/24 14:15, Jan Beulich wrote:
> On 14.02.2024 12:27, Federico Serafini wrote:
>> On 14/02/24 09:28, Jan Beulich wrote:
>>> On 13.02.2024 23:33, Stefano Stabellini wrote:
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>> ---
>>>>    docs/misra/rules.rst | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>>> index c185366966..931158b354 100644
>>>> --- a/docs/misra/rules.rst
>>>> +++ b/docs/misra/rules.rst
>>>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>>>>           headers (xen/include/public/) are allowed to retain longer
>>>>           identifiers for backward compatibility.
>>>>    
>>>> +   * - `Rule 5.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>>> +     - Required
>>>> +     - Identifiers shall be distinct from macro names
>>>> +     - Clashes between function-like macros and non-callable entities
>>>> +       are allowed. The pattern #define x x is also allowed.
>>>
>>> Just for me to know what exactly is covered (hence also a question
>>> to Roberto as to [to be] implemented Eclair behavior): Even when
>>> the above would be sufficient (and imo better) people frequently
>>> write
>>>
>>> #define a(x, y) b(x, y)
>>>
>>> which, transformed to the specific case here, would then be
>>>
>>> #define a(x, y) a(x, y)
>>>
>>> I'd assume such ought to also be covered, but that's not clear
>>> from the spelling above.
>>
>> I list what happens in some different situations,
>> then we can find the right words for the documentation and/or
>> refine the configuration:
>>
>> If you
>> #define x x
>> and then use `x' as identifier,
>> the resulting violation is deviated (allowed pattern).
>>
>> If you
>> #define a(x, y) a(x, y)
>> and then use `a' as identifier for a non-callable entity,
>> the resulting violation is deviated (no clash with non-callable
>> entities).
>> If you use identifier `a' for a callable entity, the resulting violation
>> is reported: the allowed pattern covers only macros expanding to their
>> own name, in this case the macro name is considered to be
>> `a' only, not a(x, y).
>>
>> If you
>> #define a(x, y) b(x, y)
>> and then use `a' as identifier for a non-callable entity,
>> the resulting violation is deviated (no clash with non-callable
>> entities).
> 
> I'm afraid I don't see what violation there is in this case, to
> deviate. As a result I'm also not sure I correctly understand the
> rest of your reply.

#define a(x, y) b(x, y)

int a; // Violation of Rule 5.5.

The macro name `a' that exist before the preprocessing phase,
still exists after the preprocessing phase as identifier for the integer
variable and this is a violation.

>> If you use `a' as identifier for a callable entity,
>> this is not a violation because after the preprocessing phase,
>> identifier `a' no longer exists.
I correct myself:
if you use `a' as identifier for a *function*,
it is not a violation because after the preprocessing phase
the identifier `a' no longer exists, for example:

#define a(x, y) b(x, y)

void a(int x, int y); // Ok.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

