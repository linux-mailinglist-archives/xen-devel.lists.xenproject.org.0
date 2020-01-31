Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80614ED2B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:23:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWEH-0003vX-Mx; Fri, 31 Jan 2020 13:21:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixWEG-0003vQ-3J
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:21:00 +0000
X-Inumbo-ID: 856b5ce2-442c-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 856b5ce2-442c-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 13:20:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixWEE-0002iQ-Am; Fri, 31 Jan 2020 13:20:58 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixWEE-0003EA-0t; Fri, 31 Jan 2020 13:20:58 +0000
Date: Fri, 31 Jan 2020 13:20:54 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200131132054.mpq4ph2p6oqiu2sn@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-6-liuwe@microsoft.com>
 <20200130003047.pg3dxgy4vtqjhayo@debian>
 <20200131131215.bc7daxfbasudiwbi@debian>
 <debd27c2-e2ba-a887-01f7-ec1e0455fc2a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <debd27c2-e2ba-a887-01f7-ec1e0455fc2a@suse.com>
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
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDI6MTk6MTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzEuMDEuMjAyMCAxNDoxMiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwgSmFu
IDMwLCAyMDIwIGF0IDEyOjMwOjQ3QU0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPj4gT24gV2Vk
LCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MjdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+Pj4g
IAo+ID4+PiArdm9pZCBfX3NldF9maXhtYXBfeCgKPiA+Pj4gKyAgICBlbnVtIGZpeGVkX2FkZHJl
c3Nlc194IGlkeCwgdW5zaWduZWQgbG9uZyBtZm4sIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gPj4+
ICt7Cj4gPj4+ICsgICAgQlVHX09OKGlkeCA+PSBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXNfeCB8
fCBpZHggPD0gRklYX1hfUkVTRVJWRUQpOwo+ID4+PiArICAgIG1hcF9wYWdlc190b194ZW4oX19m
aXhfeF90b192aXJ0KGlkeCksIF9tZm4obWZuKSwgMSwgZmxhZ3MpOwo+ID4+PiArCj4gPj4+ICsg
ICAgLyogR2VuZXJhdGUgYSBzeW1ib2wgdG8gYmUgdXNlZCBpbiBsaW5rZXIgc2NyaXB0ICovCj4g
Pj4+ICsgICAgYXNtICggIi5lcXUgRklYQUREUl9YX1NJWkUsICVjMDsgLmdsb2JhbCBGSVhBRERS
X1hfU0laRSIKPiA+Pj4gKyAgICAgICAgICA6OiAiaSIgKF9fZW5kX29mX2ZpeGVkX2FkZHJlc3Nl
c194IDw8IFBBR0VfU0hJRlQpICk7Cj4gPj4KPiA+PiBUaGUgKF9fZW5kIDw8IFNISUZUKSBwYXJ0
IGNhbiBiZSByZXBsYWNlZCB3aXRoIEZJWEFERFJfWF9TSVpFICh0aGUgbWFjcm8KPiA+PiBkZWZp
bmVkIGluIGZpeG1hcC5oKSBkaXJlY3RseS4KPiA+IAo+ID4gSSBhbHNvIGRpc2NvdmVyIHRoYXQg
dGhpcyBzbmlwcGV0IHRvIGdlbmVyYXRlIHN5bWJvbCBzaG91bGQgYmUgbW92ZWQKPiA+IGVsc2Ug
d2hlcmUgYmVjYXVzZSBpZiBIeXBlci1WIHN1cHBvcnQgaXMgY29tcGlsZWQgb3V0LCB0aGlzIGZ1
bmN0aW9uIGhhcwo+ID4gbm8gdXNlci4gVGhhdCBjYXVzZXMgaXQgdG8gYmUgRENFJ2QuIEZJWEFE
RFJfWF9TSVpFIHdvdWxkIGJlIGdvbmUgYW5kCj4gPiBsaW5raW5nIHdvdWxkIGZhaWwuCj4gPiAK
PiA+IEkgaGF2ZSBtb3ZlZCB0aGlzIHRvIGFyY2hfaW5pdF9tZW1vcnkuIEl0cyBzdG9yYWdlIHdp
bGwgYmUgcmVjbGFpbWVkCj4gPiBkdXJpbmcgcnVudGltZSwgYnV0IHRoaXMgc3ltYm9sIGlzIG5v
dCB1c2VkIGFueXdoZXJlIGVsc2UgaW4gY29kZSwgc28gd2UKPiA+IHNob3VsZCBiZSBmaW5lLgo+
IAo+IFN0b3JhZ2U/IFRoaXMgaXMgYSBjb25zdGFudCwgaS5lLiBqdXN0IGEgc3ltYm9sIHdpdGhv
dXQgYW55CgoiSXRzIiBtZWFuaW5nIGFyY2hfaW5pdF9tZW1vcnksIGJ1dCBJIHdhc24ndCBjbGVh
ci4gU29ycnkuCgo+IHN0b3JhZ2UuIFRoZXJlZm9yZSBhbiBfX2luaXQgZnVuY3Rpb24gaXMgYSB2
ZXJ5IGdvb2QgcGxhY2UgdG8KPiBwdXQgaXQuIEl0IGNvdWxkIGFsc28gbGl2ZSBvdXRzaWRlIG9m
IGFueSBmdW5jdGlvbiwgaWYgb25seQo+IGZpbGUgc2NvcGUgYXNtKCktcyBmaW5hbGx5IHBlcm1p
dHRlZCBbY2VydGFpbl0gaW5wdXRzLgoKVHJpZWQgcHV0dGluZyBpbiBpbiBmaWxlIHNjb3BlLCBk
aWRuJ3Qgd29yay4KCldlaS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
