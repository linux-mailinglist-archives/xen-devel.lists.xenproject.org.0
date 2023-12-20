Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D7B819B23
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657473.1026325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsap-00006h-6K; Wed, 20 Dec 2023 09:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657473.1026325; Wed, 20 Dec 2023 09:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsap-0008Vb-2X; Wed, 20 Dec 2023 09:10:19 +0000
Received: by outflank-mailman (input) for mailman id 657473;
 Wed, 20 Dec 2023 09:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKvH=H7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFsan-0008VT-Hx
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:10:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96e29373-9f17-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:10:16 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C32AB4EE0C91;
 Wed, 20 Dec 2023 10:10:15 +0100 (CET)
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
X-Inumbo-ID: 96e29373-9f17-11ee-98eb-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 10:10:15 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org, Jan Beulich
 <jbeulich@suse.com>
Subject: Re: [XEN PATCH] xen: add acmacros.h to exclude-list.json
In-Reply-To: <D2BDB22D-419D-4D4E-B242-C8FD70D23E5E@arm.com>
References: <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com>
 <055b6cf3-4f29-4f1d-b650-26c6d9be8832@suse.com>
 <2fd03776043811a8ceae9ae41de5f0fa@bugseng.com>
 <2c64af71dcb3984f1753ef115868cb7b@bugseng.com>
 <2F345562-4049-4A50-9793-D0002B239C43@arm.com>
 <alpine.DEB.2.22.394.2312191616400.3175268@ubuntu-linux-20-04-desktop>
 <70b0b556-d103-46dd-a69c-004e9adf27bf@suse.com>
 <D2BDB22D-419D-4D4E-B242-C8FD70D23E5E@arm.com>
Message-ID: <d9caa2707adda6e7eb550ee762c5fa42@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-12-20 09:50, Luca Fancellu wrote:
>> On 20 Dec 2023, at 08:41, Jan Beulich <jbeulich@suse.com> wrote:
>> 
>> On 20.12.2023 01:17, Stefano Stabellini wrote:
>>> On Tue, 19 Dec 2023, Luca Fancellu wrote:
>>>>> On 19 Dec 2023, at 11:05, Nicola Vetrini 
>>>>> <nicola.vetrini@bugseng.com> wrote:
>>>>> On 2023-12-19 11:51, Nicola Vetrini wrote:
>>>>>> On 2023-12-19 11:37, Jan Beulich wrote:
>>>>>>> On 19.12.2023 10:02, Nicola Vetrini wrote:
>>>>>>>> --- a/docs/misra/exclude-list.json
>>>>>>>> +++ b/docs/misra/exclude-list.json
>>>>>>>> @@ -209,6 +209,10 @@
>>>>>>>>          "rel_path": "include/acpi/acglobal.h",
>>>>>>>>          "comment": "Imported from Linux, ignore for now"
>>>>>>>>        },
>>>>>>>> +        {
>>>>>>>> +          "rel_path": "include/acpi/acmacros.h",
>>>>>>>> +          "comment": "Imported from Linux, ignore for now"
>>>>>>>> +        },
>>>>>>> Together with what's already there (in context), wouldn't it 
>>>>>>> better be
>>>>>>> the entire directory then which is excluded, or at least all
>>>>>>> include/acpi/ac*.h collectively (and perhaps also
>>>>>>> include/acpi/platform/ac*.h)?
>>>>>>> Jan
>>>>>> +Cc Luca Fancellu
>>>>>> Sure. I wasn't certain which files are imported from ACPI CA and 
>>>>>> which aren't.
>>>>>> I'm also not sure whether "include/acpi/ac*.h" would be properly 
>>>>>> recognized by other tooling that uses exclude-list.json (only 
>>>>>> cppcheck I think). I Cc-ed Luca Fancellu on this.
>>>>> 
>>>>> It occurred to me that it's surely ok to use "include/acpi/ac*" and 
>>>>> "include/acpi/platform/ac*".
>>>> 
>>>> Yes I think it’s fine, it just come to my mind now that this could 
>>>> have the risk that if
>>>> another file is added with ‘ac' prefix, even if it could be subject 
>>>> to MISRA compliance,
>>>> it will be excluded.
>>>> 
>>>> If that risk is negligible for the maintainer of that part, then 
>>>> it’s fine.
>>> 
>>> I think it is OK either way, I'll let Jan pick his preference.
>> 
>> It hasn't become clear to me what the benefit would be of omitting the
>> trailing .h.
> 
> Yes, with the extension is better, the same as we already do here:
> 
> [...]
> {
>     "rel_path": "common/un*.c”,
>     "comment": "unlz4.c implementation by Yann Collet, the others un* 
> are from Linux, ignore for now"
> },
> [...]

Ok, I'll send a v2

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

