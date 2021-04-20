Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BB9365CF5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 18:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113910.217025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYt0Q-0006dn-1T; Tue, 20 Apr 2021 16:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113910.217025; Tue, 20 Apr 2021 16:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYt0P-0006dO-UV; Tue, 20 Apr 2021 16:13:41 +0000
Received: by outflank-mailman (input) for mailman id 113910;
 Tue, 20 Apr 2021 16:13:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hNLD=JR=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1lYt0O-0006dI-2G
 for xen-devel@lists.xen.org; Tue, 20 Apr 2021 16:13:40 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f48184cf-5470-4918-b2a3-86deb80332e1;
 Tue, 20 Apr 2021 16:13:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m9so25483445wrx.3
 for <xen-devel@lists.xen.org>; Tue, 20 Apr 2021 09:13:38 -0700 (PDT)
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
X-Inumbo-ID: f48184cf-5470-4918-b2a3-86deb80332e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=AT2LvXiNgC6erraewrmevNXfWxBw7AQ9jOXXiCfFIm8=;
        b=ZgAu6ZIcqVyyRzDlnpVTZt/LlwFXhi8V8ppqDSmBoNIvy8pZ4+Bi46z1UNsS5/gYU3
         BxDA/K+FwQSakYTwTHgkqW/gTRHjGOeaiRJqC+1MFt6TpHHB0FmSFx2n9mJkLp9a/ap5
         Mt7V57Scv4sL39LD9NKRg64qOPvga5m/P5SZ+SL4Zy+8DTrd7CwxrBT0AY4nHViJwVXq
         AWgMZGmGXme29+UbUQE1t7XCGSuO853v0UTwrwm4f7GIOvBzhs3c62+n0nXyu9O0VPFd
         O/UyoilbE4gg6y+phyV5BRod4Z+oZbnJayss3Z3rYs2zI3W3AJgdmLviIcVDfREGTwgS
         +QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AT2LvXiNgC6erraewrmevNXfWxBw7AQ9jOXXiCfFIm8=;
        b=sBWeJs9w8oQXAYBFtybX5iYEH+UXVyHMPW7AyH/8RnQx30Ir2gSzsrHRdYa0IkFDVu
         3mAZnk7tDtWsU4hXN44JrzzVPwzBhE8mKjTKTqTaBheDhvZjo/a2b1TC3fjdFT0cjBRD
         h4YWqkVG2cFwhFBsI3ju3OF5KUZ9u/V8QHbDN9sw4kwB8XFgDBgzd5y/zGYkdr/JgkGr
         XFynPg5lxBqhOgy/3NJwt5CCyXEhmJZvOUe+T+PVjW6wdY5d1X33L7kKAa/Zvj6pMSYN
         /Mz7NlydXPoVAqwzc1s5uTyV/5t7LjYGpk8k0YrWcAHzMFK5nbHvdKqRk9Q6wf2P2ZoE
         BnPQ==
X-Gm-Message-State: AOAM530aUjiHxnuUun2x2Mt+nHogHsyNwgiUMvHpjKqQGyCN9tUhg7ek
	0+iuFmIZjiOz3dD1cDfJQUkS2IEm9LyN16lRmMPv0SO00t9FQw==
X-Google-Smtp-Source: ABdhPJzDzchw62DsGEstWKarEOdEUNuBUhO7DMhJsh7oVKBKgM9Y3uphOJnxpsifUh66O7jul6nEabL/dHM647WA7Zs=
X-Received: by 2002:a5d:4851:: with SMTP id n17mr21476783wrs.215.1618935217668;
 Tue, 20 Apr 2021 09:13:37 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Tue, 20 Apr 2021 17:13:01 +0100
Message-ID: <CAAQRGoC7P0yg-JoH4dpxTj13=D_6F9e2kjXuG5WWdqAF8k8KxA@mail.gmail.com>
Subject: Writing to arbritary cannonical addresses
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000009046dd05c069ba1b"

--0000000000009046dd05c069ba1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guys,

I'm trying to reproduce old exploit behaviors in a simplistic way:  create
an hypercall to write a buffer to a specific MFN.

At first, I thought that updating an l1 page in a valid VA in guest kernel
space would do the trick.
But for addresses outside the  Guest-defined use (0x0000000000000000 -
0x00007fffffffffff ) is a no go!
I get a page fault with  'reserved bit in page table' warning message.

Now I'm trying to write to the address inside the hypervisor code, but not
sure how to do it.

Any comments or tips on this?


Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *

--0000000000009046dd05c069ba1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Guys,<div><br></div><div>I&#39;m trying to reproduce=
 old exploit behaviors in a simplistic way:=C2=A0 create an hypercall to wr=
ite a buffer to a specific MFN.=C2=A0</div><div><br></div><div>At first, I =
thought that updating an l1 page in a valid VA in guest kernel space would =
do=C2=A0the trick.=C2=A0</div><div>But for addresses outside the=C2=A0 Gues=
t-defined use (0x0000000000000000 - 0x00007fffffffffff ) is a no=C2=A0go!=
=C2=A0</div><div>I get a page fault with=C2=A0 &#39;reserved bit in page ta=
ble&#39; warning message.</div><div><br></div><div>Now I&#39;m trying to wr=
ite to the address inside the hypervisor code, but not sure how to do it.=
=C2=A0=C2=A0</div><div><br></div><div>Any comments or tips on this?</div><d=
iv><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div>Atenciosamen=
te,</div><b>Charles Ferreira Gon=C3=A7alves </b><br><font color=3D"#666666"=
><br></font><font color=3D"#666666" size=3D"1"><br></font></div></div></div=
></div></div>

--0000000000009046dd05c069ba1b--

