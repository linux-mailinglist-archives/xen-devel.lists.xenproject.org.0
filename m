Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D864B1442C6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:09:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itwyS-0000LJ-Fe; Tue, 21 Jan 2020 17:05:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mp0=3K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1itwyQ-0000LE-6J
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:05:54 +0000
X-Inumbo-ID: 4330d99c-3c70-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4330d99c-3c70-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 17:05:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5EDBCB109;
 Tue, 21 Jan 2020 17:05:44 +0000 (UTC)
To: Kevin Stange <kevin@steadfast.net>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <ed20195d-3272-6ce8-d3b4-a17e459733c2@steadfast.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1e150c03-13fc-edd8-90a9-71ac669965f3@suse.com>
Date: Tue, 21 Jan 2020 18:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <ed20195d-3272-6ce8-d3b4-a17e459733c2@steadfast.net>
Content-Language: en-US
Subject: Re: [Xen-devel] libvirt support for scheduler credit2
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
Cc: Jim Fehlig <jfehlig@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAgMTc6NTYsIEtldmluIFN0YW5nZSB3cm90ZToKPiBIaSwKPiAKPiBJIGxvb2tl
ZCBhcm91bmQgYSBiaXQgYW5kIHdhc24ndCBhYmxlIHRvIGZpbmQgYSBnb29kIGFuc3dlciB0byB0
aGlzLCBzbwo+IEdlb3JnZSBzdWdnZXN0ZWQgSSBhc2sgaGVyZS4KCkNjLWluZyBKaW0uCgo+IAo+
IFNpbmNlIFhlbiA0LjEyLCBjcmVkaXQyIGlzIHRoZSBkZWZhdWx0IHNjaGVkdWxlciwgYnV0IGF0
IGxlYXN0IGFzIG9mCj4gbGlidmlydCA1LjEuMCB2aXJzaCBkb2Vzbid0IGFwcGVhciB0byB1bmRl
cnN0YW5kIGNyZWRpdDIgYW5kIHByb2R1Y2VzCj4gdGhpcyBzb3J0IG9mIG91dHB1dDoKPiAKPiAj
IHhsIHNjaGVkLWNyZWRpdDIgLWQgeXc2aGs3bW82enkzazgKPiBOYW1lICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBJRCBXZWlnaHQgIENhcAo+IHl3NmhrN21vNnp5M2s4ICAgICAgICAg
ICAgICAgICAgICAgICA0ICAgICAxMCAgICAwCj4gIyB2aXJzaCBzY2hlZGluZm8geXc2aGs3bW82
enkzazgKPiBTY2hlZHVsZXIgICAgICA6IGNyZWRpdDIKPiAKPiBDb21wYXJlZCB0byBhIGhvc3Qg
cnVubmluZyBjcmVkaXQ6Cj4gCj4gIyB4bCBzY2hlZC1jcmVkaXQgLWQgZ3Z6MmIxNnNxMzhkdjkK
PiBOYW1lICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJRCBXZWlnaHQgIENhcAo+IGd2
ejJiMTZzcTM4ZHY5ICAgICAgICAgICAgICAgICAgICAgIDE0ICAgIDgwMCAgICAwCj4gIyB2aXJz
aCBzY2hlZGluZm8gZ3Z6MmIxNnNxMzhkdjkKPiBTY2hlZHVsZXIgICAgICA6IGNyZWRpdAo+IHdl
aWdodCAgICAgICAgIDogODAwCj4gY2FwICAgICAgICAgICAgOiAwCj4gCj4gVHJ5aW5nIHRvIGNo
YW5nZSB0aGUgd2VpZ2h0IGRvZXMgbm90aGluZywgbm90IGV2ZW4gcHJvZHVjaW5nIGFuIGVycm9y
Cj4gbWVzc2FnZToKPiAKPiAjIHZpcnNoIHNjaGVkaW5mbyBzeXV4cGxzbWRpaGN3YyAtLXdlaWdo
dCAzMDAKPiBTY2hlZHVsZXIgICAgICA6IGNyZWRpdDIKPiAKPiAjIHhsIHNjaGVkLWNyZWRpdDIg
LWQgc3l1eHBsc21kaWhjd2MKPiBOYW1lICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJ
RCBXZWlnaHQgIENhcAo+IHN5dXhwbHNtZGloY3djICAgICAgICAgICAgICAgICAgICAgIDIzICAg
IDQwMCAgICAwCj4gCj4gSXMgdGhlcmUgYSB2ZXJzaW9uIG9mIGxpYnZpcnQgd2hlcmUgSSBjYW4g
ZXhwZWN0IHRoaXMgdG8gd29yaywgb3IgaXMgaXQKPiBub3Qgc3VwcG9ydGVkIHlldD8gIEFzIGEg
d29ya2Fyb3VuZCBmb3Igbm93IEkndmUgYWRkZWQgc2NoZWQ9Y3JlZGl0IHRvCj4gbXkgY29tbWFu
ZCBsaW5lLCBidXQgaXQgd291bGQgYmUgbmljZSB0byBnYWluIHRoZSBiZW5lZml0cyBvZiBpbXBy
b3ZlZAo+IHNjaGVkdWxpbmcgYXQgc29tZSBwb2ludC4KPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
