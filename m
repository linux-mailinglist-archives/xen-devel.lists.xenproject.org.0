Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9B6AE8BE
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 18:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507663.781579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaxD-0004zA-9m; Tue, 07 Mar 2023 17:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507663.781579; Tue, 07 Mar 2023 17:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZaxB-0004gb-UQ; Tue, 07 Mar 2023 17:18:21 +0000
Received: by outflank-mailman (input) for mailman id 507663;
 Tue, 07 Mar 2023 17:18:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tG96=67=desiato.srs.infradead.org=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZax1-0000bA-Aw
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 17:18:11 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06d054d7-bd0c-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 18:18:07 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZawk-00H60G-2s; Tue, 07 Mar 2023 17:17:55 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawk-009ciI-2R; Tue, 07 Mar 2023 17:17:54 +0000
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
X-Inumbo-ID: 06d054d7-bd0c-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PkizE0cS/Ha72MbLZ6lRnucXKt4Gr9fG8pUinhpPuTo=; b=PQBkd7F1lelkGwnjB6AU6JqM08
	uPuEG7Ks8QiYuYLUrk1ODhQ/SQg3Sx4UNpNz8ouAH2Fuo5qpDu4tLT5UguJ6qlSz2wkgC6jZdnWcM
	3XFtwCAS5jN3zLOOA0mDHvtchzgEI9ZNjXJjWLWewLnW0Feeov9HJaH2gJk0rNuzrzjH60H5rbmVf
	lx6TVii51C4zqT2Q8gkWAyO+X5uUg17V555DE8O/rwsll0+zs/1ut/0p6Ty8xJz2Pl98Uap2PtLX5
	JFxyyOe8qtisLxdNwAQ9VnkIy4g21RVm0K5Iqv1s/uPPPBy0eUZ7V+5DTf2l/NSYAgTfspzmBB5ND
	X4fFOX7g==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 26/27] MAINTAINERS: Add entry for Xen on KVM emulation
Date: Tue,  7 Mar 2023 17:17:49 +0000
Message-Id: <20230307171750.2293175-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307171750.2293175-1-dwmw2@infradead.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5340de0515..640deb2895 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -443,6 +443,15 @@ F: target/i386/kvm/
 F: target/i386/sev*
 F: scripts/kvm/vmxcap
 
+Xen emulation on X86 KVM CPUs
+M: David Woodhouse <dwmw2@infradead.org>
+M: Paul Durrant <paul@xen.org>
+S: Supported
+F: include/sysemu/kvm_xen.h
+F: target/i386/kvm/xen*
+F: hw/i386/kvm/xen*
+F: tests/avocado/xen_guest.py
+
 Guest CPU Cores (other accelerators)
 ------------------------------------
 Overall
-- 
2.39.0


