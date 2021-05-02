Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F640370AE7
	for <lists+xen-devel@lfdr.de>; Sun,  2 May 2021 11:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121059.228866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ld8Rn-0005Y3-8T; Sun, 02 May 2021 09:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121059.228866; Sun, 02 May 2021 09:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ld8Rn-0005Xe-4f; Sun, 02 May 2021 09:31:31 +0000
Received: by outflank-mailman (input) for mailman id 121059;
 Sun, 02 May 2021 07:15:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oy9B=J5=gmail.com=tmciolek@srs-us1.protection.inumbo.net>)
 id 1ld6KX-00011X-5U
 for xen-devel@lists.xenproject.org; Sun, 02 May 2021 07:15:53 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34a1d84c-2597-433e-ac79-42fc577a944b;
 Sun, 02 May 2021 07:15:47 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s25so3166718lji.0;
 Sun, 02 May 2021 00:15:46 -0700 (PDT)
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
X-Inumbo-ID: 34a1d84c-2597-433e-ac79-42fc577a944b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l8Xd1rI7INI4Zl20Bxxg5yWd6MCp6tK9E+DPZBYLVx8=;
        b=M4EA14G6ytSjlE06pJZIEvKyyfkAAcmJac8oS8Fc0vHiSFkxrwZ21aUeN8JeT8tTuI
         W1SwC5RhNkRsxhrUQZxvSMrpeThXE7TNZ5kfrHNMZ+kai7llJ4L2rCFFo6cH5gF/xseX
         a1Z6x/XG5Q4/znDea/eRNwwVfSZTe2xKHJF/vrPRnZXRev+O1EMLdA99CAUaMLg1BCGC
         metvEn30d2+2LkTF1n8SMRYqdRK5NlRjRW5QxcAu5TosxUdlF0Caafwktla0BcsVCrgP
         lWNGRk1aYqH7lmfbIBFbNBjqGmomJnv1XuXsVM3t5rv1rsToJmlo42mBwtUWy4SkAEYZ
         oG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l8Xd1rI7INI4Zl20Bxxg5yWd6MCp6tK9E+DPZBYLVx8=;
        b=t/6mquqdszYc4F3mQOY3YovMykTgphudLpdHq04trzi8eWg36NdH0LPDiYBuKnv6bo
         4hgE1YDpA2csW1Lcl7mFsNIHdfEkLCcco+iZuuIPVb2t6fr/2jPE/NHICqft+b7M1cFw
         94W4S7dWwmjlSrccTgudxIcbSDM4d4O9Z4t+eZ597s52HlboQJgD3LWqu5i//EdYEgbm
         kGFmPGEKmyXcqTpME/7NAOcM2xjI3ostQkxOODddIg9upNo+9SgyK94eiJrFPyeEUnc9
         wcnqT1KLD7kLcs9B2P3fA0PVPGhgqDO1QF5CJTJDfQL0ouX1C5IQpOtTI1UGACOz3BLo
         tYxA==
X-Gm-Message-State: AOAM531M/KE9VzINk1QstNHTnQweza3l0zsjk1AjMjPiphDIBCwF8loI
	nRzWy03j8TQ6KPNvfpoBRwXKqSzRvODvF3SCcQ==
X-Google-Smtp-Source: ABdhPJyuhEima/k4MbFlCz3r+O1TsoKsFw1udmdI9QcShcidHatnIHk/kvCvuu+ZvYA3MJ59Rb1g9JceByN+0QzmRaI=
X-Received: by 2002:a2e:83cb:: with SMTP id s11mr9201433ljh.462.1619939745849;
 Sun, 02 May 2021 00:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <314217522.1538685.1619859473008.ref@mail.yahoo.com> <314217522.1538685.1619859473008@mail.yahoo.com>
In-Reply-To: <314217522.1538685.1619859473008@mail.yahoo.com>
From: TMC <tmciolek@gmail.com>
Date: Sun, 2 May 2021 17:15:34 +1000
Message-ID: <CAA3FNtPpz=4dwymk3+YeB+ZCOYYo9TirFqdjrf+qgSL39mBWYw@mail.gmail.com>
Subject: Re: Xen and Microservices.
To: Jason Long <hack3rcon@yahoo.com>
Cc: Xen-users <xen-users@lists.xenproject.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000001be59505c1539d79"

--0000000000001be59505c1539d79
Content-Type: text/plain; charset="UTF-8"

Jason,
containers, like Docker and kubernetes are designed to let you
sandbox/isolate one application or one service... without having to also
host an operating system for each container.

 Hypervisors like XEN are designed for operating systems, not single
applications.

Hope this helps

Tomasz

On Sat, 1 May 2021 at 18:58, Jason Long <hack3rcon@yahoo.com> wrote:

> Hello,
> Why microservices use containers like Docker and not Hypervisors like Xen?
>
> Thanks.
>
>

-- 
--
GPG key fingerprint: 07DF B95B DB58 57B6 9656  682E 830A D092 288E F017
GPG public key available on pgp(dot)net key server

--0000000000001be59505c1539d79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Jason,</div><div>containers, like Docker and kubernet=
es are designed to let you sandbox/isolate one application or one service..=
. without having to also host an operating system for each container.<br></=
div><div><br></div><div>=C2=A0Hypervisors like XEN are designed for operati=
ng systems, not single applications.=C2=A0</div><div><br></div><div>Hope th=
is helps</div><div><br></div><div>Tomasz<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 1 May 2021 at 18:=
58, Jason Long &lt;<a href=3D"mailto:hack3rcon@yahoo.com">hack3rcon@yahoo.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello,<br>
Why microservices use containers like Docker and not Hypervisors like Xen?<=
br>
<br>
Thanks.<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>--<br>GPG key fingerprint: <span>07DF=
 B95B DB58 57B6 9656=C2=A0 682E 830A D092 288E F017</span><br>GPG public ke=
y available on pgp(dot)net key server</div></div></div>

--0000000000001be59505c1539d79--

