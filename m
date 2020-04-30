Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C01C04B0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 20:27:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUDuG-0007wX-Bo; Thu, 30 Apr 2020 18:27:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VdV=6O=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jUDuE-0007wP-Ol
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 18:27:30 +0000
X-Inumbo-ID: 4005399a-8b10-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4005399a-8b10-11ea-b07b-bc764e2007e4;
 Thu, 30 Apr 2020 18:27:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC9FBAC4A;
 Thu, 30 Apr 2020 18:27:28 +0000 (UTC)
Subject: [PATCH 1/3] automation: update openSUSE Tumbleweed building
 dependencies
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 30 Apr 2020 20:27:28 +0200
Message-ID: <158827124854.19371.13461510910212179854.stgit@Palanthas>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We need python3 (and the respective -devel package), these days.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
---
This patch was submitted already, but not as part of this series.

Anyway, changes from v1:
* add python3 instead of replacing python2 with it.
---
I think the tumbleweed image in our registry needs to be updated.
---
 .../build/suse/opensuse-tumbleweed.dockerfile      |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 2676a87c85..084cce0921 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -56,6 +56,8 @@ RUN zypper install -y --no-recommends \
         pkg-config \
         python \
         python-devel \
+        python3 \
+        python3-devel \
         systemd-devel \
         tar \
         transfig \


