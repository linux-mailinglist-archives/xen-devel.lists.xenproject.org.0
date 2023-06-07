Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C667261B6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 15:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544809.850831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tcQ-0002Dc-8S; Wed, 07 Jun 2023 13:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544809.850831; Wed, 07 Jun 2023 13:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tcQ-0002BI-5j; Wed, 07 Jun 2023 13:54:34 +0000
Received: by outflank-mailman (input) for mailman id 544809;
 Wed, 07 Jun 2023 13:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6c5=B3=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q6tcO-0002BC-H4
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 13:54:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d26baccf-053a-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 15:54:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 407F2AB6;
 Wed,  7 Jun 2023 06:55:14 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10B713F587;
 Wed,  7 Jun 2023 06:54:27 -0700 (PDT)
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
X-Inumbo-ID: d26baccf-053a-11ee-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	bertrand.marquis@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] docs: Fix xl.cfg documentation
Date: Wed,  7 Jun 2023 14:54:19 +0100
Message-Id: <20230607135419.3498902-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change to the documentation for the xl.cfg introduced a build
error, fix the issue.

Fixes: b46e8207d0ae ("xen/tools: add sve parameter in XL configuration")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Apologise for the error! I think I was building an old version of the docs and
after the clarification from Andrew about refreshing the files with ./configure
I was able to reproduce the issue.
I didn't put any tag like Reported-by/Suggested-by because I don't know if they
can be put here? Anyway I guess it can be done on commit, Andrew reported the
issue and Michal was quick enough to suggest the fix before I've started working
on it :)
---
 docs/man/xl.cfg.5.pod.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 1b4e13ab647b..3979be2a590a 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2955,6 +2955,8 @@ Currently, only the "sbsa_uart" model is supported for ARM.
 
 =back
 
+=over 4
+
 =item B<sve="vl">
 
 The `sve` parameter enables Arm Scalable Vector Extension (SVE) usage for the
-- 
2.34.1


