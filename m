Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E514C8E2C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281590.479989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3m2-0004v6-D2; Tue, 01 Mar 2022 14:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281590.479989; Tue, 01 Mar 2022 14:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3m2-0004sY-9g; Tue, 01 Mar 2022 14:46:46 +0000
Received: by outflank-mailman (input) for mailman id 281590;
 Tue, 01 Mar 2022 14:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mX9w=TM=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1nP3m0-0004sQ-Dh
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:46:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67bc262b-996e-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:46:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41F3461602;
 Tue,  1 Mar 2022 14:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140F8C340F0;
 Tue,  1 Mar 2022 14:46:39 +0000 (UTC)
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
X-Inumbo-ID: 67bc262b-996e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646145999;
	bh=XuPfbJ5gyWV/sNDbzNt2QVmxD4bkkTRFvCQ8bl7OriU=;
	h=From:To:Cc:Subject:Date:From;
	b=K1iG7/KtxI8qmv6YXuSrkbTtoXNkYG7uLI00ux8Mcf5KqeJKyaZJT7hbh5iedi3TQ
	 dQU7yl7Gl+vmbbyoSH2DOPc7mXMkA7fkcZYAmTkDaGXUwdn39QDpMrxmVUn0OUpLiL
	 SUFPYvGqYxuiKALMvfeRGEPa8QWfqPDqLpd0F5MBoFtu/Jc9k93IjVRjJHSMsZh1LX
	 lZXknFTSjrfvvd2/ZEQWdtFPo/AeZ4LOGqIXMtn7HDrH5uixCv6Lsc2RRcqK4iFogc
	 C+DW5bWRvlySFZMxHRnZkX/+LrUBo6C6hBmeKxtN87LmIDiYmllCEUDlTaeo9uXBGU
	 CPnBn6e9oIkPw==
From: SeongJae Park <sj@kernel.org>
To: roger.pau@citrix.com,
	jgross@suse.com
Cc: mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	SeongJae Park <sj@kernel.org>
Subject: [PATCH] xen-blk{back,front}: Update contact points for buffer_squeeze_duration_ms and feature_persistent
Date: Tue,  1 Mar 2022 14:46:28 +0000
Message-Id: <20220301144628.2858-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1

SeongJae is currently listed as a contact point for some blk{back,front}
features, but he will not work for XEN for a while.  This commit
therefore updates the contact point to his colleague, Maximilian, who is
understanding the context and actively working with the features now.

Signed-off-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
---
 Documentation/ABI/testing/sysfs-driver-xen-blkback  | 4 ++--
 Documentation/ABI/testing/sysfs-driver-xen-blkfront | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
index a74dfe52dd76..7faf719af165 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
@@ -29,7 +29,7 @@ Description:
 What:           /sys/module/xen_blkback/parameters/buffer_squeeze_duration_ms
 Date:           December 2019
 KernelVersion:  5.6
-Contact:        SeongJae Park <sj@kernel.org>
+Contact:        Maximilian Heyne <mheyne@amazon.de>
 Description:
                 When memory pressure is reported to blkback this option
                 controls the duration in milliseconds that blkback will not
@@ -39,7 +39,7 @@ Description:
 What:           /sys/module/xen_blkback/parameters/feature_persistent
 Date:           September 2020
 KernelVersion:  5.10
-Contact:        SeongJae Park <sj@kernel.org>
+Contact:        Maximilian Heyne <mheyne@amazon.de>
 Description:
                 Whether to enable the persistent grants feature or not.  Note
                 that this option only takes effect on newly created backends.
diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkfront b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
index 61fd173fabfe..7f646c58832e 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkfront
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
@@ -12,7 +12,7 @@ Description:
 What:           /sys/module/xen_blkfront/parameters/feature_persistent
 Date:           September 2020
 KernelVersion:  5.10
-Contact:        SeongJae Park <sj@kernel.org>
+Contact:        Maximilian Heyne <mheyne@amazon.de>
 Description:
                 Whether to enable the persistent grants feature or not.  Note
                 that this option only takes effect on newly created frontends.
-- 
2.17.1


