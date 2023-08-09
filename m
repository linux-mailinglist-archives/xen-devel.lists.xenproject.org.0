Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC867755FF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 11:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580789.909201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTf1l-0001wo-2Z; Wed, 09 Aug 2023 08:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580789.909201; Wed, 09 Aug 2023 08:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTf1k-0001uJ-V2; Wed, 09 Aug 2023 08:58:48 +0000
Received: by outflank-mailman (input) for mailman id 580789;
 Wed, 09 Aug 2023 08:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohew=D2=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qTf1j-0001uD-MY
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 08:58:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f130a448-3692-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 10:58:43 +0200 (CEST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 329CB4EE0744
 for <xen-devel@lists.xenproject.org>; Wed,  9 Aug 2023 10:58:43 +0200 (CEST)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-487203bfbc6so1656546e0c.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Aug 2023 01:58:43 -0700 (PDT)
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
X-Inumbo-ID: f130a448-3692-11ee-8613-37d641c3527e
X-Gm-Message-State: AOJu0YzJyVfs3P3K5xuG2CadkS0vVu3wrMWiDkKuX7YdYBEnhgv1LUJ1
	XyJ0pBUpJw9QQSjFF8EI49gC0v0w6IRmEtn4INU=
X-Google-Smtp-Source: AGHT+IHfqkd1fs1G+auNdi2Jj0DmziS1LodfzCG8egIJC6u0z/v+TFsgiaa/G2Oz9iw4GmTqU/V7Q3OIs/4+7wNKt5Q=
X-Received: by 2002:a1f:6082:0:b0:485:ac24:df1 with SMTP id
 u124-20020a1f6082000000b00485ac240df1mr2598536vkb.12.1691571521967; Wed, 09
 Aug 2023 01:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690368810.git.simone.ballarin@bugseng.com>
In-Reply-To: <cover.1690368810.git.simone.ballarin@bugseng.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 9 Aug 2023 10:58:30 +0200
X-Gmail-Original-Message-ID: <CAFHJcJuSXqzHbB8P6d-YV_GgAadmxnWgETfaqDj_ge_ipWS7Pg@mail.gmail.com>
Message-ID: <CAFHJcJuSXqzHbB8P6d-YV_GgAadmxnWgETfaqDj_ge_ipWS7Pg@mail.gmail.com>
Subject: Re: [XEN PATCH 0/4] xen: address violations of MISRA C:2012 Rule 7.2
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000addeab060279afac"

--000000000000addeab060279afac
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 26 lug 2023 alle ore 13:04 Simone Ballarin <
simone.ballarin@bugseng.com> ha scritto:

> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline
> states:
> "A 'u' or 'U' suffix shall be applied to all integer constants that are
> represented in an unsigned type".
>
> These violations are caused by the missing "u" or "U" suffix in unsigned
> integer constants, such as:
>
> xen/arch/x86/hvm/hypercall.c:132.17-132.26
> if ( (eax & 0x80000000) && is_viridian_domain(currd) )
>
> If a rule is not met, changes are needed in order to achieve compliance.
> The patches in this series achieve compliance for MISRA C:2012 Rule 7.2 by
> adding the 'U' suffix to integers literals with unsigned type and also to
> other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
>
> Gianluca Luparini (4):
>   x86/vmx: address violations of MISRA C:2012 Rule 7.2
>   xen/vpci: address violations of MISRA C:2012 Rule 7.2
>   x86/viridian: address violations of MISRA C:2012 Rule 7.2
>   xen/x86: address violations of MISRA C:2012 Rule 7.2
>
>  xen/arch/x86/apic.c                          |   2 +-
>  xen/arch/x86/cpu-policy.c                    |  18 +-
>  xen/arch/x86/cpu/mcheck/mce-apei.c           |   4 +-
>  xen/arch/x86/cpu/vpmu_intel.c                |   2 +-
>  xen/arch/x86/cpuid.c                         |   8 +-
>  xen/arch/x86/efi/efi-boot.h                  |   6 +-
>  xen/arch/x86/extable.c                       |   2 +-
>  xen/arch/x86/hvm/hypercall.c                 |   2 +-
>  xen/arch/x86/hvm/pmtimer.c                   |   4 +-
>  xen/arch/x86/hvm/stdvga.c                    |  50 +++---
>  xen/arch/x86/hvm/viridian/viridian.c         |   2 +-
>  xen/arch/x86/hvm/vlapic.c                    |   6 +-
>  xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
>  xen/arch/x86/hvm/vmx/vvmx.c                  |   8 +-
>  xen/arch/x86/include/asm/apicdef.h           |   2 +-
>  xen/arch/x86/include/asm/config.h            |   2 +-
>  xen/arch/x86/include/asm/guest/hyperv-tlfs.h |  28 +--
>  xen/arch/x86/include/asm/hpet.h              |   2 +-
>  xen/arch/x86/include/asm/hvm/trace.h         |   4 +-
>  xen/arch/x86/include/asm/hvm/vioapic.h       |   2 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |  84 ++++-----
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h       |  16 +-
>  xen/arch/x86/include/asm/msi.h               |   2 +-
>  xen/arch/x86/include/asm/msr-index.h         | 180 +++++++++----------
>  xen/arch/x86/include/asm/pci.h               |   8 +-
>  xen/arch/x86/include/asm/x86-defns.h         |  24 +--
>  xen/arch/x86/percpu.c                        |   2 +-
>  xen/arch/x86/psr.c                           |   2 +-
>  xen/arch/x86/spec_ctrl.c                     |   8 +-
>  xen/arch/x86/x86_64/pci.c                    |   2 +-
>  xen/arch/x86/x86_emulate/x86_emulate.h       |   2 +-
>  xen/drivers/vpci/msi.c                       |   2 +-
>  xen/drivers/vpci/msix.c                      |   2 +-
>  xen/drivers/vpci/vpci.c                      |   6 +-
>  xen/lib/x86/cpuid.c                          |   8 +-
>  xen/lib/x86/policy.c                         |   2 +-
>  36 files changed, 255 insertions(+), 255 deletions(-)
>
> --
> 2.34.1
>
>
Hi all,
the entire series has not received yet any feedback or Acked-by.
I would kindly ask if it is possible to have at least some feedback

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000addeab060279afac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno mer 26 lug 2023 alle ore 13=
:04 Simone Ballarin &lt;<a href=3D"mailto:simone.ballarin@bugseng.com">simo=
ne.ballarin@bugseng.com</a>&gt; ha scritto:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">The xen sources contains violations of MISRA C:=
2012 Rule 7.2 whose headline<br>
states:<br>
&quot;A &#39;u&#39; or &#39;U&#39; suffix shall be applied to all integer c=
onstants that are<br>
represented in an unsigned type&quot;.<br>
<br>
These violations are caused by the missing &quot;u&quot; or &quot;U&quot; s=
uffix in unsigned<br>
integer constants, such as:<br>
<br>
xen/arch/x86/hvm/hypercall.c:132.17-132.26<br>
if ( (eax &amp; 0x80000000) &amp;&amp; is_viridian_domain(currd) )<br>
<br>
If a rule is not met, changes are needed in order to achieve compliance.<br=
>
The patches in this series achieve compliance for MISRA C:2012 Rule 7.2 by<=
br>
adding the &#39;U&#39; suffix to integers literals with unsigned type and a=
lso to other<br>
literals used in the same contexts or near violations, when their positive<=
br>
nature is immediately clear. The latter changes are done for the sake of<br=
>
uniformity.<br>
<br>
Gianluca Luparini (4):<br>
=C2=A0 x86/vmx: address violations of MISRA C:2012 Rule 7.2<br>
=C2=A0 xen/vpci: address violations of MISRA C:2012 Rule 7.2<br>
=C2=A0 x86/viridian: address violations of MISRA C:2012 Rule 7.2<br>
=C2=A0 xen/x86: address violations of MISRA C:2012 Rule 7.2<br>
<br>
=C2=A0xen/arch/x86/apic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/cpu-policy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 +-<br>
=C2=A0xen/arch/x86/cpu/mcheck/mce-apei.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0xen/arch/x86/cpu/vpmu_intel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/cpuid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0xen/arch/x86/efi/efi-boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0xen/arch/x86/extable.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/hvm/hypercall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/hvm/pmtimer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0xen/arch/x86/hvm/stdvga.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 +++---<br>
=C2=A0xen/arch/x86/hvm/viridian/viridian.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/hvm/vlapic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0xen/arch/x86/hvm/vmx/vmcs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0xen/arch/x86/hvm/vmx/vvmx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0xen/arch/x86/include/asm/apicdef.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/include/asm/config.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/include/asm/guest/hyperv-tlfs.h |=C2=A0 28 +--<br>
=C2=A0xen/arch/x86/include/asm/hpet.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/include/asm/hvm/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0xen/arch/x86/include/asm/hvm/vioapic.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/include/asm/hvm/vmx/vmcs.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8=
4 ++++-----<br>
=C2=A0xen/arch/x86/include/asm/hvm/vmx/vmx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 16 +-<br>
=C2=A0xen/arch/x86/include/asm/msi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/include/asm/msr-index.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 180 +++++++++----------<br>
=C2=A0xen/arch/x86/include/asm/pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0xen/arch/x86/include/asm/x86-defns.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 24 +--<br>
=C2=A0xen/arch/x86/percpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/psr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/spec_ctrl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0xen/arch/x86/x86_64/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0xen/arch/x86/x86_emulate/x86_emulate.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
=C2=A0xen/drivers/vpci/msi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0xen/drivers/vpci/msix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0xen/drivers/vpci/vpci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0xen/lib/x86/cpuid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0xen/lib/x86/policy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A036 files changed, 255 insertions(+), 255 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div>Hi all,</div><div>the entire seri=
es has not received yet any feedback or Acked-by.</div><div></div><div>I wo=
uld kindly ask if it is possible to have at least some feedback</div><br><s=
pan class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr">Simone Ballarin, M.Sc.<br><br><div>Fi=
eld Application Engineer, BUGSENG (<a href=3D"http://bugseng.com" target=3D=
"_blank">https://bugseng.com</a>)</div></div></div></div>

--000000000000addeab060279afac--

