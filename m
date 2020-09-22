Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA127440C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKj8k-0003Vl-Ne; Tue, 22 Sep 2020 14:19:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKj8j-0003Ru-7x
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:19:29 +0000
X-Inumbo-ID: 912ccf3d-5186-4091-bc31-c320ae2b63b7
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 912ccf3d-5186-4091-bc31-c320ae2b63b7;
 Tue, 22 Sep 2020 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600784365; x=1632320365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=o7irTIbRXOJQafppIl9QY5dF6CNyW4qaMo6zKmMJeVI=;
 b=UuJWSHLN7X9GKJEwZJ9Jp/deCje3pK+WDYjRzmOnH6mx3wUIka6uiXfX
 2Fm2YsF0mUV27Ipaf1B9DhJI9BwZ4hevHvl3FeOF435clIEUYHF4vZU80
 H52M8RrINeAXp0IXum9A1gyvFgR8blEYLS7ihlxJ2GHVmdM9B1Y3PTD5w I=;
X-IronPort-AV: E=Sophos;i="5.77,291,1596499200"; d="scan'208";a="70117581"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Sep 2020 14:16:33 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3B241A1C02; Tue, 22 Sep 2020 14:16:32 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.137) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 14:16:25 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] xen-blkfront: Apply changed parameter name to the
 document
Date: Tue, 22 Sep 2020 16:15:49 +0200
Message-ID: <20200922141549.26154-4-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922141549.26154-1-sjpark@amazon.com>
References: <20200922141549.26154-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.137]
X-ClientProxiedBy: EX13D12UWC001.ant.amazon.com (10.43.162.78) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: SeongJae Park <sjpark@amazon.de>

Commit 14e710fe7897 ("xen-blkfront: rename indirect descriptor
parameter") changed the name of the module parameter for the maximum
amount of segments in indirect requests but missed updating the
document.  This commit updates the document.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 Documentation/ABI/testing/sysfs-driver-xen-blkfront | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkfront b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
index 9c31334cb2e6..28008905615f 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkfront
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
@@ -1,4 +1,4 @@
-What:           /sys/module/xen_blkfront/parameters/max
+What:           /sys/module/xen_blkfront/parameters/max_indirect_segments
 Date:           June 2013
 KernelVersion:  3.11
 Contact:        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
-- 
2.17.1


