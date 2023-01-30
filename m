Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FC2680B84
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:02:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486881.754280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMRv4-0000zj-WE; Mon, 30 Jan 2023 11:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486881.754280; Mon, 30 Jan 2023 11:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMRv4-0000xm-S0; Mon, 30 Jan 2023 11:01:50 +0000
Received: by outflank-mailman (input) for mailman id 486881;
 Mon, 30 Jan 2023 11:01:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtRO=53=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pMRv3-0000xa-K1
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:01:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7c407a3f-a08d-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 12:01:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E929316F2;
 Mon, 30 Jan 2023 03:02:26 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1FCF3F71E;
 Mon, 30 Jan 2023 03:01:43 -0800 (PST)
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
X-Inumbo-ID: 7c407a3f-a08d-11ed-b8d1-410ff93cb8f0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] Cppcheck MISRA analysis improvements
Date: Mon, 30 Jan 2023 11:01:30 +0000
Message-Id: <20230130110132.2774782-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie is adding a way to skip the check for some rules that the Xen project
has agreed to follow, this is because cppcheck reports too many false-positive
on some rules and it would be easier in a first phase to skip the check on them
and allow the tool to be mature enough before using it on the specific rules.

The serie includes also an improvement for the cppcheck report.

Luca Fancellu (2):
  xen/cppcheck: sort alphabetically cppcheck report entries
  xen/cppcheck: add parameter to skip given MISRA rules

 xen/scripts/xen_analysis/cppcheck_analysis.py |  8 +++--
 .../xen_analysis/cppcheck_report_utils.py     |  7 ++++
 xen/scripts/xen_analysis/settings.py          | 35 +++++++++++--------
 xen/tools/convert_misra_doc.py                | 28 ++++++++++-----
 4 files changed, 53 insertions(+), 25 deletions(-)

-- 
2.25.1


