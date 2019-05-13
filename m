Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217651B3F3
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 12:25:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ85t-0003Ri-5F; Mon, 13 May 2019 10:22:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5rGY=TN=citrix.com=prvs=029ac1619=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hQ85r-0003Rb-Ma
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:22:03 +0000
X-Inumbo-ID: efcc737a-7568-11e9-ae71-db454c8da25c
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efcc737a-7568-11e9-ae71-db454c8da25c;
 Mon, 13 May 2019 10:21:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85379514"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23769.17679.378737.997387@mariner.uk.xensource.com>
Date: Mon, 13 May 2019 11:21:03 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-136013-mainreport@xen.org>
References: <osstest-136013-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [linux-4.9 test] 136013: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltsaW51eC00LjkgdGVzdF0gMTM2MDEzOiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBmbGlnaHQgMTM2MDEzIGxpbnV4LTQuOSByZWFsIFtyZWFs
XQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzYw
MTMvCj4gCj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVk
IGFuZCBhcmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBy
dW46Cj4gIHRlc3QtYXJtNjQtYXJtNjQtZXhhbWluZSAgICAxMSBleGFtaW5lLXNlcmlhbC9ib290
bG9hZGVyIGZhaWwgUkVHUi4gdnMuIDEzNDAxNQoKVGhpcyBpcyB0aGUga25vd24gVGh1bmRlclgg
Ym9vdGxvYWRlciBtaXNzaW5nIG91dHB1dCBpc3N1ZS4KCkkgaGF2ZSBmb3JjZSBvcHVzaGVkIHRo
aXMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
