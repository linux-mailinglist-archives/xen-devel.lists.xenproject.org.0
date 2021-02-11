Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC335318F24
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 16:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83973.157295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAEFO-0003L2-Bt; Thu, 11 Feb 2021 15:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83973.157295; Thu, 11 Feb 2021 15:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAEFO-0003KU-8B; Thu, 11 Feb 2021 15:51:14 +0000
Received: by outflank-mailman (input) for mailman id 83973;
 Thu, 11 Feb 2021 15:51:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzmj=HN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAEFM-0003J1-SD
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 15:51:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c262834-290a-4b06-a34f-4e0815d7ef6b;
 Thu, 11 Feb 2021 15:51:11 +0000 (UTC)
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
X-Inumbo-ID: 0c262834-290a-4b06-a34f-4e0815d7ef6b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613058671;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=rLYuxxztor8oevutfFBEJQJ0xtELagH/8VnRXUr1D2I=;
  b=BSXyALP4zwiBEjup10ktmQ0frkLzWAzQcRzCiXqN0HOFq7srTC0fhrMj
   9xz0FCrmfYH8fp66B5AigU1BJQR3IdApsxthGwLMQqsZSI+s0nG+RRDP6
   +j4TSCuDwIb09gIQ6hyB95+PSGXFLjqFq+bhmqB49pPIzD9UlVrnmWV8n
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8xuRAR5iYxL92VwwJhzBENXoBr9Xxz73PsrQPmQhxbAM2oA/mLyk5oEAoCDElcULoEsepj9Nuf
 Wf8AQVBystYV6Oh9e3SiNLi1mBSaeFREYccxAl3UViNeHg6bFmhtaZXs/f6YQw0ucsDA445IpR
 duAoOR0Ez7zdzZp0fwmy0MWD4zEswxy/zROzrFW0lGQ+1QisNJLjnlpf3XEOHnZNABUpG0eZaU
 pQo6JPdo+x+rNc8Q8BFxtVYVGOFbPVDJBe+YhnS7XkaMYZktbkIACT4g8gljQ7NW0LO10varcP
 zeU=
X-SBRS: 4.0
X-MesageID: 37429781
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,170,1610427600"; 
   d="scan'208";a="37429781"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH for-4.15] automation: Add Ubuntu Focal builds
Date: Thu, 11 Feb 2021 15:50:41 +0000
Message-ID: <20210211155041.4811-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Logical continuation of c/s eb52442d7f "automation: Add Ubuntu:focal
container".

No further changes required.  Everything builds fine.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 automation/gitlab-ci/build.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index db68dd0b69..63258f830e 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -390,6 +390,26 @@ ubuntu-bionic-gcc-debug:
   variables:
     CONTAINER: ubuntu:bionic
 
+focal-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:focal
+
+focal-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:focal
+
+focal-clang:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:focal
+
+focal-clang-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:focal
+
 opensuse-leap-clang:
   extends: .clang-x86-64-build
   variables:
-- 
2.11.0


