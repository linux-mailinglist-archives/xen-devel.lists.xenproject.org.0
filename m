Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA2CAFA05
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:10:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zXI-0005wX-DW; Wed, 11 Sep 2019 10:07:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7zXH-0005wS-E0
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:07:39 +0000
X-Inumbo-ID: fb7760aa-d47b-11e9-ac27-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb7760aa-d47b-11e9-ac27-12813bfff9fa;
 Wed, 11 Sep 2019 10:07:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0038B876;
 Wed, 11 Sep 2019 10:07:36 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <20190911062001.25931-5-jgross@suse.com>
 <97a771af-32a3-596d-30e2-7042374d14e3@suse.com>
 <4ffa80f0-5d63-9d84-9030-9c5eaecc1541@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a00f9b2a-1a2d-145f-daaf-6cd8cc4d3f25@suse.com>
Date: Wed, 11 Sep 2019 12:07:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4ffa80f0-5d63-9d84-9030-9c5eaecc1541@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 4/5] tools: add xenfs tool
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAxMTo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS4wOS4xOSAx
MTozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDExLjA5LjIwMTkgMDg6MjAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS90b29scy9taXNjL01ha2VmaWxlCj4+PiArKysgYi90b29s
cy9taXNjL01ha2VmaWxlCj4+PiBAQCAtMjQsNiArMjQsNyBAQCBJTlNUQUxMX1NCSU4tJChDT05G
SUdfWDg2KSAgICAgKz0geGVuLWxvd21lbWQKPj4+ICAgSU5TVEFMTF9TQklOLSQoQ09ORklHX1g4
NikgICAgICs9IHhlbi1tZm5kdW1wCj4+PiAgIElOU1RBTExfU0JJTi0kKENPTkZJR19YODYpICAg
ICArPSB4ZW4tdWNvZGUKPj4+ICAgSU5TVEFMTF9TQklOICAgICAgICAgICAgICAgICAgICs9IHhl
bmNvdgo+Pj4gK0lOU1RBTExfU0JJTiAgICAgICAgICAgICAgICAgICArPSB4ZW5mcwo+Pgo+PiBX
aHkgU0JJTj8gSXMgdGhlcmUgYW55dGhpbmcgd3Jvbmcgd2l0aCBhbGxvd2luZyB1bnByaXZpbGVn
ZWQKPj4gdXNlcnMgci9vIGFjY2Vzcz8gT3IgaXMgdGhpcyBiZWNhdXNlIGluIG9yZGVyIHRvIGFj
Y2VzcyB0aGUKPj4gaHlwZXJjYWxsIGludGVyZmFjZSBvbmUgbmVlZHMgdG8gYmUgcm9vdD8gSWYg
c28sIHdlIG1heSB3YW50Cj4+IHRvIGNvbnNpZGVyIHJlbGF4aW5nL2F2b2lkaW5nL2J5cGFzc2lu
ZyB0aGlzIGluIHNvbWUgc2Vuc2libGUKPj4gd2F5Lgo+IAo+IEluc3RhbGxpbmcgdG8gYmluIGlz
IGZpbmUgd2l0aCBtZSwgYnV0IHJlbGF4aW5nIHRoZSByb290IHJlc3RyaWN0aW9uCj4gbWlnaHQg
YmUgbW9yZSBkaWZmaWN1bHQgYW5kL29yIHF1ZXN0aW9uYWJsZS4KPiAKPiBJIHdhcyB0aGlua2lu
ZyBvZiAibW91bnRpbmciIHRoZSB4ZW4tc3lzZnMgdG8gZWl0aGVyIFhlbnN0b3JlIG9yCj4gdGhl
IGtlcm5lbCdzIHN5c2ZzIChwcm9iYWJseSB0aGUgbGF0dGVyLCBhcyBYZW5zdG9yZSBpbiBhIHN0
dWJkb20KPiB3b3VsZCBuZWVkIHRvIGVuYWJsZSBhY2Nlc3MgdG8geGVuLXN5c2ZzIGZvciB0aGF0
IHN0dWJkb20gLHRvbykuCj4gCj4gVGhpcyB3b3VsZCB0aGVuIGVuYWJsZSBhY2Nlc3Npbmcgc29t
ZSBvciBhbGwgZW50cmllcyBmcm9tIG5vbi1yb290LgoKUmlnaHQsIGdvaW5nIHRocm91Z2ggdGhl
IGtlcm5lbCdzIHN5c2ZzIGlzIHdoYXQgSSB0b28gd2FzCmNvbnNpZGVyaW5nIChJIGRvbid0IHRo
aW5rIHhlbnN0b3JlIGlzIGFwcHJvcHJpYXRlIGZvciB0aGlzKS4KVGhlIG1haW4gaXNzdWUgSSdk
IHNlZSB3aXRoIHRoaXMgaXMgdGhlIHNwbGl0IGJyYWluIHBlcm1pc3Npb25zCmhhbmRsaW5nLiBJ
J2QgcHJlZmVyIGZvciB0aGVyZSB0byBiZSBqdXN0IG9uZSBwYXJ0eSBkZXRlcm1pbmluZwp3aG8g
aXMgYWxsb3dlZCB0byBzZWUgd2hhdCwgYnV0IGV2ZW4gaWYgdGhlIGh5cGVydmlzb3IgdG9sZCB0
aGUKa2VybmVsLCB0aGVyZSB3b3VsZCBzdGlsbCBiZSBhIGRlcGVuZGVuY3kgdXBvbiB0aGUga2Vy
bmVsIGFsc28KcmVzcGVjdGluZyB0aGUgcmVxdWVzdC4gV2hpbGUgbm90IG11Y2ggb2YgYSBwcm9i
bGVtIGFzIGxvbmcgYXMKYWxsIG9mIHRoaXMgaXMgRG9tMC1vbmx5LCB3aXRoIERvbVUtcyBpbiBt
aW5kIHRoaXMgd291bGQgbmVlZAp0YWtpbmcgY2FyZSBvZi4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
