Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BAD981D5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 19:55:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0UmP-0002fD-FQ; Wed, 21 Aug 2019 17:52:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7y8g=WR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0UmN-0002f5-Ac
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 17:52:15 +0000
X-Inumbo-ID: 68271cae-c43c-11e9-adc9-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 68271cae-c43c-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 17:52:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54841344;
 Wed, 21 Aug 2019 10:52:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46CB43F718;
 Wed, 21 Aug 2019 10:52:11 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190819142651.11058-1-julien.grall@arm.com>
 <20190819142651.11058-2-julien.grall@arm.com>
 <f12512cce9d34cf7ab7cd3f94d756c74@AMSPEX02CL03.citrite.net>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a63f0872-6173-3c7d-546c-67a1d7a21737@arm.com>
Date: Wed, 21 Aug 2019 18:52:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f12512cce9d34cf7ab7cd3f94d756c74@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldywKCk9uIDIwLzA4LzIwMTkgMDk6MTUs
IFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJv
bTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gU2VudDogMTkgQXVndXN0
IDIwMTkgMTU6MjcKPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFZvbG9keW15cgo+PiBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5j
b20+OyBHZW9yZ2UgRHVubGFwCj4+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT47Cj4+IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47Cj4+IFJv
Z2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPjsgU3VyYXZlZQo+PiBTdXRoaWt1bHBhbml0IDxzdXJh
dmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT47IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQu
Y29tPjsgUGF1bCBEdXJyYW50Cj4+IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEp1biBOYWth
amltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMS8yXSB4ZW46IFN3aXRjaCBwYXJhbWV0ZXIg
aW4gZ2V0X3BhZ2VfZnJvbV9nZm4gdG8gdXNlIHR5cGVzYWZlIGdmbgo+Pgo+PiBObyBmdW5jdGlv
bmFsIGNoYW5nZSBpbnRlbmRlZC4KPj4KPj4gT25seSByZWFzb25hYmxlIGNsZWFuLXVwcyBhcmUg
ZG9uZSBpbiB0aGlzIHBhdGNoLiBUaGUgcmVzdCB3aWxsIHVzZSBfZ2ZuCj4+IGZvciB0aGUgdGlt
ZSBiZWluZy4KPj4KPj4gVGhlIGNvZGUgaW4gZ2V0X3BhZ2VfZnJvbV9nZm4gaXMgc2xpZ2h0bHkg
cmV3b3JrZWQgdG8gYWxzbyBoYW5kbGUgYSBiYWQKPj4gYmVoYXZpb3IgYmVjYXVzZSBpdCBpcyBu
b3Qgc2FmZSB0byB1c2UgbWZuX3RvX3BhZ2UoLi4uKSBiZWNhdXNlCj4+IG1mbl92YWxpZCguLi4p
IHN1Y2NlZWRzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgo+IAo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgo+IAo+IC4uLiB3aXRoIGEgZmV3IHN1Z2dlc3Rpb25zIGJlbG93IC4uLgo+IAo+
IFtzbmlwXQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKPj4gaW5kZXggMDI5ZWVhM2I4NS4uMjM2YmQ2ZWQzOCAxMDA2NDQKPj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2
bS5jCj4+IEBAIC0yMTY4LDcgKzIxNjgsNyBAQCBpbnQgaHZtX3NldF9jcjAodW5zaWduZWQgbG9u
ZyB2YWx1ZSwgYm9vbCBtYXlfZGVmZXIpCj4+ICAgewo+PiAgICAgICBzdHJ1Y3QgdmNwdSAqdiA9
IGN1cnJlbnQ7Cj4+ICAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47Cj4+IC0gICAg
dW5zaWduZWQgbG9uZyBnZm4sIG9sZF92YWx1ZSA9IHYtPmFyY2guaHZtLmd1ZXN0X2NyWzBdOwo+
PiArICAgIHVuc2lnbmVkIGxvbmcgb2xkX3ZhbHVlID0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbMF07
Cj4+ICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7Cj4+Cj4+ICAgICAgIEhWTV9EQkdfTE9H
KERCR19MRVZFTF9WTU1VLCAiVXBkYXRlIENSMCB2YWx1ZSA9ICVseCIsIHZhbHVlKTsKPj4gQEAg
LTIyMjMsNyArMjIyMyw4IEBAIGludCBodm1fc2V0X2NyMCh1bnNpZ25lZCBsb25nIHZhbHVlLCBi
b29sIG1heV9kZWZlcikKPj4gICAgICAgICAgIGlmICggIXBhZ2luZ19tb2RlX2hhcChkKSApCj4+
ICAgICAgICAgICB7Cj4+ICAgICAgICAgICAgICAgLyogVGhlIGd1ZXN0IENSMyBtdXN0IGJlIHBv
aW50aW5nIHRvIHRoZSBndWVzdCBwaHlzaWNhbC4gKi8KPj4gLSAgICAgICAgICAgIGdmbiA9IHYt
PmFyY2guaHZtLmd1ZXN0X2NyWzNdID4+IFBBR0VfU0hJRlQ7Cj4+ICsgICAgICAgICAgICBnZm5f
dCBnZm4gPSBnYWRkcl90b19nZm4odi0+YXJjaC5odm0uZ3Vlc3RfY3JbM10pOwo+PiArCj4+ICAg
ICAgICAgICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGQsIGdmbiwgTlVMTCwgUDJNX0FM
TE9DKTsKPj4gICAgICAgICAgICAgICBpZiAoICFwYWdlICkKPj4gICAgICAgICAgICAgICB7Cj4+
IEBAIC0yMzE1LDcgKzIzMTYsNyBAQCBpbnQgaHZtX3NldF9jcjModW5zaWduZWQgbG9uZyB2YWx1
ZSwgYm9vbCBtYXlfZGVmZXIpCj4+ICAgICAgIHsKPj4gICAgICAgICAgIC8qIFNoYWRvdy1tb2Rl
IENSMyBjaGFuZ2UuIENoZWNrIFBEQlIgYW5kIHVwZGF0ZSByZWZjb3VudHMuICovCj4+ICAgICAg
ICAgICBIVk1fREJHX0xPRyhEQkdfTEVWRUxfVk1NVSwgIkNSMyB2YWx1ZSA9ICVseCIsIHZhbHVl
KTsKPj4gLSAgICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKHYtPmRvbWFpbiwgdmFsdWUg
Pj4gUEFHRV9TSElGVCwKPj4gKyAgICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKHYtPmRv
bWFpbiwgZ2FkZHJfdG9fZ2ZuKHZhbHVlKSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBOVUxMLCBQMk1fQUxMT0MpOwo+IAo+IEkgdGhpbmsgeW91IGNhbiByZWR1Y2UgdGhl
IHNjb3BlIG9mICdwYWdlJyBhYm92ZSBpbiB0aGUgc2FtZSB3YXkgeW91IGRpZCB3aXRoICdnZm4n
IGFib3ZlCgpGb3IgdGhpcyBvbmUgYW5kIC4uLgoKPiAKPj4gICAgICAgICAgIGlmICggIXBhZ2Ug
KQo+PiAgICAgICAgICAgICAgIGdvdG8gYmFkX2NyMzsKPiAKPiBbc25pcF0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14
LmMKPj4gaW5kZXggMDA2MDMxMGQ3NC4uMzhiZGVmMDg2MiAxMDA2NDQKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS92bXgvdm14LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMK
Pj4gQEAgLTY3NCw3ICs2NzQsNyBAQCBzdGF0aWMgaW50IHZteF9yZXN0b3JlX2NyMF9jcjMoCj4+
ICAgICAgIHsKPj4gICAgICAgICAgIGlmICggY3IwICYgWDg2X0NSMF9QRyApCj4+ICAgICAgICAg
ICB7Cj4+IC0gICAgICAgICAgICBwYWdlID0gZ2V0X3BhZ2VfZnJvbV9nZm4odi0+ZG9tYWluLCBj
cjMgPj4gUEFHRV9TSElGVCwKPj4gKyAgICAgICAgICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dm
bih2LT5kb21haW4sIGdhZGRyX3RvX2dmbihjcjMpLAo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBOVUxMLCBQMk1fQUxMT0MpOwo+IAo+IEhlcmUgYWxzbyB5b3UgY2Fu
IHJlZHVjZSB0aGUgc2NvcGUgb2YgJ3BhZ2UnIChhbHRob3VnaCBvbmx5IGludG8gdGhlIHNjb3Bl
IGp1c3Qgb3V0c2lkZSB0aGUgJ2lmJykKCi4uLiB0aGlzIG9uZSwgd2UgZG9uJ3QgY2hhbmdlIHRo
ZSB0eXBlIG9mIHRoZSB2YXJpYWJsZSBzbyBJIGRvbid0IGZlZWwgc3VjaCAKY2xlYW4tdXBzIGJl
bG9uZyB0byB0aGlzIHBhdGNoLgoKPiAKPj4gICAgICAgICAgICAgICBpZiAoICFwYWdlICkKPj4g
ICAgICAgICAgICAgICB7Cj4gCj4gW3NuaXBdCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
bW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4+IGluZGV4IDc1MzE0MDY1NDMuLmY4ZTJiNmY5MjEg
MTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS5jCj4+IEBAIC0yMDgzLDcgKzIwODMsNyBAQCBzdGF0aWMgaW50IG1vZF9sMV9lbnRyeShsMV9w
Z2VudHJ5X3QgKnBsMWUsIGwxX3BnZW50cnlfdCBubDFlLAo+PiAgICAgICAgICAgICAgIHAybV9x
dWVyeV90IHEgPSBsMWVfZ2V0X2ZsYWdzKG5sMWUpICYgX1BBR0VfUlcgPwo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSA6IFAyTV9BTExPQzsK
Pj4KPj4gLSAgICAgICAgICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dmbihwZ19kb20sIGwxZV9n
ZXRfcGZuKG5sMWUpLCAmcDJtdCwgcSk7Cj4+ICsgICAgICAgICAgICBwYWdlID0gZ2V0X3BhZ2Vf
ZnJvbV9nZm4ocGdfZG9tLCBfZ2ZuKGwxZV9nZXRfcGZuKG5sMWUpKSwgJnAybXQsIHEpOwo+Pgo+
IAo+ICdsMWVfZ2V0X3BmbihubDFlKScgaXMgcmVwZWF0ZWQgMyB0aW1lcyB3aXRoaW4gdGhpcyBz
Y29wZSBBRkFJQ1Qgc28gcHJvYmFibHkgd29ydGggYSBsb2NhbCB2YXJpYWJsZSB3aGlsZSB5b3Un
cmUgaW4gdGhlIG5laWdoYm91cmhvb2QsIHRvIHJlZHVjZSB2ZXJib3NpdHkuCgpJIGNhbiBvbmx5
IGZpbmQgMiB1c2Ugb2YgbDFlX2dldF9wZm4gd2l0aGluIG1vZF9sMV9lbnRyeS4gQnV0IHRoZW4s
IHRoaXMgc29ydCBvZiAKY2xlYW4tdXAgc2hvdWxkIGJlIGluIHRoZXJlIG93biBwYXRjaC4KCkJ1
dCBJIHdpbGwgbGVhdmUgdGhhdCB0byB0aGUgeDg2IGZvbGtzIGFzIEkgZG9uJ3Qgd2FudCB0byBi
ZSByb3BlZCBpbiBlbmRsZXNzIApjbGVhbi11cC4gSSBrbm93IHRoZXJlIHdpbGwgYmUgbW9yZSA7
KS4KCj4gCj4+ICAgICAgICAgICAgICAgaWYgKCBwMm1faXNfcGFnZWQocDJtdCkgKQo+PiAgICAg
ICAgICAgICAgIHsKPiAKPiBbc25pcF0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9waHlz
ZGV2LmMgYi94ZW4vYXJjaC94ODYvcGh5c2Rldi5jCj4+IGluZGV4IDNhM2MxNTg5MGIuLjRmM2Y0
Mzg2MTQgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMKPj4gKysrIGIveGVu
L2FyY2gveDg2L3BoeXNkZXYuYwo+PiBAQCAtMjI5LDcgKzIyOSw4IEBAIHJldF90IGRvX3BoeXNk
ZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCj4+ICAgICAg
ICAgICAgICAgYnJlYWs7Cj4+Cj4+ICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+PiAtICAgICAg
ICBwYWdlID0gZ2V0X3BhZ2VfZnJvbV9nZm4oY3VycmVudC0+ZG9tYWluLCBpbmZvLmdtZm4sIE5V
TEwsIFAyTV9BTExPQyk7Cj4+ICsgICAgICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dmbihjdXJy
ZW50LT5kb21haW4sIF9nZm4oaW5mby5nbWZuKSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5VTEwsIFAyTV9BTExPQyk7Cj4gCj4gJ2N1cnJkJyBoYXMgYWN0dWFsbHkgYmVl
biBkZWZpbmVkIGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uIHNvIGlmIHlvdSBsb3NlIHRoZSAn
Y3VycmVudC0+ZG9tYWluJyB5b3UgY2FuIHJlLWZsb3cgdGhpcyBiYWNrIG9udG8gb25lIGxpbmUg
SSB0aGluay4KClNvdW5kcyByZWFzb25hYmxlLCBidXQgdGhlcmUgYXJlIDMgbW9yZSBjaGFyYWN0
ZXJzIHRoYW4gdGhlIG5vcm1hbCwgc28gaXQgd2lsbCAKc3RpbGwgaGF2ZSB0byBsaXZlIG9uIDIg
bGluZXMgOiguCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
