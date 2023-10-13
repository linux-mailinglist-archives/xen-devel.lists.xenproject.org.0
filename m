Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B37C8815
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 16:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616619.958764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJW4-0000tk-0h; Fri, 13 Oct 2023 14:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616619.958764; Fri, 13 Oct 2023 14:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJW3-0000qq-Te; Fri, 13 Oct 2023 14:51:51 +0000
Received: by outflank-mailman (input) for mailman id 616619;
 Fri, 13 Oct 2023 14:51:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrJW2-0000qk-Cu
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 14:51:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrJVz-0003Hd-Mx; Fri, 13 Oct 2023 14:51:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrJVz-0002pP-FW; Fri, 13 Oct 2023 14:51:47 +0000
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
	bh=2E+Fize500ZHHrCNXNvrOrXnPvKAyPZxiJHPyDS1quI=; b=oMrEBnbIiypgGzCGBnrWJuarn2
	wzq9tAG6UpgfyU5i3SejrtLrqRIwaTnxMCjKWR7MO3EM5D1CsWWdfm7Bm2PIuJJJfNR2oVMHmZoyW
	Gf7AJQs3pUjkHpsjF1siDaDh1G9C89CWG3NuKm4qahoqy+IrpqU4yVXd69XzDqLbfYK0=;
Message-ID: <e76d5b41-5057-4ebe-affd-ae1a158071a1@xen.org>
Date: Fri, 13 Oct 2023 15:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org>
 <5390a035-f0e8-498c-b059-b9eca3a5c6ac@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5390a035-f0e8-498c-b059-b9eca3a5c6ac@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 13/10/2023 15:47, Juergen Gross wrote:
> On 13.10.23 13:22, Julien Grall wrote:
>> Hi George,
>>
>> On 13/10/2023 11:16, George Dunlap wrote:
>>> On Thu, Oct 12, 2023 at 11:36 PM Stefano Stabellini
>>> <sstabellini@kernel.org> wrote:
>>>>
>>>> On Thu, 12 Oct 2023, George Dunlap wrote:
>>>>>>> Stop tinkering in the hope that it hides the problem.  You're only
>>>>>>> making it harder to fix properly.
>>>>>>
>>>>>> Making it harder to fix properly would be a valid reason not to 
>>>>>> commit
>>>>>> the (maybe partial) fix. But looking at the fix again:
>>>>>>
>>>>>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>>>>>> index a6cd199fdc..9cd6678015 100644
>>>>>> --- a/tools/xenstored/domain.c
>>>>>> +++ b/tools/xenstored/domain.c
>>>>>> @@ -989,6 +989,7 @@ static struct domain *introduce_domain(const 
>>>>>> void *ctx,
>>>>>>                  talloc_steal(domain->conn, domain);
>>>>>>
>>>>>>                  if (!restore) {
>>>>>> +                       domain_conn_reset(domain);
>>>>>>                          /* Notify the domain that xenstore is 
>>>>>> available */
>>>>>>                          interface->connection = XENSTORE_CONNECTED;
>>>>>>                          xenevtchn_notify(xce_handle, domain->port);
>>>>>> @@ -1031,8 +1032,6 @@ int do_introduce(const void *ctx, struct 
>>>>>> connection *conn,
>>>>>>          if (!domain)
>>>>>>                  return errno;
>>>>>>
>>>>>> -       domain_conn_reset(domain);
>>>>>> -
>>>>>>          send_ack(conn, XS_INTRODUCE);
>>>>>>
>>>>>> It is a 1-line movement. Textually small. Easy to understand and to
>>>>>> revert. It doesn't seem to be making things harder to fix? We could
>>>>>> revert it any time if a better fix is offered.
>>>>>>
>>>>>> Maybe we could have a XXX note in the commit message or in-code
>>>>>> comment?
>>>>>
>>>>> It moves a line from one function (do_domain_introduce()) into a
>>>>> completely different function (introduce_domain()), nested inside two
>>>>> if() statements; with no analysis on how the change will impact
>>>>> things.
>>>>
>>>> I am not the original author of the patch, and I am not the maintainer
>>>> of the code, so I don't feel I have the qualifications to give you the
>>>> answers you are seeking. Julien as author of the patch and xenstore
>>>> reviewer might be in a better position to answer. Or Juergen as 
>>>> xenstore
>>>> maintainer.
>>>
>>> I understand that; my main point is that the change is more complex
>>> than you're characterizing it.  This is information necessary to
>>> understand whether the patch is correct, but it's not in the patch
>>> description, nor in the subsequent thread back in May.
>>>
>>>>> Are there any paths through do_domain_introduce() that now *won't* get
>>>>> a domain_conn_reset() call?  Is that OK?
>>>>
>>>> Yes, the already-introduced and the restore code paths. The 
>>>> operations in
>>>> the already-introduced or the restore code paths seem simple enough not
>>>> to require a domain_conn_reset. Julien and Juergen should confirm.
>>>
>>> There is no "restore" codepath through do_domain_introduce(); it
>>> passes "false" for the "restore" argument.  So we  only have two paths
>>> to consider through do_domain_introduce(): The "not introduced and not
>>> restoring" path, and the "already-introduced" path.
>>>
>>> I'm not sure what the "simple" elements on the branch in
>>> introduce_domain() have to do with whether the content of the page
>>> needs to be cleaned up.  As I said, I don't 100% understand this code,
>>> but it seems like if anything, the reset would be *more* important to
>>> have in the "reintroduce" case than in the "initial introduction"
>>> case, since I'd expect the "initial introduction" case to be empty
>>> already.
>> Indeed, there should be no watches/transactions/buffered I/O for the 
>> initial introduction. However, the function is also clear part of the 
>> interface because we can't guaranteed it was zeroed.
>>
>> The latter matter for the initial introduction. I believe the rest is 
>> just called for simplicity.
>>
>>>
>>>> Doesn't it seem weird to you that we set a connection to CONNECTED,
>>>> notify the domain that it is ready to go, and only *after* that we 
>>>> reset
>>>> the connection to zero?
>>>>
>>>> What happens if a domain starts using the connection as soon as it
>>>> receives the event channel notification and before domain_conn_reset is
>>>> called?
>>>
>>> Yes, it does seem weird, which is why I said the following. :-)
>>>
>>>>> I mean, it certainly seems strange to set the state to CONNECTED, send
>>>>> off an event channel, and then after that delete all watches /
>>>>> transactions / buffered data and so on;
>>>
>>> But just because the current code is probably wrong, doesn't mean that
>>> the modified code is probably correct.
>>>
>>> If the problem is the delay between the xenevtchn_notify() in
>>> introduce_domain() and the domain_conn_reset() afterwards in
>>> do_domain(), would it make sense instead to move the notification into
>>> do_introduce(), after the domain_conn_reset()?  It is, after all, in
>>> response to XS_INTRODUCE that we want to send the notification, not in
>>> dom0_init() or read_state_connection() (which seems to be more about
>>> restoring a domain).
>>
>> I understand that the event channel notification was specifically 
>> added for dom0less. But I don't see why we don't want to send it to 
>> dom0 as well.
>>
>> Technically, dom0 has exactly the same problem as dom0less domains it 
>> boots before Xenstored is running and therefore it may need to know 
>> when it is ready to receive commands.
> 
> Umm, no, not really.
> 
> The main difference between dom0 and a dom0less domU is, that xenstored
> introduces dom0 by itself via a call of dom0_init(), while the dom0less
> domUs get introduced by Xen tools in case a dom0 is coming up later. And
> that XS_INTRODUCE will clobber any ring page contents, while a call of
> dom0_init() won't do that.
> 
> Dom0 (especially the kernel) is fine to start filling the ring page with
> requests even before xenstored is running. It just shouldn't expect to
> receive any responses right away.
I am not sure what you mean by fine. You will see hang notifications if 
Xenstored is not started in time. Isn't why we decided to go with a 
different way for dom0less?

Cheers,

-- 
Julien Grall

