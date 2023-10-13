Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB557C82D0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616378.958335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFCC-000483-KV; Fri, 13 Oct 2023 10:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616378.958335; Fri, 13 Oct 2023 10:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFCC-00045k-Hr; Fri, 13 Oct 2023 10:15:04 +0000
Received: by outflank-mailman (input) for mailman id 616378;
 Fri, 13 Oct 2023 10:15:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqNf=F3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qrFCB-00045Q-KD
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:15:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d5df1ce-69b1-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 12:14:59 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D76B34EE073A;
 Fri, 13 Oct 2023 12:14:56 +0200 (CEST)
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
X-Inumbo-ID: 5d5df1ce-69b1-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v3 0/2] update ecl configurations and deviations
Date: Fri, 13 Oct 2023 12:14:51 +0200
Message-Id: <cover.1697191850.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series brings updates to the configuration of the ECLAIR static analysis
tool, as well as a new document detailing the deviations from MISRA guidelines
that have no noticeable indication in the source code, as detailed by Stefano
Stabellini here [1].

[1] https://marc.info/?l=xen-devel&m=169663845629358&w=2

Nicola Vetrini (1):
  docs/misra: add deviations.rst to document additional deviations.

Simone Ballarin (1):
  automation/eclair: update deviations and accepted guidelines

 .../eclair_analysis/ECLAIR/deviations.ecl     | 135 +++++-----
 automation/eclair_analysis/ECLAIR/tagging.ecl |   4 +-
 docs/index.rst                                |   1 +
 docs/misra/deviations.rst                     | 236 ++++++++++++++++++
 docs/misra/rules.rst                          |   2 +-
 5 files changed, 302 insertions(+), 76 deletions(-)
 create mode 100644 docs/misra/deviations.rst

--
2.34.1

