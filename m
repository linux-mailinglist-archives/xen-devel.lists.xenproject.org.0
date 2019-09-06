Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC912AB459
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 10:48:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i69rz-0001il-Hf; Fri, 06 Sep 2019 08:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i69ry-0001ig-Kz
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 08:45:26 +0000
X-Inumbo-ID: ab672f66-d082-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab672f66-d082-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 08:45:25 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 123DD20842;
 Fri,  6 Sep 2019 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567759524;
 bh=AAE6gQwrlz04d9iJfV1epm//tdvLevDGznfUaNeLQvU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sG5ozf2AVIh9mIR5y3TR1TzYNG8U4+5dDppI/VOIVYTpVGKQ+W4dLMb9efVk/pbMJ
 O0d7MDtEzkcHMINTSO8JKA2zRW06spJGhRSgsat5WZyYvbs3z4gxe5yyC6lWwZc+hT
 vKaBfTlFbNcMkpW/sNKnc7Zg9zhLOLMYz66uGf7w=
Date: Fri, 6 Sep 2019 17:45:19 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-Id: <20190906174519.699b83f08d81b55203212fa1@kernel.org>
In-Reply-To: <20190906073436.GS2349@hirez.programming.kicks-ass.net>
References: <156773433821.31441.2905951246664148487.stgit@devnote2>
 <156773434815.31441.12739136439382289412.stgit@devnote2>
 <20190906073436.GS2349@hirez.programming.kicks-ass.net>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [Xen-devel] [PATCH -tip v3 1/2] x86: xen: insn: Decode Xen and
 KVM emulate-prefix signature
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA2IFNlcCAyMDE5IDA5OjM0OjM2ICswMjAwClBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cgo+IE9uIEZyaSwgU2VwIDA2LCAyMDE5IGF0IDEwOjQ1OjQ4
QU0gKzA5MDAsIE1hc2FtaSBIaXJhbWF0c3Ugd3JvdGU6Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20veGVuL2ludGVyZmFjZS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
eGVuL2ludGVyZmFjZS5oCj4gPiBpbmRleCA2MmNhMDNlZjVjNjUuLmZlMzNhOTc5ODcwOCAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9pbnRlcmZhY2UuaAo+ID4gKysr
IGIvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2ludGVyZmFjZS5oCj4gPiBAQCAtMzc5LDEyICsz
NzksMTUgQEAgc3RydWN0IHhlbl9wbXVfYXJjaCB7Cj4gPiAgICogUHJlZml4IGZvcmNlcyBlbXVs
YXRpb24gb2Ygc29tZSBub24tdHJhcHBpbmcgaW5zdHJ1Y3Rpb25zLgo+ID4gICAqIEN1cnJlbnRs
eSBvbmx5IENQVUlELgo+ID4gICAqLwo+ID4gKyNpbmNsdWRlIDxhc20veGVuL3ByZWZpeC5oPgo+
ID4gKwo+ID4gICNpZmRlZiBfX0FTU0VNQkxZX18KPiA+IC0jZGVmaW5lIFhFTl9FTVVMQVRFX1BS
RUZJWCAuYnl0ZSAweDBmLDB4MGIsMHg3OCwweDY1LDB4NmUgOwo+ID4gKyNkZWZpbmUgWEVOX0VN
VUxBVEVfUFJFRklYIC5ieXRlIF9fWEVOX0VNVUxBVEVfUFJFRklYIDsKPiA+ICAjZGVmaW5lIFhF
Tl9DUFVJRCAgICAgICAgICBYRU5fRU1VTEFURV9QUkVGSVggY3B1aWQKPiA+ICAjZWxzZQo+ID4g
LSNkZWZpbmUgWEVOX0VNVUxBVEVfUFJFRklYICIuYnl0ZSAweDBmLDB4MGIsMHg3OCwweDY1LDB4
NmUgOyAiCj4gPiArI2RlZmluZSBYRU5fRU1VTEFURV9QUkVGSVggIi5ieXRlICIgX19YRU5fRU1V
TEFURV9QUkVGSVhfU1RSICIgOyAiCj4gPiAgI2RlZmluZSBYRU5fQ1BVSUQgICAgICAgICAgWEVO
X0VNVUxBVEVfUFJFRklYICJjcHVpZCIKPiA+ICsKPiA+ICAjZW5kaWYKPiAKPiBQb3NzaWJseSB5
b3UgY2FuIGRvIHNvbWV0aGluZyBsaWtlOgo+IAo+ICNkZWZpbmUgWEVOX0VNVUxBVEVfUFJFRklY
CV9fQVNNX0ZPUk0oLmJ5dGUgX19YRU5fRU1VTEFURV9QUkVGSVggOykKPiAjZGVmaW5lIFhFTl9D
UFVJRAkJWEVOX0VNVUxBVEVfUFJFRklYIF9fQVNNX0ZPUk0oY3B1aWQpCgpIbW0sIE9LLiBCdXQg
c2hvdWxkIEkgc3BsaXQgdGhpcyBjaGFuZ2UgZnJvbSBpbnNuIGRlY29kZXIgY2hhbmdlPwoKPiAK
PiA+ICAjZW5kaWYgLyogX0FTTV9YODZfWEVOX0lOVEVSRkFDRV9IICovCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3ByZWZpeC5oIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20veGVuL3ByZWZpeC5oCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi5mOTAxYmUwZDdhOTUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3hlbi9wcmVmaXguaAo+ID4gQEAgLTAsMCArMSwxMCBAQAo+ID4gKy8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gPiArI2lmbmRlZiBfVE9PTFNfQVNN
X1g4Nl9YRU5fUFJFRklYX0gKPiA+ICsjZGVmaW5lIF9UT09MU19BU01fWDg2X1hFTl9QUkVGSVhf
SAo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdpZnkuaD4KPiA+ICsKPiA+ICsjZGVm
aW5lIF9fWEVOX0VNVUxBVEVfUFJFRklYICAweDBmLDB4MGIsMHg3OCwweDY1LDB4NmUKPiA+ICsj
ZGVmaW5lIF9fWEVOX0VNVUxBVEVfUFJFRklYX1NUUiAgX19zdHJpbmdpZnkoX19YRU5fRU1VTEFU
RV9QUkVGSVgpCj4gPiArCj4gPiArI2VuZGlmCj4gCj4gSG93IGFib3V0IHdlIG1ha2UgdGhpcyBh
c20vdmlydF9wcmVmaXguaCBvciBzb21ldGhpbmcgYW5kIGluY2x1ZGU6Cj4gCj4gLyoKPiAgKiBW
aXJ0IGVzY2FwZSBzZXF1ZW5jZXMgdG8gdHJpZ2dlciBpbnN0cnVjdGlvbiBlbXVsYXRpb247Cj4g
ICogaWRlYWxseSB0aGVzZSB3b3VsZCBkZWNvZGUgdG8gJ3dob2xlJyBpbnN0cnVjdGlvbiBhbmQg
bm90IGRlc3Ryb3kKPiAgKiB0aGUgaW5zdHJ1Y3Rpb24gc3RyZWFtOyBzYWRseSB0aGlzIGlzIG5v
dCB0cnVlIGZvciB0aGUgJ2t2bScgb25lIDovCj4gICovCj4gCj4gI2RlZmluZSBfX1hFTl9FTVVM
QVRFX1BSRUZJWCAgMHgwZiwweDBiLDB4NzgsMHg2NSwweDZlICAvKiB1ZDIgOyAuYXNjaWkgInhl
biIgKi8KPiAjZGVmaW5lIF9fS1ZNX0VNVUxBVEVfUFJFRklYICAweDBmLDB4MGIsMHg2YiwweDc2
LDB4NmQJLyogdWQyIDsgLmFzY2lpICJrdm0iICovCgpPSywgYW5kIGluIHRoYXQgY2FzZSBJIHRo
aW5rIHdlIHNob3VsZCBkbyB0aGlzIGluIHNlcGFyYXRlZCBwYXRjaCBmcm9tCnRoaXMgY2hhbmdl
LgoKPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9saWIvaW5zbi5jIGIvYXJjaC94ODYvbGli
L2luc24uYwo+ID4gaW5kZXggMGI1ODYyYmE2YTc1Li5iN2ViNTAxODdkYjkgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3g4Ni9saWIvaW5zbi5jCj4gPiArKysgYi9hcmNoL3g4Ni9saWIvaW5zbi5jCj4g
Cj4gPiBAQCAtNTgsNiArNjEsMzcgQEAgdm9pZCBpbnNuX2luaXQoc3RydWN0IGluc24gKmluc24s
IGNvbnN0IHZvaWQgKmthZGRyLCBpbnQgYnVmX2xlbiwgaW50IHg4Nl82NCkKPiA+ICAJCWluc24t
PmFkZHJfYnl0ZXMgPSA0Owo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgY29uc3QgaW5zbl9ieXRl
X3QgeGVuX3ByZWZpeFtdID0geyBfX1hFTl9FTVVMQVRFX1BSRUZJWCB9Owo+ID4gKy8qIFNlZSBo
YW5kbGVfdWQoKUBhcmNoL3g4Ni9rdm0veDg2LmMgKi8KPiA+ICtzdGF0aWMgY29uc3QgaW5zbl9i
eXRlX3Qga3ZtX3ByZWZpeFtdID0gIlx4Zlx4Ymt2bSI7Cj4gCj4gVGhlbiB5b3UgY2FuIG1ha2Ug
dGhpcyBjb25zaXN0ZW50OyBtYXliZSBldmVuIHNvbWV0aGluZyBsaWtlOgo+IAo+IHN0YXRpYyBj
b25zdCBpbnNuX2J5dGVfdCAqdmlydF9wcmVmaXhbXSA9IHsKPiAJeyBfX1hFTl9FTVVMQVRFX1BS
RUZJWCB9LAo+IAl7IF9fS1ZNX0VNVUxBVEVfUFJFRklYIH0sCj4gCXsgTlVMTCB9LAo+IH07Cj4g
Cj4gQW5kIHRoZW4gY2hhbmdlIGVtdWxhdGVfcHJlZml4X3NpemUgdG8gZW11bGF0ZV9wcmVmaXhf
aW5kZXggPwoKSG1tLCBob3cgd2UgY2FuIGdldCB0aGUgbGVuZ3RoIG9mIHRob3NlIGVtdWxhdGUg
cHJlZml4ZXM/CkZvciBzdHJ1Y3QgaW5zbiwgc2luY2UgdGhlIHNpemUgaW5mb3JtYXRpb24gaXMg
aW1wb3J0YW50LCBvdGhlcgpzdWIgZmllbGRzIGhhdmUgIm5ieXRlIiBmaWVsZCBzbyB0aGF0IGNh
bGxlciBjYW4gZmluZCB0aGUgYWN0dWFsCmJ5dGVzIGZyb20gb3JpZ2luYWwgYnl0ZSBzdHJlYW0u
CgpNYXliZSB3ZSBjYW4gaGF2ZSBzdHJ1Y3QgZW11bGF0ZV9wcmVmaXggeyAubmJ5dGUsIC50eXBl
IH07IGFuZApkZWZpbmUgZW51bSBldGMuLiBidXQgZm9yIG1lLCBpdCBzZWVtcyBhIGJpdCBvdmVy
IGVuZ2luZWVyaW5nLgooc2luY2Ugbm8gb25lIHVzZSB0aGF0IGZlYXR1cmUpCgpUaGFuayB5b3Us
CgotLSAKTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
