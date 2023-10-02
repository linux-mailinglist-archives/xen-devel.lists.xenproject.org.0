Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C82D7B4C93
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 09:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611115.950516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDSQ-0000wv-5f; Mon, 02 Oct 2023 07:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611115.950516; Mon, 02 Oct 2023 07:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnDSQ-0000vE-29; Mon, 02 Oct 2023 07:35:10 +0000
Received: by outflank-mailman (input) for mailman id 611115;
 Mon, 02 Oct 2023 07:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uL8T=FQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qnDSO-0000v6-Kc
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 07:35:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3574bc30-60f6-11ee-878e-cb3800f73035;
 Mon, 02 Oct 2023 09:35:07 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id AB3BC4EE0739;
 Mon,  2 Oct 2023 09:35:05 +0200 (CEST)
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
X-Inumbo-ID: 3574bc30-60f6-11ee-878e-cb3800f73035
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
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v3 0/3] docs/misra: add documentation skeleton to address MISRA C:2012 Dir 4.1
Date: Mon,  2 Oct 2023 09:34:47 +0200
Message-Id: <cover.1696231870.git.nicola.vetrini@bugseng.com>
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

Note: The previous version of this series already had a release ack from Henry,
which I didn't add in each commit message since I see in the commit history that
tag being the last.

Nicola Vetrini (3):
  docs/misra: add documentation skeleton for MISRA C:2012 Dir 4.1
  docs: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
  automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1

 automation/eclair_analysis/build.sh   |   6 +-
 automation/eclair_analysis/prepare.sh |   7 +-
 docs/Makefile                         |   7 +-
 docs/misra/C-runtime-failures.rst     | 210 ++++++++++++++++++++++++++
 docs/misra/Makefile                   |  22 +++
 docs/misra/rules.rst                  |   7 +
 6 files changed, 252 insertions(+), 7 deletions(-)
 create mode 100644 docs/misra/C-runtime-failures.rst
 create mode 100644 docs/misra/Makefile

-- 
2.34.1


