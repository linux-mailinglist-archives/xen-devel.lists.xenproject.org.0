Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD103A3DAB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 10:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140275.259212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrc5Q-0001ya-Er; Fri, 11 Jun 2021 08:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140275.259212; Fri, 11 Jun 2021 08:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrc5Q-0001vl-Ah; Fri, 11 Jun 2021 08:00:16 +0000
Received: by outflank-mailman (input) for mailman id 140275;
 Fri, 11 Jun 2021 08:00:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nlzc=LF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1lrc5O-0001vf-Jr
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 08:00:14 +0000
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d60073ed-eb01-44c4-8d2f-70995ecb5c53;
 Fri, 11 Jun 2021 08:00:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d13so22552970edt.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 01:00:13 -0700 (PDT)
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
X-Inumbo-ID: d60073ed-eb01-44c4-8d2f-70995ecb5c53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0R7E4T9d2tEv8nooyR5gAHHyWAHViu7nEx7MS5YEQDU=;
        b=YlLAmwt/KRq5P0Yjbeb1nBSdFXr1Od49TDDjew0HO4BGBgvy13YrE5p4k1dVEL2Vtx
         N3Ls/2BT95qHUjPD74OX56OzB56Mww3cukaRgOU8ycoOffwZ5fT1ATnTRb69TDmCtUAg
         pclMJYkSLjNNEz6Vxj9hCUWzQOctoV0fw8PAsHPUsK5cp6muzf3gFGLRixxLdJGTaRI4
         jT6SvbuUMhqfdKY1eUpHUmCYuugQKOsGULKD/Gcn+wQtT1xRyVOoZCDzTFv5lEgPJvKC
         TKn42kbioWHQDRHpZxoIDVJ6dJbLVSz22Ss39djfOlN2r6tUkQnqfn14m4FIVF+nzRij
         7iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0R7E4T9d2tEv8nooyR5gAHHyWAHViu7nEx7MS5YEQDU=;
        b=lSox8zWJMAAiLnYFHrNDpVA5Ja/WJ0sugOEOP0335B+r5ZYALPXEMUY6ee3DNE0Koh
         fqt2mmur5IV+r+T3Vn8RIPuzAl2H/oKo2oexC8a3cb7C0XM9/E2inowacZadqHBR0jhM
         +Otn6pUnSxEAcpcx3tR2OfvHGLlJU24BosVZqyA+bR77DRt1NfxsPUn7cncwSpXDE4fF
         TodzVBiZ4/sZDIdgIe6LE8Bc/yPhxUZJl3g7OpgMBCp2nkDMM0eSz3FeF2yvO7KmnEmk
         CtZsHWba8PZn3tnwkU7Y2aSzBphb3CYtNsWStkYNBcVbLkvtu3pVEGuldXbYOXwDrWT5
         +v+Q==
X-Gm-Message-State: AOAM5325b7UqHIzs5ZJ0DR9EZ3lbNmskbk1oyFRyDEkm777GFjnLVF82
	cZwPWe+E8fhS0mOwCobPAvFJoXkCPJiXwldtx9A=
X-Google-Smtp-Source: ABdhPJxBUd64j58LzHObKQZ4tDynm4VV4XWl96/NiPmL24BAnFlndULqvHBb0nmGr9cX+igiGtFROvGQ08jDwSDNqDc=
X-Received: by 2002:a05:6402:2789:: with SMTP id b9mr2254592ede.142.1623398412973;
 Fri, 11 Jun 2021 01:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <e4946a69-bc1a-d54c-dadf-e71feecd99ab@suse.com>
In-Reply-To: <e4946a69-bc1a-d54c-dadf-e71feecd99ab@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 11 Jun 2021 09:00:01 +0100
Message-ID: <CAJ=z9a07v-cnMhK=cVjjdN3-f4t8qGc3oQz17zRdLxOauBp=qA@mail.gmail.com>
Subject: Re: [PATCH] Arm32: MSR to SPSR needs qualification
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000bbfa0f05c478e559"

--000000000000bbfa0f05c478e559
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Jun 2021, 08:55 Jan Beulich, <jbeulich@suse.com> wrote:

> The Arm ARM's description of MSR doesn't even allow for plain "SPSR"
> here, and while gas accepts this, it takes it to mean SPSR_cf. Yet
> surely all of SPSR wants updating on this path, not just the lowest and
> highest 8 bits.
>

Can you provide a reference to the Arm Arm? This would help to navigate
through the 8000 pages.

Cheers,



> Fixes: dfcffb128be4 ("xen/arm32: SPSR_hyp/SPSR")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/arm/arm32/entry.S
> +++ b/xen/arch/arm/arm32/entry.S
> @@ -395,7 +395,7 @@ return_to_hypervisor:
>          ldr r11, [sp, #UREGS_pc]
>          msr ELR_hyp, r11
>          ldr r11, [sp, #UREGS_cpsr]
> -        msr SPSR, r11
> +        msr SPSR_cxsf, r11
>  #ifdef CONFIG_ARM32_HARDEN_BRANCH_PREDICTOR
>          /*
>           * Hardening branch predictor may require to setup a different
>
>

--000000000000bbfa0f05c478e559
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 11 Jun 2021, 08:55 Jan Beulich, &lt;<a href=3D=
"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">The Arm ARM&#39;s description of MSR doesn&#39;t e=
ven allow for plain &quot;SPSR&quot;<br>
here, and while gas accepts this, it takes it to mean SPSR_cf. Yet<br>
surely all of SPSR wants updating on this path, not just the lowest and<br>
highest 8 bits.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Can you provide a reference to the Arm Arm? This would help =
to navigate through the 8000 pages.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<br>
Fixes: dfcffb128be4 (&quot;xen/arm32: SPSR_hyp/SPSR&quot;)<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;<br>
<br>
--- a/xen/arch/arm/arm32/entry.S<br>
+++ b/xen/arch/arm/arm32/entry.S<br>
@@ -395,7 +395,7 @@ return_to_hypervisor:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr r11, [sp, #UREGS_pc]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msr ELR_hyp, r11<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr r11, [sp, #UREGS_cpsr]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msr SPSR, r11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msr SPSR_cxsf, r11<br>
=C2=A0#ifdef CONFIG_ARM32_HARDEN_BRANCH_PREDICTOR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Hardening branch predictor may require=
 to setup a different<br>
<br>
</blockquote></div></div></div>

--000000000000bbfa0f05c478e559--

