Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB585F75D6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 11:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417498.662197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjQR-0004cM-Dg; Fri, 07 Oct 2022 09:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417498.662197; Fri, 07 Oct 2022 09:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjQR-0004Zp-Au; Fri, 07 Oct 2022 09:13:47 +0000
Received: by outflank-mailman (input) for mailman id 417498;
 Fri, 07 Oct 2022 09:13:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ogjQQ-0004Ze-14
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 09:13:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogjQP-0005rY-Ie; Fri, 07 Oct 2022 09:13:45 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogjQP-0000mx-9b; Fri, 07 Oct 2022 09:13:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=KcRoOxbT98pj7lSXnPDK2ZAxSR7ZC0weJkH3qQh8Ukk=; b=O1geAX
	x+AipJE0gNRc/4+HPkKSXq1lkHvoubOVeJKFPq8z2N3c4I+yFr1/Nzqh275aAUagMe0ZnYPVJ0SZ3
	jVYRCHWn11cUN1Rql8PRc8+a29BS9Jx3HKQboVPEC8rdv6PQb43R7F38jzSl/3Hk1b8kKPT6tkWwz
	Klmzdow+euc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] Prepare the tree for 4.17 RC
Date: Fri,  7 Oct 2022 10:13:38 +0100
Message-Id: <20221007091341.58542-1-julien@xen.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This small series is to get the tree ready for cutting the first
4.17 release candidate.

I haven't prepared any RC in the past. So I mainly followed the
guideline in docs/process/release-technician-checklist.txt. Please
let me know if I missed anything.

Cheers,

Julien Grall (3):
  process/release-technician-checklist: Explain how the banner in README
    is generated
  Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen 4.17 RC1)
  Update Xen version to 4.17-rc

 Config.mk                                     |  2 +-
 README                                        | 16 ++++++++--------
 SUPPORT.md                                    |  2 +-
 docs/process/release-technician-checklist.txt |  1 +
 xen/Makefile                                  |  2 +-
 5 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.37.1


