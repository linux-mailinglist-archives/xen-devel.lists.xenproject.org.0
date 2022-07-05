Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED176567CFB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 06:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361692.591413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8wIJ-0008CN-1r; Wed, 06 Jul 2022 04:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361692.591413; Wed, 06 Jul 2022 04:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8wII-0008A6-Ua; Wed, 06 Jul 2022 04:05:42 +0000
Received: by outflank-mailman (input) for mailman id 361692;
 Tue, 05 Jul 2022 23:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zbt5=XK=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1o8s0O-0007UN-A7
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 23:30:56 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 831ec046-fcba-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 01:30:54 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id m16so1716088edb.11;
 Tue, 05 Jul 2022 16:30:53 -0700 (PDT)
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
X-Inumbo-ID: 831ec046-fcba-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=GfcysKack9u98LD+9jFe9m1kkIS9l/4gskecDGT1Tyg=;
        b=Dn576q5muipsNwTncrgD3aK2l/p+gqcMjP56jXliVMIPAxPF90qVCOKdj410P7RdBY
         XwcaZRFIakc9WKHRjNWs2oYeQzMR6Xdp+lDkiKlaeLI8YNKYblxMkOUqq1VoeWAfXAlq
         AbNkgmuD1gnGWpsIC3NN29D+hRtU4/dgYSHFIei38jxK6xISyWdTsJ/Hqcz4mlG5szYw
         6EfwJA4GQdmc6YzXbViqktUI/lGjk1QwCfWeUQ270A5uZUCajAjmDXW6dBl80wjZTeS3
         YMDxQGRNeLYJq5cuu4aC9SxCQNgjCik/vX0dL/jBQxPFp8cwRjrAuadzsLvdkjqbla3L
         f5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=GfcysKack9u98LD+9jFe9m1kkIS9l/4gskecDGT1Tyg=;
        b=1VZB0WWYzgHjP70lgHd2Zy/aG+T5W+0Z/yDJIbyi7LElmkx5DbSOrVgdtIzRtXl7Qj
         23ICVGO0l5gRZacNqVVa3Qoj+7lze4CU7dBnlAWcN6FnhZukRZD0UsBk2BfhIGIL6Qsf
         22PwYoPVVyN1Md70lam5quXElyVwBYA/AJujA405Vu/Md9bU5iautzm3yNKkFNEqljuu
         fCA2wf7awPNrGHDrI2xsWkO5Cy9iYX1vB3djTYsgmcmaaMQROO85V2OSrtrHyetnRnpG
         b9cXYEIYlMNUQ/7UzYj0BgmRrQzTz/3l3MctuTPLRpmAUXDwqhZpwZhI0bul/bYqNDnJ
         hEyg==
X-Gm-Message-State: AJIora+G2p3p7NkEwOoKPlalDWoNYTdRnmzqQV7MrVSR2/N6T1Hvmi5P
	Jq5yRse4rwWz+cEnhYzszgBIwd2MnioOn4AEoWG0kDyzodkWUfiK
X-Google-Smtp-Source: AGRyM1sdNzWgpuQxgXE+rz9MAYioTlsOYPvN6qxcNxxLvYwLWEXFz//4qhR/wy8jstEh8CJNgCZGBAS3oNYL3WbwehU=
X-Received: by 2002:a05:6402:3490:b0:435:9802:96ac with SMTP id
 v16-20020a056402349000b00435980296acmr49691918edc.40.1657063852851; Tue, 05
 Jul 2022 16:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <CABg_PyKZFAtzhtk7bSKnvRt4PrFBGp++-HaE0aWQuAZkKO_Y_A@mail.gmail.com>
In-Reply-To: <CABg_PyKZFAtzhtk7bSKnvRt4PrFBGp++-HaE0aWQuAZkKO_Y_A@mail.gmail.com>
From: A Sudheer <asr7247@gmail.com>
Date: Wed, 6 Jul 2022 05:00:40 +0530
Message-ID: <CABg_Py+wqMWtVtBoDpM=XMUhwAFD3fq7pHXs_0X=hWdq4au7Gg@mail.gmail.com>
Subject: Re: xen domU access UART I2C
To: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000051c31905e3173e49"

--00000000000051c31905e3173e49
Content-Type: text/plain; charset="UTF-8"

Hi All,

< Posting my query again , added a few more details >

On Xen-4.16 with Ubuntu-22.04 Dom0 and Ubuntu-22.04 HVM DomU, i need to
access IO devices like UART and I2C.
I am able to access them in Dom0. Can someone let me know how to access
them in DomU. What are the cfg options to be provided ?

Thanks
Sudheer

On Tue, Jul 5, 2022 at 10:26 AM A Sudheer <asr7247@gmail.com> wrote:

> Hi All,
>
> On Xen with Ubuntu Dom0 and Ubuntu HVM DomU, i need to access IO devices
> like UART and I2C.
> I am able to access them in Dom0. Can someone let me know how to access
> them in DomU. What are the cfg options to be provided ?
>
> Thanks
> Sudheer
>

--00000000000051c31905e3173e49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,=C2=A0<div><br></div><div>&lt; Posting my query aga=
in ,=C2=A0added a few more details &gt;</div><div><br></div><div>On Xen-4.1=
6 with Ubuntu-22.04 Dom0 and Ubuntu-22.04 HVM DomU, i need to access=C2=A0I=
O devices like UART and I2C.</div><div>I am able to access them in Dom0. Ca=
n someone let me know how to access them in DomU. What are the cfg options =
to be provided ?</div><div><br></div><div>Thanks=C2=A0<br></div><font color=
=3D"#888888"><div>Sudheer</div></font></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 5, 2022 at 10:26 AM A Sud=
heer &lt;<a href=3D"mailto:asr7247@gmail.com">asr7247@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr">Hi All,=C2=A0<div><br></div><div>On Xen with Ubuntu Dom0 and Ubuntu HV=
M DomU, i need to access=C2=A0IO devices like UART and I2C.</div><div>I am =
able to access them in Dom0. Can someone let me know how to access them in =
DomU. What are the cfg options to be provided ?</div><div><br></div><div>Th=
anks=C2=A0</div><div>Sudheer</div></div>
</blockquote></div>

--00000000000051c31905e3173e49--

