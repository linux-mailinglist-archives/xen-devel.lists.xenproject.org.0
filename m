Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35D153399
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 16:04:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izMAJ-0006wD-54; Wed, 05 Feb 2020 15:00:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izMAH-0006w8-Bi
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 15:00:29 +0000
X-Inumbo-ID: 3e5f0895-4828-11ea-9123-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e5f0895-4828-11ea-9123-12813bfff9fa;
 Wed, 05 Feb 2020 15:00:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izMAF-0007qS-NI; Wed, 05 Feb 2020 15:00:27 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izMAF-0001fA-DP; Wed, 05 Feb 2020 15:00:27 +0000
Date: Wed, 5 Feb 2020 15:00:24 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200205150024.44b5gmjnrzmr6sfr@debian>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-6-liuwe@microsoft.com>
 <20200205140416.GT4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205140416.GT4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v7 05/10] x86/hyperv: setup hypercall page
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDM6MDQ6MTZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKWy4uLl0KPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3Bh
Z2Uodm9pZCkKPiA+ICt7Cj4gPiArICAgIHVuaW9uIGh2X3g2NF9tc3JfaHlwZXJjYWxsX2NvbnRl
bnRzIGh5cGVyY2FsbF9tc3I7Cj4gPiArICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGd1ZXN0X2lk
Owo+ID4gKyAgICB1bnNpZ25lZCBsb25nIG1mbjsKPiA+ICsKPiA+ICsgICAgQlVJTERfQlVHX09O
KEhWX0hZUF9QQUdFX1NISUZUICE9IFBBR0VfU0hJRlQpOwo+ID4gKwo+ID4gKyAgICByZG1zcmwo
SFZfWDY0X01TUl9HVUVTVF9PU19JRCwgZ3Vlc3RfaWQucmF3KTsKPiA+ICsgICAgaWYgKCAhZ3Vl
c3RfaWQucmF3ICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgZ3Vlc3RfaWQucmF3ID0gZ2VuZXJh
dGVfZ3Vlc3RfaWQoKTsKPiA+ICsgICAgICAgIHdybXNybChIVl9YNjRfTVNSX0dVRVNUX09TX0lE
LCBndWVzdF9pZC5yYXcpOwo+ID4gKyAgICB9Cj4gPiArCj4gPiArICAgIHJkbXNybChIVl9YNjRf
TVNSX0hZUEVSQ0FMTCwgaHlwZXJjYWxsX21zci5hc191aW50NjQpOwo+ID4gKyAgICBpZiAoICFo
eXBlcmNhbGxfbXNyLmVuYWJsZSApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIG1mbiA9IEhWX0hD
QUxMX01GTjsKPiA+ICsgICAgICAgIGh5cGVyY2FsbF9tc3IuZW5hYmxlID0gMTsKPiA+ICsgICAg
ICAgIGh5cGVyY2FsbF9tc3IuZ3Vlc3RfcGh5c2ljYWxfYWRkcmVzcyA9IG1mbjsKPiA+ICsgICAg
ICAgIHdybXNybChIVl9YNjRfTVNSX0hZUEVSQ0FMTCwgaHlwZXJjYWxsX21zci5hc191aW50NjQp
Owo+ID4gKyAgICB9Cj4gPiArICAgIGVsc2UKPiA+ICsgICAgICAgIG1mbiA9IGh5cGVyY2FsbF9t
c3IuZ3Vlc3RfcGh5c2ljYWxfYWRkcmVzczsKPiAKPiBJcyBpdCBleHBlY3RlZCB0aGF0IHRoZSBn
dWVzdCBJRCBvciB0aGUgaHlwZXJjYWwgcGFnZSBpcyBhbHJlYWR5Cj4gc2V0dXA/Cj4gCj4gSWU6
IHdvdWxkIHZpcnR1YWwgZmlybXdhcmUgc2V0dXAgYW55IG9mIHRoaXM/IChhbmQgbm90IGNsZWFu
IGl0IHVwCj4gYWZ0ZXJ3YXJkcykKClRoZXJlIGlzIG5vIGRlZmluaXRpdmUgYW5zd2VyIHRvIHdo
eS93aGVuIHRoaXMgaGFwcGVucyBpbiBUTEZTLCBidXQgaXQKZG9lcyByZXF1aXJlIGd1ZXN0IHRv
IHJlc3BlY3QgdGhhdCBpcyBhbHJlYWR5IGluIHRoZSBNU1IuCgpXZWkuCgo+IAo+IFRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
