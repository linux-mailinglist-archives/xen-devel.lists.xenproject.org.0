Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED6445A77C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229711.397230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYY2-0005w3-Ly; Tue, 23 Nov 2021 16:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229711.397230; Tue, 23 Nov 2021 16:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYY2-0005uR-Ga; Tue, 23 Nov 2021 16:21:34 +0000
Received: by outflank-mailman (input) for mailman id 229711;
 Tue, 23 Nov 2021 16:21:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpYY1-0005kB-Hn
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:21:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpYY1-0007SF-Gv
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:21:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpYY1-0005q5-FD
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:21:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mpYXx-0006Oo-KR; Tue, 23 Nov 2021 16:21:29 +0000
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
	bh=nYkTcaFp7raOo29VUM27G7kF5hG5+Ja34tfnmoQX9sg=; b=3Yx7bfdmZvFISNpZOzr6b6+BHK
	6Q4W815SjVOWpR6FLnQgG9zLKpgkInfkz3p4eU7YjDVwiJIUMDzL23PoPvZaDCZjvjmTSp7fwdKsu
	nrmy4j1oXLAVp8TyzNVR7nfWdwOafs+qHUaqksxSZh8+7LlK6ijm9w1NOUejpX7svyKc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24989.5385.105735.243965@mariner.uk.xensource.com>
Date: Tue, 23 Nov 2021 16:21:29 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org
Subject: Xen 4.16 RC4

Xen 4.16 RC4 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.16.0-rc4

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.16.0-rc4/xen-4.16.0-rc4.tar.gz
  https://downloads.xenproject.org/release/xen/4.16.0-rc4/xen-4.16.0-rc4.tar.gz.sig

This may be the last RC before release.

Ian.
Xen 4.16 Release Manager

