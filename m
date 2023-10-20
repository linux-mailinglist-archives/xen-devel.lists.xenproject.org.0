Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726F7D0B09
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 11:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619715.965251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtlN3-0008Hb-RQ; Fri, 20 Oct 2023 09:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619715.965251; Fri, 20 Oct 2023 09:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtlN3-0008Fs-Mn; Fri, 20 Oct 2023 09:00:41 +0000
Received: by outflank-mailman (input) for mailman id 619715;
 Fri, 20 Oct 2023 09:00:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtlN2-0008Fk-AA
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 09:00:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 238c4024-6f27-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 11:00:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 071FD2F4;
 Fri, 20 Oct 2023 02:01:19 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FBBC3F5A1;
 Fri, 20 Oct 2023 02:00:33 -0700 (PDT)
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
X-Inumbo-ID: 238c4024-6f27-11ee-98d5-6d05b1d4d9a1
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
Subject: [PATCH v2 0/3] Final CHANGELOG changes for 4.18
Date: Fri, 20 Oct 2023 17:00:20 +0800
Message-Id: <20231020090023.1298745-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series should be the final CHANGELOG changes for 4.18.

The first patch is mentioning the MISRA-C improvement during the
4.18 dev cycle, so should be committed before we branch.

The second patch sets the release date and tag of 4.18 release and
should be included in both the staging and stable-4.18 once we
branch (next week).

The third patch starts a new unstable section, so should be in
unstable master/staging only.

Thanks.

Henry Wang (3):
  CHANGELOG.md: Mention the MISRA-C improvement in 4.18 dev cycle
  CHANGELOG.md: Set 4.18 release date and tag
  CHANGELOG.md: Start new "unstable" section

 CHANGELOG.md | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.25.1


