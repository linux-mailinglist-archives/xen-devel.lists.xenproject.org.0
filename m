Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE55B4C42
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 12:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAB3L-0004Sm-5P; Tue, 17 Sep 2019 10:49:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAB3J-0004Sc-GI
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 10:49:45 +0000
X-Inumbo-ID: cbbf8f9c-d938-11e9-9606-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cbbf8f9c-d938-11e9-9606-12813bfff9fa;
 Tue, 17 Sep 2019 10:49:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F11A51000;
 Tue, 17 Sep 2019 03:49:16 -0700 (PDT)
Received: from [10.37.13.58] (unknown [10.37.13.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 043B33F59C;
 Tue, 17 Sep 2019 03:49:15 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-2-volodymyr_babchuk@epam.com>
 <45208af4-22b8-2870-f79d-a98960c4700d@arm.com> <87k1aefz3t.fsf@epam.com>
 <1cc4bd9c-44fc-0e6e-254c-c07f4b17ba4c@arm.com> <87h85hfgda.fsf@epam.com>
 <24f24620-99c9-d266-5691-4e1962d67b27@arm.com> <87d0g0feir.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <907b2436-6b46-59d2-e2b3-39c593e7af12@arm.com>
Date: Tue, 17 Sep 2019 11:49:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87d0g0feir.fsf@epam.com>
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

SGkgVm9sb2R5bXlyLAoKT24gOS8xNi8xOSA0OjI2IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiAKPiBIaSBKdWxpZW4sCj4gCj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiAKPj4gSGksCj4+
Cj4+IE9uIDkvMTIvMTkgODo0NSBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pgo+Pj4g
SGkgSnVsaWVuLAo+Pj4KPj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pgo+Pj4+IEhpIFZvbG9k
eW15ciwKPj4+Pgo+Pj4+IE9uIDkvMTEvMTkgNzo0OCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4+Pj4+Cj4+Pj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pj4+Cj4+Pj4+PiBIaSBWb2xv
ZHlteXIsCj4+Pj4+Pgo+Pj4+Pj4gT24gOC8yMy8xOSA3OjQ4IFBNLCBWb2xvZHlteXIgQmFiY2h1
ayB3cm90ZToKPj4+Pj4+PiBXZSB3YW50IHRvIGxpbWl0IG51bWJlciBvZiBjYWxscyB0byBsb29r
dXBfYW5kX3Bpbl9ndWVzdF9yYW1fYWRkcigpCj4+Pj4+Pj4gcGVyIG9uZSByZXF1ZXN0LiBUaGVy
ZSBhcmUgdHdvIHdheXMgdG8gZG8gdGhpczogZWl0aGVyIHByZWVtcHQKPj4+Pj4+PiB0cmFuc2xh
dGVfbm9uY29udGlnKCkgb3IgdG8gbGltaXQgc2l6ZSBvZiBvbmUgc2hhcmVkIGJ1ZmZlciBzaXpl
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gSXQgaXMgcXVpdGUgaGFyZCB0byBwcmVlbXB0IHRyYW5zbGF0ZV9u
b25jb250aWcoKSwgYmVjYXVzZSBpdCBpcyBkZWVwCj4+Pj4+Pj4gbmVzdGVkLiBTbyB3ZSBjaG9z
ZSBzZWNvbmQgb3B0aW9uLiBXZSB3aWxsIGFsbG93IDUxMiBwYWdlcyBwZXIgb25lCj4+Pj4+Pj4g
c2hhcmVkIGJ1ZmZlci4gVGhpcyBkb2VzIG5vdCBpbnRlcmZlcmUgd2l0aCBHUCBzdGFuZGFyZCwg
YXMgaXQKPj4+Pj4+PiByZXF1aXJlcyB0aGF0IHNpemUgbGltaXQgZm9yIHNoYXJlZCBidWZmZXIg
c2hvdWxkIGJlIGF0IGxlc3QgNTEya0IuCj4+Pj4+Pgo+Pj4+Pj4gRG8geW91IG1lYW4gImxlYXN0
IiBpbnN0ZWFkIG9mICJsZXN0Ij8KPj4+Pj4gWWVzCj4+Pj4+Cj4+Pj4+PiBJZiBzbywgd2h5IDUx
MiBwYWdlcyAoaS5lIDFNQikKPiBJIGhhdmUgbWlzc2VkIHRoYXQgZWFybGllci4gQnV0IDUxMiBw
YWdlcyBpcyAyTUIsIGFjdHVhbGx5Lgo+IAo+Pj4+Pj4gaXMgcGxlbnR5IGVub3VnaCBmb3IgbW9z
dCBvZiB0aGUgdXNlIGNhc2VzPyBXaGF0IGRvZXMgInh0ZXN0IiBjb25zaXN0Cj4+Pj4+PiBvbj8K
Pj4+Pj4gQmlnZ2VyIGJ1ZmZlciB4dGVzdCB0cmllcyB0byBhbGxvY2F0ZSBpcyBtZXJlIDMyS0Iu
IEkgYmVsaWV2ZSB0aGF0IDFNQgo+Pj4+PiBpcyBlbm91Z2ggZm9yIHRoZSBtb3N0IGNhc2VzLCBi
ZWNhdXNlIE9QLVRFRSBpdHNlbGYgaGF2ZSBhIHZlcnkgbGltaXRlZAo+Pj4+PiByZXNvdXJjZXMu
IEJ1dCB0aGlzIHZhbHVlIGlzIGNob3NlbiBhcmJpdHJhcnkuCj4+Pj4KPj4+PiBDb3VsZCB3ZSBw
b3RlbnRpYWxseSByZWR1Y2UgdG8gbGV0IHNheSA1MTJLQiAob3IgbWF5YmUgbG93ZXIpIGlmIHh0
ZXN0Cj4+Pj4gb25seSBhbGxvY2F0ZSAzMktCPwo+Pj4gUG90ZW50aWFsbHkgLSB5ZXMuIEJ1dCBv
bmx5IHRvIDUxMktCIGlmIHdlIHdhbnQgdG8gYmUgY29tcGF0aWJsZSB3aXRoCj4+PiB0aGUgR2xv
YmFsIFBsYXRmb3JtIHNwZWNpZmljYXRpb24uIFdoeSBhcmUgeW91IGFza2luZywgdGhvdWdoPwo+
Pgo+PiBEb2VzIHRoZSBHbG9iYWwgUGxhdGZvcm0gc3BlY2lmaWNhdGlvbiBsaW1pdCB0byA1MTJL
Qj8gT3IgaXMgaXQgYSBtaW5pbXVtPwo+IEdQIFNwZWMgc2F5cywgdGhhdCBwbGF0Zm9ybSBzaG91
bGQgYWxsb3cgKmF0IGxlc3QqIDUxMktCLiBVcHBlciBsaW1pdCBpcwo+IG5vdCBzZXQuCj4gCj4+
IEJlY2F1c2UsIHRoZSBzbWFsbGVyIHRoZSBidWZmZXIgaXMsIHRoZSBsZXNzIHRpbWUgaXQgd2ls
bCB0YWtlIHRvCj4+IHByb2Nlc3MgaW4gdGhlIHdvcnN0IGNhc2UuIEFsc28sIGlmIHdlIGNhbiBo
YXZlIGEgcmVhc29uIGZvciB0aGUgc2l6ZQo+PiAoeW91IHNlZW0gdG8gc3VnZ2VzdCB0aGUgc3Bl
YyBkZWZpbmUgYSBzaXplLi4uKSB0aGVuIGl0IGlzIG11Y2ggYmV0dGVyCj4+IHRoYW4gYSByYW5k
b20gdmFsdWUuCj4gSSBoYXZlIG5vIHN0cm9uZyBhcmd1bWVudHMgaGVyZSwgYnV0IEkgd2FudCB0
byBhbGxvdyB0aGUgYmlnZ2VzdCBzaXplCj4gcG9zc2libGUuIEl0IHNlZW1zLCB0aGF0IDUxMiBw
YWdlcyBpcyB0aGUgYWNjZXB0ZWQgbGltaXQgaW4gaHlwZXJ2aXNvcgo+IGNvZGUgKGF0IGxlYXN0
LCBpbiBwMm0uYyksIHNvIEkgY2hvc2UgdGhpcyB2YWx1ZS4KCklmIEdQIHNwZWNpZmljIHJlcXVl
c3QgYXQgbGVhc3QgNTEyS0IsIHRoZW4gYW55IHBvcnRhYmxlIGNvZGUgc2hvdWxkIGJlIAphYmxl
IHRvIGRlYWwgd2l0aCA1MTJLQiwgcmlnaHQ/IFNvIHdoeSB3b3VsZCB5b3UgYWxsb3cgbW9yZT8g
V2hhdCBhcmUgCnRoZSBjb25zL3Byb3M/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
