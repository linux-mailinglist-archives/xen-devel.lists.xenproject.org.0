Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE0957BB60
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 18:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372018.603854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oECV3-0005Fg-V9; Wed, 20 Jul 2022 16:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372018.603854; Wed, 20 Jul 2022 16:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oECV3-0005Cl-SD; Wed, 20 Jul 2022 16:24:37 +0000
Received: by outflank-mailman (input) for mailman id 372018;
 Wed, 20 Jul 2022 16:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgt+=XZ=citrix.com=prvs=193804040=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oECV2-0004mQ-Al
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 16:24:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fcae1d8-0848-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 18:24:34 +0200 (CEST)
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
X-Inumbo-ID: 6fcae1d8-0848-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658334274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FXRHk59uu6znUS4nvUL8AGhMHJGKbD2dFt27kaALOBI=;
  b=ekNmNAQcL4FeZSWuVhIC7qabotkEh0zJPCsmIcqXVhJjwPRrK1AJHx3m
   Y6BU4AQ4/Rian5dkvFHQsYtyXNR5tLTCAC+Ara8IvLxE6nmGw6vQuS93z
   TuF9qWk1tM3G2x0OJX1JSYAnSmTCFEbk3D4SHysN8+D8iS4QBGqd4VCI8
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78815745
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ESKZZauab49swzhfzuUmh4+VsefnVGNeMUV32f8akzHdYApBsoF/q
 tZmKWyDbPmMZTPwf9sjOo/koUNT75XUmtE2SQFsqHgxRiMb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzh8B56r8ks15qyt4mtA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FZMXorlFBF9Dz
 9ARFzUKQgu9xMju+YvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3Fb4qFI4HVGZg9ckCwm
 Uz31UXEOkwhHYaClBqp8Ervu8SSknauMG4VPOLhraM76LGJ/UQRBwcRTkCTuuSihwi1XNc3A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mlxrfS5w+BCUAZSz9KaJoruNJebTkjy
 l+Iks6vGTV1qrSRYWqH8auTqza7OCxTJmgHDQcUQA1A/sLuupobihPUUs0lAKOzlsfyGzz73
 3aNtidWulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdnyqtlxLYbCoXaCh1l3cwe1+b6zBd2DU6
 RDohPOiAPAy4YClzXLQEL9URuD1vp5pIxWH3wcxQsBJGyCFvif6INsOuGwWyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmOyvpngGiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymH1unz6OFcimkkj3uVZ7WJJyYe5fWGZik8hjtP/UyOkr2
 4032zS2J+V3D7SlP3i/HX87JlEWN3krba3LRzhsXrfaemJORTB+Y8I9NJt7JOSJaYwJybqTl
 px8M2cEoGfCaYrvclvQNCg/N+mxAf6SbxsTZEQRALph4FB7Ca7H0UvVX8FfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:pVoWmq+boJPl0p+ppY5uk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.92,286,1650945600"; 
   d="scan'208";a="78815745"
Date: Wed, 20 Jul 2022 17:24:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
CC: Xen-users <xen-users@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, George Dunlap <dunlapg@umich.edu>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: xen master: xl create hangs
Message-ID: <YtgsNi2cBjov36aZ@perard.uk.xensource.com>
References: <YtgRpBR0duVAqPZJ@perard.uk.xensource.com>
 <hF_ANsRE_9Sbu2AU-AYkf0uIMtOhY2NGK2eG1QOXsdL8uKwi7K9y3SrJAJ4UrHJ34Mpp2WXUGOh4F2vdtJpguCOVHn-K-XuwtYeISjijagk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <hF_ANsRE_9Sbu2AU-AYkf0uIMtOhY2NGK2eG1QOXsdL8uKwi7K9y3SrJAJ4UrHJ34Mpp2WXUGOh4F2vdtJpguCOVHn-K-XuwtYeISjijagk=@protonmail.com>

On Wed, Jul 20, 2022 at 03:04:22PM +0000, Mathieu Tarral wrote:
> Hi Anthony
> 
> 
> > $(debug) controls the level of optimisation of the compilation to make
> > it easier to debug.
> >
> > So, with debug=y, we have libxenstore having issue with killing the
> > its reading thread? :-(
> > Maybe that reading thread is doing something that can't be stopped,
> > maybe it's waiting for a lock. Could you try to print a back trace of
> > that thread (or even all thread in `xl`)? ("thread apply all bt full" in gdb)
> 
> I recompiled the buggy master, and this is the full GDB stacktrace when xl create hangs:
> https://gist.github.com/Wenzel/969d5c06982246cd6cb2eb8cdf252a18
> 
> I don't see the same stacktrace as before, maybe I was on a different commit ?

I think that this `xl` process just wait for the domain to shutdown
or die. When we run `xl create`, before exiting there's a fork/exec of
xl which handle a few domain events, so it looks like this stack trace
is expected (and look like the one I have). So it don't looks like to be
the xl process that hangs.

-- 
Anthony PERARD

