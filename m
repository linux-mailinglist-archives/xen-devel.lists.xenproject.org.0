Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9F244DA0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTg-0004Xa-F9; Fri, 14 Aug 2020 17:26:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQZ-00024Q-Gy
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:39 +0000
X-Inumbo-ID: 1d35dbac-2730-4307-8984-dfc8985cc8d2
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d35dbac-2730-4307-8984-dfc8985cc8d2;
 Fri, 14 Aug 2020 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HuGiUl9r9GZbvDQ8LofQzM7tXyOp/3WzRBA9aRRSObY=;
 b=UGWE1S45GUao3fFbrNyfRPnFwXgou8DQJQBzvIJ6LjDG2uBSWV6xMils
 USPuLkZfV1i3/RmWrJECkap5x+Eb0HsodW5/LMNt1lk1QAJ24Z2eIbSXV
 b6qbn37kwi+onxHlRN8o+/AByyt4e+E4wH+zt6oFgHxEqgN20A+LcAwEc w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: V6otqD9WK/PLcAD9hC3YWrdxwFbF1aLBK+Y0vWEvhBSBJiGErkW+Q8MjVFZUyWBx1MkWGwguTG
 vRRFn5hybXX+hFJbOwaljfjIW2J3qyRlrukSZdl37xavPM9IaiNraWqvRHLeJm0aAPUXyfUpj+
 Vo2e9YUviAX5nh59y6KmX87skxjY08lt9Tcq9iqUNiE90PTzI8NNOisoniFjKHhCYbEaeS+YLr
 HBkRzD/fjY/8IQChshxOPLSmyWQ358KN9AEKCtwiewf8OexZfHhUFno2xp2khx4RCkumloIuEb
 rFw=
X-SBRS: 2.7
X-MesageID: 24879752
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24879752"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 60/60] sg-report-job-history: Increase default limit
Date: Fri, 14 Aug 2020 18:22:05 +0100
Message-ID: <20200814172205.9624-61-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
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

Now this is a *lot* faster, we can print a lot more history.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index e09c694f..843dd776 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -29,7 +29,7 @@ use Osstest::Executive;
 use Osstest::HistoryReport;
 
 our (@blessings,@branches);
-our $limit= 100;
+our $limit= 2000;
 our $timelimit= 86400 * (366 + 14);
 our $htmlout = '.';
 our $flight;
-- 
2.11.0


