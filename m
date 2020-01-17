Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082F141318
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 22:30:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isZA2-0000U1-Uy; Fri, 17 Jan 2020 21:28:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e2Nf=3G=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1isZA2-0000Tw-5i
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 21:28:10 +0000
X-Inumbo-ID: 417f739a-3970-11ea-b626-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 417f739a-3970-11ea-b626-12813bfff9fa;
 Fri, 17 Jan 2020 21:28:09 +0000 (UTC)
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
 <20191211211302.117395-3-jeff.kubascik@dornerworks.com>
 <1c90e15b-0f61-7b06-2291-795185ba5b48@xen.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <8544c070-e5b6-50d2-df4b-71563755b57f@dornerworks.com>
Date: Fri, 17 Jan 2020 16:29:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1c90e15b-0f61-7b06-2291-795185ba5b48@xen.org>
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

T24gMTIvMTgvMjAxOSA5OjI0IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSmVmZiwKPiAK
PiBPbiAxMS8xMi8yMDE5IDIxOjEzLCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+PiBQZXIgdGhlIEFS
TXY4IFJlZmVyZW5jZSBNYW51YWwgKEFSTSBEREkgMDQ4N0UuYSksIHNlY3Rpb24gRDExLjIuNAo+
PiBzcGVjaWZpZXMgdGhhdCB0aGUgdmFsdWVzIGluIHRoZSBUaW1lclZhbHVlIHZpZXcgb2YgdGhl
IHRpbWVycyBhcmUKPj4gc2lnbmVkIGluIHN0YW5kYXJkIHR3bydzIGNvbXBsZW1lbnQgZm9ybS4g
V2hlbiB3cml0aW5nIHRvIHRoZSBUaW1lclZhbHVlCj4gCj4gRG8geW91IG1lYW4gQ29tcGFyZVZh
bHVlIHJlZ2lzdGVyIGluc3RlYWQgb2YgVGltZXJWYWx1ZSByZWdpc3Rlcj8KCkknbSBmYWlybHkg
Y2VydGFpbiBUaW1lclZhbHVlIHJlZ2lzdGVyIGlzIGNvcnJlY3QuIFdoZW4gdGhlIGd1ZXN0IHdy
aXRlcyB0byB0aGUKVGltZXJWYWx1ZSByZWdpc3RlciwgdGhlIGVxdWF0aW9uIGJlbG93IGlzIHVz
ZWQgdG8gY29udmVydCBpdCB0byBhIENvbXBhcmVWYWx1ZQplcXVpdmFsZW50LgoKPj4gcmVnaXN0
ZXIsIGl0IHNob3VsZCBiZSBzaWduZWQgZXh0ZW5kZWQgYXMgZGVzY3JpYmVkIGJ5IHRoZSBlcXVh
dGlvbgo+Pgo+PiAgICAgQ29tcGFyZVZhbHVlID0gKENvdW50ZXJbNjM6MF0gKyBTaWduRXh0ZW5k
KFRpbWVyVmFsdWUpKVs2MzowXQo+IFRoaXMgZXhwbGFpbnMgdGhlIHNpZ25lZCBwYXJ0LCBidXQg
aXQgZG9lcyBub3QgZXhwbGFpbiB3aHkgdGhlIDMyLWJpdAo+IGNhc2UuIFNvIEkgd291bGQgbWVu
dGlvbiB0aGF0IFRpbWVyVmFsdWUgaXMgYSAzMi1iaXQgc2lnbmVkIGludGVnZXIuCj4gCj4gTWF5
YmUgc2F5aW5nICJhcmUgMzItYml0IHNpZ25lZCBpbiBzdGFuZGFyZCAuLi4iCgpJIHB1bGxlZCB0
aGlzIGVxdWF0aW9uIGRpcmVjdGx5IGZyb20gdGhlIEFSTXY4IFJlZmVyZW5jZSBNYW51YWwgLSB0
aGUgbWFudWFsCmdvZXMgaW50byBkZXRhaWwgYWJvdXQgdGhlIHNpZ24gZXh0ZW5zaW9uLiBUaGlz
IGlzIHJlZmVyZW5jZWQgZWFybGllciBpbiB0aGUKY29tbWl0IG1lc3NhZ2UuCgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKZWZmIEt1YmFzY2lrIDxqZWZmLmt1YmFzY2lrQGRvcm5lcndvcmtzLmNvbT4K
Pj4gLS0tCj4+ICAgeGVuL2FyY2gvYXJtL3Z0aW1lci5jIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3Z0aW1lci5jIGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jCj4+IGluZGV4IDIxYjk4
ZWMyMGEuLjg3MjE4MWQ5YjYgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS92dGltZXIuYwo+
PiArKysgYi94ZW4vYXJjaC9hcm0vdnRpbWVyLmMKPj4gQEAgLTIxMSw3ICsyMTEsNyBAQCBzdGF0
aWMgYm9vbCB2dGltZXJfY250cF90dmFsKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1aW50
MzJfdCAqciwKPj4gICAgICAgfQo+PiAgICAgICBlbHNlCj4+ICAgICAgIHsKPj4gLSAgICAgICAg
di0+YXJjaC5waHlzX3RpbWVyLmN2YWwgPSBjbnRwY3QgKyAqcjsKPj4gKyAgICAgICAgdi0+YXJj
aC5waHlzX3RpbWVyLmN2YWwgPSBjbnRwY3QgKyAodWludDY0X3QpKGludDMyX3QpKnI7Cj4+ICAg
ICAgICAgICBpZiAoIHYtPmFyY2gucGh5c190aW1lci5jdGwgJiBDTlR4X0NUTF9FTkFCTEUgKQo+
PiAgICAgICAgICAgewo+PiAgICAgICAgICAgICAgIHYtPmFyY2gucGh5c190aW1lci5jdGwgJj0g
fkNOVHhfQ1RMX1BFTkRJTkc7Cj4+Cj4gCj4gQ2hlZXJzLAo+IAo+IC0tCj4gSnVsaWVuIEdyYWxs
Cj4gCgpTaW5jZXJlbHksCkplZmYgS3ViYXNjaWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
