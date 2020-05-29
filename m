Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B211E7BED
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:33:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedGX-0001Kp-6J; Fri, 29 May 2020 11:33:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedGV-0001Jq-PE
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:33:31 +0000
X-Inumbo-ID: 29472bf4-a1a0-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29472bf4-a1a0-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:33:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3U-0003xZ-SX; Fri, 29 May 2020 12:20:05 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 32/49] buster: chiark-scripts: Install a new version
 on buster too
Date: Fri, 29 May 2020 12:19:28 +0100
Message-Id: <20200529111945.21394-33-ian.jackson@eu.citrix.com>
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

We need various fixes that are not in buster, sadly.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 production-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/production-config b/production-config
index f0ddc132..e3870d47 100644
--- a/production-config
+++ b/production-config
@@ -107,6 +107,7 @@ TftpGrubVersion XXXX-XX-XX
 
 DebianExtraPackages_jessie chiark-scripts_6.0.3~citrix1_all.deb
 DebianExtraPackages_stretch chiark-scripts_6.0.4~citrix1_all.deb
+DebianExtraPackages_buster chiark-scripts_6.0.5~citrix1_all.deb
 
 DebianExtraPackages_uefi_i386_jessie   extradebs-uefi-i386-2018-04-01/
 DebianExtraPackages_uefi_amd64_jessie  extradebs-uefi-amd64-2018-04-01/
-- 
2.20.1


