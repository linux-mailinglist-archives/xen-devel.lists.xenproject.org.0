Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1920634E92
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 05:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447378.703522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxgz3-0007hT-Li; Wed, 23 Nov 2022 04:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447378.703522; Wed, 23 Nov 2022 04:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxgz3-0007ef-Hg; Wed, 23 Nov 2022 04:03:37 +0000
Received: by outflank-mailman (input) for mailman id 447378;
 Wed, 23 Nov 2022 04:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYU+=3X=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxgz2-0007eX-CH
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 04:03:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cc0a1bda-6ae3-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 05:03:33 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4971A1FB;
 Tue, 22 Nov 2022 20:03:39 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB8173F587;
 Tue, 22 Nov 2022 20:03:29 -0800 (PST)
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
X-Inumbo-ID: cc0a1bda-6ae3-11ed-91b6-6bf2151ebd3b
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
Subject: [PATCH v4 0/3] Populate entries for 4.17
Date: Wed, 23 Nov 2022 12:03:12 +0800
Message-Id: <20221123040315.1480112-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following changes are preparation work for the 4.17 release. Also
collecting the changelog changes happened during the 4.17 dev phase.
This is my first pass at the log for the release, it's likely missing
more entries.

Thanks,
Henry

v3 -> v4:
- Use the corrected sentence for VIRT_SSBD and MSR_SPEC_CTRL
- Clarify that the virtio-mmio toolstack for ARM is only creating the
  device-tree binding.
- Remove the "initial" in i.MX entry.
- Add my own sign-off in patch #2 because I changed the original wording.
v2 -> v3:
- Move the uncertain release date to patch #3.
- Remove the "on x86" for __ro_after_init, as Arm also supports the
  __ro_after_init.
- Take the opportunity in patch #3 to also adjust the 4.17 entry since
  this patch will be applied only after branching.
v1 -> v2:
- Pick other changelog patches happened during the 4.17 dev phase.
- Correct wording for two x86 entries (clock frequency calibration
and SPR & ADL support) following Jan's suggestion.
- Add missing Arm entries from Oleksandr.
- Add missing i.MX entry following Stefano's suggestion.

Andrew Cooper (1):
  Changelog: Add __ro_after_init and CET

Henry Wang (2):
  CHANGELOG: Add missing entries for work during the 4.17 release
  CHANGELOG: Start new "unstable" section

 CHANGELOG.md | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

-- 
2.25.1


