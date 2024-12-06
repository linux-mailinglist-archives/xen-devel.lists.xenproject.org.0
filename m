Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B19E792A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850459.1264881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJeBi-0003Bi-DG; Fri, 06 Dec 2024 19:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850459.1264881; Fri, 06 Dec 2024 19:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJeBi-0003A3-9x; Fri, 06 Dec 2024 19:40:30 +0000
Received: by outflank-mailman (input) for mailman id 850459;
 Fri, 06 Dec 2024 19:40:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJeBg-00039r-SN
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:40:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJeBg-007AQd-0R;
 Fri, 06 Dec 2024 19:40:28 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJeBg-0034Np-0E;
 Fri, 06 Dec 2024 19:40:28 +0000
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
	Subject:Cc:To:From; bh=eOgOAaOBj8tyU30Xd9ZQ++sw9kgVYwZFhk4V5vdXcEw=; b=AR2Fpw
	PwGgIysdagoNXnt/ErG9yOMT8QF9SFcM3EGSEDcAnAK7ST+VMl20n6D+KB4mGpPeA9Dhow4PETeEI
	jCzVl8WMOC6vL7Fev9amZnvBqe01tjvIxzrDC7XIK2IOqdZmhKSciPcg/CNSCr2IUXhdDNM6ly7gx
	PX6OQxA9o9g=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 0/2] docs/process: Update the branching checklist
Date: Fri,  6 Dec 2024 19:40:23 +0000
Message-Id: <20241206194025.31662-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

As we approach Xen 4.20, update the branching checklist to match
the current state of affair.

Cheers,

Julien Grall (2):
  docs/process: branching-checklist: Update the steps to generate the
    docs
  docs/process: branching-checklist: Remove any reference to OSSTest

 docs/process/branching-checklist.txt | 33 ++++------------------------
 1 file changed, 4 insertions(+), 29 deletions(-)

-- 
2.40.1


