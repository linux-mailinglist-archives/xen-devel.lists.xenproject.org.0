Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D4E14D99B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:21:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix7qp-0007fm-6c; Thu, 30 Jan 2020 11:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ix7qn-0007fc-MU
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:19:09 +0000
X-Inumbo-ID: 55990760-4352-11ea-8396-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55990760-4352-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 11:19:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix7ql-0002TJ-UN; Thu, 30 Jan 2020 11:19:07 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix7ql-0004n5-L7; Thu, 30 Jan 2020 11:19:07 +0000
Date: Thu, 30 Jan 2020 11:19:04 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200130111904.do62cvm4xsnqf5xy@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-8-liuwe@microsoft.com>
 <b4f88a8788a64ba2bbdc95a3812d9fa7@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4f88a8788a64ba2bbdc95a3812d9fa7@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 07/12] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDk6NTc6MTdBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsKPiA+
IC0gICAgLm5hbWUgPSAiSHlwZXItViIsCj4gPiAtfTsKPiA+ICtzdGF0aWMgdWludDY0X3QgZ2Vu
ZXJhdGVfZ3Vlc3RfaWQodm9pZCkKPiA+ICt7Cj4gPiArICAgIHVpbnQ2NF90IGlkOwo+ID4gKwo+
ID4gKyAgICBpZCA9ICh1aW50NjRfdClIVl9YRU5fVkVORE9SX0lEIDw8IDQ4Owo+ID4gKyAgICBp
ZCB8PSAoeGVuX21ham9yX3ZlcnNpb24oKSA8PCAxNikgfCB4ZW5fbWlub3JfdmVyc2lvbigpOwo+
ID4gKwo+ID4gKyAgICByZXR1cm4gaWQ7Cj4gCj4gSSB0aGluayB0aGlzIHNob3VsZCB1c2UgdGhl
IGh2X2d1ZXN0X29zX2lkIHVuaW9uLiBZb3UgY2FuIHRoZW4gc2V0IHRoZQo+IHZhbHVlcyB1c2lu
ZyB0aGUgYml0LWZpZWxkcyBhbmQgcmV0dXJuIHRoZSByYXcuCgpOUC4KCldlaS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
