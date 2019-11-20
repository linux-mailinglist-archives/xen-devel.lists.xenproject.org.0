Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1EF1040D7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 17:33:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSsK-0002nI-57; Wed, 20 Nov 2019 16:30:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXSsJ-0002nD-BA
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 16:30:39 +0000
X-Inumbo-ID: 156fceca-0bb3-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 156fceca-0bb3-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 16:30:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 053AEB30DE;
 Wed, 20 Nov 2019 16:30:36 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
Message-ID: <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
Date: Wed, 20 Nov 2019 17:30:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH v2] build: provide option to disambiguate
 symbol names
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTEuMjAxOSAxMjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIC5maWxlIGFzc2Vt
YmxlciBkaXJlY3RpdmVzIGdlbmVyYXRlZCBieSB0aGUgY29tcGlsZXIgZG8gbm90IGluY2x1ZGUK
PiBhbnkgcGF0aCBjb21wb25lbnRzIChnY2MpIG9yIGp1c3QgdGhlIG9uZXMgc3BlY2lmaWVkIG9u
IHRoZSBjb21tYW5kIGxpbmUKPiAoY2xhbmcsIGF0IGxlYXN0IHZlcnNpb24gNSksIGFuZCBoZW5j
ZSBtdWx0aXBsZSBpZGVudGljYWxseSBuYW1lZCBzb3VyY2UKPiBmaWxlcyAoaW4gZGlmZmVyZW50
IGRpcmVjdG9yaWVzKSBtYXkgcHJvZHVjZSBpZGVudGljYWxseSBuYW1lZCBzdGF0aWMKPiBzeW1i
b2xzIChpbiB0aGVpciBrYWxsc3ltcyByZXByZXNlbnRhdGlvbikuIFRoZSBiaW5hcnkgZGlmZmlu
ZyBhbGdvcml0aG0KPiB1c2VkIGJ5IHhlbi1saXZlcGF0Y2gsIGhvd2V2ZXIsIGRlcGVuZHMgb24g
aGF2aW5nIHVuaXF1ZSBzeW1ib2xzLgo+IAo+IE1ha2UgdGhlIEVORk9SQ0VfVU5JUVVFX1NZTUJP
TFMgS2NvbmZpZyBvcHRpb24gY29udHJvbCB0aGUgKGJ1aWxkKQo+IGJlaGF2aW9yLCBhbmQgaWYg
ZW5hYmxlZCB1c2Ugb2JqY29weSB0byBwcmVwZW5kIHRoZSAocmVsYXRpdmUgdG8gdGhlCj4geGVu
LyBzdWJkaXJlY3RvcnkpIHBhdGggdG8gdGhlIGNvbXBpbGVyIGludm9rZWQgU1RUX0ZJTEUgc3lt
Ym9scy4gTm90ZQo+IHRoYXQgdGhpcyBidWlsZCBvcHRpb24gaXMgbWFkZSBubyBsb25nZXIgZGVw
ZW5kIG9uIExJVkVQQVRDSCwgYnV0IG1lcmVseQo+IGRlZmF1bHRzIHRvIGl0cyBzZXR0aW5nIG5v
dy4KPiAKPiBDb25kaXRpb25hbGl6ZSBleHBsaWNpdCAuZmlsZSBkaXJlY3RpdmUgaW5zZXJ0aW9u
IGluIEMgZmlsZXMgd2hlcmUgaXQKPiBleGlzdHMganVzdCB0byBkaXNhbWJpZ3VhdGUgbmFtZXMg
aW4gYSBsZXNzIGdlbmVyaWMgbWFubmVyOyBub3RlIHRoYXQKPiBhdCB0aGUgc2FtZSB0aW1lIHRo
ZSByZWR1bmRhbnQgZW1pc3Npb24gb2YgU1RUX0ZJTEUgc3ltYm9scyBnZXRzCj4gc3VwcHJlc3Nl
ZCBmb3IgY2xhbmcuIEFzc2VtYmxlciBmaWxlcyBhcyB3ZWxsIGFzIG11bHRpcGx5IGNvbXBpbGVk
IEMKPiBvbmVzIHVzaW5nIF9fT0JKRUNUX0ZJTEVfXyBhcmUgbGVmdCBhbG9uZSBmb3IgdGhlIHRp
bWUgYmVpbmcuCj4gCj4gU2luY2Ugd2Ugbm93IGV4cGVjdCB0aGVyZSBub3QgdG8gYmUgYW55IGR1
cGxpY2F0ZXMgYW55bW9yZSwgYWxzbyBkb24ndAo+IGZvcmNlIHRoZSBzZWxlY3Rpb24gb2YgdGhl
IG9wdGlvbiB0byAnbicgYW55bW9yZSBpbiBhbGxyYW5kb20uY29uZmlnLgo+IFNpbWlsYXJseSBD
T1ZFUkFHRSBubyBsb25nZXIgc3VwcHJlc3NlcyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIGlm
Cj4gZW5mb3JjZW1lbnQgaXMgaW4gZWZmZWN0LCB3aGljaCBpbiB0dXJuIGFsbG93cwo+IFNVUFBS
RVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1MgdG8gc2ltcGx5IGRlcGVuZCBvbgo+ICFFTkZP
UkNFX1VOSVFVRV9TWU1CT0xTLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkkndmUgZ290IGFja3MgZnJvbSBLb25yYWQgYW5kIFdlaSwgYnV0IHN0
aWxsIG5lZWQgYW4geDg2IGFuZCBhIHJlbGVhc2UKb25lIGhlcmUuIEFuZHJldz8gT3IgYWx0ZXJu
YXRpdmVseSAtIErDvHJnZW4sIHdvdWxkIHlvdSByYXRoZXIgbm90IHNlZQp0aGlzIGdvIGluIGFu
eW1vcmU/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
