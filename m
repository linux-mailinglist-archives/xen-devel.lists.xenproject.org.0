Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E434CA9D21
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:36:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5nCx-0000VP-IP; Thu, 05 Sep 2019 08:33:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5nCv-0000VK-Ph
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:33:33 +0000
X-Inumbo-ID: d70ef8ea-cfb7-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d70ef8ea-cfb7-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 08:33:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB0C1AE84;
 Thu,  5 Sep 2019 08:33:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <FA118783-4079-460A-95F8-B628F3320637@citrix.com>
 <95800deb-8c7f-aaef-8ff2-8a4f87e6b5e6@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9ee33b16-9ae7-1f17-1755-c7d03c352a21@suse.com>
Date: Thu, 5 Sep 2019 10:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <95800deb-8c7f-aaef-8ff2-8a4f87e6b5e6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Tamas KLengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, IanJackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, BrianWoods <brian.woods@amd.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTA6MTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDUvMDkvMjAxOSAw
ODo0OSwgTGFycyBLdXJ0aCB3cm90ZToKPj4g77u/T24gMDUvMDkvMjAxOSwgMDg6NDEsICJSaWNo
IFBlcnNhdWQiIDxwZXJzYXVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+ICAgICAgPiBPbiBTZXAg
NSwgMjAxOSwgYXQgMDM6MTksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
Cj4+ICAgICAgPgo+PiAgICAgID4gRm9yZ2l2ZSBtZSBhc2tpbmcsIGJ1dCB3aHkgaXMgdGhpcyBw
dXQgdXAgYXMgYW4gYWdlbmRhIGl0ZW0gaGVyZT8KPj4gICAgICA+IElNTyB0aGlzIGlzIHRoZSBr
aW5kIG9mIHRoaW5nIHdoZXJlIHlvdSB3b3VsZCBzZW5kIGEgcHJvcG9zYWwgYW5kCj4+ICAgICAg
PiByZXF1ZXN0IGZlZWRiYWNrIGJ5IGVtYWlsIGZpcnN0LCBhbmQgcHV0IGl0IHVwIGFzIGFuIGFn
ZW5kYSBpdGVtCj4+ICAgICAgPiBoZXJlIG9ubHkgaWYgaXQgZ290IHN0YWxsZWQgdGhlcmUuIChB
cG9sb2dpZXMgaWYgSSd2ZSBvdmVybG9va2VkCj4+ICAgICAgPiBzdWNoIGEgc3RhbGxlZCB0aHJl
YWQuKQo+PiAgICAgIAo+PiAgICAgIElmIFhlbiBjb21tdW5pdHkgY2FsbCB0b3BpY3MgYXJlIGxp
bWl0ZWQgdG8gZXNjYWxhdGlvbnMgb2YgeGVuLWRldmVsIHRocmVhZHMsIHRoZW4gYSBuZXcgdGhy
ZWFkIGNhbiBiZSBjcmVhdGVkIGZvciB0aGlzIHRvcGljLiBYZW4gY29tbXVuaXR5IGNhbGxzIGhh
dmUgYWxzbyBwcm92aWRlZCByZWFsLXRpbWUsIGludGVyYWN0aXZlIGZlZWRiYWNrIG9uIGNhbmRp
ZGF0ZSBwcm9wb3NhbHMsIGFsb25nIHdpdGggZ3VpZGFuY2Ugb24gYXJlYXMgd2hpY2ggbmVlZCBk
b2N1bWVudGF0aW9uIGJlZm9yZSBhIGZvcm1hbCBwcm9wb3NhbCBpcyBtYWRlIHRvIHhlbi1kZXZl
bC4gICBTdWNoIGFnZW5kYSBpdGVtcyBhcmUgdHlwaWNhbGx5IGNvdmVyZWQgYWZ0ZXIgYWxsIHNl
cmllcyBhbmQgcHJpb3JpdHkgdG9waWNzIGhhdmUgYmVlbiBhZGRyZXNzZWQuCj4+ICAgICAgCj4+
IEkgZG9uJ3QgbWluZCBoYXZpbmcgaXRlbXMgc3VjaCB0aGVzZSBvbiB0aGUgYWdlbmRhIGFuZCB0
byBiZSBmYWlyIGhhdmUgYWRkZWQgc2ltaWxhciBpdGVtcyBvbnRvIHRoZSBhZ2VuZGEgaW4gdGhl
IHBhc3QuCj4+IENsZWFybHksIHRoZXkgYXJlIGZvcndhcmQgbG9va2luZyBbbGlrZSBhbiBSRkNd
LCBmb3Igd2hpY2ggcmVhc29uIEkgdGVuZCB0byBhZGQgdGhlbSB0byB0aGUgZW5kIG9mIGFuIGFn
ZW5kYSBpZiB0aGVyZSBpcyBhIGJ1c3kgc2NoZWR1bGUKPj4KPj4gUGVyc29uYWxseSwgb24gdGhp
cyBzcGVjaWZpYyBpdGVtLCBpdCBpcyBub3QgcmVhbGx5IGNsZWFyIHdoYXQgdGhlIHF1ZXN0aW9u
cyBhcmUuICBJbiBvdGhlciB3b3JkczogaXMgdGhpcyBhYm91dCBVVUlEUy9kb21haW4gaWRzIG9u
bHksIG9yIGlzIHRoZXJlIHNvbWV0aGluZyBlbHNlLgo+IAo+IFJlcXVpcmluZyBzb21ldGhpbmcg
dG8gYmUgYmxvY2tlZCBvbiB4ZW4tZGV2ZWwgYmVmb3JlIHdlIGRpc2N1c3MgaXQgb24KPiB0aGUg
Y2FsbCBpcyBtb251bWVudGFsbHkgc2hvcnQgc2lnaHRlZCwgYW5kIG9mZi1wdXR0aW5nIGZvciBj
b250cmlidXRvcnMuCj4gCj4gSW4gdGhpcyBjYXNlLCBpdCBpcyB2ZXJ5IGRlZmluaXRlbHkgbm90
IHRoZSBmaXJzdCB0aW1lIHRoaXMgcHJvYmxlbSBoYXMKPiBiZWVuIHJhaXNlZCwgYXMgaXQgaXMg
YW4gWFNBIHNoYXBlZCBlbGVwaGFudCBpbiB0aGUgcm9vbS7CoCBJdHMgbm8gc2VjcmV0Cj4gdGhh
dCBpZCB3cmFwcyBjYXVzZSBwcm9ibGVtcywgYW5kIHdoaWxlIG91ciBzZWN1cml0eSBwb2xpY3kg
ZG9lc24ndAo+IGNvbW1lbnQgb24gdGhlIG1hdHRlciwgaXQgYWxzbyBkb2Vzbid0IHNheSAid2Fy
bmluZyAtIHN0dWZmICp3aWxsKiBicmVhawo+IGluIHdlaXJkLCB3b25kZXJmdWwsIGFuZCBzZWN1
cml0eS1yZWxldmFudCB3YXlzIHdoZW4gZG9taWQncyB3cmFwIi4KPiAKPiBUaGUgb3JkZXIgb2Yg
dGhlIGFnZW5kYSBpcyBpbXBvcnRhbnQsIGFuZCBJIGRvbid0IHRoaW5rIHRoaXMgc2hvdWxkIGJl
Cj4gYXQgdGhlIHRvcCwgYnV0IGV2ZW4gaWYgd2Ugb25seSBlbmQgdXAgd2l0aCAyIG1pbnV0ZXMg
dG8gZGlzY3VzcyBpdCwKPiB0aGVuIHNvIGJlIGl0LsKgICgyIG1pbnV0ZXMgb2YgdGFsa2luZyBj
YW4gc3RpbGwgYmUgZmFyIG1vcmUgdmFsdWFibGUKPiB0aGFuIGEgd2Vla3Mgd29ydGggb2YgZW1h
aWxpbmcuKQo+IAo+IFdoYXQgaXMgbm90IGFjY2VwdGFibGUgaXMgc3VnZ2VzdGluZyB0aGF0IGl0
IHNob3VsZCBiZSB2ZXRvJ2Qgc2ltcGx5Cj4gYmVjYXVzZSBpdCBpcyBwZXJjZWl2ZWQgdG8gYmUg
YSB2ZXJ5IGZyZXNoIGlkZWEvcXVlcnkuCgpJIHN0aWxsIHRoaW5rIGl0IHdvdWxkIGhlbHAgaWYg
YSBzaG9ydCBoaWdoIGxldmVsIGRlc2lnbiB3b3VsZCBiZSBwb3N0ZWQKb24geGVuLWRldmVsIGZp
cnN0LgoKQXQgbGVhc3QgZm9yIG1lIGl0IGlzIG11Y2ggZWFzaWVyIHRvIGRpc2N1c3MgYSBuZXcg
aWRlYSB3aGVuIEkgaGFkIHNvbWUKdGltZSB0byB0aGluayBhYm91dCBpdC4gQW5kIGJ5IGhhdmlu
ZyB0byB3cml0ZSBpdCBkb3duIHRoZSBvbmUgcHJvcG9zaW5nCnRoZSBpZGVhIHdpbGwgaGF2ZSB0
byBzb3J0IGhpcyB0aG91Z2h0cyBhbmQgd2lsbCBzdHVtYmxlIG92ZXIgcG90ZW50aWFsCnByb2Js
ZW1zLCBpbnN0ZWFkIG9mIGV2ZXJ5b25lIG9uIHRoZSBjYWxsIGhhdmluZyB0byBpbWFnaW5lIHdo
YXQgaGUgd2FzCnRoaW5raW5nIGFuZCBmaW5kaW5nIHRoZSBzYW1lIHByb2JsZW1zLCB3aGljaCBt
aWdodCBiZSBzb2x2ZWQgYWxyZWFkeS4KCkFuZCBieSBoYXZpbmcgc2VlbiBhIHByb3Bvc2FsIGVh
cmx5IEkgY2FuIGRlY2lkZSB0byBkcm9wIG9mZiB0aGUgY2FsbCBpbgpjYXNlIEknbSBub3QgaW50
ZXJlc3RlZC4gQnV0IEkgbWlnaHQgbm90IGtub3cgd2hldGhlciBzb21lIGFyZWFzIEknbQppbnRl
cmVzdGVkIGluIG1pZ2h0IGJlIHRvdWNoZWQgYnkgYSBuZXcgaWRlYSBiZWZvcmUgaGF2aW5nIHNl
ZW4gdGhlIGhpZ2gKbGV2ZWwgZGVzY3JpcHRpb24uCgpUaGlzIGlzIG5vIHZldG8sIGJ1dCBqdXN0
IGEgc3VnZ2VzdGlvbiBob3cgdG8gdXNlIHRoZSB0aW1lIG9mIGFsbCBjYWxsCmF0dGVuZGVlcyBt
b3JlIGVmZmVjdGl2ZWx5LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
