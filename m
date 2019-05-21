Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143D25092
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 15:37:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT4uI-0004Ow-VI; Tue, 21 May 2019 13:34:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hT4uH-0004Or-MW
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 13:34:17 +0000
X-Inumbo-ID: 1f513bde-7bcd-11e9-b119-af3ca343ce82
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f513bde-7bcd-11e9-b119-af3ca343ce82;
 Tue, 21 May 2019 13:34:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 21 May 2019 07:34:12 -0600
Message-Id: <5CE3FE52020000780023100F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 21 May 2019 07:34:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8482020000780021F217@prv1-mh.provo.novell.com>
 <3ff5b0e5-fca3-3c86-5be4-4eeadf43a9dd@citrix.com>
In-Reply-To: <3ff5b0e5-fca3-3c86-5be4-4eeadf43a9dd@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 26/50] x86emul: support remaining
 AVX512BW legacy-equivalent insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA1LjE5IGF0IDE1OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+IEBAIC00MzUsNyArNDM1LDEwIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZXh0MGYzOF90YWJsZSB7Cj4+ICAgICAgZGlzcDhzY2FsZV90IGQ4czo0
Owo+PiAgfSBleHQwZjM4X3RhYmxlWzI1Nl0gPSB7Cj4+ICAgICAgWzB4MDBdID0geyAuc2ltZF9z
aXplID0gc2ltZF9wYWNrZWRfaW50LCAuZDhzID0gZDhzX3ZsIH0sCj4+IC0gICAgWzB4MDEgLi4u
IDB4MGJdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50IH0sCj4+ICsgICAgWzB4MDEg
Li4uIDB4MDNdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50IH0sCj4+ICsgICAgWzB4
MDRdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50LCAuZDhzID0gZDhzX3ZsIH0sCj4+
ICsgICAgWzB4MDUgLi4uIDB4MGJdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50IH0s
Cj4+ICsgICAgWzB4MGJdID0geyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfaW50LCAuZDhzID0g
ZDhzX3ZsIH0sCj4gCj4gSXQgZG9lc24ndCBsb29rIGFzIGlmIHlvdSBtZWFuIDB4MGIgdHdpY2Ug
aGVyZSwgYWx0aG91Z2ggaXRzIHF1aXRlCj4gcG9zc2libGUgdGhhdCBHQ0MgZWxpZGVzIGl0IHNp
bGVudGx5IChDbGFuZyBkZWZpbml0ZWx5IHdvbid0KS4KCkluZGVlZCwgSSBmYWlsZWQgdG8gZWRp
dCB0aGUgdXBwZXIgYm91bmQgb2YgdGhlIHJhbmdlIGluIHF1ZXN0aW9uIC0Kd2l0aCBnY2MgdGhl
IGxhc3QgaW5pdGlhbGl6ZXIgZm9yIGFuIGFycmF5IHNsb3Qgd2lucy4gRml4ZWQgZm9yIHY5LgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
