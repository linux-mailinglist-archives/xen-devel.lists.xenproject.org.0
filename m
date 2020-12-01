Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55C62C9909
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41622.74926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0ul-0004Xj-Uc; Tue, 01 Dec 2020 08:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41622.74926; Tue, 01 Dec 2020 08:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0ul-0004X2-Qj; Tue, 01 Dec 2020 08:21:35 +0000
Received: by outflank-mailman (input) for mailman id 41622;
 Tue, 01 Dec 2020 08:21:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0uk-0004VK-E8
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceb36211-fc02-48df-8343-c9d46e54bc3d;
 Tue, 01 Dec 2020 08:21:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FB70AD8A;
 Tue,  1 Dec 2020 08:21:31 +0000 (UTC)
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
X-Inumbo-ID: ceb36211-fc02-48df-8343-c9d46e54bc3d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtGFdMweTBJDc6UpYyzBO+QE6apiq4QvvZ8PlcUPilY=;
	b=fV3iKp6ww6im4i9yanZ1LMMB8Ak9va/BEB82ONP/RQrpk/0g6J4y3TdLmdqhdELhulomiq
	SK0UF0OWf9EsHY+fEBlrvq7LSh/Uu1+7xBcxxBzFF6UBSgfF6k0BgdAfdLGaOnzR+ZV0ZO
	I/jVlJIcQVK3rwtM3cquFV5Lq8eYRO8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 03/17] xen/cpupool: sort included headers in cpupool.c
Date: Tue,  1 Dec 2020 09:21:14 +0100
Message-Id: <20201201082128.15239-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Common style is to include header files in alphabetical order. Sort the
#include statements in cpupool.c accordingly.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/sched/cpupool.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 6429c8f7b5..84f326ea63 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -11,15 +11,15 @@
  * (C) 2009, Juergen Gross, Fujitsu Technology Solutions
  */
 
-#include <xen/lib.h>
-#include <xen/init.h>
+#include <xen/cpu.h>
 #include <xen/cpumask.h>
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/lib.h>
 #include <xen/param.h>
 #include <xen/percpu.h>
 #include <xen/sched.h>
 #include <xen/warning.h>
-#include <xen/keyhandler.h>
-#include <xen/cpu.h>
 
 #include "private.h"
 
-- 
2.26.2


