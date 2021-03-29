Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67F534D226
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 16:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103022.196630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQsb1-0000es-91; Mon, 29 Mar 2021 14:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103022.196630; Mon, 29 Mar 2021 14:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQsb1-0000eR-5V; Mon, 29 Mar 2021 14:10:23 +0000
Received: by outflank-mailman (input) for mailman id 103022;
 Mon, 29 Mar 2021 14:10:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQsaz-0000eE-Mr
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 14:10:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQsaz-0006wq-Lb
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 14:10:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQsaz-0004gQ-Kb
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 14:10:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lQsaw-0001lF-Cc; Mon, 29 Mar 2021 15:10:18 +0100
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=KlRdUK1U4mJ2FB4CumiP+oB77O33dsxlKoyL1MmCPyU=; b=w2fvo70gOvj3xi9NvC3SpUdXNT
	VXlw6x7pL9u+UTxULaj9ckb92g+/ya2dUWplq1fw4W+k3houWVM3U/vltlsAkjpR//mCgcH3EvUqW
	sme5pkKMzq58kl+/LHHyhxV7JJEKrEOqD/WelKq1ux9ecGeFo4HGFH0K1vJh6MlQoriM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24673.57290.133130.448247@mariner.uk.xensource.com>
Date: Mon, 29 Mar 2021 15:10:18 +0100
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org,
    xen-users@lists.xenproject.org
Subject: Xen 4.15 RC5

Xen 4.15 RC5 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.15.0-rc5

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.15.0-rc5/xen-4.15.0-rc5.tar.gz
  https://downloads.xenproject.org/release/xen/4.15.0-rc5/xen-4.15.0-rc5.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org.  When sending bug reports, please CC
relevant maintainers and me (iwj@xenproject.org).

I am hoping that this will be the last RC.  Please send any reports
of serious bugs (or brown paper bag mistakes) quickly, or we may have
to release without the fix.

Thanks,
Ian.


