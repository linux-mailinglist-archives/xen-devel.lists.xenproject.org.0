Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2285A872D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 22:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396040.636014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTTtn-0002Sm-35; Wed, 31 Aug 2022 20:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396040.636014; Wed, 31 Aug 2022 20:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTTtm-0002PS-WE; Wed, 31 Aug 2022 20:01:19 +0000
Received: by outflank-mailman (input) for mailman id 396040;
 Wed, 31 Aug 2022 20:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/7nv=ZD=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1oTTtk-0002PM-JE
 for xen-devel@lists.xen.org; Wed, 31 Aug 2022 20:01:16 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa95939c-2967-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 22:01:14 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id r22so14413476pgm.5
 for <xen-devel@lists.xen.org>; Wed, 31 Aug 2022 13:01:14 -0700 (PDT)
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
X-Inumbo-ID: aa95939c-2967-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=I/PghFa2/oCFxr+GuvHmzJ4Q7i6SiPWFfs6IebmEayc=;
        b=jqq8Vev6PINozuRERkr8xKJdsTCz0t2P4cbo+3224UB8En7LSamBtnrxuP7cFmWwp2
         Xsf7ej5U4o18IW3UhnBNUP6wH/qx54bgwk7WmGKcPJ0jg/xadgd0Vm035JMRyPDjSWTG
         T3VKGXpIVZ+5iX+N+AVRuW+FZKIO09ZIrLHISw6G0jcG4e7Fj27YP0ZfrtGNzO5H8JIh
         IYW43GQBLga7pVTKXQDPccDHxoYK/7muQD5cMu6fsA/FWkCHa+z40uLjwWCvxfoG09j+
         DvswMilegg/RHVcdci2TwkEus+WZ1ePR4abPfzu25MEDZNW3ykpNAZdGweH8KgpXfbIc
         EiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=I/PghFa2/oCFxr+GuvHmzJ4Q7i6SiPWFfs6IebmEayc=;
        b=CCAaiq3+JXQpGxvdPBSLRA3ANEjJiuVUn/SxyoywYHNx0smnaCszI1q/QHyjeYLiM0
         yLZjTEQ7mw9guYenqwu6zq7TbKPLUfE10CKIGQEEWno7GAqiM50JjpjCFWAIb4GWjoso
         0D1qI7l5Z/j5EZUOqIs7uNSgIlohyYKlf07US1gsr7yqwrU/L0qOeOyVYuioPtguqlB4
         2+EYkscIBo1gWYMnjgC5XBnp5r+bwl+F3kHJj/Zb9R/G0z7q+9fIAGamHnGni2V5afNo
         mcyeWIdwwJitAkx3UatXRzGHDferIrxS8zYTqdcKqXUiG2JoJfzRg9Yzr9JgJeiSeipo
         Pqjg==
X-Gm-Message-State: ACgBeo0gaSi/Rj7/ACPyXZeImSMKLsAA7npUo4qW8kyBIv6iOzgwPqIQ
	qY4wHbHf7Qh3+AERlBeIELcHdFrQ0OM5DfukwNLWfivKVTg=
X-Google-Smtp-Source: AA6agR4Sl1ykQfn+NaJFQxc4+gUc6hh89qR1J1nt/fi8MV/DX8QkeK2Mu7KavAd2Ul+/jdHyb+FrKy4Vog1QeVrSy+M=
X-Received: by 2002:a63:914c:0:b0:42b:a8fa:eb47 with SMTP id
 l73-20020a63914c000000b0042ba8faeb47mr17152714pge.267.1661976073059; Wed, 31
 Aug 2022 13:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2s6ZfY87dR2noYkKiH_QwJMXKbj_6404Hmru-t==vSAhw@mail.gmail.com>
 <516110eb-f2aa-f2f7-2f11-a1dbe47930c8@xen.org>
In-Reply-To: <516110eb-f2aa-f2f7-2f11-a1dbe47930c8@xen.org>
From: Oleshii Wood <oleshiiwood@gmail.com>
Date: Wed, 31 Aug 2022 23:01:01 +0300
Message-ID: <CA+SAi2uS6bCUiYnygSbjaCu_1WPd9RsRDLno6bvmKRBKXrEhZg@mail.gmail.com>
Subject: Re: Xen in ARM environment networking overload issue
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="00000000000075c16005e78ef5eb"

--00000000000075c16005e78ef5eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

I do not think this patch actually affects this behaviour.
But I will check.

Regards,
Oleg

=D1=81=D1=80, 31 =D0=B0=D0=B2=D0=B3. 2022 =D0=B3. =D0=B2 22:31, Julien Gral=
l <julien@xen.org>:

>
>
> On 30/08/2022 14:09, Oleshii Wood wrote:
> > Hello guys,
>
> Hello,
>
> >
> > The same issue migh be found by link
> >
> https://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=3Dxen_add_phys_to_mac=
h_entry&page=3D1
> > <
> https://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=3Dxen_add_phys_to_mac=
h_entry&page=3D1
> >
>
> The link also contains a pointer to a patch which is...
>
> >
> > DOM0/DOMU kernels version 5.15.19
>
> ... not included in 5.15.19 but is at least included in the latest
> stable version for 5.15 (5.15.63).
>
> Please update the latest v5.15.X and check if this issue is still present=
.
>
> [...]
>
> > It is produced unconditionally. In  the above mentioned condition this
> > output
> > degrades the performance drastically.
>
> The error message is a sign something went horribly wrong. The right
> solution is to find the root cause rather than...
>
> > I may offer a patch which decreases the amount of messages.
>
> ... decreasing the verbosity.
>
> Cheers,
>
> --
> Julien Grall
>

--00000000000075c16005e78ef5eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,</div><div><br></div><div>I do not think th=
is patch actually affects this behaviour.</div><div>But I will check.</div>=
<div><br></div><div>Regards,</div><div>Oleg</div><div><br></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 31 =D0=
=B0=D0=B2=D0=B3. 2022 =D0=B3. =D0=B2 22:31, Julien Grall &lt;<a href=3D"mai=
lto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt;:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddi=
ng-left:1ex"><br>
<br>
On 30/08/2022 14:09, Oleshii Wood wrote:<br>
&gt; Hello guys,<br>
<br>
Hello,<br>
<br>
&gt; <br>
&gt; The same issue migh be found by link<br>
&gt; <a href=3D"https://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=3Dxen_a=
dd_phys_to_mach_entry&amp;page=3D1" rel=3D"noreferrer" target=3D"_blank">ht=
tps://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=3Dxen_add_phys_to_mach_en=
try&amp;page=3D1</a> <br>
&gt; &lt;<a href=3D"https://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=3Dx=
en_add_phys_to_mach_entry&amp;page=3D1" rel=3D"noreferrer" target=3D"_blank=
">https://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=3Dxen_add_phys_to_mac=
h_entry&amp;page=3D1</a>&gt;<br>
<br>
The link also contains a pointer to a patch which is...<br>
<br>
&gt; <br>
&gt; DOM0/DOMU kernels version 5.15.19<br>
<br>
... not included in 5.15.19 but is at least included in the latest<br>
stable version for 5.15 (5.15.63).<br>
<br>
Please update the latest v5.15.X and check if this issue is still present.<=
br>
<br>
[...]<br>
<br>
&gt; It is produced unconditionally. In =C2=A0the above mentioned condition=
 this <br>
&gt; output<br>
&gt; degrades the performance drastically.<br>
<br>
The error message is a sign something went horribly wrong. The right <br>
solution is to find the root cause rather than...<br>
<br>
&gt; I may offer a patch which decreases the amount of messages.<br>
<br>
... decreasing the verbosity.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div>

--00000000000075c16005e78ef5eb--

