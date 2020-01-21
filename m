Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58889143FE1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 15:44:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itujU-0004Jf-QW; Tue, 21 Jan 2020 14:42:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=li9x=3K=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1itujT-0004Ja-HN
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 14:42:19 +0000
X-Inumbo-ID: 33f34b68-3c5c-11ea-9fd7-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 33f34b68-3c5c-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 14:42:11 +0000 (UTC)
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
 <20191211211302.117395-3-jeff.kubascik@dornerworks.com>
 <1c90e15b-0f61-7b06-2291-795185ba5b48@xen.org>
 <8544c070-e5b6-50d2-df4b-71563755b57f@dornerworks.com>
 <de5f1e38-19b8-a274-371a-4d0cdbfef869@xen.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <57d150ea-4716-e155-b969-5d3256e5c4c7@dornerworks.com>
Date: Tue, 21 Jan 2020 09:43:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <de5f1e38-19b8-a274-371a-4d0cdbfef869@xen.org>
Content-Language: en-US
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen/arm: sign extend writes to
 TimerValue
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xOC8yMDIwIDY6NDkgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBPbiAxNy8wMS8yMDIw
IDIxOjI5LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+PiBPbiAxMi8xOC8yMDE5IDk6MjQgQU0sIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpIEplZmYsCj4+Pgo+Pj4gT24gMTEvMTIvMjAxOSAyMTox
MywgSmVmZiBLdWJhc2NpayB3cm90ZToKPj4+PiBQZXIgdGhlIEFSTXY4IFJlZmVyZW5jZSBNYW51
YWwgKEFSTSBEREkgMDQ4N0UuYSksIHNlY3Rpb24gRDExLjIuNAo+Pj4+IHNwZWNpZmllcyB0aGF0
IHRoZSB2YWx1ZXMgaW4gdGhlIFRpbWVyVmFsdWUgdmlldyBvZiB0aGUgdGltZXJzIGFyZQo+Pj4+
IHNpZ25lZCBpbiBzdGFuZGFyZCB0d28ncyBjb21wbGVtZW50IGZvcm0uIFdoZW4gd3JpdGluZyB0
byB0aGUgVGltZXJWYWx1ZQo+Pj4KPj4+IERvIHlvdSBtZWFuIENvbXBhcmVWYWx1ZSByZWdpc3Rl
ciBpbnN0ZWFkIG9mIFRpbWVyVmFsdWUgcmVnaXN0ZXI/Cj4+Cj4+IEknbSBmYWlybHkgY2VydGFp
biBUaW1lclZhbHVlIHJlZ2lzdGVyIGlzIGNvcnJlY3QuIFdoZW4gdGhlIGd1ZXN0IHdyaXRlcyB0
byB0aGUKPj4gVGltZXJWYWx1ZSByZWdpc3RlciwgdGhlIGVxdWF0aW9uIGJlbG93IGlzIHVzZWQg
dG8gY29udmVydCBpdCB0byBhIENvbXBhcmVWYWx1ZQo+PiBlcXVpdmFsZW50Lgo+IAo+IEkgZmlu
ZCB0aGUgc2VudGVuY2UgcXVpdGUgY29uZnVzaW5nIHRvIHJlYWQuIEl0IGlzIG5vdCB0aGUgd3Jp
dGUgdGhhdAo+IG5lZWRzIHRvIGJlIHNpZ25lZCBleHRlbmQsIGJ1dCB0aGUgdmFsdWUgdXNlZCB0
byBjb21wdXRlIENvbXBhcmVWYWx1ZS4KPiBTbyBob3cgYWJvdXQgdGhlIGZvbGxvd2luZyBjb21t
aXQgbWVzc2FnZToKPiAKPiAiCj4geGVuL2FybTogU2lnbiBleHRlbmQgVGltZXJWYWx1ZSB3aGVu
IGNvbXB1dGluZyB0aGUgQ29tcGFyZVZhbHVlCj4gCj4gWGVuIHdpbGwgb25seSBzdG9yZSB0aGUg
Q29tcGFyZVZhbHVlIGFzIGl0IGNhbiBiZSBkZXJpdmVkIGZyb20gdGhlCj4gVGltZXJWYWx1ZSAo
QVJNIERESSAwNDg3RS5hIHNlY3Rpb24gRDExLjIuNCk6Cj4gCj4gICBDb21wYXJlVmFsdWUgPSAo
Q291bnRlcls2MzowXSArIFNpZ25FeHRlbmQoVGltZXJWYWx1ZSkpWzYzOjBdCj4gCj4gV2hpbGUg
dGhlIFRpbWVyVmFsdWUgaXMgYSAzMi1iaXQgc2lnbmVkIHZhbHVlLCBvdXIgaW1wbGVtZW50YXRp
b24KPiBhc3N1bWVkIGl0IGlzIGEgMzItYml0IHVuc2lnbmVkIHZhbHVlLgo+ICIKCkkgYWdyZWUg
d2l0aCB0aGlzIHZlcnNpb24sIGl0IGlzIGNsZWFyZXIgYW5kIGFuZCBzaW1wbGVyLgoKPj4KPj4+
PiByZWdpc3RlciwgaXQgc2hvdWxkIGJlIHNpZ25lZCBleHRlbmRlZCBhcyBkZXNjcmliZWQgYnkg
dGhlIGVxdWF0aW9uCj4+Pj4KPj4+PiAgICAgIENvbXBhcmVWYWx1ZSA9IChDb3VudGVyWzYzOjBd
ICsgU2lnbkV4dGVuZChUaW1lclZhbHVlKSlbNjM6MF0KPj4+IFRoaXMgZXhwbGFpbnMgdGhlIHNp
Z25lZCBwYXJ0LCBidXQgaXQgZG9lcyBub3QgZXhwbGFpbiB3aHkgdGhlIDMyLWJpdAo+Pj4gY2Fz
ZS4gU28gSSB3b3VsZCBtZW50aW9uIHRoYXQgVGltZXJWYWx1ZSBpcyBhIDMyLWJpdCBzaWduZWQg
aW50ZWdlci4KPj4+Cj4+PiBNYXliZSBzYXlpbmcgImFyZSAzMi1iaXQgc2lnbmVkIGluIHN0YW5k
YXJkIC4uLiIKPj4KPj4gSSBwdWxsZWQgdGhpcyBlcXVhdGlvbiBkaXJlY3RseSBmcm9tIHRoZSBB
Uk12OCBSZWZlcmVuY2UgTWFudWFsIC0gdGhlIG1hbnVhbAo+PiBnb2VzIGludG8gZGV0YWlsIGFi
b3V0IHRoZSBzaWduIGV4dGVuc2lvbi4gVGhpcyBpcyByZWZlcmVuY2VkIGVhcmxpZXIgaW4gdGhl
Cj4+IGNvbW1pdCBtZXNzYWdlLgo+IAo+IFdoaWxlIEkgYWdyZWUgdGhlIGNvbW1pdCBtZXNzYWdl
IGV4cGxhaW4gaW4gZGV0YWlscyB0aGUgc2lnbiBleHRlbnNpb24sCj4gdGhlcmUgaXMgbm90aGlu
ZyBpbiB5b3VyIGNvbW1pdCBtZXNzYWdlIGFib3V0IHRoZSBzaXplIG9mIFRpbWVyVmFsdWUKPiAo
aS5lIDMyLWJpdCkuIElmIHlvdSBzYXkgaXQgaXMgYSAzMi1iaXQgc2lnbmVkIHZhbHVlLCB0aGVu
IGl0IGlzIG11Y2gKPiBjbGVhcmVyIHRvIHVuZGVyc3RhbmQgdGhlIGNhc3QgeW91IGFkZGVkIGJl
bG93Lgo+IAo+IEJ1dCBwbGVhc2Ugc2VlIGFib3ZlIGZvciBhIHN1Z2dlc3RlZCBjb21taXQgbWVz
c2FnZS4KCkknbGwgc2VuZCBvdXQgYW4gdXBkYXRlZCBwYXRjaCBzZXQgd2l0aCB0aGUgbmV3IGNv
bW1pdCBtZXNzYWdlLgoKPiBDaGVlcnMsCj4gCj4gLS0KPiBKdWxpZW4gR3JhbGwKPiAKClNpbmNl
cmVseSwKSmVmZiBLdWJhc2NpawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
