Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38C5F75D7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 11:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417500.662219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjQU-00058h-1w; Fri, 07 Oct 2022 09:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417500.662219; Fri, 07 Oct 2022 09:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjQT-00054v-UL; Fri, 07 Oct 2022 09:13:49 +0000
Received: by outflank-mailman (input) for mailman id 417500;
 Fri, 07 Oct 2022 09:13:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ogjQS-0004p4-A5
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 09:13:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogjQS-0005ry-5m; Fri, 07 Oct 2022 09:13:48 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogjQR-0000mx-TM; Fri, 07 Oct 2022 09:13:48 +0000
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
	bh=Y//ftCGsRAazMOB/1N8KrT/BfXkeqP9OSiLzG/bcZ64=; b=i8LhQgErLOockdUlXpgf0hSH9U
	uh+B5MGgAzRpl4Sd9LBEj0JTNAmHVWEwTG7Vw2BdNhIwXjPxaWbx31uqjE9ZbCjYWTppfxEg6gziD
	4pR43TiZJ2uTFIQFXk0/caiXpL+Pr5K5Oeb7ZQNtb3ZT8Ir/iVvM7DIEPbwdM9vA9se4=;
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
Subject: [PATCH 2/3] Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen 4.17 RC1)
Date: Fri,  7 Oct 2022 10:13:40 +0100
Message-Id: <20221007091341.58542-3-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221007091341.58542-1-julien@xen.org>
References: <20221007091341.58542-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 69af1e60d4cc..e0ce59346896 100644
--- a/Config.mk
+++ b/Config.mk
@@ -229,7 +229,7 @@ SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_REVISION ?= b746458e1ce1bec85e58b458386f8b7a0bedfaa6
 MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.0
-- 
2.37.1


