Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8E8431A9D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212246.370051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSXH-0001sw-6J; Mon, 18 Oct 2021 13:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212246.370051; Mon, 18 Oct 2021 13:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSXH-0001qU-38; Mon, 18 Oct 2021 13:18:39 +0000
Received: by outflank-mailman (input) for mailman id 212246;
 Mon, 18 Oct 2021 13:18:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcSXF-0001q8-QF
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:18:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcSXF-0005cQ-Nt
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:18:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcSXF-00050C-Mk
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:18:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcSXC-0005wL-5B; Mon, 18 Oct 2021 14:18:34 +0100
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
	bh=U9N4oku3+r/oA+wzLhvgv5YGr6VwYX08ChVjtI+J/dg=; b=ncgWDnBfIBj66GQstFdRsghML6
	lYGnmficWJTy8Cmse264M5h2AA8Wc95COmCKPFLcydHH056pVfMnanelC+FDdbct/fVMHpIoZ0mDW
	v9GW9qKeOgI62cKkzEShR/34x3ItbwnVhrpHqcb2Hn1Ctu1Yq6CGR5WbiX1FhSHUgXz0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24941.29737.869343.966550@mariner.uk.xensource.com>
Date: Mon, 18 Oct 2021 14:18:33 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: [PATCH v6 0/2] tools/xenstore: set resource limits of xenstored
In-Reply-To: <20211012134148.6280-1-jgross@suse.com>
References: <20211012134148.6280-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v6 0/2] tools/xenstore: set resource limits of xenstored"):
> Set some limits for xenstored in order to avoid it being killed by
> OOM killer, or to run out of file descriptors.

It looks like these were overlooked; they should have gone in last
week.

I think this is arguably a bugfix and we have time to fix it if it
causes a problem, and it's only one working day late, so for the
record

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

and I will push these now.

Ian.

