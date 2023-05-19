Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3C709311
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536850.835560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwRW-0003If-35; Fri, 19 May 2023 09:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536850.835560; Fri, 19 May 2023 09:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwRW-0003C7-0K; Fri, 19 May 2023 09:30:34 +0000
Received: by outflank-mailman (input) for mailman id 536850;
 Fri, 19 May 2023 09:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pzwRV-00038h-2N
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:30:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id cb94a9ea-f627-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 11:30:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417D11FB;
 Fri, 19 May 2023 02:31:14 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 256453F73F;
 Fri, 19 May 2023 02:30:28 -0700 (PDT)
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
X-Inumbo-ID: cb94a9ea-f627-11ed-8611-37d641c3527e
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
Subject: [PATCH 0/3] Fix and improvements to xen-analysis.py - Pt.2
Date: Fri, 19 May 2023 10:30:16 +0100
Message-Id: <20230519093019.2131896-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie includes one improvement suggested by Andrew Cooper, and two bug fix
for the xen-analysis.py tool.

Luca Fancellu (3):
  xen/misra: xen-analysis.py: Improve the cppcheck version check
  xen/misra: xen-analysis.py: Fix latent bug
  xen/misra: xen-analysis.py: Fix cppcheck report relative paths

 xen/scripts/xen_analysis/cppcheck_analysis.py | 13 +++------
 .../xen_analysis/cppcheck_report_utils.py     | 27 +++++++++++++++----
 2 files changed, 26 insertions(+), 14 deletions(-)

-- 
2.34.1


