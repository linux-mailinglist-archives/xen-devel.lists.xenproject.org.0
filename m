Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D70441B6F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 14:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219175.379878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhWvI-0000x1-N7; Mon, 01 Nov 2021 13:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219175.379878; Mon, 01 Nov 2021 13:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhWvI-0000td-JF; Mon, 01 Nov 2021 13:00:24 +0000
Received: by outflank-mailman (input) for mailman id 219175;
 Mon, 01 Nov 2021 13:00:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhWvG-0000sb-BN
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 13:00:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhWvG-0007zi-AL
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 13:00:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhWvG-0008Nu-9c
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 13:00:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhWvC-0006b3-Rn; Mon, 01 Nov 2021 13:00:18 +0000
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
	bh=QUSfeyVmwKqBi1vLmtnSOEtzeobt4xuAMIth2HYOjWM=; b=nuCvlR3UfpKWpNJ12M+SeHQ+ZW
	e2HZwdYcUTxRDUkTxw0Gzu1iYpHxe3iDhLSsYZL85yBbRuK3j83KJnTFjhAV2GcrsVwdYMLSZY9hr
	8/p6pvPkxQr5KwOyNyIe+pTk3aFcXTVefGW2WuzNe5ld+7/EJ7SqZAfZe4Shan3ggi0Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24959.58594.341018.18060@mariner.uk.xensource.com>
Date: Mon, 1 Nov 2021 13:00:18 +0000
To: committers@xenproject.org
Cc: xen-devel@lists.xenproject.org
Subject: Xen 4.16 tree status - code freeze
In-Reply-To: <24959.58531.558578.875307@mariner.uk.xensource.com>
References: <24959.58531.558578.875307@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Xen 4.16 RC1"):
> Xen 4.16 RC1 is now available.
> 
> It is available from git:
>   git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.16.0-rc1
> 
> For your convenience a tarball is available:
>   https://downloads.xenproject.org/release/xen/4.16.0-rc1/xen-4.16.0-rc1.tar.gz
>   https://downloads.xenproject.org/release/xen/4.16.0-rc1/xen-4.16.0-rc1.tar.gz.sig
> 
> Please send bug reports and test reports to
> xen-devel@lists.xenproject.org.  When sending bug reports, please CC
> relevant maintainers and me (iwj@xenproject.org).

The commit moratorium is lifted.

However, we are in code freeze.  So all patches to be committed must
have a release-ack.

Thanks,
Ian.

