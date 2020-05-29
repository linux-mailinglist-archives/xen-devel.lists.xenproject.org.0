Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3551E7BF2
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:33:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedGn-0001Zk-3w; Fri, 29 May 2020 11:33:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedGk-0001Xz-Q0
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:33:46 +0000
X-Inumbo-ID: 301a01b8-a1a0-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 301a01b8-a1a0-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:33:16 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3S-0003xZ-K0; Fri, 29 May 2020 12:20:02 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 21/49] buster: Extend ARM clock workaround
Date: Fri, 29 May 2020 12:19:17 +0100
Message-Id: <20200529111945.21394-22-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index bac33d00..71167351 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -248,7 +248,7 @@ END
 	push @xenkopt, $xenkopt;
 	# https://bugs.xenproject.org/xen/bug/45
 	push @xenkopt, "clk_ignore_unused"
-	    if $ho->{Suite} =~ m/wheezy|jessie|stretch/;
+	    if $ho->{Suite} =~ m/wheezy|jessie|stretch|buster/;
 
 	$xenkopt = join ' ', @xenkopt;
 	logm("Dom0 Linux options: $xenkopt");
-- 
2.20.1


