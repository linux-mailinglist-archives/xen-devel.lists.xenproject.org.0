Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441D52D9752
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 12:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52156.91264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolvN-0000yY-V4; Mon, 14 Dec 2020 11:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52156.91264; Mon, 14 Dec 2020 11:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolvN-0000yD-RO; Mon, 14 Dec 2020 11:21:53 +0000
Received: by outflank-mailman (input) for mailman id 52156;
 Mon, 14 Dec 2020 11:21:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XC/h=FS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kolvN-0000y8-45
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 11:21:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4563709c-3621-443d-92ee-5b89aa8bc2ee;
 Mon, 14 Dec 2020 11:21:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93F8EAD60;
 Mon, 14 Dec 2020 11:21:50 +0000 (UTC)
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
X-Inumbo-ID: 4563709c-3621-443d-92ee-5b89aa8bc2ee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607944910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DNYIxy+r7yeoJ7MK2nSf2PZmeT9Cry+FFG0QZQaOnAU=;
	b=HpCmy6enjvJ6RrL5UCLYMa9mirIls1kQH13ATI6WiUJef/iTDTZu3BoL2IE4JquundiZxf
	4b1bvvnaA9eLU+H7/WzoTRT46fpQCijNrTmCAJuOdaq5KNQ6lTVMwie+JbwgWOzDb34U0R
	WVWH3WMzcw7vWTMbsRqeuvffl2ZrZXY=
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
 <9d3f8583-cfba-0174-3275-b418648f3f31@xen.org>
 <3042ff2f-5d55-a132-a5fc-b214ec53e7a1@suse.com>
 <4a632e73-87ea-c037-09e1-dfc88d19d9b2@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3f49eb17-0b2a-5b4f-81db-66454f13cf90@suse.com>
Date: Mon, 14 Dec 2020 12:21:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4a632e73-87ea-c037-09e1-dfc88d19d9b2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qgaPEs4YRdMYcPAfBVKQCcnPChZiZsQvI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qgaPEs4YRdMYcPAfBVKQCcnPChZiZsQvI
Content-Type: multipart/mixed; boundary="eBZ4fSXuoGTBHEGOFto4gaLIlLANKd0cl";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Message-ID: <3f49eb17-0b2a-5b4f-81db-66454f13cf90@suse.com>
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
 <9d3f8583-cfba-0174-3275-b418648f3f31@xen.org>
 <3042ff2f-5d55-a132-a5fc-b214ec53e7a1@suse.com>
 <4a632e73-87ea-c037-09e1-dfc88d19d9b2@xen.org>
In-Reply-To: <4a632e73-87ea-c037-09e1-dfc88d19d9b2@xen.org>

--eBZ4fSXuoGTBHEGOFto4gaLIlLANKd0cl
Content-Type: multipart/mixed;
 boundary="------------2017CD014B179C77A9911C0F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2017CD014B179C77A9911C0F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.12.20 12:14, Julien Grall wrote:
> Hi Juergen,
>=20
> On 14/12/2020 10:51, J=C3=BCrgen Gro=C3=9F wrote:
>> On 14.12.20 11:17, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> On 14/12/2020 07:56, Juergen Gross wrote:
>>>> Add support to run a function in an exception handler for Arm. Do it=

>>>> the same way as on x86 via a bug_frame.
>>>>
>>>> Unfortunately inline assembly on Arm seems to be less capable than o=
n
>>>> x86, leading to functions called via run_in_exception_handler() havi=
ng
>>>> to be globally visible.
>>>
>>> Jan already commented on this, so I am not going to comment again.
>>
>> Maybe I can ask some Arm specific question related to this:
>>
>> In my experiments the only working solution was using the "i" constrai=
nt
>> for the function pointer. Do you know whether this is supported for al=
l
>> gcc versions we care about?
>=20
> I don't know for sure. However, Linux has been using "i" since 2012. So=
=20
> I would assume it ought to be fine for all the version we care.
>=20
>>
>> Or is there another way to achieve the desired functionality? I'm usin=
g
>> now the following macros:
>>
>> #define BUG_FRAME_run_fn(fn) do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0 asm ("1:"BUG_INSTR"\n"=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".pushsection .=
bug_frames." __stringify(BUGFRAME_run_fn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ", \"a=
\", %%progbits\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\n"=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".p2align 2\n"=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long (1b - 2b=
)\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long (%0 - 2b=
)\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".long 0\n"=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".hword 0, 0\n"=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".popsection" :=
: "i" (fn));=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> } while (0)
>=20
> May I ask why we need a new macro?

Using a common one might be possible, but not with the current way how
BUG_FRAME() is defined: gcc complained about the input parameter in case
of ASSERT() and WARN().

I might be missing something, but this was the fastest way to at least
confirm the scheme is working for Arm.

>=20
>>
>> #define run_in_exception_handler(fn) BUG_FRAME_run_fn(fn)
>>
>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ---
>>>> V4:
>>>> - new patch
>>>>
>>>> I have verified the created bugframe is correct by inspecting the
>>>> created binary.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ---
>>>> =C2=A0 xen/arch/arm/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10=
 +++++++++-
>>>> =C2=A0 xen/drivers/char/ns16550.c |=C2=A0 3 ++-
>>>> =C2=A0 xen/include/asm-arm/bug.h=C2=A0 | 32 +++++++++++++++++++++---=
--------
>>>> =C2=A0 3 files changed, 32 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>>> index 22bd1bd4c6..6e677affe2 100644
>>>> --- a/xen/arch/arm/traps.c
>>>> +++ b/xen/arch/arm/traps.c
>>>> @@ -1236,8 +1236,16 @@ int do_bug_frame(const struct cpu_user_regs=20
>>>> *regs, vaddr_t pc)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !bug )
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOEN=
T;
>>>> +=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
>>>> +=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct =
cpu_user_regs *) =3D bug_ptr(bug);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn(regs);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* WARN, BUG or ASSERT: decode the fi=
lename pointer and line=20
>>>> number. */
>>>> -=C2=A0=C2=A0=C2=A0 filename =3D bug_file(bug);
>>>> +=C2=A0=C2=A0=C2=A0 filename =3D bug_ptr(bug);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !is_kernel(filename) )
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVA=
L;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fixup =3D strlen(filename);
>>>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c=

>>>> index 9235d854fe..dd6500acc8 100644
>>>> --- a/xen/drivers/char/ns16550.c
>>>> +++ b/xen/drivers/char/ns16550.c
>>>> @@ -192,7 +192,8 @@ static void ns16550_interrupt(
>>>> =C2=A0 /* Safe: ns16550_poll() runs as softirq so not reentrant on a=
=20
>>>> given CPU. */
>>>> =C2=A0 static DEFINE_PER_CPU(struct serial_port *, poll_port);
>>>> -static void __ns16550_poll(struct cpu_user_regs *regs)
>>>> +/* run_in_exception_handler() on Arm requires globally visible=20
>>>> symbol. */
>>>> +void __ns16550_poll(struct cpu_user_regs *regs)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct serial_port *port =3D this_cpu=
(poll_port);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ns16550 *uart =3D port->uart;
>>>> diff --git a/xen/include/asm-arm/bug.h b/xen/include/asm-arm/bug.h
>>>> index 36c803357c..a7da2c306f 100644
>>>> --- a/xen/include/asm-arm/bug.h
>>>> +++ b/xen/include/asm-arm/bug.h
>>>> @@ -15,34 +15,38 @@
>>>> =C2=A0 struct bug_frame {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signed int loc_disp;=C2=A0=C2=A0=C2=A0=
 /* Relative address to the bug address */
>>>> -=C2=A0=C2=A0=C2=A0 signed int file_disp;=C2=A0=C2=A0 /* Relative ad=
dress to the filename */
>>>> +=C2=A0=C2=A0=C2=A0 signed int ptr_disp;=C2=A0=C2=A0=C2=A0 /* Relati=
ve address to the filename or=20
>>>> function */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 signed int msg_disp;=C2=A0=C2=A0=C2=A0=
 /* Relative address to the predicate=20
>>>> (for ASSERT) */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t line;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Line number */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t pad0:16;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* Padding for 8-bytes align */
>>>> =C2=A0 };
>>>> =C2=A0 #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>>>> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>>>> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
>>>> =C2=A0 #define bug_line(b) ((b)->line)
>>>> =C2=A0 #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>>>> -#define BUGFRAME_warn=C2=A0=C2=A0 0
>>>> -#define BUGFRAME_bug=C2=A0=C2=A0=C2=A0 1
>>>> -#define BUGFRAME_assert 2
>>>> +#define BUGFRAME_run_fn 0
>>>> +#define BUGFRAME_warn=C2=A0=C2=A0 1
>>>> +#define BUGFRAME_bug=C2=A0=C2=A0=C2=A0 2
>>>> +#define BUGFRAME_assert 3
>>>
>>> Why did you renumber it? IOW, why can't BUGFRAME_run_fn be defined as=
 3?
>>
>> This matches x86 definition. IMO there is no reason to have a differen=
t
>> definition and this will make it more obvious that it might be a good
>> idea to have a common include/xen/bug.h header.
>=20
> I agree that common header would be nice. Although, I am not sure if=20
> this is achievable. However, my point here is this change would have=20
> deserved half-sentence in the commit message because to me this look=20
> like unwanted churn.

Okay.


Juergen

--------------2017CD014B179C77A9911C0F
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2017CD014B179C77A9911C0F--

--eBZ4fSXuoGTBHEGOFto4gaLIlLANKd0cl--

--qgaPEs4YRdMYcPAfBVKQCcnPChZiZsQvI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/XSs0FAwAAAAAACgkQsN6d1ii/Ey9C
/gf/QfjT2kG+VpXYPydG+Bq+k+zjOzVdjSjFNP9mNtgYc+u9ZmUhi02l64EA439QCrQaXww+6Vgc
2XaB/owLySwDNgI/8ZjDze+BsQJQzs7XB+/pgbdrhpzkukqk1ffje1I2T5U+LQIyStnqpPzDoMSx
/xrZKEERKYBtf9AZo6NS92NZahtFMluPzbqbU5glHALEW5rGwvntTBdZFhs6TLjKriIEZTGTqu2i
P7menq19FzBO/Nchjuea3nPkBt4BYHnCs+thG+sRCuP1K5c7RYFiTZnX2pjswqJoeWY3j4Fudr9y
dp1/WGI358mCBCAQxnbYMMTQhCoqCTeMKvElzrPkTw==
=oeM3
-----END PGP SIGNATURE-----

--qgaPEs4YRdMYcPAfBVKQCcnPChZiZsQvI--

