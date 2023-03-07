Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F06AF015
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 19:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507790.781902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc2D-0006D1-6X; Tue, 07 Mar 2023 18:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507790.781902; Tue, 07 Mar 2023 18:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZc2B-0005fu-Pg; Tue, 07 Mar 2023 18:27:35 +0000
Received: by outflank-mailman (input) for mailman id 507790;
 Tue, 07 Mar 2023 18:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tG96=67=desiato.srs.infradead.org=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZc23-0002M9-V9
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 18:27:27 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b295e044-bd15-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 19:27:20 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZc1o-00H8TQ-1A; Tue, 07 Mar 2023 18:27:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZc1o-009eA3-0o; Tue, 07 Mar 2023 18:27:12 +0000
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
X-Inumbo-ID: b295e044-bd15-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PkizE0cS/Ha72MbLZ6lRnucXKt4Gr9fG8pUinhpPuTo=; b=pgQJa7/B3Q+bi4P5KTbDgLYvZ0
	CgFsTey1u6Hoz7+1jJDo1X0V9W4YtcayUub6+wXWZhLsxyFZ280ESb8OW+a4HqZ7SC9y1DN8eP9cU
	zJZKhuHtNIl7oU5ZuUfpeEiJw2lqDAq7dU3aKzDv7V3Yp6prhAG/Zewold6/io1UWZQIeKzwLE3W2
	jEnNYaCzWYCF5Z7BlMXVa9OXmdwbb05jLcrbEVP4Nozj6oVjNW0vyeYNWf7WQSBC9ekd1iUApR77G
	/fG0oPbvKM+C6iZzUb3+MVEPOkeOvsVxLUBEf0usAUrALK4aI0C/cxDfU+OT7MtUXS4JWuzZ8IgGZ
	cquQK5Tg==;
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 26/27] MAINTAINERS: Add entry for Xen on KVM emulation
Date: Tue,  7 Mar 2023 18:27:06 +0000
Message-Id: <20230307182707.2298618-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
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


