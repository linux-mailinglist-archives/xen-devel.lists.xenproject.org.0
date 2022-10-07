Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432085F75D5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 11:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417499.662208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjQS-0004rn-Nt; Fri, 07 Oct 2022 09:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417499.662208; Fri, 07 Oct 2022 09:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjQS-0004p9-Jr; Fri, 07 Oct 2022 09:13:48 +0000
Received: by outflank-mailman (input) for mailman id 417499;
 Fri, 07 Oct 2022 09:13:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ogjQR-0004Zk-2n
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 09:13:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogjQQ-0005re-Re; Fri, 07 Oct 2022 09:13:46 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ogjQQ-0000mx-JU; Fri, 07 Oct 2022 09:13:46 +0000
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
	bh=kUbx1LNjRCLFRujiYZrTjCoqmIZMshwFrfMaBNx9TDw=; b=BH5PiAE/5iCp3eklKH6vRgDzbp
	T7vC1nwsnqMqkTWAy4RtVSLLyu4GItJFUYDuc76eTaDuZxkLrDB7+onpx9EEC0EoftM3Uyvi2bQoV
	Q//WvrYoSzQ/9gk1b/FQ1otrbFj/QGAnq7ewo5mv/JCPosvwocEQkWRDYEyBgknuZKOs=;
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
Subject: [PATCH 1/3] process/release-technician-checklist: Explain how the banner in README is generated
Date: Fri,  7 Oct 2022 10:13:39 +0100
Message-Id: <20221007091341.58542-2-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221007091341.58542-1-julien@xen.org>
References: <20221007091341.58542-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/process/release-technician-checklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
index 7515da202c92..914f31959ab0 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -49,6 +49,7 @@ t=RELEASE-$r
 * consider bumping sonames of shlibs
 
 * change xen-unstable README (should say "Xen 4.5" in releases and on stable branches, "Xen 4.5-unstable" on unstable)
+*   The banner is generated using figlet
 * change xen-unstable Config.mk
 #   QEMU_UPSTREAM_REVISION,
 #   QEMU_TRADITIONAL_REVISION
-- 
2.37.1


