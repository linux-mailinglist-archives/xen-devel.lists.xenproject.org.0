Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D6BCA3A06
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 13:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177627.1501860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR8aK-00079E-Fk; Thu, 04 Dec 2025 12:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177627.1501860; Thu, 04 Dec 2025 12:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR8aK-000784-AZ; Thu, 04 Dec 2025 12:37:24 +0000
Received: by outflank-mailman (input) for mailman id 1177627;
 Thu, 04 Dec 2025 12:37:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vR8aI-00077r-Vh
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 12:37:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vR8aH-006XHd-1l;
 Thu, 04 Dec 2025 12:37:21 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vR8aG-003ewc-21;
 Thu, 04 Dec 2025 12:37:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=2vApY+RD+NuJHsPjs7FLKy7wqMIlgdSLXq4TF/0qpy0=; b=HB91ev
	XCWukAHU1sdloQzaAupbvZw/9gkfblHLFkJwd6yNGLY7H8VSpaLz8KVZeBr7KY763qGdWpj1jgeKn
	ZuZy4d0OMARkRY/tshQSDmeES5oG8FEYSkrdvSVrClHd8NYPMPUw9zRvd1Ohr2h+ugtEouXfazIER
	4XHzBA6XvwM=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v1 0/2] tools/tests: test harness fragment
Date: Thu,  4 Dec 2025 04:37:10 -0800
Message-ID: <20251204123712.721443-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-on mini-series based on the original feedback in [1].

Patch 1 addresses the remaining feedback from [1].
Patch 2 adds a new fragment for auto-generating test harness dependencies.

[1] https://lore.kernel.org/xen-devel/aLmZLm2_G48yfPWR@l14/
[2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2195624771

Denis Mukhin (2):
  tests: fixup domid test harness dependencies
  tests: introduce Tests.mk fragment

 tools/Tests.mk             | 34 ++++++++++++++++++++++++++++++++++
 tools/tests/domid/Makefile | 28 +---------------------------
 2 files changed, 35 insertions(+), 27 deletions(-)
 create mode 100644 tools/Tests.mk

-- 
2.52.0


