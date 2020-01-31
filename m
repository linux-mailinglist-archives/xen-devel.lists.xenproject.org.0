Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860E14ED0B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:14:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixW5s-0002ny-P2; Fri, 31 Jan 2020 13:12:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixW5s-0002nt-03
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:12:20 +0000
X-Inumbo-ID: 4f5e18b6-442b-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f5e18b6-442b-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 13:12:19 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixW5q-0002WU-G8; Fri, 31 Jan 2020 13:12:18 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixW5q-0002vd-6H; Fri, 31 Jan 2020 13:12:18 +0000
Date: Fri, 31 Jan 2020 13:12:15 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Message-ID: <20200131131215.bc7daxfbasudiwbi@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-6-liuwe@microsoft.com>
 <20200130003047.pg3dxgy4vtqjhayo@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130003047.pg3dxgy4vtqjhayo@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 05/12] x86: provide executable fixmap
 facility
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6MzA6NDdBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAwODoyMDoyN1BNICswMDAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gIAo+ID4gK3ZvaWQgX19zZXRfZml4bWFwX3goCj4gPiArICAgIGVudW0gZml4ZWRfYWRk
cmVzc2VzX3ggaWR4LCB1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBmbGFncykKPiA+
ICt7Cj4gPiArICAgIEJVR19PTihpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzX3ggfHwg
aWR4IDw9IEZJWF9YX1JFU0VSVkVEKTsKPiA+ICsgICAgbWFwX3BhZ2VzX3RvX3hlbihfX2ZpeF94
X3RvX3ZpcnQoaWR4KSwgX21mbihtZm4pLCAxLCBmbGFncyk7Cj4gPiArCj4gPiArICAgIC8qIEdl
bmVyYXRlIGEgc3ltYm9sIHRvIGJlIHVzZWQgaW4gbGlua2VyIHNjcmlwdCAqLwo+ID4gKyAgICBh
c20gKCAiLmVxdSBGSVhBRERSX1hfU0laRSwgJWMwOyAuZ2xvYmFsIEZJWEFERFJfWF9TSVpFIgo+
ID4gKyAgICAgICAgICA6OiAiaSIgKF9fZW5kX29mX2ZpeGVkX2FkZHJlc3Nlc194IDw8IFBBR0Vf
U0hJRlQpICk7Cj4gCj4gVGhlIChfX2VuZCA8PCBTSElGVCkgcGFydCBjYW4gYmUgcmVwbGFjZWQg
d2l0aCBGSVhBRERSX1hfU0laRSAodGhlIG1hY3JvCj4gZGVmaW5lZCBpbiBmaXhtYXAuaCkgZGly
ZWN0bHkuCgpJIGFsc28gZGlzY292ZXIgdGhhdCB0aGlzIHNuaXBwZXQgdG8gZ2VuZXJhdGUgc3lt
Ym9sIHNob3VsZCBiZSBtb3ZlZAplbHNlIHdoZXJlIGJlY2F1c2UgaWYgSHlwZXItViBzdXBwb3J0
IGlzIGNvbXBpbGVkIG91dCwgdGhpcyBmdW5jdGlvbiBoYXMKbm8gdXNlci4gVGhhdCBjYXVzZXMg
aXQgdG8gYmUgRENFJ2QuIEZJWEFERFJfWF9TSVpFIHdvdWxkIGJlIGdvbmUgYW5kCmxpbmtpbmcg
d291bGQgZmFpbC4KCkkgaGF2ZSBtb3ZlZCB0aGlzIHRvIGFyY2hfaW5pdF9tZW1vcnkuIEl0cyBz
dG9yYWdlIHdpbGwgYmUgcmVjbGFpbWVkCmR1cmluZyBydW50aW1lLCBidXQgdGhpcyBzeW1ib2wg
aXMgbm90IHVzZWQgYW55d2hlcmUgZWxzZSBpbiBjb2RlLCBzbyB3ZQpzaG91bGQgYmUgZmluZS4K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
