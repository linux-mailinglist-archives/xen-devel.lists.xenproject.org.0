Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75763B44445
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 19:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110541.1459684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuDiM-0000YS-FG; Thu, 04 Sep 2025 17:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110541.1459684; Thu, 04 Sep 2025 17:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuDiM-0000WM-BC; Thu, 04 Sep 2025 17:25:38 +0000
Received: by outflank-mailman (input) for mailman id 1110541;
 Thu, 04 Sep 2025 17:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=62U0=3P=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1uuDiK-0000WG-UY
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 17:25:36 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28713e42-89b4-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 19:25:33 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 51C3E80C12F9; Thu,  4 Sep 2025 22:55:28 +0530 (IST)
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
X-Inumbo-ID: 28713e42-89b4-11f0-9809-7dc792cee155
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] docs/xentop: Add documentation for physical CPU monitoring feature
Date: Thu,  4 Sep 2025 22:55:25 +0530
Message-Id: <20250904172525.2795998-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add man page documentation for the new '-p/--pcpus' flag that displays
physical CPU utilization metrics. This provides hypervisor-level CPU
usage insights alongside existing domain statistics.

Changes include:
- Add '-p' flag to SYNOPSIS section
- Document '--pcpus' option with description
- Maintain consistency with existing documentation style

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 docs/man/xentop.1.pod | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/man/xentop.1.pod b/docs/man/xentop.1.pod
index 593a484ce7..db64ceb694 100644
--- a/docs/man/xentop.1.pod
+++ b/docs/man/xentop.1.pod
@@ -5,7 +5,7 @@ xentop - displays real-time information about a Xen system and domains
 =head1 SYNOPSIS
 
 B<xentop> [B<-h>] [B<-V>] [B<-d>SECONDS] [B<-n>] [B<-r>] [B<-v>] [B<-f>]
-[B<-b>] [B<-i>ITERATIONS] [B<-z>]
+[B<-b>] [B<-i>ITERATIONS] [B<-z>] [B<-p>]
 
 =head1 DESCRIPTION
 
@@ -61,6 +61,10 @@ maximum number of iterations xentop should produce before ending
 
 display dom0 first, ignoring interactive sorting
 
+=item B<-p>, B<--pcpus>
+
+display physical CPU utilization metrics
+
 =back
 
 =head1 INTERACTIVE COMMANDS
-- 
2.34.1


