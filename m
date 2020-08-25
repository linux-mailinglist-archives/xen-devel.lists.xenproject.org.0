Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C5E251EC5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 20:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAdG0-0006TX-CR; Tue, 25 Aug 2020 18:01:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzwT=CD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kAdFx-0006TS-PS
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 18:01:14 +0000
X-Inumbo-ID: 7f70376f-d440-4751-8810-b3029f8d5db6
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f70376f-d440-4751-8810-b3029f8d5db6;
 Tue, 25 Aug 2020 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=3HY9MpBifJW+k0TovYqtL0vUeOy5WIHvXHdzwzmhUD0=; b=2m7skzkpiU1BRYrURt82jqohkS
 4aKKUc14x3VZpAMxaZf4rHdMTay0CcAtxOMXRsP7kkKm8FxcziNuGiYUTRgbHac9AS/Hw3PPBHKt3
 w5FPJ19GbyBa7dhczZDXsEn8DKN9If8+zVemIZN8UvjTD30utTh3bv4tkrX+WLdQdvdU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAdFu-0004yl-2T; Tue, 25 Aug 2020 18:01:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAdFt-0001SP-Na; Tue, 25 Aug 2020 18:01:09 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
Date: Tue, 25 Aug 2020 18:42:08 +0100
Message-Id: <20200825174208.11070-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
added a new erratum but forgot to update silicon-errata.txt.

Update the file accordingly to keep track of errata workaround in Xen.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 docs/misc/arm/silicon-errata.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index 11e5a9dcec2c..ee070e723a5f 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -51,4 +51,5 @@ stable hypervisors.
 | ARM            | Cortex-A57      | #1319537        | N/A                     |
 | ARM            | Cortex-A72      | #1319367        | N/A                     |
 | ARM            | Cortex-A76      | #1165522        | N/A                     |
+| ARM            | Neoverse        | #1165522        | N/A
 | ARM            | MMU-500         | #842869         | N/A                     |
-- 
2.17.1


