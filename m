Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6899B55A3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 20:49:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAIVA-00062K-St; Tue, 17 Sep 2019 18:47:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAIV9-00062C-BI
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 18:46:59 +0000
X-Inumbo-ID: 867ca738-d97b-11e9-961d-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 867ca738-d97b-11e9-961d-12813bfff9fa;
 Tue, 17 Sep 2019 18:46:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F26AC1000;
 Tue, 17 Sep 2019 11:46:56 -0700 (PDT)
Received: from [10.37.13.58] (unknown [10.37.13.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78A163F67D;
 Tue, 17 Sep 2019 11:46:55 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-2-volodymyr_babchuk@epam.com>
 <45208af4-22b8-2870-f79d-a98960c4700d@arm.com> <87k1aefz3t.fsf@epam.com>
 <1cc4bd9c-44fc-0e6e-254c-c07f4b17ba4c@arm.com> <87h85hfgda.fsf@epam.com>
 <24f24620-99c9-d266-5691-4e1962d67b27@arm.com> <87d0g0feir.fsf@epam.com>
 <907b2436-6b46-59d2-e2b3-39c593e7af12@arm.com> <87k1a75cpw.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e2ae0ab9-d749-6069-61a6-e9a15a04ef57@arm.com>
Date: Tue, 17 Sep 2019 19:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87k1a75cpw.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/5] xen/arm: optee: impose limit on shared
 buffer size
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzE3LzE5IDE6MjggUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IEhp
IEp1bGllbiwKPiAKPiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSBWb2xvZHlteXIs
Cj4+Cj4+IE9uIDkvMTYvMTkgNDoyNiBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pgo+
Pj4gSGkgSnVsaWVuLAo+Pj4KPj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pgo+Pj4+IEhpLAo+
Pj4+Cj4+Pj4gT24gOS8xMi8xOSA4OjQ1IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+
Pj4KPj4+Pj4gSGkgSnVsaWVuLAo+Pj4+Pgo+Pj4+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pj4+
Pgo+Pj4+Pj4gSGkgVm9sb2R5bXlyLAo+Pj4+Pj4KPj4+Pj4+IE9uIDkvMTEvMTkgNzo0OCBQTSwg
Vm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+PiBKdWxpZW4gR3JhbGwgd3Jp
dGVzOgo+Pj4+Pj4+Cj4+Pj4+Pj4+IEhpIFZvbG9keW15ciwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24g
OC8yMy8xOSA3OjQ4IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Pj4+Pj4+IFdlIHdh
bnQgdG8gbGltaXQgbnVtYmVyIG9mIGNhbGxzIHRvIGxvb2t1cF9hbmRfcGluX2d1ZXN0X3JhbV9h
ZGRyKCkKPj4+Pj4+Pj4+IHBlciBvbmUgcmVxdWVzdC4gVGhlcmUgYXJlIHR3byB3YXlzIHRvIGRv
IHRoaXM6IGVpdGhlciBwcmVlbXB0Cj4+Pj4+Pj4+PiB0cmFuc2xhdGVfbm9uY29udGlnKCkgb3Ig
dG8gbGltaXQgc2l6ZSBvZiBvbmUgc2hhcmVkIGJ1ZmZlciBzaXplLgo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IEl0IGlzIHF1aXRlIGhhcmQgdG8gcHJlZW1wdCB0cmFuc2xhdGVfbm9uY29udGlnKCksIGJl
Y2F1c2UgaXQgaXMgZGVlcAo+Pj4+Pj4+Pj4gbmVzdGVkLiBTbyB3ZSBjaG9zZSBzZWNvbmQgb3B0
aW9uLiBXZSB3aWxsIGFsbG93IDUxMiBwYWdlcyBwZXIgb25lCj4+Pj4+Pj4+PiBzaGFyZWQgYnVm
ZmVyLiBUaGlzIGRvZXMgbm90IGludGVyZmVyZSB3aXRoIEdQIHN0YW5kYXJkLCBhcyBpdAo+Pj4+
Pj4+Pj4gcmVxdWlyZXMgdGhhdCBzaXplIGxpbWl0IGZvciBzaGFyZWQgYnVmZmVyIHNob3VsZCBi
ZSBhdCBsZXN0IDUxMmtCLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBEbyB5b3UgbWVhbiAibGVhc3QiIGlu
c3RlYWQgb2YgImxlc3QiPwo+Pj4+Pj4+IFllcwo+Pj4+Pj4+Cj4+Pj4+Pj4+IElmIHNvLCB3aHkg
NTEyIHBhZ2VzIChpLmUgMU1CKQo+Pj4gSSBoYXZlIG1pc3NlZCB0aGF0IGVhcmxpZXIuIEJ1dCA1
MTIgcGFnZXMgaXMgMk1CLCBhY3R1YWxseS4KPj4+Cj4+Pj4+Pj4+IGlzIHBsZW50eSBlbm91Z2gg
Zm9yIG1vc3Qgb2YgdGhlIHVzZSBjYXNlcz8gV2hhdCBkb2VzICJ4dGVzdCIgY29uc2lzdAo+Pj4+
Pj4+PiBvbj8KPj4+Pj4+PiBCaWdnZXIgYnVmZmVyIHh0ZXN0IHRyaWVzIHRvIGFsbG9jYXRlIGlz
IG1lcmUgMzJLQi4gSSBiZWxpZXZlIHRoYXQgMU1CCj4+Pj4+Pj4gaXMgZW5vdWdoIGZvciB0aGUg
bW9zdCBjYXNlcywgYmVjYXVzZSBPUC1URUUgaXRzZWxmIGhhdmUgYSB2ZXJ5IGxpbWl0ZWQKPj4+
Pj4+PiByZXNvdXJjZXMuIEJ1dCB0aGlzIHZhbHVlIGlzIGNob3NlbiBhcmJpdHJhcnkuCj4+Pj4+
Pgo+Pj4+Pj4gQ291bGQgd2UgcG90ZW50aWFsbHkgcmVkdWNlIHRvIGxldCBzYXkgNTEyS0IgKG9y
IG1heWJlIGxvd2VyKSBpZiB4dGVzdAo+Pj4+Pj4gb25seSBhbGxvY2F0ZSAzMktCPwo+Pj4+PiBQ
b3RlbnRpYWxseSAtIHllcy4gQnV0IG9ubHkgdG8gNTEyS0IgaWYgd2Ugd2FudCB0byBiZSBjb21w
YXRpYmxlIHdpdGgKPj4+Pj4gdGhlIEdsb2JhbCBQbGF0Zm9ybSBzcGVjaWZpY2F0aW9uLiBXaHkg
YXJlIHlvdSBhc2tpbmcsIHRob3VnaD8KPj4+Pgo+Pj4+IERvZXMgdGhlIEdsb2JhbCBQbGF0Zm9y
bSBzcGVjaWZpY2F0aW9uIGxpbWl0IHRvIDUxMktCPyBPciBpcyBpdCBhIG1pbmltdW0/Cj4+PiBH
UCBTcGVjIHNheXMsIHRoYXQgcGxhdGZvcm0gc2hvdWxkIGFsbG93ICphdCBsZXN0KiA1MTJLQi4g
VXBwZXIgbGltaXQgaXMKPj4+IG5vdCBzZXQuCj4+Pgo+Pj4+IEJlY2F1c2UsIHRoZSBzbWFsbGVy
IHRoZSBidWZmZXIgaXMsIHRoZSBsZXNzIHRpbWUgaXQgd2lsbCB0YWtlIHRvCj4+Pj4gcHJvY2Vz
cyBpbiB0aGUgd29yc3QgY2FzZS4gQWxzbywgaWYgd2UgY2FuIGhhdmUgYSByZWFzb24gZm9yIHRo
ZSBzaXplCj4+Pj4gKHlvdSBzZWVtIHRvIHN1Z2dlc3QgdGhlIHNwZWMgZGVmaW5lIGEgc2l6ZS4u
LikgdGhlbiBpdCBpcyBtdWNoIGJldHRlcgo+Pj4+IHRoYW4gYSByYW5kb20gdmFsdWUuCj4+PiBJ
IGhhdmUgbm8gc3Ryb25nIGFyZ3VtZW50cyBoZXJlLCBidXQgSSB3YW50IHRvIGFsbG93IHRoZSBi
aWdnZXN0IHNpemUKPj4+IHBvc3NpYmxlLiBJdCBzZWVtcywgdGhhdCA1MTIgcGFnZXMgaXMgdGhl
IGFjY2VwdGVkIGxpbWl0IGluIGh5cGVydmlzb3IKPj4+IGNvZGUgKGF0IGxlYXN0LCBpbiBwMm0u
YyksIHNvIEkgY2hvc2UgdGhpcyB2YWx1ZS4KPj4KPj4gSWYgR1Agc3BlY2lmaWMgcmVxdWVzdCBh
dCBsZWFzdCA1MTJLQiwgdGhlbiBhbnkgcG9ydGFibGUgY29kZSBzaG91bGQKPj4gYmUgYWJsZSB0
byBkZWFsIHdpdGggNTEyS0IsIHJpZ2h0PyBTbyB3aHkgd291bGQgeW91IGFsbG93IG1vcmU/IFdo
YXQKPj4gYXJlIHRoZSBjb25zL3Byb3M/Cj4gWWVzLCBhbnkgcG9ydGFibGUgY29kZSBzaG91bGQg
d29yayB3aXRoIDUxMktCLiBJIHdhbnQgdG8gYWxsb3cgYmlnZ2VyCj4gYnVmZmVycyBmb3IgdHdv
IHJlYXNvbnM6IG9uIE9QLVRFRSBpc3N1ZXMgdHJhY2tpbmcgcGVvcGxlIG9mdGVuIGFzayBob3cK
PiB0byBpbmNyZWFzZSB2YXJpb3VzIG1lbW9yeSBsaW1pdHMgYWNyb3NzIE9QLVRFRS4gU28sIGFw
cGFyZW50bHkgcGVvcGxlCj4gc29tZXRpbWVzIHdhbnRzIGJpZ2dlciBidWZmZXJzLiBTZWNvbmQg
cmVhc29ucyBpcyB0aGUgbm9uLXBvcnRhYmxlCj4gdGhpbmdzIGxpa2UgU2VjdXJlIERhdGEgUGF0
aC4gRm9yIFNEUCBvbmUgd2FudHMgdG8gcGFzcyBtZWRpYSAobGlrZQo+IGF1ZGlvIGFuZCB2aWRl
bykgZGF0YSB0byBhbmQgZnJvbSBPUC1URUUuIE1lZGlhIHJlcXVpcmVzIGJpZyBidWZmZXJzLgoK
QnV0IHdoYXQncyB0aGUgbGltaXQgaW4gdGhhdCBjYXNlPyBXb3VsZCAyTUIgcmVhbGx5IGJlIHN1
ZmZpY2llbnQgZm9yIHRoZW0/Cgo+IAo+IEFueXdheXMsIEkgY2FuIHNlZSB0aGF0IDUxMiBwYWdl
cyBhcmUgZXN0YWJsaXNoZWQgbGltaXQgaW4gdGhlIHAybQo+IGNvZGUuIFNvLCB3aHkgZG8geW91
IHdhbnQgT1AtVEVFIG1lZGlhdG9yIHRvIGhhdmUgc21hbGxlciBsaW1pdD8KCk9uZSBsaW1pdCBk
b2Vzbid0IHJ1bGUgdGhlbSBhbGwuIDspCgpUaGUgcHJlZW1wdGlvbiBpcyBzbGlnaHRseSBtb3Jl
IGVsYWJvcmF0ZSB0aGFuIGNoZWNraW5nIHRoZSBwcmVlbXB0aW9uIApldmVyeSA1MTIgcGFnZXMu
IEZvciBpbnN0YW5jZSBpbiBwMm1fY2FjaGVfZmx1c2hfcmFuZ2UoKSwgd2UgdGFrZSBpbnRvIAph
Y2NvdW50IGhvdyBtdWNoIGlzIGRvbmUuCgpJbiB5b3VyIGNhc2UsIHlvdSBhbHNvIGhhdmUgdG8g
ZmFjdG9yIGhvdyBsb25nIHRoZSBzbWMgY2FsbCBpcyBnb2luZyB0byAKdGFrZSBpbiB5b3VyIGNh
bGN1bGF0aW9uLiBUaGlzIGlzIG5vdCBhbiBleGFjdCBzY2llbmNlLCBidXQgdGhlIGZhY3QgCnRo
YXQgYXQgdGhlIG1vbWVudCB0aGUgbGltaXQgZm9yIE9QLVRFRSBpcyBtdWNoIGxvd2VyIGxlYWQg
dG8gbWUgdG8gCnRoaW5rIGEgc21hbGxlciBsaW1pdCBpcyBiZXR0ZXIuIE1vc3QgbGlrZWx5IE9Q
LVRFRSB3aWxsIGRlbnkgaXQgYW55d2F5Li4uCgo+IAo+IEkgd2FudCB0byBiZSBzdHJhaWdodCB0
aGVyZTogNTEyS0Igd2lsbCBsaWtlbHkgd29yayBmb3IgbW9zdCBvZiB0aGUKPiB1c2Vycy4gQnV0
IHRoZXJlIGFyZSBhbHdheXMgdXNlcnMgd2hvIHdhbnQgbW9yZS4gU28gSSB3b3VsZCBsaWtlIHRv
IHNldAo+IGxhcmdlc3QgcGxhdXNpYmxlIGxpbWl0IGp1c3QgaW4gY2FzZS4KSSBhbSBwcmV0dHkg
dW5jb252aW5jZWQgdGhhdCBhbiBoaWdoZXIgdmFsdWUgdGhhbiB3aGF0IHRoZSBzcGVjIHJlcXVl
c3QgCmlzIHJpZ2h0LiBCdXQgSSBkb24ndCBoYXZlIG1vcmUgZ3JvdW5kIHRoYW4gbXkgZ3V0IGZl
ZWxpbmcgKEkgYW0gYWx3YXlzIApvbiB0aGUgc2FmZSBzaWRlKS4gWW91IGFyZSB0aGUgbWFpbnRh
aW5lciBvZiB0aGF0IGNvZGUsIHNvIEkgYW0gbm90IApnb2luZyB0byBwdXNoIG1vcmUgZm9yIGEg
bG93ZXIgdmFsdWUuCgpIb3dldmVyLCB3ZSBzaG91bGQgYXQgbGVhc3QgZG9jdW1lbnQgYW55IHJl
YXNvbmluZyBiZWNhdXNlIHRoaXMgZG9lcyBub3QgCnNlZW0gdG8gYmUgYSB0aGF0IHJhbmRvbSB2
YWx1ZSBhbnltb3JlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
