Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4050CD2CDB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 16:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIZio-0003Dj-DP; Thu, 10 Oct 2019 14:47:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5Al=YD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iIZim-0003Dc-SD
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 14:47:16 +0000
X-Inumbo-ID: d9b0a92e-eb6c-11e9-931d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9b0a92e-eb6c-11e9-931d-12813bfff9fa;
 Thu, 10 Oct 2019 14:47:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9ED90AEC4;
 Thu, 10 Oct 2019 14:47:14 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190813213237.4819-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910021508370.2691@sstabellini-ThinkPad-T480s>
 <e746361f-c797-ed59-c6f5-197b0eca95d0@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a7dfe78a-198a-dcd6-37c4-29d67dd6108a@suse.com>
Date: Thu, 10 Oct 2019 16:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <e746361f-c797-ed59-c6f5-197b0eca95d0@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/docs: arm: Update dom0less binding and
 example
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, viktor_mitin@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTAuMTkgMTY6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBKdWVyZ2Vu
LCB3b3VsZCB5b3UgYmUgaGFwcHkgaWYgdGhpcyBwYXRjaCBpcyBjb21taXR0ZWQgZm9yIFhlbiA0
LjEzPwoKWWVzLCB5b3UgY2FuIGFkZCBteToKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgo+IAo+IENoZWVycywKPiAKPiBPbiAwMi8x
MC8yMDE5IDIzOjI3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IE9uIFR1ZSwgMTMgQXVn
IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IFRoZSBiaW5kaW5nIGZvciB0aGUgZG9tMGxl
c3MgbW9kdWxlIGRvZXMgbm90IG1hdGNoIFhlbiBpbXBsZW1lbnRhdGlvbi4KPj4+IEFueSBtb2R1
bGUgc2hvdWxkIGNvbnRhaW4gdGhlIGNvbXBhdGlibGUgIm11bHRpYm9vdCxtb2R1bGUiIHRvIGJl
Cj4+PiByZWNvZ25pemVkLgo+Pj4KPj4+IFRoaXMgd2FzIGNsZWFybHkgYW4gb3ZlcnNpZ2h0IGFz
IG90aGVyIGV4YW1wbGVzIHdpdGggWGVuIGNvZGUgYmFzZQo+Pj4gcHJvdmlkZSB0aGUgY29tcGF0
aWJsZSAibXVsdGlib290LG1vZHVsZSIuCj4+Pgo+Pj4gU28gZml4IHRoZSBiaW5kaW5nIGFuZCB0
aGUgZXhhbXBsZSBhc3NvY2lhdGVkIHRvIGl0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IFllcyEKPj4KPj4gUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4KPj4+IC0t
LQo+Pj4KPj4+IENjOiB2aWt0b3JfbWl0aW5AZXBhbS5jb20KPj4+Cj4+PiDCoMKgwqDCoCBXZSBw
cm9iYWJseSB3YW50IHRvIGNvbnNvbGlkYXRlIGFsbCB0aGUgZG9tMGxlc3MgZG9jdW1lbnRhdGlv
biBpbgo+Pj4gwqDCoMKgwqAgb25lIHBsYWNlIHJhdGhlciB0aGFuIGhhdmluZyB0byBmaXggZG9j
dW1hdGlvbiBpc3N1ZXMgaW4gYSBtdWx0aXBsZQo+Pj4gwqDCoMKgwqAgcGxhY2VzIG9uZSBieSBv
bmUuCj4+PiAtLS0KPj4+IMKgIGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQg
fCAxMiArKysrKystLS0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZGV2aWNl
LXRyZWUvYm9vdGluZy50eHQgCj4+PiBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGlu
Zy50eHQKPj4+IGluZGV4IDMxN2E5ZTk2MmEuLjBmYWZhMDFiNWQgMTAwNjQ0Cj4+PiAtLS0gYS9k
b2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0Cj4+PiArKysgYi9kb2NzL21pc2Mv
YXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0Cj4+PiBAQCAtMTYwLDcgKzE2MCw3IEBAIFRoZSBr
ZXJuZWwgc3ViLW5vZGUgaGFzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKPj4+IMKgIC0gY29t
cGF0aWJsZQo+Pj4gLcKgwqDCoCAibXVsdGlib290LGtlcm5lbCIKPj4+ICvCoMKgwqAgIm11bHRp
Ym9vdCxrZXJuZWwiLCAibXVsdGlib290LG1vZHVsZSIKPj4+IMKgIC0gcmVnCj4+PiBAQCAtMTc1
LDcgKzE3NSw3IEBAIFRoZSByYW1kaXNrIHN1Yi1ub2RlIGhhcyB0aGUgZm9sbG93aW5nIHByb3Bl
cnRpZXM6Cj4+PiDCoCAtIGNvbXBhdGlibGUKPj4+IC3CoMKgwqAgIm11bHRpYm9vdCxyYW1kaXNr
Igo+Pj4gK8KgwqDCoCAibXVsdGlib290LHJhbWRpc2siLCAibXVsdGlib290LG1vZHVsZSIKPj4+
IMKgIC0gcmVnCj4+PiBAQCAtMTk2LDEzICsxOTYsMTMgQEAgY2hvc2VuIHsKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCB2cGwwMTE7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbW9kdWxlQDB4NGEwMDAw
MDAgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qs
a2VybmVsIjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibXVsdGli
b290LGtlcm5lbCIsICJtdWx0aWJvb3QsbW9kdWxlIjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlZyA9IDwweDAgMHg0YTAwMDAwMCAweGZmZmZmZj47Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBib290YXJncyA9ICJjb25zb2xlPXR0eUFNQTAgaW5pdD0vYmluL3NoIjsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG1vZHVsZUAw
eDRiMDAwMDAwIHsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibXVs
dGlib290LHJhbWRpc2siOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0aWJvb3QsbW9kdWxlIjsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg0YjAwMDAwMCAweGZmZmZmZj47Cj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgfTsKPj4+IMKgwqDCoMKgwqAgfTsKPj4+IEBAIC0yMTUsMTMgKzIxNSwx
MyBAQCBjaG9zZW4gewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNwdXMgPSA8MT47Cj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgbW9kdWxlQDB4NGMwMDAwMDAgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIjsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibXVsdGlib290LGtlcm5lbCIsICJtdWx0aWJvb3QsbW9k
dWxlIjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg0YzAwMDAw
MCAweGZmZmZmZj47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290YXJncyA9ICJj
b25zb2xlPXR0eUFNQTAgaW5pdD0vYmluL3NoIjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG1vZHVsZUAweDRkMDAwMDAwIHsKPj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibXVsdGlib290LHJhbWRpc2siOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0
aWJvb3QsbW9kdWxlIjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAg
MHg0ZDAwMDAwMCAweGZmZmZmZj47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+IMKgwqDC
oMKgwqAgfTsKPj4+IC0tIAo+Pj4gMi4xMS4wCj4+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
