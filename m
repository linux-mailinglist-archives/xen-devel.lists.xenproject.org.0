Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0710171642
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 12:48:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Hb8-0003BP-Ax; Thu, 27 Feb 2020 11:44:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZQL=4P=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j7Hb6-0003BK-RP
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 11:44:56 +0000
X-Inumbo-ID: 8f1ecaf0-5956-11ea-964f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f1ecaf0-5956-11ea-964f-12813bfff9fa;
 Thu, 27 Feb 2020 11:44:49 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j7Hax-0008TD-OF; Thu, 27 Feb 2020 11:44:47 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j7Hax-0008Ig-E5; Thu, 27 Feb 2020 11:44:47 +0000
Date: Thu, 27 Feb 2020 11:44:44 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyxia@amazon.com>
Message-ID: <20200227114444.i6bqbodnpgw562e4@debian>
References: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
User-Agent: NeoMutt/20180716
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMTA6Mjc6MzlBTSArMDAwMCwgSG9uZ3lhbiBYaWEgd3Jv
dGU6Cj4gRnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGUgZnVuY3Rp
b24gd2lsbCBtYXAgYW5kIHVubWFwIHBhZ2VzIG9uIGRlbWFuZC4KPiAKPiBTaW5jZSB3ZSBub3cg
bWFwIGFuZCB1bm1hcCBYZW4gUFRFIHBhZ2VzLCB3ZSB3b3VsZCBsaWtlIHRvIHRyYWNrIHRoZQo+
IGxpZmV0aW1lIG9mIG1hcHBpbmdzIHNvIHRoYXQgMSkgd2UgZG8gbm90IGRlcmVmZXJlbmNlIG1l
bW9yeSB0aHJvdWdoIGEKPiB2YXJpYWJsZSBhZnRlciBpdCBpcyB1bm1hcHBlZCwgMikgd2UgZG8g
bm90IHVubWFwIG1vcmUgdGhhbiBvbmNlLgo+IFRoZXJlZm9yZSwgd2UgaW50cm9kdWNlIHRoZSBV
Tk1BUF9ET01BSU5fUEFHRSBtYWNybyB0byBudWxsaWZ5IHRoZQo+IHZhcmlhYmxlIGFmdGVyIHVu
bWFwcGluZywgYW5kIGlnbm9yZSBOVUxMLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlh
QGFtYXpvbi5jb20+Cj4gCj4gLS0tCj4gQ2hhbmdlZCBpbiB2MjoKPiAtIGxldCBVTk1BUF9ET01B
SU5fUEFHRSBpdHNlbGYgY2hlY2sgd2hldGhlciB0aGUgaW5wdXQgaXMgTlVMTCB0byBhdm9pZAo+
ICAgYWRkaW5nIHRoZSBjaGVjayBpbiB1bm1hcF9kb21haW5fcGFnZS4KPiAtIHJld29yZCB0aGUg
Y29tbWl0IG1lc3NhZ2UuCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgICAgIHwg
MTQgKysrKysrKystLS0tLS0KPiAgeGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmggfCAgNyAr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0u
Ywo+IGluZGV4IDcwYjg3YzQ4MzAuLjlmY2RjZGU1YjcgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+IEBAIC0zNTYsMTkgKzM1NiwyMSBA
QCB2b2lkIF9faW5pdCBhcmNoX2luaXRfbWVtb3J5KHZvaWQpCj4gICAgICAgICAgICAgIEFTU0VS
VChyb290X3BndF9wdl94ZW5fc2xvdHMgPCBST09UX1BBR0VUQUJMRV9QVl9YRU5fU0xPVFMpOwo+
ICAgICAgICAgICAgICBpZiAoIGw0X3RhYmxlX29mZnNldChzcGxpdF92YSkgPT0gbDRfdGFibGVf
b2Zmc2V0KHNwbGl0X3ZhIC0gMSkgKQo+ICAgICAgICAgICAgICB7Cj4gLSAgICAgICAgICAgICAg
ICBsM19wZ2VudHJ5X3QgKmwzdGFiID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwo+ICsgICAgICAg
ICAgICAgICAgbWZuX3QgbDNtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOwo+ICAKPiAt
ICAgICAgICAgICAgICAgIGlmICggbDN0YWIgKQo+ICsgICAgICAgICAgICAgICAgaWYgKCAhbWZu
X2VxKGwzbWZuLCBJTlZBTElEX01GTikgKQo+ICAgICAgICAgICAgICAgICAgewo+IC0gICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGwzX3BnZW50cnlfdCAqbDNpZGxlID0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgbDRlX3RvX2wzZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChzcGxp
dF92YSldKTsKPiArICAgICAgICAgICAgICAgICAgICBsM19wZ2VudHJ5X3QgKmwzaWRsZSA9IG1h
cF9sM3RfZnJvbV9sNGUoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZGxlX3BnX3Rh
YmxlW2w0X3RhYmxlX29mZnNldChzcGxpdF92YSldKTsKPiArICAgICAgICAgICAgICAgICAgICBs
M19wZ2VudHJ5X3QgKmwzdGFiID0gbWFwX2RvbWFpbl9wYWdlKGwzbWZuKTsKPiAgCj4gICAgICAg
ICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBsM190YWJsZV9vZmZzZXQoc3BsaXRfdmEp
OyArK2kgKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBsM3RhYltpXSA9IGwzaWRsZVtpXTsK
PiAgICAgICAgICAgICAgICAgICAgICBmb3IgKCA7IGkgPCBMM19QQUdFVEFCTEVfRU5UUklFUzsg
KytpICkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgbDN0YWJbaV0gPSBsM2VfZW1wdHkoKTsK
PiAtICAgICAgICAgICAgICAgICAgICBzcGxpdF9sNGUgPSBsNGVfZnJvbV9tZm4odmlydF90b19t
Zm4obDN0YWIpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX1BBR0VfSFlQRVJWSVNPUl9SVyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgc3BsaXRfbDRl
ID0gbDRlX2Zyb21fbWZuKGwzbWZuLCBfX1BBR0VfSFlQRVJWSVNPUl9SVyk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgVU5NQVBfRE9NQUlOX1BBR0UobDNpZGxlKTsKPiArICAgICAgICAgICAgICAg
ICAgICBVTk1BUF9ET01BSU5fUEFHRShsM3RhYik7Cj4gICAgICAgICAgICAgICAgICB9Cj4gICAg
ICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgICAgICAgKytyb290X3BndF9wdl94
ZW5fc2xvdHM7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oIGIv
eGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmgKPiBpbmRleCAzMjY2OWEzMzM5Li5iZmMzYmY2
YWViIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oCj4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmgKPiBAQCAtNzIsNCArNzIsMTEgQEAgc3RhdGlj
IGlubGluZSB2b2lkIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbChjb25zdCB2b2lkICp2YSkge307
Cj4gIAo+ICAjZW5kaWYgLyogIUNPTkZJR19ET01BSU5fUEFHRSAqLwo+ICAKPiArI2RlZmluZSBV
Tk1BUF9ET01BSU5fUEFHRShwKSBkbyB7ICAgXAo+ICsgICAgaWYgKCBwICkgeyAgICAgICAgICAg
ICAgICAgICAgICBcCgpDb2Rpbmcgc3R5bGUgbWFuZGF0ZXMgeyBzaG91bGQgYmUgcGxhY2VkIGlu
IHRoZSBuZXh0IGxpbmUuCgpPdGhlciB0aGFuIHRoaXMsIHRoZSBjb2RlIGxvb2tzIGNvcnJlY3Qg
dG8gbWUuCgpXZWkuCgo+ICsgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKHApOyAgICAgICBcCj4g
KyAgICAgICAgKHApID0gTlVMTDsgICAgICAgICAgICAgICAgIFwKPiArICAgIH0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ICt9IHdoaWxlICggZmFsc2UgKQo+ICsKPiAgI2VuZGlm
IC8qIF9fWEVOX0RPTUFJTl9QQUdFX0hfXyAqLwo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
