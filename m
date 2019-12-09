Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC3116E16
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 14:42:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJFS-00037d-O8; Mon, 09 Dec 2019 13:38:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieJFQ-00037K-Oa
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 13:38:48 +0000
X-Inumbo-ID: 39e81ade-1a89-11ea-a1e1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39e81ade-1a89-11ea-a1e1-bc764e2007e4;
 Mon, 09 Dec 2019 13:38:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF9DCAF55;
 Mon,  9 Dec 2019 13:38:46 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
 <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
 <8d66e520-3009-cde1-e24c-26d7476e5873@suse.com>
 <63d653a04207451e9041c89acd04f2a2@EX13D32EUC003.ant.amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2cd2a27e-2bb8-bd9d-45d8-1710038fb97a@suse.com>
Date: Mon, 9 Dec 2019 14:38:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <63d653a04207451e9041c89acd04f2a2@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTM6MTksIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KPj4g
U2VudDogMDkgRGVjZW1iZXIgMjAxOSAxMjowOQo+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvbT47IFJvZ2VyIFBhdSBNb25uw6kKPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBTdGVmYW5vCj4+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBCb3JpcyBPc3Ryb3Zza3kKPj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+PiBT
dWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3aGVuIHN0
YXRlIGlzIGZvcmNlZCB0bwo+PiBjbG9zZWQKPj4KPj4gT24gMDkuMTIuMTkgMTM6MDMsIER1cnJh
bnQsIFBhdWwgd3JvdGU6Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9t
OiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4gU2VudDogMDkgRGVjZW1iZXIg
MjAxOSAxMTo1NQo+Pj4+IFRvOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT47IER1cnJhbnQsIFBhdWwKPj4+PiA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPj4+PiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Owo+PiBTdGVmYW5vCj4+Pj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJv
cmlzIE9zdHJvdnNreQo+Pj4+IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPj4+PiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3aGVuIHN0YXRl
IGlzIGZvcmNlZAo+PiB0bwo+Pj4+IGNsb3NlZAo+Pj4+Cj4+Pj4gT24gMDkuMTIuMTkgMTI6Mzks
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFRodSwgRGVjIDA1LCAyMDE5IGF0IDAy
OjAxOjIxUE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+Pj4+IE9ubHkgZm9yY2Ugc3Rh
dGUgdG8gY2xvc2VkIGluIHRoZSBjYXNlIHdoZW4gdGhlIHRvb2xzdGFjayBtYXkgbmVlZCB0bwo+
Pj4+Pj4gY2xlYW4gdXAuIFRoaXMgY2FuIGJlIGRldGVjdGVkIGJ5IGNoZWNraW5nIHdoZXRoZXIg
dGhlIHN0YXRlIGluCj4+Pj4geGVuc3RvcmUKPj4+Pj4+IGhhcyBiZWVuIHNldCB0byBjbG9zaW5n
IHByaW9yIHRvIGRldmljZSByZW1vdmFsLgo+Pj4+Pgo+Pj4+PiBJJ20gbm90IHN1cmUgSSBzZWUg
dGhlIHBvaW50IG9mIHRoaXMsIEkgd291bGQgZXhwZWN0IHRoYXQgYSBmYWlsdXJlIHRvCj4+Pj4+
IHByb2JlIG9yIHRoZSByZW1vdmFsIG9mIHRoZSBkZXZpY2Ugd291bGQgbGVhdmUgdGhlIHhlbmJ1
cyBzdGF0ZSBhcwo+Pj4+PiBjbG9zZWQsIHdoaWNoIGlzIGNvbnNpc3RlbnQgd2l0aCB0aGUgYWN0
dWFsIGRyaXZlciBzdGF0ZS4KPj4+Pj4KPj4+Pj4gQ2FuIHlvdSBleHBsYWluIHdoYXQncyB0aGUg
YmVuZWZpdCBvZiBsZWF2aW5nIGEgZGV2aWNlIHdpdGhvdXQgYQo+Pj4+PiBkcml2ZXIgaW4gc3Vj
aCB1bmtub3duIHN0YXRlPwo+Pj4+Cj4+Pj4gQW5kIG1vcmUgY29uY2VybmluZzogZGlkIHlvdSBj
aGVjayB0aGF0IG5vIGZyb250ZW5kL2JhY2tlbmQgaXMKPj4+PiByZWx5aW5nIG9uIHRoZSBjbG9z
ZWQgc3RhdGUgdG8gYmUgdmlzaWJsZSB3aXRob3V0IGNsb3NpbmcgaGF2aW5nIGJlZW4KPj4+PiBz
ZXQgYmVmb3JlPwo+Pj4KPj4+IEJsa2Zyb250IGRvZXNuJ3Qgc2VlbSB0byBtaW5kIGFuZCBJIGJl
bGlldmUgdGhlIFdpbmRvd3MgUFYgZHJpdmVycyBjb3BlLAo+PiBidXQgSSBkb24ndCByZWFsbHkg
dW5kZXJzdGFuZCB0aGUgY29tbWVudCBzaW5jZSB0aGlzIHBhdGNoIGlzIGFjdHVhbGx5Cj4+IHJl
bW92aW5nIGEgY2FzZSB3aGVyZSB0aGUgYmFja2VuZCB0cmFuc2l0aW9ucyBkaXJlY3RseSB0byBj
bG9zZWQuCj4+Cj4+IEknbSBub3Qgc3BlYWtpbmcgb2YgYmxrZnJvbnQvYmxrYmFjayBvbmx5LCBi
dXQgb2YgbmV0LCB0cG0sIHNjc2ksIHB2Y2FsbAo+PiBldGMuIGZyb250ZW5kcy9iYWNrZW5kcy4g
QWZ0ZXIgYWxsIHlvdSBhcmUgbW9kaWZ5aW5nIGEgZnVuY3Rpb24gY29tbW9uCj4+IHRvIGFsbCBQ
ViBkcml2ZXIgcGFpcnMuCj4+Cj4+IFlvdSBhcmUgcmVtb3ZpbmcgYSBzdGF0ZSBzd2l0YyB0byAi
Y2xvc2VkIiBpbiBjYXNlIHRoZSBzdGF0ZSB3YXMgX25vdF8KPj4gImNsb3NpbmciIGJlZm9yZS4K
PiAKPiBZZXMsIHdoaWNoIEFGQUlLIGlzIGFnYWluc3QgdGhlIGludGVudGlvbiBvZiB0aGUgZ2Vu
ZXJpYyBQViBwcm90b2NvbCBzdWNoIHRoYXQgaXQgZXZlciBleGlzdGVkIGFueXdheS4KCldoaWxl
IHRoaXMgbWlnaHQgYmUgdGhlIGNhc2Ugd2Ugc2hvdWxkIF9ub3RfIGJyZWFrIGFueSBndWVzdHMK
cnVubmluZyBub3cuIFNvIHRoaXMga2luZCBvZiByZWFzb25pbmcgaXMgZGFuZ2Vyb3VzLgoKPiAK
Pj4gU28gYW55IFBWIGRyaXZlciByZWFjdGluZyB0byAiY2xvc2VkIiBvZiB0aGUgb3RoZXIgZW5k
Cj4+IGluIGNhc2UgdGhlIHByZXZpb3VzIHN0YXRlIG1pZ2h0IG5vdCBoYXZlIGJlZW4gImNsb3Np
bmciIGJlZm9yZSBpcyBhdAo+PiByaXNrIHRvIG1pc2JlaGF2ZSB3aXRoIHlvdXIgcGF0Y2guCj4g
Cj4gV2VsbCwgdGhleSB3aWxsIHNlZSBub3RoaW5nIG5vdy4gSWYgdGhlIHN0YXRlIHdhcyBub3Qg
Y2xvc2luZywgaXQgZ2V0cyBsZWZ0IGFsb25lLCBzbyB0aGUgZnJvbnRlbmQgc2hvdWxkbid0IGRv
IGFueXRoaW5nLiBUaGUgb25seSByaXNrIHRoYXQgSSBjYW4gc2VlIGlzIHRoYXQgc29tZSBmcm9u
dGVuZC9iYWNrZW5kIHBhaXIgbmVlZGVkIGEgZGlyZWN0IDQgLT4gNiB0cmFuc2l0aW9uIHRvIHN1
cHBvcnQgJ3VuYmluZCcgYmVmb3JlIGJ1dCBBRkFJSyBub3RoaW5nIGhhcyBldmVyIHN1cHBvcnRl
ZCB0aGF0LCBhbmQgYmxrIGFuZCBuZXQgY3Jhc2gnbididXJuIGlmIHlvdSB0cnkgdGhhdCBvbiB1
cHN0cmVhbSBhcyBpdCBzdGFuZHMuIEEgY2xlYW4gdW5wbHVnIHdvdWxkIGFsd2F5cyBzZXQgc3Rh
dGUgdG8gNSBmaXJzdCwgc2luY2UgdGhhdCdzIHBhcnQgb2YgdGhlIHVucGx1ZyBwcm90b2NvbC4K
ClRoYXQgd2FzIG15IHF1ZXN0aW9uOiBhcmUgeW91IHN1cmUgYWxsIGN1cnJlbnQgYW5kIHByZXZp
b3VzCmd1ZXN0IGZyb250ZW5kcyBhbmQgYmFja2VuZHMgYXJlIGhhbmRsaW5nIHVucGx1ZyB0aGlz
IHdheT8KCk5vdCAic2hvdWxkIGhhbmRsZSIsIGJ1dCAiZG8gaGFuZGxlIi4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
