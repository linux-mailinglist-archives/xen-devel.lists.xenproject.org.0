Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566DD449B5A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 19:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223558.386328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk8z4-00007g-Cn; Mon, 08 Nov 2021 18:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223558.386328; Mon, 08 Nov 2021 18:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk8z4-0008W0-92; Mon, 08 Nov 2021 18:03:06 +0000
Received: by outflank-mailman (input) for mailman id 223558;
 Mon, 08 Nov 2021 18:03:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk8z2-0008Vl-U3
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 18:03:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk8z2-0001mp-TD
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 18:03:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk8z2-0004co-SR
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 18:03:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mk8yz-00027Y-HR; Mon, 08 Nov 2021 18:03:01 +0000
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
	bh=ZgoUNxO6SXw+QorgimiABpb/NXnEG9d6Z6dWbsU5fZ8=; b=aYJFU3f2BDQxCAlFDwStsEfdmd
	IKgrXcVMbzCEqiHycZ8Ji9yQ2AIBKbFe0KoO6UoROiqgizsHlE3R7HHuMYuHaUOcTdIPvKfpMpiHG
	rxOi10raFQguBMvvQWQSK/ao00excfd9fHoHbRTLXyfTIJQHOqE5LIAMDHX4ncTFhorE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24969.26196.495605.132931@mariner.uk.xensource.com>
Date: Mon, 8 Nov 2021 18:03:00 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org
Subject: Xen 4.16 RC2

Xen 4.16 RC2 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.16.0-rc2

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.16.0-rc2/xen-4.16.0-rc2.tar.gz
  https://downloads.xenproject.org/release/xen/4.16.0-rc2/xen-4.16.0-rc2.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org.  When sending bug reports, please CC
relevant maintainers and me (iwj@xenproject.org).

Ian.
Xen 4.16 Release Manager

