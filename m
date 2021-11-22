Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA4458DDF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228841.396040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7sS-0002MF-4U; Mon, 22 Nov 2021 11:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228841.396040; Mon, 22 Nov 2021 11:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7sS-0002In-0x; Mon, 22 Nov 2021 11:52:52 +0000
Received: by outflank-mailman (input) for mailman id 228841;
 Mon, 22 Nov 2021 11:52:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mp7sQ-0002IY-VW
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:52:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mp7sQ-0006qj-SI
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:52:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mp7sQ-00022c-R8
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:52:50 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mp7sO-0000Fy-H3; Mon, 22 Nov 2021 11:52:48 +0000
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
	bh=A8tQwTTMjTvXftLlpa9RUQgFc7HF0aVLNGVPoKDuv9Q=; b=Ml000PporhyZFXZwf8VZgLTqIl
	Qhyx/Lnw2UqVIu6lImr+A6Si+iyTVq3fjCnlSY6E1+zyBeI5Yd9IbtU66MJ5SBZ1heupnFPN1B+0u
	Ja8S3lTXNuYSjFf/SY6VzSRDYEN23czg19sWZwphEIq33p3+KY6woo0alwTzJtUNAEAc=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/2] README.dev: Document to use updated osstest for commissioning
Date: Mon, 22 Nov 2021 11:52:38 +0000
Message-Id: <20211122115239.21743-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 README.dev | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/README.dev b/README.dev
index 3d09b3c6b..132772fb4 100644
--- a/README.dev
+++ b/README.dev
@@ -108,6 +108,8 @@ Create the tftp directory (must be done after firmware is set):
 Run commissioning test flights
 ------------------------------
 
+(Update your osstest tree to the latest production.)
+
 Firstly, a basic "host examination" that checks that we can install
 and boot Xen:
 
-- 
2.20.1


