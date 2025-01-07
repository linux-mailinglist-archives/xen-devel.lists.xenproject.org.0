Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04CAA03A8D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:03:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866149.1277425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5U7-0000l7-5a; Tue, 07 Jan 2025 09:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866149.1277425; Tue, 07 Jan 2025 09:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5U7-0000j0-2D; Tue, 07 Jan 2025 09:02:47 +0000
Received: by outflank-mailman (input) for mailman id 866149;
 Tue, 07 Jan 2025 09:02:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoyV=T7=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1tV5U5-0000iu-PA
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:02:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 278f354b-ccd6-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 10:02:43 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E904213D5;
 Tue,  7 Jan 2025 01:03:10 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.93.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 472493F66E;
 Tue,  7 Jan 2025 01:02:41 -0800 (PST)
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
X-Inumbo-ID: 278f354b-ccd6-11ef-99a4-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] xen/arm: ffa: add changelog entries for FF-A improvements
Date: Tue,  7 Jan 2025 10:02:18 +0100
Message-ID: <059ad52a5d2aa6fb7fabe44fe2a99d8b73c1b907.1736240334.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a CHANGELOG entry for release 4.20 to mention the various
improvements and fixes that have been done in the FF-A support since
4.19 release.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8507e6556a56..d58a2ffd130b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,6 +22,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
      forwarding the calls to EL3 FW if coming from hwdom.
    - Support for LLC (Last Level Cache) coloring.
+   - Several FF-A support improvements: add indirect messages support, transmit
+     RXTX buffer to the SPMC, fix version negotication and partition
+     information retrieval.
  - On x86:
    - xl suspend/resume subcommands.
 
-- 
2.47.1


