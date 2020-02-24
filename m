Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CA16A57A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 12:47:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6CBJ-0002Ug-Pj; Mon, 24 Feb 2020 11:45:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8nZ=4M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j6CBH-0002UX-NA
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 11:45:47 +0000
X-Inumbo-ID: 32039c86-56fb-11ea-8aee-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32039c86-56fb-11ea-8aee-12813bfff9fa;
 Mon, 24 Feb 2020 11:45:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20EFCAE06;
 Mon, 24 Feb 2020 11:45:46 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200218122114.17596-1-jgross@suse.com>
 <20200218122114.17596-5-jgross@suse.com> <20200224113135.GM4679@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9c489acb-63bf-1b86-4893-f90eb4e57ab6@suse.com>
Date: Mon, 24 Feb 2020 12:45:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224113135.GM4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/4] xen/rcu: add assertions to debug
 build
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAgMTI6MzEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MTgsIDIwMjAgYXQgMDE6MjE6MTRQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gWGVu
J3MgUkNVIGltcGxlbWVudGF0aW9uIHJlbGllcyBvbiBubyBzb2Z0aXJxIGhhbmRsaW5nIHRha2lu
ZyBwbGFjZQo+PiB3aGlsZSBiZWluZyBpbiBhIFJDVSBjcml0aWNhbCBzZWN0aW9uLiBBZGQgQVNT
RVJUKClzIGluIGRlYnVnIGJ1aWxkcwo+PiBpbiBvcmRlciB0byBjYXRjaCBhbnkgdmlvbGF0aW9u
cy4KPj4KPj4gRm9yIHRoYXQgcHVycG9zZSBtb2RpZnkgcmN1X3JlYWRfW3VuXWxvY2soKSB0byB1
c2UgYSBkZWRpY2F0ZWQgcGVyY3B1Cj4+IGNvdW50ZXIgaW5zdGVhZCBvZiBwcmVlbXB0X1tlbnxk
aXNdYWJsZSgpIGFzIHRoaXMgZW5hYmxlcyB0byB0ZXN0Cj4+IHRoYXQgY29uZGl0aW9uIGluIF9f
ZG9fc29mdGlycSgpIChBU1NFUlRfTk9UX0lOX0FUT01JQygpIGlzIG5vdAo+PiB1c2FibGUgdGhl
cmUgZHVlIHRvIF9fY3B1X3VwKCkgY2FsbGluZyBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKQo+
PiB3aGlsZSBob2xkaW5nIHRoZSBjcHUgaG90cGx1ZyBsb2NrKS4KPj4KPj4gRHJvcHBpbmcgdGhl
IG5vdyBubyBsb25nZXIgbmVlZGVkICNpbmNsdWRlIG9mIHByZWVtcHQuaCBpbiByY3VwZGF0ZS5o
Cj4+IHJlcXVpcmVzIGFkZGluZyBpdCBpbiBzb21lIHNvdXJjZXMuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gLS0tCj4+ICAgeGVuL2NvbW1v
bi9tdWx0aWNhbGwuYyAgICAgfCAgMSArCj4+ICAgeGVuL2NvbW1vbi9yY3VwZGF0ZS5jICAgICAg
fCAgNCArKysrCj4+ICAgeGVuL2NvbW1vbi9zb2Z0aXJxLmMgICAgICAgfCAgMiArKwo+PiAgIHhl
bi9jb21tb24vd2FpdC5jICAgICAgICAgIHwgIDEgKwo+PiAgIHhlbi9pbmNsdWRlL3hlbi9yY3Vw
ZGF0ZS5oIHwgMjEgKysrKysrKysrKysrKysrKystLS0tCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9tdWx0aWNhbGwuYyBiL3hlbi9jb21tb24vbXVsdGljYWxsLmMKPj4gaW5kZXggNWExOTll
YmY4Zi4uNjdmMWEyMzQ4NSAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9tdWx0aWNhbGwuYwo+
PiArKysgYi94ZW4vY29tbW9uL211bHRpY2FsbC5jCj4+IEBAIC0xMCw2ICsxMCw3IEBACj4+ICAg
I2luY2x1ZGUgPHhlbi9tdWx0aWNhbGwuaD4KPj4gICAjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vz
cy5oPgo+PiAgICNpbmNsdWRlIDx4ZW4vcGVyZmMuaD4KPj4gKyNpbmNsdWRlIDx4ZW4vcHJlZW1w
dC5oPgo+PiAgICNpbmNsdWRlIDx4ZW4vdHJhY2UuaD4KPj4gICAjaW5jbHVkZSA8YXNtL2N1cnJl
bnQuaD4KPj4gICAjaW5jbHVkZSA8YXNtL2hhcmRpcnEuaD4KPj4gZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vcmN1cGRhdGUuYyBiL3hlbi9jb21tb24vcmN1cGRhdGUuYwo+PiBpbmRleCBlNmFkZDBi
MTIwLi5iMDNmNGI0NGQ5IDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9uL3JjdXBkYXRlLmMKPj4g
KysrIGIveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCj4+IEBAIC00Niw2ICs0NiwxMCBAQAo+PiAgICNp
bmNsdWRlIDx4ZW4vY3B1Lmg+Cj4+ICAgI2luY2x1ZGUgPHhlbi9zdG9wX21hY2hpbmUuaD4KPj4g
ICAKPj4gKyNpZm5kZWYgTkRFQlVHCj4+ICtERUZJTkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIHJj
dV9sb2NrX2NudCk7Cj4+ICsjZW5kaWYKPj4gKwo+PiAgIC8qIEdsb2JhbCBjb250cm9sIHZhcmlh
YmxlcyBmb3IgcmN1cGRhdGUgY2FsbGJhY2sgbWVjaGFuaXNtLiAqLwo+PiAgIHN0YXRpYyBzdHJ1
Y3QgcmN1X2N0cmxibGsgewo+PiAgICAgICBsb25nIGN1cjsgICAgICAgICAgIC8qIEN1cnJlbnQg
YmF0Y2ggbnVtYmVyLiAgICAgICAgICAgICAgICAgICAgICAqLwo+PiBkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zb2Z0aXJxLmMgYi94ZW4vY29tbW9uL3NvZnRpcnEuYwo+PiBpbmRleCAzZmU3NWNh
M2U4Li4xOGJlOGRiMGM2IDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9uL3NvZnRpcnEuYwo+PiAr
KysgYi94ZW4vY29tbW9uL3NvZnRpcnEuYwo+PiBAQCAtMzAsNiArMzAsOCBAQCBzdGF0aWMgdm9p
ZCBfX2RvX3NvZnRpcnEodW5zaWduZWQgbG9uZyBpZ25vcmVfbWFzaywgYm9vbCByY3VfYWxsb3dl
ZCkKPj4gICAgICAgdW5zaWduZWQgaW50IGksIGNwdTsKPj4gICAgICAgdW5zaWduZWQgbG9uZyBw
ZW5kaW5nOwo+PiAgIAo+PiArICAgIEFTU0VSVCghcmN1X2FsbG93ZWQgfHwgcmN1X3F1aWVzY2Vf
YWxsb3dlZCgpKTsKPj4gKwo+PiAgICAgICBmb3IgKCA7IDsgKQo+PiAgICAgICB7Cj4+ICAgICAg
ICAgICAvKgo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi93YWl0LmMgYi94ZW4vY29tbW9uL3dh
aXQuYwo+PiBpbmRleCAyNDcxNmU3Njc2Li45Y2RiMTc0MDM2IDEwMDY0NAo+PiAtLS0gYS94ZW4v
Y29tbW9uL3dhaXQuYwo+PiArKysgYi94ZW4vY29tbW9uL3dhaXQuYwo+PiBAQCAtMTksNiArMTks
NyBAQAo+PiAgICAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDov
L3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCj4+ICAgICovCj4+ICAgCj4+ICsjaW5jbHVkZSA8eGVu
L3ByZWVtcHQuaD4KPj4gICAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+Cj4+ICAgI2luY2x1ZGUgPHhl
bi9zb2Z0aXJxLmg+Cj4+ICAgI2luY2x1ZGUgPHhlbi93YWl0Lmg+Cj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaCBiL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oCj4+
IGluZGV4IDg3ZjM1Yjc3MDQuLmE1ZWU3ZmVjMmIgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9yY3VwZGF0ZS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oCj4+IEBA
IC0zNCwxMCArMzQsMjMgQEAKPj4gICAjaW5jbHVkZSA8eGVuL2NhY2hlLmg+Cj4+ICAgI2luY2x1
ZGUgPHhlbi9zcGlubG9jay5oPgo+PiAgICNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPgo+PiAtI2lu
Y2x1ZGUgPHhlbi9wcmVlbXB0Lmg+Cj4+ICsjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgo+PiAgIAo+
PiAgICNkZWZpbmUgX19yY3UKPj4gICAKPj4gKyNpZm5kZWYgTkRFQlVHCj4+ICtERUNMQVJFX1BF
Ul9DUFUodW5zaWduZWQgaW50LCByY3VfbG9ja19jbnQpOwo+PiArCj4+ICsjZGVmaW5lIHJjdV9x
dWllc2NlX2Rpc2FibGUoKSAodGhpc19jcHUocmN1X2xvY2tfY250KSkrKwo+PiArI2RlZmluZSBy
Y3VfcXVpZXNjZV9lbmFibGUoKSAgKHRoaXNfY3B1KHJjdV9sb2NrX2NudCkpLS0KPiAKPiBJIHRo
aW5rIHlvdSBuZWVkIGEgYmFycmllciBoZXJlIGxpa2UgaXQncyBjdXJyZW50bHkgdXNlZCBpbgo+
IHByZWVtcHRfe2VuYWJsZWQvZGlzYWJsZX0sIG9yIHVzZSBhcmNoX2xvY2tfe2FjcXVpcmUvcmVs
ZWFzZX1fYmFycmllcgo+IHdoaWNoIHdvdWxkIGJlIGJldHRlciBJTU8uCgpUaGFua3MsIHdpbGwg
ZG8gdGhhdC4KCj4gCj4+ICsjZGVmaW5lIHJjdV9xdWllc2NlX2FsbG93ZWQoKSAoIXRoaXNfY3B1
KHJjdV9sb2NrX2NudCkpCj4gCj4gQVNTRVJUX05PVF9JTl9BVE9NSUMgc2hvdWxkIGJlIGV4cGFu
ZGVkIHRvIGFsc28gYXNzZXJ0Cj4gIXRoaXNfY3B1KHJjdV9sb2NrX2NudCksIG9yIGVsc2UgbWlz
c2luZyBwYWlycyBvZgo+IHJjdV9yZWFkX3tsb2NrL3VubG9ja30gd291bGQgYmUgdW5kZXRlY3Rl
ZC4KCkdvb2QgaWRlYS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
