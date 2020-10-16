Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB82909CB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8185.21806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSiV-0000gT-5m; Fri, 16 Oct 2020 16:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8185.21806; Fri, 16 Oct 2020 16:36:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSiV-0000g4-2a; Fri, 16 Oct 2020 16:36:31 +0000
Received: by outflank-mailman (input) for mailman id 8185;
 Fri, 16 Oct 2020 16:36:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kTSiT-0000fz-73
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb7653d7-44f9-43d4-b9e6-1199015185ee;
 Fri, 16 Oct 2020 16:36:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSiS-0001KV-4s
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:28 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSiS-0008DR-3A
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kTSiQ-0004zo-D2; Fri, 16 Oct 2020 17:36:26 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kTSiT-0000fz-73
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:29 +0000
X-Inumbo-ID: bb7653d7-44f9-43d4-b9e6-1199015185ee
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bb7653d7-44f9-43d4-b9e6-1199015185ee;
	Fri, 16 Oct 2020 16:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=fmqswlXn/zhEF5j7IJvtQzH2noI9IGpxxJj9vCVKny8=; b=5U8CotGTgaU75nceGmafXKfTFe
	LtsrbfP/alIbc1Jz8oduQn9OUEMKVPDVj2bS9k2NGETFoK8WA61Fw9fRgd9eOLMRMZ8KQtN4RRDnz
	EiZ0dXeE1OKhd4uveU+F/IBLiG7lXqElGJZz2s3SxIn9FnHEH/1F4XkLVU46FL0pNAik=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiS-0001KV-4s
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:28 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiS-0008DR-3A
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiQ-0004zo-D2; Fri, 16 Oct 2020 17:36:26 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/3] known hosts handling: Ensure things are good for multi-host jobs
Date: Fri, 16 Oct 2020 17:36:14 +0100
Message-Id: <20201016163615.5086-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016163615.5086-1-iwj@xenproject.org>
References: <20201016163615.5086-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a multi-host job reuses host(s) from earlier jobs, the set of
hosts set up in the on-host known_hosts files may be insufficient,
since the hosts we are using now may not have been in any of the
flight's runvars when the earlier job set them up.

So we need to update the known_hosts.  We use the flight's current
set, which will include all of our hosts.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-host-reuse | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/ts-host-reuse b/ts-host-reuse
index 8d674257..ea8a471d 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -135,6 +135,14 @@ sub noop_if_playing () {
     }
 }
 
+sub ensure_known_hosts ($) {
+    my ($ho) = @_;
+    # Don't need to bother if job uses only one host
+    return if scalar(grep { m/(_|^)host$/ } keys %r) == 1;
+    target_putfilecontents_root_stash($ho, 30, known_hosts(),
+				      '/root/.ssh/known_hosts');
+}
+
 #---------- actions ----------
 
 sub act_prealloc () {
@@ -153,6 +161,7 @@ sub act_start_test () {
     return unless $ho->{Shared};
     my %oldstate = map { $_ => 1 } qw(prep ready);
     host_shared_mark_ready($ho, $sharetype, \%oldstate, 'mid-test');
+    ensure_known_hosts($ho);
 }
 
 sub act_final () {
-- 
2.20.1


