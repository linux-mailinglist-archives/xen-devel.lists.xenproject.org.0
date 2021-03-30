Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574434F101
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 20:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103650.197699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRJ6s-0006y4-55; Tue, 30 Mar 2021 18:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103650.197699; Tue, 30 Mar 2021 18:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRJ6s-0006xf-1d; Tue, 30 Mar 2021 18:29:02 +0000
Received: by outflank-mailman (input) for mailman id 103650;
 Tue, 30 Mar 2021 18:28:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=STym=I4=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lRJ6p-0006xa-Mv
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 18:28:59 +0000
Received: from mail-qv1-xf32.google.com (unknown [2607:f8b0:4864:20::f32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf1fcd9c-9de4-4f6e-814b-cb76e67bc9fa;
 Tue, 30 Mar 2021 18:28:58 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id x27so8661459qvd.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Mar 2021 11:28:58 -0700 (PDT)
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
X-Inumbo-ID: bf1fcd9c-9de4-4f6e-814b-cb76e67bc9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=lGfHpDwA5adg4O1hCUW5AZ5ID+ShkkhzHGarXjuElwU=;
        b=dGo84S8bHxvj0OeaCD2okzWM3u9dhUpNXxN+XP8yGj//tn+IJjrRAgRRjUvoqrSHxi
         h/CU34psLfzRDLnPN+n1g6HdX13MKrZKS+lof6P6g+Jf6elwwYZYtryRgACfwafmQ1hw
         Hsr0GRH/f1k9zUOqFknTiNW89aBsUhOWGx6B25CsH7lbWlveSX0NnigXrdwYcm33So61
         exWYHNUnFjQyPwC1omGBSqMVn/dI/5NOr+pXDwesrJplfmK1ddR/vbe3gn2EzTmOawaH
         zatebMytGrUwqNi3NYaz73mpWQwRJj8qULhITvC4pMXmSxLF7yuWulZkhO4avafDNvSK
         g1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lGfHpDwA5adg4O1hCUW5AZ5ID+ShkkhzHGarXjuElwU=;
        b=fdY+ljPX5HMkNR97Hp867XD/3RjkCHvYTaP5gXmAse6Tq02bljR16lLT0S66zVNtaP
         ZlgHY9QOE3iORWW9AY4OuHLNkxEBTOTcLXbtKglVjWBDharTUgOtihOGaxWhY5LGCJFm
         ORE6F2DkLbCw3+QYBIE2LRfNIEjgNg7Bhe3kQgBmVbPtxHDhuTMjFaZoQsb403f6tJP8
         ZoZjlcZ7W2cJTtmGTJZXdPE1g1kqAghgT+j3xu/r59INE6SZM93UNzstYK2xnitJU5kv
         NUWVNwfytPBySSXcRxbdrLZFOiyOODL7fX0O3y1lxjQ50rKskiZbZ6PD6q/RrmZSN9YE
         33GQ==
X-Gm-Message-State: AOAM530Tuon7KtyHAGbKEW8iobXL8qPXItUUQEBUbtw7icXJ0C1PV0AJ
	Gt/sRWORCrGvzfLyqPSJDTPRrHgc37FH7QMVrndTRrBnUuyW8K9A
X-Google-Smtp-Source: ABdhPJxqoySOLWxKbvthlCvsjfDMQqJ27e0UnI78mcfZDJN2LS8noQ6wI/20QqcM8JsOVY+hRpmizPgGKpP8NtdhdRU=
X-Received: by 2002:a0c:9ad7:: with SMTP id k23mr31617571qvf.52.1617128938005;
 Tue, 30 Mar 2021 11:28:58 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 30 Mar 2021 11:28:49 -0700
Message-ID: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
Subject: multiboot2 and module2 boot issues via GRUB2
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000e7fd2405bec52bb0"

--000000000000e7fd2405bec52bb0
Content-Type: text/plain; charset="UTF-8"

Hi!

seems like I've run into an issue with multiboot2 and module2
commands that I can't quite explain. Since it may be something
super simply and silly -- I wanted to reach out here before I do
a GRUB/Xen/LK source deepdive.

So here's the deal: whenever I boot straight up Linux kernel
I can do the following sequence of commands:
   linux /kernel
   initrd foo.cpio.gz bar.cpio.gz
and have linux kernel effectively stack content of bar.cpio.gz
on top of foo.cpio.gz and present a unified initramfs that way.

I'm trying to replicate it with Xen, but:
     multiboot2 /boot/xen.gz
     module2 /kernel
     module2 foo.cpio.gz
     module2 bar.cpio.gz
only seems to be picking up foo.cpio.gz

Has anyone run into this issue before?

Thanks,
Roman.

--000000000000e7fd2405bec52bb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi!<br><div><br></div><div>seems like I&#=
39;ve run into an issue with multiboot2=C2=A0and module2</div><div>commands=
 that I can&#39;t quite explain. Since it may be something</div><div>super =
simply and silly -- I wanted to reach out here before I do</div><div>a GRUB=
/Xen/LK source deepdive.</div><div><br></div><div>So here&#39;s the deal: w=
henever I boot straight up Linux kernel</div><div>I can do the following se=
quence of commands:</div><div>=C2=A0 =C2=A0linux /kernel</div><div>=C2=A0 =
=C2=A0initrd foo.cpio.gz bar.cpio.gz</div><div>and have linux kernel effect=
ively stack content of bar.cpio.gz</div><div>on top of foo.cpio.gz and pres=
ent a unified initramfs that way.</div><div><br></div><div>I&#39;m trying t=
o replicate it with Xen, but:</div><div>=C2=A0 =C2=A0 =C2=A0multiboot2 /boo=
t/xen.gz<br></div><div>=C2=A0 =C2=A0 =C2=A0module2 /kernel</div><div>=C2=A0=
 =C2=A0 =C2=A0module2 foo.cpio.gz</div><div>=C2=A0 =C2=A0 =C2=A0module2 bar=
.cpio.gz</div><div>only seems to be picking up foo.cpio.gz</div><div><br></=
div><div>Has anyone run into this=C2=A0issue before?</div><div><br></div><d=
iv>Thanks,</div><div>Roman.</div></div></div>

--000000000000e7fd2405bec52bb0--

