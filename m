Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3BB968AA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 20:37:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i08yZ-0000T6-2Y; Tue, 20 Aug 2019 18:35:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYQB=WQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i08yY-0000T1-0q
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 18:35:22 +0000
X-Inumbo-ID: d829c486-c372-11e9-adb9-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d829c486-c372-11e9-adb9-12813bfff9fa;
 Tue, 20 Aug 2019 17:49:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAAAF28;
 Tue, 20 Aug 2019 10:49:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 242943F718;
 Tue, 20 Aug 2019 10:49:22 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
 <20190819174338.10466-8-sstabellini@kernel.org>
 <4be7e616-e36f-c14f-6ec3-7ef148cb98ca@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <366ed936-5316-84f3-93df-ad3671fff56b@arm.com>
Date: Tue, 20 Aug 2019 18:49:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4be7e616-e36f-c14f-6ec3-7ef148cb98ca@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 8/8] xen/arm: add reserved-memory regions
 to the dom0 memory node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMjAvMDgvMjAxOSAxNjoyOCwgT2xla3NhbmRyIHdyb3RlOgo+IE9u
IDE5LjA4LjE5IDIwOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IFJlc2VydmVkIG1l
bW9yeSByZWdpb25zIGFyZSBhdXRvbWF0aWNhbGx5IHJlbWFwcGVkIHRvIGRvbTAuIFRoZWlyIGRl
dmljZQo+PiB0cmVlIG5vZGVzIGFyZSBhbHNvIGFkZGVkIHRvIGRvbTAgZGV2aWNlIHRyZWUuIEhv
d2V2ZXIsIHRoZSBkb20wIG1lbW9yeQo+PiBub2RlIGlzIG5vdCBjdXJyZW50bHkgZXh0ZW5kZWQg
dG8gY292ZXIgdGhlIHJlc2VydmVkIG1lbW9yeSByZWdpb25zCj4+IHJhbmdlcyBhcyByZXF1aXJl
ZCBieSB0aGUgc3BlYy7CoCBUaGlzIGNvbW1pdCBmaXhlcyBpdC4KPj4KPj4gQ2hhbmdlIG1ha2Vf
bWVtb3J5X25vZGUgdG8gdGFrZSBhwqAgc3RydWN0IG1lbWluZm8gKiBpbnN0ZWFkIG9mIGEKPj4g
a2VybmVsX2luZm8uIENhbGwgaXQgdHdpY2UgZm9yIGRvbTAsIG9uY2UgdG8gY3JlYXRlIHRoZSBm
aXJzdCByZWd1bGFyCj4+IG1lbW9yeSBub2RlLCBhbmQgdGhlIHNlY29uZCB0aW1lIHRvIGNyZWF0
ZSBhIHNlY29uZCBtZW1vcnkgbm9kZSB3aXRoIHRoZQo+PiByYW5nZXMgY292ZXJpbmcgcmVzZXJ2
ZWQtbWVtb3J5IHJlZ2lvbnMuCj4+Cj4+IEFsc28sIG1ha2UgYSBzbWFsbCBjb2RlIHN0eWxlIGZp
eCBpbiBtYWtlX21lbW9yeV9ub2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2NToKPj4gLSBhZGQgYWNr
ZWQtYnkKPj4KPj4gQ2hhbmdlcyBpbiB2NDoKPj4gLSBwYXNzIHN0cnVjdCBtZW1pbmZvICogdG8g
bWFrZV9tZW1vcnlfbm9kZQo+PiAtIGNhbGwgbWFrZV9tZW1vcnlfbm9kZSB0d2ljZSBmb3IgZG9t
MCwgb25jZSBmb3Igbm9ybWFsIG1lbW9yeSwgb25jZSBmb3IKPj4gwqDCoCByZXNlcnZlZC1tZW1v
cnkgcmVnaW9ucwo+PiAtLS0KPj4gwqAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMjIg
KysrKysrKysrKysrKysrLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+PiBpbmRleCBiNDI2MGYx
ZmMyLi4zMDYxODBkOGNiIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+IEBAIC02MzksMTEgKzYz
OSwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBmZHRfcHJvcGVydHlfaW50ZXJydXB0cyh2b2lkICpm
ZHQsIAo+PiBnaWNfaW50ZXJydXB0X3QgKmludHIsCj4+IMKgIHN0YXRpYyBpbnQgX19pbml0IG1h
a2VfbWVtb3J5X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHZvaWQgKmZkdCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBhZGRyY2VsbHMsIGludCBzaXplY2Vs
bHMsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IG1lbWluZm8gKm1lbSkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIGlu
dCByZXMsIGk7Cj4+IMKgwqDCoMKgwqAgaW50IHJlZ19zaXplID0gYWRkcmNlbGxzICsgc2l6ZWNl
bGxzOwo+PiAtwqDCoMKgIGludCBucl9jZWxscyA9IHJlZ19zaXplKmtpbmZvLT5tZW0ubnJfYmFu
a3M7Cj4+ICvCoMKgwqAgaW50IG5yX2NlbGxzID0gcmVnX3NpemUgKiBtZW0tPm5yX2JhbmtzOwo+
PiDCoMKgwqDCoMKgIF9fYmUzMiByZWdbTlJfTUVNX0JBTktTICogNCAvKiBXb3JzdCBjYXNlIGFk
ZHJjZWxscyArIHNpemVjZWxscyAqL107Cj4+IMKgwqDCoMKgwqAgX19iZTMyICpjZWxsczsKPj4g
QEAgLTY2MiwxMCArNjYyLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfbWVtb3J5X25vZGUo
Y29uc3Qgc3RydWN0IGRvbWFpbiAqZCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXM7
Cj4+IMKgwqDCoMKgwqAgY2VsbHMgPSAmcmVnWzBdOwo+PiAtwqDCoMKgIGZvciAoIGkgPSAwIDsg
aSA8IGtpbmZvLT5tZW0ubnJfYmFua3M7IGkrKyApCj4+ICvCoMKgwqAgZm9yICggaSA9IDAgOyBp
IDwgbWVtLT5ucl9iYW5rczsgaSsrICkKPj4gwqDCoMKgwqDCoCB7Cj4+IC3CoMKgwqDCoMKgwqDC
oCB1NjQgc3RhcnQgPSBraW5mby0+bWVtLmJhbmtbaV0uc3RhcnQ7Cj4+IC3CoMKgwqDCoMKgwqDC
oCB1NjQgc2l6ZSA9IGtpbmZvLT5tZW0uYmFua1tpXS5zaXplOwo+PiArwqDCoMKgwqDCoMKgwqAg
dTY0IHN0YXJ0ID0gbWVtLT5iYW5rW2ldLnN0YXJ0Owo+PiArwqDCoMKgwqDCoMKgwqAgdTY0IHNp
emUgPSBtZW0tPmJhbmtbaV0uc2l6ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGR0X2RwcmludGso
IsKgIEJhbmsgJWQ6ICUjIlBSSXg2NCItPiUjIlBSSXg2NCJcbiIsCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaSwgc3RhcnQsIHN0YXJ0ICsgc2l6ZSk7Cj4+IEBA
IC0xNDg2LDEwICsxNDg2LDE4IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCAKPj4ga2VybmVsX2luZm8gKmtpbmZvLAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKCByZXMgKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmVzOwo+PiAtwqDCoMKgwqDCoMKgwqAgcmVzID0gbWFrZV9tZW1vcnlfbm9kZShkLCBraW5mby0+
ZmR0LCBhZGRyY2VsbHMsIHNpemVjZWxscywga2luZm8pOwo+PiArwqDCoMKgwqDCoMKgwqAgcmVz
ID0gbWFrZV9tZW1vcnlfbm9kZShkLCBraW5mby0+ZmR0LCBhZGRyY2VsbHMsIHNpemVjZWxscywg
Cj4+ICZraW5mby0+bWVtKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggcmVzICkKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlczsKPj4gK8KgwqDCoMKgwqDCoMKgIC8q
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICogQ3JlYXRlIGEgc2Vjb25kIG1lbW9yeSBub2RlIHRvIHN0
b3JlIHRoZSByYW5nZXMgY292ZXJpbmcKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiByZXNlcnZlZC1t
ZW1vcnkgcmVnaW9ucy4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKg
IHJlcyA9IG1ha2VfbWVtb3J5X25vZGUoZCwga2luZm8tPmZkdCwgYWRkcmNlbGxzLCBzaXplY2Vs
bHMsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJmJvb3RpbmZvLnJlc2VydmVkX21lbSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoIHJlcyApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXM7Cj4+IMKgwqDC
oMKgwqAgfQo+PiDCoMKgwqDCoMKgIHJlcyA9IGZkdF9lbmRfbm9kZShraW5mby0+ZmR0KTsKPj4g
QEAgLTE3NDUsNyArMTc1Myw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHByZXBhcmVfZHRiX2RvbVUo
c3RydWN0IGRvbWFpbiAqZCwgCj4+IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4+IMKgwqDC
oMKgwqAgaWYgKCByZXQgKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7Cj4+IC3CoMKg
wqAgcmV0ID0gbWFrZV9tZW1vcnlfbm9kZShkLCBraW5mby0+ZmR0LCBhZGRyY2VsbHMsIHNpemVj
ZWxscywga2luZm8pOwo+PiArwqDCoMKgIHJldCA9IG1ha2VfbWVtb3J5X25vZGUoZCwga2luZm8t
PmZkdCwgYWRkcmNlbGxzLCBzaXplY2VsbHMsICZraW5mby0+bWVtKTsKPj4gwqDCoMKgwqDCoCBp
ZiAoIHJldCApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPiAKPiBJIGRvbid0IHJl
YWxseSBrbm93IHdoZXRoZXIgaXQgaXMgYW4gaXNzdWUgd2Ugc2hvdWxkIHdvcnJ5IGFib3V0LCBi
dXQgSSBub3RpY2VkIAo+IHRoYXQgZG9tMCAoTGludXggNC4xNCkgcmVwb3J0ZWQgdGhlIGZvbGxv
d2luZzoKPiAKPiBPRjogRHVwbGljYXRlIG5hbWUgaW4gYmFzZSwgcmVuYW1lZCB0byAibWVtb3J5
IzEiCgpQYXRoIGluIHRoZSBkZXZpY2UtdHJlZSBzaG91bGQgYWx3YXlzIGJlIHVuaXEuIFNvIGl0
IGlzIG5vdCBwb3NzaWJsZSB0byBoYXZlIHR3byAKbm9kZXMgL21lbW9yeSBhcyB3ZSBhcmUgZG9p
bmcgdG9kYXkuIEl0IGxvb2tzIGxpa2UgTGludXggd29ya2Fyb3VuZCBpdCBieSBhZGRpbmcgIzEu
CgpJbiB0aGlzIGNhc2UsIHdlIHNob3VsZCBjcmVhdGUgbmFtZSB3aXRoIHRoZSBmb2xsb3dpbmcg
Zm9ybWF0IAptZW1vcnlAPHVuaXQtYWRkcmVzcz4uIFBlciB0aGUgRGV2aWNlVHJlZSBzcGVjaWZp
Y2F0aW9uLCA8dW5pdC1hZGRyZXNzPiBzaG91bGQgCm1hdGNoIHRoZSBiYXNlIG9mIGFkZHJlc3Mg
b2YgdGhlIGZpcnN0IHJlZ2lvbi4KClRoZXJlIGFyZSBhbiBleGFtcGxlIGluIG1ha2VfY3B1c19u
b2RlKCkgdGhhdCBjYW4gYmUgcmUtdXNlZCBoZXJlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
