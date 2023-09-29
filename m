Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E207B2D52
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610252.949593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Ot-0001fO-Fk; Fri, 29 Sep 2023 07:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610252.949593; Fri, 29 Sep 2023 07:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Ot-0001Yz-CZ; Fri, 29 Sep 2023 07:59:03 +0000
Received: by outflank-mailman (input) for mailman id 610252;
 Fri, 29 Sep 2023 07:59:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qm8Os-0001VZ-GM
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:59:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm8Os-00007r-77; Fri, 29 Sep 2023 07:59:02 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm8Or-0002Zh-Tw; Fri, 29 Sep 2023 07:59:02 +0000
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
	bh=yU0MsHHePNZzyX4DJE1iFsvAuBlXPDpigjF24FFvtBc=; b=zgNOmmUPQRp5qzL1Z10PTxfBKB
	XePsUJgH6KbxD8XRkSyvmK7DivKNnd1M9FZHNasW44QdP7WB29iD/Sm2IXqG0i08CHTUUdbA9bOeM
	1g2kt+6/Sm9+WzBXPu1aiL6S+teNEVjP2iKLSxO1AffrLaN6+9kxxof4knjhDudDycbc=;
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
Subject: [PATCH 1/2] Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen 4.18 RC1)
Date: Fri, 29 Sep 2023 08:58:56 +0100
Message-Id: <20230929075857.87092-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929075857.87092-1-julien@xen.org>
References: <20230929075857.87092-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 29c29f8d7fb9..000cf06d418f 100644
--- a/Config.mk
+++ b/Config.mk
@@ -223,7 +223,7 @@ OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
 QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= master
+QEMU_UPSTREAM_REVISION ?= 0df9387c8983e1b1e72d8c574356f572342c03e6
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
-- 
2.40.1


