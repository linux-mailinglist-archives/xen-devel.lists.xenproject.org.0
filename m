Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8166D50E0D7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 14:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312883.530281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyDK-0002er-Mk; Mon, 25 Apr 2022 12:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312883.530281; Mon, 25 Apr 2022 12:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyDK-0002cV-Hv; Mon, 25 Apr 2022 12:53:14 +0000
Received: by outflank-mailman (input) for mailman id 312883;
 Mon, 25 Apr 2022 12:53:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mW0y=VD=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1niyDI-0002cP-7y
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 12:53:12 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b74d29-c496-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 14:53:10 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ec42eae76bso146653967b3.10
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 05:53:10 -0700 (PDT)
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
X-Inumbo-ID: a8b74d29-c496-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oeP4s0HdwdBZvzXoc/7vlPduwrbLkGhkuEwYixC6uho=;
        b=TPK/lE04EMJgYRAiUSz0pRYespb7rtwD9a4Dvwb5Qo2FdPi9tmNNXzSJxuAgiFY20/
         DKP6Rn2Ax1TfLwr7LPjT7DlDagfR7tTVLfV0pWc5/t7MJaWJqKLJnQqWashJ3D4y+N3d
         XBA0lGVjOLqePQuvdcDb13ywU6+q5ud48Fmdtg15dCrUCVAEzCrEIxiYKt4ry4q6SG78
         qMJtPWRHTR3BoNj3YgW24QZbN3u7Sj+ji8F5owQEOEFM8TsMbp4mp5ccBkcLOJKPgB9U
         gWx+nELlpfeI2cyg78v3Co8OPGtUZNoaNanzdspI3O8hMXh91tqEuRu/91sDmwRnbLcC
         okYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oeP4s0HdwdBZvzXoc/7vlPduwrbLkGhkuEwYixC6uho=;
        b=731PMHpM20HQhRbqIF6YykvGNfa1lPxOsD+2pUsrNts8KWsuF500qx8Z19JKMFKlns
         He4PbdDzGQfBuLt3RM2lQ87f7xlekN+EOz7uzXp9aWS8xaQVdntDUMNKOBKSt9WX9jL0
         gYZGzRliroXqfrVWOEcrn6zuXqgHL5vRe3L+NPB8FnflVnyWgKsVl62SgtGzYVSzOiN+
         CRTxSwq5SmldIqRGzOf2VN4BZ68CJyqdP0phZCWg4KTvQdFcDxxqnZ1jiGg4j8YP9qOZ
         ooUiSVuEJ9EEKApxRdtkkqMBn3vcCAT10HK7qD7pcDylAYXey/zWaPhd0iyPPHcrS+4l
         UO7Q==
X-Gm-Message-State: AOAM533S4Z/o4finnxTInumuCYp8fxzmMo5kq2iNc88I3eNzASmtfyhU
	bRAo813wu3ql5v0UrdxaE3LulfAhKXnDimBZQ9Q=
X-Google-Smtp-Source: ABdhPJwTn9/UmNqF+dCHTr5FEj+nEslCC4Tn3McubAcShYsmLWA3d7yMpBLZ0nDFqslDLWFJGgltzPkdPcQJ68ihEKU=
X-Received: by 2002:a81:7b05:0:b0:2f1:7f75:1d1e with SMTP id
 w5-20020a817b05000000b002f17f751d1emr15771847ywc.520.1650891189229; Mon, 25
 Apr 2022 05:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <CABfawhki8YVxycv_zdDqDuOYvBdobdskXnjjdjiF7UND3784cg@mail.gmail.com>
 <310ab91a-60bd-f4fa-aeee-28aab43aabbe@suse.com> <CABfawhmzz5OwYr93EO7UAnb1X+vBoi3u=YVW6HMV5KpH_iEGeg@mail.gmail.com>
In-Reply-To: <CABfawhmzz5OwYr93EO7UAnb1X+vBoi3u=YVW6HMV5KpH_iEGeg@mail.gmail.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 25 Apr 2022 13:52:58 +0100
Message-ID: <CAFLBxZaT1jRo8_KBKOFMdwvM0q=LAoUSxuHNkgOrFA00a9vVdA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@intel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000e59c3605dd7a0ed5"

--000000000000e59c3605dd7a0ed5
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 25, 2022 at 12:29 PM Tamas K Lengyel <tamas@tklengyel.com>
wrote:

>
>
> On Mon, Apr 25, 2022, 3:49 AM Jan Beulich <jbeulich@suse.com> wrote:
>
>> On 22.04.2022 16:07, Tamas K Lengyel wrote:
>> > On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel <
>> tamas.lengyel@intel.com> wrote:
>> >>
>> >> Allow specify distinct parts of the fork VM to be reset. This is
>> useful when a
>> >> fuzzing operation involves mapping in only a handful of pages that are
>> known
>> >> ahead of time. Throwing these pages away just to be re-copied
>> immediately is
>> >> expensive, thus allowing to specify partial resets can speed things up.
>> >>
>> >> Also allow resetting to be initiated from vm_event responses as an
>> >> optimization.
>> >>
>> >> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>> >
>> > Patch ping. Could I get a Reviewed-by if there are no objections?
>>
>> Hmm, this is a little difficult. I'd be willing to give an ack, but that's
>> meaningless for most of the code here. Besides a stylistic issue I did
>> point out which I'm not happy with, I'm afraid I'm not good enough at
>> mem-sharing and forking. Therefore I wouldn't want to offer an R-b.
>> Considering the VM event interaction, maybe the BitDefender guys could
>> take a stab?
>>
>> Of course you'd then still need a tool stack side ack.
>>
>
> So my take is that noone cares about mem_sharing, which is fine, its an
> obscure experiment subsystem.
>

My take is slightly different; it's more that the project is large enough
that it's difficult to se where the needs are.  If Roger or Andy or I or
Wei or anyone see a thread with you & Jan going back and forth, it's
natural for us to assume that you & Jan have it in hand, and there's no
need for us to read through the thread.  Jan dislikes asking specific
people for a review, but many of the rest of us have sort of gotten in the
habit of doing so, as a way to solve the "visibility" issue.  The only
other way I can think of to solve the problem is to have a robot try to
assign tasks to people -- a method that has received skepticism, and would
also require a non-negligible amount of tooling to be written.


> But the only path I see as maintainer to get anything in-tree is if I hand
> the task of writing the patch to a coworker who then sends it in so that I
> can ack it. This is clearly disfunctional and is to the detriment of the
> project overall. We need to get some rules in place to avoid situations
> like this that clearly lead to no development and no improvement and a huge
> incentive to forgot about upstreaming. With no substantive objections but
> no acks a maintainer should be able to get changes in-tree. That's part of
> what I would consider maintaining a codebase to be!
>

Another possibility would be to ask your colleague actually do a
Reviewed-by.  The first time or two they might not be "of suitable stature
in the community", but I don't think it should take long to establish such
a stature, if they were doing the review in earnest.

I do agree that it seems like in this situation, the bar seems too high for
you to get your own code checked in.  I'd be open to the argument that we
should change the text of the check-in policy in MAINTAINERS to allow
maintainer modifications with only an Acked-by.


> Anyway, to be realistic I don't expect that option to materialize so I'm
> very close to just stop all contributions to the project. It's dishartening.
>


I can understand why you'd be disheartened if you thought you just couldn't
get any code checked in even as maintainer.  However, there are lots of
escalation paths open to you: you could email the community manager (me);
you could make a wider appeal on IRC for reviewers; you could raise the
general issue at the community call; you could send a patch proposing
changes to the check-in procedure described in MAINTAINERS.

 -George

>

--000000000000e59c3605dd7a0ed5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 25, 2022 at 12:29 PM Tama=
s K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">tamas@tklengyel.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Apr 25, 2022, 3:49 AM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 22.04.2=
022 16:07, Tamas K Lengyel wrote:<br>
&gt; On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel &lt;<a href=3D"mailto:=
tamas.lengyel@intel.com" rel=3D"noreferrer" target=3D"_blank">tamas.lengyel=
@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Allow specify distinct parts of the fork VM to be reset. This is u=
seful when a<br>
&gt;&gt; fuzzing operation involves mapping in only a handful of pages that=
 are known<br>
&gt;&gt; ahead of time. Throwing these pages away just to be re-copied imme=
diately is<br>
&gt;&gt; expensive, thus allowing to specify partial resets can speed thing=
s up.<br>
&gt;&gt;<br>
&gt;&gt; Also allow resetting to be initiated from vm_event responses as an=
<br>
&gt;&gt; optimization.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas.lengyel=
@intel.com" rel=3D"noreferrer" target=3D"_blank">tamas.lengyel@intel.com</a=
>&gt;<br>
&gt; <br>
&gt; Patch ping. Could I get a Reviewed-by if there are no objections?<br>
<br>
Hmm, this is a little difficult. I&#39;d be willing to give an ack, but tha=
t&#39;s<br>
meaningless for most of the code here. Besides a stylistic issue I did<br>
point out which I&#39;m not happy with, I&#39;m afraid I&#39;m not good eno=
ugh at<br>
mem-sharing and forking. Therefore I wouldn&#39;t want to offer an R-b.<br>
Considering the VM event interaction, maybe the BitDefender guys could<br>
take a stab?<br>
<br>
Of course you&#39;d then still need a tool stack side ack.<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">So my take is tha=
t noone cares about mem_sharing, which is fine, its an obscure experiment s=
ubsystem. </div></div></blockquote><div><br></div><div>My take is slightly =
different; it&#39;s more that the project is large=20
enough that it&#39;s difficult to se where the needs are.=C2=A0 If Roger or=
 Andy=20
or I or Wei or anyone see a thread with you &amp; Jan going back and=20
forth, it&#39;s natural for us to assume that you &amp; Jan have it in hand=
,
 and there&#39;s no need for us to read through the thread.=C2=A0 Jan disli=
kes=20
asking specific people for a review, but many of the rest of us have=20
sort of gotten in the habit of doing so, as a way to solve the=20
&quot;visibility&quot; issue.=C2=A0 The only other way I can think of to so=
lve the=20
problem is to have a robot try to assign tasks to people -- a method=20
that has received skepticism, and would also require a non-negligible amoun=
t of tooling to be written. </div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">But the only =
path I see as maintainer to get anything in-tree is if I hand the task of w=
riting the patch to a coworker who then sends it in so that I can ack it. T=
his is clearly disfunctional and is to the detriment of the project overall=
. We need to get some rules in place to avoid situations like this that cle=
arly lead to no development and no improvement and a huge incentive to forg=
ot about upstreaming. With no substantive objections but no acks a maintain=
er should be able to get changes in-tree. That&#39;s part of what I would c=
onsider maintaining a codebase to be!</div></div></blockquote><div><br></di=
v><div><div class=3D"gmail_quote">Another possibility would be to ask your=
=20
colleague actually do a Reviewed-by.=C2=A0 The first time or two they might=
=20
not be &quot;of suitable stature in the community&quot;, but I don&#39;t th=
ink it=20
should take long to establish such a stature, if they were doing the=20
review in earnest.<br></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">I
 do agree that it seems like in this situation, the bar seems too high=20
for you to get your own code checked in.=C2=A0 I&#39;d be open to the argum=
ent=20
that we should change the text of the check-in policy in MAINTAINERS to=20
allow maintainer modifications with only an Acked-by.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto=
"><div dir=3D"auto">Anyway, to be realistic I don&#39;t expect that option =
to materialize so I&#39;m very close to just stop all contributions to the =
project. It&#39;s dishartening.</div></div></blockquote><div><br></div><br>=
<div class=3D"gmail_quote">I can understand why you&#39;d be disheartened i=
f=20
you thought you just couldn&#39;t get any code checked in even as=20
maintainer.=C2=A0 However, there are lots of escalation paths open to you:=
=20
you could email the community manager (me); you could make a wider=20
appeal on IRC for reviewers; you could raise the general issue at the=20
community call; you could send a patch proposing changes to the check-in
 procedure described in MAINTAINERS.</div><font color=3D"#888888"><div clas=
s=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=C2=A0-George</div><=
/font><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
</blockquote></div></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div>

--000000000000e59c3605dd7a0ed5--

