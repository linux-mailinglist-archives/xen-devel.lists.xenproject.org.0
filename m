Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8DA1DB2DD
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 14:15:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbNcD-00056F-Ns; Wed, 20 May 2020 12:14:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q69C=7C=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jbNcC-00056A-Mt
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 12:14:28 +0000
X-Inumbo-ID: 736f75c4-9a93-11ea-9887-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 736f75c4-9a93-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 12:14:28 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jbNcB-0001Rk-65; Wed, 20 May 2020 13:14:27 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: grub-devel@gnu.org
Subject: [GRUB PATCH 0/2] Better Xen support
Date: Wed, 20 May 2020 13:14:18 +0100
Message-Id: <20200520121420.7965-1-ian.jackson@eu.citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi. As maintainer of the Xen Project upstream CI, I do testing of
upstream Xen builds onto Debian systems.

We use grub's 20_linux_xen to do the bootloader setup.  However, it is
missing some features so we are carrying some patches.  Here they are
for your consideration.

Regards, Ian.

Ian Jackson (2):
  20_linux_xen: Ignore xenpolicy and config files too
  20_linux_xen: Support Xen Security Modules (XSM/FLASK)

 util/grub.d/20_linux_xen.in | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

-- 
2.20.1


