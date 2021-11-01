Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E652A441B69
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 14:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219167.379853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhWuH-0007e8-0S; Mon, 01 Nov 2021 12:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219167.379853; Mon, 01 Nov 2021 12:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhWuG-0007bz-TM; Mon, 01 Nov 2021 12:59:20 +0000
Received: by outflank-mailman (input) for mailman id 219167;
 Mon, 01 Nov 2021 12:59:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhWuF-0007bm-M7
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 12:59:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhWuF-0007wU-LD
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 12:59:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhWuF-000883-KM
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 12:59:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhWuC-0006aW-3C; Mon, 01 Nov 2021 12:59:16 +0000
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
	bh=v2hzg/5bS25hjOlv+bq6tQc6rR27EcPpfgBX018oS6Q=; b=r+fEGK5UqvPituuMZgSh60g9Tz
	nJAL06gbiqIG3EyI0dvGQoKL2qsj8nU/+UesCF/VG/PS32o7jX7BNY2Nfri5rjNw+7V5am6wQBIyo
	qEkR5fHyRBNg1VcUmHpMo0B9I47s2IeHDrTAbuT9ycVSjj+fw5wLP4Yz1iWvwpgCn1aw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24959.58531.558578.875307@mariner.uk.xensource.com>
Date: Mon, 1 Nov 2021 12:59:15 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org
Subject: Xen 4.16 RC1

Xen 4.16 RC1 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.16.0-rc1

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.16.0-rc1/xen-4.16.0-rc1.tar.gz
  https://downloads.xenproject.org/release/xen/4.16.0-rc1/xen-4.16.0-rc1.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org.  When sending bug reports, please CC
relevant maintainers and me (iwj@xenproject.org).

Ian.
Xen 4.16 Release Manager

