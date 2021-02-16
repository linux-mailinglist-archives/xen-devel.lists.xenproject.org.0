Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4A31CD9D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 17:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85913.160797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2wl-0001L3-Sz; Tue, 16 Feb 2021 16:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85913.160797; Tue, 16 Feb 2021 16:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2wl-0001Ke-PW; Tue, 16 Feb 2021 16:11:31 +0000
Received: by outflank-mailman (input) for mailman id 85913;
 Tue, 16 Feb 2021 16:11:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2wk-0001KZ-6R
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:11:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2wk-0004Aw-5Z
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:11:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC2wk-0004MG-4Z
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:11:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC2wh-0000kW-0Z; Tue, 16 Feb 2021 16:11:27 +0000
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
	bh=Ihf4Ig4kaZSydDmfXnGJYIGUJcOgkHM5mhFknI5r/94=; b=6T1RZKKO9cfh0McByDGiIYhTC3
	rcPjTq/63qy8T/500EYQqAKtksGZowusyoLR+EmN+bNK8/ZU8Vs+zKZv3xnUL26gVOaw1WW0jM9MG
	gXLG9PH9rQElY9g8CXwlhInIMx9dqmONb2wT7ny7T4f+i3Cq1tqG/IFPLV4E2Zx02RbU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.61102.815443.66032@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:11:26 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 07/10] tools: Use -Og for debug builds when available
In-Reply-To: <20210212153953.4582-8-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-8-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 07/10] tools: Use -Og for debug builds when available"):
> The recommended optimisation level for debugging is -Og, and is what tools
> such as gdb prefer.  In practice, it equates to -01 with a few specific
> optimisations turned off.
> 
> abi-dumper in particular wants the libraries it inspects in this form.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I would prefer to have this in 4.15 now than to backport it later...

Ian.

