Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66645A95A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229810.397351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ5w-00072j-I0; Tue, 23 Nov 2021 16:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229810.397351; Tue, 23 Nov 2021 16:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ5w-00070y-EB; Tue, 23 Nov 2021 16:56:36 +0000
Received: by outflank-mailman (input) for mailman id 229810;
 Tue, 23 Nov 2021 16:56:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ5v-00070h-I5
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:56:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ5v-000868-Dr
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:56:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ5v-0004Or-Ct
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:56:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mpZ5t-00075W-7I; Tue, 23 Nov 2021 16:56:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=Igfoa3K6shqP/kuB/2xLDcPaW0pX0f1Li+I0arh792M=; b=xT4mXrHe7oENKEvPjFn64QaMkY
	D24RW0L327dP91lsgj5skeYjOjwX2KnkYJ8Xd0Tw+zi/HJcn8HyWNePYCBbK7lym3oKzX72YMaFE+
	oRgCGvyaJINWOpndcLThppz3CBGWjcibEZwv+O4OXnhUQBiO1Y7VIpN4AvD6m2Yn1Rdk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH for-4.17 1/3] Revert "Config.mk: pin QEMU_UPSTREAM_REVISION (prep for Xen 4.16 RC1)"
Date: Tue, 23 Nov 2021 16:56:23 +0000
Message-Id: <20211123165625.1023-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This branch is unstable again now.

This reverts commit c9ce6afbf2d7772f47fc572bb7fc9555724927ed.
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 6be010c7ce..6587c7d626 100644
--- a/Config.mk
+++ b/Config.mk
@@ -239,7 +239,7 @@ SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
-QEMU_UPSTREAM_REVISION ?= b6e539830bf45e2d7a6bd86ddfdf003088b173b0
+QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 9f09744aa3e5982a083ecf8e9cd2123f477081f9
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
-- 
2.20.1


