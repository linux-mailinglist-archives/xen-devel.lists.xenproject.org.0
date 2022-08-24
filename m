Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FABD59FDA3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392780.631357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrpK-0004ah-FA; Wed, 24 Aug 2022 14:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392780.631357; Wed, 24 Aug 2022 14:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrpK-0004Yi-BF; Wed, 24 Aug 2022 14:57:54 +0000
Received: by outflank-mailman (input) for mailman id 392780;
 Wed, 24 Aug 2022 14:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1oQrpI-0004Xz-M6
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:57:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1fab54b6-23bd-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 16:57:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E44911FB;
 Wed, 24 Aug 2022 07:57:54 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C9823F67D;
 Wed, 24 Aug 2022 07:57:49 -0700 (PDT)
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
X-Inumbo-ID: 1fab54b6-23bd-11ed-bd2e-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/4] automation: Only filter build-*/ in gitignore
Date: Wed, 24 Aug 2022 15:57:17 +0100
Message-Id: <b51e0e7682cf45e5844de8e0f1ef1593049b6c05.1661352827.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661352827.git.bertrand.marquis@arm.com>
References: <cover.1661352827.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

...because there are some script in automation corresponding to the
build-* filter (build-test.sh and build-each-commit.sh)

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v1:
- instead of removing build-*, replace it by build-*/ (suggested by Jan)
- rename patch accordingly
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index e3fe06cd13ed..27881c976432 100644
--- a/.gitignore
+++ b/.gitignore
@@ -38,13 +38,13 @@ dist
 stubdom/*.tar.gz
 
 autom4te.cache/
+build-*/
 config.log
 config.status
 config.cache
 config/Toplevel.mk
 config/Paths.mk
 
-build-*
 dist/*
 docs/tmp.*
 docs/html/
-- 
2.25.1


