Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B2507EF3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308619.524427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0DL-0002Cp-GY; Wed, 20 Apr 2022 02:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308619.524427; Wed, 20 Apr 2022 02:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0DL-00029f-Cf; Wed, 20 Apr 2022 02:37:07 +0000
Received: by outflank-mailman (input) for mailman id 308619;
 Wed, 20 Apr 2022 02:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh0DJ-00028y-CY
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:37:05 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c33ec1bc-c052-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 04:37:04 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2askH093003
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:37:00 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2asXK093002;
 Tue, 19 Apr 2022 19:36:54 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c33ec1bc-c052-11ec-8fbf-03012f2f19d4
Message-Id: <2510649c390ee59f79f4be797cdd8af7aaca8f3c.1650420617.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650420617.git.ehem+xen@m5p.com>
References: <cover.1650420617.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 9 Jan 2021 12:11:14 -0800
Subject: [PATCH 07/10] docs: xlexample.pvhlinux: Make disk setting consistent
 with other examples
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

While storing images on ZFS is now quite common, such isn't required
at all.  As such the example should be as generic as possible and
consistent with other examples.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/examples/xlexample.pvhlinux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/examples/xlexample.pvhlinux b/tools/examples/xlexample.pvhlinux
index e1bf845093..a6a52c336c 100644
--- a/tools/examples/xlexample.pvhlinux
+++ b/tools/examples/xlexample.pvhlinux
@@ -44,4 +44,4 @@ vif = [ '' ]
 # Disk Devices
 # A list of `diskspec' entries as described in
 # docs/misc/xl-disk-configuration.txt
-disk = [ '/dev/zvol/tank/guest-volume,raw,xvda,rw' ]
+disk = [ '/dev/vg/guest-volume,raw,xvda,rw' ]
-- 
2.30.2


