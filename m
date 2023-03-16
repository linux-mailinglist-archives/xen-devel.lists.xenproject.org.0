Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49606BCA77
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510407.788017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjf8-00071o-K1; Thu, 16 Mar 2023 09:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510407.788017; Thu, 16 Mar 2023 09:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjf8-0006zW-Gw; Thu, 16 Mar 2023 09:12:42 +0000
Received: by outflank-mailman (input) for mailman id 510407;
 Thu, 16 Mar 2023 09:12:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwUl=7I=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pcjf7-0006zO-CM
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:12:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b3a8e691-c3da-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 10:12:40 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B2DF2F4;
 Thu, 16 Mar 2023 02:13:23 -0700 (PDT)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8B7F3F67D;
 Thu, 16 Mar 2023 02:12:37 -0700 (PDT)
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
X-Inumbo-ID: b3a8e691-c3da-11ed-87f5-c1b5be75604c
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 0/2] automation: introduce static heap and shared memory tests
Date: Thu, 16 Mar 2023 09:12:22 +0000
Message-Id: <20230316091224.338620-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series introduces test jobs for static heap and shared memory.

Changes from v1:
 - Change MEMORY_END to 0x50000000 for all test cases.
 - Update commit message.
 - Move the second domU creation to the general ImageBuilder script

Jiamei Xie (1):
  automation: arm64: Create test jobs for testing static heap on qemu

jiamei.xie (1):
  automation: arm64: Create test jobs for testing static shared memory
    on qemu

 automation/gitlab-ci/build.yaml               | 18 +++++++
 automation/gitlab-ci/test.yaml                | 32 ++++++++++++
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 50 ++++++++++++++++++-
 3 files changed, 99 insertions(+), 1 deletion(-)



-- 
2.25.1


