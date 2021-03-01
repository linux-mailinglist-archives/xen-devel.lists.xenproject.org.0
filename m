Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5BC328142
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 15:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91562.172997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGjq3-0006sE-Qw; Mon, 01 Mar 2021 14:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91562.172997; Mon, 01 Mar 2021 14:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGjq3-0006rr-NB; Mon, 01 Mar 2021 14:47:59 +0000
Received: by outflank-mailman (input) for mailman id 91562;
 Mon, 01 Mar 2021 14:47:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGjq2-0006rc-9w
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 14:47:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGjq2-0001oK-97
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 14:47:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGjq2-0002Ud-5D
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 14:47:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGjpy-0004Y6-7q; Mon, 01 Mar 2021 14:47:54 +0000
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
	bh=M2WkUt006XUcXBS6ZdOOEsbGxq1SqeHeM11823JqgI8=; b=kFRgc5LrT+BP3gRzUXXbt3hJrw
	baC5bWRo0GuB8vdg+SLGBNPZrKPRyRNeYq5mIx2QMpHGddZW4hiGa13Z+sVGJ8oCc33hF2I14i2LM
	erQt4YNkEW7VD1S47UtLU7t2vwGWX4dMSc/tabgecGU9a+OGsPi1d41DC7c4Ph3uYQLg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24636.65178.20011.678957@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 14:47:54 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org,
    xen-users@lists.xenproject.org
Subject: Xen 4.15 RC1
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Xen 4.15 RC1 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.15.0-rc1

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.15.0-rc1/xen-4.15.0-rc1.tar.gz
  https://downloads.xenproject.org/release/xen/4.15.0-rc1/xen-4.15.0-rc1.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org.  When sending bug reports, please CC
relevant maintainers and me (iwj@xenproject.org).

We will have Xen Test Days from RC2 onwards.

Ian.

