Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15871507E1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:01:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycFe-0001B3-Ni; Mon, 03 Feb 2020 13:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hwg8=3X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iycFd-0001Ax-3a
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:58:57 +0000
X-Inumbo-ID: 51d6af54-468d-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51d6af54-468d-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 13:58:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iycFb-0002kE-L0; Mon, 03 Feb 2020 13:58:55 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iycFb-0008LD-BT; Mon, 03 Feb 2020 13:58:55 +0000
Date: Mon, 3 Feb 2020 13:58:52 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203135852.uivr26b47uxqu3rq@debian>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-2-liuwe@microsoft.com>
 <9a162fec-989d-c85c-68e5-4e5064d90ca9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a162fec-989d-c85c-68e5-4e5064d90ca9@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6 01/11] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDE6NTY6NDhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzEuMDEuMjAyMCAxODo0OSwgV2VpIExpdSB3cm90ZToKPiA+IFdlIHdhbnQgdG8g
YmUgYWJsZSB0byBoYW5kbGUgQVAgc2V0dXAgZXJyb3IgaW4gdGhlIHVwcGVyIGxheWVyLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+ID4gLS0t
Cj4gPiB2NjoKPiA+IDEuIENoYW5nZSBtYXBfdmNwdWluZm8gYXMgd2VsbAo+IAo+IEFuZCBieSBp
bXBsaWNhdGlvbiB0aGVuIC4uLgo+IAo+ID4gQEAgLTI1NywxMSArMjU3LDE3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBzZXR1cCh2b2lkKQo+ID4gICAgICBpbml0X2V2dGNobigpOwo+ID4gIH0KPiA+
ICAKPiA+IC1zdGF0aWMgdm9pZCBhcF9zZXR1cCh2b2lkKQo+ID4gK3N0YXRpYyBpbnQgYXBfc2V0
dXAodm9pZCkKPiA+ICB7Cj4gPiArICAgIGludCByYzsKPiA+ICsKPiA+ICAgICAgc2V0X3ZjcHVf
aWQoKTsKPiA+IC0gICAgbWFwX3ZjcHVpbmZvKCk7Cj4gPiAtICAgIGluaXRfZXZ0Y2huKCk7Cj4g
PiArICAgIHJjID0gbWFwX3ZjcHVpbmZvKCk7Cj4gPiArCj4gPiArICAgIGlmICggIXJjICkKPiA+
ICsgICAgICAgIGluaXRfZXZ0Y2huKCk7Cj4gCj4gLi4uIGluaXRfZXZ0Y2huKCkgYXMgd2VsbD8K
Ck9LLiBJIGNhbiBjaGFuZ2UgdGhhdCB0b28uCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
