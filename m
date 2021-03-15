Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334733B254
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 13:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97985.185792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLm7b-0005Aj-Vt; Mon, 15 Mar 2021 12:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97985.185792; Mon, 15 Mar 2021 12:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLm7b-0005AJ-Sj; Mon, 15 Mar 2021 12:14:55 +0000
Received: by outflank-mailman (input) for mailman id 97985;
 Mon, 15 Mar 2021 12:14:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLm7b-0005A4-01
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:14:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLm7a-0007aN-VT
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:14:54 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLm7a-0006js-US
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:14:54 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lLm7X-0003tJ-Mb; Mon, 15 Mar 2021 12:14:51 +0000
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
	bh=USBbzM/XOaBEpC7riV/wEGY0P7yozameGwecBSEVX2s=; b=uaCngqlBRqSfqWbY+m77sKuYOY
	oZnA3w+FmAN0o3pvSYYTG4mAKzqox7XeGUnphzDSki+jq8AZlnJeM7v3MvnyU61K0EFanCBTFhUpI
	o9j2K3YKVt95V6273tMyPZzz1e3aJaKIvae+MRy9Sd2sxIcXjxnOiVB2mI5IHIOuEYgc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24655.20411.433579.576842@mariner.uk.xensource.com>
Date: Mon, 15 Mar 2021 12:14:51 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org,
    xen-users@lists.xenproject.org
Subject: Xen 4.15 RC3

Xen 4.15 RC3 is now available.

It is available from git:
  git clone https://xenbits.xenproject.org/git-http/xen.git -b 4.15.0-rc3

For your convenience a tarball is available:
  https://downloads.xenproject.org/release/xen/4.15.0-rc3/xen-4.15.0-rc3.tar.gz
  https://downloads.xenproject.org/release/xen/4.15.0-rc3/xen-4.15.0-rc3.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org.  When sending bug reports, please CC
relevant maintainers and me (iwj@xenproject.org).

I will send an update on the state of the release in a moment.

Ian.

