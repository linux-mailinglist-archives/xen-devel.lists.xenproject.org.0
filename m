Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8428A751
	for <lists+xen-devel@lfdr.de>; Sun, 11 Oct 2020 14:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5676.14723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRaOU-0004cY-Ny; Sun, 11 Oct 2020 12:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5676.14723; Sun, 11 Oct 2020 12:24:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRaOU-0004c9-KS; Sun, 11 Oct 2020 12:24:06 +0000
Received: by outflank-mailman (input) for mailman id 5676;
 Sun, 11 Oct 2020 12:24:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eyjW=DS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kRaOT-0004c4-SH
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 12:24:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c9317ad-ca78-4b0b-9ba5-02b38c0aedd0;
 Sun, 11 Oct 2020 12:24:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0079ACF5;
 Sun, 11 Oct 2020 12:24:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eyjW=DS=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kRaOT-0004c4-SH
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 12:24:05 +0000
X-Inumbo-ID: 5c9317ad-ca78-4b0b-9ba5-02b38c0aedd0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c9317ad-ca78-4b0b-9ba5-02b38c0aedd0;
	Sun, 11 Oct 2020 12:24:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602419043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tVL4jCgyW5n6HvlNwqjNO0dk/wbT+JIJA5ZDI7IXTso=;
	b=hSew4UKB/u36vrdxedRyuhRRVfNvrkTU/nQI+X5o/9Ee6W9r/5FPqgeZeEqbGXK6cvqkZ1
	z+vYgeGZkIcYI+ZkRoN7QtAONhxEN+NI3z9g5w3g6MdLbbr2aA6lhUg+DkZEL2bVJmrX69
	6moCkOLOj9zjmo+tMyHX47N40UbuxpU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D0079ACF5;
	Sun, 11 Oct 2020 12:24:03 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs/store: add disclaimer to header file regarding ignored options
Date: Sun, 11 Oct 2020 14:24:01 +0200
Message-Id: <20201011122401.28608-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a disclaimer to the libxenstore header file that all of the open
flags (socket only connection, read only connection) are ignored.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/include/xenstore.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/store/include/xenstore.h b/tools/libs/store/include/xenstore.h
index 158e69ef83..2b3f69fb61 100644
--- a/tools/libs/store/include/xenstore.h
+++ b/tools/libs/store/include/xenstore.h
@@ -23,6 +23,7 @@
 
 #define XBT_NULL 0
 
+/* Following open flags are deprecated and ignored! */
 #define XS_OPEN_READONLY	(1UL<<0)
 #define XS_OPEN_SOCKETONLY      (1UL<<1)
 
-- 
2.26.2


