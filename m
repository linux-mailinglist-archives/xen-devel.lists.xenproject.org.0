Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF1A360EF5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 17:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111355.212993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3tl-0007Ih-5K; Thu, 15 Apr 2021 15:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111355.212993; Thu, 15 Apr 2021 15:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3tl-0007IL-2B; Thu, 15 Apr 2021 15:27:17 +0000
Received: by outflank-mailman (input) for mailman id 111355;
 Thu, 15 Apr 2021 15:27:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGOb=JM=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1lX3ti-0007IG-S2
 for xen-devel@lists.xen.org; Thu, 15 Apr 2021 15:27:14 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be441f65-7826-4946-8fc6-0c5d6491afaa;
 Thu, 15 Apr 2021 15:27:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h4so14680065wrt.12
 for <xen-devel@lists.xen.org>; Thu, 15 Apr 2021 08:27:13 -0700 (PDT)
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
X-Inumbo-ID: be441f65-7826-4946-8fc6-0c5d6491afaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2i7ATkMG7IFwB9WeGIbn7By6DeWuN11jgSSqiHd955k=;
        b=nhqECUeIjHxCoVf+FjzFiv75yMIo2Ew6mMBhXMdmZfu3kwzr940PTzgc7qdslOduZ8
         zlp4ov5XnsbTpPhikaTINZ/AJftYk8hG54J8rwZhwO0DEIgYRbPzgHS/h4xBrTdasCMJ
         KZjSbQ8nAgnJTtArPpEvekBEmboB4o50bxjD2jwHSUe6bDbafp19R1Dd3j3G3I6kpQCQ
         CACdyhXE2HTSvBc3HekX3SdwnZkt04K1S9KgusnX9G6MzekSVjZRvtggFLW3IckNvcYE
         gFev1EPyKdiVrOicOGdJhxFvLKpHwia5ofVw9O/2Ivv3N9DriRGn9C6QPhPpudT+3m5z
         +OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2i7ATkMG7IFwB9WeGIbn7By6DeWuN11jgSSqiHd955k=;
        b=c0+2/TGl2cPduY/OKBNZekYgvVm2fs+uLHiN2Cvv6R9BUND9hcuLDTUCLpnzO3MfAq
         rrM4Lgxc9hODe6uLGdlOsBOso56JFa1TQvdETBb9ki1QeYrdXKERfmYM6O9TjsDCeh/P
         J9HqdILokObAmIwqw8x+lU33gMh5OKrYuU1UfWyGDvsrJBzjQQ+h7PznJgG/fKZVhWXn
         E/1UZbJeUOD1IDMNjWdvx1sPsxbP1FZoRLc8hPPjJiedl/20ChPc5ixG2PAUv86aaQJG
         HQGguA/6rcFHrN5NHwgpsEno+DaweD6XaYUJqhUQRaG+qQfr87anUJxa0riemaECBdsF
         jvaw==
X-Gm-Message-State: AOAM533bNk8ymfI6/LbLytXhp/ag1Bf3RICPFvw36xoOokWVpf9LYNLl
	CsZmp7wfD4YJ/zmKQFibxCvLOXcRA3/r13zKogo=
X-Google-Smtp-Source: ABdhPJxpEmHpgA6Og6ZoYis5brH0ytDZPhaPB8iUUmERHYtn+Ruyyn6nYBnFOm6QtHTfCBpN0d1nHSEd2JxbowLUAxE=
X-Received: by 2002:a5d:4851:: with SMTP id n17mr4167550wrs.215.1618500432785;
 Thu, 15 Apr 2021 08:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQRGoD4yEEhiQk8LkKuOU_F2As3BsichHNY_ijoiVWwd3JZPw@mail.gmail.com>
 <e8c69e6e-e600-7f78-fb66-eddec17d618a@suse.com>
In-Reply-To: <e8c69e6e-e600-7f78-fb66-eddec17d618a@suse.com>
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Thu, 15 Apr 2021 16:26:36 +0100
Message-ID: <CAAQRGoAyxTCOGTnoapqnRG__xmpoCM+2RjJEmeB2CnG2-WX3JQ@mail.gmail.com>
Subject: Re: Failed to enable debug messages in xen 4.13
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000005d73b005c0047f5f"

--0000000000005d73b005c0047f5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, @Jan and  @Andrew


`make -C xen menuconfig` helped a lot ....
And indeed there a typo in the grub line

It's working now!

Thanks for helping with this question!




Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *




On Thu, Apr 15, 2021 at 3:01 PM Jan Beulich <jbeulich@suse.com> wrote:

> On 15.04.2021 15:55, Charles Gon=C3=A7alves wrote:
> > I've enabled the log_lvl=3Dall guest_loglvl=3Dall,
>
> The first one is mis-spelled and needs to be "loglvl=3D".
>
> > tried the xl debug-key +,
>
> If this didn't help, did you perhaps not do a debug build of Xen?
> Debug messages get completely compiled out of release builds.
>
> > configured the build with
> > ./configure --enable-debug
>
> This, in any event, has an effect on the tool stack build only.
> The hypervisor build gets configured via kconfig, with the settings
> tracked in xen/.config.
>
> Jan
>

--0000000000005d73b005c0047f5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, @Jan and=C2=A0

@Andrew=20

<div><br></div><div><br></div><div>`make -C xen menuconfig` helped a lot ..=
..</div><div>And indeed there a typo in the grub line</div><div><br></div><=
div>It&#39;s working now!</div><div><br></div><div>Thanks for helping with =
this question!</div><div><br></div><div><br></div><div><br clear=3D"all"><d=
iv><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><br></div><div>Atenciosamente,</div><b>Charles =
Ferreira Gon=C3=A7alves </b><br><font color=3D"#666666"><br></font><font co=
lor=3D"#666666" size=3D"1"><br></font></div></div></div><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, A=
pr 15, 2021 at 3:01 PM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com"=
>jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 15.04.2021 15:55, Charles Gon=C3=A7alves wrote:<br>
&gt; I&#39;ve enabled the log_lvl=3Dall guest_loglvl=3Dall,<br>
<br>
The first one is mis-spelled and needs to be &quot;loglvl=3D&quot;.<br>
<br>
&gt; tried the xl debug-key +,<br>
<br>
If this didn&#39;t help, did you perhaps not do a debug build of Xen?<br>
Debug messages get completely compiled out of release builds.<br>
<br>
&gt; configured the build with<br>
&gt; ./configure --enable-debug<br>
<br>
This, in any event, has an effect on the tool stack build only.<br>
The hypervisor build gets configured via kconfig, with the settings<br>
tracked in xen/.config.<br>
<br>
Jan<br>
</blockquote></div>

--0000000000005d73b005c0047f5f--

