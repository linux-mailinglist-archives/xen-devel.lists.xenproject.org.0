Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2A5649B46
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459160.716809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCR-0002PR-Fc; Mon, 12 Dec 2022 09:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459160.716809; Mon, 12 Dec 2022 09:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCR-0002Nd-8g; Mon, 12 Dec 2022 09:34:15 +0000
Received: by outflank-mailman (input) for mailman id 459160;
 Mon, 12 Dec 2022 09:34:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fCQ-0002NX-Cu
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:34:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCP-0000mS-M1; Mon, 12 Dec 2022 09:34:13 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCP-0000rv-A6; Mon, 12 Dec 2022 09:34:13 +0000
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
	Subject:Cc:To:From; bh=cosW06dSd0KwrjbL/q0vCKK5hYPTCnrvvGlbUZKmLhE=; b=pYHGtX
	30xYcKcmjOqTOniDD2bIhTHswlfvswWviq0nWNCZxHa3VT0oLVE+XaNkwOmfrRmKsO1yLRGyMkT2G
	Rg10ji6J4imfEzB0cEF2rc6Ktd0AHZZrw8Tv4UXBe1jqjnrUPojOME4i5axPP4H5eDlzKpoYNic0v
	AbBeTzz/efU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	ijackson@chiark.greenend.org.uk
Subject: [PATCH 0/8] docs/process: branching-checklist: Update it
Date: Mon, 12 Dec 2022 09:34:02 +0000
Message-Id: <20221212093410.36289-1-julien@xen.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is a collection of improvement for the branching checklist.

Cheers,

Julien Grall (8):
  docs/process: branching-checklist: Use consistent indentation
  docs/process: branching-checklist: Remove reference to qemu-ijw.git
  docs/process: branching-checklist: Remove reference to root
  docs/process: branching-checklist: Clarify steps to add the branch in
    osstest
  docs/process: branching-checklist: Reword the section about Config.mk
  docs/process: branching-checklist: Remove section about the cambridge
    colo
  docs/proces: branching-checklist: Update the section "add to patchbot"
  docs/process: branching-checklist: Add a list of accounts at the
    beginning

 docs/process/branching-checklist.txt | 122 +++++++++++++--------------
 1 file changed, 60 insertions(+), 62 deletions(-)

-- 
2.38.1


