Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A06CA1EC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 13:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515177.797889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkaH-00037f-W5; Mon, 27 Mar 2023 11:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515177.797889; Mon, 27 Mar 2023 11:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkaH-0002me-3P; Mon, 27 Mar 2023 11:00:17 +0000
Received: by outflank-mailman (input) for mailman id 515177;
 Mon, 27 Mar 2023 11:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K09h=7T=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pgkaB-0007YG-Tp
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 11:00:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8b464a39-cc8e-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 13:00:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9954B3;
 Mon, 27 Mar 2023 04:00:55 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57DC23F663;
 Mon, 27 Mar 2023 04:00:10 -0700 (PDT)
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
X-Inumbo-ID: 8b464a39-cc8e-11ed-85db-49a42c6b2330
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v4 12/12] xen/changelog: Add SVE and "dom0" options to the changelog for Arm
Date: Mon, 27 Mar 2023 11:59:44 +0100
Message-Id: <20230327105944.1360856-13-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327105944.1360856-1-luca.fancellu@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arm now can use the "dom0=" Xen command line option and the support
for guests running SVE instructions is added, put entries in the
changelog.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Change from v3:
 - new patch
---
 CHANGELOG.md | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c978cfd9b68f..a24951603359 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
+### Changed
+- The "dom0" option is now supported on Arm and "sve=" sub-option can be used
+  to enable dom0 guest to use SVE/SVE2 instructions.
+
 ### Added
  - On x86, support for features new in Intel Sapphire Rapids CPUs:
    - PKS (Protection Key Supervisor) available to HVM/PVH guests.
@@ -14,6 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
      wide impact of a guest misusing atomic instructions.
  - xl/libxl can customize SMBIOS strings for HVM guests.
+ - On Arm, Xen supports guests running SVE/SVE2 instructions.
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
-- 
2.34.1


