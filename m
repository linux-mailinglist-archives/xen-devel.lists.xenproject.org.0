Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0F3372A9D
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122332.230730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduhh-0000Cb-Fz; Tue, 04 May 2021 13:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122332.230730; Tue, 04 May 2021 13:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduhh-0000CA-Bm; Tue, 04 May 2021 13:03:09 +0000
Received: by outflank-mailman (input) for mailman id 122332;
 Tue, 04 May 2021 12:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5oy=J7=linuxfoundation.org=rromoff@srs-us1.protection.inumbo.net>)
 id 1ldudg-0007lc-CQ
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:59:00 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f45fbebd-a8b9-4eff-a2b2-ce2623eded6b;
 Tue, 04 May 2021 12:58:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id t11so11617408lfl.11
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:58:59 -0700 (PDT)
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
X-Inumbo-ID: f45fbebd-a8b9-4eff-a2b2-ce2623eded6b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=mbiIFB7WbyDEjQWTDse1ymM07k6kH/Kt8YZWaQjE/sE=;
        b=h0FYrxCYXICIJ/LpY1Gsc8SdUhZP7OBd+tGjMvwNTY4SvQdcbtb05ctyUD5pPXNbeO
         FcMC36bPrBim6e7ZviJxiBiALVf6bzvWi6cYemmoKeXsXhWrPLveo6YgQtIAr5Cylb8l
         4O9sOX8zRjifUeOe3T9vfEGR0VqQx6Y1CbMDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mbiIFB7WbyDEjQWTDse1ymM07k6kH/Kt8YZWaQjE/sE=;
        b=ov44lvLM2CFYqO9MZXZ3hC0eU1NP2QmipTEQA1twYTUkdivQ+zAIOnVBFHExnYDU8+
         zEtWan+CcztOQG1dMAZJNkEw4r/GUSp9bcxw4OnrqTSiKkLgk4DXSUhY2wlxxnxRs7Uz
         DdS+HlCTaBZZNSBfOM23ZTfWdQUA6tB5h1/Xrm4znd7cfS+0iFkrmQkMBPcQakuCWl4s
         FuAGbTiIrJwLR2Ti2KzQ5PhmgEmzlwYxDUjMVgSPwQ1L9k5fHA4hNhbiH+cIiAHNxvQ4
         5UneVR5BPTGetWj1mI/4amNNvfH6HizbX9rPKYlZboVM6RN0seoKdkjvf+wD62Sjb9fb
         u1SA==
X-Gm-Message-State: AOAM531VPfIiYuKtYvSH1h5iGPIC5HNQlXWOtjWIDF21Q5FbHVdOCHvw
	To2ocuLeI8KgPD99I5SueemFeKN+C/XPQJ4LF++XnucOZ5y5Ag==
X-Google-Smtp-Source: ABdhPJxnucCbyUv7pL6HcNOl3r9b/8k4AbpHvv0F2dVJSh/pUWyDzK86Hcw6x1rkqjeeUJyAi/dzW6SIhOckM3jHLao=
X-Received: by 2002:a05:6512:2287:: with SMTP id f7mr5004393lfu.475.1620133138060;
 Tue, 04 May 2021 05:58:58 -0700 (PDT)
MIME-Version: 1.0
From: Rachel Romoff <rromoff@linuxfoundation.org>
Date: Tue, 4 May 2021 07:58:45 -0500
Message-ID: <CA+1LEQuO5Z_N6VKo3TwrE8Ri6+L1V4ssa_-vxKjXKJ-6ycvi7w@mail.gmail.com>
Subject: Xen PR Alias
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000002ef2a405c180a40f"

--0000000000002ef2a405c180a40f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All-


For better collaboration with the Xen Project Community on content and PR
ideas, we are reviving the PR email alias.

The list should be used for:

   -

   New blog ideas
   -

   Volunteering for a developer profile (details below)
   -

   To discuss anything new or newsworthy that can be turned into content,
   or pitched to media related to Xen.
   -

   Flagging conferences or speaking opportunities.
   -

   Links to be tweeted or posted from Xen social media


This is a semi-private list in that embargoed news could be discussed.
When you agree to join this list, you agree to not share embargoed content
publicly.

To join this list, please email George Dunlap <george.dunlap@citrix.com> or
Rachel Romoff.

We will also share opportunities from time to time with this list and may
ask for feedback on certain topics or programs we are working on.

Open Opportunities

Use cases for Xen - Are you using Xen for something interesting? Let us
know!

Case Studies - Has your organization gotten measurable value out of its use
of Xen. Have you used Xen on a personal project and found interesting data?
Let us know!

Developer Profiles - Are you a Xen Project developer, or tech adjacent
professional? We want to profile the work you=E2=80=99ve done.

If you have any questions please let us know,
Rachel


--=20
Rachel Romoff
Pronouns: She/Her
(210) 241-8284
Twitter @rachelromoff

--0000000000002ef2a405c180a40f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-fc964c40-7fff-a593-f5=
a4-420745de9c6d"><p style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">Hi All-</span></p><p style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap"><br></span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">For better collaborati=
on with the Xen Project Community on content and PR ideas, we are reviving =
the PR email alias.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">T=
he list should be used for:</span></p><ul style=3D"margin-top:0px;margin-bo=
ttom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">New bl=
og ideas</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">Volunteering for a developer profile (details below)</span></p></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">To discuss anyt=
hing new or newsworthy that can be turned into content, or pitched to media=
 related to Xen.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Flagging conferences or speaking opportunities.</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">Links to be =
tweeted or posted from Xen social media</span></p></li></ul><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">This is a semi-private list in that embargoed news c=
ould be discussed.=C2=A0 When you agree to join this list, you agree to not=
 share embargoed content publicly.</span></p><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">To join this list, please email </span><a href=3D"mailto:george.dun=
lap@citrix.com" style=3D"text-decoration-line:none"><span style=3D"font-fam=
ily:Arial;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;text-decoration-line:underline;vertical-align:baseli=
ne;white-space:pre-wrap">George Dunlap</span></a><span style=3D"font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap"> or Rachel Romoff.=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">We will also share opportunities from time to time with this list and=
 may ask for feedback on certain topics or programs we are working on.=C2=
=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-weight:700;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Open Op=
portunities</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">Use cases for X=
en - Are you using Xen for something interesting? Let us know!</span></p><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">Case Studies - Has your organization go=
tten measurable value out of its use of Xen. Have you used Xen on a persona=
l project and found interesting data? Let us know!</span></p><br><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">Developer Profiles - Are you a Xen Project develope=
r, or tech adjacent professional? We want to profile the work you=E2=80=99v=
e done.=C2=A0</span></p><br>If you have any questions please let us know,</=
span><div><span>Rachel<br><br></span><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Rachel Romoff<div>Pronouns: She/Her<br><div><span style=3D"background-c=
olor:rgb(255,255,255)">(210) 241-8284</span></div><div><span style=3D"backg=
round-color:rgb(255,255,255)">Twitter @rachelromoff</span></div><div><br></=
div><div><br></div></div></div></div></div></div>

--0000000000002ef2a405c180a40f--

