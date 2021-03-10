Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913AC333FC3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 15:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96080.181563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJzNN-0006NZ-LG; Wed, 10 Mar 2021 13:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96080.181563; Wed, 10 Mar 2021 13:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJzNN-0006N9-ID; Wed, 10 Mar 2021 13:59:49 +0000
Received: by outflank-mailman (input) for mailman id 96080;
 Wed, 10 Mar 2021 13:59:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJzNM-0006Mx-9H
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 13:59:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJzNM-00033P-8V
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 13:59:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJzNM-0006OS-7G
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 13:59:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJzNJ-0006Ma-2W; Wed, 10 Mar 2021 13:59:45 +0000
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
	bh=q8OwsW3WlNB1U1E47WtbBFhdXqcGgmgEv3iFeYC72U4=; b=IjC1H7RbJRt3cKLcgywKOVV4d4
	MF7NzgThabkzAsdJS6oHG1a4VYh8DJCIOsUuupVYS08glWpiP/O3tk4Yl8NQY05I3XVojJvQbFASB
	UQJt0R9/V7/rzB8bJVj5wGO+HB1VcPHIHR2Thd1aAbCLbw7OxdrCxhCj1IknansukNS0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24648.53456.877705.383162@mariner.uk.xensource.com>
Date: Wed, 10 Mar 2021 13:59:44 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org,
    xen-users@lists.xenproject.org
Subject: Xen 4.15 RC2

Xen 4.15 RC2 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.15.0-rc2

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.15.0-rc2/xen-4.15.0-rc2.tar.gz
  https://downloads.xenproject.org/release/xen/4.15.0-rc2/xen-4.15.0-rc2.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org.  When sending bug reports, please CC
relevant maintainers and me (iwj@xenproject.org).

Sorry for the lateness of this RC, which I originally intended to be
available this last Monday.  I hope to resume the schedule with RC3
this coming Monday.

There are still some important fixes and docs changes outstanding.

Ian.

