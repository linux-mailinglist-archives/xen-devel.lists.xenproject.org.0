Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A381A71A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 19:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658245.1027350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1mR-0002HC-CZ; Wed, 20 Dec 2023 18:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658245.1027350; Wed, 20 Dec 2023 18:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1mR-0002FY-9d; Wed, 20 Dec 2023 18:58:55 +0000
Received: by outflank-mailman (input) for mailman id 658245;
 Wed, 20 Dec 2023 18:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rG1mQ-0002FS-H4
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 18:58:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfd26289-9f69-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 19:58:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 25141CE1D5C;
 Wed, 20 Dec 2023 18:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C9DC433C8;
 Wed, 20 Dec 2023 18:58:45 +0000 (UTC)
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
X-Inumbo-ID: cfd26289-9f69-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703098726;
	bh=URY02UddOim4cEdqv3S4Emu2QUaKxv6M7A+HWzTBzQw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F5QgkZz+Uy4cW8qzOC47LI3VTHkFs/iRsFz0K4T6CUooeu/hBqMx0jFm/jrb093Iu
	 z7+rhO07MMjW07rItsA7TMfAaw3udxynEtOML52pEXCxd8pJKE5TS01MC2I1vGJpzd
	 DY+kBlYeRuZUxDZAkWyFOfVqDO+ZfK0pXkmbPXTje0xK7MdoU0Qp8QfccO2xSLjwn/
	 6l04JP4CqV3SQaFf9vAFmdf6r3aSC7lerfuDTf4pRvnQD7xarV8Qoe5K7fbe5G6Dfj
	 TbJDVA6ETsHXOfp3AVuKBYun+y+KHqgvmDmu9OxVh3tk4MZQhaoNuj+9/lu9hLIcLB
	 CwsRcOoR6if8w==
Date: Wed, 20 Dec 2023 10:58:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [PATCH 2/2] xen/bug: Complete outstanding TODO
In-Reply-To: <139031ab-522c-41d7-b9d7-e9b7d3656555@xen.org>
Message-ID: <alpine.DEB.2.22.394.2312201053180.685950@ubuntu-linux-20-04-desktop>
References: <20231215181433.1588532-1-andrew.cooper3@citrix.com> <20231215181433.1588532-3-andrew.cooper3@citrix.com> <139031ab-522c-41d7-b9d7-e9b7d3656555@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1998577787-1703098608=:685950"
Content-ID: <alpine.DEB.2.22.394.2312201056540.685950@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1998577787-1703098608=:685950
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312201056541.685950@ubuntu-linux-20-04-desktop>

On Fri, 15 Dec 2023, Julien Grall wrote:
> Hi Andrew,
> 
> On 15/12/2023 18:14, Andrew Cooper wrote:
> > Since this TODO was written, BUILD_BUG_ON() has been moved out of xen/lib.h
> > into xen/macros.h, which has done all the hard work.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: George Dunlap <George.Dunlap@citrix.com>
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Wei Liu <wl@xen.org>
> > CC: Julien Grall <julien@xen.org>
> > CC: Federico Serafini <federico.serafini@bugseng.com>
> > ---
> >   xen/include/xen/bug.h | 16 +++++++---------
> >   1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> > index cb5138410ea7..8cca4486a477 100644
> > --- a/xen/include/xen/bug.h
> > +++ b/xen/include/xen/bug.h
> > @@ -20,7 +20,8 @@
> >   #define BUG_DEBUGGER_TRAP_FATAL(regs) 0
> >   #endif
> >   -#include <xen/lib.h>
> > +#include <xen/macros.h>
> > +#include <xen/types.h>
> >     #ifndef BUG_FRAME_STRUCT
> >   @@ -104,14 +105,11 @@ typedef void bug_fn_t(const struct cpu_user_regs
> > *regs);
> >     #ifndef run_in_exception_handler
> >   -/*
> > - * TODO: untangle header dependences, break BUILD_BUG_ON() out of
> > xen/lib.h,
> > - * and use a real static inline here to get proper type checking of fn().
> > - */
> > -#define run_in_exception_handler(fn) do {                   \
> > -    (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
> > -    BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
> > -} while ( false )
> > +static void always_inline run_in_exception_handler(
> > +    void (*fn)(struct cpu_user_regs *regs))
> 
> Based on the other threads, shouldn't this be using bug_fn_t?

Unfortunately it doesn't compile:

common/bug.c: In function ‘do_bug_frame’:
common/bug.c:72:38: error: passing argument 1 of ‘run_in_exception_handler’ from incompatible pointer type [-Werror=incompatible-pointer-types]
   72 |             run_in_exception_handler(fn);
      |                                      ^~
      |                                      |
      |                                      void (*)(struct cpu_user_regs *)

due to the missing const in common/bug.c:72.


Not to make things more complicated in this patch, I think we should
take the patch as is as a simple cleanup (and do further cleanups in the
future):

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1998577787-1703098608=:685950--

