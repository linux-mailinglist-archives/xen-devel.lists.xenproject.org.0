Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F324EC90
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maE-0008AL-8E; Sun, 23 Aug 2020 09:46:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQR-0004t9-TR
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:31 +0000
X-Inumbo-ID: 289043b6-5232-4b76-a6dd-61807808931c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 289043b6-5232-4b76-a6dd-61807808931c;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00BBCAE02;
 Sun, 23 Aug 2020 09:35:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 34/38] tools/libxl: move xl parsing checks to tools/xl
Date: Sun, 23 Aug 2020 11:35:15 +0200
Message-Id: <20200823093519.18386-35-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

check-xl-* scripts and data are not libxl- but xl-specific. Move them
from tools/libxl/ to tools/xl/.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/{libxl => xl}/check-xl-disk-parse                 | 0
 tools/{libxl => xl}/check-xl-vcpupin-parse              | 0
 tools/{libxl => xl}/check-xl-vcpupin-parse.data-example | 0
 tools/{libxl => xl}/check-xl-vif-parse                  | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename tools/{libxl => xl}/check-xl-disk-parse (100%)
 rename tools/{libxl => xl}/check-xl-vcpupin-parse (100%)
 rename tools/{libxl => xl}/check-xl-vcpupin-parse.data-example (100%)
 rename tools/{libxl => xl}/check-xl-vif-parse (100%)

diff --git a/tools/libxl/check-xl-disk-parse b/tools/xl/check-xl-disk-parse
similarity index 100%
rename from tools/libxl/check-xl-disk-parse
rename to tools/xl/check-xl-disk-parse
diff --git a/tools/libxl/check-xl-vcpupin-parse b/tools/xl/check-xl-vcpupin-parse
similarity index 100%
rename from tools/libxl/check-xl-vcpupin-parse
rename to tools/xl/check-xl-vcpupin-parse
diff --git a/tools/libxl/check-xl-vcpupin-parse.data-example b/tools/xl/check-xl-vcpupin-parse.data-example
similarity index 100%
rename from tools/libxl/check-xl-vcpupin-parse.data-example
rename to tools/xl/check-xl-vcpupin-parse.data-example
diff --git a/tools/libxl/check-xl-vif-parse b/tools/xl/check-xl-vif-parse
similarity index 100%
rename from tools/libxl/check-xl-vif-parse
rename to tools/xl/check-xl-vif-parse
-- 
2.26.2


