Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B846992F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:39:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239161.414531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muF9D-0001LA-5m; Mon, 06 Dec 2021 14:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239161.414531; Mon, 06 Dec 2021 14:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muF9D-0001JI-2O; Mon, 06 Dec 2021 14:39:19 +0000
Received: by outflank-mailman (input) for mailman id 239161;
 Mon, 06 Dec 2021 14:39:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muF9B-0001J6-B8
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:39:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muF9B-0007Uc-9Y
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:39:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1muF9B-0005GI-8X
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:39:17 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1muF97-0000dr-H1; Mon, 06 Dec 2021 14:39:13 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:Cc:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=EzADy5cG4yhRyR428zJIdhFwA6YiEfSnkAOMkAe5B4U=; b=1GJ7qqYM82UB5xIu9oo4K43AbL
	9Kz+0N6cBPCiK/j7kuLb48fGitQ+pJ4x2xBNAkKvBL1LhGP2EuC8v2JBNc13M4jVGN1gOPyCUA32a
	GNtM+qe8fHYyU7+vSU9YWO36WgivlvfMZ4XX+dMZJ8H+OffMeGMG35H5nKZ6NJ5Wcfk0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25006.8329.278548.571087@mariner.uk.xensource.com>
Date: Mon, 6 Dec 2021 14:39:05 +0000
To: xen-devel@lists.xenproject.org,
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: Resign from my maintainership roles

I am leaving Citrix to go and work for the Tor Project.  My last day
working full-time on Xen will be the 15th of December.  While I won't
be disappearing entirely, I won't have time to do patch review, and
no-one should be waiting for my ack.

Thanks to everyone for your support over the years.  I have really
appreciated working with such good co-maintainers and colleagues.

Thanks,
Ian.

From 608531a0cc34a5bc096ccf585e16f182b5ed83e1 Mon Sep 17 00:00:00 2001
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Mon, 6 Dec 2021 14:34:20 +0000
Subject: [PATCH] MAINTAINERS: Resign from my maintainership roles

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Ian Jackson <ian.jackson@citrix.com>
---
 MAINTAINERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 136f51ad5c..e43dc0edce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -256,7 +256,6 @@ S:	Supported
 F:	xen/drivers/passthrough/arm/smmu-v3.c
 
 Change Log
-M:	Ian Jackson <iwj@xenproject.org>
 R:	Community Manager <community.manager@xenproject.org>
 S:	Maintained
 F:	CHANGELOG.md
@@ -375,7 +374,6 @@ F:	xen/arch/x86/machine_kexec.c
 F:	xen/arch/x86/x86_64/kexec_reloc.S
 
 LIBS
-M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 R:	Juergen Gross <jgross@suse.com>
 S:	Supported
@@ -396,7 +394,6 @@ F:	tools/include/xentoollog.h
 F:	tools/libs/
 
 LIBXENLIGHT
-M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
 S:	Supported
@@ -458,7 +455,6 @@ S:	Supported
 F:	tools/python
 
 QEMU-DM
-M:	Ian Jackson <iwj@xenproject.org>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
 
@@ -517,7 +513,6 @@ F:	xen/arch/arm/tee/
 F:	xen/include/asm-arm/tee
 
 TOOLSTACK
-M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 S:	Supported
 F:	autogen.sh
@@ -639,7 +634,6 @@ F:	xen/include/asm-x86/guest/hyperv-tlfs.h
 F:	xen/include/asm-x86/hvm/viridian.h
 
 XENSTORE
-M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 M:	Juergen Gross <jgross@suse.com>
 R:	Julien Grall <julien@xen.org>
@@ -665,7 +659,6 @@ F:	docs/misc/xsm-flask.txt
 THE REST
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
 M:	George Dunlap <george.dunlap@citrix.com>
-M:	Ian Jackson <iwj@xenproject.org>
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Julien Grall <julien@xen.org>
 M:	Stefano Stabellini <sstabellini@kernel.org>
-- 
2.20.1


