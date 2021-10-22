Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E4438071
	for <lists+xen-devel@lfdr.de>; Sat, 23 Oct 2021 01:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215294.374395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me3Vz-00011b-LF; Fri, 22 Oct 2021 22:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215294.374395; Fri, 22 Oct 2021 22:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me3Vz-0000zA-I3; Fri, 22 Oct 2021 22:59:55 +0000
Received: by outflank-mailman (input) for mailman id 215294;
 Fri, 22 Oct 2021 22:59:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWKL=PK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1me3Vy-0000z4-CD
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 22:59:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcb1be96-5700-48b0-8fc3-537a7f2ab193;
 Fri, 22 Oct 2021 22:59:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E51E61037;
 Fri, 22 Oct 2021 22:59:52 +0000 (UTC)
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
X-Inumbo-ID: fcb1be96-5700-48b0-8fc3-537a7f2ab193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634943592;
	bh=TNjbdCc180Gtrpx+1RGx2wC6AGhZ1voPpE1f+PBPZls=;
	h=Date:From:To:cc:Subject:From;
	b=iJaS5MmvLqJuIZFDDfFF65yfxA9s138fpyIunjK9uJ2FMWwBHAd1TQi70IEi6s2so
	 cqU/Y9XZTPiBFYZ/Bm+KkjFvMDYDrefhgq1ncGKR1FahILgARTSwCmbcTPS6cX1xhO
	 VAiPexqGyTP8e4DXtFM1ssBB0zvRJXE8AzADYCMmowauwz2zCGA7bDFRivBoCMxRlk
	 UODdwnauuieonE6XKHDBwGg2G3LbH6pxGBXI4emo3z4+0i/OcqTke15LL6JMhXKJT/
	 XytmFMVLSvYAh0wL4GtOKZK4CJze7j4+Kg6OxjY0gdU1iMCxkjQEKQXgjfKly0gshE
	 1g5rT+MM7nXIg==
Date: Fri, 22 Oct 2021 15:59:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George.Dunlap@citrix.com
cc: sstabellini@kernel.org, dunlapg@umich.edu, roger.pau@citrix.com, 
    jbeulich@suse.com, committers@xenproject.org, 
    xen-devel@lists.xenproject.org
Subject: [PATCH] governance: communication channels
Message-ID: <alpine.DEB.2.21.2110221535000.2311@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1151137835-1634943592=:2311"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1151137835-1634943592=:2311
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Clarify that xen-devel is the only official communication channel.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/source/communication-practice.rst b/source/communication-practice.rst
index 70f5b8c..356df7a 100644
--- a/source/communication-practice.rst
+++ b/source/communication-practice.rst
@@ -9,6 +9,22 @@ This guide provides communication Best Practice that helps you in
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
+Xen Project has an IRC channel named #xendevel on the OFTC network where
+some of the regular contributors and maintainers can be found. However,
+discussions on media other than the xen-devel mailing list should be
+summarized and sent to xen-devel to reach a wider audience, for
+record-keeping, and to make code submissions, acks, and code reviews
+official.
+
 Code reviews for **reviewers** and **patch authors**
 ====================================================
 
@@ -576,3 +592,4 @@ how to avoid and resolve issues.
 .. _6: https://xenproject.org/help/irc/
 .. _8: https://en.wikipedia.org/wiki/Erin_Meyer
 .. _9: https://www.nsf.gov/attachments/134059/public/15LFW_WorkingWithMulticulturalTeams_LarsonC.pdf
+.. _10: https://lists.xenproject.org/mailman/listinfo/xen-devel
--8323329-1151137835-1634943592=:2311--

