Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338C119DF
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:14:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBUd-0002Ru-Ch; Thu, 02 May 2019 13:11:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vuKL=TC=citrix.com=prvs=018794465=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hMBUc-0002Rh-4e
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:11:18 +0000
X-Inumbo-ID: c43574ac-6cdb-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c43574ac-6cdb-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 13:11:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89570170"
Date: Thu, 2 May 2019 15:08:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190502130852.r3ohrwgr4wvfqfuf@Air-de-Roger>
References: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] VT-d: suppress individual flushes during
 hwdom setup
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDY6Mjg6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUncyBhbiBpbnZvY2F0aW9uIG9mIGlvbW11X2ZsdXNoX2FsbCgpIGltbWVkaWF0
ZWx5IGFmdGVyd2FyZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5j
Cj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAtMTMxMCw4
ICsxMzEwLDExIEBAIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBpbnRlbF9pb21tdV9od2QKPiAg
Cj4gICAgICBzZXR1cF9od2RvbV9wY2lfZGV2aWNlcyhkLCBzZXR1cF9od2RvbV9kZXZpY2UpOwo+
ICAgICAgc2V0dXBfaHdkb21fcm1ycihkKTsKPiArCj4gICAgICAvKiBNYWtlIHN1cmUgd29ya2Fy
b3VuZHMgYXJlIGFwcGxpZWQgYmVmb3JlIGVuYWJsaW5nIHRoZSBJT01NVShzKS4gKi8KPiArICAg
IHRoaXNfY3B1KGlvbW11X2RvbnRfZmx1c2hfaW90bGIpID0gdHJ1ZTsKPiAgICAgIGFyY2hfaW9t
bXVfaHdkb21faW5pdChkKTsKPiArICAgIHRoaXNfY3B1KGlvbW11X2RvbnRfZmx1c2hfaW90bGIp
ID0gZmFsc2U7CgpEb24ndCB5b3Ugd2FudCB0byBhbHNvIGF2b2lkIGZsdXNoZXMgaW4gc2V0dXBf
aHdkb21fcm1yciBhbmQKc2V0dXBfaHdkb21fcGNpX2RldmljZXM/CgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
