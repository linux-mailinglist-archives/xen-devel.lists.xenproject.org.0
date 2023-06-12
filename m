Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB272C8F8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547274.854568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iup-000318-Po; Mon, 12 Jun 2023 14:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547274.854568; Mon, 12 Jun 2023 14:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iup-0002yE-N5; Mon, 12 Jun 2023 14:53:07 +0000
Received: by outflank-mailman (input) for mailman id 547274;
 Mon, 12 Jun 2023 14:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=abR0=CA=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q8iuo-0000x9-7N
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:53:06 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5da4387-0930-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 16:53:05 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 546E543CEE;
 Mon, 12 Jun 2023 07:52:03 -0700 (PDT)
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
X-Inumbo-ID: d5da4387-0930-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686581524; bh=QMlp6vVYLLO4ySA+tnP41d21m4WRIgsuxZbtRtfvbEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PEdzWcq2SJ1Gz1AqkF+GmSK9fFFW3yVucHXDzdrpmemcfrtjRUEyEvy91NuQMQmVX
	 bdceifG9bUt5m/b2q9xXdJEEdwrawXuW6f7OLGglrVoetl8JuPq6zSWwMJxblFUoH4
	 op4X6eSqziRQoSjVbAcqfrv6VGWPnVoezytd52YKsjeQsCXLzqXArGCyJ3fyGRqUYP
	 p7jDzJJRVNvugRDKKmxwPvJxefCQv6TXJ+eGKUmm7YVZilR/2e5EG5oHgdQj8n+iU9
	 vHbErQQRqGQPmnOBAVqjBeze1EI1P8DJA9xoxlPh3Cp1WWHt9+RxUfMqs5n8ywEX5W
	 Mu5DGTMALJ3WA==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 4/4] maintainers: Add ppc64 maintainer
Date: Mon, 12 Jun 2023 09:51:39 -0500
Message-Id: <b15baf2dfa8f9f525305ad03c9d58cec4f7775ea.1686580752.git.shawn@anastas.io>
In-Reply-To: <cover.1686580752.git.shawn@anastas.io>
References: <cover.1686580752.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bb7a6a839..8966175400 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -460,6 +460,10 @@ X:	xen/arch/x86/acpi/lib.c
 F:	xen/drivers/cpufreq/
 F:	xen/include/acpi/cpufreq/
 
+PPC64
+M:	Shawn Anastasio <sanastasio@raptorengineering.com>
+F:  xen/arch/ppc
+
 PUBLIC I/O INTERFACES AND PV DRIVERS DESIGNS
 M:	Juergen Gross <jgross@suse.com>
 S:	Supported
-- 
2.30.2


