Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F156A7A9C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 05:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504322.776960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXapq-0005mE-E3; Thu, 02 Mar 2023 04:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504322.776960; Thu, 02 Mar 2023 04:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXapq-0005k8-AM; Thu, 02 Mar 2023 04:46:30 +0000
Received: by outflank-mailman (input) for mailman id 504322;
 Thu, 02 Mar 2023 04:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UARn=62=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pXapo-0004UF-O3
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 04:46:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3194c8e6-b8b5-11ed-96a9-2f268f93b82a;
 Thu, 02 Mar 2023 05:46:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B27E1FB;
 Wed,  1 Mar 2023 20:47:10 -0800 (PST)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A67CA3F99C;
 Wed,  1 Mar 2023 20:46:25 -0800 (PST)
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
X-Inumbo-ID: 3194c8e6-b8b5-11ed-96a9-2f268f93b82a
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org
Subject: [ImageBuilder][PATCH 0/2] uboot-script-gen: Add support for static heap and shared memory
Date: Thu,  2 Mar 2023 04:46:04 +0000
Message-Id: <20230302044606.136130-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all
This patch series is to enable to set the device tree for static heap and static
shared memory by uboot-script-gen


jiamei Xie (1):
  uboot-script-gen: Add support for static heap

jiamei.xie (1):
  uboot-script-gen: Add support for static shared memory

 README.md                | 22 +++++++++++++++++++
 scripts/uboot-script-gen | 46 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

-- 
2.25.1


