Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D6445747
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221734.383589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifb3-0004Jm-Gj; Thu, 04 Nov 2021 16:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221734.383589; Thu, 04 Nov 2021 16:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifb3-0004GS-Ch; Thu, 04 Nov 2021 16:28:13 +0000
Received: by outflank-mailman (input) for mailman id 221734;
 Thu, 04 Nov 2021 16:28:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mifb2-0004GF-Gh
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:28:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mifb2-0008IE-Fv
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:28:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mifb2-0007PP-F5
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:28:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mifax-0003IX-Qj; Thu, 04 Nov 2021 16:28:07 +0000
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
	bh=4P2rXa7wAH/x8cxquAXPxQ2xOkEgnDhpm395bIb3wtM=; b=ZzCFxLPwDrvvgr1tIx1Ru/JJMY
	VQ0UTVk5sFDOpokqIW5BGsrEIU6pPUCOOV1DOZaTotB6FG2k3C3MZhhC5lmR1exdZNF7r5GpJ8Sfm
	5eNRieiRYeXgWsC/mVfvN3jOWAMm81fayMSIpQm3pgseV73qYdc0V23qWcroXMZs0P8M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24964.2583.16255.794552@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 16:28:07 +0000
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Community Manager <community.manager@xenproject.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH-for-4.16 v2 0/2] next try for disabling build of qemu-trad
In-Reply-To: <20211104161121.18995-1-jgross@suse.com>
References: <20211104161121.18995-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH-for-4.16 v2 0/2] next try for disabling build of qemu-trad"):
> Another try to disable building qemu-traditional per default.
> 
> Juergen Gross (2):
>   configure: modify default of building rombios
>   tools: disable building qemu-trad per default

Both patches.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

But let's see if Andy wants to comment on the help messages.

Ian.

