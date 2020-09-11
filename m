Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4522265FA9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:40:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiLw-0006gL-GK; Fri, 11 Sep 2020 12:40:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiLv-0006fc-3M
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:40:31 +0000
X-Inumbo-ID: f28dd61f-9d27-45fb-ae9b-b0e0d187e4c1
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f28dd61f-9d27-45fb-ae9b-b0e0d187e4c1;
 Fri, 11 Sep 2020 12:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2vtEDHW6LGAocMGYC7G5FyGDCoa3gvEx5lWvLZZsoz0=;
 b=X+rKW6S/PH8ff+iDkz6M1foyPBTLhpTL3gyxJl2Ps2IXa7NKMQTU3I/8
 StcH9O/nEFCsWtL0ttA9EHSNGR5IxXo7kPBm62oY+vHFGe3jnVJSXXGSY
 WWtA/CLsDScIjlE8eMXmVltNgLNoXE8iRhI/hOzYANarK5ETyBRF3ftBC A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: mp7M4Ck9v/m0/QPCNBdgw46gEHlCY2pRLrxIgHXyvZ+plo0AMfAQjxFjXlzsopLpM2oZgCYm8n
 rBb9ZbckW+JRvqUi1IOzDJnDqaUT9tUwBpb43z9bVrs4wSwsIC3uLxNeJ2xMjCWXegubXeM30y
 7UTq/4eoV8S+JxGCeXIGj6uK6wBEwYvpoqtv5Xp+MI9gI+ZPdX8A8UJN8KhpqAg445uqARaE4u
 Qw+J0CucH9QI1IgS7tA36qJi7PZQKDYQyp7mhb+lZtpcxZrLnuAqKzsDHZTLP6ZZPI6vqmfnFC
 ddg=
X-SBRS: 2.7
X-MesageID: 26497501
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26497501"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 8/8] Clean up index page
Date: Fri, 11 Sep 2020 13:40:09 +0100
Message-ID: <20200911124009.3760032-9-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911124009.3760032-1-george.dunlap@citrix.com>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Get rid of "change this here" comments.

Break into two sections: "Regulations", which are rules, and "Guides",
which are suggestions.

Remove unused indexes.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 source/index.rst | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/source/index.rst b/source/index.rst
index c8b45d8..41f92fb 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -1,16 +1,26 @@
 .. XenProject Governance documentation master file, created by
    sphinx-quickstart on Tue Sep  8 12:10:02 2020.
-   You can adapt this file completely to your liking, but it should at least
-   contain the root `toctree` directive.
 
-Welcome to XenProject Governance's documentation!
-=================================================
+Welcome to XenProject's Governance Documents
+============================================
+
+The Regulations section contains documents
+that regulate the operation of the XenProject,
+including minimum acceptable behavior
+and possible responses to unacceptable behavior.
+The Guides section contains documents describing ideal behavior
+that we strive for as a community.
 
 .. toctree::
    :maxdepth: 2
-   :caption: Contents:
+   :caption: Regulations:
 
    code-of-conduct
+
+.. toctree::
+   :maxdepth: 2
+   :caption: Guides:
+
    communication-guide
    code-review-guide
    communication-practice
@@ -19,6 +29,8 @@ Welcome to XenProject Governance's documentation!
 Indices and tables
 ==================
 
-* :ref:`genindex`
-* :ref:`modindex`
+.. Comment out the index for now, but leave it here so we can think
+   about adding it back in later
+   * :ref:`genindex`
+
 * :ref:`search`
-- 
2.24.3 (Apple Git-128)


