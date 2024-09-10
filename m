Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6B97357F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795382.1204728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyRt-0005h9-5C; Tue, 10 Sep 2024 10:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795382.1204728; Tue, 10 Sep 2024 10:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyRt-0005fa-2E; Tue, 10 Sep 2024 10:50:17 +0000
Received: by outflank-mailman (input) for mailman id 795382;
 Tue, 10 Sep 2024 10:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snyRs-0005eE-9W
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:50:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 760febcb-6f62-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:50:15 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id DCF7D4EE07BB;
 Tue, 10 Sep 2024 12:50:13 +0200 (CEST)
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
X-Inumbo-ID: 760febcb-6f62-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725965414; bh=29LLLDzW1mCA3jnAu4GMso7Ws6DZ9odsUc5IOzeGxMI=;
	h=From:To:Cc:Subject:Date:From;
	b=srx10N31UquVqQ1PkbFnRz0srTyu8QFtc5r49bwi0GsQpstvyRslesKlyN8kt5KQz
	 KHsI0OnRl4X5ArzADiuWgXnz0shrdGXnDcFzVHZppFVKGAK5Ll0dt0aWbxXEDXb+tu
	 rrfpvh8wOKYnctv7zKGDdU3DWUs4vFKhnfjvkTIxNII+I3Sv5RLrjALdwrOZ+IH4Ut
	 NazBlkqKN4LgW/fFGgTx2xolM3aZnVZaxKQWxFd9nN6m4oAkyCL8q/I8Q+9RDKyw7b
	 1IheItqisDVQ4n6/Cf26nwY9KONMpvQl6zg2aHIDIX3+R2XZrmm+hNDM2fFjLCEOm3
	 q/zAm4U/u6t7A==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 0/2] automation/eclair: update configuration of Rule 20.7
Date: Tue, 10 Sep 2024 12:50:05 +0200
Message-Id: <cover.1725963889.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to deviate some safe violations of Rule 20.7.
Remove redundant comment-based deviations.

Federico Serafini (2):
  automation/eclair: update configuration of Rule 20.7
  xen/bitmap: remove redundant deviations

 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 5 +++++
 xen/include/xen/bitmap.h                         | 3 ---
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.34.1


