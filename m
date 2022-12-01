Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19BF63EF9D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:39:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450592.707941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0huV-0007jc-Er; Thu, 01 Dec 2022 11:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450592.707941; Thu, 01 Dec 2022 11:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0huV-0007hW-C8; Thu, 01 Dec 2022 11:39:23 +0000
Received: by outflank-mailman (input) for mailman id 450592;
 Thu, 01 Dec 2022 11:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPp1=37=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p0huT-0007hO-Tt
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:39:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cb2eebe4-716c-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:39:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07C9ED6E;
 Thu,  1 Dec 2022 03:39:26 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E7383F73D;
 Thu,  1 Dec 2022 03:39:16 -0800 (PST)
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
X-Inumbo-ID: cb2eebe4-716c-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v6 0/2] Final changelog changes for 4.17
Date: Thu,  1 Dec 2022 19:39:08 +0800
Message-Id: <20221201113910.1984744-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

These two patches should be the final changelog changes for 4.17.

The first patch sets the release date and tag of 4.17 release and
should be "backported" to the staging/stable-4.17.

The second patch starts a new unstable section, so should be in
unstable master/staging only.

Thanks.

Henry

Henry Wang (2):
  CHANGELOG: Set 4.17 release date and tag
  CHANGELOG: Start new "unstable" section

 CHANGELOG.md | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.25.1


