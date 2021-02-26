Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA83261B6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 12:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90237.170778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFatb-0004t7-So; Fri, 26 Feb 2021 11:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90237.170778; Fri, 26 Feb 2021 11:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFatb-0004si-Pc; Fri, 26 Feb 2021 11:02:55 +0000
Received: by outflank-mailman (input) for mailman id 90237;
 Fri, 26 Feb 2021 11:02:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFatZ-0004sd-Vr
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 11:02:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e6dc666-694f-4581-8b99-22baa0e9fbc2;
 Fri, 26 Feb 2021 11:02:52 +0000 (UTC)
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
X-Inumbo-ID: 9e6dc666-694f-4581-8b99-22baa0e9fbc2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614337372;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=jWNWv9ZWxp5MxdNi+omfIDs1XJ19WhHHHl6Ktv2lyDw=;
  b=FsFxJfFXLJaW5nzxxLOO0WtPTCTOZIr9l69P1xaAwdcNP93QQqwNywxZ
   JXZi5MyTMfKgUwj6R+itdPvYZWj5Byj4t5+XcSqe6aZ/YBLTsHRdefJf9
   K3BtJlhNu5UGQZLQ6JFCBt4c6qZYRgoSXc4/uzsarfJ241HPrDnifz74Z
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IDhMIlL0wXLN/4l8nk39DDobQVsAXzdgGqgXTB1flrPcbJj1p4NekC2N1bQlZxHBY8MNhDfv2l
 dRNIRGr/aLUWmz3Kyb1mOQdnokG1apr0COy8CK5Yd7fVfoKkdSu3g4Zkyj8mIlzSGh5CWdfThr
 Teec625v7ZKTSY6dnaLFk3WowuLn0L7MofODyaWkXBqkSJ4Gk80cKy8sE/tS2dXUEtTT2vieYH
 TmYvlsX7QTFM45lkwL8sRbllXWm4DT7CN/ZDWQZuzJFh3wO43wwdwzqWvpsnBYgsToQVRctu4t
 Q2Q=
X-SBRS: 5.2
X-MesageID: 38090888
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38090888"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH for-4.15] automation: Fix the Alpine clang builds to use clang
Date: Fri, 26 Feb 2021 11:02:33 +0000
Message-ID: <20210226110233.27991-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Looks like a copy&paste error.

Fixes: f6e1d8515d7 ("automation: add alpine linux x86 build jobs")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/gitlab-ci/build.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d00b8a5123..23ab81d892 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -443,13 +443,13 @@ alpine-3.12-gcc-debug:
   allow_failure: true
 
 alpine-3.12-clang:
-  extends: .gcc-x86-64-build
+  extends: .clang-x86-64-build
   variables:
     CONTAINER: alpine:3.12
   allow_failure: true
 
 alpine-3.12-clang-debug:
-  extends: .gcc-x86-64-build-debug
+  extends: .clang-x86-64-build-debug
   variables:
     CONTAINER: alpine:3.12
   allow_failure: true
-- 
2.11.0


