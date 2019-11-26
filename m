Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8110A5EA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 22:23:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZiFt-00075E-Mq; Tue, 26 Nov 2019 21:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iAuL=ZS=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1iZiFs-000759-3G
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 21:20:16 +0000
X-Inumbo-ID: 898af3c8-1092-11ea-83b8-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 898af3c8-1092-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 21:20:14 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id s75so19054922ilc.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 13:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=QMkBq65D1vXMgUYePoSkIdVz5Pw+7Mb09ctNKZ7F3o8=;
 b=h5ZHZDZb42//vPEx5bLoK3mG+nYlRvxhP0Z3gxBIxah7ELRe/LHDQBBMzpTRwM4ZVO
 aATEP1dW2blEW3Ac+MQgc5E3uNQcmUyfe6LbkSvGMEgg8mRAkD9j+YIZH1VNhpkpI5Zw
 MarNregB6Yt8cGze/3aySO4N0yLlytFpCswWgkWIPbFVM7CPCW5VVtAGMUaoB+RTEcRp
 CO3kgTdwtjWOtyREFEbFA0YONqzR5umnS6+7EWtAj54kPvjSLCSTlszxZ2J7p01ZWrGM
 H0MEyz/jQgm6rv6Uf6c2bP9aW70ckbXvE/FnZvK2bfc6yVXvi+dmoKIll+Nfzy+6IHk7
 3duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=QMkBq65D1vXMgUYePoSkIdVz5Pw+7Mb09ctNKZ7F3o8=;
 b=SedmIMGVjO6jGqqPbSzxGZSFm3204fXFL89U2DIWsQc+K2idfi/opSFlYmLBi1IHsn
 zZv9/UkDUl3OQWGwrjDWoWQTUQpA/5+bv1rLSEqYjep58UkvShTIQD971YklUwLZeilM
 pPW00yK4mTSJb5A+3J4JMBTxmCWR3FS3XBe+Bv/WCmnCxi2KgN+0Zvrdd3kQF2kBruqm
 KdywJsFaDUbzEapDpT3DdUPsN7ZrcjDCPf2qoJAcbH0xQRkHHrA11pyADTE+fWaRGxPZ
 jlZqi7tMM5UA3l2nbZ4o6I8YMB7oLcuT9jBBACcriAk1POmyXCUgSgAaMgOOuxc36Jgm
 gt5w==
X-Gm-Message-State: APjAAAUnayEdYVFh48SifAe+2PvNkD3rlg+1DKcncO+Y7bgVJ1I/y+pT
 jFq+S+CCoN1EXk5TCIang9s=
X-Google-Smtp-Source: APXvYqwjfxhTgUcNKqqLATqxBTRKzygcdNqvX1/2BcSKYJg5MB6RRCTKINIiwaDH08zsvirCvrGAgQ==
X-Received: by 2002:a92:4899:: with SMTP id j25mr40058717ilg.127.1574803214279; 
 Tue, 26 Nov 2019 13:20:14 -0800 (PST)
Received: from [100.64.72.189] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id e15sm3501049ile.28.2019.11.26.13.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2019 13:20:13 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <9A92C0ED-DF7C-4951-BF4A-06763F60F266@gmail.com>
Date: Tue, 26 Nov 2019 16:20:12 -0500
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: iPad Mail (17B111)
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: multipart/mixed; boundary="===============8365170864671680852=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8365170864671680852==
Content-Type: multipart/alternative; boundary=Apple-Mail-D090D73C-061B-405D-9147-4BDFE59111C2
Content-Transfer-Encoding: 7bit


--Apple-Mail-D090D73C-061B-405D-9147-4BDFE59111C2
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Nov 26, 2019, at 15:23, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
> =EF=BB=BFOn 26/11/2019 20:12, Roman Shaposhnik wrote:
>>> On Tue, Nov 26, 2019 at 10:32 AM Marek Marczykowski-G=C3=B3recki
>>> <marmarek@invisiblethingslab.com> wrote:
>>> On Tue, Nov 26, 2019 at 09:56:25AM -0800, Roman Shaposhnik wrote:
>>>> Hi Marek, after applying Jan's patch I'm making much further progress.
>>>> Xen boots fine and Dom0 seems to be OK (more tests are needed tho on
>>>> my end).
>>>> I'm attaching the logs from Xen and Dom0.
>>>> At this point it seems that adding efi=3Dattr=3Duc is a better option f=
or
>>>> these boxes than a wholesale efi=3Dno-rs
>>>> Question #1: is this something that EFI_SET_VIRTUAL_ADDRESS_MAP was
>>>> supposed to cover by default (so I don't have to add efi=3Dattr=3Duc)?
>>> No, this looks like some different firmware (?) issue.
>>>> Question #2: is there any downside to *always* specifying efi=3Dattr=3D=
uc?
>>>> Even for servers that, strictly speaking, don't need it?
>>> TL;DR: It should be fine. It is what Linux does too.
>>> Details:
>>> Lets take a look why 'efi=3Dattr=3Duc' helps, and how can we make it wor=
k
>>> out of the box:
>>> The issue is about memory marked as type=3D11 (EfiMemoryMappedIO) with
>>> attr=3D8000000000000000 (EFI_MEMORY_RUNTIME). Indeed none of cachability=

>>> attribute is defined. For the record, defined attributes are (UEFI spec
>>> .6):
>>>    EFI_MEMORY_UC Memory cacheability attribute: The memory region suppor=
ts
>>>    being configured as not cacheable.
>>>    EFI_MEMORY_WC Memory cacheability attribute: The memory region suppor=
ts
>>>    being configured as write combining.
>>>    EFI_MEMORY_WT Memory cacheability attribute: The memory region suppor=
ts
>>>    being configured as cacheable with a =E2=80=9Cwrite through=E2=80=9D p=
olicy.
>>>    Writes that hit in the cache will also be written to main memory.
>>>    EFI_MEMORY_WB Memory cacheability attribute: The memory region suppor=
ts
>>>    being configured as cacheable with a =E2=80=9Cwrite back=E2=80=9D pol=
icy. Reads
>>>    and writes that hit in the cache do not propagate to main memory.
>>>    Dirty data is written back to main memory when a new cache line
>>>    is allocated.
>>>    EFI_MEMORY_UCE Memory cacheability attribute: The memory region suppo=
rts
>>>    being configured as not cacheable, exported, and supports the
>>>    =E2=80=9Cfetch and add=E2=80=9D semaphore mechanism.
>>> My reading of UEFI spec doesn't give much hints what to do with memory
>>> mappings without any cachability attribute. The only related info I've
>>> found is about EfiMemoryMappedIO:
>>>    This memory is not used by the OS. All system memory-mapped IO
>>>    information should come from ACPI tables.
>>> So, maybe there is some more info?
>>> Anyway, if I understand correctly, MMIO region should be mapped as UC,
>>> right?
>>> I've also taken look at what Linux does. And basically, the only bit
>>> Linux care about is EFI_MEMORY_WB - if it's absent, then set the region
>>> as uncachable (page cache disabled bit in page table entry). So,
>>> basically Linux by default does what Xen's efi=3Dattr=3Duc does.
>> Very interesting! Thanks for doing the research.
>>=20
>>> So, to improve Xen's hardware/firmware compatibility, I have two ideas:
>>> 1. Make efi=3Dattr=3Duc the default (it's still possible to disable it w=
ith
>>> efi=3Dattr=3Dno).
>> I'd be very much in favor of that too (especially since it seems to match=

>> Linux behaviour) What do others think?
>=20
> Its more than just this.  Linux also doesn't use EFI reboot because it
> is broken almost everywhere (because Windows doesn't use it because its
> broken almost everywhere, so it never gets fixed).
>=20
> Xen should be following Linux, but I'm exhausted arguing this point.
>=20
> A consequence is that downstream tend to share a pile of "unbreak Xen on
> UEFI" patches which have been rejected upstream on philosophical rather
> than technical grounds, despite this being a toxic environment to work in.=


As an intermediate step, could we have an umbrella opt-in Kconfig option (CO=
NFIG_EFI_NONSPEC_COMPATIBILITY?) that enables multiple EFI options for maxim=
um hardware compatibility?  For this thread and Xen 4.13, that would be EFI_=
SET_VIRTUAL_ADDRESS_MAP and efi=3Dattr=3Duc.  If more options/quirks are add=
ed in the future, downstreams using EFI_NONSPEC_COMPATIBILITY would get them=
 by default.

The long-term solution is an OSS virtualization-security test tool (e.g. wit=
h Xen and QEMU KVM) that can be run by OEM/ODM QA factory teams on pre-produ=
ction firmware and hardware.  That is the most OEM-actionable development wi=
ndow where firmware quality issues can be detected and fixed.  Microsoft's h=
ardware logo/certification work with Windows 10 OEMs on "secured core" featu=
res is also tackling firmware improvements for virtualization-based security=
.=20

=46rom the business side, Dell/HP/Lenovo + other OEMs and ODMs could add pre=
mium "FirmCare" SKUs into their custom build ordering systems, where custome=
rs could pay a small fee for additional firmware support, custom root-of-tru=
st (e.g. BootGuard) key management, or even coreboot.  This could move from c=
ost-center incentives [1] to high-margin incentives [2] for firmware and pla=
tform health, safety & security.  Another step would be including firmware r=
equirements in supply chain contracts [3] for large customer orders.

While we wait on these ecosystem improvements, CONFIG_EFI_NONSPEC_COMPATIBIL=
ITY or a similar option for Xen 4.13 would help users of existing platforms.=


Rich


[1] Firmware is the new Software, https://www.platformsecuritysummit.com/201=
8/speaker/hudson/

[2] https://i.blackhat.com/USA-19/Thursday/us-19-Krstic-Behind-The-Scenes-Of=
-IOS-And-Mas-Security.pdf

[3] "Humans" videos and Q&A, https://www.platformsecuritysummit.com/2019/vid=
eos/


--Apple-Mail-D090D73C-061B-405D-9147-4BDFE59111C2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Nov 26, 2019, at 15:23,=
 Andrew Cooper &lt;Andrew.Cooper3@citrix.com&gt; wrote:<div dir=3D"ltr"><blo=
ckquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite"><div d=
ir=3D"ltr">=EF=BB=BF<span>On 26/11/2019 20:12, Roman Shaposhnik wrote:</span=
><br><blockquote type=3D"cite"><span>On Tue, Nov 26, 2019 at 10:32 AM Marek M=
arczykowski-G=C3=B3recki</span><br></blockquote><blockquote type=3D"cite"><s=
pan>&lt;marmarek@invisiblethingslab.com&gt; wrote:</span><br></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>On Tue, Nov 26, 2019=
 at 09:56:25AM -0800, Roman Shaposhnik wrote:</span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Hi Marek, after applying Jan's patch I'm making much further pr=
ogress.</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Xen boots f=
ine and Dom0 seems to be OK (more tests are needed tho on</span><br></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>my end).</span><br></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span></span><br></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>I'm attaching the logs from Xen and Dom0.</span><br></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>At this point it seems that adding efi=3Dattr=3Duc is a bett=
er option for</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>these=
 boxes than a wholesale efi=3Dno-rs</span><br></blockquote></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span></span><br></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Q=
uestion #1: is this something that EFI_SET_VIRTUAL_ADDRESS_MAP was</span><br=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>supposed to cover by default=
 (so I don't have to add efi=3Dattr=3Duc)?</span><br></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>No=
, this looks like some different firmware (?) issue.</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>Question #2: is there any downside to=
 *always* specifying efi=3Dattr=3Duc?</span><br></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>Even for servers that, strictly speaking, don't need it?<=
/span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>TL;DR: It should be fine. It is what Linux do=
es too.</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>Details:</span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Lets take a look why 'efi=3Dattr=3Duc' helps, and how can we ma=
ke it work</span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>out of the box:</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>The issue is about memory marked as type=3D11 (EfiMemoryMappedIO) with=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>attr=3D8000000000000000 (EFI_MEMORY_RUNTIME). Indeed none=
 of cachability</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>attribute is defined. For the record, defi=
ned attributes are (UEFI spec</span><br></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>.6):</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span> &nbsp;&nbsp;&nbsp;EFI_MEMORY_UC Memory cacheability attribute:=
 The memory region supports</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;being config=
ured as not cacheable.</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp=
;EFI_MEMORY_WC Memory cacheability attribute: The memory region supports</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span> &nbsp;&nbsp;&nbsp;being configured as write combining.</span><=
br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;EFI_MEMORY_WT Memory cachea=
bility attribute: The memory region supports</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;=
&nbsp;being configured as cacheable with a =E2=80=9Cwrite through=E2=80=9D p=
olicy.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;Writes that hit in the cache wil=
l also be written to main memory.</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbs=
p;&nbsp;&nbsp;EFI_MEMORY_WB Memory cacheability attribute: The memory region=
 supports</span><br></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;being configured as cacheable=
 with a =E2=80=9Cwrite back=E2=80=9D policy. Reads</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;=
&nbsp;&nbsp;and writes that hit in the cache do not propagate to main memory=
.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span> &nbsp;&nbsp;&nbsp;Dirty data is written back to main mem=
ory when a new cache line</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;is allocated.=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;EFI_MEMORY_UCE Memo=
ry cacheability attribute: The memory region supports</span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nb=
sp;&nbsp;&nbsp;being configured as not cacheable, exported, and supports the=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span> &nbsp;&nbsp;&nbsp;=E2=80=9Cfetch and add=E2=80=9D semaph=
ore mechanism.</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>My reading of UEFI spec d=
oesn't give much hints what to do with memory</span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>mappings wit=
hout any cachability attribute. The only related info I've</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>found is about EfiMemoryMappedIO:</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nb=
sp;&nbsp;&nbsp;This memory is not used by the OS. All system memory-mapped I=
O</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span> &nbsp;&nbsp;&nbsp;information should come from ACPI tabl=
es.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>So, maybe there is some more info?</s=
pan><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>Anyway, if I understand correctly, MMIO r=
egion should be mapped as UC,</span><br></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>right?</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>I've also taken look at what Linux does. And basically, the o=
nly bit</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>Linux care about is EFI_MEMORY_WB - if it's absent=
, then set the region</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>as uncachable (page cache disabled bi=
t in page table entry). So,</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>basically Linux by default does=
 what Xen's efi=3Dattr=3Duc does.</span><br></blockquote></blockquote><block=
quote type=3D"cite"><span>Very interesting! Thanks for doing the research.</=
span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><span>So, to improve X=
en's hardware/firmware compatibility, I have two ideas:</span><br></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>1. Make efi=3Dattr=3Duc the default (it's still possible to=
 disable it with</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>efi=3Dattr=3Dno).</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><span>I'd be very much in favor of th=
at too (especially since it seems to match</span><br></blockquote><blockquot=
e type=3D"cite"><span>Linux behaviour) What do others think?</span><br></blo=
ckquote><span></span><br><span>Its more than just this.&nbsp; Linux also doe=
sn't use EFI reboot because it</span><br><span>is broken almost everywhere (=
because Windows doesn't use it because its</span><br><span>broken almost eve=
rywhere, so it never gets fixed).</span><br><span></span><br><span>Xen shoul=
d be following Linux, but I'm exhausted arguing this point.</span><br><span>=
</span><br><span>A consequence is that downstream tend to share a pile of "u=
nbreak Xen on</span><br><span>UEFI" patches which have been rejected upstrea=
m on philosophical rather</span><br><span>than technical grounds, despite th=
is being a toxic environment to work in.</span></div></blockquote><br><div>A=
s an intermediate step, could we have an umbrella opt-in Kconfig option (CON=
FIG_EFI_NONSPEC_COMPATIBILITY?) that enables multiple EFI options for maximu=
m hardware compatibility? &nbsp;For this thread and Xen 4.13, that would be E=
FI_SET_VIRTUAL_ADDRESS_MAP and efi=3Dattr=3Duc. &nbsp;If more options/quirks=
 are added in the future, downstreams using EFI_NONSPEC_COMPATIBILITY would g=
et them by default.</div><div><br></div><div>The long-term solution is an OS=
S virtualization-security test tool (e.g. with Xen and QEMU KVM) that can be=
 run by OEM/ODM QA factory teams on pre-production firmware and hardware. &n=
bsp;That is the most OEM-actionable development window where firmware qualit=
y issues can be detected and fixed. &nbsp;Microsoft's hardware logo/certific=
ation work with Windows 10 OEMs on "secured core" features is also tackling f=
irmware improvements for virtualization-based security.&nbsp;</div><div><br>=
</div><div>=46rom the business side, Dell/HP/Lenovo + other OEMs and ODMs co=
uld add premium "FirmCare" SKUs into their custom build ordering systems, wh=
ere customers could pay a small fee for additional firmware support, custom r=
oot-of-trust (e.g. BootGuard) key management, or even coreboot. &nbsp;This c=
ould move from cost-center incentives [1] to high-margin incentives [2] for f=
irmware and platform health, safety &amp; security. &nbsp;Another step would=
 be including firmware requirements in supply chain contracts [3] for large c=
ustomer orders.</div><div><br></div><div>While we wait on these ecosystem im=
provements, CONFIG_EFI_NONSPEC_COMPATIBILITY or a similar option for Xen 4.1=
3 would help users of existing platforms.</div><div><br></div><div>Rich</div=
><div><br></div><div><br></div><div>[1] Firmware is the new Software,&nbsp;<=
a href=3D"https://www.platformsecuritysummit.com/2018/speaker/hudson/">https=
://www.platformsecuritysummit.com/2018/speaker/hudson/</a></div><div><br></d=
iv><div>[2]&nbsp;<a href=3D"https://i.blackhat.com/USA-19/Thursday/us-19-Krs=
tic-Behind-The-Scenes-Of-IOS-And-Mas-Security.pdf">https://i.blackhat.com/US=
A-19/Thursday/us-19-Krstic-Behind-The-Scenes-Of-IOS-And-Mas-Security.pdf</a>=
</div><div><br></div><div>[3] "Humans" videos and Q&amp;A,&nbsp;<a href=3D"h=
ttps://www.platformsecuritysummit.com/2019/videos/">https://www.platformsecu=
ritysummit.com/2019/videos/</a></div><div><br></div></div></body></html>=

--Apple-Mail-D090D73C-061B-405D-9147-4BDFE59111C2--


--===============8365170864671680852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8365170864671680852==--

