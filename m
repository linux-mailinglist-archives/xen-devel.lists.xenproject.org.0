Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1C32B915
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 17:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92895.175156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU3O-0006hI-8M; Wed, 03 Mar 2021 16:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92895.175156; Wed, 03 Mar 2021 16:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU3O-0006gr-4J; Wed, 03 Mar 2021 16:08:50 +0000
Received: by outflank-mailman (input) for mailman id 92895;
 Wed, 03 Mar 2021 16:08:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU3N-0006gb-3K
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:08:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU3N-0003zk-2F
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:08:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU3N-0005YX-1J
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:08:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU3J-0002V7-O7; Wed, 03 Mar 2021 16:08:45 +0000
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
	bh=8U79bQjaPvJAPE9FcD1NwDJIjVKHdU/u6q7g9cU3elw=; b=dMHV/JvB9DAgU8n34K6I+t6Jvx
	6B5jR8bpMPNiLuaGxYoBWgSAJtKuk3FyQGCBaM1jg9D4xHJp60wAL7QJuS3uTIJZEaYmu/+L96Fac
	tU/mz90VYIsdaq0klrmOS266kkZD8GyUikJvgvxxDqxpIA3IYNEaWt/vBph1bmZ+688w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46221.478411.522161@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:08:45 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: [PATCH XENSTORE v1 03/10] xenstore: check formats of trace
In-Reply-To: <20210226144144.9252-4-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-4-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 03/10] xenstore: check formats of trace"):
> When passing format strings to the trace function, allow gcc to analyze
> those and warn on issues.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Thomas Friebel <friebelt@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

