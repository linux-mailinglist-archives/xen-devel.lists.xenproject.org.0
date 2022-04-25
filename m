Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB21A50E19B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312937.530346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niykF-00018k-UM; Mon, 25 Apr 2022 13:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312937.530346; Mon, 25 Apr 2022 13:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niykF-000160-R0; Mon, 25 Apr 2022 13:27:15 +0000
Received: by outflank-mailman (input) for mailman id 312937;
 Mon, 25 Apr 2022 13:27:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rnYW=VD=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1niykE-00015u-9G
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:27:14 +0000
Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com
 [198.54.122.105]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69a4205a-c49b-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 15:27:12 +0200 (CEST)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id ACC9418000B0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 09:27:10 -0400 (EDT)
Received: from mail-oa1-f50.google.com (unknown [10.20.151.162])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 8407518000A9
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 09:27:10 -0400 (EDT)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso16021407fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Apr 2022 06:27:10 -0700 (PDT)
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
X-Inumbo-ID: 69a4205a-c49b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1650893230;
	bh=COUANqa1yBnBucvA/LYW4WhQdaCqOvWHeqJEt+d7qKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CU0BVdTTVCGRKaJgAkONsRrVlwLA7TZxTTcBwnrSh9RZ6x0s6YQHzLZkdmF/jAYq5
	 slS7RVbLmTQa26hLCtwYsT9jy4NSgsTp0CGE3SwBkKJgx4QxqAedd+yJNXu2Meguo1
	 4b+XzGoaG8BbZcmuADABh8CI2PmDxrQdiPbacObkUxjj5qMFJh9/c75Xge78/D6GHH
	 EGISf7dYeqM8x5irSmWTm+qDyZoeLvGz3ldW6O7L0VXrocwpesyeXOV99F3p5ccfCz
	 AXWc0ohqXANvDqZORRSmAMnQ/sNN65lAJcy7yofBg9+CEA53Va9mLqoy2vet08SGyt
	 u68rccyvZGyPQ==
X-Gm-Message-State: AOAM532DegkldgxJcDM1Nj9rTU8F4So5GMysAduk2Jt7sAJxoct9ZOgq
	pL50egccioeLWgxPk1OiG4D3aIylj6jyOLZEeHQ=
X-Google-Smtp-Source: ABdhPJzwcPIL4b0ha9sXZ/VNuRAW/u5l/KqKvAf9MMW06qxRWpKN7QGhU4ZwpbJ/RJPgyvY8uOAPIILW6jUvNAYi5/E=
X-Received: by 2002:a05:6870:b295:b0:e9:1c84:3671 with SMTP id
 c21-20020a056870b29500b000e91c843671mr3789029oao.128.1650893229643; Mon, 25
 Apr 2022 06:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <CABfawhki8YVxycv_zdDqDuOYvBdobdskXnjjdjiF7UND3784cg@mail.gmail.com>
 <310ab91a-60bd-f4fa-aeee-28aab43aabbe@suse.com> <CABfawhmzz5OwYr93EO7UAnb1X+vBoi3u=YVW6HMV5KpH_iEGeg@mail.gmail.com>
 <CAFLBxZaT1jRo8_KBKOFMdwvM0q=LAoUSxuHNkgOrFA00a9vVdA@mail.gmail.com>
In-Reply-To: <CAFLBxZaT1jRo8_KBKOFMdwvM0q=LAoUSxuHNkgOrFA00a9vVdA@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 25 Apr 2022 09:26:33 -0400
X-Gmail-Original-Message-ID: <CABfawhkNU0z5_+QRHQny-ZkyWPSyRTgaM3Z9W5gA90a3qY3qFw@mail.gmail.com>
Message-ID: <CABfawhkNU0z5_+QRHQny-ZkyWPSyRTgaM3Z9W5gA90a3qY3qFw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
To: George Dunlap <dunlapg@umich.edu>
Cc: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@intel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Apr 25, 2022 at 8:53 AM George Dunlap <dunlapg@umich.edu> wrote:
>
>
>
> On Mon, Apr 25, 2022 at 12:29 PM Tamas K Lengyel <tamas@tklengyel.com> wr=
ote:
>>
>>
>>
>> On Mon, Apr 25, 2022, 3:49 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 22.04.2022 16:07, Tamas K Lengyel wrote:
>>> > On Wed, Apr 13, 2022 at 9:43 AM Tamas K Lengyel <tamas.lengyel@intel.=
com> wrote:
>>> >>
>>> >> Allow specify distinct parts of the fork VM to be reset. This is use=
ful when a
>>> >> fuzzing operation involves mapping in only a handful of pages that a=
re known
>>> >> ahead of time. Throwing these pages away just to be re-copied immedi=
ately is
>>> >> expensive, thus allowing to specify partial resets can speed things =
up.
>>> >>
>>> >> Also allow resetting to be initiated from vm_event responses as an
>>> >> optimization.
>>> >>
>>> >> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>>> >
>>> > Patch ping. Could I get a Reviewed-by if there are no objections?
>>>
>>> Hmm, this is a little difficult. I'd be willing to give an ack, but tha=
t's
>>> meaningless for most of the code here. Besides a stylistic issue I did
>>> point out which I'm not happy with, I'm afraid I'm not good enough at
>>> mem-sharing and forking. Therefore I wouldn't want to offer an R-b.
>>> Considering the VM event interaction, maybe the BitDefender guys could
>>> take a stab?
>>>
>>> Of course you'd then still need a tool stack side ack.
>>
>>
>> So my take is that noone cares about mem_sharing, which is fine, its an =
obscure experiment subsystem.
>
>
> My take is slightly different; it's more that the project is large enough=
 that it's difficult to se where the needs are.  If Roger or Andy or I or W=
ei or anyone see a thread with you & Jan going back and forth, it's natural=
 for us to assume that you & Jan have it in hand, and there's no need for u=
s to read through the thread.  Jan dislikes asking specific people for a re=
view, but many of the rest of us have sort of gotten in the habit of doing =
so, as a way to solve the "visibility" issue.  The only other way I can thi=
nk of to solve the problem is to have a robot try to assign tasks to people=
 -- a method that has received skepticism, and would also require a non-neg=
ligible amount of tooling to be written.

What's the point of the MAINTAINER's file and being automatically CC-d
if you then still separately have to ping the same people by name?
It's fine not to give an a-b/r-b if you still see discussion on some
parts of the patch, but like on this one, where the tools changes are
trivial - why would you wait? To be frank I long consider the
tools-side part of Xen unmaintained with only the most trivial stuff
ever having a chance to make it in. VM forking has effectively 0
toolstack side support in-tree because I never got any feedback from
tools maintainers after sending the patches in for months. I would
consider the toolstack side stuff in this patch for example trivial,
but again, no tools maintainers ever look at it so I was actually
considering dropping it from the patch completely since I really only
need the vm_event interface. Again, that would be dropping an
otherwise potentially useful interface purely due to the dysfunction
of the project's maintenance.

>
>>
>> But the only path I see as maintainer to get anything in-tree is if I ha=
nd the task of writing the patch to a coworker who then sends it in so that=
 I can ack it. This is clearly disfunctional and is to the detriment of the=
 project overall. We need to get some rules in place to avoid situations li=
ke this that clearly lead to no development and no improvement and a huge i=
ncentive to forgot about upstreaming. With no substantive objections but no=
 acks a maintainer should be able to get changes in-tree. That's part of wh=
at I would consider maintaining a codebase to be!
>
>
> Another possibility would be to ask your colleague actually do a Reviewed=
-by.  The first time or two they might not be "of suitable stature in the c=
ommunity", but I don't think it should take long to establish such a statur=
e, if they were doing the review in earnest.

Sure, but clearly still more effort then it should be just to work
around the system.

>
> I do agree that it seems like in this situation, the bar seems too high f=
or you to get your own code checked in.  I'd be open to the argument that w=
e should change the text of the check-in policy in MAINTAINERS to allow mai=
ntainer modifications with only an Acked-by.

Happy to hear! I think such a change would reduce the overhead on
reviewing patches like this that clearly have no effect on anything
else.

>
>>
>> Anyway, to be realistic I don't expect that option to materialize so I'm=
 very close to just stop all contributions to the project. It's dishartenin=
g.
>
>
>
> I can understand why you'd be disheartened if you thought you just couldn=
't get any code checked in even as maintainer.  However, there are lots of =
escalation paths open to you: you could email the community manager (me); y=
ou could make a wider appeal on IRC for reviewers; you could raise the gene=
ral issue at the community call; you could send a patch proposing changes t=
o the check-in procedure described in MAINTAINERS.

Fair point. But when your main job is not working on Xen and you have
a couple weeks in-between other stuff to try to get some improvements
in, it's not really viable to have to go reform the whole project.
That's just the reality. If we can reduce the bar on getting code
upstream in situations like this then I would be happy to continue
working on the project but otherwise I don't see how this is worth
anyone's time.

Tamas

