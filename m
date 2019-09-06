Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCA7AB5D2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 12:32:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6BTi-0002RT-OH; Fri, 06 Sep 2019 10:28:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i6BTh-0002RO-Ch
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 10:28:29 +0000
X-Inumbo-ID: 10e0314a-d091-11e9-abed-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10e0314a-d091-11e9-abed-12813bfff9fa;
 Fri, 06 Sep 2019 10:28:28 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B2CC20693;
 Fri,  6 Sep 2019 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567765708;
 bh=LckxxhN33QI7hBosz2hOt44i8WFcrDpnBzPka+P6J1I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OVpHyutzcEHG86HaLs+WIIPoe586pIAkDgL5B4RVmqFHZRrupJnVY5eXgVtfwj61M
 0syzuaWYZVFQJG3Je/48SiMTzubCIfCeRIaqKy9sx56ioL77GyutKSw3zgPoC9jq4z
 M5F1AK426s/Q6f2phTZKMS7tJ3a2ewqVMICm7kTE=
Date: Fri, 6 Sep 2019 19:28:22 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Message-Id: <20190906192822.21afa68b557463fdc7b1cc81@kernel.org>
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
UFVJRAkJWEVOX0VNVUxBVEVfUFJFRklYIF9fQVNNX0ZPUk0oY3B1aWQpCgpPb3BzLCB0aGlzIGRv
ZXNuJ3Qgd29yaywgc2luY2UgX19BU01fRk9STSh4KSB1c2VzICN4IGRpcmVjdGx5CgojIGRlZmlu
ZSBfX0FTTV9GT1JNKHgpICAiICIgI3ggIiAiCgp3aGljaCBkb2Vzbid0IGV4cGFuZCAieCIgaWYg
eCBpcyBhIG1hY3JvLiBXZSBoYXZlIHRvIHVzZSBfX3N0cmluZ2lmeQpsaWtlIAoKIyBpbmNsdWRl
IDxsaW51eC9zdHJpbmdpZnkuaD4KIyBkZWZpbmUgX19BU01fRk9STSh4KSAgIiAiIF9fc3RyaW5n
aWZ5KHgpICIgIgoKU28gdGhpcyBuZWVkcyBhb250aGVyIHBhdGNoIGluIHRoZSBzZXJpZXMgOikK
ClRoYW5rIHlvdSwKCi0tIApNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
