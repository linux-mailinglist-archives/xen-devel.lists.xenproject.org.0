Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F8D20C08C
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jun 2020 11:56:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jp7Yh-00071n-MR; Sat, 27 Jun 2020 09:55:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M84L=AI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jp7Yg-00071i-CN
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2020 09:55:38 +0000
X-Inumbo-ID: 5a2dc89a-b85c-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a2dc89a-b85c-11ea-bca7-bc764e2007e4;
 Sat, 27 Jun 2020 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eTlQ0etwk8SLmWkjWs4iLvynA1H72wix6KqE6Ac6qr8=; b=Dm0XF7tjXr7hMvKpm71zQ1WMNx
 DNVy4MC2aLk57DJXpi7pST+WTNCpHi5MYgVBay6rqUSOE9lvuae/cBNLwqfyrMj64Nssa08IZcaWh
 kFuCGaKVIH5oCOjBRmcYQt54xt7TnUEg8C9P+IrzC1r5wWR7obc9SyRE0eJjH11oTIzo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jp7Ye-0005pG-Pv; Sat, 27 Jun 2020 09:55:36 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jp7Ye-00017R-Eb; Sat, 27 Jun 2020 09:55:36 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 for-4.14 0/2] pvcalls: Reconciliate the spec and the
Date: Sat, 27 Jun 2020 10:55:31 +0100
Message-Id: <20200627095533.14145-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is v4 to try to reconciliate the pvcalls spec and the header. The
series gain an extra patch (#1) to make clear the header is just a
reference.

This series is candidate for 4.14 to avoid continuing to ship wrong
header even they are just a reference.

For all the changes see in each patch.

Best regards,


Julien Grall (2):
  pvcalls: Clearly spell out that the header is just a reference
  pvcalls: Document correctly and explicitely the padding for all arches

 docs/misc/pvcalls.pandoc        | 8 --------
 xen/include/public/io/pvcalls.h | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.17.1


