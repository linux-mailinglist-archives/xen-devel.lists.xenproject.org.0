Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9A116EC3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:12:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJjR-0006Pu-0N; Mon, 09 Dec 2019 14:09:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieJjP-0006Pp-2h
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:09:47 +0000
X-Inumbo-ID: 8d66497a-1a8d-11ea-87df-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d66497a-1a8d-11ea-87df-12813bfff9fa;
 Mon, 09 Dec 2019 14:09:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E54F3ACD0;
 Mon,  9 Dec 2019 14:09:44 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
 <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
 <8d66e520-3009-cde1-e24c-26d7476e5873@suse.com>
 <63d653a04207451e9041c89acd04f2a2@EX13D32EUC003.ant.amazon.com>
 <2cd2a27e-2bb8-bd9d-45d8-1710038fb97a@suse.com>
 <c86eadaf008f48aeb4bb7140a80b69e6@EX13D32EUC003.ant.amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1c4c9b3e-31a5-d8b3-01de-3ad84db6390a@suse.com>
Date: Mon, 9 Dec 2019 15:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c86eadaf008f48aeb4bb7140a80b69e6@EX13D32EUC003.ant.amazon.com>
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

T24gMDkuMTIuMTkgMTU6MDYsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KPj4g
U2VudDogMDkgRGVjZW1iZXIgMjAxOSAxMzozOQo+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvbT47IFJvZ2VyIFBhdSBNb25uw6kKPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBTdGVmYW5vCj4+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBCb3JpcyBPc3Ryb3Zza3kKPj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+PiBT
dWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3aGVuIHN0
YXRlIGlzIGZvcmNlZCB0bwo+PiBjbG9zZWQKPj4KPj4gT24gMDkuMTIuMTkgMTM6MTksIER1cnJh
bnQsIFBhdWwgd3JvdGU6Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9t
OiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4gU2VudDogMDkgRGVjZW1iZXIg
MjAxOSAxMjowOQo+Pj4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsg
Um9nZXIgUGF1IE1vbm7DqQo+Pj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+PiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Owo+PiBTdGVmYW5vCj4+Pj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJv
cmlzIE9zdHJvdnNreQo+Pj4+IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPj4+PiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3aGVuIHN0YXRl
IGlzIGZvcmNlZAo+PiB0bwo+Pj4+IGNsb3NlZAo+Pj4+Cj4+Pj4gT24gMDkuMTIuMTkgMTM6MDMs
IER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
Pj4+Pj4gRnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPgo+Pj4+Pj4gU2VudDog
MDkgRGVjZW1iZXIgMjAxOSAxMTo1NQo+Pj4+Pj4gVG86IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPjsgRHVycmFudCwgUGF1bAo+Pj4+Pj4gPHBkdXJyYW50QGFtYXpvbi5j
b20+Cj4+Pj4+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOwo+Pj4+IFN0ZWZhbm8KPj4+Pj4+IFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBCb3JpcyBPc3Ryb3Zza3kKPj4+Pj4+IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4KPj4+Pj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi80
XSB4ZW5idXM6IGxpbWl0IHdoZW4gc3RhdGUgaXMKPj4gZm9yY2VkCj4+Pj4gdG8KPj4+Pj4+IGNs
b3NlZAo+Pj4+Pj4KPj4+Pj4+IE9uIDA5LjEyLjE5IDEyOjM5LCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+Pj4+Pj4+IE9uIFRodSwgRGVjIDA1LCAyMDE5IGF0IDAyOjAxOjIxUE0gKzAwMDAsIFBh
dWwgRHVycmFudCB3cm90ZToKPj4+Pj4+Pj4gT25seSBmb3JjZSBzdGF0ZSB0byBjbG9zZWQgaW4g
dGhlIGNhc2Ugd2hlbiB0aGUgdG9vbHN0YWNrIG1heSBuZWVkCj4+IHRvCj4+Pj4+Pj4+IGNsZWFu
IHVwLiBUaGlzIGNhbiBiZSBkZXRlY3RlZCBieSBjaGVja2luZyB3aGV0aGVyIHRoZSBzdGF0ZSBp
bgo+Pj4+Pj4geGVuc3RvcmUKPj4+Pj4+Pj4gaGFzIGJlZW4gc2V0IHRvIGNsb3NpbmcgcHJpb3Ig
dG8gZGV2aWNlIHJlbW92YWwuCj4+Pj4+Pj4KPj4+Pj4+PiBJJ20gbm90IHN1cmUgSSBzZWUgdGhl
IHBvaW50IG9mIHRoaXMsIEkgd291bGQgZXhwZWN0IHRoYXQgYSBmYWlsdXJlCj4+IHRvCj4+Pj4+
Pj4gcHJvYmUgb3IgdGhlIHJlbW92YWwgb2YgdGhlIGRldmljZSB3b3VsZCBsZWF2ZSB0aGUgeGVu
YnVzIHN0YXRlIGFzCj4+Pj4+Pj4gY2xvc2VkLCB3aGljaCBpcyBjb25zaXN0ZW50IHdpdGggdGhl
IGFjdHVhbCBkcml2ZXIgc3RhdGUuCj4+Pj4+Pj4KPj4+Pj4+PiBDYW4geW91IGV4cGxhaW4gd2hh
dCdzIHRoZSBiZW5lZml0IG9mIGxlYXZpbmcgYSBkZXZpY2Ugd2l0aG91dCBhCj4+Pj4+Pj4gZHJp
dmVyIGluIHN1Y2ggdW5rbm93biBzdGF0ZT8KPj4+Pj4+Cj4+Pj4+PiBBbmQgbW9yZSBjb25jZXJu
aW5nOiBkaWQgeW91IGNoZWNrIHRoYXQgbm8gZnJvbnRlbmQvYmFja2VuZCBpcwo+Pj4+Pj4gcmVs
eWluZyBvbiB0aGUgY2xvc2VkIHN0YXRlIHRvIGJlIHZpc2libGUgd2l0aG91dCBjbG9zaW5nIGhh
dmluZyBiZWVuCj4+Pj4+PiBzZXQgYmVmb3JlPwo+Pj4+Pgo+Pj4+PiBCbGtmcm9udCBkb2Vzbid0
IHNlZW0gdG8gbWluZCBhbmQgSSBiZWxpZXZlIHRoZSBXaW5kb3dzIFBWIGRyaXZlcnMKPj4gY29w
ZSwKPj4+PiBidXQgSSBkb24ndCByZWFsbHkgdW5kZXJzdGFuZCB0aGUgY29tbWVudCBzaW5jZSB0
aGlzIHBhdGNoIGlzIGFjdHVhbGx5Cj4+Pj4gcmVtb3ZpbmcgYSBjYXNlIHdoZXJlIHRoZSBiYWNr
ZW5kIHRyYW5zaXRpb25zIGRpcmVjdGx5IHRvIGNsb3NlZC4KPj4+Pgo+Pj4+IEknbSBub3Qgc3Bl
YWtpbmcgb2YgYmxrZnJvbnQvYmxrYmFjayBvbmx5LCBidXQgb2YgbmV0LCB0cG0sIHNjc2ksCj4+
IHB2Y2FsbAo+Pj4+IGV0Yy4gZnJvbnRlbmRzL2JhY2tlbmRzLiBBZnRlciBhbGwgeW91IGFyZSBt
b2RpZnlpbmcgYSBmdW5jdGlvbiBjb21tb24KPj4+PiB0byBhbGwgUFYgZHJpdmVyIHBhaXJzLgo+
Pj4+Cj4+Pj4gWW91IGFyZSByZW1vdmluZyBhIHN0YXRlIHN3aXRjIHRvICJjbG9zZWQiIGluIGNh
c2UgdGhlIHN0YXRlIHdhcyBfbm90Xwo+Pj4+ICJjbG9zaW5nIiBiZWZvcmUuCj4+Pgo+Pj4gWWVz
LCB3aGljaCBBRkFJSyBpcyBhZ2FpbnN0IHRoZSBpbnRlbnRpb24gb2YgdGhlIGdlbmVyaWMgUFYg
cHJvdG9jb2wKPj4gc3VjaCB0aGF0IGl0IGV2ZXIgZXhpc3RlZCBhbnl3YXkuCj4+Cj4+IFdoaWxl
IHRoaXMgbWlnaHQgYmUgdGhlIGNhc2Ugd2Ugc2hvdWxkIF9ub3RfIGJyZWFrIGFueSBndWVzdHMK
Pj4gcnVubmluZyBub3cuIFNvIHRoaXMga2luZCBvZiByZWFzb25pbmcgaXMgZGFuZ2Vyb3VzLgo+
Pgo+Pj4KPj4+PiBTbyBhbnkgUFYgZHJpdmVyIHJlYWN0aW5nIHRvICJjbG9zZWQiIG9mIHRoZSBv
dGhlciBlbmQKPj4+PiBpbiBjYXNlIHRoZSBwcmV2aW91cyBzdGF0ZSBtaWdodCBub3QgaGF2ZSBi
ZWVuICJjbG9zaW5nIiBiZWZvcmUgaXMgYXQKPj4+PiByaXNrIHRvIG1pc2JlaGF2ZSB3aXRoIHlv
dXIgcGF0Y2guCj4+Pgo+Pj4gV2VsbCwgdGhleSB3aWxsIHNlZSBub3RoaW5nIG5vdy4gSWYgdGhl
IHN0YXRlIHdhcyBub3QgY2xvc2luZywgaXQgZ2V0cwo+PiBsZWZ0IGFsb25lLCBzbyB0aGUgZnJv
bnRlbmQgc2hvdWxkbid0IGRvIGFueXRoaW5nLiBUaGUgb25seSByaXNrIHRoYXQgSQo+PiBjYW4g
c2VlIGlzIHRoYXQgc29tZSBmcm9udGVuZC9iYWNrZW5kIHBhaXIgbmVlZGVkIGEgZGlyZWN0IDQg
LT4gNgo+PiB0cmFuc2l0aW9uIHRvIHN1cHBvcnQgJ3VuYmluZCcgYmVmb3JlIGJ1dCBBRkFJSyBu
b3RoaW5nIGhhcyBldmVyIHN1cHBvcnRlZAo+PiB0aGF0LCBhbmQgYmxrIGFuZCBuZXQgY3Jhc2gn
bididXJuIGlmIHlvdSB0cnkgdGhhdCBvbiB1cHN0cmVhbSBhcyBpdAo+PiBzdGFuZHMuIEEgY2xl
YW4gdW5wbHVnIHdvdWxkIGFsd2F5cyBzZXQgc3RhdGUgdG8gNSBmaXJzdCwgc2luY2UgdGhhdCdz
Cj4+IHBhcnQgb2YgdGhlIHVucGx1ZyBwcm90b2NvbC4KPj4KPj4gVGhhdCB3YXMgbXkgcXVlc3Rp
b246IGFyZSB5b3Ugc3VyZSBhbGwgY3VycmVudCBhbmQgcHJldmlvdXMKPj4gZ3Vlc3QgZnJvbnRl
bmRzIGFuZCBiYWNrZW5kcyBhcmUgaGFuZGxpbmcgdW5wbHVnIHRoaXMgd2F5Pwo+Pgo+PiBOb3Qg
InNob3VsZCBoYW5kbGUiLCBidXQgImRvIGhhbmRsZSIuCj4gCj4gVGhhdCBkZXBlbmRzIG9uIHRo
ZSB0b29sc3RhY2suIElJVUMgdGhlIG9ubHkgJ3N1cHBvcnRlZCcgdG9vbHN0YWNrIGlzIHhsL2xp
YnhsLCB3aGljaCB3aWxsIHNldCAnc3RhdGUnIHRvIDUgYW5kICdvbmxpbmUnIHRvIDAgdG8gaW5p
dGlhdGUgYW4gdW5wbHVnLgoKSSBndWVzcyBsaWJ2aXJ0L2xpYnhsIGlzIGRvaW5nIHRoZSBzYW1l
PwoKQXQgbGVhc3QgYXQgU1VTRSB3ZSBzdGlsbCBoYXZlIHNvbWUgY3VzdG9tZXJzIHJ1bm5pbmcg
eGVuZCBiYXNlZApYZW4gaW5zdGFsbGF0aW9ucyB3aXRoIHJlY2VudCBMaW51eCBvciBXaW5kb3dz
IGd1ZXN0cy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
