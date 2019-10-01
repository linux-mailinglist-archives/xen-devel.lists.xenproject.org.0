Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0536DC2FF2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:20:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEHa-0004Ps-T4; Tue, 01 Oct 2019 09:17:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFEHZ-0004Pn-6e
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:17:21 +0000
X-Inumbo-ID: 44efcdb6-e42c-11e9-96f6-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 44efcdb6-e42c-11e9-96f6-12813bfff9fa;
 Tue, 01 Oct 2019 09:17:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90BCA1000;
 Tue,  1 Oct 2019 02:17:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D6593F739;
 Tue,  1 Oct 2019 02:17:18 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <6121ff6c-f7fb-f766-ffb0-7a5f52ddf997@arm.com>
 <9211e84c-fbf8-5a35-e898-23a58e3bd4cb@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2ce8fb9f-d365-cabf-6a98-e61ac525d4e5@arm.com>
Date: Tue, 1 Oct 2019 10:17:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9211e84c-fbf8-5a35-e898-23a58e3bd4cb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMDEvMTAvMjAxOSAwMDoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAzMC8wOS8yMDE5IDIxOjE3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA5
LzMwLzE5IDc6MjQgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBUaGUgY29kZSBnZW5lcmF0
aW9uIGZvciBiYXJyaWVyX25vc3BlY190cnVlKCkgaXMgbm90IGNvcnJlY3QuwqAgV2UgYXJlCj4+
PiB0YWtpbmcgYQo+Pj4gcGVyZiBpdCBmcm9tIHRoZSBhZGRlZCBmZW5jZXMsIGJ1dCBub3QgZ2Fp
bmluZyBhbnkgc3BlY3VsYXRpdmUgc2FmZXR5Lgo+Pgo+PiBzL2l0L2hpdC8/Cj4gCj4gWWVzLgo+
IAo+Pgo+Pj4KPj4+IFRoaXMgaXMgY2F1c2VkIGJ5IGlubGluZSBhc3NlbWJseSB0cnlpbmcgdG8g
ZmlnaHQgdGhlIGNvbXBpbGVyCj4+PiBvcHRpbWlzZXIsIGFuZAo+Pj4gdGhlIG9wdGltaXNlciB3
aW5uaW5nLsKgIFRoZXJlIGlzIG5vIGNsZWFyIHdheSB0byBhY2hpZXZlIHNhZmV0eSwgc28KPj4+
IHR1cm4gdGhlCj4+PiBwZXJmIGhpdCBvZmYgZm9yIG5vdy4KPj4+Cj4+PiBUaGlzIGFsc28gbGFy
Z2VseSByZXZlcnRzIDM4NjBkNTUzNGRmNC7CoCBUaGUgbmFtZSAnbDF0Zi1iYXJyaWVyJywgYW5k
Cj4+PiBtYWtpbmcKPj4+IGJhcnJpZXJfbm9zcGVjX3RydWUoKSBkZXBlbmQgb24gQ09ORklHX0hW
TSB3YXMgY29uc3RyYWluZWQgYnkgd2hhdAo+Pj4gY291bGQgYmUKPj4+IGRpc2N1c3NlZCBwdWJs
aWNseSBhdCB0aGUgdGltZS7CoCBOb3cgdGhhdCBNRFMgaXMgcHVibGljLCBuZWl0aGVyCj4+PiBh
c3BlY3RzIGFyZQo+Pj4gY29ycmVjdC4KPj4+Cj4+PiBBcyBsMXRmLWJhcnJpZXIgaGFzbid0IGJl
ZW4gaW4gYSByZWxlYXNlIG9mIFhlbiwgYW5kCj4+PiBDT05GSUdfU1BFQ1VMQVRJVkVfQlJBTkNI
X0hBUkRFTiBpcyBkaXNhYmxlZCB1bnRpbCB3ZSBjYW4gZmluZCBhIHNhZmUKPj4+IHdheSBvZgo+
Pj4gaW1wbGVtZW50aW5nIHRoZSBmdW5jdGlvbmFsaXR5LCByZW1vdmUgdGhlIGwxdGYtYmFycmll
ciBjb21tYW5kIGxpbmUKPj4+IG9wdGlvbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4gLS0tCj4+PiBDQzogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+
PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+PiBDQzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gQ0M6IE5vcmJlcnQgTWFudGhleSA8bm1h
bnRoZXlAYW1hem9uLmRlPgo+Pj4gLS0tCj4+PiAgwqAgZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUucGFuZG9jIHzCoCA4ICstLS0tLS0tCj4+PiAgwqAgeGVuL2FyY2gveDg2L3NwZWNfY3RybC5j
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMTcgKystLS0tLS0tLS0tLS0tLS0KPj4+ICDCoCB4ZW4vY29t
bW9uL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNyArKysrKysrKysr
KysrKysrKwo+Pgo+PiBJIHRoaW5rIHRoaXMgd2FudGVkIHRvIGhhdmUgIlRIRSBSRVNUIiBDQ2Vk
Lgo+Pgo+Pj4gIMKgIHhlbi9pbmNsdWRlL2FzbS14ODYvY3B1ZmVhdHVyZXMuaCB8wqAgMiArLQo+
Pj4gIMKgIHhlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmjCoMKgwqDCoMKgIHzCoCA0ICsrLS0K
Pj4+ICDCoCB4ZW4vaW5jbHVkZS9hc20teDg2L3NwZWNfY3RybC5owqDCoCB8wqAgMSAtCj4+PiAg
wqAgNiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPj4K
Pj4gWy4uLl0KPj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29t
bW9uL0tjb25maWcKPj4+IGluZGV4IDk2NDRjYzk5MTEuLmQ4NTFlNjMwODMgMTAwNjQ0Cj4+PiAt
LS0gYS94ZW4vY29tbW9uL0tjb25maWcKPj4+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+Pj4g
QEAgLTk2LDYgKzk2LDIzIEBAIGNvbmZpZyBTUEVDVUxBVElWRV9BUlJBWV9IQVJERU4KPj4+ICDC
oCDCoMKgwqDCoMKgwqDCoCBJZiB1bnN1cmUsIHNheSBZLgo+Pj4gIMKgICtjb25maWcgU1BFQ1VM
QVRJVkVfQlJBTkNIX0hBUkRFTgo+Pj4gK8KgwqDCoCBib29sICJTcGVjdWxhdGl2ZSBCcmFuY2gg
SGFyZGVuaW5nIgo+Pj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJST0tFTgo+Pj4gK8KgwqDCoMKgwqDC
oMKgIC0tLWhlbHAtLS0KPj4+ICvCoMKgwqDCoMKgIENvbnRlbXBvcmFyeSBwcm9jZXNzb3JzIG1h
eSB1c2Ugc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGFzIGEKPj4+ICvCoMKgwqDCoMKgIHBlcmZvcm1h
bmNlIG9wdGltaXNhdGlvbiwgYnV0IHRoaXMgY2FuIHBvdGVudGlhbGx5IGJlIGFidXNlZAo+Pj4g
YnkgYW4KPj4+ICvCoMKgwqDCoMKgIGF0dGFja2VyIHRvIGxlYWsgZGF0YSB2aWEgc3BlY3VsYXRp
dmUgc2lkZWNoYW5uZWxzLgo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqAgT25lIHNvdXJjZSBvZiBtaXNi
ZWhhdmlvdXIgaXMgYnkgZXhlY3V0aW5nIHRoZSB3cm9uZyBiYXNpYyBibG9jawo+Pj4gK8KgwqDC
oMKgwqAgZm9sbG93aW5nIGEgY29uZGl0aW9uYWwganVtcC4KPj4+ICsKPj4+ICvCoMKgwqDCoMKg
IFdoZW4gZW5hYmxlZCwgc3BlY2lmaWMgY29uZGl0aW9ucyB3aGljaCBoYXZlIGJlZW4gZGVlbWVk
Cj4+PiBsaWFibGUgdG8KPj4+ICvCoMKgwqDCoMKgIGJlIHNwZWN1bGF0aXZlbHkgYWJ1c2VkIHdp
bGwgYmUgaGFyZGVuZWQgdG8gYXZvaWQgZW50ZXJpbmcgdGhlCj4+PiB3cm9uZwo+Pj4gK8KgwqDC
oMKgwqAgYmFzaWMgYmxvY2suCj4+PiArCj4+PiArwqDCoMKgwqDCoCAhISEgV0FSTklORyAtIFRo
aXMgaXMgYnJva2VuIGFuZCBkb2Vzbid0IGdlbmVyYXRlIHNhZmUgY29kZSAhISEKPj4KPj4gQW55
IHJlYXNvbiB0byBhZGQgdGhhdCBpbiBjb21tb24gY29kZSB3aGVuIHRoaXMgaXMgeDg2IG9ubHk/
Cj4gCj4gSW4gcHJpbmNpcGxlLCBpdHMgbm90IHg4NiBzcGVjaWZpYy4KPiAKPj4gTXkgd29ycnkg
aXMgdGhpcyBnYXRlIGNvbmZpZyBnYXRlIG5vdGhpbmcgb24gQXJtIHNvIHRoZSB1c2VyIG1heSBo
YXZlCj4+IGEgZmFsc2Ugc2Vuc2UgdGhhdCBpdCBjYW4gYmUgdXNlZCAoZXZlbiB0aG91Z2ggaXQg
aXMgY2xlYXJseSBCUk9LRU4pLgo+Pgo+PiBBbHNvIHRoZSBuYW1lIGlzIHF1aXRlIGNsb3NlIHRv
IHRoZSBDT05GSUdfSEFSREVOX1BSRURJQ1RPUiBvbiBBcm0gYW5kCj4+IG1heSBjb25mdXNlIHVz
ZXIuIEFsdGhvdWdoLCBJIGRvbid0IGhhdmUgYSBiZXR0ZXIgbmFtZSBzbyBmYXIgOi8KPiAKPiBU
aGUgImRlcGVuZHMgb24gQlJPS0VOIiBtZWFucyBpdCB3aWxsIG5ldmVyIHNob3cgdXAgdG8gYSB1
c2VyIGluCj4gbWVudWNvbmZpZywgd2hpY2ggaXMgd2h5IGl0IHdhcyBvbmx5IENDIHRvIHg4Niwg
YW5kIG5vdCB0byByZXN0LgoKV2hhdCdzIHRoZSBsb25nIHRlcm0gcGxhbiBmb3IgdGhpcyBvcHRp
b24/IEFyZSB5b3UgcGxhbm5pbmcgdG8gcmVtb3ZlIGl0IApjb21wbGV0ZWx5IG9yIGp1c3QgdGhl
IGRlcGVuZGVuY2llcyBvbiBCUk9LRU4/CgpNeSBjb25jZXJuIGlzIGlmIHRoaXMgb3B0aW9uIHdp
bGwgZXZlciBiZWNvbWUgc2VsZWN0YWJsZSB0aGVuIGl0IHdpbGwgbm90IGRvaW5nIAp3aGF0J3Mg
ZXhwZWN0ZWQgb24gQXJtLgoKU28sIGV2ZW4gaWYgaW4gcHJpbmNpcGxlIGl0IGlzIGFyY2ggYWdu
b3N0aWMsIGl0IGZlZWxzIHRvIG1lIHRoaXMgb3B0aW9uIHNob3VsZCAKYmV0dGVyIGJlIGltcGxl
bWVudGVkIGluIHg4Ni9LY29uZmlnLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
