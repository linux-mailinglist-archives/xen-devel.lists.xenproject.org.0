Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D194A7C8419
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 13:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616476.958517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrG3R-0002Ha-Rp; Fri, 13 Oct 2023 11:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616476.958517; Fri, 13 Oct 2023 11:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrG3R-0002Fb-N1; Fri, 13 Oct 2023 11:10:05 +0000
Received: by outflank-mailman (input) for mailman id 616476;
 Fri, 13 Oct 2023 11:10:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrG3Q-0002Al-VE
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 11:10:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrG3L-0006MQ-68; Fri, 13 Oct 2023 11:09:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrG3L-0000h3-0K; Fri, 13 Oct 2023 11:09:59 +0000
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
	bh=p8sMvokGDyq16FT1zSCAwL2Acd5RmOh4KTyc5GF1fbg=; b=UhbRSlSPixAXyYwHIBHhdG1A4c
	dx8RZddctRsbDtdk95SrtPQYR3Dw1Dl2B1sGZ+3OcY7JJOoqurbgFitU0rOH/jvQsBTT5fWx/AAbX
	I1o7Pm9LxbeRWL0LQk619TTqhTiZ8dZpzgNSCijHx0OPUnEohmtf8+iOHCb672WmTvz0=;
Message-ID: <8d0ccf40-d8df-4c7a-a656-6febc67124a6@xen.org>
Date: Fri, 13 Oct 2023 12:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@cloud.com>
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
 <502c7fb1-eead-4e88-971e-2970fe7264ee@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <502c7fb1-eead-4e88-971e-2970fe7264ee@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/10/2023 07:31, Juergen Gross wrote:
> On 13.10.23 00:36, Stefano Stabellini wrote:
>> On Thu, 12 Oct 2023, George Dunlap wrote:
>>>>> Stop tinkering in the hope that it hides the problem.  You're only
>>>>> making it harder to fix properly.
>>>>
>>>> Making it harder to fix properly would be a valid reason not to commit
>>>> the (maybe partial) fix. But looking at the fix again:
>>>>
>>>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>>>> index a6cd199fdc..9cd6678015 100644
>>>> --- a/tools/xenstored/domain.c
>>>> +++ b/tools/xenstored/domain.c
>>>> @@ -989,6 +989,7 @@ static struct domain *introduce_domain(const 
>>>> void *ctx,
>>>>                  talloc_steal(domain->conn, domain);
>>>>
>>>>                  if (!restore) {
>>>> +                       domain_conn_reset(domain);
>>>>                          /* Notify the domain that xenstore is 
>>>> available */
>>>>                          interface->connection = XENSTORE_CONNECTED;
>>>>                          xenevtchn_notify(xce_handle, domain->port);
>>>> @@ -1031,8 +1032,6 @@ int do_introduce(const void *ctx, struct 
>>>> connection *conn,
>>>>          if (!domain)
>>>>                  return errno;
>>>>
>>>> -       domain_conn_reset(domain);
>>>> -
>>>>          send_ack(conn, XS_INTRODUCE);
>>>>
>>>> It is a 1-line movement. Textually small. Easy to understand and to
>>>> revert. It doesn't seem to be making things harder to fix? We could
>>>> revert it any time if a better fix is offered.
>>>>
>>>> Maybe we could have a XXX note in the commit message or in-code
>>>> comment?
>>>
>>> It moves a line from one function (do_domain_introduce()) into a
>>> completely different function (introduce_domain()), nested inside two
>>> if() statements; with no analysis on how the change will impact
>>> things.
>>
>> I am not the original author of the patch, and I am not the maintainer
>> of the code, so I don't feel I have the qualifications to give you the
>> answers you are seeking. Julien as author of the patch and xenstore
>> reviewer might be in a better position to answer. Or Juergen as xenstore
>> maintainer.
> 
> I did already provide some feedback when the patch was sent the first time
> in May.
> 
>>
>>  From what I can see the patch is correct.
> 
> You removed the dom0 special casing again, which I asked for to add back
> then.

+1

> And I still think there are missing barriers (at least for Arm).

Just to clarify. Do you mean adding a barrier after domain_conn_reset() 
but before adding setting interface->connection? If so, I agree that we 
need a wmb(). We don't have wmb() but smp_mb() in Xenstored. This 
stronger than necessary, but I think this is ok as I don't view as a 
hotpath.

Cheers,

-- 
Julien Grall

