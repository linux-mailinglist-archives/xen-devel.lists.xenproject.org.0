Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6867D2E08
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621124.967230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur7y-0000KB-Nx; Mon, 23 Oct 2023 09:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621124.967230; Mon, 23 Oct 2023 09:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qur7y-0000HZ-LN; Mon, 23 Oct 2023 09:21:38 +0000
Received: by outflank-mailman (input) for mailman id 621124;
 Mon, 23 Oct 2023 09:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdWI=GF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qur7x-0000HT-Ku
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:21:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8f7990c5-7185-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:21:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F87F2F4;
 Mon, 23 Oct 2023 02:22:15 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A49B3F64C;
 Mon, 23 Oct 2023 02:21:29 -0700 (PDT)
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
X-Inumbo-ID: 8f7990c5-7185-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 0/4] Final CHANGELOG changes for 4.18
Date: Mon, 23 Oct 2023 17:21:19 +0800
Message-Id: <20231023092123.1756426-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series should be the final CHANGELOG changes for 4.18.

The first patch is mentioning the MISRA-C improvement during the
4.18 dev cycle, second patch is added as a clean-up patch during
the review of this series, so these should be committed before
we branch.

The third patch sets the release date and tag of 4.18 release
and should be included in both the staging and stable-4.18 once
we branch.

The fourth patch starts a new unstable section, so should be in
unstable master/staging only.

Thanks.

Henry Wang (4):
  CHANGELOG.md: Mention the MISRA-C improvement in 4.18 dev cycle
  CHANGELOG.md: Use "xenbits.xenproject.org" in links
  CHANGELOG.md: Set 4.18 release date and tag
  CHANGELOG.md: Start new "unstable" section

 CHANGELOG.md | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
2.25.1


