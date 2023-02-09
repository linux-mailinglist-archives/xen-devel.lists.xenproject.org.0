Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BFA690F2E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492818.762547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAif-0004Qp-8T; Thu, 09 Feb 2023 17:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492818.762547; Thu, 09 Feb 2023 17:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAif-0004Ow-5Z; Thu, 09 Feb 2023 17:28:25 +0000
Received: by outflank-mailman (input) for mailman id 492818;
 Thu, 09 Feb 2023 17:28:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQAid-0004Oq-VK
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:28:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAid-0003RL-MY; Thu, 09 Feb 2023 17:28:23 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAid-0002Aq-Cn; Thu, 09 Feb 2023 17:28:23 +0000
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
	Subject:Cc:To:From; bh=7COyLm3qPWYO0z2xdcM7WXIh1QKSdpXXmRgHmbzyNd8=; b=D8bJxf
	aJqLr9rP2tRjIUK6rhjmtfQS7WCN6f6bzxqHpidJeO3BKan9BWo8xAtbM6tkC2RiJFEyhWhEp2BKw
	jOHOWQNVtFLCkt3BTqLhCACXChE4FetkMUeFlHFuJTY9TWZ+qPPCWo5gLmCaymVrvIBdfvS6/wTHW
	bJ7bdLIKkCQ=;
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
Subject: [PATCH v2 0/4] docs/process: branching-checklist: Update it
Date: Thu,  9 Feb 2023 17:28:16 +0000
Message-Id: <20230209172820.56292-1-julien@xen.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is a collection of improvement for the branching checklist.

Cheers,

Julien Grall (4):
  docs/process: branching-checklist: Reword the section about Config.mk
  docs/process: branching-checklist: Remove section about the cambridge
    colo
  docs/proces: branching-checklist: Update the section "add to patchbot"
  docs/process: branching-checklist: Add a list of accounts at the
    beginning

 docs/process/branching-checklist.txt | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

-- 
2.39.1


