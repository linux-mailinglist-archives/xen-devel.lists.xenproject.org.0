Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002DD8B4018
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 21:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713092.1114090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0R8h-0005Au-20; Fri, 26 Apr 2024 19:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713092.1114090; Fri, 26 Apr 2024 19:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0R8g-00058n-V7; Fri, 26 Apr 2024 19:21:42 +0000
Received: by outflank-mailman (input) for mailman id 713092;
 Fri, 26 Apr 2024 19:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0R8f-00058h-Rj
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 19:21:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 350277b4-0402-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 21:21:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2411C620EE;
 Fri, 26 Apr 2024 19:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1633C113CD;
 Fri, 26 Apr 2024 19:21:37 +0000 (UTC)
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
X-Inumbo-ID: 350277b4-0402-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714159298;
	bh=VqLCpPzlI0h2+O+230fZNRrN1S8tC+Uqh5GY+3OPLjE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pqPVtrmpdaQzqH7BhDByjIL0lprDidxg9IDb802HPBZv0LNrAGkYFpLGYAYXkl6lT
	 BQXTZDESLMeD8sqDK9awsPDMwWYd//KDBy+MncNoDu2DI4SJ6ChkNKh74MQX+0M/+b
	 9NFsW6x2TPKZqzu1dk8hfY3gO3qGHr8x41AdPXta/jd1kod7u6DfuwggKGDbTeb/mk
	 X1Zwah+JhGeqEaD/2A+X10vOeRxCWebpwSwDAviH8MiBKnHNYKJXvvnA2Gj2sq0nA1
	 tLKrK6TiAX7qEb2ZojKuDWdGsPxEuxgb20JOPdemB0ayrsqVDnFfgEAxnCxrnKjWcA
	 +b/2uKQhfbaDA==
Date: Fri, 26 Apr 2024 12:21:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>
Subject: Re: MISRA and -Wextra-semi
In-Reply-To: <5ef9fef8-e5ee-4ce3-a78f-ee7c35e5a1a4@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404261220450.3940@ubuntu-linux-20-04-desktop>
References: <5ef9fef8-e5ee-4ce3-a78f-ee7c35e5a1a4@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2097677740-1714159298=:3940"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2097677740-1714159298=:3940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 26 Apr 2024, Andrew Cooper wrote:
> So, while -Wextra-semi is definitely useful to find some hidden
> problems, it seems like using it fully might be very complicated.  How
> much do we care?

I'll let Roberto confirm, but I wouldn't think -Wextra-semi is high
priority
--8323329-2097677740-1714159298=:3940--

