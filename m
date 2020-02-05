Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B68F15289A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:43:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHAd-0008Td-J3; Wed, 05 Feb 2020 09:40:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izHAc-0008TY-6b
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:40:30 +0000
X-Inumbo-ID: 8b86e7c2-47fb-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b86e7c2-47fb-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 09:40:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C148FAC5C;
 Wed,  5 Feb 2020 09:40:28 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
Date: Wed, 5 Feb 2020 10:40:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/3] AMD IOMMU: misc small adjustments
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rmlyc3QgYSBzbWFsbCBmaXggdG8gaGFsZndheSByZWNlbnQgc2VjdXJpdHkgcmVsYXRlZCBjaGFu
Z2VzLCBhbmQKdGhlbiBzb21lIGNsZWFudXAgbm90aWNlZCBvbiB0aGUgd2F5IGFzIGxpa2VseSBk
ZXNpcmFibGUuCgoxOiBmaXggb2ZmLWJ5LW9uZSBpbiBhbWRfaW9tbXVfZ2V0X3BhZ2luZ19tb2Rl
KCkgY2FsbGVycwoyOiBkcm9wIHJlZHVuZGFudCBjb2RlCjM6IHJlcGxhY2UgYSBmZXcgbGl0ZXJh
bCBudW1iZXJzCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
