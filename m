Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45418BAA68
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 11:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716315.1118418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2pgt-0002DC-E7; Fri, 03 May 2024 09:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716315.1118418; Fri, 03 May 2024 09:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2pgt-0002Bd-B7; Fri, 03 May 2024 09:58:55 +0000
Received: by outflank-mailman (input) for mailman id 716315;
 Fri, 03 May 2024 09:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IauD=MG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s2pgr-0002BR-Dc
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 09:58:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bed4c179-0933-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 11:58:52 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-36-52-167.retail.telecomitalia.it [79.36.52.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 6137A4EE0738;
 Fri,  3 May 2024 11:58:51 +0200 (CEST)
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
X-Inumbo-ID: bed4c179-0933-11ef-909c-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 0/2] misra: deviations of Rule 16.4
Date: Fri,  3 May 2024 11:58:42 +0200
Message-Id: <cover.1714727807.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define "switch-clause" in terms of the C specification.
Deviate Rule 16.4.

Federico Serafini (2):
  docs/misra: add Terms & Definitions section to rules.rst
  automation/eclair: add deviation for Rule 16.4

 automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
 docs/misra/deviations.rst                        | 13 +++++++++++++
 docs/misra/rules.rst                             | 14 ++++++++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)

-- 
2.34.1


