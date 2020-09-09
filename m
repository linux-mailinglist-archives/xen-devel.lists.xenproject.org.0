Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C42262E5C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 14:14:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFyz5-00075m-MQ; Wed, 09 Sep 2020 12:13:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c0kD=CS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kFyz4-00075h-9D
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 12:13:54 +0000
X-Inumbo-ID: 0e1231f5-30c9-4b3e-b3cc-3bea0e7af8ed
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e1231f5-30c9-4b3e-b3cc-3bea0e7af8ed;
 Wed, 09 Sep 2020 12:13:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5650B25B;
 Wed,  9 Sep 2020 12:14:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] maintainers: remove unreachable remus maintainer
Date: Wed,  9 Sep 2020 13:59:44 +0200
Message-Id: <20200909115944.4181-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909115944.4181-1-jgross@suse.com>
References: <20200909115944.4181-1-jgross@suse.com>
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

The mails for Yang Hongyang are bouncing, remove him from MAINTAINERS
file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 482407b049..dab38a6a14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -426,7 +426,6 @@ T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
 
 REMUS
 M:	Shriram Rajagopalan <rshriram@cs.ubc.ca>
-M:	Yang Hongyang <imhy.yang@gmail.com>
 S:	Maintained
 F:	docs/README.remus
 F:	tools/libs/light/libxl_remus_*
-- 
2.26.2


