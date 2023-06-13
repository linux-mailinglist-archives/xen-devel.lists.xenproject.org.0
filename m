Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD272E63F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 16:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548190.856010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95Lo-0002hu-F9; Tue, 13 Jun 2023 14:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548190.856010; Tue, 13 Jun 2023 14:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95Lo-0002ex-AX; Tue, 13 Jun 2023 14:50:28 +0000
Received: by outflank-mailman (input) for mailman id 548190;
 Tue, 13 Jun 2023 14:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IDdR=CB=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q95Lm-0002Q3-R3
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 14:50:26 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0a44e3d-09f9-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 16:50:25 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 8C6C543CEE;
 Tue, 13 Jun 2023 07:50:22 -0700 (PDT)
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
X-Inumbo-ID: a0a44e3d-09f9-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686667823; bh=9fbMLLcZdo9tA/l/g8BIpnobZUIM0rjYjuYg3GgzTUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0PbWoxHPkWlG22iFBMjI0oG7wkHvExdFyxCBB3+Yv4fiTH62ka2ZasMQ/oM0z6uD
	 8ygacd13GpjPABQwXTDojDeKqfcrwj+C0M/i7UPRONykraeFxtW1bsvz36TH2jLL8L
	 /t0TBoVRDLA48Mk+xo5/kzbYDLcXhpngLHnW/cXTxlT0PlW+FpS1GjpvkKPXHEGnu5
	 fN+cZGJHUApvfUqDBXGSqaYtzZGdVDN96e1aXqBCLUZ4LaimPX5Xc8+sc8ZGWnvnse
	 ra2aEnGULdMUmRlmyTAgJhKSU0bNcZPvZozJoTQqF80ZX8KUZ+F5BLOHNAQcXcMLsN
	 QcZykszaGT1eQ==
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
Subject: [PATCH v3 4/4] maintainers: Add ppc64 maintainer
Date: Tue, 13 Jun 2023 09:50:02 -0500
Message-Id: <317fa033e1ff2c1d0bd093abfe1cc39804e1fa33.1686667191.git.shawn@anastas.io>
In-Reply-To: <cover.1686667191.git.shawn@anastas.io>
References: <cover.1686667191.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bb7a6a839..25139fe4a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -460,6 +460,10 @@ X:	xen/arch/x86/acpi/lib.c
 F:	xen/drivers/cpufreq/
 F:	xen/include/acpi/cpufreq/
 
+PPC64
+M:	Shawn Anastasio <sanastasio@raptorengineering.com>
+F:	xen/arch/ppc/
+
 PUBLIC I/O INTERFACES AND PV DRIVERS DESIGNS
 M:	Juergen Gross <jgross@suse.com>
 S:	Supported
-- 
2.30.2


