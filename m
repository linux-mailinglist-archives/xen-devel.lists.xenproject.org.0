Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87767377E64
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124968.235309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Ty-0002EO-6S; Mon, 10 May 2021 08:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124968.235309; Mon, 10 May 2021 08:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Tx-0002B1-Tx; Mon, 10 May 2021 08:41:41 +0000
Received: by outflank-mailman (input) for mailman id 124968;
 Mon, 10 May 2021 08:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jR2S=KF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lg1Tv-0000ei-Rq
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:41:39 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c60b2f7a-142c-4ad6-96ae-d3994e3577b3;
 Mon, 10 May 2021 08:41:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2715511B3;
 Mon, 10 May 2021 01:41:18 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C62643F719;
 Mon, 10 May 2021 01:41:16 -0700 (PDT)
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
X-Inumbo-ID: c60b2f7a-142c-4ad6-96ae-d3994e3577b3
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 2/9] docs: add Xen png logo for the doxygen documentation
Date: Mon, 10 May 2021 09:40:58 +0100
Message-Id: <20210510084105.17108-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510084105.17108-1-luca.fancellu@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>

Add the xen-doxygen folder for the doxygen template
and add the Xen png logo in it.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 docs/xen-doxygen/xen_project_logo_165x67.png | Bin 0 -> 18223 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 docs/xen-doxygen/xen_project_logo_165x67.png

diff --git a/docs/xen-doxygen/xen_project_logo_165x67.png b/docs/xen-doxygen/xen_project_logo_165x67.png
new file mode 100644
index 0000000000000000000000000000000000000000..7244959d59cdeb9f23c5202160ea45508dfc7265
GIT binary patch
literal 18223
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

literal 0
HcmV?d00001

-- 
2.17.1


