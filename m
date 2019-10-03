Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADE1C9AE8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 11:38:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFxVm-0000E1-4S; Thu, 03 Oct 2019 09:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFxVk-0000Dw-4A
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 09:35:00 +0000
X-Inumbo-ID: 10d5913c-e5c1-11e9-9721-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 10d5913c-e5c1-11e9-9721-12813bfff9fa;
 Thu, 03 Oct 2019 09:34:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20ABF1000;
 Thu,  3 Oct 2019 02:34:58 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5196E3F739;
 Thu,  3 Oct 2019 02:34:57 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1910021833180.2691@sstabellini-ThinkPad-T480s>
 <20191003013526.30768-5-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fce98dfd-9a8b-e615-3799-ff368d4c6527@arm.com>
Date: Thu, 3 Oct 2019 10:34:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003013526.30768-5-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCkEgY291cGxlIG9mIGNvbW1lbnRzIGJlbG93LCBtb3N0bHkgYmVjYXVzZSBJ
IHdhc24ndCBjbGVhciBlbm91Z2ggb24gdGhlIHByZXZpb3VzIAp2ZXJzaW9uLiBJIGFtIG5vdCBz
dXJlIGlmIGl0IGlzIHdvcnRoIHJlc2VuZGluZyB0aGUgc2VyaWVzLCBtYXliZSBqdXN0IHJlc2Vu
ZGluZyAKdGhpcyBvbmUgd291bGQgYmUgc3VmZmljaWVudD8KCk9uIDAzLzEwLzIwMTkgMDI6MzUs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggODRiNjVi
OGYyNS4uYjkwOTAyYWQ5NyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMTcxNCw2ICsxNzE0
LDg4IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdnBsMDExX3VhcnRfbm9kZShzdHJ1Y3Qga2Vy
bmVsX2luZm8gKmtpbmZvKQo+ICAgfQo+ICAgI2VuZGlmCj4gICAKPiArLyoKPiArICogU2NhbiBk
ZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIGZvciBwYXNzdGhyb3VnaCBzcGVjaWZpYyBpbmZvcm1hdGlv
bi4KPiArICogUmV0dXJucyA8IDAgb24gZXJyb3IKPiArICogICAgICAgICAwIG9uIHN1Y2Nlc3MK
PiArICovCj4gK3N0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9wYXNzdGhyb3VnaF9wcm9wKHN0cnVj
dCBrZXJuZWxfaW5mbyAqa2luZm8sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkgKnhlbl9yZWcsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVy
dHkgKnhlbl9wYXRoLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIHhlbl9mb3JjZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDMyX3QgYWRkcmVzc19jZWxscywgdWludDMyX3Qgc2l6ZV9jZWxscykKPiArewo+
ICsgICAgY29uc3QgX19iZTMyICpjZWxsOwo+ICsgICAgdW5zaWduZWQgaW50IGksIGxlbjsKPiAr
ICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9kZTsKPiArICAgIGludCByZXM7Cj4gKyAgICBw
YWRkcl90IG1zdGFydCwgc2l6ZSwgZ3N0YXJ0Owo+ICsKPiArICAgIC8qIHhlbixyZWcgc3BlY2lm
aWVzIHdoZXJlIHRvIG1hcCB0aGUgTU1JTyByZWdpb24gKi8KPiArICAgIGNlbGwgPSAoY29uc3Qg
X19iZTMyICopeGVuX3JlZy0+ZGF0YTsKPiArICAgIGxlbiA9IGZkdDMyX3RvX2NwdSh4ZW5fcmVn
LT5sZW4pIC8gKChhZGRyZXNzX2NlbGxzICogMiArIHNpemVfY2VsbHMpICoKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZih1aW50MzJfdCkpOwoKQXBvbG9n
aWVzIGZvciB0aGlzLCBJIG1pc3JlYWQgeW91IHByZXZpb3VzIGNvZGUuIEkgYW0gaGFwcHkgd2l0
aCB0aGlzIHZlcnNpb24gb3IgCnRoZSBwcmV2aW91cyBvbmUuCgpbLi4uXQoKPiArICAgIC8qCj4g
KyAgICAgKiBPbmx5IGhhbmRsZSBwYXNzdGhyb3VnaCBwcm9wZXJ0aWVzIGlmIGJvdGggeGVuLHJl
ZyBhbmQgeGVuLHBhdGgKPiArICAgICAqIGFyZSBwcmVzZW50LCBvciBpZiB4ZW4sZm9yY2UtYXNz
aWduLXdpdGhvdXQtaW9tbXUgaXMgc3BlY2lmaWVkLgo+ICsgICAgICovCj4gKyAgICBpZiAoIHhl
bl9yZWcgIT0gTlVMTCAmJiAoeGVuX3BhdGggIT0gTlVMTCB8fCB4ZW5fZm9yY2UpICkKPiArICAg
IHsKPiArICAgICAgICByZXMgPSBoYW5kbGVfcGFzc3Rocm91Z2hfcHJvcChraW5mbywgeGVuX3Jl
ZywgeGVuX3BhdGgsIHhlbl9mb3JjZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsKPiArICAgICAgICBpZiAoIHJlcyA8
IDAgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkZhaWxl
ZCB0byBhc3NpZ24gZGV2aWNlIHRvICVwZFxuIiwga2luZm8tPmQpOwoKVGhpcyBpcyBub3QgdGhl
IGVycm9yIHBhdGggSSBtZWFudC4KClRoZSBvbmUgSSB3YXMgcmVmZXJyaW5nIGlzIHRoZSBjYXNl
IHdoZXJlIHhlbixwYXRoIGlzIHByZXNlbnQgYnV0IG5vdCB4ZW4scmVnLiAKQXQgdGhlIG1vbWVu
dCB5b3Ugd2lsbCBjb250aW51ZSB3aXRob3V0IHRlbGxpbmcgdGhlIHVzZXIuIFdlIHNob3VsZCBh
dCBsZWFzdCAKcHJpbnQgYSB3YXJuaW5nIGFuZCBwcm9iYWJseSByZXR1cm4gYW4gZXJyb3IgYXMg
c29tZW9uZSBzcGVjaWZ5aW5nICJ4ZW4scGF0aCIgCm1heSBleHBlY3QgdG8gYXNzaWduIHRoZSBk
ZXZpY2UuCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
