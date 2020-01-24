Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517FA14905D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 22:44:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv6iK-0004SI-Lu; Fri, 24 Jan 2020 21:42:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DcBz=3N=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1iv6iI-0004SD-Jh
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 21:42:02 +0000
X-Inumbo-ID: 5a3dce2c-3ef2-11ea-80e8-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5a3dce2c-3ef2-11ea-80e8-12813bfff9fa;
 Fri, 24 Jan 2020 21:42:01 +0000 (UTC)
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
 <20200121150704.126001-2-jeff.kubascik@dornerworks.com>
 <78db27b5-ab04-904a-f2b8-869969fbae21@xen.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <a6a4d197-c511-d7ed-c137-4d5f05f098de@dornerworks.com>
Date: Fri, 24 Jan 2020 16:43:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <78db27b5-ab04-904a-f2b8-869969fbae21@xen.org>
Content-Language: en-US
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: remove physical timer offset
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

T24gMS8yMy8yMDIwIDc6MzIgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAy
MS8wMS8yMDIwIDE1OjA3LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+PiBUaGUgcGh5c2ljYWwgdGlt
ZXIgdHJhcHMgYXBwbHkgYW4gb2Zmc2V0IHNvIHRoYXQgdGltZSBzdGFydHMgYXQgMCBmb3IKPj4g
dGhlIGd1ZXN0LiBIb3dldmVyLCB0aGlzIG9mZnNldCBpcyBub3QgY3VycmVudGx5IGFwcGxpZWQg
dG8gdGhlIHBoeXNpY2FsCj4+IGNvdW50ZXIuIFBlciB0aGUgQVJNdjggUmVmZXJlbmNlIE1hbnVh
bCAoQVJNIERESSAwNDg3RS5hKSwgc2VjdGlvbgo+PiBEMTEuMi40IFRpbWVycywgdGhlICJPZmZz
ZXQiIGJldHdlZW4gdGhlIGNvdW50ZXIgYW5kIHRpbWVyIHNob3VsZCBiZQo+PiB6ZXJvIGZvciBh
IHBoeXNpY2FsIHRpbWVyLiBUaGlzIHJlbW92ZXMgdGhlIG9mZnNldCB0byBtYWtlIHRoZSB0aW1l
ciBhbmQKPj4gY291bnRlciBjb25zaXN0ZW50Lgo+Pgo+PiBUaGlzIGFsc28gY2xlYW5zIHVwIHRo
ZSBwaHlzaWNhbCB0aW1lciBpbXBsZW1lbnRhdGlvbiB0byBiZXR0ZXIgbWF0Y2gKPj4gdGhlIHZp
cnR1YWwgdGltZXIgLSBib3RoIGN2YWwncyBub3cgaG9sZCB0aGUgaGFyZHdhcmUgdmFsdWUuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEplZmYgS3ViYXNjaWsgPGplZmYua3ViYXNjaWtAZG9ybmVyd29y
a3MuY29tPgo+PiAtLS0KPj4gICB4ZW4vYXJjaC9hcm0vdnRpbWVyLmMgICAgICAgIHwgMzQgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0v
ZG9tYWluLmggfCAgMyAtLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Z0aW1lci5j
IGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jCj4+IGluZGV4IDI0MGE4NTBiNmUuLjBjNzhhNjU4NjMg
MTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS92dGltZXIuYwo+PiArKysgYi94ZW4vYXJjaC9h
cm0vdnRpbWVyLmMKPj4gQEAgLTYyLDcgKzYyLDYgQEAgc3RhdGljIHZvaWQgdmlydF90aW1lcl9l
eHBpcmVkKHZvaWQgKmRhdGEpCj4+Cj4+ICAgaW50IGRvbWFpbl92dGltZXJfaW5pdChzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnICpjb25maWcpCj4+ICAgewo+
PiAtICAgIGQtPmFyY2gucGh5c190aW1lcl9iYXNlLm9mZnNldCA9IE5PVygpOwo+PiAgICAgICBk
LT5hcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgPSBSRUFEX1NZU1JFRzY0KENOVFBDVF9FTDAp
Owo+PiAgICAgICBkLT50aW1lX29mZnNldC5zZWNvbmRzID0gdGlja3NfdG9fbnMoZC0+YXJjaC52
aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0IC0gYm9vdF9jb3VudCk7Cj4+ICAgICAgIGRvX2RpdihkLT50
aW1lX29mZnNldC5zZWNvbmRzLCAxMDAwMDAwMDAwKTsKPj4gQEAgLTEwOCw3ICsxMDcsNiBAQCBp
bnQgdmNwdV92dGltZXJfaW5pdChzdHJ1Y3QgdmNwdSAqdikKPj4KPj4gICAgICAgaW5pdF90aW1l
cigmdC0+dGltZXIsIHBoeXNfdGltZXJfZXhwaXJlZCwgdCwgdi0+cHJvY2Vzc29yKTsKPj4gICAg
ICAgdC0+Y3RsID0gMDsKPj4gLSAgICB0LT5jdmFsID0gTk9XKCk7Cj4+ICAgICAgIHQtPmlycSA9
IGQwCj4+ICAgICAgICAgICA/IHRpbWVyX2dldF9pcnEoVElNRVJfUEhZU19OT05TRUNVUkVfUFBJ
KQo+PiAgICAgICAgICAgOiBHVUVTVF9USU1FUl9QSFlTX05TX1BQSTsKPj4gQEAgLTE2Nyw2ICsx
NjUsNyBAQCB2b2lkIHZpcnRfdGltZXJfcmVzdG9yZShzdHJ1Y3QgdmNwdSAqdikKPj4gICBzdGF0
aWMgYm9vbCB2dGltZXJfY250cF9jdGwoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQz
Ml90ICpyLCBib29sIHJlYWQpCj4+ICAgewo+PiAgICAgICBzdHJ1Y3QgdmNwdSAqdiA9IGN1cnJl
bnQ7Cj4+ICsgICAgc190aW1lX3QgZXhwaXJlczsKPj4KPj4gICAgICAgaWYgKCAhQUNDRVNTX0FM
TE9XRUQocmVncywgRUwwUFRFTikgKQo+PiAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+PiBAQCAt
MTg0LDggKzE4Myw5IEBAIHN0YXRpYyBib29sIHZ0aW1lcl9jbnRwX2N0bChzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncywgdWludDMyX3QgKnIsIGJvb2wgcmVhZCkKPj4KPj4gICAgICAgICAgIGlm
ICggdi0+YXJjaC5waHlzX3RpbWVyLmN0bCAmIENOVHhfQ1RMX0VOQUJMRSApCj4+ICAgICAgICAg
ICB7Cj4+IC0gICAgICAgICAgICBzZXRfdGltZXIoJnYtPmFyY2gucGh5c190aW1lci50aW1lciwK
Pj4gLSAgICAgICAgICAgICAgICAgICAgICB2LT5hcmNoLnBoeXNfdGltZXIuY3ZhbCArIHYtPmRv
bWFpbi0+YXJjaC5waHlzX3RpbWVyX2Jhc2Uub2Zmc2V0KTsKPj4gKyAgICAgICAgICAgIGV4cGly
ZXMgPSB2LT5hcmNoLnBoeXNfdGltZXIuY3ZhbCA+IGJvb3RfY291bnQKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICA/IHRpY2tzX3RvX25zKHYtPmFyY2gucGh5c190aW1lci5jdmFsIC0gYm9vdF9j
b3VudCkgOiAwOwo+PiArICAgICAgICAgICAgc2V0X3RpbWVyKCZ2LT5hcmNoLnBoeXNfdGltZXIu
dGltZXIsIGV4cGlyZXMpOwo+IAo+IFdoaWxlIHRoZSBmYWN0b3Jpbmcgd2FzIG9wdGlvbmFsLCBt
eSByZXF1ZXN0IG9mIGEgY29tbWVudCB3YXNuJ3QgKGV2ZW4KPiBpZiBpdCByZXF1aXJlcyB0byBk
dXBsaWNhdGUgMyB0aW1lcykuCgpVbmRlcnN0b29kLgoKPiBJZiB5b3Ugc3VnZ2VzdCBhIGNvbW1l
bnQgYW5kIGFuIHVwZGF0ZSBvZiB0aGUgY29tbWl0IG1lc3NhZ2UsIEkgY2FuCj4gbWVyZ2UgaXQg
aW4gdGhpcyBwYXRjaCBvbiBjb21taXQuCgpGb3IgdGhlIGNvbW1lbnQ6CgovKiBJZiBjdmFsIGlz
IGJlZm9yZSB0aGUgcG9pbnQgWGVuIHN0YXJ0ZWQsIGV4cGlyZSB0aW1lciBpbW1lZGlhdGVseSAq
LwoKRm9yIHRoZSBjb21taXQgbWVzc2FnZToKCkluIHRoZSBjYXNlIHRoZSBndWVzdCBzZXRzIGN2
YWwgdG8gYSB0aW1lIGJlZm9yZSBYZW4gc3RhcnRlZCwgdGhlIGNvcnJlY3QKYmVoYXZpb3IgaXMg
dG8gZXhwaXJlIHRoZSB0aW1lciBpbW1lZGlhdGVseS4gVG8gZG8gdGhpcywgd2Ugc2V0IHRoZSBl
eHBpcmVzCmFyZ3VtZW50IG9mIHNldF90aW1lciB0byB6ZXJvLgoKPiBDaGVlcnMsCj4gCj4gLS0K
PiBKdWxpZW4gR3JhbGwKPiAKClNpbmNlcmVseSwKSmVmZiBLdWJhc2NpawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
