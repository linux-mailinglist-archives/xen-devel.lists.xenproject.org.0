Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE6143F67
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 15:23:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ituOe-0002Zx-HP; Tue, 21 Jan 2020 14:20:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mp0=3K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ituOc-0002Zs-Vk
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 14:20:47 +0000
X-Inumbo-ID: 35d31115-3c59-11ea-bab7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35d31115-3c59-11ea-bab7-12813bfff9fa;
 Tue, 21 Jan 2020 14:20:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 88F3BB33A;
 Tue, 21 Jan 2020 14:20:44 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200121101301.421-1-jgross@suse.com>
 <20200121101301.421-2-jgross@suse.com>
 <958c5f52-143c-e72f-a421-1071e6e27654@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7676e3c3-9fef-c2cd-9cd1-00d94f5bfb56@suse.com>
Date: Tue, 21 Jan 2020 15:20:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <958c5f52-143c-e72f-a421-1071e6e27654@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen: add config option to include
 failing condition in BUG_ON() message
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAgMTI6MzgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDIxLzAxLzIwMjAgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRvZGF5IGEgdHJp
Z2dlcmluZyBCVUdfT04oKSB3aWxsIG9ubHkgcHJpbnQgc291cmNlIGZpbGUgYW5kIGxpbmUKPj4g
aW5mb3JtYXRpb24uIEFkZCB0aGUgcG9zc2liaWxpdHkgdG8gcHJpbnQgdGhlIHRyaWdnZXJpbmcg
Y29uZGl0aW9uIGxpa2UKPj4gQVNTRVJUKCkuCj4gCj4gQW55IHJlYXNvbiB0byBvbmx5IGxpbWl0
IHRoZSBjaGFuZ2UgZm9yIEJVR19PTj8gSG93IGFib3V0IFdBUk5fT04/CgpIbW0sIHdoeSBub3Qu
CgpBbnkgb2JqZWN0aW9ucz8KCj4gCj4+Cj4+IERvIHRoYXQgYnkgaW50cm9kdWNpbmcgQlVHX1ZF
UkJPU0UoKSBhbmQgYWRkIGEgS2NvbmZpZyBvcHRpb24gdG8gbWFrZQo+PiBCVUdfT04gdXNlIEJV
R19WRVJCT1NFKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPj4gLS0tCj4+IFYzOgo+PiAtIG1vdmUga2NvbmZpZyBvcHRpb24gb3V0IG9mIERF
QlVHIHx8IGV4cGVydCBzZWN0aW9uIChKYW4gQmV1bGljaCkKPj4gLSBmaXggQVJNIGJ1aWxkIChK
YW4gQmV1bGljaCkKPj4gLSBlbGltaW5hdGUgQlVHX09OX1ZFUkJPU0UoKSAoSmFuIEJldWxpY2gp
Cj4+IC0tLQo+PiDCoCB4ZW4vS2NvbmZpZy5kZWJ1Z8KgwqDCoMKgwqDCoMKgwqAgfCA4ICsrKysr
KystCj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYnVnLmggfCA2ICsrKystLQo+PiDCoCB4ZW4v
aW5jbHVkZS9hc20teDg2L2J1Zy5oIHwgNSArKystLQo+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vbGli
LmjCoMKgwqDCoCB8IDQgKysrKwo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vS2NvbmZpZy5kZWJ1ZyBi
L3hlbi9LY29uZmlnLmRlYnVnCj4+IGluZGV4IGIzNTExZTgxYTIuLjc1Yzg1NWU0YWUgMTAwNjQ0
Cj4+IC0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCj4+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnCj4+
IEBAIC0xMSw2ICsxMSwxMyBAQCBjb25maWcgREVCVUcKPj4gwqDCoMKgwqDCoMKgwqAgWW91IHBy
b2JhYmx5IHdhbnQgdG8gc2F5ICdOJyBoZXJlLgo+PiArY29uZmlnIERFQlVHX0JVR1ZFUkJPU0UK
Pj4gK8KgwqDCoCBib29sICJWZXJib3NlIEJVR19PTiBtZXNzYWdlcyIKPj4gK8KgwqDCoCBkZWZh
dWx0IERFQlVHCj4+ICvCoMKgwqAgLS0taGVscC0tLQo+PiArwqDCoMKgwqDCoCBJbiBjYXNlIGEg
QlVHX09OIHRyaWdnZXJzIGFkZGl0aW9uYWxseSBwcmludCB0aGUgdHJpZ2dlcmluZwo+PiArwqDC
oMKgwqDCoCBjb25kaXRpb24gb24gdGhlIGNvbnNvbGUuCj4+ICsKPj4gwqAgaWYgREVCVUcgfHwg
RVhQRVJUID0gInkiCj4+IMKgIGNvbmZpZyBDUkFTSF9ERUJVRwo+PiBAQCAtODEsNyArODgsNiBA
QCBjb25maWcgUEVSRl9BUlJBWVMKPj4gwqDCoMKgwqDCoCAtLS1oZWxwLS0tCj4+IMKgwqDCoMKg
wqDCoMKgIEVuYWJsZXMgc29mdHdhcmUgcGVyZm9ybWFuY2UgY291bnRlciBhcnJheSBoaXN0b2dy
YW1zLgo+PiAtCj4gCj4gV2hpbGUgSSBhZ3JlZSB0aGlzIHNob3VsZCBiZSBkcm9wcGVkIHRoaXMg
aXMgYSBzcHVyaW91cyBsaW5lLCB0aGlzIGZlZWxzIAo+IGEgYml0IG91dCBvZiBjb250ZXh0LiBT
byBJIHdvdWxkIHN1Z2dlc3QgdG8gbWVudGlvbiBpdCBpbiB0aGUgY29tbWl0IAo+IG1lc3NhZ2Ug
b3Igc3BsaXQgaXQgaW4gYSBzZXBhcmF0ZSBwYXRjaC4KCkluIGZhY3QgdGhpcyBpcyB0aGUgcmVz
dWx0IG9mIG1vdmluZyB0aGUgbmV3IG9wdGlvbiBpbiBWMy4KCkknbGwgbWVudGlvbiB0aGUgY2hh
bmdlIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gCj4+IMKgIGNvbmZpZyBWRVJCT1NFX0RFQlVH
Cj4+IMKgwqDCoMKgwqAgYm9vbCAiVmVyYm9zZSBkZWJ1ZyBtZXNzYWdlcyIKPj4gwqDCoMKgwqDC
oCBkZWZhdWx0IERFQlVHCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2J1Zy5o
IGIveGVuL2luY2x1ZGUvYXNtLWFybS9idWcuaAo+PiBpbmRleCAzNmM4MDMzNTdjLi45MGIyMzFl
NzdhIDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2J1Zy5oCj4+ICsrKyBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vYnVnLmgKPj4gQEAgLTYwLDExICs2MCwxMyBAQCBzdHJ1Y3QgYnVn
X2ZyYW1lIHsKPj4gwqAgI2RlZmluZSBXQVJOKCkgQlVHX0ZSQU1FKEJVR0ZSQU1FX3dhcm4sIF9f
TElORV9fLCBfX0ZJTEVfXywgMCwgIiIpCj4+IC0jZGVmaW5lIEJVRygpIGRvIHvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiAtwqDCoMKgIEJVR19GUkFNRShCVUdGUkFNRV9i
dWcswqAgX19MSU5FX18sIF9fRklMRV9fLCAwLCAiIik7wqDCoMKgwqDCoMKgwqAgXAo+PiArI2Rl
ZmluZSBCVUdfVkVSQk9TRShtc2cpIGRvIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgQlVHX0ZS
QU1FKEJVR0ZSQU1FX2J1ZyzCoCBfX0xJTkVfXywgX19GSUxFX18sIDAsIG1zZyk7wqDCoMKgwqDC
oMKgIFwKPiAKPiBJIGFtIGFmcmFpZCB0aGlzIGlzIG5vdCBnb2luZyB0byBiZSBlbm91Z2ggdG8g
bWFrZSBpdCB3b3JrIG9uIEFybS4gWW91IAo+IGFsc28gbmVlZCB0byB1cGRhdGUgZG9fYnVnX2Zy
YW1lKCkgdG8gcHJpbnQgdGhlIHN0cmluZy4KPiAKPiBJIHdvdWxkIGFjdHVhbGx5IGV4cGVjdCBh
IHNpbWlsYXIgY2hhbmdlIHJlcXVpcmVkIG9uIHRoZSB4ODYgc2lkZS4gRG8gCj4geW91IG1pbmQg
ZXhwbGFpbmluZyBob3cgdGhpcyB3b3Jrcz8KCllvdSBhcmUgcmlnaHQsIG9mIGNvdXJzZS4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
