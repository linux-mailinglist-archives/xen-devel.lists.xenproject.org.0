Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACDC7577F4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565024.882838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgyy-0000Rg-HG; Tue, 18 Jul 2023 09:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565024.882838; Tue, 18 Jul 2023 09:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgyy-0000Nn-C9; Tue, 18 Jul 2023 09:27:00 +0000
Received: by outflank-mailman (input) for mailman id 565024;
 Tue, 18 Jul 2023 09:26:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UwZh=DE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qLgyx-0000LP-L2
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:26:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3d078aca-254d-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:26:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8683B2F4;
 Tue, 18 Jul 2023 02:27:39 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 667DB3F67D;
 Tue, 18 Jul 2023 02:26:55 -0700 (PDT)
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
X-Inumbo-ID: 3d078aca-254d-11ee-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] diff-report bugfix
Date: Tue, 18 Jul 2023 10:26:34 +0100
Message-Id: <20230718092637.2433974-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie has some bugfix for some issues found on the diff-report.py tool
during usage of its module or by luck by code inspection.

Luca Fancellu (2):
  xen/misra: diff-report.py: Fix UnifiedFormatParser change line
    registration
  xen/misra: diff-report.py: fix function invocation

 xen/scripts/diff-report.py                                | 8 ++++++--
 .../xen_analysis/diff_tool/unified_format_parser.py       | 7 ++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.34.1


