Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBE3A405B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 12:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140345.259343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrebh-0004MY-So; Fri, 11 Jun 2021 10:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140345.259343; Fri, 11 Jun 2021 10:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrebh-0004K5-Ov; Fri, 11 Jun 2021 10:41:45 +0000
Received: by outflank-mailman (input) for mailman id 140345;
 Fri, 11 Jun 2021 10:41:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBs1=LF=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1lrebg-0004Jz-Bq
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 10:41:44 +0000
Received: from mail-oo1-xc2f.google.com (unknown [2607:f8b0:4864:20::c2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4aea13a4-3130-4dc0-8790-2cb94719df8f;
 Fri, 11 Jun 2021 10:41:43 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 o5-20020a4a2c050000b0290245d6c7b555so595989ooo.11
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 03:41:43 -0700 (PDT)
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
X-Inumbo-ID: 4aea13a4-3130-4dc0-8790-2cb94719df8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzmI3mcjI9bUqS7jOZe2FaB9jsbtLcrJ9WxglaseTWk=;
        b=NJCDqOtUSiKC9vHEGGAOmo2nBCb8xe3OL4alTUH6l0IgYKHJq8007qP5L6PP4fjHXN
         eAfjz3EgRXIzRScTtwAjUpkGs6N4tDoOFbCk4TBjrL0WAm+ooeNDyO6R9NXyARTH2Esj
         7PVG2wpHi0JV/b64Um4sxtFNROymjgbcNlk8uZmUfVMlg3mwfQmMpkxLmRm5bqANyuOS
         1QF/AEimMIzSNJsb3KCGUZqlVafWkxY6jDb0NsV3lxNWRfQYgYQ99h/rcHvLgUbVkb+n
         9oMnut0KgtyQ5exZisrICJhHgxilJnJS9Rb06/eSENSDz1E9EU19rGx334MHBgK/bi5I
         4KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzmI3mcjI9bUqS7jOZe2FaB9jsbtLcrJ9WxglaseTWk=;
        b=gV+qLQB+amDv63eyzmTcUdobp5m29BwLNAYK8pz6k8ZmQCsVBhpmSe4rVUSaP/waBx
         6hqf9I+2X7O0iZCjkyKkiHN8Lqn81C9ck2w9hE+QjiVkrP8N+2wI/vuFGLzhS9EKHBh/
         KJXhs3n6KB6/wP+pDV3O8QCizUF6zl3+glYPFocF4bbWzSw6fwqKR/6KUZ04FLq0qTNt
         m+aq73Jg9g4h1Q5MBVyNEgkwo+jYFFVP1l0l25n4bcmMQmBMB59ZLwWBPDuwFYl2RdgL
         CgIfR/eJIbmwzRQuS3UdTK7/0ifbnim6Czr3SIY4AMYAPHU48NK0nwB4UkaXqQe9jz2q
         YPeA==
X-Gm-Message-State: AOAM533QV9l7hd8mHRbNee1C73LosqLcMwiJTRchRzBc5zv0wZqDu//P
	L4Iwu+WslsihKntR+DqPBxhpa4/M2p3ReJ1d2hM=
X-Google-Smtp-Source: ABdhPJzHaE/hJ3Ygoh19x0vqZOz7BX5zgJi5Ecf1EryaUuWy8ZhEPPlEb07Xp9lVtjnymSgrDG/1sLz2PpYetvX+qns=
X-Received: by 2002:a4a:625a:: with SMTP id y26mr2511543oog.38.1623408102677;
 Fri, 11 Jun 2021 03:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <e4946a69-bc1a-d54c-dadf-e71feecd99ab@suse.com>
 <CAJ=z9a07v-cnMhK=cVjjdN3-f4t8qGc3oQz17zRdLxOauBp=qA@mail.gmail.com> <af2f231a-5130-8e5f-b024-04f74e57d1ad@suse.com>
In-Reply-To: <af2f231a-5130-8e5f-b024-04f74e57d1ad@suse.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Fri, 11 Jun 2021 11:41:30 +0100
Message-ID: <CAF3u54BrJ9MViXnBUMykukaOrpO=SyEV0KwE8Pbs8=tQiLb7wg@mail.gmail.com>
Subject: Re: [PATCH] Arm32: MSR to SPSR needs qualification
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000049206905c47b2798"

--00000000000049206905c47b2798
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Jun 2021, 11:16 Jan Beulich, <jbeulich@suse.com> wrote:

> On 11.06.2021 10:00, Julien Grall wrote:
> > On Fri, 11 Jun 2021, 08:55 Jan Beulich, <jbeulich@suse.com> wrote:
> >
> >> The Arm ARM's description of MSR doesn't even allow for plain "SPSR"
> >> here, and while gas accepts this, it takes it to mean SPSR_cf. Yet
> >> surely all of SPSR wants updating on this path, not just the lowest and
> >> highest 8 bits.
> >>
> >
> > Can you provide a reference to the Arm Arm? This would help to navigate
> > through the 8000 pages.
>
> Referencing the instruction page would be enough, I thought (as
> even I, not being an Arm person, have no difficulty locating it).
> If it isn't, how is a canonical doc ref supposed to look like on
> Arm? On x86, we avoid recording document versions, section
> numbers, or even page numbers in code comments or commit messages
> (which isn't to say we have none of these, but we try to avoid
> new ones to appear), as these tend to change with every new
> version of the doc. Therefore, to me, the offending commit's "ARM
> DDI 0487D.b page G8-5993" doesn't look like something I wanted to
> clone from. But if you tell me otherwise, then well - so be it.


The Arm website provides a link for nearly every revision on the specs. As
the wording can change between version, it is useful to know which spec the
understanding is based from.

 Note that for Arm32 we should quote the Armv7 spec and not the Armv8 one
because we only follow the former (there are a few small differences).



> Jan
>
>
>

--00000000000049206905c47b2798
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 11 Jun 2021, 11:16 Jan Beulich, &lt;<a href=3D=
"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On 11.06.2021 10:00, Julien Grall wrote:<br>
&gt; On Fri, 11 Jun 2021, 08:55 Jan Beulich, &lt;<a href=3D"mailto:jbeulich=
@suse.com" target=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt; w=
rote:<br>
&gt; <br>
&gt;&gt; The Arm ARM&#39;s description of MSR doesn&#39;t even allow for pl=
ain &quot;SPSR&quot;<br>
&gt;&gt; here, and while gas accepts this, it takes it to mean SPSR_cf. Yet=
<br>
&gt;&gt; surely all of SPSR wants updating on this path, not just the lowes=
t and<br>
&gt;&gt; highest 8 bits.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Can you provide a reference to the Arm Arm? This would help to navigat=
e<br>
&gt; through the 8000 pages.<br>
<br>
Referencing the instruction page would be enough, I thought (as<br>
even I, not being an Arm person, have no difficulty locating it).<br>
If it isn&#39;t, how is a canonical doc ref supposed to look like on<br>
Arm? On x86, we avoid recording document versions, section<br>
numbers, or even page numbers in code comments or commit messages<br>
(which isn&#39;t to say we have none of these, but we try to avoid<br>
new ones to appear), as these tend to change with every new<br>
version of the doc. Therefore, to me, the offending commit&#39;s &quot;ARM<=
br>
DDI 0487D.b page G8-5993&quot; doesn&#39;t look like something I wanted to<=
br>
clone from. But if you tell me otherwise, then well - so be it.</blockquote=
></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">The Arm website provides a link for nearly every revision on the =
specs. As the wording can change between version, it is useful to know whic=
h spec the understanding is based from.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">=C2=A0Note that for Arm32 we should quote the Armv7 spec an=
d not the Armv8 one because we only follow the former (there are a few smal=
l differences).</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
Jan<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000049206905c47b2798--

