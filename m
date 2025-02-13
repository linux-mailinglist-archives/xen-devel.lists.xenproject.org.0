Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E499DA34E47
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 20:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887974.1297394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiefi-0001kY-1x; Thu, 13 Feb 2025 19:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887974.1297394; Thu, 13 Feb 2025 19:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiefh-0001il-Vh; Thu, 13 Feb 2025 19:14:49 +0000
Received: by outflank-mailman (input) for mailman id 887974;
 Thu, 13 Feb 2025 19:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiefg-0001if-KL
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 19:14:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9dbcb14-ea3e-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 20:14:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A0A0B5C54B6;
 Thu, 13 Feb 2025 19:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E85C4CED1;
 Thu, 13 Feb 2025 19:14:45 +0000 (UTC)
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
X-Inumbo-ID: c9dbcb14-ea3e-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739474085;
	bh=vOPz6y0qAYWS0qs5JMnFZHXjIuz7DnqDIY/kAWtODso=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YHwRqqkKa0J04IDvBiSch52LhDuVDj/S5iU/OXKMxN8T5qUP1bCijAqlqieK8/Q+M
	 XDlIEzDrWR8tFsWDabT0rQxrbNkyKx21D0DE2xyhkLE3nOS3aEbHVGvwgTzaxqAuLU
	 EnUZ0eN7Fsw6PxYVsaAuaIeGp/CtJW13rDQAFTcAYRxP2ywL/bkLUt8grJPCN4lZz1
	 SgF6zro37Y+DjtgC9TdMCMRc/ZpZx+8VVv+tMTkbuLJhrHYZ0/12GO7QR8cF6ddGVu
	 kBVHzlYpzbAxIQxRF9xiCcv4p2HajDFScib5wuTQqSU8Sgv1+RDaC1y5S5zyLUOJ73
	 YIh6tqM8tMtFQ==
Date: Thu, 13 Feb 2025 11:14:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 2/3] automation: add jobs running tests from
 tools/tests/*
In-Reply-To: <Z61Yw50tlX-xH9b6@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2502131111030.619090@ubuntu-linux-20-04-desktop>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com> <3fbb4c6be9d9190bb2bd6427ab0f0a933c95dde1.1739409822.git-series.marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2502121802540.619090@ubuntu-linux-20-04-desktop>
 <Z61Yw50tlX-xH9b6@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1410494313-1739474085=:619090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1410494313-1739474085=:619090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 13 Feb 2025, Marek Marczykowski-Górecki wrote:
> > > diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> > > new file mode 100755
> > > index 000000000000..242a9edad941
> > > --- /dev/null
> > > +++ b/automation/scripts/run-tools-tests
> > > @@ -0,0 +1,47 @@
> > > +#!/bin/sh
> > 
> > It should be /bin/bash
> 
> That script is running inside SUT (started from initramfs) which is
> rather minimal. I think it currently has bash, but with the initramfs at
> over 200MB (compressed) I can see trimming it in the future...

Hi Marek, let me clarify a bit more my comment.

While I have a preference for bash because that is what we are using for
all the other shell scripts, it is OK to use /bin/sh but then we need to
make sure the script is actually /bin/sh compatible and doesn't have any
bash-isms. Eye-balling the script I had the impression it was using
bash-isms, so I made the comment about using /bin/bash.

But in my experience most /bin/sh implementations today they are
actually somewhat bash compatible, so in general it is easier to declare
/bin/bash instead of /bin/sh.
--8323329-1410494313-1739474085=:619090--

