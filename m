Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607688783D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 13:09:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2k2-0004bF-06; Fri, 09 Aug 2019 11:07:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw2k0-0004b6-9F
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 11:07:24 +0000
X-Inumbo-ID: db96d5c2-ba95-11e9-b3ce-83e557b967cd
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db96d5c2-ba95-11e9-b3ce-83e557b967cd;
 Fri, 09 Aug 2019 11:07:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6FAD3ACA0;
 Fri,  9 Aug 2019 11:07:20 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-2-sstabellini@kernel.org>
 <6f326378-dfdd-8570-fa10-b32c6dc93c3c@arm.com>
 <cdc05fd0-080f-3a1f-e08a-a767f9b54f20@suse.com>
 <dcad508a-f50e-5fdc-7664-4e7fcc20022a@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <336ef109-68e5-9cec-2537-2b5e362d5874@suse.com>
Date: Fri, 9 Aug 2019 13:07:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dcad508a-f50e-5fdc-7664-4e7fcc20022a@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen: add a p2mt parameter to
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
Cc: andrew.cooper3@citrix.com, Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxMjo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDA5
LzA4LzIwMTkgMTE6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwOS4wOC4yMDE5IDEyOjIz
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAwNy8wOC8yMDE5IDAxOjIzLCBTdGVmYW5vIFN0
YWJlbGxpbmkgd3JvdGU6Cj4+Pj4gQWRkIGEgcDJtdCBwYXJhbWV0ZXIgdG8gbWFwX21taW9fcmVn
aW9ucywgcGFzcyBwMm1fbW1pb19kaXJlY3RfZGV2IG9uCj4+Pj4gQVJNIGFuZCBwMm1fbW1pb19k
aXJlY3Qgb24geDg2IC0tIG5vIGNoYW5nZXMgaW4gYmVoYXZpb3IuCj4+Pj4KPj4+PiBPbiB4ODYs
IGludHJvZHVjZSBhIG1hY3JvIHRvIHN0cmlwIGF3YXkgdGhlIGxhc3QgcGFyYW1ldGVyIGFuZCBy
ZW5hbWUKPj4+PiB0aGUgZXhpc3RpbmcgaW1wbGVtZW50YXRpb24gb2YgbWFwX21taW9fcmVnaW9u
cyB0byBtYXBfbW1pb19yZWdpb24uCj4+Pj4gVXNlIG1hcF9tbWlvX3JlZ2lvbiBpbiB2cGNpIGFz
IGl0IGlzIHg4Ni1vbmx5IHRvZGF5Lgo+Pj4KPj4+IFRoaXMgZmVlbHMgcXVpdGUgd3JvbmcuIFlv
dSBoYXZlIGEgInBsdXJhbCIgZnVuY3Rpb24gY2FsbGluZyBhICJzaW5ndWxhciIgZnVuY3Rpb24u
IFRoaXMgaXMgdXN1YWxseSB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gVGhpcyBpcyBhbHNvIHF1aXRl
IGRpZmZpY3VsdCBmb3IgYSB1c2VyIHRvIHVuZGVyc3RhbmQgd2h5IHRoZSAncycgaXMgYmVlbiBk
cm9wcGVkL2FkZGVkIChkZXBlbmRpbmcgaG93IHlvdSB2aWV3IGl0KSBiZWNhdXNlIGluIGJvdGgg
Y2FzZSB5b3Ugb25seSBkZWFsIHdpdGggYSBzaW5nbGUgcmVnaW9uLgo+Pgo+PiAiSGFwcHkiIGlz
IHRoZSB3cm9uZyB0ZXJtLiBJJ2Qgd2VsY29tZSBhbnkgYmV0dGVyIHN1Z2dlc3Rpb24uIEkKPj4g
c2ltcGx5IGNvdWxkbid0IHRoaW5rIG9mIGEgc2Vuc2libGUgYWx0ZXJuYXRpdmUsIGJ1dCBJIGRv
IHdhbnQKPj4gdG8gc2VlIHRoZSBsZWFkaW5nIHVuZGVyc2NvcmVzIGdvbmUgdGhhdCB3ZXJlIHRo
ZXJlIG9yaWdpbmFsbHkuCj4gCj4gV2UgYXJlIGFscmVhZHkgbW9kaWZ5aW5nIGFsbCB0aGUgY2Fs
bGVycyBpbiB0aGlzIHNlcmllcywgc28gZG9pbmcgdGhlIHJlbmFtaW5nIHNob3VsZCBub3QgbWFr
ZSB0aGUgZGlmZiB3b3JzdC4KPiAKPiBBIGZldyBvZiBzdWdnZXN0aW9uOgo+ICDCoMKgwqAgMSkg
bWFwX21taW9fcmVnaW9uKCkgY2FsbGluZyBtYXBfbW1pb19yZWdpb25zKCkKPiAgwqDCoMKgIDIp
IGFyY2hfbWFwX21taW9fcmVnaW9uKCkgY2FsbGluZyBtYXBfbW1pb19yZWdpb24oKQo+ICDCoMKg
wqAgMykgbWFwX21taW9fcmVnaW9uKCkgY2FsbGluZyBhcmNoX21hcF9tbWlvX3JlZ2lvbigpCgpJ
ZGVhbGx5IHRoZSB0b3AgbGV2ZWwgZnVuY3Rpb25zIChpLmUuIGFsc28gdGhlIHVubWFwIG9uZSkg
d291bGQgbG9zZQp0aGVpciBwbHVyYWxzLiBTZWVpbmcgdGhhdCBib3RoIHJlcXVpcmUgYSBwZXIt
YXJjaCBpbXBsZW1lbnRhdGlvbiwgSQpndWVzcyB0aGUgYmVzdCBjaG9pY2UgZnJvbSB0aGUgYWJv
dmUgd291bGQgYmUgMiAod2l0aCB0aGUgdW5tYXAgb25lCmZvbGxvd2luZyBzdWl0KS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
