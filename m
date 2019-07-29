Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6693978B94
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:17:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4XT-0007at-Er; Mon, 29 Jul 2019 12:14:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hs4XR-0007Zp-5C
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:14:01 +0000
X-Inumbo-ID: 572dcffa-b1fa-11e9-9ac3-0730ca26ddb5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 572dcffa-b1fa-11e9-9ac3-0730ca26ddb5;
 Mon, 29 Jul 2019 12:13:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3088ABD4;
 Mon, 29 Jul 2019 12:13:56 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <79b01757ee19b57ac43649a4d94e378891152887.camel@suse.com>
 <25dfa166-c7a4-c2dd-0c1d-58faf5ffc296@suse.com>
 <41291327c741e276b4ad666e67152b74d2257a42.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f9ebb773-db7b-f466-2c77-302bc3e2ed51@suse.com>
Date: Mon, 29 Jul 2019 14:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <41291327c741e276b4ad666e67152b74d2257a42.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC 0/6] XEN scheduling hardening
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMTkgMTM6NTMsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
Ny0yNiBhdCAxNDoxNCArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjYuMDcuMTkg
MTM6NTYsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pj4gT24gRnJpLCAyMDE5LTA3LTI2IGF0IDEz
OjM3ICswMzAwLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4+ICAgIC0gSG93IHRvIGF2b2lkIHRo
ZSBhYnNvbHV0ZSB0b3AgcHJpb3JpdHkgb2YgdGFza2xldHMgKHdoYXQgaXMKPj4+PiBvYmV5ZWQK
Pj4+PiBieSBhbGwKPj4+PiAgICAgIHNjaGVkdWxlcnMgc28gZmFyKS4gU2hvdWxkIGlkbGUgdmNw
dSBiZSBzY2hlZHVsZWQgYXMgdGhlCj4+Pj4gbm9ybWFsCj4+Pj4gZ3Vlc3QgdmNwdXMKPj4+PiAg
ICAgICh0aHJvdWdoIHF1ZXVlcywgcHJpb3JpdGllcywgZXRjKT8KPj4+Pgo+Pj4gVGhlcmVmb3Jl
LCBldmVuIGlmIHRoZXJlIHdvdWxkbid0IGJlIGFueSBzdWJzeXN0ZW0gZXhwbGljaXRseQo+Pj4g
cmVseWluZwo+Pj4gb24gdGhlIGN1cnJlbnQgYmVoYXZpb3IgKHdoaWNoIHNob3VsZCBiZSB2ZXJp
ZmllZCksIEkgdGhpbmsgd2UgYXJlCj4+PiBhdAo+Pj4gaGlnaCByaXNrIG9mIGJyZWFraW5nIHRo
aW5ncywgaWYgd2UgY2hhbmdlLgo+Pgo+PiBXZSdkIGJyZWFrIHRoaW5ncyBJTU8uCj4+Cj4+IFRh
c2tsZXRzIGFyZSBzb21ldGltZXMgdXNlZCB0byBwZXJmb3JtIGFzeW5jIGFjdGlvbnMgd2hpY2gg
Y2FuJ3QgYmUKPj4gZG9uZQo+PiBpbiBndWVzdCB2Y3B1IGNvbnRleHQuIExpa2Ugc3dpdGNoaW5n
IGEgZG9tYWluIHRvIHNoYWRvdyBtb2RlIGZvcgo+PiBMMVRGCj4+IG1pdGlnYXRpb24sIG9yIG1h
cnNoYWxsaW5nIGFsbCBjcHVzIGZvciBzdG9wX21hY2hpbmUoKS4gWW91IGRvbid0Cj4+IHdhbnQK
Pj4gdG8gYmUgYWJsZSB0byBibG9jayB0YXNrbGV0cywgeW91IHdhbnQgdGhlbSB0byBydW4gYXMg
c29vbiBhcwo+PiBwb3NzaWJsZS4KPj4KPiBZZXAsIHN0b3AtbWFjaGluZSB3YXMgcHJlY2lzZWx5
IHdoYXQgSSBoYWQgaW4gbWluZCwgYnV0IGFzIEp1ZXJnZW4KPiBzYXlzLCB0aGVyZSdzIG1vcmUu
Cj4gCj4gQXMgc2FpZCwgSSBzdWdnZXN0IHdlIGRlZmVyIHRoaXMgcHJvYmxlbSBvciwgaW4gZ2Vu
ZXJhbCwgd2UgdHJlYXQgaXQKPiBvdXRzaWRlIG9mIHRoaXMgc2VyaWVzLgo+IAo+Pj4gMikgeW91
IG1vdmUgYWxsIHRoZXNlIGFjdGl2aXRpZXMgb3V0IG9mIGlkbGUsIGFuZCBpbiBzb21lIG90aGVy
Cj4+PiAgICAgIGNvbnRleHQsIGFuZCB5b3UgbGV0IGlkbGUganVzdCBkbyB0aGUgaWRsaW5nLiBB
dCB0aGF0IHBvaW50LAo+Pj4gdGltZQo+Pj4gICAgICBhY2NvdW50ZWQgdG8gaWRsZSB3aWxsIGJl
IG9ubHkgYWN0dWFsIGlkbGUgdGltZSwgYXMgdGhlIHRpbWUgaXQKPj4+ICAgICAgdG9vayB0byBY
ZW4gdG8gZG8gYWxsIHRoZSBvdGhlciB0aGluZ3MgaXMgbm93IGFjY291bnRlZCB0byB0aGUKPj4+
IG5ldwo+Pj4gICAgICBleGVjdXRpb24gY29udGV4dCB3aGljaCBpcyBydW5uaW5nIHRoZW0uCj4+
Cj4+IEFuZCBoZXJlIHdlIGFyZSBjb21pbmcgYmFjayB0byB0aGUgaWRlYSBvZiBhICJoeXBlcnZp
c29yIGRvbWFpbiIgSQo+PiBzdWdnZXN0ZWQgYWJvdXQgMTAgeWVhcnMgYWdvIGFuZCB3aGljaCB3
YXMgcmVqZWN0ZWQgYXQgdGhhdCB0aW1lLi4uCj4+Cj4gSXQncyBwcmV0dHkgbXVjaCB3aGF0IEFu
ZHJpaSBpcyBwcm9wb3NpbmcgYWxyZWFkeSwgd2hlbiBoZSBzYXlzIGhlJ2QKPiBjb25zaWRlciBp
ZGxlX3ZjcHUgYW4gJ2h5cGVydmlzb3IgdmNwdScuIE9yIGF0IGxlYXN0IGEgbmF0dXJhbGUKPiBl
eHRlbnNpb24gb2YgdGhhdC4KClRoZSBtYWluIGRpZmZlcmVuY2UgaXMgaXRzIHByaW9yaXR5IGFu
ZCB0aGUgcG9zc2liaWxpdHkgdG8gYWxsb3cgaXQgdG8KYmVjb21lIGJsb2NrZWQuCgo+IEkgZG9u
J3Qga25vdyB3aGF0IHdhcyB0aGUgb2NjYXNpb24gZm9yIHByb3Bvc2luZyBpdCwgYW5kIHRoZSBh
cmd1bWVudAo+IGFnYWluc3QgaXQsIDEwIHllYXJzIGFnbywgc28gSSB3b24ndCBjb21tZW50IG9u
IHRoYXQuIDotRAoKSXQgd2FzIGluIHRoZSBkaXNjdXNzaW9uIG9mIG15IGluaXRpYWwgc3VibWlz
c2lvbiBvZiBjcHVwb29scy4gSXQgd2FzCm9uZSBhbHRlcm5hdGl2ZSB0aG91Z2h0IHRvIHNvbHZl
IHRoZSBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KCkKcHJvYmxlbS4gSW4gdGhlIGVuZCB0aGF0
IHdhcyBkb25lIHZpYSB0YXNrbGV0cy4gOi0pCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
