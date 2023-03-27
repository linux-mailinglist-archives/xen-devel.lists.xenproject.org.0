Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA866CADC2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 20:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515410.798237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqW-0007cr-8i; Mon, 27 Mar 2023 18:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515410.798237; Mon, 27 Mar 2023 18:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqW-0007aT-5d; Mon, 27 Mar 2023 18:45:32 +0000
Received: by outflank-mailman (input) for mailman id 515410;
 Mon, 27 Mar 2023 18:45:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgrqU-0007aN-UU
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 18:45:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqU-0004ON-KK; Mon, 27 Mar 2023 18:45:30 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqU-00044j-CJ; Mon, 27 Mar 2023 18:45:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=2ey7kqBxZP5zNWSxhGX1+zDIiWebvhkGl+Uz54kj/XM=; b=3MF7CP+MRrcEEjqvk9kLe7S/4E
	6F6O5t8ND1S3gECny0NRMVMuZl+/IvI5wqnjtG27ILd7h/lYS1NY9Eh6Ma0dce4C2/hSKGxwlAL3g
	xYXZIPxOZfxSGB4UOlKwjgp1jDMy4gNe/xldn3owGqq5zr9ljALPQIO9c1UftinecTkA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/7] LICENSES: Clarify that the SPDX tag GPL-2.0 is deprecated
Date: Mon, 27 Mar 2023 19:45:14 +0100
Message-Id: <20230327184520.81828-2-julien@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327184520.81828-1-julien@xen.org>
References: <20230327184520.81828-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

From https://spdx.org/licenses/GPL-2.0.html, the SPDX tag GPL-2.0
is deprecated. Instead, GPL-2.0-only should be used.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Patch added
---
 LICENSES/GPL-2.0 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
index ff0812fd89cc..9f09528a8bce 100644
--- a/LICENSES/GPL-2.0
+++ b/LICENSES/GPL-2.0
@@ -8,9 +8,9 @@ Usage-Guide:
   tag/value pairs into a comment according to the placement
   guidelines in the licensing rules documentation.
   For 'GNU General Public License (GPL) version 2 only' use:
-    SPDX-License-Identifier: GPL-2.0
-  or
     SPDX-License-Identifier: GPL-2.0-only
+  or (now deprecated)
+    SPDX-License-Identifier: GPL-2.0
   For 'GNU General Public License (GPL) version 2 or any later version' use:
     SPDX-License-Identifier: GPL-2.0+
   or
-- 
2.39.2


