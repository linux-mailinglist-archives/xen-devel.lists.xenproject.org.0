Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E425297296
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11096.29463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCx-0002H8-FC; Fri, 23 Oct 2020 15:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11096.29463; Fri, 23 Oct 2020 15:42:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzCx-0002G3-B0; Fri, 23 Oct 2020 15:42:23 +0000
Received: by outflank-mailman (input) for mailman id 11096;
 Fri, 23 Oct 2020 15:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVzCv-000207-H1
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:21 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3237385-ff05-47ad-a248-91e89864f56d;
 Fri, 23 Oct 2020 15:42:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCq-0006rW-47; Fri, 23 Oct 2020 15:42:16 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVzCp-0007wb-Qi; Fri, 23 Oct 2020 15:42:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVzCv-000207-H1
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:42:21 +0000
X-Inumbo-ID: b3237385-ff05-47ad-a248-91e89864f56d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b3237385-ff05-47ad-a248-91e89864f56d;
	Fri, 23 Oct 2020 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=9Jhhh200nUTGbCy8jyEQ9Z0MRCAcS0zUrLABG2/n+kQ=; b=eU6k8QiNQIfc2naCg2wGciaPZ
	fP1QY7kRegzgMuXtFrMcdCK5j9lxQdhdIer7ua0FYk7Svf07Z5VnSqKPyt83G+8nqUd2mIJfh61nw
	RdUQVmZd9hfqyEns2XOKDe+9eEgPW3OqR1ZsALtkkvrH1WwSKqH46Xxqu2aCmerLEyJv0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCq-0006rW-47; Fri, 23 Oct 2020 15:42:16 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVzCp-0007wb-Qi; Fri, 23 Oct 2020 15:42:16 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org,
	masami.hiramatsu@linaro.org,
	ehem+xen@m5p.com,
	bertrand.marquis@arm.com,
	andre.przywara@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 7/7] xen/arm: acpi: Allow Xen to boot with ACPI 5.1
Date: Fri, 23 Oct 2020 16:41:56 +0100
Message-Id: <20201023154156.6593-8-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023154156.6593-1-julien@xen.org>
References: <20201023154156.6593-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

At the moment Xen requires the FADT ACPI table to be at least version
6.0, apparently because of some reliance on other ACPI v6.0 features.

But actually this is overzealous, and Xen works now fine with ACPI v5.1.

Let's relax the version check for the FADT table to allow QEMU to
run the hypervisor with ACPI.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Patch added
---
 xen/arch/arm/acpi/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 55c3e5cbc834..7ea2990cb82c 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -181,8 +181,8 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
      * we only deal with ACPI 6.0 or newer revision to get GIC and SMP
      * boot protocol configuration data, or we will disable ACPI.
      */
-    if ( table->revision > 6
-         || (table->revision == 6 && fadt->minor_revision >= 0) )
+    if ( table->revision > 5
+         || (table->revision == 5 && fadt->minor_revision >= 1) )
         return 0;
 
     printk("Unsupported FADT revision %d.%d, should be 6.0+, will disable ACPI\n",
-- 
2.17.1


