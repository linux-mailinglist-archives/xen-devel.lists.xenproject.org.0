Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D873443A9D6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 03:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216181.375692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBY9-00048q-64; Tue, 26 Oct 2021 01:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216181.375692; Tue, 26 Oct 2021 01:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBY9-00046q-2s; Tue, 26 Oct 2021 01:46:49 +0000
Received: by outflank-mailman (input) for mailman id 216181;
 Tue, 26 Oct 2021 01:46:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfBY7-00046k-MH
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 01:46:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7112447-d5dd-44cc-a0d7-9f995514aba3;
 Tue, 26 Oct 2021 01:46:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17BC0603E9;
 Tue, 26 Oct 2021 01:46:46 +0000 (UTC)
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
X-Inumbo-ID: c7112447-d5dd-44cc-a0d7-9f995514aba3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635212806;
	bh=czAYzlz5i5xgL4v0YUbKltbLhzIgGO9dgn5iEPm/gfs=;
	h=Date:From:To:cc:Subject:From;
	b=nrW6IHtVnVjwiNqGYjaLzqtlRRFiGskPIYs4tpCGDu9IZdauB0hhqe4nEDKawk+GJ
	 Syip8V0J1pfF9hDHPf+w8vAM3je7XMNTqoF1Qapb53XHTxwpSh8nO2+aZiJ4t6WRyf
	 DA3OPE0XAMJMgmGtRjJQid/8b873IdcHTUt3Y7uZ4bLoXuygWjEmivgiAaqbdbn/UE
	 X1rqe++03TrpWd3eYKyEr4sDE1ySgVXWvppJNYl7fUFhBRp9E+sg2QuJCPqCABloBt
	 xQh0ewQBuF7ZtaaIIX0YHyhJc3OK9RAtmQU7WzzQzj+6+RUqmeiWH0UL5KY1/Fv9l7
	 gvD984fvC80jg==
Date: Mon, 25 Oct 2021 18:46:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George.Dunlap@citrix.com
cc: sstabellini@kernel.org, dunlapg@umich.edu, roger.pau@citrix.com, 
    jbeulich@suse.com, committers@xenproject.org, 
    xen-devel@lists.xenproject.org
Subject: [PATCH v2] governance: communication channels
Message-ID: <alpine.DEB.2.21.2110251845500.4586@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1104439357-1635212806=:4586"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1104439357-1635212806=:4586
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Clarify that xen-devel is the only official communication channel.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

---
Changes in v2:
- remove mentions of #xendevel on OFTC

diff --git a/source/communication-practice.rst b/source/communication-practice.rst
index 70f5b8c..2ce2a4e 100644
--- a/source/communication-practice.rst
+++ b/source/communication-practice.rst
@@ -9,6 +9,20 @@ This guide provides communication Best Practice that helps you in
 * Being aware of your own and counterpart’s communication style and culture
 * Show empathy towards other community members
 
+Communication Channels
+======================
+
+All important communications and messages should be sent to the
+`xen-devel <10_>`_ mailing list, which is the only official channel for
+code submissions, acks, code reviews, and decision-making.
+
+In the modern connected world there are several other communication
+channels available at any given time, including online meetings and IRC.
+However, discussions on media other than the xen-devel mailing list
+should be summarized and sent to xen-devel to reach a wider audience,
+for record-keeping, and to make code submissions, acks, and code reviews
+official.
+
 Code reviews for **reviewers** and **patch authors**
 ====================================================
 
@@ -576,3 +590,4 @@ how to avoid and resolve issues.
 .. _6: https://xenproject.org/help/irc/
 .. _8: https://en.wikipedia.org/wiki/Erin_Meyer
 .. _9: https://www.nsf.gov/attachments/134059/public/15LFW_WorkingWithMulticulturalTeams_LarsonC.pdf
+.. _10: https://lists.xenproject.org/mailman/listinfo/xen-devel
--8323329-1104439357-1635212806=:4586--

