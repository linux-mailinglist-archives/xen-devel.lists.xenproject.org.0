Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B63DDD95
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 18:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163144.298929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAajg-0007NA-8T; Mon, 02 Aug 2021 16:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163144.298929; Mon, 02 Aug 2021 16:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAajg-0007KY-4Q; Mon, 02 Aug 2021 16:24:16 +0000
Received: by outflank-mailman (input) for mailman id 163144;
 Mon, 02 Aug 2021 15:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zUNv=MZ=linuxfoundation.org=aweltz@srs-us1.protection.inumbo.net>)
 id 1mAa4S-0003SY-Vf
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 15:41:41 +0000
Received: from mail-il1-x130.google.com (unknown [2607:f8b0:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec724805-c672-4d03-872b-55afeb828942;
 Mon, 02 Aug 2021 15:41:39 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id z3so16785795ile.12
 for <xen-devel@lists.xenproject.org>; Mon, 02 Aug 2021 08:41:39 -0700 (PDT)
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
X-Inumbo-ID: ec724805-c672-4d03-872b-55afeb828942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ww/deEZF+DqN5rvnMvgOS/NUTuq/rb3jGzIu2MnG0Bs=;
        b=blNtv8ZhDrk5MI6Xe9se6qYwcaDqPuOIeeRjEAgJ94wKeFnkhepfwHNY7NluxB5r0h
         tUs9O2qRCyBTFLOuBjVhEQaTF2VANotFCuf9bVsp8wkyt//+3wZ3UPv7XmmLO3y6nh+A
         uy8MFe9kaj1J1FwACvbegMiHxuqYfqBeEG9qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ww/deEZF+DqN5rvnMvgOS/NUTuq/rb3jGzIu2MnG0Bs=;
        b=d/2Cmg3WzvgAGZdf+LkJ5BlI73vEaJDao9ciZmavnsZTXnMDVTVb+X581dxReQOdSs
         6kOcqrdI5bCNjLuhBbYgVRN3oq/Cl1/Zn1tFKekF777mZEKFP30CqgniPrEkY57WU/lb
         u8d8ecF1vDqwJVlafsIzfZQjsGWqm8AL92rv5FKU6qFr1bTq4+iEp2z/ZqR7pSmbxkfa
         a0IeokEiaEQgEKEwFJTdNF3qEazlVOgH30w5DZv1244M8Helebu/mXQphurSrOVBJOy5
         gHnD6xWtqNFiEEj/+NH6brUMUSsG8mAc2TKQr4PkFS6cVxCRvMeK23DzBkQkExTu18CD
         4lqw==
X-Gm-Message-State: AOAM533IZJYnOVnPJJVEHoNxZUhFLeldszKlaKf3WpZLDYLp0D+Rr52f
	/FoqcnEzGBQDyGMvEeY/BepYbM5RLEPxBkz4wQ7wUR2SOFA=
X-Google-Smtp-Source: ABdhPJw7zgRcxPboHBJ7WTCMCjazl7vJWjYtFMH5lYmfsrTlspxHSJr9sC8Xg7W4mQHHQ602YylmHzYCVEipvMpGdsM=
X-Received: by 2002:a05:6e02:50c:: with SMTP id d12mr1841756ils.256.1627918899424;
 Mon, 02 Aug 2021 08:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADT4064PXyoPQP980=YqPau_Gcfb0ouXdyxEr=JiteMhtBfkQg@mail.gmail.com>
In-Reply-To: <CADT4064PXyoPQP980=YqPau_Gcfb0ouXdyxEr=JiteMhtBfkQg@mail.gmail.com>
From: Ashley Weltz <aweltz@linuxfoundation.org>
Date: Mon, 2 Aug 2021 11:41:28 -0400
Message-ID: <CADT4066LZ2p6AdpTwQPAXn=ho0i+ZMvkf96xBzVfyrDNA8c87Q@mail.gmail.com>
Subject: [ANNOUNCE] Call for agenda items for August 3rd Community Call @ 1500 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b9476205c8956734"

--000000000000b9476205c8956734
Content-Type: text/plain; charset="UTF-8"

Hi all,

For those I have not yet met, I'm Ashley Weltz a Project Coordinator from
The Linux Foundation stepping in to support Xen. I joined last month's
community call, and I will be taking over for George while he is out.
Please let me know if you have any questions. I look forward to working
with you all!

*In our last meeting, we defined a new meeting time for our community call.
The first Tuesday of the month at 1500 UTC. *I have sent a calendar
invitation to you all. If you did not receive it, let me know.

The proposed agenda is in
https://cryptpad.fr/pad/#/2/pad/edit/qDdvquUrWN2viaL94sgjcrJ1/ and you can
edit to add items.  Alternatively, please feel free to email me directly
with agenda items.

Agenda items appreciated a few days before the call: please put your name
besides items if you edit the document.

We will plan to start the meeting 5 minutes past the hour.

* If you want to be CC'ed please add or remove yourself from the
sign-up-sheet at
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

Again, please let me know if you have any questions. See you on Tuesday!

Cheers,
Ashley
-- 
Ashley Weltz, Project Coordinator
The Linux Foundation
aweltz@linuxfoundation.org

--000000000000b9476205c8956734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Hi all,<br></div><div dir=3D"ltr"><br>For those I have not yet met, =
I&#39;m Ashley Weltz a Project Coordinator from The Linux Foundation steppi=
ng in to support Xen. I joined last month&#39;s community call, and I will =
be taking over for George while he is out. Please let me know if you have a=
ny questions. I look forward to working with you all!=C2=A0<br><br><b>In ou=
r last meeting, we defined a new meeting time for our community call. The f=
irst Tuesday of the month at 1500 UTC. </b>I have sent a calendar invitatio=
n=C2=A0to you all. If you did not receive it, let me know.=C2=A0<div><b><br=
></b>The proposed agenda is in=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/=
pad/edit/qDdvquUrWN2viaL94sgjcrJ1/" target=3D"_blank">https://cryptpad.fr/p=
ad/#/2/pad/edit/qDdvquUrWN2viaL94sgjcrJ1/</a> and you can edit to add items=
.=C2=A0 Alternatively, please feel free to email me directly with agenda it=
ems.=C2=A0<br><br>Agenda items appreciated a few days before the=C2=A0<span=
>call</span>: please put your name besides items if you edit the document.<=
br><br>We will plan to start the meeting 5 minutes past the hour.=C2=A0<br>=
<br>* If you want to be CC&#39;ed please add or remove yourself from the si=
gn-up-sheet at=C2=A0<a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzih=
PxxAOe6RFPz0sRCf+/" rel=3D"noreferrer" target=3D"_blank">https://cryptpad.f=
r/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a></div><div><br></div><div>A=
gain, please let me know if you have any questions. See you on Tuesday!</di=
v><div><br></div><div>Cheers,</div><div>Ashley</div></div></div>-- <br><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr">Ashley Weltz, Project Coordinator=C2=A0<div>The Linux Found=
ation</div><div><a href=3D"mailto:aweltz@linuxfoundation.org" target=3D"_bl=
ank">aweltz@linuxfoundation.org</a></div></div></div></div>

--000000000000b9476205c8956734--

