Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F617D80C9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623676.971754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxff-0006jH-MI; Thu, 26 Oct 2023 10:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623676.971754; Thu, 26 Oct 2023 10:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxff-0006gp-Fp; Thu, 26 Oct 2023 10:32:59 +0000
Received: by outflank-mailman (input) for mailman id 623676;
 Thu, 26 Oct 2023 10:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oycl=GI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qvxfe-0006fs-5m
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 10:32:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 060cdd26-73eb-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 12:32:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4911C2F4;
 Thu, 26 Oct 2023 03:33:36 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96C713F738;
 Thu, 26 Oct 2023 03:32:53 -0700 (PDT)
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
X-Inumbo-ID: 060cdd26-73eb-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [for-4.19 PATCH 0/2] Generalise exclude-list.json for other users
Date: Thu, 26 Oct 2023 11:32:41 +0100
Message-Id: <20231026103243.2077516-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie is generalising the exclude-list.json so that it can be used by
multiple checkers that might want to have a list of excluded files to be removed
from their computation.

Luca Fancellu (2):
  cppcheck: rework exclusion_file_list.py code
  exclude-list: generalise exclude-list

 docs/misra/exclude-list.rst                   | 31 ++++++++-----
 xen/scripts/xen_analysis/cppcheck_analysis.py |  6 +--
 .../xen_analysis/exclusion_file_list.py       | 45 ++++++++++++-------
 3 files changed, 51 insertions(+), 31 deletions(-)

-- 
2.34.1


