Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9BE1190C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 14:31:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMAou-00068A-AQ; Thu, 02 May 2019 12:28:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAos-000684-El
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:28:10 +0000
X-Inumbo-ID: be7c9c82-6cd5-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id be7c9c82-6cd5-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 12:28:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:28:08 -0600
Message-Id: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:28:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] VT-d: suppress individual flushes during hwdom
 setup
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBhbiBpbnZvY2F0aW9uIG9mIGlvbW11X2ZsdXNoX2FsbCgpIGltbWVkaWF0ZWx5IGFm
dGVyd2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwpAQCAtMTMxMCw4ICsxMzEwLDExIEBAIHN0YXRp
YyB2b2lkIF9faHdkb21faW5pdCBpbnRlbF9pb21tdV9od2QKIAogICAgIHNldHVwX2h3ZG9tX3Bj
aV9kZXZpY2VzKGQsIHNldHVwX2h3ZG9tX2RldmljZSk7CiAgICAgc2V0dXBfaHdkb21fcm1ycihk
KTsKKwogICAgIC8qIE1ha2Ugc3VyZSB3b3JrYXJvdW5kcyBhcmUgYXBwbGllZCBiZWZvcmUgZW5h
YmxpbmcgdGhlIElPTU1VKHMpLiAqLworICAgIHRoaXNfY3B1KGlvbW11X2RvbnRfZmx1c2hfaW90
bGIpID0gdHJ1ZTsKICAgICBhcmNoX2lvbW11X2h3ZG9tX2luaXQoZCk7CisgICAgdGhpc19jcHUo
aW9tbXVfZG9udF9mbHVzaF9pb3RsYikgPSBmYWxzZTsKIAogICAgIGlmICggaW9tbXVfZmx1c2hf
YWxsKCkgKQogICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgVlREUFJFRklYCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
