Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32A1E7BDF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:32:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedFd-0000k0-I7; Fri, 29 May 2020 11:32:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedFc-0000ji-Nv
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:32:36 +0000
X-Inumbo-ID: 17e83dee-a1a0-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17e83dee-a1a0-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:32:36 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3S-0003xZ-BE; Fri, 29 May 2020 12:20:02 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 20/49] buster: ts-host-install: NTP not honoured bug
 remains
Date: Fri, 29 May 2020 12:19:16 +0100
Message-Id: <20200529111945.21394-21-ian.jackson@eu.citrix.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Debian #778564 remains open.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-host-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-host-install b/ts-host-install
index fe26f70f..253dbb5d 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -152,7 +152,7 @@ END
 	    my $done= 0;
 	    while (<EI>) {
 		if (m/^server\b|^pool\b\s/) {
-		    if ($ho->{Suite} =~ m/lenny|squeeze|wheezy|jessie|stretch/) {
+		    if ($ho->{Suite} =~ m/lenny|squeeze|wheezy|jessie|stretch|buster/) {
 			$_= $done ? "" : "server $ntpserver\n";
 		    } else {
 			m/^server \Q$ntpserver\E\s/ or
-- 
2.20.1


