Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB9265FAD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:40:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiM7-0006jN-NC; Fri, 11 Sep 2020 12:40:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiM6-0006gu-EI
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:40:42 +0000
X-Inumbo-ID: 5bcef08e-e4f2-46ab-8753-7d71eb5f71d1
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bcef08e-e4f2-46ab-8753-7d71eb5f71d1;
 Fri, 11 Sep 2020 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F/qlRhZFUxwGusOfRvbWddJnOBDBsp3E2p6n6Sk+5gg=;
 b=N19UTtrji+LSW1kzBTdg/S+Y8jh/wjLrrQWKBsEWEBg40GvAzDqyjFNX
 HAm8Sg8lkE0h6X1sfwGP9Dn09oOzh6/8BwjzQ4uOrEyTgRljKJw0hUyvV
 qHTEOFty7MAd/6PwYy9ZikiAf54En1uKyizacH0ySrglVEr5huo39vGn0 U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RmZvlCYHFIMYpqyj7isFeaEcT/l0zKHOJrPWDi0XxF2JE3LZnzmpuM/aXbJT0ttb8bb5mj5Bq3
 t09BmAIJytxXG5x7k2GegEvrIGZ5JYdcMjLTBhuRpEO+XKbpEQKGEUetxMJ/HCdSr2lv1CXtmF
 REKn4722Rk9TGtb7WqMGbD0dsIF2enFqogZkB9wBg4oUQjaIfnvE3oOkARkKEz1CJKTJuEim1n
 K5utrIOSP/wjgYuYweHieCptMp7/WZqwk7bzm9jtF0sMMbAL9RnkCDyo+h61VieqDyk6QjbLCK
 etA=
X-SBRS: 2.7
X-MesageID: 26476154
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26476154"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 2/8] Move docs into source directory, rename to rst
Date: Fri, 11 Sep 2020 13:40:03 +0100
Message-ID: <20200911124009.3760032-3-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911124009.3760032-1-george.dunlap@citrix.com>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

---
 code-of-conduct.md => source/code-of-conduct.md               | 0
 code-review-guide.md => source/code-review-guide.md           | 0
 communication-guide.md => source/communication-guide.md       | 0
 communication-practice.md => source/communication-practice.md | 0
 source/index.rst                                              | 1 -
 resolving-disagreement.md => source/resolving-disagreement.md | 0
 6 files changed, 1 deletion(-)
 rename code-of-conduct.md => source/code-of-conduct.md (100%)
 rename code-review-guide.md => source/code-review-guide.md (100%)
 rename communication-guide.md => source/communication-guide.md (100%)
 rename communication-practice.md => source/communication-practice.md (100%)
 rename resolving-disagreement.md => source/resolving-disagreement.md (100%)

diff --git a/code-of-conduct.md b/source/code-of-conduct.md
similarity index 100%
rename from code-of-conduct.md
rename to source/code-of-conduct.md
diff --git a/code-review-guide.md b/source/code-review-guide.md
similarity index 100%
rename from code-review-guide.md
rename to source/code-review-guide.md
diff --git a/communication-guide.md b/source/communication-guide.md
similarity index 100%
rename from communication-guide.md
rename to source/communication-guide.md
diff --git a/communication-practice.md b/source/communication-practice.md
similarity index 100%
rename from communication-practice.md
rename to source/communication-practice.md
diff --git a/source/index.rst b/source/index.rst
index 63f76f0..99cb386 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -11,7 +11,6 @@ Welcome to XenProject Governance's documentation!
    :caption: Contents:
 
 
-
 Indices and tables
 ==================
 
diff --git a/resolving-disagreement.md b/source/resolving-disagreement.md
similarity index 100%
rename from resolving-disagreement.md
rename to source/resolving-disagreement.md
-- 
2.24.3 (Apple Git-128)


