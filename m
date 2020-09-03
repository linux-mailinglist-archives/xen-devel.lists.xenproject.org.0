Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10525BECB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 12:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDm7i-0000xz-1b; Thu, 03 Sep 2020 10:05:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rObT=CM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kDm7g-0000xt-JF
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 10:05:40 +0000
X-Inumbo-ID: 1b34833f-115a-420b-9c76-5bd8b6597e15
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b34833f-115a-420b-9c76-5bd8b6597e15;
 Thu, 03 Sep 2020 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From; bh=CvD2o1yF1nEodgtDZ2rcJG1/GIjvJzBtuBwUDERucQM=; b=VETSJd
 n7ffTljgT+dpexcXLA4v5+t2NztKHi/h5ZnUvNUdwQ1oIENgIB2lnZJeC49xbKUmC+A1XLESL4+53
 F1C54/gYli8v7JKAXOmPbGHCcZSCDHMdCRD/Z6C+fGaywd4lfCT/DJzMP5u7s9cElFqG+CceyNdvm
 +6hn/1QwO+o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kDm7f-0005ar-0Z; Thu, 03 Sep 2020 10:05:39 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kDm7e-0007WE-Oe; Thu, 03 Sep 2020 10:05:38 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH 0/2] fix 'xl block-detach'
Date: Thu,  3 Sep 2020 11:05:35 +0100
Message-Id: <20200903100537.1337-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This series makes it behave as the documentation states it should

Paul Durrant (2):
  xl: implement documented --force option for block-detach
  libxl: do not automatically force detach of block devices

 docs/man/xl.1.pod.in       |  4 ++--
 tools/libxl/libxl_device.c |  9 ++++++---
 tools/xl/xl_block.c        | 21 ++++++++++++++++-----
 tools/xl/xl_cmdtable.c     |  3 ++-
 4 files changed, 26 insertions(+), 11 deletions(-)

-- 
2.20.1


