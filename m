Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F3A7B398
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937551.1338492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Uot-00075W-7I; Fri, 04 Apr 2025 00:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937551.1338492; Fri, 04 Apr 2025 00:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Uot-00072W-44; Fri, 04 Apr 2025 00:22:03 +0000
Received: by outflank-mailman (input) for mailman id 937551;
 Fri, 04 Apr 2025 00:22:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0Uos-00072Q-Go
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:22:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d339fd9b-10ea-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 02:22:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 333675C5CFC;
 Fri,  4 Apr 2025 00:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B1EC4CEE3;
 Fri,  4 Apr 2025 00:21:57 +0000 (UTC)
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
X-Inumbo-ID: d339fd9b-10ea-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743726118;
	bh=8GnSjRAbFf4cvHjo/KmuGkTgpbxBCQuAgjrsz8zq2g4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mqk4w3gWUgBOkVHJ9Axc4lIow2J/33k2LU7Fw70nEHqvLKNOF+wdoOmpfzTfjd0FA
	 yJC8x1cIoB2m9F2InJ+Fx9avZuDp32439JO60aGp2dBuLVtlzCaj1vnRHzTa+RkbjA
	 km51qRZsN/z2ZiGqc2TaaQcrmG5K3TOhHcq0zTadjMSQC69M3p5j8hBkpO+zKw0YrB
	 VnWvIJIkLysbSMf3gsis+JKgeaEzPXlkZTG6VdQd5COudoAHXgvEydPH5NNuwwrZnm
	 XXpHZVwOlsbPkLyyCtsnlkujUOPu6NwSCYcByBE8Bijnth/O/wSuvhvl0SvG5Fz7Yv
	 bD8wciHFG2dpA==
Date: Thu, 3 Apr 2025 17:21:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/11] ci: increase timeout for hw tests
In-Reply-To: <Z-5-PBcbtUOCSAiv@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2504031720260.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <7578489af5c7df525d4c82231b68bbb7d955d2b4.1743678257.git-series.marmarek@invisiblethingslab.com> <9e4660fc-b78f-4323-8a1b-aca3d410edd3@suse.com>
 <Z-5-PBcbtUOCSAiv@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1575154196-1743726118=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1575154196-1743726118=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 03, 2025 at 01:32:38PM +0200, Jan Beulich wrote:
> > On 03.04.2025 13:04, Marek Marczykowski-Górecki wrote:
> > > It appears as sometimes it takes more time for Xen even start booting,
> > > mostly due to firmware and fetching large boot files by grub. In some
> > > jobs the current timeout is pretty close to the actual time needed, and
> > > sometimes (rarely for now) test fails due to timeout expiring in the
> > > middle of dom0 booting. This will be happening more often if the
> > > initramfs will grow (and with more complex tests).
> > 
> > With that, ...
> > 
> > > This has been observed on some dom0pvh-hvm jobs, at least on runners hw3
> > > and hw11.
> > > 
> > > Increase the timeout by yet another 60s (up to 180s now).
> > 
> > ... is this little a bump going to be sufficient? How about moving straight
> > to 5min?

Hi Marek, would you be up for moving your script to use "expect"?
Something like ./automation/scripts/console.exp?

That way, we would immediately complete the job no matter the timeout
value. It is also nicer :-)


> I don't like this, as many (most) actual failures are visible as timeout
> (for example panic that prevents reaching Alpine prompt). One
> improvement I can see is splitting this into two separate timeouts: one
> before seeing the first line from Xen and then the second one for
> reaching Alpine login prompt. The first one can be longer as its mostly
> about firmware+fetching boot files and shouldn't hit on crashes (unless
> a crash happen before printing anything on the console - but those are
> rare).

This is also something you can very specifically tweak with expect.
--8323329-1575154196-1743726118=:3529306--

