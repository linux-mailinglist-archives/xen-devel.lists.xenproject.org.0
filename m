Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E330D2AF65B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 17:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25119.52709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcsyi-0007QR-5J; Wed, 11 Nov 2020 16:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25119.52709; Wed, 11 Nov 2020 16:28:12 +0000
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
	id 1kcsyi-0007Q2-2D; Wed, 11 Nov 2020 16:28:12 +0000
Received: by outflank-mailman (input) for mailman id 25119;
 Wed, 11 Nov 2020 16:28:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOJX=ER=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kcsyg-0007P8-9A
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 16:28:10 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb9d95d7-3253-4738-83cf-4b2ad341fa15;
 Wed, 11 Nov 2020 16:28:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id 23so3099494wrc.8
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 08:28:08 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id e6sm3186276wme.27.2020.11.11.08.28.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 08:28:06 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uOJX=ER=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kcsyg-0007P8-9A
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 16:28:10 +0000
X-Inumbo-ID: eb9d95d7-3253-4738-83cf-4b2ad341fa15
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb9d95d7-3253-4738-83cf-4b2ad341fa15;
	Wed, 11 Nov 2020 16:28:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id 23so3099494wrc.8
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 08:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=N5p7Cgdfa5RSEogVv2IhlZPMjrTH7i/2ipSIxDfwHno=;
        b=JZGmWQ/Dag44YRrUdwXAX7erRcU4kUaev3uuG3M1JnxOhlwPwqxc4b0tq4qeVe5ujw
         l1588ep7zMuSsMSGDacFo4Pq8wQ88czblqdcjMIEXyW2wDB4gqhoPYk6ZfNr5El4J6Zm
         K5qgEeMkxrBwhtiUj9j3+lzvDgdlzYZUAY0oMGtCBNZeNrlgfVEwIhrjUoT9pRW6w8mD
         It0AFaJDHEGQT90cPZudsyEH3YwWnATRzMvn4FaKMZiuxcSFXTzoqNJiHr76ukLKn1fy
         K2ClTCg3xWz34McHL/4mUENVsPf9+1TS7RjgLY4/tXXQlZ+BBybPGd+IzeGIoHJRy3K7
         oipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=N5p7Cgdfa5RSEogVv2IhlZPMjrTH7i/2ipSIxDfwHno=;
        b=aIPmHNprc0iGfwGcHL9FqHjFZF9YhqMOi+UDodyalCgy7XJHqSJwQrgXvjkDBEoNTA
         J/gEya+E2qa9hF4olEfw4hw5DPNd/nR3y31A3NDk7nN3JFNVGZwiaihIfGp/g3M31l+P
         XwUavY8nlKf2KYoLawh9IxJaK9IWc4HeWzjn+owKxKBpI+shAFB3RsEr+1efP+FuzayF
         2LZUJzh7wXYDFDcJuPf0V4r7KRw4f6MtIWZYG1S8pVhI7jjAp2wnkcxbKQ27v/5ikoGy
         +wZwthPn4H+BD1z1/CwpDs/p9IZidsiUF2IxmIy2OC/4KirKP8ljqvWgY9aMCgZXQ6pt
         tHJw==
X-Gm-Message-State: AOAM530BieWZzWDYFGLNzh0cg2e4sEYoZceBlnYtnfr4NgkUP56c2v7B
	Ade8wodNJsW/yn8T+GTOjLk=
X-Google-Smtp-Source: ABdhPJxGAYgnU/s3RV2jUuLSakYYGxqOOzQJb9zHZpDeCBxXFmLd/Y5IOyN0C5+41N8rmWthj75bzg==
X-Received: by 2002:a5d:4f07:: with SMTP id c7mr32225833wru.296.1605112087504;
        Wed, 11 Nov 2020 08:28:07 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id e6sm3186276wme.27.2020.11.11.08.28.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:28:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Oleksandr'" <olekstysh@gmail.com>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-18-git-send-email-olekstysh@gmail.com> <004e01d6a6cf$09cd9f40$1d68ddc0$@xen.org> <700a643e-641e-c243-cb2d-7ad8b5a9b8ad@gmail.com> <d4088e1b-1a50-d2fd-29b0-0f8a2cf4e7d4@suse.com> <ed9defbe-b6bf-bd1f-cd88-64d1b0e135c1@gmail.com> <0ab03a33-5056-0de8-e5f7-b54a661a09c5@suse.com>
In-Reply-To: <0ab03a33-5056-0de8-e5f7-b54a661a09c5@suse.com>
Subject: RE: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Wed, 11 Nov 2020 16:28:05 -0000
Message-ID: <003401d6b847$a2d9f470$e88ddd50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAGr5WYaAb7RyogBgA8OqwGUDZBmArIItvgB82Dp96pCHWKw
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 11 November 2020 13:28
> To: Oleksandr <olekstysh@gmail.com>
> Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Stefano =
Stabellini'
> <sstabellini@kernel.org>; 'Julien Grall' <julien@xen.org>; 'Volodymyr =
Babchuk'
> <Volodymyr_Babchuk@epam.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'George Dunlap'
> <george.dunlap@citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Wei =
Liu' <wl@xen.org>; 'Julien Grall'
> <julien.grall@arm.com>; paul@xen.org; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH V2 17/23] xen/ioreq: Introduce =
domain_has_ioreq_server()
>=20
> On 11.11.2020 09:41, Oleksandr wrote:
> >
> > On 11.11.20 10:08, Jan Beulich wrote:
> >
> > Hi Jan
> >
> >> On 10.11.2020 21:53, Oleksandr wrote:
> >>> On 20.10.20 13:51, Paul Durrant wrote:
> >>>
> >>> Hi Paul.
> >>>
> >>> Sorry for the late response.
> >>>
> >>>>> -----Original Message-----
> >>>>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> >>>>> Sent: 15 October 2020 17:44
> >>>>> To: xen-devel@lists.xenproject.org
> >>>>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; =
Stefano Stabellini
> <sstabellini@kernel.org>;
> >>>>> Julien Grall <julien@xen.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Andrew Cooper
> >>>>> <andrew.cooper3@citrix.com>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> >>>>> <iwj@xenproject.org>; Jan Beulich <jbeulich@suse.com>; Wei Liu =
<wl@xen.org>; Paul Durrant
> >>>>> <paul@xen.org>; Julien Grall <julien.grall@arm.com>
> >>>>> Subject: [PATCH V2 17/23] xen/ioreq: Introduce =
domain_has_ioreq_server()
> >>>>>
> >>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>>>
> >>>>> This patch introduces a helper the main purpose of which is to =
check
> >>>>> if a domain is using IOREQ server(s).
> >>>>>
> >>>>> On Arm the current benefit is to avoid calling =
handle_io_completion()
> >>>>> (which implies iterating over all possible IOREQ servers anyway)
> >>>>> on every return in leave_hypervisor_to_guest() if there is no =
active
> >>>>> servers for the particular domain.
> >>>>> Also this helper will be used by one of the subsequent patches =
on Arm.
> >>>>>
> >>>>> This involves adding an extra per-domain variable to store the =
count
> >>>>> of servers in use.
> >>>>>
> >>>>> Signed-off-by: Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>
> >>>>> CC: Julien Grall <julien.grall@arm.com>
> >>>>>
> >>>>> ---
> >>>>> Please note, this is a split/cleanup/hardening of Julien's PoC:
> >>>>> "Add support for Guest IO forwarding to a device emulator"
> >>>>>
> >>>>> Changes RFC -> V1:
> >>>>>      - new patch
> >>>>>
> >>>>> Changes V1 -> V2:
> >>>>>      - update patch description
> >>>>>      - guard helper with CONFIG_IOREQ_SERVER
> >>>>>      - remove "hvm" prefix
> >>>>>      - modify helper to just return =
d->arch.hvm.ioreq_server.nr_servers
> >>>>>      - put suitable ASSERT()s
> >>>>>      - use ASSERT(d->ioreq_server.server[id] ? !s : !!s) in =
set_ioreq_server()
> >>>>>      - remove d->ioreq_server.nr_servers =3D 0 from =
hvm_ioreq_init()
> >>>>> ---
> >>>>>    xen/arch/arm/traps.c    | 15 +++++++++------
> >>>>>    xen/common/ioreq.c      |  7 ++++++-
> >>>>>    xen/include/xen/ioreq.h | 14 ++++++++++++++
> >>>>>    xen/include/xen/sched.h |  1 +
> >>>>>    4 files changed, 30 insertions(+), 7 deletions(-)
> >>>>>
> >>>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> >>>>> index 507c095..a8f5fdf 100644
> >>>>> --- a/xen/arch/arm/traps.c
> >>>>> +++ b/xen/arch/arm/traps.c
> >>>>> @@ -2261,14 +2261,17 @@ static bool check_for_vcpu_work(void)
> >>>>>        struct vcpu *v =3D current;
> >>>>>
> >>>>>    #ifdef CONFIG_IOREQ_SERVER
> >>>>> -    bool handled;
> >>>>> +    if ( domain_has_ioreq_server(v->domain) )
> >>>>> +    {
> >>>>> +        bool handled;
> >>>>>
> >>>>> -    local_irq_enable();
> >>>>> -    handled =3D handle_io_completion(v);
> >>>>> -    local_irq_disable();
> >>>>> +        local_irq_enable();
> >>>>> +        handled =3D handle_io_completion(v);
> >>>>> +        local_irq_disable();
> >>>>>
> >>>>> -    if ( !handled )
> >>>>> -        return true;
> >>>>> +        if ( !handled )
> >>>>> +            return true;
> >>>>> +    }
> >>>>>    #endif
> >>>>>
> >>>>>        if ( likely(!v->arch.need_flush_to_ram) )
> >>>>> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> >>>>> index bcd4961..a72bc0e 100644
> >>>>> --- a/xen/common/ioreq.c
> >>>>> +++ b/xen/common/ioreq.c
> >>>>> @@ -39,9 +39,14 @@ static void set_ioreq_server(struct domain =
*d, unsigned int id,
> >>>>>                                 struct ioreq_server *s)
> >>>>>    {
> >>>>>        ASSERT(id < MAX_NR_IOREQ_SERVERS);
> >>>>> -    ASSERT(!s || !d->ioreq_server.server[id]);
> >>>>> +    ASSERT(d->ioreq_server.server[id] ? !s : !!s);
> >>>> That looks odd. How about ASSERT(!s ^ =
!d->ioreq_server.server[id])?
> >>> ok, looks like it will work.
> >>>
> >>>
> >>>>     Paul
> >>>>
> >>>>>        d->ioreq_server.server[id] =3D s;
> >>>>> +
> >>>>> +    if ( s )
> >>>>> +        d->ioreq_server.nr_servers++;
> >>>>> +    else
> >>>>> +        d->ioreq_server.nr_servers--;
> >>>>>    }
> >>>>>
> >>>>>    #define GET_IOREQ_SERVER(d, id) \
> >>>>> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> >>>>> index 7b03ab5..0679fef 100644
> >>>>> --- a/xen/include/xen/ioreq.h
> >>>>> +++ b/xen/include/xen/ioreq.h
> >>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
> >>>>>        uint8_t                bufioreq_handling;
> >>>>>    };
> >>>>>
> >>>>> +#ifdef CONFIG_IOREQ_SERVER
> >>>>> +static inline bool domain_has_ioreq_server(const struct domain =
*d)
> >>>>> +{
> >>>>> +    ASSERT((current->domain =3D=3D d) || =
atomic_read(&d->pause_count));
> >>>>> +
> >>>> This seems like an odd place to put such an assertion.
> >>> I might miss something or interpreted incorrectly but these =
asserts are
> >>> the result of how I understood the review comment on previous =
version [1].
> >>>
> >>> I will copy a comment here for the convenience:
> >>> "This is safe only when d =3D=3D current->domain and it's not =
paused,
> >>> or when they're distinct and d is paused. Otherwise the result is
> >>> stale before the caller can inspect it. This wants documenting by
> >>> at least a comment, but perhaps better by suitable ASSERT()s."
> >> The way his reply was worded, I think Paul was wondering about the
> >> place where you put the assertion, not what you actually assert.
> >
> > Shall I put the assertion at the call sites of this helper instead?
>=20
> Since Paul raised the question, I expect this is a question to him
> rather than me?

If it is indeed a question for me then yes, put the assertion where it =
is clear why it is needed. domain_has_ioreq_server() is essentially a =
trivial accessor function; it's not the appropriate place.

  Paul

>=20
> Jan


