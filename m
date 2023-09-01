Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B878FA72
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 11:07:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594511.927856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc07E-00038I-Ro; Fri, 01 Sep 2023 09:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594511.927856; Fri, 01 Sep 2023 09:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc07E-000363-Ly; Fri, 01 Sep 2023 09:06:56 +0000
Received: by outflank-mailman (input) for mailman id 594511;
 Fri, 01 Sep 2023 09:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TF5h=ER=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qc07D-00035h-1a
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 09:06:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e423a147-48a6-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 11:06:52 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 463C04EE0737;
 Fri,  1 Sep 2023 11:06:51 +0200 (CEST)
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
X-Inumbo-ID: e423a147-48a6-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 0/3] docs/misra: add documentation skeleton to address MISRA C:2012 Dir 4.1
Date: Fri,  1 Sep 2023 11:06:37 +0200
Message-Id: <cover.1693558913.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headline of Directive 4.1 states: "Run-time failures shall be minimized".
Thus, it requires the project to supply documentation that pertains the measures
and techinques used to prevent run-time failures from happening. For ease of
reading, the documentation is in RST format, but since ECLAIR needs a source file
to check that the needed subsections and their format is the one expected, the
Makefiles for the docs/ are amended to generate such a file.

The format and categories of the subsections in the .rst file can be
customized based on feedback from the community: the one provided is just a
basic skeleton that should be tailored to the project.

This series is based on the following RFC:
https://lore.kernel.org/xen-devel/cover.1692636338.git.nicola.vetrini@bugseng.com/

Nicola Vetrini (3):
  docs/misra: add documentation skeleton for MISRA C:2012 Dir 4.1
  docs: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
  automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1

 automation/eclair_analysis/build.sh   |  11 +-
 automation/eclair_analysis/prepare.sh |   5 +-
 docs/Makefile                         |   7 +-
 docs/misra/C-runtime-failures.rst     | 239 ++++++++++++++++++++++++++
 docs/misra/Makefile                   |  17 ++
 docs/misra/rules.rst                  |   7 +-
 6 files changed, 279 insertions(+), 7 deletions(-)
 create mode 100644 docs/misra/C-runtime-failures.rst
 create mode 100644 docs/misra/Makefile

--
2.34.1

