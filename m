Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0752DC016
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 13:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55206.96133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpVnK-0005ma-UL; Wed, 16 Dec 2020 12:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55206.96133; Wed, 16 Dec 2020 12:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpVnK-0005mB-R4; Wed, 16 Dec 2020 12:20:38 +0000
Received: by outflank-mailman (input) for mailman id 55206;
 Wed, 16 Dec 2020 12:20:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zyv+=FU=gmail.com=xieliwei@srs-us1.protection.inumbo.net>)
 id 1kpVnJ-0005m1-26
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 12:20:37 +0000
Received: from mail-il1-x135.google.com (unknown [2607:f8b0:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5c0eb69-25f4-40f1-a141-0d57d9a94e62;
 Wed, 16 Dec 2020 12:20:36 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id k8so22355557ilr.4
 for <xen-devel@lists.xenproject.org>; Wed, 16 Dec 2020 04:20:36 -0800 (PST)
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
X-Inumbo-ID: e5c0eb69-25f4-40f1-a141-0d57d9a94e62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rcOJ/B9WKeoDZoU7//up+spMMrwIYlhyVLHQkdzuZa8=;
        b=LPNDy3q49dRe1Udz8UEjnB2hlMziCx/LNfq6i/SFTtWlolgRDTuJPqBMFyFT1pMNmN
         dZr4dVglM2LUshBqa/ei+tR2oAaTh1AJt+kwWEldYyzH8DLTnVdoUWp4hORAJv81t049
         VyhFY/BcP9nIcYx8IOcgxguHlQnTD8OoaEgP+JRkl+rsyFl6MEa/zAzVSl7lAnoyRXFS
         CCublE2FYRsOwOUoFSYvmUDAeFElKl856hlJJWDfD20ccSzyk7fRf5/qzdOZBiAbSrBQ
         WBoXS8wNjyBWagdh0cYtQ8Ro/1fzRXM6rYMHDSXzlGcEGGBx03unAHVOoAMiiHhHVtku
         /4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rcOJ/B9WKeoDZoU7//up+spMMrwIYlhyVLHQkdzuZa8=;
        b=fNBIjuBv3q/+c2Wrem79wXWheY/A/4Qw8rUxFkheqNWmJdW5iaxwgI+40rOA0ji5nv
         92/N7+8h3rrfJU1sBuKrKmg1s51uliGGDHUzUbwWwCc9i9p4rFr9apALLSXfPUAiR7Uc
         btbGvGtzFEaYH2KVdwQ0VNyW+uPA4ml1KaPJM6qbs3tnSaHiGZ/0uUXX9onAihp5ngvE
         cclwCABbmziYP7ZL/lTmMyRDE3chjEsn4hvFzpc+si5FrvAjKyTUqtG5bRDTH9iJo678
         RGRpnhYUHEAet/lmjahdwky43D7QhmSzsRos6pU1CD8I8my9zu3/qOFv1d5hPmhsUWWE
         Utng==
X-Gm-Message-State: AOAM530IStvhwZoDQXyYHQ1ZMvu7yko27yU8WRq3Tz4X6VGnpLD+XUyO
	74O3+HR4RC8UztukNCyx0rL1adVXrecm76r6YD4w0jMm8h8=
X-Google-Smtp-Source: ABdhPJxjP0nkV0RltRY1U1qPuSYqwYt6LxKJgzgPcoJuniM0oql9Ek1ngYWsr8WiaHQnzS6QvVXP5txFxlsA2hoSwvQ=
X-Received: by 2002:a92:c54b:: with SMTP id a11mr42205377ilj.186.1608121235634;
 Wed, 16 Dec 2020 04:20:35 -0800 (PST)
MIME-Version: 1.0
References: <mailman.2112.1604414193.711.xen-devel@lists.xenproject.org>
 <CAPE0SYz0be1ZOoNqDHpeJWeZS-1BM_zy50=Cmeo+4Aq1Na0eNQ@mail.gmail.com> <4a0d9b00-5f1f-e9e1-fccf-1f26762134e8@suse.com>
In-Reply-To: <4a0d9b00-5f1f-e9e1-fccf-1f26762134e8@suse.com>
From: Liwei <xieliwei@gmail.com>
Date: Wed, 16 Dec 2020 20:19:05 +0800
Message-ID: <CAPE0SYzHL_SZpocBB_Puz7+Zm6fqSD6vYg3zZ1Tf_exYU0Cj0w@mail.gmail.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>, 
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,
    Response inline...

Liwei

On Wed, 16 Dec 2020 at 16:12, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.12.2020 20:08, Liwei wrote:
> > Hi list,
> >     This is a reply to the thread of the same title (linked here:
> > https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg84916.html
> > ) which I could not reply to because I receive this list by digest.
> >
> >     I'm unclear if this is exactly the reason, but I experienced the
> > same symptoms when upgrading to 4.14. The issue does not occur if I
> > downgrade to 4.11 (the previous version that was provided by Debian).
> > Kernel is 5.9.11 and unchanged between xen versions.
> >
> >     One thing I noticed is that if I disable the monitor/mwait
> > instructions on my CPU (Intel Xeon E5-2699 v4 ES), the stalls seem to
> > occur later into the boot. With the instructions enabled, the system
> > usually stalls less than a few minutes after boot; disabled, it can
> > last for tens of minutes.
> >
> >     Further disabling the HPET or forcing the kernel to use PIT causes
> > it to be somewhat usable. The stalls still occur tens of minutes in
> > but somehow everything seems to continue chugging along fine?
>
> By "the kernel" do you really mean the kernel, or Xen?

Sorry, I mean xen. Too used to thinking that xen isn't there when I'm
talking about dom0.

>
> >     I've also verified that the stalls do not occur in all the above
> > cases if I just boot into the kernel without xen.
> >
> >     When the stalls happen, I get the "rcu: INFO: rcu_sched detected
> > stalls on CPUs/tasks" backtraces printed on the console periodically,
> > but keystrokes don't do anything on the console, and I can't spawn new
> > SSH sessions even though pinging the system produces a reply. The last
> > item in the call trace is usually "xen_safe_halt", but I've seen it
> > occur for other functions related to btrfs and the network adapter as
> > well.
>
> The kernel log may not be the only relevant thing here - the hypervisor
> log may also need looking at (with full verbosity enabled and
> preferably a debug build in use).

I will build a debug version and get back to you on that. Do I just
have loglvl and guest_loglvl set to full, console to ring, and get the
entire serial spew? I recall that you wanted to see the I, q and r
outputs as well.

>
> >     Do let me know if there's anything I can provide to help
> > troubleshoot this. At the moment I've reverted to 4.11, but I can
> > temporarily switch over to 4.14 to collect any necessary information.
>
> In that earlier thread a number of things to try were suggested, iirc
> (switching scheduler or disabling use of deep C states come to mind).
> Did you experiment with those? If so, can you let us know of the
> results, so we can see whether there's a pattern?

1. Switching to credit didn't seem to make any difference in my case
2. I have tried with cpuidle=off and max_cstate=1, and it actually
provides the same result as when I have mwait/monitor & hpet turned
off (even when I leave mwait & hpet on in BIOS)
3. I could not try with dom0=PVH as my system reboots after(or while?)
the kernel is loaded/ing when I do that

I do realise, after working with the cpuidle=off and max_cstate=1
combination for a day, the system is actually limping. Most of the
visible issues seem to stem from storage hanging or responding very
slowly, but it might be due to the btrfs tasks hanging in the
background.

>
> Jan

