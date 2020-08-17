Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A451824714A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7jnR-0004WW-Ju; Mon, 17 Aug 2020 18:23:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ScJ9=B3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k7jnP-0004WR-O1
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:23:47 +0000
X-Inumbo-ID: 7f1614af-02f3-46fe-a5e0-bb41da56e442
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f1614af-02f3-46fe-a5e0-bb41da56e442;
 Mon, 17 Aug 2020 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597688625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7upCwWQ34gyg1l0yNuqWzOb/BonQDOxIkecBO5rapXM=;
 b=Ex8uHII0YvTkHRa5d6tqI3AAREtP1EhbfY4nUXZGvG73cKDKKgwDcWH4
 IzvTWjCduSRC2Xcpenx64gqVHzETvxsVfS7fsXs5uzkzJ0m/cer7tfST6
 zm7S0I2Nvv5X/rS3MsIPUdrEEaZHw9CusBDI4UQRh/KpuEaXf4B+GGiqe 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H745ZKZ5BtAi/e/gJWYnXP2EFvNQorP9xyDQddLJ2gTwh0B3x+1MqmIHnNr+XVb5UGPQiPIZBY
 SMvhDMCCa72+ph6blbp363hpCMNj+ZhyvsvVSAnKyd5mM/qYLIvNUCVj8YrnzCFsASwdOa4Fg4
 NF22xPfWOY9kVrlGBZb3J/cNWxF0G7Hp8WDf/LkW+X2qUSmMQp/ZUi2miAYT0008k1geCbxzKX
 mOYNzbgQiJYDcqYuVCegNCwHDMQlL0XKFj4wqGamh7DnbkXhN/8jOe344YXe9yENY3kHIRk3s8
 458=
X-SBRS: 2.7
X-MesageID: 25635273
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="25635273"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/2] tcl: JobDB: Do not require particular Pgtcl
 version
Date: Mon, 17 Aug 2020 19:23:37 +0100
Message-ID: <20200817182337.29144-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200817182337.29144-1-ian.jackson@eu.citrix.com>
References: <20200817182337.29144-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This just serves to complicate upgrades.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 tcl/JobDB-Executive.tcl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcl/JobDB-Executive.tcl b/tcl/JobDB-Executive.tcl
index 56b61825..29c82821 100644
--- a/tcl/JobDB-Executive.tcl
+++ b/tcl/JobDB-Executive.tcl
@@ -15,7 +15,7 @@
 # You should have received a copy of the GNU Affero General Public License
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
-package require Pgtcl 1.5
+package require Pgtcl
 
 namespace eval jobdb {
 
-- 
2.11.0


