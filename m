Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ACB8702C8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 14:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688417.1072481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh8Q4-0008GN-VU; Mon, 04 Mar 2024 13:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688417.1072481; Mon, 04 Mar 2024 13:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh8Q4-0008Er-Sv; Mon, 04 Mar 2024 13:31:52 +0000
Received: by outflank-mailman (input) for mailman id 688417;
 Mon, 04 Mar 2024 13:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TG1g=KK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rh8Q3-00089p-QS
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 13:31:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e6a791e-da2b-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 14:31:50 +0100 (CET)
Received: from [10.253.49.69] (unknown [160.78.253.140])
 by support.bugseng.com (Postfix) with ESMTPSA id 603E94EE0737;
 Mon,  4 Mar 2024 14:31:49 +0100 (CET)
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
X-Inumbo-ID: 8e6a791e-da2b-11ee-afda-a90da7624cb6
Message-ID: <da1446d6-b248-4c68-8302-2179dbe09987@bugseng.com>
Date: Mon, 4 Mar 2024 14:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@amd.com>, roberto.bagnara@bugseng.com
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-2-stefano.stabellini@amd.com>
 <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com>
 <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
 <2da73259-a86e-4a13-9fd4-4217372f4b76@suse.com>
 <3632611e-61ff-455a-9cc1-990a1f663d83@bugseng.com>
 <alpine.DEB.2.22.394.2402291528230.853156@ubuntu-linux-20-04-desktop>
 <e3c894d5-4d7b-426c-bf1a-536b4f1f83ce@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <e3c894d5-4d7b-426c-bf1a-536b4f1f83ce@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/24 09:06, Jan Beulich wrote:
> On 01.03.2024 00:28, Stefano Stabellini wrote:
>> On Wed, 14 Feb 2024, Federico Serafini wrote:
>>> On 14/02/24 14:15, Jan Beulich wrote:
>>>> On 14.02.2024 12:27, Federico Serafini wrote:
>>>>> On 14/02/24 09:28, Jan Beulich wrote:
>>>>>> On 13.02.2024 23:33, Stefano Stabellini wrote:
>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>> ---
>>>>>>>     docs/misra/rules.rst | 6 ++++++
>>>>>>>     1 file changed, 6 insertions(+)
>>>>>>>
>>>>>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>>>>>> index c185366966..931158b354 100644
>>>>>>> --- a/docs/misra/rules.rst
>>>>>>> +++ b/docs/misra/rules.rst
>>>>>>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>>>>>>>            headers (xen/include/public/) are allowed to retain longer
>>>>>>>            identifiers for backward compatibility.
>>>>>>>     +   * - `Rule 5.5
>>>>>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>>>>>> +     - Required
>>>>>>> +     - Identifiers shall be distinct from macro names
>>>>>>> +     - Clashes between function-like macros and non-callable entities
>>>>>>> +       are allowed. The pattern #define x x is also allowed.
>>>>>>
>>>>>> Just for me to know what exactly is covered (hence also a question
>>>>>> to Roberto as to [to be] implemented Eclair behavior): Even when
>>>>>> the above would be sufficient (and imo better) people frequently
>>>>>> write
>>>>>>
>>>>>> #define a(x, y) b(x, y)
>>>>>>
>>>>>> which, transformed to the specific case here, would then be
>>>>>>
>>>>>> #define a(x, y) a(x, y)
>>>>>>
>>>>>> I'd assume such ought to also be covered, but that's not clear
>>>>>> from the spelling above.
>>>>>
>>>>> I list what happens in some different situations,
>>>>> then we can find the right words for the documentation and/or
>>>>> refine the configuration:
>>>>>
>>>>> If you
>>>>> #define x x
>>>>> and then use `x' as identifier,
>>>>> the resulting violation is deviated (allowed pattern).
>>>>>
>>>>> If you
>>>>> #define a(x, y) a(x, y)
>>>>> and then use `a' as identifier for a non-callable entity,
>>>>> the resulting violation is deviated (no clash with non-callable
>>>>> entities).
>>>>> If you use identifier `a' for a callable entity, the resulting violation
>>>>> is reported: the allowed pattern covers only macros expanding to their
>>>>> own name, in this case the macro name is considered to be
>>>>> `a' only, not a(x, y).
>>>>>
>>>>> If you
>>>>> #define a(x, y) b(x, y)
>>>>> and then use `a' as identifier for a non-callable entity,
>>>>> the resulting violation is deviated (no clash with non-callable
>>>>> entities).
>>>>
>>>> I'm afraid I don't see what violation there is in this case, to
>>>> deviate. As a result I'm also not sure I correctly understand the
>>>> rest of your reply.
>>>
>>> #define a(x, y) b(x, y)
>>>
>>> int a; // Violation of Rule 5.5.
>>>
>>> The macro name `a' that exist before the preprocessing phase,
>>> still exists after the preprocessing phase as identifier for the integer
>>> variable and this is a violation.
>>>
>>>>> If you use `a' as identifier for a callable entity,
>>>>> this is not a violation because after the preprocessing phase,
>>>>> identifier `a' no longer exists.
>>> I correct myself:
>>> if you use `a' as identifier for a *function*,
>>> it is not a violation because after the preprocessing phase
>>> the identifier `a' no longer exists, for example:
>>>
>>> #define a(x, y) b(x, y)
>>>
>>> void a(int x, int y); // Ok.
>>
>> Federico, do you have a better wording suggestion for this rule?
>>
>> Jan, any further requests here? What would you like to see as next step?
> 
> A more concise wording proposal would probably help.

What do you think about:

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 1e134ccebc..a975b9a85f 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -181,6 +181,13 @@ maintainers if you want to suggest a change.
         headers (xen/include/public/) are allowed to retain longer
         identifiers for backward compatibility.

+   * - `Rule 5.5 
<https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
+     - Required
+     - Identifiers shall be distinct from macro names
+     - Macros expanding to their own name are allowed (e.g., #define x x).
+       Clashes between names of function-like macros and identifiers of
+       non-callable entities are allowed.
+
     * - `Rule 5.6 
<https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
       - Required
       - A typedef name shall be a unique identifier

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

