Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFF1347BCA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 16:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101041.192913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP59B-0007B9-LQ; Wed, 24 Mar 2021 15:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101041.192913; Wed, 24 Mar 2021 15:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP59B-0007Ai-IE; Wed, 24 Mar 2021 15:10:13 +0000
Received: by outflank-mailman (input) for mailman id 101041;
 Wed, 24 Mar 2021 15:10:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP59A-0007Ad-5C
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 15:10:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP59A-0003SH-2W
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 15:10:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lP59A-0004kZ-0l
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 15:10:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lP596-0005JM-Oe; Wed, 24 Mar 2021 15:10:08 +0000
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
	bh=vOKPkQ3EO4YBVmANwGHqZ4te15u5DiLPNnC+8ZaHj5g=; b=o6OaSvbMb0JGCPSg313k4KhMEl
	0/IkA8lZs7XKijrhk9264SxPaXgdQh7vUQ2w48M/H0w9miq+mkuw3C/8ihe4knqmAThQXEIuBiO/5
	P8V89lVAtbhDgOOAtQDcH5r6Iqofz43eiNWkzgVsnwmlyNKBXRAyIP5CLZycBQWmIs6M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24667.22096.470958.627753@mariner.uk.xensource.com>
Date: Wed, 24 Mar 2021 15:10:08 +0000
To: committers@xenproject.org
CC: xen-devel@lists.xenproject.org
Subject: Commit moratorium for branching
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Please do not push any commits to xen.git#staging, corresponding
qemu branches, etc.

I'm going to make the 4.15 branch etc.  I will let you know when I'm
done.

Ian.

