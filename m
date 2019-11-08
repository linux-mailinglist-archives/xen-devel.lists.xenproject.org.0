Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321A4F403A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 07:09:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSxOQ-0005mr-77; Fri, 08 Nov 2019 06:05:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uDOX=ZA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSxOO-0005mm-F4
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 06:05:08 +0000
X-Inumbo-ID: b63794f2-01ed-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b63794f2-01ed-11ea-984a-bc764e2007e4;
 Fri, 08 Nov 2019 06:05:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3994AEF3;
 Fri,  8 Nov 2019 06:05:05 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191029175720.7354-1-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f5e47c3d-5f63-48de-f855-4b38f16dd6e9@suse.com>
Date: Fri, 8 Nov 2019 07:05:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191029175720.7354-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] tools/configure: Honour
 XEN_COMPILE_ARCH and _TARGET_ for shim
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMTkgMTg6NTcsIElhbiBKYWNrc29uIHdyb3RlOgo+IFRoZSBwdnNoaW0gY2FuIG9u
bHkgYmUgYnVpbHQgNjQtYml0IGJlY2F1c2UgdGhlIGh5cGVydmlzb3IgaXMgb25seQo+IDY0LWJp
dCBub3dhZGF5cy4gIFRoZSBoeXBlcnZpc29yIGJ1aWxkIHN1cHBvcnRzIFhFTl9DT01QSUxFX0FS
Q0ggYW5kCj4gWEVOX1RBUkdFVF9BUkNIIHdoaWNoIG92ZXJyaWRlIHRoZSBpbmZvcm1hdGlvbiBm
cm9tIHVuYW1lLiAgVGhlIHB2c2hpbQo+IGJ1aWxkIHJ1bnMgb3V0IG9mIHRoZSB0b29scy8gZGly
ZWN0b3J5IGJ1dCBjYWxscyB0aGUgaHlwZXJ2aXNvciBidWlsZAo+IHN5c3RlbS4KPiAKPiBJZiBv
bmUgcnVucyBpbiBhIExpbnV4IDMyLWJpdCB1c2VybGFuZCB3aXRoIGEgNjQtYml0IGtlcm5lbCwg
b25lIHVzZWQKPiB0byBiZSBhYmxlIHRvIHNldCBYRU5fQ09NUElMRV9BUkNILiAgQnV0IG5vd2Fk
YXlzIHRoaXMgZG9lcyBub3Qgd29yay4KPiBjb25maWd1cmUgc2VlcyB0aGUgdGFyZ2V0IGNwdSBh
cyA2NC1iaXQgYW5kIHRyaWVzIHRvIGJ1aWxkIHB2c2hpbS4KPiBUaGUgYnVpbGQgcHJpbnRzCj4g
ICAgZWNobyAiKioqIFhlbiB4ODYvMzIgdGFyZ2V0IG5vIGxvbmdlciBzdXBwb3J0ZWQhIgo+IGFu
ZCBkb2Vzbid0IGJ1aWxkIGFueXRoaW5nLiAgVGhlbiB0aGUgc3Vic2VxdWVudCBNYWtlZmlsZXMg
dHJ5IHRvCj4gaW5zdGFsbCB0aGUgbm9uLWJ1aWx0IHBpZWNlcy4KPiAKPiBGaXggdGhpcyBhbm9t
YWx5IGJ5IGNhdXNpbmcgY29uZmlndXJlIHRvIGhvbm91ciB0aGUgWGVuIGh5cGVydmlzb3Igd2F5
Cj4gb2Ygc2V0dGluZyB0aGUgdGFyZ2V0IGFyY2hpdGVjdHVyZS4KPiAKPiBJbiBwcmluY2lwbGUg
dGhpcyB1c2VyIGJlaGF2aW91ciBpcyBub3QgaGFuZGxlZCBxdWl0ZSByaWdodCwgYmVjYXVzZQo+
IGNvbmZpZ3VyZSB3aWxsIHN0aWxsIHNlZSA2NC1iaXQgYW5kIHNvIGFsbCB0aGUgYXV0b2NvbmYt
YmFzZWQKPiBhcmNoaXRlY3R1cmUgdGVzdGluZyB3aWxsIHNlZSA2NC1iaXQgcmF0aGVyIHRoYW4g
MzItYml0IHg4Ni4gIEJ1dCB0aGUKPiB0b29scyBhcmUgaW4gZmFjdCBnZW5lcmFsbHkgcXVpdGUg
cG9ydGFibGU6IHRoaXMgcGFydGljdWxhciBsb2NhdGlvbgo+IGluIGNvbmZpZ3VyZXsuYWMsfSBp
cyB0aGUgb25seSBwbGFjZSBpbiB0b29scy8gd2hlcmUgNjQtYml0IHg4NiBpcwo+IHRyZWF0ZWQg
ZGlmZmVyZW50bHkgZnJvbSAzMi1iaXQgeDg2LCBzbyB0aGUgZml4IGlzIHN1ZmZpY2llbnQgYW5k
Cj4gY29ycmVjdCBmb3IgdGhpcyB1c2UgY2FzZS4KPiAKPiBJdCByZW1haW5zIHRoZSBjYXNlIHRo
YXQgWEVOX0NPTVBJTEVfQVJDSCBvciBYRU5fVEFSR0VUX0FSQ0ggdG8gYQo+IG5vbi14ODYgYXJj
aGl0ZWN0dXJlLCB3aGVuIGNvbmZpZ3VyZSB0aGlua3MgdGhpbmdzIGFyZSB4ODYsIG9yIHZpY2UK
PiB2ZXJzYSwgd2lsbCBub3Qgd29yayByaWdodC4KPiAKPiBJIGhhdmUgcmVydW4gYXV0b2dlbi5z
aCwgc28gdGhpcyBwYXRjaCBjb250YWlucyB0aGUgZml4IHRvIGNvbmZpZ3VyZQo+IGFzIHdlbGwg
YXMgdGhlIHNvdXJjZSBmaXggdG8gY29uZmlndXJlLmFjLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENDOiBKw7xyZ2VuIEdyb8Of
IDxqZ3Jvc3NAc3VzZS5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
