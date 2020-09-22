Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B026D273FF4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKfuu-00024u-MG; Tue, 22 Sep 2020 10:53:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKfut-00024e-6Y
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 10:52:59 +0000
X-Inumbo-ID: 977f7cc7-5d62-4061-a5d8-d7b77604bca8
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 977f7cc7-5d62-4061-a5d8-d7b77604bca8;
 Tue, 22 Sep 2020 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600771978; x=1632307978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=o7irTIbRXOJQafppIl9QY5dF6CNyW4qaMo6zKmMJeVI=;
 b=dnJrLgDRF027TStm0BcYqrxG37hp2UDtv3/QOZBHjuM9nuLQs6nJaLFd
 lqIdVMULnM1Rq2IsdaCJxr9yN7l6EFhPAGsBpKbDIzLobO6imxXM/udHz
 lunTnkwcnIbKpiiEq+mQbBgkvzPQMCahJJocHeX+iBSP/DZlKRo0X2cuG I=;
X-IronPort-AV: E=Sophos;i="5.77,290,1596499200"; d="scan'208";a="70055190"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Sep 2020 10:52:55 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 99DC9A1F35; Tue, 22 Sep 2020 10:52:52 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.35) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 10:52:46 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] xen-blkfront: Apply changed parameter name to the
 document
Date: Tue, 22 Sep 2020 12:52:09 +0200
Message-ID: <20200922105209.5284-4-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922105209.5284-1-sjpark@amazon.com>
References: <20200922105209.5284-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.35]
X-ClientProxiedBy: EX13D14UWB003.ant.amazon.com (10.43.161.162) To
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


