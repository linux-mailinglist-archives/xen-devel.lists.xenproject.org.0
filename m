Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C74B345
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 09:45:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdVEl-0002oA-Fc; Wed, 19 Jun 2019 07:42:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdVEk-0002o5-1s
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 07:42:30 +0000
X-Inumbo-ID: c9921190-9265-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c9921190-9265-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 07:42:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 01:42:27 -0600
Message-Id: <5D09E75D0200007800239874@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 01:42:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
 <20190618232019.26425-1-sstabellini@kernel.org>
In-Reply-To: <20190618232019.26425-1-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 1/5] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDAxOjIwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gQWRkIGEgcDJtdCBwYXJhbWV0ZXIgdG8gbWFwX21taW9fcmVnaW9ucywgcGFzcyBwMm1fbW1p
b19kaXJlY3RfZGV2IG9uCj4gQVJNIGFuZCBwMm1fbW1pb19kaXJlY3Qgb24geDg2IC0tIG5vIGNo
YW5nZXMgaW4gYmVoYXZpb3IuIE9uIHg4NiwKPiBpbnRyb2R1Y2UgYSBtYWNybyB0byBzdHJpcCBh
d2F5IHRoZSBsYXN0IHBhcmFtZXRlciBhbmQgcmVuYW1lIHRoZQo+IGV4aXN0aW5nIGltcGxlbWVu
dGF0aW9uIG9mIG1hcF9tbWlvX3JlZ2lvbnMgdG8gX19tYXBfbW1pb19yZWdpb25zLgo+IFVzZSBf
X21hcF9tbWlvX3JlZ2lvbnMgaW4gdnBjaSBhcyBpdCBpcyB4ODYtb25seSB0b2RheS4KPiAKPiBP
biBBUk0sIGdpdmVuIHRoZSBzaW1pbGFyaXR5IGJldHdlZW4gbWFwX21taW9fcmVnaW9ucyBhZnRl
ciB0aGUgY2hhbmdlCj4gYW5kIG1hcF9yZWdpb25zX3AybXQsIHJlbW92ZSB1bi9tYXBfcmVnaW9u
c19wMm10LiBBbHNvIGFkZCBhbiBBU1NFUlQgdG8KPiBjaGVjayB0aGF0IG9ubHkgcDJtX21taW9f
KiB0eXBlcyBhcmUgcGFzc2VkIHRvIGl0Lgo+IAo+IEFsc28gZml4IHRoZSBzdHlsZSBvZiB0aGUg
Y29tbWVudCBvbiB0b3Agb2YgbWFwX21taW9fcmVnaW9ucyBzaW5jZSB3ZQo+IGFyZSBhdCBpdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5j
b20+Cj4gQ0M6IEpCZXVsaWNoQHN1c2UuY29tIAo+IENDOiBhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tIAo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gLSBjb2RlIHN0eWxlCj4gLSBpbnRyb2R1Y2Ug
X19tYXBfbW1pb19yZWdpb25zIG9uIHg4NgoKTm8uIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoZSBuYW1l
IGlzIGJhZGx5IGNob3NlbjogVGhlcmUgc2hvdWxkbid0IGJlCm5ldyBuYW1lIHNwYWNlIHZpb2xh
dGlvbnMuIEJ1dCAuLi4KCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPiBAQCAtMTAwMCw2ICsxMDAwLDE0IEBAIHN0YXRp
YyBpbmxpbmUgaW50IHAybV9lbnRyeV9tb2RpZnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgcDJt
X3R5cGVfdCBudCwKPiAgICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+ICsvKiB4ODYgZG9lc24ndCB1
c2UgdGhlIHAybXQgcGFyYW1ldGVyLCBqdXN0IHN0cmlwIGl0IGF3YXkgKi8KPiArI2RlZmluZSBt
YXBfbW1pb19yZWdpb25zKGQsIHN0YXJ0X2dmbiwgbnIsIG1mbiwgcDJtdCkgXAo+ICsgICAgICAg
ICAgICBfX21hcF9tbWlvX3JlZ2lvbnMoZCwgc3RhcnRfZ2ZuLCBuciwgbWZuKQo+ICtpbnQgX19t
YXBfbW1pb19yZWdpb25zKHN0cnVjdCBkb21haW4gKmQsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZ2ZuX3Qgc3RhcnRfZ2ZuLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgbnIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuKTsKPiArCgouLi4gZXhj
ZXB0IGZvciB0aGlzIHBlcmhhcHMgbm90IGJlaW5nIGV2ZXJ5b25lJ3MgdGFzdGUsIGlzIHRoZXJl
CmFueXRoaW5nIHdyb25nIHdpdGgganVzdAoKLyogeDg2IGRvZXNuJ3QgdXNlIHRoZSBwMm10IHBh
cmFtZXRlciwganVzdCBzdHJpcCBpdCBhd2F5ICovCiNkZWZpbmUgbWFwX21taW9fcmVnaW9ucyhk
LCBzdGFydF9nZm4sIG5yLCBtZm4sIHAybXQpIFwKICAgICAgICAgICAgbWFwX21taW9fcmVnaW9u
cyhkLCBzdGFydF9nZm4sIG5yLCBtZm4pCgoocGxhY2VkIGFoZWFkIG9mIHRoZSBwMm0tY29tbW9u
LmggaW5jbHVzaW9uIHBvaW50LCBzdWNoIHRoYXQKdGhlIG92ZXJyaWRlIHdvdWxkIGFsc28gYWZm
ZWN0IHRoZSBkZWNsYXJhdGlvbik/CgpUaGUgbmV4dCBiZXN0IChpbW8pIHNvbHV0aW9uIHdvdWxk
IGJlIHRvIHV0aWxpemUgdGhlIGZhY3QgdGhhdCB0aGUKZnVuY3Rpb24gaXMgbWlzLW5hbWVkIHJp
Z2h0IG5vdyBhbnl3YXk6IFRoZXJlJ3Mgbm8gcG9pbnQgZm9yIHRoZQpwbHVyYWwgaW4gaXRzIG5h
bWUgYWZhaWNzLiBIZW5jZSB0aGUgYWxpYXNpbmcgYWJvdmUgY291bGQgYWxzbwpnbyBiZXR3ZWVu
IG1hcF9tbWlvX3JlZ2lvbnMoKSBhbmQgbWFwX21taW9fcmVnaW9uKCksCmRlcGVuZGluZyBvbiB3
aGV0aGVyIHlvdSdkIHdhbnQgdG8gYWRqdXN0IHRoZSAiY29tbW9uIiBuYW1lCmF0IHRoZSBzYW1l
IHRpbWUgKGJ1dCBpZiB5b3UgZGlkIHNvLCB0aGVuIHBlcmhhcHMgdGhlIHVubWFwCmZ1bmN0aW9u
IHNob3VsZCBnZXQgcmVuYW1lZCB0b28pLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
