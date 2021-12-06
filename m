Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E3469F91
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239306.414778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGEJ-0004cH-Jf; Mon, 06 Dec 2021 15:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239306.414778; Mon, 06 Dec 2021 15:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGEJ-0004aH-FY; Mon, 06 Dec 2021 15:48:39 +0000
Received: by outflank-mailman (input) for mailman id 239306;
 Mon, 06 Dec 2021 15:48:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muGEH-0004aB-Qe
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:48:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muGEH-0000Nw-Pb
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:48:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muGEH-0003hD-Oa
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:48:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1muGEB-0000y1-5c; Mon, 06 Dec 2021 15:48:31 +0000
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
	bh=HTFMcRpkPvbbZQwmTP1v/lYud0gS38QzmjK5LvTmuzw=; b=hXVrkuWi7fcsj7QLJc1iqfP+if
	wDhypv7yR4qNaCnsO4/ETdu/+0PJddH1EEo5V+dAsfCJRvJpRDOWZnFc6ax/raQ16JXX9xs5HcBiD
	AXdIwnuZSXtAvJghgWELfgWicVu387qgJk2vJw6ukHzY0AGBMvs1H17eV+Kpsx3E984g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25006.12472.636170.668786@mariner.uk.xensource.com>
Date: Mon, 6 Dec 2021 15:48:08 +0000
To: xen-devel@lists.xenproject.org,
CC: committers@xenproject.org,
    Jan Beulich <jbeulich@suse.com>
Subject: Xen staging-4.16 branch now open
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Xen 4.16 is released"):
> Xen 4.16, the product of 9 months' work by the Xen Project community,
> is now released.

I have now done the administrivia to staging-4.16 and it is open for
backports according to the usual protocol.

Ian.

