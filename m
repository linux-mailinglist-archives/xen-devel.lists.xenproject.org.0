Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774686A7A99
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 05:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504302.776930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXaoU-0004D3-Lh; Thu, 02 Mar 2023 04:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504302.776930; Thu, 02 Mar 2023 04:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXaoU-0004AW-Iv; Thu, 02 Mar 2023 04:45:06 +0000
Received: by outflank-mailman (input) for mailman id 504302;
 Thu, 02 Mar 2023 04:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UARn=62=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pXaoT-0004AQ-0V
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 04:45:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fc0bbd12-b8b4-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 05:44:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA11C1FB;
 Wed,  1 Mar 2023 20:45:40 -0800 (PST)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D9583F99C;
 Wed,  1 Mar 2023 20:44:55 -0800 (PST)
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
X-Inumbo-ID: fc0bbd12-b8b4-11ed-a550-8520e6686977
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/2] automation: introduce static heap and shared memory tests
Date: Thu,  2 Mar 2023 04:44:19 +0000
Message-Id: <20230302044421.136068-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series introduces two test jobs:

Jiamei Xie (1):
  automation: arm64: Create a test job for testing static heap on qemu

jiamei.xie (1):
  automation: arm64: Create a test job for testing static shared memory
    on qemu

 automation/gitlab-ci/build.yaml               | 18 +++++++
 automation/gitlab-ci/test.yaml                | 32 +++++++++++++
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 47 +++++++++++++++++++
 3 files changed, 97 insertions(+)

-- 
2.25.1


