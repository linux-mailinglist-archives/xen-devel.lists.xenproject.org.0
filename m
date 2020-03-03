Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98B177251
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 10:24:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j93kE-00047u-UW; Tue, 03 Mar 2020 09:21:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j93kC-00047p-Sg
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 09:21:40 +0000
X-Inumbo-ID: 61ba461a-5d30-11ea-a0bb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61ba461a-5d30-11ea-a0bb-12813bfff9fa;
 Tue, 03 Mar 2020 09:21:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7B11B090;
 Tue,  3 Mar 2020 09:21:35 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>
References: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bec9dda1-c5bb-9495-67e8-a76dec641706@suse.com>
Date: Tue, 3 Mar 2020 10:21:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: switch to new APIs in
 arch_init_memory
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxMToyNywgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGUgZnVuY3Rpb24gd2lsbCBtYXAgYW5kIHVubWFw
IHBhZ2VzIG9uIGRlbWFuZC4KPiAKPiBTaW5jZSB3ZSBub3cgbWFwIGFuZCB1bm1hcCBYZW4gUFRF
IHBhZ2VzLCB3ZSB3b3VsZCBsaWtlIHRvIHRyYWNrIHRoZQo+IGxpZmV0aW1lIG9mIG1hcHBpbmdz
IHNvIHRoYXQgMSkgd2UgZG8gbm90IGRlcmVmZXJlbmNlIG1lbW9yeSB0aHJvdWdoIGEKPiB2YXJp
YWJsZSBhZnRlciBpdCBpcyB1bm1hcHBlZCwgMikgd2UgZG8gbm90IHVubWFwIG1vcmUgdGhhbiBv
bmNlLgo+IFRoZXJlZm9yZSwgd2UgaW50cm9kdWNlIHRoZSBVTk1BUF9ET01BSU5fUEFHRSBtYWNy
byB0byBudWxsaWZ5IHRoZQo+IHZhcmlhYmxlIGFmdGVyIHVubWFwcGluZywgYW5kIGlnbm9yZSBO
VUxMLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+Cj4gCj4gLS0t
Cj4gQ2hhbmdlZCBpbiB2MjoKPiAtIGxldCBVTk1BUF9ET01BSU5fUEFHRSBpdHNlbGYgY2hlY2sg
d2hldGhlciB0aGUgaW5wdXQgaXMgTlVMTCB0byBhdm9pZAo+ICAgYWRkaW5nIHRoZSBjaGVjayBp
biB1bm1hcF9kb21haW5fcGFnZS4KPiAtIHJld29yZCB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gLS0t
Cj4gIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgICAgIHwgMTQgKysrKysrKystLS0tLS0KPiAg
eGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmggfCAgNyArKysrKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwo+IGluZGV4IDcwYjg3YzQ4MzAu
LjlmY2RjZGU1YjcgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94ZW4v
YXJjaC94ODYvbW0uYwo+IEBAIC0zNTYsMTkgKzM1NiwyMSBAQCB2b2lkIF9faW5pdCBhcmNoX2lu
aXRfbWVtb3J5KHZvaWQpCj4gICAgICAgICAgICAgIEFTU0VSVChyb290X3BndF9wdl94ZW5fc2xv
dHMgPCBST09UX1BBR0VUQUJMRV9QVl9YRU5fU0xPVFMpOwo+ICAgICAgICAgICAgICBpZiAoIGw0
X3RhYmxlX29mZnNldChzcGxpdF92YSkgPT0gbDRfdGFibGVfb2Zmc2V0KHNwbGl0X3ZhIC0gMSkg
KQo+ICAgICAgICAgICAgICB7Cj4gLSAgICAgICAgICAgICAgICBsM19wZ2VudHJ5X3QgKmwzdGFi
ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwo+ICsgICAgICAgICAgICAgICAgbWZuX3QgbDNtZm4g
PSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOwo+ICAKPiAtICAgICAgICAgICAgICAgIGlmICgg
bDN0YWIgKQo+ICsgICAgICAgICAgICAgICAgaWYgKCAhbWZuX2VxKGwzbWZuLCBJTlZBTElEX01G
TikgKQo+ICAgICAgICAgICAgICAgICAgewo+IC0gICAgICAgICAgICAgICAgICAgIGNvbnN0IGwz
X3BnZW50cnlfdCAqbDNpZGxlID0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgbDRlX3RvX2wz
ZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChzcGxpdF92YSldKTsKPiArICAgICAgICAg
ICAgICAgICAgICBsM19wZ2VudHJ5X3QgKmwzaWRsZSA9IG1hcF9sM3RfZnJvbV9sNGUoCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChz
cGxpdF92YSldKTsKClNvbWVob3cgeW91J3ZlIGxvc3QgdGhlIGNvbnN0LiBJIHRoaW5rIGJvdGgg
dGhpcyBhbmQgLi4uCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oCj4gKysr
IGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmgKPiBAQCAtNzIsNCArNzIsMTEgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbChjb25zdCB2b2lkICp2YSkg
e307Cj4gIAo+ICAjZW5kaWYgLyogIUNPTkZJR19ET01BSU5fUEFHRSAqLwo+ICAKPiArI2RlZmlu
ZSBVTk1BUF9ET01BSU5fUEFHRShwKSBkbyB7ICAgXAo+ICsgICAgaWYgKCBwICkgeyAgICAgICAg
ICAgICAgICAgICAgICBcCgouLi4gdGhlIGJyYWNlIHBsYWNlbWVudCBoZXJlIGNhbiBiZSBkZWFs
dCB3aXRoIHdoaWxlIGNvbW1pdHRpbmcuCldpdGggYm90aCBvZiB0aGVtIGluIHBsYWNlClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
