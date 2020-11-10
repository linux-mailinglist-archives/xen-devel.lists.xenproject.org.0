Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E102AE114
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 21:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23946.50948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcadv-0007Yb-E4; Tue, 10 Nov 2020 20:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23946.50948; Tue, 10 Nov 2020 20:53:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcadv-0007YC-Aw; Tue, 10 Nov 2020 20:53:31 +0000
Received: by outflank-mailman (input) for mailman id 23946;
 Tue, 10 Nov 2020 20:53:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kcadt-0007Xe-LA
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 20:53:29 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03b5462d-70c6-47dd-9da1-3c117ee88eda;
 Tue, 10 Nov 2020 20:53:28 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b17so3716217ljf.12
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 12:53:28 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u25sm2221609lfo.198.2020.11.10.12.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 12:53:26 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kcadt-0007Xe-LA
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 20:53:29 +0000
X-Inumbo-ID: 03b5462d-70c6-47dd-9da1-3c117ee88eda
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 03b5462d-70c6-47dd-9da1-3c117ee88eda;
	Tue, 10 Nov 2020 20:53:28 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b17so3716217ljf.12
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 12:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EQd+dYIPIqLBD0R0ERmRb49QsS0Y9wO0s924FzzJ6iU=;
        b=X/fCK5wWC7fdVVo4CsJp+uUeJV+zwiDTJnzoGOG0kgUJZOhb8qlTjG1fMktJQx/yPc
         h9Dqo/2Fz6iXgC5Vgp+2dL66b6E+MSAQRGeT5zy6GE71IXmoKpdR5TLhirY2hHmtA94T
         Co+9tHochKdQoGfNDqXXMZ8w34Of5lBo0VfZn3vRUQj9O/FtmDiKCL0y3Go7aWnMa/MX
         LE7szJcoaxbrhwm14fSvhaVMqbWWr2QR9Wk2rpfv2k4GFFTqPPTrcxHQB9bwv3KnqJ9Q
         gZppJE/23SJLYyYcgfFioEjZWIcmeFjMWTjGls2WVU5u1TBZU2PUfW8sw6vhYlVD3bIw
         YLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EQd+dYIPIqLBD0R0ERmRb49QsS0Y9wO0s924FzzJ6iU=;
        b=IzEwe1EoDRRsJepv33zuNUk7SUIEhH31y5DkJ1JRwVq/4O5sBbOcrJWQJyo5QqJsdr
         w72acEzSK/I+SfTcw8BJrJPPGXiZyVSO2uEQjtWvePnYqCaZuoYVMlWohgjVYJg8oYTZ
         mZoNC/cgsPt837H2eC/cnC6Lx9o1Nm3jUSVmRJSW+MlrZXur2ZLCqo0ej9/fIFss5w9X
         g1eg+nez/soMyGXF57s6Tx3hwaxqk1WjY4PSxnhb2thEga9AqEJhgZZELAY2A72M5hFB
         xVdr05TA6kbpjZjng7PxKRsLvEe1fKp+7gTK0PKUNICd9IXCjZgv1O/ZXdr5F6XL3USR
         IrBg==
X-Gm-Message-State: AOAM5313NBbIvzxSG29i3nIw0tPHJQ7d3G8/RQY9T3OKrPGEr8FomWB1
	6OuN5NMDJ6Hf6ZJt8Y47fQ8=
X-Google-Smtp-Source: ABdhPJwZ2DXqBsM8loS36kNafC7esUpda78IhylZ24t3HgcJPnmGqsUna78ykHuUkfZn0SDYihGSNw==
X-Received: by 2002:a2e:b536:: with SMTP id z22mr9368485ljm.177.1605041607388;
        Tue, 10 Nov 2020 12:53:27 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id u25sm2221609lfo.198.2020.11.10.12.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 12:53:26 -0800 (PST)
Subject: Re: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Wei Liu' <wl@xen.org>, 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-18-git-send-email-olekstysh@gmail.com>
 <004e01d6a6cf$09cd9f40$1d68ddc0$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <700a643e-641e-c243-cb2d-7ad8b5a9b8ad@gmail.com>
Date: Tue, 10 Nov 2020 22:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <004e01d6a6cf$09cd9f40$1d68ddc0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.10.20 13:51, Paul Durrant wrote:

Hi Paul.

Sorry for the late response.

>
>> -----Original Message-----
>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>> Sent: 15 October 2020 17:44
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano Stabellini <sstabellini@kernel.org>;
>> Julien Grall <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>> <iwj@xenproject.org>; Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Paul Durrant
>> <paul@xen.org>; Julien Grall <julien.grall@arm.com>
>> Subject: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch introduces a helper the main purpose of which is to check
>> if a domain is using IOREQ server(s).
>>
>> On Arm the current benefit is to avoid calling handle_io_completion()
>> (which implies iterating over all possible IOREQ servers anyway)
>> on every return in leave_hypervisor_to_guest() if there is no active
>> servers for the particular domain.
>> Also this helper will be used by one of the subsequent patches on Arm.
>>
>> This involves adding an extra per-domain variable to store the count
>> of servers in use.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - new patch
>>
>> Changes V1 -> V2:
>>     - update patch description
>>     - guard helper with CONFIG_IOREQ_SERVER
>>     - remove "hvm" prefix
>>     - modify helper to just return d->arch.hvm.ioreq_server.nr_servers
>>     - put suitable ASSERT()s
>>     - use ASSERT(d->ioreq_server.server[id] ? !s : !!s) in set_ioreq_server()
>>     - remove d->ioreq_server.nr_servers = 0 from hvm_ioreq_init()
>> ---
>>   xen/arch/arm/traps.c    | 15 +++++++++------
>>   xen/common/ioreq.c      |  7 ++++++-
>>   xen/include/xen/ioreq.h | 14 ++++++++++++++
>>   xen/include/xen/sched.h |  1 +
>>   4 files changed, 30 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 507c095..a8f5fdf 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -2261,14 +2261,17 @@ static bool check_for_vcpu_work(void)
>>       struct vcpu *v = current;
>>
>>   #ifdef CONFIG_IOREQ_SERVER
>> -    bool handled;
>> +    if ( domain_has_ioreq_server(v->domain) )
>> +    {
>> +        bool handled;
>>
>> -    local_irq_enable();
>> -    handled = handle_io_completion(v);
>> -    local_irq_disable();
>> +        local_irq_enable();
>> +        handled = handle_io_completion(v);
>> +        local_irq_disable();
>>
>> -    if ( !handled )
>> -        return true;
>> +        if ( !handled )
>> +            return true;
>> +    }
>>   #endif
>>
>>       if ( likely(!v->arch.need_flush_to_ram) )
>> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
>> index bcd4961..a72bc0e 100644
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -39,9 +39,14 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
>>                                struct ioreq_server *s)
>>   {
>>       ASSERT(id < MAX_NR_IOREQ_SERVERS);
>> -    ASSERT(!s || !d->ioreq_server.server[id]);
>> +    ASSERT(d->ioreq_server.server[id] ? !s : !!s);
> That looks odd. How about ASSERT(!s ^ !d->ioreq_server.server[id])?

ok, looks like it will work.


>    Paul
>
>>       d->ioreq_server.server[id] = s;
>> +
>> +    if ( s )
>> +        d->ioreq_server.nr_servers++;
>> +    else
>> +        d->ioreq_server.nr_servers--;
>>   }
>>
>>   #define GET_IOREQ_SERVER(d, id) \
>> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
>> index 7b03ab5..0679fef 100644
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>       uint8_t                bufioreq_handling;
>>   };
>>
>> +#ifdef CONFIG_IOREQ_SERVER
>> +static inline bool domain_has_ioreq_server(const struct domain *d)
>> +{
>> +    ASSERT((current->domain == d) || atomic_read(&d->pause_count));
>> +
> This seems like an odd place to put such an assertion.

I might miss something or interpreted incorrectly but these asserts are 
the result of how I understood the review comment on previous version [1].

I will copy a comment here for the convenience:
"This is safe only when d == current->domain and it's not paused,
or when they're distinct and d is paused. Otherwise the result is
stale before the caller can inspect it. This wants documenting by
at least a comment, but perhaps better by suitable ASSERT()s."


>
>> +    return d->ioreq_server.nr_servers;
>> +}
>> +#else
>> +static inline bool domain_has_ioreq_server(const struct domain *d)
>> +{
>> +    return false;
>> +}
>> +#endif
>> +
> Can this be any more compact? E.g.
>
> return IS_ENABLED(CONFIG_IOREQ_SERVER) && d->ioreq_server.nr_servers;
>
> ?
I have got a compilation error this way (if CONFIG_IOREQ_SERVER is 
disabled):

...xen/4.14.0+gitAUTOINC+ee22110219-r0/git/xen/include/xen/ioreq.h:62:48: 
error: ‘const struct domain’ has no member named ‘ioreq_server’
      return IS_ENABLED(CONFIG_IOREQ_SERVER) && d->ioreq_server.nr_servers;
                                                 ^
as domain's ioreq_server struct is guarded by CONFIG_IOREQ_SERVER as well.


[1] 
https://patchwork.kernel.org/project/xen-devel/patch/1599769330-17656-12-git-send-email-olekstysh@gmail.com/#23618623

Thank you.

-- 
Regards,

Oleksandr Tyshchenko


