Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96935BE0EE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:12:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD8va-0003St-K3; Wed, 25 Sep 2019 15:10:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iD8vZ-0003Pt-Te
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:10:01 +0000
X-Inumbo-ID: 8b647e48-dfa6-11e9-9636-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 8b647e48-dfa6-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:10:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BE651000;
 Wed, 25 Sep 2019 08:10:00 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51DAD3F59C;
 Wed, 25 Sep 2019 08:09:59 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <262f9d04-fe7c-c94c-f2bc-86678cbb5935@arm.com>
Date: Wed, 25 Sep 2019 16:09:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/3] arch/arm: optee: fix TODOs and
 change status to "Tech Preview"
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMjQvMDkvMjAxOSAxNjo0NiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gVGhpcyBpcyB0aGUgdGhpcmQgdmVyc2lvbiBvZiBtYXR1cmluZyB0aGUgT1AtVEVFIG1l
ZGlhdG9yIHBhdGNoZXMuCj4gCj4gQ2hhbmdlcyBhbHNvIGNhbiBiZSBwdWxsZWQgZnJvbSBbM10u
Cj4gCj4gQ2hhbmdlcyBmcm9tIHYyOgo+ICAgLSBUaGUgZm9sbG93aW5nIDMgcGF0Y2hlcyB3ZXJl
IGNvbW1pdGVkOgo+ICAgeGVuL2FybTogb3B0ZWU6IGltcG9zZSBsaW1pdCBvbiBzaGFyZWQgYnVm
ZmVyIHNpemUKPiAgIHhlbi9hcm06IG9wdGVlOiBjaGVjayBmb3IgcHJlZW1wdGlvbiB3aGlsZSBm
cmVlaW5nIHNoYXJlZCBidWZmZXJzCj4gICB4ZW4vYXJtOiBvcHRlZTogbGltaXQgbnVtYmVyIG9m
IHNoYXJlZCBidWZmZXJzCj4gICAtIE90aGVyIGNoYW5nZXMgYXJlIGRlc2NyaWJlZCBpbiB0aGUg
Y29ycmVzcG9uZGluZyBwYXRjaGVzCj4gCj4gQ2hhbmdlcyBmcm9tIHYxOgo+ICAgLSBBZGRlZCBw
YXRjaCB0aGF0IHVwZGF0ZXMgU1VQUE9SVC5tZAo+ICAgLSBJbnN0ZWFkIG9mIHJlbW92aW5nICJl
eHBlcmltZW50YWwiIHN0YXR1cyBJIGNoYW5nZWQgaXQgdG8gIlRlY2ggUHJldmlldyIKPiAgIC0g
T3RoZXIgY2hhbmdlcyBhcmUgZGVzY3JpYmVkIGluIHRoZSBjb3JyZXNwb25kaW5nIHBhdGNoZXMK
PiAKPiBDb3ZlciBsZXR0ZXIgZm9yIHYxOgo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIHZh
cmlvdXMgdW5maW5pc2hlZCBpdGVtcyBpbiB0aGUgT1AtVEVFIG1lZGlhdG9yLgo+IE1vc3RseSB0
aGlzIGlzIGFib3V0IGxpbWl0aW5nIHJlc291cmNlcyB0aGF0IGd1ZXN0IGNhbiBjb25zdW1lLiBU
aGlzCj4gaW5jbHVkZXMgYm90aCBtZW1vcnkgYW5kIHRpbWUgLSBob3cgbWFueSBidWZmZXJzIGd1
ZXN0IGNhbiBzaGFyZSB3aXRoCj4gT1AtVEVFICh0aGlzIHVzZXMgWGVuIG1lbW9yeSkgYW5kIHdo
ZW4gbWVkaWF0b3Igc2hvdWxkIHByZWVtcHQgaXRzZWxmLAo+IHRvIG1ha2Ugc3VyZSB0aGF0IGd1
ZXN0IGRvZXMgbm90IHN0cmVzcyBzY2hlZHVsaW5nLgo+IAo+IEFwYXJ0IGZyb20gdGhpcywgdGhl
cmUgd2VyZSBvbmUgY2FzZSwgd2hlbiBtZWRpYXRvcidzIGFjdGlvbnMgbWlnaHQgbGVhZAo+IHRv
IG1lbW9yeSBsZWFrIGluIGEgZ29vZC1iZWhhdmluZyBndWVzdC4gVG8gZml4IHRoaXMgaXNzdWUg
SSBoYWQgdG8KPiBleHRlbmQgbWVkaWF0b3IgbG9naWMsIHNvIG5vdyBpdCBjYW4gaXNzdWUgUlBD
IHJlcXVlc3RzIHRvIGd1ZXN0IGluIHRoZQo+IHNhbWUgd2F5LCBhcyBPUC1URUUgZG9lcyB0aGlz
LiBUaGlzIGlzIHVzZWZ1bCBmZWF0dXJlLCBiZWNhdXNlIGl0Cj4gYWxsb3dzIHRvIHByZWVtcHQg
bWVkaWF0b3IgZHVyaW5nIGxvbmcgb3BlcmF0aW9ucy4gU28sIGluIHRoZSBmdXR1cmUKPiBpdCB3
aWxsIGJlIHBvc3NpYmxlIHRvIHJlbW92ZSBzaGFyZWQgYnVmZmVyIHNpemUgbGltaXRhdGlvbiwg
YmVjYXVzZQo+IG1lZGlhdG9yIGNhbiBwcmVlbXB0IHNlbGYgZHVyaW5nIGJ1ZmZlciB0cmFuc2xh
dGlvbi4KPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBjYW4gYmUgcHVsbGVkIGZyb20gWzFdLgo+IAo+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbG9yYy94ZW4vdHJlZS9vcHRlZTNfdjEKPiBbMl0gaHR0
cHM6Ly9naXRodWIuY29tL2xvcmMveGVuL3RyZWUvb3B0ZWUzX3YyCj4gWzNdIGh0dHBzOi8vZ2l0
aHViLmNvbS9sb3JjL3hlbi90cmVlL29wdGVlM192Mwo+IAo+IAo+IFZvbG9keW15ciBCYWJjaHVr
ICgzKToKPiAgICB4ZW4vYXJtOiBvcHRlZTogaGFuZGxlIHNoYXJlZCBidWZmZXIgdHJhbnNsYXRp
b24gZXJyb3IKPiAgICBTVVBQT1JULm1kOiBEZXNjcmliZSBPUC1URUUgbWVkaWF0b3IKPiAgICB4
ZW4vYXJtOiBvcHRlZTogdXBkYXRlIGRlc2NyaXB0aW9uIGluIEtjb25maWcKClRoZSBzZXJpZXMg
aXMgbm93IG1lcmdlZC4gVGhhbmsgeW91IGZvciB0aGUgY29udHJpYnV0aW9uIQoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
