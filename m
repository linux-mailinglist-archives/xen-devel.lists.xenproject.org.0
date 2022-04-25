Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC0050DEC8
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 13:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312791.530167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwuQ-0003wD-OF; Mon, 25 Apr 2022 11:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312791.530167; Mon, 25 Apr 2022 11:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwuQ-0003t1-KH; Mon, 25 Apr 2022 11:29:38 +0000
Received: by outflank-mailman (input) for mailman id 312791;
 Mon, 25 Apr 2022 11:29:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rnYW=VD=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1niwuO-0003OZ-OY
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 11:29:37 +0000
Received: from MTA-12-4.privateemail.com (mta-12-4.privateemail.com
 [198.54.127.107]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb4b5eba-c48a-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 13:29:35 +0200 (CEST)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 9F71118000A1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 07:29:33 -0400 (EDT)
Received: from mail-oa1-f47.google.com (unknown [10.20.151.148])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 7AA3B18000A0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 07:29:33 -0400 (EDT)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso15690897fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 04:29:33 -0700 (PDT)
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
X-Inumbo-ID: fb4b5eba-c48a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1650886173;
	bh=qTrCE0w8HVT5Sz7/fTjv5/g16z097wyRfqCLqQjtz6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kz/6pD9fyllXoYGtavf0arfn883BDPiwA/SonzcYJR2ybEy5ivU6FLkWwVquWTS3a
	 To43km/XNy5AF9bGTbbLDm/Ubm9IAp7h8rMe/e52sBe2a942JKjP/P3eQmpdOMim2Y
	 NIGpsOullqCF9lipLkRqanAjWIiVHmKfJNLLTfPKHmWa3yvPxBZwUuDSWsHjulBfHb
	 fTS5XF1nPBgiOaecBwgvkg5MX07SjHjNebh9KEAa9Izfw/qU5IX+q2x1Y42aXG/INC
	 HY/1jLaESUG7SCjtFJuZmb29c0ZoIwrQzTURQ+3m39wvGWeAJ+5VGu4dL2i5TGEDZU
	 3TqbfzgJC3Xxg==
X-Gm-Message-State: AOAM532HUHHcmZJIkAT2LmmezG2bGJPtsTk4pHeFxNMmnbC0hsQEfWBI
	TEiz0azYuGaVFVc6IJTL9/QFwnD/naj+B/+lqQg=
X-Google-Smtp-Source: ABdhPJyqEF35es+v6uBjajAmIvzfbEGoFGFP3mQ47R7S5bW875krCP3FsqpSd7nGRTyQ5RgJV2B8O/81AbgNy60PfzQ=
X-Received: by 2002:a05:6870:b295:b0:e9:1c84:3671 with SMTP id
 c21-20020a056870b29500b000e91c843671mr3533748oao.128.1650886172812; Mon, 25
 Apr 2022 04:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <CABfawhki8YVxycv_zdDqDuOYvBdobdskXnjjdjiF7UND3784cg@mail.gmail.com> <310ab91a-60bd-f4fa-aeee-28aab43aabbe@suse.com>
In-Reply-To: <310ab91a-60bd-f4fa-aeee-28aab43aabbe@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 25 Apr 2022 07:29:21 -0400
X-Gmail-Original-Message-ID: <CABfawhmzz5OwYr93EO7UAnb1X+vBoi3u=YVW6HMV5KpH_iEGeg@mail.gmail.com>
Message-ID: <CABfawhmzz5OwYr93EO7UAnb1X+vBoi3u=YVW6HMV5KpH_iEGeg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000e531a505dd78e3fe"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000e531a505dd78e3fe
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 25, 2022, 3:49 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 22.04.2022 16:07, Tamas K Lengyel wrote:
> > On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel <tamas.lengyel@intel.com>
> wrote:
> >>
> >> Allow specify distinct parts of the fork VM to be reset. This is useful
> when a
> >> fuzzing operation involves mapping in only a handful of pages that are
> known
> >> ahead of time. Throwing these pages away just to be re-copied
> immediately is
> >> expensive, thus allowing to specify partial resets can speed things up.
> >>
> >> Also allow resetting to be initiated from vm_event responses as an
> >> optimization.
> >>
> >> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >
> > Patch ping. Could I get a Reviewed-by if there are no objections?
>
> Hmm, this is a little difficult. I'd be willing to give an ack, but that's
> meaningless for most of the code here. Besides a stylistic issue I did
> point out which I'm not happy with, I'm afraid I'm not good enough at
> mem-sharing and forking. Therefore I wouldn't want to offer an R-b.
> Considering the VM event interaction, maybe the BitDefender guys could
> take a stab?
>
> Of course you'd then still need a tool stack side ack.
>

So my take is that noone cares about mem_sharing, which is fine, its an
obscure experiment subsystem. But the only path I see as maintainer to get
anything in-tree is if I hand the task of writing the patch to a coworker
who then sends it in so that I can ack it. This is clearly disfunctional
and is to the detriment of the project overall. We need to get some rules
in place to avoid situations like this that clearly lead to no development
and no improvement and a huge incentive to forgot about upstreaming. With
no substantive objections but no acks a maintainer should be able to get
changes in-tree. That's part of what I would consider maintaining a
codebase to be!

Anyway, to be realistic I don't expect that option to materialize so I'm
very close to just stop all contributions to the project. It's dishartening.

Tamas

--000000000000e531a505dd78e3fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Apr 25, 2022, 3:49 AM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 22.04.2022 16:07, Tamas K Lengyel wrote:<br>
&gt; On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel &lt;<a href=3D"mailto:=
tamas.lengyel@intel.com" target=3D"_blank" rel=3D"noreferrer">tamas.lengyel=
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
@intel.com" target=3D"_blank" rel=3D"noreferrer">tamas.lengyel@intel.com</a=
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
ubsystem. But the only path I see as maintainer to get anything in-tree is =
if I hand the task of writing the patch to a coworker who then sends it in =
so that I can ack it. This is clearly disfunctional and is to the detriment=
 of the project overall. We need to get some rules in place to avoid situat=
ions like this that clearly lead to no development and no improvement and a=
 huge incentive to forgot about upstreaming. With no substantive objections=
 but no acks a maintainer should be able to get changes in-tree. That&#39;s=
 part of what I would consider maintaining a codebase to be!</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Anyway, to be realistic I don&#39;t e=
xpect that option to materialize so I&#39;m very close to just stop all con=
tributions to the project. It&#39;s dishartening.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Tamas</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
</blockquote></div></div></div>

--000000000000e531a505dd78e3fe--

