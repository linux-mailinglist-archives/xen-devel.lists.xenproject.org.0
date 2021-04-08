Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBFB3583F3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107319.205172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUEZ-0000Q5-22; Thu, 08 Apr 2021 12:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107319.205172; Thu, 08 Apr 2021 12:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUEY-0000Pe-Uh; Thu, 08 Apr 2021 12:58:06 +0000
Received: by outflank-mailman (input) for mailman id 107319;
 Thu, 08 Apr 2021 12:58:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4S9a=JF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lUUEX-0000PL-AQ
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:58:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3ae8c83-6cc3-4770-b3b9-d83d2cf0ed67;
 Thu, 08 Apr 2021 12:58:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F76BB090;
 Thu,  8 Apr 2021 12:58:03 +0000 (UTC)
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
X-Inumbo-ID: f3ae8c83-6cc3-4770-b3b9-d83d2cf0ed67
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617886683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TqghwaaYRYpQbMhMFBCSGcBVtH+mAsUxmtB7aViM5hQ=;
	b=ke3lNRZUQtKPy0UrCcjptbdoMpgIJjXWRetXsHEZwjXv2s4iEy3a+4rpfZteWj5NGu7GPz
	R380XKzD+BhjKUjBpw8ENYSVzILLClTsjmpGDyEyo+qg2eWY19rGo3BFhe6aGPZDLZechJ
	zZFVbZH560S8lMz4vwIvi9eXSofWLQ8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: add myself as hypfs maintainer
Date: Thu,  8 Apr 2021 14:58:00 +0200
Message-Id: <20210408125800.757-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As I have contributed all the code for hypfs, it would be natural to
be the maintainer.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a7fa8717e..d46b08a0d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -308,6 +308,15 @@ M:     Nick Rosbrook <rosbrookn@ainfosec.com>
 S:	Maintained
 F:	tools/golang
 
+HYPFS
+M:	Juergen Gross <jgross@suse.com>
+S:	Supported
+F:	tools/include/xenhypfs.h
+F:	tools/libs/hypfs/
+F:	tools/misc/xenhypfs.c
+F:	xen/common/hypfs.c
+F:	xen/include/xen/hypfs.h
+
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
 R:	Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
 S:	Odd Fixes
-- 
2.26.2


