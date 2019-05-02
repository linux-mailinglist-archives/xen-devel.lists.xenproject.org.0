Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969BD11BD3
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMD3j-00062s-Te; Thu, 02 May 2019 14:51:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMD3i-00062l-EI
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:51:38 +0000
X-Inumbo-ID: c694faf4-6ce9-11e9-a35d-eb091d21ccdb
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c694faf4-6ce9-11e9-a35d-eb091d21ccdb;
 Thu, 02 May 2019 14:51:33 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 08:51:32 -0600
Message-Id: <5CCB03F2020000780022B557@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 08:51:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>,
 "Suravee Suthikulpanit" <suravee.suthikulpanit@amd.com>
References: <5CA6FD300200007800224C43@prv1-mh.provo.novell.com>
In-Reply-To: <5CA6FD300200007800224C43@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH] AMD/IOMMU: don't open-code
 for_each_amd_iommu()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA0LjE5IGF0IDA5OjAxLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCj4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+IEBAIC01MDMsNyArNTAzLDcgQEAgc3Rh
dGljIHN0cnVjdCBhbWRfaW9tbXUgKl9maW5kX2lvbW11X2Zvcgo+ICB7Cj4gICAgICBzdHJ1Y3Qg
YW1kX2lvbW11ICppb21tdTsKPiAgCj4gLSAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggaW9tbXUs
ICZhbWRfaW9tbXVfaGVhZCwgbGlzdCApCj4gKyAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21t
dSApCj4gICAgICAgICAgaWYgKCBpb21tdS0+c2VnID09IHNlZyAmJiBpb21tdS0+YmRmID09IGJk
ZiApCj4gICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICAKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
