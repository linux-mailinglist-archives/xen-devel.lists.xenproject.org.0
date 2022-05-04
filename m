Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038F51B065
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 23:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320992.541996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmMRd-00030u-HX; Wed, 04 May 2022 21:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320992.541996; Wed, 04 May 2022 21:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmMRd-0002yo-Cw; Wed, 04 May 2022 21:22:01 +0000
Received: by outflank-mailman (input) for mailman id 320992;
 Wed, 04 May 2022 21:21:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+twf=VM=alpha.franken.de=tsbogend@srs-se1.protection.inumbo.net>)
 id 1nmMRb-0002yP-6z
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 21:21:59 +0000
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3a1e3e79-cbf0-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 23:21:57 +0200 (CEST)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nmLg4-0003MI-01; Wed, 04 May 2022 22:32:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id B9C09C01D0; Wed,  4 May 2022 22:32:24 +0200 (CEST)
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
X-Inumbo-ID: 3a1e3e79-cbf0-11ec-8fc4-03012f2f19d4
Date: Wed, 4 May 2022 22:32:24 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org,
	linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
	fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	corbet@lwn.net, d.hatayama@jp.fujitsu.com,
	dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
	gregkh@linuxfoundation.org, mikelley@microsoft.com,
	hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
	john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
	mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
	peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
	stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
	vkuznets@redhat.com, will@kernel.org
Subject: Re: [PATCH 07/30] mips: ip22: Reword PANICED to PANICKED and remove
 useless header
Message-ID: <20220504203224.GA23475@alpha.franken.de>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-8-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-8-gpiccoli@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 27, 2022 at 07:49:01PM -0300, Guilherme G. Piccoli wrote:
> Many other place in the kernel prefer the latter, so let's keep
> it consistent in MIPS code as well. Also, removes a useless header.
> 
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  arch/mips/sgi-ip22/ip22-reset.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

