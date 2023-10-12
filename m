Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6F7C71E9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 17:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615895.957426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqy4J-00079N-VT; Thu, 12 Oct 2023 15:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615895.957426; Thu, 12 Oct 2023 15:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqy4J-00077E-RT; Thu, 12 Oct 2023 15:57:47 +0000
Received: by outflank-mailman (input) for mailman id 615895;
 Thu, 12 Oct 2023 15:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWZW=F2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqy4I-000777-OB
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 15:57:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14fc8c69-6918-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 17:57:44 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CF3554EE0739;
 Thu, 12 Oct 2023 17:57:42 +0200 (CEST)
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
X-Inumbo-ID: 14fc8c69-6918-11ee-9b0e-b553b5be7939
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
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH][for-4.19 0/2] use the macro LOWEST_BIT where appropriate
Date: Thu, 12 Oct 2023 17:57:37 +0200
Message-Id: <cover.1697125949.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces two instances of the pattern (x & -x) with the
macro LOWEST_BIT, introduced by the series [1]. Therefore, these patches should
be applied on top of patch 1 from that series.

[1] https://marc.info/?l=xen-devel&m=169712438716424&w=2

Nicola Vetrini (2):
  xen/vmap: use LOWEST_BIT to wrap a violation of Rule 10.1
  xen/iommu: use LOWEST_BIT to wrap a violation of Rule 10.1

 xen/common/vmap.c               | 2 +-
 xen/drivers/passthrough/iommu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.34.1

