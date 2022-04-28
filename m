Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBE8513604
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 16:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316568.535503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4ja-0007Gd-2M; Thu, 28 Apr 2022 14:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316568.535503; Thu, 28 Apr 2022 14:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4jZ-0007Dy-Up; Thu, 28 Apr 2022 14:03:05 +0000
Received: by outflank-mailman (input) for mailman id 316568;
 Thu, 28 Apr 2022 14:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vr1S=VG=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nk4jY-0007Ds-An
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 14:03:04 +0000
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea663450-c6fb-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 16:03:02 +0200 (CEST)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id B900B18000A4
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 10:03:00 -0400 (EDT)
Received: from mail-oi1-f175.google.com (unknown [10.20.151.188])
 by mta-07.privateemail.com (Postfix) with ESMTPA id 92B5918000AC
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 10:03:00 -0400 (EDT)
Received: by mail-oi1-f175.google.com with SMTP id a10so5403764oif.9
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 07:03:00 -0700 (PDT)
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
X-Inumbo-ID: ea663450-c6fb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1651154580;
	bh=cjZMWTYdL2qt+00bX/PWyTd5ChKGhDO3djSqfRWv2xQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RKYzi63/pkv0MdTsXxrBvdII4+ky2OgAN/6lZPGkKrgJLBXbMwg89rRxnB1ebps+y
	 hY5Y84k/eegr8u+VhjtS1tuHrClEpj1iJKB2MOVgMreR2h4gM8gaYcZOxCP+p9/VEM
	 qS0m+wvasvXmiWZ9dwrP24bhZHPGXuM8XhT4FYT9xPTh+hQKdSWRNHc1qFApAXYikn
	 qTcqVaDUlQvpWQ6VJWXKLLsX1KuF9SjB5bIXbBmpUkpU/2c1AA+WNjqm85cg8cdfrZ
	 vW6eb0VhA3iMk7CGp09U03ZSuzvje6kDXHg6TxyIuWUge0iL/0miFfev4YZ9puZhpt
	 Vz7YiitToJZZw==
X-Gm-Message-State: AOAM530ChJOLNZ5WujTRLKI2JFSXAez8EjN38KqteKZYjwt6rgpZuKns
	dSxLsvnEYJa5AMbrtC5yS3ypPho+JMQoxFspu7E=
X-Google-Smtp-Source: ABdhPJy62p2qGmO2M4uD6wcboE6BbwQp8Ew5Wz6sebUDFmlp3oSlJHHt67t3hEx5oegX/dqvBfr/H9SEKEptfm/EcQU=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr20352239oib.128.1651154579945; Thu, 28
 Apr 2022 07:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
 <Ymqc3dtLq4yTxmg5@Air-de-Roger>
In-Reply-To: <Ymqc3dtLq4yTxmg5@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 28 Apr 2022 10:02:24 -0400
X-Gmail-Original-Message-ID: <CABfawhnkBO_JNQ7JajX8LvE4gPCc55Bn6+3TW5hVKWM5qTtqPw@mail.gmail.com>
Message-ID: <CABfawhnkBO_JNQ7JajX8LvE4gPCc55Bn6+3TW5hVKWM5qTtqPw@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/monitor: Add new monitor event to catch all vmexits
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Apr 28, 2022 at 9:56 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Apr 27, 2022 at 11:34:20AM -0400, Tamas K Lengyel wrote:
> > Add monitor event that hooks the vmexit handler allowing for both sync =
and
> > async monitoring of events. With async monitoring an event is placed on=
 the
> > monitor ring for each exit and the rest of the vmexit handler resumes n=
ormally.
> > If there are additional monitor events configured those will also place=
 their
> > respective events on the monitor ring.
> >
> > With the sync version an event is placed on the monitor ring but the ha=
ndler
> > does not get resumed, thus the sync version is only useful when the VM =
is not
> > expected to resume normally after the vmexit. Our use-case is primarily=
 with
> > the sync version with VM forks where the fork gets reset after sync vme=
xit
> > event, thus the rest of the vmexit handler can be safely skipped. This =
is
> > very useful when we want to avoid Xen crashing the VM under any circums=
tance,
> > for example during fuzzing. Collecting all vmexit information regardles=
s of
> > the root cause makes it easier to reason about the state of the VM on t=
he
> > monitor side, hence we opt to receive all events, even for external int=
errupt
> > and NMI exits and let the monitor agent decide how to proceed.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Thanks, Roger.

Thank you!
Tamas

