Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685550821B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 09:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308932.524844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4kZ-00058M-6C; Wed, 20 Apr 2022 07:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308932.524844; Wed, 20 Apr 2022 07:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh4kZ-000567-30; Wed, 20 Apr 2022 07:27:43 +0000
Received: by outflank-mailman (input) for mailman id 308932;
 Wed, 20 Apr 2022 07:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=glqv=U6=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1nh4kY-000561-98
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 07:27:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bccc89d-c07b-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 09:27:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5FB0FB81D64;
 Wed, 20 Apr 2022 07:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994ECC385A1;
 Wed, 20 Apr 2022 07:27:37 +0000 (UTC)
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
X-Inumbo-ID: 5bccc89d-c07b-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650439658;
	bh=SOilJc5Vxvp6JDI/sAy8cOGRwLrY6YXHjo9rcXuykR0=;
	h=From:To:Cc:Subject:Date:From;
	b=AAoiVkRoimlgphII5KT74LccxQywDwBG6zlj3n/nXZMKq0h/3hKTni+wRFYiLNliH
	 2wdA6wHLs+hRq1qPEVquhcFlO4hcz5SITkyceaZsdjsApJlKgHZjbSgxVaLFVFdykw
	 u6z5sIfBytOwXvr0D0EYU5yNCJUjmjU+mE7lR6PDFCK4USuNy4j/zm1tqGXBV4TB7q
	 gjPdo0F1ZOq+sLDuVP1+wpxehnvgwVEkcsvXHaK5n2/LxpF6zxFOxH136VUFCiIYEl
	 PIZKaXKJJCPecI+kugX5fY6fOQd5fLCU9p9q5WD9DLwHixBKU2D3Y8ECtq8ALV7s9V
	 5dG7FlOpE15ig==
From: SeongJae Park <sj@kernel.org>
To: jgross@suse.com
Cc: roger.pau@citrix.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	SeongJae Park <sj@kernel.org>
Subject: [PATCH v2] xen-blk{back,front}: Update contact points for buffer_squeeze_duration_ms and feature_persistent
Date: Wed, 20 Apr 2022 07:27:34 +0000
Message-Id: <20220420072734.1692-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SeongJae is currently listed as a contact point for some blk{back,front}
features, but he will not work for XEN for a while.  This commit
therefore updates the contact point to his colleague, Maximilian, who is
understanding the context and actively working with the features now.

Signed-off-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---

Changes from v1
(https://lore.kernel.org/xen-devel/20220301144628.2858-1-sj@kernel.org/)
- Add Acked-by from Roger

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
2.25.1


