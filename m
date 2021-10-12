Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8759042A819
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207405.363232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJYA-0006EF-AP; Tue, 12 Oct 2021 15:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207405.363232; Tue, 12 Oct 2021 15:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJYA-0006CM-6l; Tue, 12 Oct 2021 15:18:42 +0000
Received: by outflank-mailman (input) for mailman id 207405;
 Tue, 12 Oct 2021 15:18:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJY8-0006C7-SS
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:18:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJY8-0003iQ-Qu
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:18:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maJY8-0003sW-QC
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:18:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maJXv-0004kS-Mi; Tue, 12 Oct 2021 16:18:27 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=52yBbdeSVNUZprStrJdPNpVSMMkaWEU8qRv/AMi4fcc=; b=axZYLh1LVARBTGpK714CWKpI9k
	J1JkLSmxXEPwgXzlVNG8/a+cWv5GSny+8DrAkuV63hcPBbHDQcw6fWXbu54vMcO1D9FHNL/URKLNA
	DgwKbJNfkxWchSsFD6tvLtMConfdWf1KUCvAzWmo+6MFsQijOVc4fvHQVLn3rrUL/DT8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.42819.375910.803748@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 16:18:27 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: wl@xen.org,
    jgross@suse.com,
    iwj@xenproject.org,
    anthony.perard@citrix.com,
    Rahul.Singh@arm.com,
    Bertrand.Marquis@arm.com,
    xen-devel@lists.xenproject.org,
    michal.orzel@arm.com,
    Oleksandr Andrushchenko <andr2000@gmail.com>,
    roger.pau@citrix.com,
    Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: ARM series with tools patches for 4.16
In-Reply-To: <alpine.DEB.2.21.2110081605340.25528@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110081605340.25528@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("ARM series with tools patches for 4.16"):
> I am writing this email as a summary of the outstanding ARM series
> targeting 4.16 that we are aiming to complete by Oct 15.

Thanks.  This is really helpful.

> There has been a lot of traffic on the mailing list and in a few
> occasions there has been 1 or 2 tools patches embedded in larger ARM
> series. Easy to miss. For your convenience and help with tracking I
> thought it would be useful to list the tools and libxl patches from the
> various series that currently need an ack.

I looked at these:

> - PCI devices passthrough on Arm by Rahul
>   https://marc.info/?l=xen-devel&m=163354201102377
>   Status:
>       - patch #1   missing a tools ack
>       - patch #10  missing a libxl ack
>       - patch #9   missing a vpci (Roger) ack
>       - other patches no action needed from tools (either already
>         committed, acked, or almost there)

#1 I think needs work on the commit message and a slight code change
but ought to be doable.  #9 has been committed AIUI.  I think #10 is
having trouble - I replied to it.  I'm happy to help with this if I
could see the wood for the trees...

> - PCI devices passthrough on Arm, part 2 by OleksandrA
>   https://marc.info/?l=xen-devel&m=163367250003118
>   Status:
>       - patch #6, #7  missing a libxl ack
>       - other patches no action needed from tools (either already
>         committed, acked, or almost there)

These now acked I think ?

> - Add handling of extended regions (safe ranges) on Arm by OleksandrT
>   https://marc.info/?l=xen-devel&m=163351932517019
>   Status:
>       - patch #1  missing a libxl ack (but also xen side not finished)
>       - patch #2  missing a libxl ack (Ian is aware)
>       - patch #3  no action needed from tools (committed)

I have acked one of these and asked an easy question of the other.

> - Expose PMU to the guests by Michal
>   https://marc.info/?l=xen-devel&m=163368116008406
>   Status:
>       - patch #1, #3  missing a tools and libxl ack
>       - patch #2      no action needed from tools (acked)

These now acked I think ?

Ian.

