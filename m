Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E5F10D0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 09:12:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSGMD-0001Po-KJ; Wed, 06 Nov 2019 08:08:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9WRC=Y6=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1iSGMB-0001Pj-Qr
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 08:07:59 +0000
X-Inumbo-ID: 8b0c7022-006c-11ea-984a-bc764e2007e4
Received: from 20.mo3.mail-out.ovh.net (unknown [178.33.47.94])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b0c7022-006c-11ea-984a-bc764e2007e4;
 Wed, 06 Nov 2019 08:07:58 +0000 (UTC)
Received: from player729.ha.ovh.net (unknown [10.109.160.226])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 1A65A23030A
 for <xen-devel@lists.xenproject.org>; Wed,  6 Nov 2019 09:07:56 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 77D99BF352FA;
 Wed,  6 Nov 2019 08:07:30 +0000 (UTC)
Date: Wed, 6 Nov 2019 09:07:28 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20191106090728.0f758e78@bahia.lan>
In-Reply-To: <41caef0b-3db3-3fcf-a0b4-329e8e88ff0f@vivier.eu>
References: <157296887817.27285.13935693519835086344@37313f22b938>
 <41caef0b-3db3-3fcf-a0b4-329e8e88ff0f@vivier.eu>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9177210144560028120
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudduiedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucffohhmrghinhepphgrthgthhgvfidrohhrghenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Subject: Re: [Xen-devel] [PULL 0/4] Trivial branch patches
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, berrange@redhat.com,
 ehabkost@redhat.com, paul@xen.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 claudio.fontana@huawei.com, qemu-devel@nongnu.org, chouteau@adacore.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, marcandre.lureau@redhat.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, crosa@redhat.com, anthony.perard@citrix.com, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA1IE5vdiAyMDE5IDE2OjU2OjExICswMTAwCkxhdXJlbnQgVml2aWVyIDxsYXVyZW50
QHZpdmllci5ldT4gd3JvdGU6Cgo+IEdyZWcsIERhdmUsCj4gCj4gY291bGQgeW91IGZpeCB0aGF0
Pwo+IAo+IFRoYW5rcywKPiBMYXVyZW50Cj4gCj4gTGUgMDUvMTEvMjAxOSDDoCAxNjo0OCwgbm8t
cmVwbHlAcGF0Y2hldy5vcmcgYSDDqWNyaXTCoDoKPiA+IFBhdGNoZXcgVVJMOiBodHRwczovL3Bh
dGNoZXcub3JnL1FFTVUvMjAxOTExMDUxNDQyNDcuMTAzMDEtMS1sYXVyZW50QHZpdmllci5ldS8K
PiA+IAo+ID4gCj4gPiAKPiA+IEhpLAo+ID4gCj4gPiBUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgo+ID4gbW9y
ZSBpbmZvcm1hdGlvbjoKPiA+IAo+ID4gU3ViamVjdDogW1BVTEwgMC80XSBUcml2aWFsIGJyYW5j
aCBwYXRjaGVzCj4gPiBUeXBlOiBzZXJpZXMKPiA+IE1lc3NhZ2UtaWQ6IDIwMTkxMTA1MTQ0MjQ3
LjEwMzAxLTEtbGF1cmVudEB2aXZpZXIuZXUKPiA+IAo+ID4gPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQo+ID4gIyEvYmluL2Jhc2gKPiA+IGdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8
fCBleGl0IDAKPiA+IGdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKPiA+IGdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQo+ID4gZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQo+ID4gLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1t
YWlsYmFjayBiYXNlLi4KPiA+ID09PSBURVNUIFNDUklQVCBFTkQgPT09Cj4gPiAKPiA+IFN3aXRj
aGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKPiA+IDg1YWM0NTMgZ2xvYmFsOiBTcXVhc2ggJ3Ro
ZSB0aGUnCj4gPiA5ZGQ3ZGE0IHFvbTogRml4IGVycm9yIG1lc3NhZ2UgaW4gb2JqZWN0X2NsYXNz
X3Byb3BlcnR5X2FkZCgpCj4gPiAyYjc2YjQ1IGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEZp
eCA4LWJpdCBhY2Nlc3Nlcwo+ID4gYmRkY2ZkOSBody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBB
dm9pZCBjcmFzaCB3aGVuIHdyaXRpbmcgdG8gUG5QIHJlZ2lzdGVycwo+ID4gCj4gPiA9PT0gT1VU
UFVUIEJFR0lOID09PQo+ID4gMS80IENoZWNraW5nIGNvbW1pdCBiZGRjZmQ5YjZiMjQgKGh3L21p
c2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNoIHdoZW4gd3JpdGluZyB0byBQblAgcmVn
aXN0ZXJzKQo+ID4gMi80IENoZWNraW5nIGNvbW1pdCAyYjc2YjQ1MWY5YjcgKGh3L21pc2MvZ3Js
aWJfYWhiX2FwYl9wbnA6IEZpeCA4LWJpdCBhY2Nlc3NlcykKPiA+IDMvNCBDaGVja2luZyBjb21t
aXQgOWRkN2RhNDIxYmZiIChxb206IEZpeCBlcnJvciBtZXNzYWdlIGluIG9iamVjdF9jbGFzc19w
cm9wZXJ0eV9hZGQoKSkKPiA+IFdBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCj4gPiAj
MzE6IEZJTEU6IHFvbS9vYmplY3QuYzoxMTA5Ogo+ID4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJw
LCAiYXR0ZW1wdCB0byBhZGQgZHVwbGljYXRlIHByb3BlcnR5ICclcycgdG8gb2JqZWN0ICh0eXBl
ICclcycpIiwKPiA+IAo+ID4gV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKPiA+ICM0
MzogRklMRTogcW9tL29iamVjdC5jOjExNDE6Cj4gPiArICAgICAgICBlcnJvcl9zZXRnKGVycnAs
ICJhdHRlbXB0IHRvIGFkZCBkdXBsaWNhdGUgcHJvcGVydHkgJyVzJyB0byBjbGFzcyAodHlwZSAn
JXMnKSIsCj4gPiAKCkFzIG1lbnRpb25lZCBpbiB0aGUgY2hhbmdlbG9nLCB0aGlzIGlzIGRlbGli
ZXJhdGUuIEFGQUlLIGJldHRlciBncmVwLWFiaWxpdHkKaGFzIHByZWNlZGVuY2Ugb3ZlciB0aGUg
ODAgY2hhcmFjdGVycyBydWxlIHdoZW4gaXQgY29tZXMgdG8gZXJyb3IgbWVzc2FnZXMuCk1heWJl
IHdlIHNob3VsZCB0ZWFjaCBjaGVja3BhdGNoIGFib3V0IHRoYXQgPwoKQ2hlZXJzLAoKLS0KR3Jl
ZwoKPiA+IHRvdGFsOiAwIGVycm9ycywgMiB3YXJuaW5ncywgMjIgbGluZXMgY2hlY2tlZAo+ID4g
Cj4gPiBQYXRjaCAzLzQgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwo+ID4gYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0
aGUgbWFpbnRhaW5lciwgc2VlCj4gPiBDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo+ID4gNC80
IENoZWNraW5nIGNvbW1pdCA4NWFjNDUzZDE1MjAgKGdsb2JhbDogU3F1YXNoICd0aGUgdGhlJykK
PiA+IEVSUk9SOiBkbyBub3QgdXNlIEM5OSAvLyBjb21tZW50cwo+ID4gIzI2OiBGSUxFOiBkaXNh
cy9saWJ2aXhsL3ZpeGwvaW52YWxzZXQuaDoxMDU6Cj4gPiArICAvLyBOb3RlIHRoYXQgdGhpcyBk
b2VzIG5vdCBtZWFuIHRoZSBiYWNraW5nIHN0b3JhZ2UgaXMgZW1wdHk6IGl0IGNhbiBzdGlsbAo+
ID4gCj4gPiB0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDU2IGxpbmVzIGNoZWNrZWQKPiA+
IAo+ID4gUGF0Y2ggNC80IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKPiA+IGFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQo+ID4gQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPiA+IAo+
ID4gPT09IE9VVFBVVCBFTkQgPT09Cj4gPiAKPiA+IFRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBj
b2RlOiAxCj4gPiAKPiA+IAo+ID4gVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdAo+ID4gaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTExMDUxNDQyNDcuMTAzMDEtMS1sYXVyZW50QHZpdmll
ci5ldS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KPiA+IC0tLQo+ID4gRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9d
Lgo+ID4gUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5j
b20KPiA+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
