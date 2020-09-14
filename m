Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE5E26883A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkjD-0006zL-73; Mon, 14 Sep 2020 09:24:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qknR=CX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kHkjB-0006zG-Kt
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:24:49 +0000
X-Inumbo-ID: b0a6bfb4-aae1-49e8-8a13-16b466d55ba1
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0a6bfb4-aae1-49e8-8a13-16b466d55ba1;
 Mon, 14 Sep 2020 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600075478;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=REpT4ExM7zcEvoPzI808P1C6pYJR6M8VEXiH743+6mw=;
 b=P1Af/ffQZu04v1keolgUV69YpifG8oX80zuQ1LgDv99qc2rHiyu0ojfO
 0g/zOLxpB7YICRAsMa0UZhSdluNuDqlCgB8iZyj2gq1g6WyjzoRgZsgz7
 BctzMo+AlDF0rGfiLexTaC9QySu/L3EIRYwmSWx5n8YAVtDJbf6aQQILk A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4cSmOPmuxv7DUvzmg5SKkXWBY3WGNC0y7XM0PP7QVrkFaPtHU9V7dDAe2QTd8LaO+yW3MaqDeo
 MmU3IpDHDRtJ6rbKQ1x6pfb80GAei9EZ5XvDf8QOHHJ+RHAXeugcM2+yJyI8DuVU+hXT4Hfr4w
 grkJktQfqrjoDPoyX1CTudHobNqKrKhri3IOuqQNG/sGqY3R533bPILtRRDW9nVAtjU2E3sRRL
 v2A5OCCFF09xji9taFnK1u5T+y8fqD1pvpN7xWNgh/E4sN/33C4Zq4rBnly4YqoFqVNVztRIlY
 0s8=
X-SBRS: 2.7
X-MesageID: 26906970
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,425,1592884800"; d="scan'208";a="26906970"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
 <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
 <jgross@suse.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] Build fixes
Date: Mon, 14 Sep 2020 10:24:18 +0100
Message-ID: <20200914092420.20900-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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

As demonstrated by Gitlab CI.

Still pending is the xenstat fix, and a newly discovered randconfig issue.

Andrew Cooper (2):
  tools/libs/vchan: Don't run the headers check
  tools/Makefile: Drop the use of $(file ...)

 tools/Rules.mk            | 52 +++++++++++++++++++++++++----------------------
 tools/libs/vchan/Makefile |  2 ++
 2 files changed, 30 insertions(+), 24 deletions(-)

-- 
2.11.0


