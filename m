Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E3D1C04AD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 20:27:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUDuM-0007xq-Ol; Thu, 30 Apr 2020 18:27:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VdV=6O=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jUDuK-0007xQ-FE
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 18:27:36 +0000
X-Inumbo-ID: 429940b8-8b10-11ea-9a92-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 429940b8-8b10-11ea-9a92-12813bfff9fa;
 Thu, 30 Apr 2020 18:27:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 800D1AC4A;
 Thu, 30 Apr 2020 18:27:34 +0000 (UTC)
Subject: [PATCH 2/3] automation: openSUSE distro names helpers for
 containerize.
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 30 Apr 2020 20:27:34 +0200
Message-ID: <158827125424.19371.11152490489435365073.stgit@Palanthas>
In-Reply-To: <158827088416.19371.17008531228521109457.stgit@Palanthas>
References: <158827088416.19371.17008531228521109457.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
---
 automation/scripts/containerize |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index fbc4bc22d6..eb805bf96c 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -24,6 +24,8 @@ case "_${CONTAINER}" in
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
     _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
+    _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
+    _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/suse:opensuse-tumbleweed" ;;
 esac
 
 # Use this variable to control whether root should be used


