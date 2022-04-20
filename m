Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA6D507ED0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308561.524371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh07C-0007Or-OU; Wed, 20 Apr 2022 02:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308561.524371; Wed, 20 Apr 2022 02:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh07C-0007LX-L3; Wed, 20 Apr 2022 02:30:46 +0000
Received: by outflank-mailman (input) for mailman id 308561;
 Wed, 20 Apr 2022 02:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh07B-0007LR-FX
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:30:45 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfcb7de8-c051-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 04:30:43 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2UTfS092930
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:30:35 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2USH2092929;
 Tue, 19 Apr 2022 19:30:28 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: dfcb7de8-c051-11ec-8fbf-03012f2f19d4
Message-Id: <cover.1650420617.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 19 Apr 2022 19:10:17 -0700
Subject: [PATCH 00/10] Increase consistency of domain examples
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

The "xlexample.*" files have drifted apart rather distinctly.  This may
cause puzzlement at why the distinct choices were made.  Worse, I have an
unpleasant suspicion a naive user could benchmark with these files and
not realize performance differences were due to different settings, not
the domain type.

I chose 3 vCPUs and 384MB of memory.  This is in-between the values
currently in the examples.  I wonder whether I should have used the
values from pvhlinux as those may better reflect typical small VMs now.

Elliott Mitchell (10):
  docs: xlexample.hvm: Mention this isn't useful for other guests
  docs: xlexample.*: Use consistent vCPU count
  docs: xlexample.*: Use consistent initial memory
  docs: xlexample.pvhlinux: Add commented maxmem setting
  docs: xlexample.hvm: Fix maxmem value
  docs: xlexample.hvm: Add reference to nographic option
  docs: xlexample.pvhlinux: Make disk setting consistent with other
    examples
  docs: xlexample.hvm: Fix grammmer
  docs: xlexample.pvlinux: Add "type" setting
  docs: xlexample.pvhlinux: Use similar text to other examples

 tools/examples/xlexample.hvm      | 19 ++++++++++---------
 tools/examples/xlexample.pvhlinux | 13 +++++++++----
 tools/examples/xlexample.pvlinux  |  7 +++++--
 3 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.30.2


