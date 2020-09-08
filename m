Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADBF2611AB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 14:54:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFd8h-0003hR-8i; Tue, 08 Sep 2020 12:54:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFd8g-0003hK-7U
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 12:54:22 +0000
X-Inumbo-ID: 567e12a6-6ad3-401b-a043-8d0b5d74d648
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 567e12a6-6ad3-401b-a043-8d0b5d74d648;
 Tue, 08 Sep 2020 12:54:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22842ACB7;
 Tue,  8 Sep 2020 12:54:21 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] lib: correct __moddi3() description
Message-ID: <6c8ab543-67dd-62ed-2542-48fa7395e541@suse.com>
Date: Tue, 8 Sep 2020 14:54:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

The remainder of a division, when non-zero, is specified to always be of
the same sign as the dividend. Bring a comment in line with the code it
describes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/lib.c
+++ b/xen/common/lib.c
@@ -390,7 +390,7 @@ u64 __umoddi3(u64 a, u64 b)
  *  11 %  5 =  1
  * -11 %  5 = -1
  *  11 % -5 =  1
- * -11 % -5 =  1
+ * -11 % -5 = -1
  */
 s64 __moddi3(s64 a, s64 b)
 {

