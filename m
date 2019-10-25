Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CEBE48FA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 12:54:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNxBZ-0008KM-Rq; Fri, 25 Oct 2019 10:51:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EtYp=YS=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iNxBZ-0008KH-81
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 10:51:13 +0000
X-Inumbo-ID: 5af03276-f715-11e9-bbab-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5af03276-f715-11e9-bbab-bc764e2007e4;
 Fri, 25 Oct 2019 10:51:10 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id i16so1328661oie.4
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2019 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MPPlP1RCcerKZK+3m29aS3Cc2nDw1TJ00AQOJNvKtuQ=;
 b=lpGyV9+KL+xAJf52KiJ87WSMR1b87+h4bxk1ojzEDcLhGQ1BfYQjJgWa4gYI43hvcF
 rtPTTfwpA/8es9IOGapc3NmIDPydn8aWKFpoxk5g3duP3izEIXegQ3WdhmFMF/4P6QKK
 cTEVgFqxlcBwltLQdVQcAYjVYdcAlgGJ52kf9+dTz7zp+BUYisGSWJI55iB2lNn5+OHr
 osMa0+3ThGyRO8trLKtMqocg8fip1R2Zw6EJuYGZJav03hW25ALIqavsVMPNzAIquuUS
 t9qlep/79Lwkd6EvxC15C/iNLePZXEW7WP/DUeVaN7kphVaQpzMh860en6TriQSjPZRs
 OcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MPPlP1RCcerKZK+3m29aS3Cc2nDw1TJ00AQOJNvKtuQ=;
 b=Rc4JWlaahjDTVVBgoVjjOZSP0AM0VH9Kc2AaCfyP7N6X3NBCLmF0NHXlh5eiNy2S7Q
 SVJva3cHdkRS6fv0d/M6WUN4ae3XyrAqWO6jiuI6H14oSFyOUu3S0iMrsfSphRRbfpAG
 qhirOIc+MqpskmeMBRqdtY96QoJh4OyQGs6982AA12MB/dVX86ch6YdXk9CbgADYzkKB
 GxAOkLGs8L4djlhjNk+1sZwT/7wxrXpEIb4nTEMs3NoRhri2QgzHAFUrVpud0gz9RwoC
 BiELeuEh3khCcRUZJ2od2QMja0uyHAdiYv5ac6CvmPH6+kg+Xir6P/MVDq5DhGcB7RaZ
 BQuw==
X-Gm-Message-State: APjAAAV7dov2l4T3UYqCh8AycEeXMXQ2tDPwx4ibsR0XBcimlp6g4vWT
 qjk0Ns4oFh/um7AOFzEGeAJy/JA+UlNmCB3MxEY=
X-Google-Smtp-Source: APXvYqw/XQa9FSgj5YhXwaD2zH4zkagJubOIOHZSTwTh+2eg3bKKp7sKfrLEry7s7+/7nw2g4mGEzyvYhK2j7AqblBE=
X-Received: by 2002:a05:6808:341:: with SMTP id
 j1mr2362269oie.106.1572000669982; 
 Fri, 25 Oct 2019 03:51:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 25 Oct 2019 03:51:09
 -0700 (PDT)
In-Reply-To: <CAL1e-=ipp6u=qPj4UEWj+SB=KmDyVnJeOJwH1bQiQmQv1YyANQ@mail.gmail.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <CAL1e-=ipp6u=qPj4UEWj+SB=KmDyVnJeOJwH1bQiQmQv1YyANQ@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 25 Oct 2019 12:51:09 +0200
Message-ID: <CAL1e-=jnjn-n=h3mDN+1z14H9WmGjp95thPQ7bYkW7095wHCKA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] hw/i386/pc: Split PIIX3
 southbridge from i440FX northbridge
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============6567305920517931065=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6567305920517931065==
Content-Type: multipart/alternative; boundary="000000000000856db10595b9edcc"

--000000000000856db10595b9edcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thursday, October 24, 2019, Aleksandar Markovic <
aleksandar.m.mail@gmail.com> wrote:

>
>
> On Friday, October 18, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
> wrote:
>
>> Changes since v1 [0]:
>> - Removed patch reintroducing DO_UPCAST() use (thuth)
>> - Took various patches out to reduce series (thuth)
>> - Added review tags (thanks all for reviewing!)
>>
>>
> Philippe,
>
> Do you intend to submit v3? The softfreeze is close.
>
> A.
>
>
Philippe,

It looks you are very busy these days. Do you mind my integrating this
series in next Mips queue, in its present v2 state? (You can certainly do
further refinements later on.)

Aleksandar


>
>
>> $ git backport-diff -u pc_split_i440fx_piix-v1 -r mc146818rtc_init..
>> Key:
>> [----] : patches are identical
>> [####] : number of functional differences between upstream/downstream
>> patch
>> [down] : patch is downstream-only
>> The flags [FC] indicate (F)unctional and (C)ontextual differences,
>> respectively
>>
>> 001/20:[----] [--] 'MAINTAINERS: Keep PIIX4 South Bridge separate from P=
C
>> Chipsets'
>> 002/20:[0011] [FC] 'piix4: add Reset Control Register'
>> 003/20:[0014] [FC] 'piix4: add a i8259 interrupt controller as specified
>> in datasheet'
>> 004/20:[----] [--] 'Revert "irq: introduce qemu_irq_proxy()"'
>> 005/20:[----] [--] 'piix4: rename PIIX4 object to piix4-isa'
>> 006/20:[----] [-C] 'piix4: add a i8257 dma controller as specified in
>> datasheet'
>> 007/20:[----] [-C] 'piix4: add a i8254 pit controller as specified in
>> datasheet'
>> 008/20:[----] [-C] 'piix4: add a mc146818rtc controller as specified in
>> datasheet'
>> 009/20:[----] [--] 'hw/mips/mips_malta: Create IDE hard drive array
>> dynamically'
>> 010/20:[----] [--] 'hw/mips/mips_malta: Extract the PIIX4 creation code
>> as piix4_create()'
>> 011/20:[----] [--] 'hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c'
>> 012/20:[----] [--] 'hw/i386: Remove obsolete
>> LoadStateHandler::load_state_old handlers'
>> 013/20:[----] [--] 'hw/pci-host/piix: Extract piix3_create()'
>> 014/20:[0010] [FC] 'hw/pci-host/piix: Move RCR_IOPORT register definitio=
n'
>> 015/20:[----] [--] 'hw/pci-host/piix: Define and use the PIIX IRQ Route
>> Control Registers'
>> 016/20:[----] [--] 'hw/pci-host/piix: Move i440FX declarations to
>> hw/pci-host/i440fx.h'
>> 017/20:[----] [--] 'hw/pci-host/piix: Fix code style issues'
>> 018/20:[0012] [FC] 'hw/pci-host/piix: Extract PIIX3 functions to
>> hw/isa/piix3.c'
>> 019/20:[----] [--] 'hw/pci-host: Rename incorrectly named 'piix' as
>> 'i440fx''
>> 020/20:[----] [-C] 'hw/pci-host/i440fx: Remove the last PIIX3 traces'
>>
>> Previous cover:
>>
>> This series is a rework of "piix4: cleanup and improvements" [1]
>> from Herv=C3=A9, and my "remove i386/pc dependency: PIIX cleanup" [2].
>>
>> Still trying to remove the strong X86/PC dependency 2 years later,
>> one step at a time.
>> Here we split the PIIX3 southbridge from i440FX northbridge.
>> The i440FX northbridge is only used by the PC machine, while the
>> PIIX southbridge is also used by the Malta MIPS machine.
>>
>> This is also a step forward using KConfig with the Malta board.
>> Without this split, it was impossible to compile the Malta without
>> pulling various X86 pieces of code.
>>
>> The overall design cleanup is not yet perfect, but enough to post
>> as a series.
>>
>> Now that the PIIX3 code is extracted, the code duplication with the
>> PIIX4 chipset is obvious. Not worth improving for now because it
>> isn't broken.
>>
>> [0] https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg03685.html
>> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg500737.html
>> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg504081.html
>>
>> Based-on: <20191018133547.10936-1-philmd@redhat.com>
>> mc146818rtc: Allow call object_initialize(MC146818_RTC) instead of
>> rtc_init()
>> https://mid.mail-archive.com/20191018133547.10936-1-philmd@redhat.com
>>
>> Herv=C3=A9 Poussineau (5):
>>   piix4: Add the Reset Control Register
>>   piix4: Add a i8259 Interrupt Controller as specified in datasheet
>>   piix4: Rename PIIX4 object to piix4-isa
>>   piix4: Add a i8257 DMA Controller as specified in datasheet
>>   piix4: Add a i8254 PIT Controller as specified in datasheet
>>
>> Philippe Mathieu-Daud=C3=A9 (15):
>>   MAINTAINERS: Keep PIIX4 South Bridge separate from PC Chipsets
>>   Revert "irq: introduce qemu_irq_proxy()"
>>   piix4: Add a MC146818 RTC Controller as specified in datasheet
>>   hw/mips/mips_malta: Create IDE hard drive array dynamically
>>   hw/mips/mips_malta: Extract the PIIX4 creation code as piix4_create()
>>   hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c
>>   hw/i386: Remove obsolete LoadStateHandler::load_state_old handlers
>>   hw/pci-host/piix: Extract piix3_create()
>>   hw/pci-host/piix: Move RCR_IOPORT register definition
>>   hw/pci-host/piix: Define and use the PIIX IRQ Route Control Registers
>>   hw/pci-host/piix: Move i440FX declarations to hw/pci-host/i440fx.h
>>   hw/pci-host/piix: Fix code style issues
>>   hw/pci-host/piix: Extract PIIX3 functions to hw/isa/piix3.c
>>   hw/pci-host: Rename incorrectly named 'piix' as 'i440fx'
>>   hw/pci-host/i440fx: Remove the last PIIX3 traces
>>
>>  MAINTAINERS                      |  14 +-
>>  hw/acpi/pcihp.c                  |   2 +-
>>  hw/acpi/piix4.c                  |  42 +--
>>  hw/core/irq.c                    |  14 -
>>  hw/i386/Kconfig                  |   3 +-
>>  hw/i386/acpi-build.c             |   5 +-
>>  hw/i386/pc_piix.c                |  10 +-
>>  hw/i386/xen/xen-hvm.c            |   5 +-
>>  hw/intc/apic_common.c            |  49 ----
>>  hw/isa/Kconfig                   |   4 +
>>  hw/isa/Makefile.objs             |   1 +
>>  hw/isa/piix3.c                   | 399 +++++++++++++++++++++++++++++
>>  hw/isa/piix4.c                   | 151 ++++++++++-
>>  hw/mips/gt64xxx_pci.c            |   5 +-
>>  hw/mips/mips_malta.c             |  46 +---
>>  hw/pci-host/Kconfig              |   3 +-
>>  hw/pci-host/Makefile.objs        |   2 +-
>>  hw/pci-host/{piix.c =3D> i440fx.c} | 424 +-----------------------------=
-
>>  hw/timer/i8254_common.c          |  40 ---
>>  include/hw/acpi/piix4.h          |   6 -
>>  include/hw/i386/pc.h             |  37 ---
>>  include/hw/irq.h                 |   5 -
>>  include/hw/isa/isa.h             |   2 +
>>  include/hw/pci-host/i440fx.h     |  36 +++
>>  include/hw/southbridge/piix.h    |  74 ++++++
>>  stubs/pci-host-piix.c            |   3 +-
>>  26 files changed, 699 insertions(+), 683 deletions(-)
>>  create mode 100644 hw/isa/piix3.c
>>  rename hw/pci-host/{piix.c =3D> i440fx.c} (58%)
>>  delete mode 100644 include/hw/acpi/piix4.h
>>  create mode 100644 include/hw/pci-host/i440fx.h
>>  create mode 100644 include/hw/southbridge/piix.h
>>
>> --
>> 2.21.0
>>
>>
>>

--000000000000856db10595b9edcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, October 24, 2019, Aleksandar Markovic &lt;<a href=3D"m=
ailto:aleksandar.m.mail@gmail.com">aleksandar.m.mail@gmail.com</a>&gt; wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><br><br>On Friday, October 18, 2019, P=
hilippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" target=
=3D"_blank">philmd@redhat.com</a>&gt; wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Changes since v1 [0]:<br>
- Removed patch reintroducing DO_UPCAST() use (thuth)<br>
- Took various patches out to reduce series (thuth)<br>
- Added review tags (thanks all for reviewing!)<br>
<br></blockquote><div><br></div><div>Philippe,</div><div><br></div><div>Do =
you intend to submit v3? The softfreeze is close.</div><div><br></div><div>=
A.</div><div><br></div></blockquote><div><br></div><div>Philippe,</div><div=
><br></div><div>It looks you are very busy these days. Do you mind my integ=
rating this series in next Mips queue, in its present v2 state? (You can ce=
rtainly do further refinements later on.)</div><div><br></div><div>Aleksand=
ar</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
$ git backport-diff -u pc_split_i440fx_piix-v1 -r mc146818rtc_init..<br>
Key:<br>
[----] : patches are identical<br>
[####] : number of functional differences between upstream/downstream patch=
<br>
[down] : patch is downstream-only<br>
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
vely<br>
<br>
001/20:[----] [--] &#39;MAINTAINERS: Keep PIIX4 South Bridge separate from =
PC Chipsets&#39;<br>
002/20:[0011] [FC] &#39;piix4: add Reset Control Register&#39;<br>
003/20:[0014] [FC] &#39;piix4: add a i8259 interrupt controller as specifie=
d in datasheet&#39;<br>
004/20:[----] [--] &#39;Revert &quot;irq: introduce qemu_irq_proxy()&quot;&=
#39;<br>
005/20:[----] [--] &#39;piix4: rename PIIX4 object to piix4-isa&#39;<br>
006/20:[----] [-C] &#39;piix4: add a i8257 dma controller as specified in d=
atasheet&#39;<br>
007/20:[----] [-C] &#39;piix4: add a i8254 pit controller as specified in d=
atasheet&#39;<br>
008/20:[----] [-C] &#39;piix4: add a mc146818rtc controller as specified in=
 datasheet&#39;<br>
009/20:[----] [--] &#39;hw/mips/mips_malta: Create IDE hard drive array dyn=
amically&#39;<br>
010/20:[----] [--] &#39;hw/mips/mips_malta: Extract the PIIX4 creation code=
 as piix4_create()&#39;<br>
011/20:[----] [--] &#39;hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c=
&#39;<br>
012/20:[----] [--] &#39;hw/i386: Remove obsolete LoadStateHandler::load_sta=
te_o<wbr>ld handlers&#39;<br>
013/20:[----] [--] &#39;hw/pci-host/piix: Extract piix3_create()&#39;<br>
014/20:[0010] [FC] &#39;hw/pci-host/piix: Move RCR_IOPORT register definiti=
on&#39;<br>
015/20:[----] [--] &#39;hw/pci-host/piix: Define and use the PIIX IRQ Route=
 Control Registers&#39;<br>
016/20:[----] [--] &#39;hw/pci-host/piix: Move i440FX declarations to hw/pc=
i-host/i440fx.h&#39;<br>
017/20:[----] [--] &#39;hw/pci-host/piix: Fix code style issues&#39;<br>
018/20:[0012] [FC] &#39;hw/pci-host/piix: Extract PIIX3 functions to hw/isa=
/piix3.c&#39;<br>
019/20:[----] [--] &#39;hw/pci-host: Rename incorrectly named &#39;piix&#39=
; as &#39;i440fx&#39;&#39;<br>
020/20:[----] [-C] &#39;hw/pci-host/i440fx: Remove the last PIIX3 traces&#3=
9;<br>
<br>
Previous cover:<br>
<br>
This series is a rework of &quot;piix4: cleanup and improvements&quot; [1]<=
br>
from Herv=C3=A9, and my &quot;remove i386/pc dependency: PIIX cleanup&quot;=
 [2].<br>
<br>
Still trying to remove the strong X86/PC dependency 2 years later,<br>
one step at a time.<br>
Here we split the PIIX3 southbridge from i440FX northbridge.<br>
The i440FX northbridge is only used by the PC machine, while the<br>
PIIX southbridge is also used by the Malta MIPS machine.<br>
<br>
This is also a step forward using KConfig with the Malta board.<br>
Without this split, it was impossible to compile the Malta without<br>
pulling various X86 pieces of code.<br>
<br>
The overall design cleanup is not yet perfect, but enough to post<br>
as a series.<br>
<br>
Now that the PIIX3 code is extracted, the code duplication with the<br>
PIIX4 chipset is obvious. Not worth improving for now because it<br>
isn&#39;t broken.<br>
<br>
[0] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg036=
85.html" target=3D"_blank">https://lists.gnu.org/archive/<wbr>html/qemu-dev=
el/2019-10/msg036<wbr>85.html</a><br>
[1] <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg500737=
.html" target=3D"_blank">https://www.mail-archive.com/q<wbr>emu-devel@nongn=
u.org/msg500737<wbr>.html</a><br>
[2] <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg504081=
.html" target=3D"_blank">https://www.mail-archive.com/q<wbr>emu-devel@nongn=
u.org/msg504081<wbr>.html</a><br>
<br>
Based-on: &lt;<a href=3D"mailto:20191018133547.10936-1-philmd@redhat.com" t=
arget=3D"_blank">20191018133547.10936-1-<wbr>philmd@redhat.com</a>&gt;<br>
mc146818rtc: Allow call object_initialize(MC146818_RTC<wbr>) instead of rtc=
_init()<br>
<a href=3D"https://mid.mail-archive.com/20191018133547.10936-1-philmd@redha=
t.com" target=3D"_blank">https://mid.mail-archive.com/2<wbr>0191018133547.1=
0936-1-philmd@r<wbr>edhat.com</a><br>
<br>
Herv=C3=A9 Poussineau (5):<br>
=C2=A0 piix4: Add the Reset Control Register<br>
=C2=A0 piix4: Add a i8259 Interrupt Controller as specified in datasheet<br=
>
=C2=A0 piix4: Rename PIIX4 object to piix4-isa<br>
=C2=A0 piix4: Add a i8257 DMA Controller as specified in datasheet<br>
=C2=A0 piix4: Add a i8254 PIT Controller as specified in datasheet<br>
<br>
Philippe Mathieu-Daud=C3=A9 (15):<br>
=C2=A0 MAINTAINERS: Keep PIIX4 South Bridge separate from PC Chipsets<br>
=C2=A0 Revert &quot;irq: introduce qemu_irq_proxy()&quot;<br>
=C2=A0 piix4: Add a MC146818 RTC Controller as specified in datasheet<br>
=C2=A0 hw/mips/mips_malta: Create IDE hard drive array dynamically<br>
=C2=A0 hw/mips/mips_malta: Extract the PIIX4 creation code as piix4_create(=
)<br>
=C2=A0 hw/isa/piix4: Move piix4_create() to hw/isa/piix4.c<br>
=C2=A0 hw/i386: Remove obsolete LoadStateHandler::load_state_o<wbr>ld handl=
ers<br>
=C2=A0 hw/pci-host/piix: Extract piix3_create()<br>
=C2=A0 hw/pci-host/piix: Move RCR_IOPORT register definition<br>
=C2=A0 hw/pci-host/piix: Define and use the PIIX IRQ Route Control Register=
s<br>
=C2=A0 hw/pci-host/piix: Move i440FX declarations to hw/pci-host/i440fx.h<b=
r>
=C2=A0 hw/pci-host/piix: Fix code style issues<br>
=C2=A0 hw/pci-host/piix: Extract PIIX3 functions to hw/isa/piix3.c<br>
=C2=A0 hw/pci-host: Rename incorrectly named &#39;piix&#39; as &#39;i440fx&=
#39;<br>
=C2=A0 hw/pci-host/i440fx: Remove the last PIIX3 traces<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
=C2=A0hw/acpi/pcihp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 42 +--<br>
=C2=A0hw/core/irq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 -<br>
=C2=A0hw/i386/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +-<br>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 10 +-<br>
=C2=A0hw/i386/xen/xen-hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 +-<br>
=C2=A0hw/intc/apic_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 49 ----<br>
=C2=A0hw/isa/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0hw/isa/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/isa/piix3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 399 +++++++++++++++++++++++++++++<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 151 ++++++++++-<br>
=C2=A0hw/mips/gt64xxx_pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 +-<br>
=C2=A0hw/mips/mips_malta.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 46 +---<br>
=C2=A0hw/pci-host/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +-<br>
=C2=A0hw/pci-host/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 =
+-<br>
=C2=A0hw/pci-host/{piix.c =3D&gt; i440fx.c} | 424 +------------------------=
-----<wbr>-<br>
=C2=A0hw/timer/i8254_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 40 =
---<br>
=C2=A0include/hw/acpi/piix4.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 -<br>
=C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 37 ---<br>
=C2=A0include/hw/irq.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A05 -<br>
=C2=A0include/hw/isa/isa.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +<br>
=C2=A0include/hw/pci-host/i440fx.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 36 +++<br>
=C2=A0include/hw/southbridge/piix.<wbr>h=C2=A0 =C2=A0 |=C2=A0 74 ++++++<br>
=C2=A0stubs/pci-host-piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A026 files changed, 699 insertions(+), 683 deletions(-)<br>
=C2=A0create mode 100644 hw/isa/piix3.c<br>
=C2=A0rename hw/pci-host/{piix.c =3D&gt; i440fx.c} (58%)<br>
=C2=A0delete mode 100644 include/hw/acpi/piix4.h<br>
=C2=A0create mode 100644 include/hw/pci-host/i440fx.h<br>
=C2=A0create mode 100644 include/hw/southbridge/piix.h<br>
<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>
</blockquote>

--000000000000856db10595b9edcc--


--===============6567305920517931065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6567305920517931065==--

