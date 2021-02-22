Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238843214E2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87973.165262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9C3-0006me-Cc; Mon, 22 Feb 2021 11:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87973.165262; Mon, 22 Feb 2021 11:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9C3-0006mF-99; Mon, 22 Feb 2021 11:15:59 +0000
Received: by outflank-mailman (input) for mailman id 87973;
 Mon, 22 Feb 2021 11:15:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9C1-0006mA-O7
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:15:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9C1-0006mB-KM
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:15:57 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9C1-00067i-IW
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:15:57 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lE9By-0000ko-C3; Mon, 22 Feb 2021 11:15:54 +0000
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
	bh=tvmEtbpqs6ufp1O+ExbeT6WdYpgoKsN6Fz0xeN6YX60=; b=uCBlGTzjF1mijs0mnnWx+87IcI
	gonjUmIAkzBKH06biccndL5qbOyTk7Z4WoINv6BcoCsW15kMTs3GZRtTOpPzv7luEAHNZ4MVEKIht
	4DE/bn/nQbZva1e60Stf48tu9HqvVYiwhmZiOsUTrsxMWQvdzL5c6NBFDqIRdX9Y7SVc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24627.37482.140028.358793@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 11:15:54 +0000
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] tools/misc/xen-vmtrace: use reset and enable
In-Reply-To: <d63d274c46f964d89f791d5e5166971387c0e2e8.1613855006.git.tamas@tklengyel.com>
References: <d63d274c46f964d89f791d5e5166971387c0e2e8.1613855006.git.tamas@tklengyel.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Tamas K Lengyel writes ("[PATCH for-4.15] tools/misc/xen-vmtrace: use reset and enable"):
> The expected behavior while using xen-vmtrace is to get a clean start, even if
> the tool was used previously on the same VM.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>

and pushed to staging.

Ian.

