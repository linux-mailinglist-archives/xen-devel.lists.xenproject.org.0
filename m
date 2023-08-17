Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D460177F3B0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 11:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585229.916295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZX3-0006L6-Jd; Thu, 17 Aug 2023 09:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585229.916295; Thu, 17 Aug 2023 09:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZX3-0006BY-Cw; Thu, 17 Aug 2023 09:43:09 +0000
Received: by outflank-mailman (input) for mailman id 585229;
 Thu, 17 Aug 2023 09:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wLb=EC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qWZX1-000662-UE
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 09:43:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77800027-3ce2-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 11:43:06 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-55-201-67.retail.telecomitalia.it [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id 464ED4EE0737;
 Thu, 17 Aug 2023 11:43:05 +0200 (CEST)
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
X-Inumbo-ID: 77800027-3ce2-11ee-9b0c-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/2] Add files to the exclude list and update ECL files
Date: Thu, 17 Aug 2023 11:42:54 +0200
Message-Id: <cover.1692261955.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add files to exclude-list.json and adapt the ECLAIR configuration to keep
track of the changes.

Federico Serafini (2):
  automation/eclair: update configuration
  misra: add more entires to exclude-list.json

 .../eclair_analysis/ECLAIR/deviations.ecl     | 29 +++++++++++++++++++
 .../eclair_analysis/ECLAIR/out_of_scope.ecl   |  3 ++
 docs/misra/exclude-list.json                  | 12 ++++++++
 3 files changed, 44 insertions(+)

-- 
2.34.1


