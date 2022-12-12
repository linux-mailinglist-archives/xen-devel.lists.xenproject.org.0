Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC99649BDC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459396.717141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsS-0006sY-1S; Mon, 12 Dec 2022 10:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459396.717141; Mon, 12 Dec 2022 10:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsR-0006n2-OS; Mon, 12 Dec 2022 10:17:39 +0000
Received: by outflank-mailman (input) for mailman id 459396;
 Mon, 12 Dec 2022 10:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fsP-0006fx-P2
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fsP-0002CN-C4; Mon, 12 Dec 2022 10:17:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fXF-0001lz-7N; Mon, 12 Dec 2022 09:55:45 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=7sixIYYX2BXkXchYlolNnqGqX331A7XAOK4eil8C98Q=; b=sIdAb+8tya0rDEJA2vdRsCmPMK
	w/P40eUiUsCFCYKx7Co4ZCb7gnkdjT4c2aMYLZQHrtkDCQpl2JeNhYg8OERvKLwgtF4oJsrwW1Q4C
	wwbB6XcPc3P6rEYM9agpZ2ROXWn7YiSnU4EnE2QCKb6r7Po22NWkLuJVEuHmN1BHdKRA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 16/18] xen/arm: linker: Indent correctly _stext
Date: Mon, 12 Dec 2022 09:55:21 +0000
Message-Id: <20221212095523.52683-17-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

_stext is indented by one space more compare to the lines. This doesn't
seem warrant, so delete the extra space.

Signed-off: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Patch added
---
 xen/arch/arm/xen.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 92c298405259..ae8c3b4c6c5f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -31,7 +31,7 @@ SECTIONS
   . = XEN_VIRT_START;
   _start = .;
   .text : {
-        _stext = .;            /* Text section */
+       _stext = .;             /* Text section */
        *(.text.header)
 
        *(.text.cold)
-- 
2.38.1


