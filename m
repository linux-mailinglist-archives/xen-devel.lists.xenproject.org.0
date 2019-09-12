Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE4B14F6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 21:54:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8V7l-0008BD-Dq; Thu, 12 Sep 2019 19:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tudw=XH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i8V7j-0008B8-5O
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 19:51:23 +0000
X-Inumbo-ID: b0422a72-d596-11e9-a337-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b0422a72-d596-11e9-a337-bc764e2007e4;
 Thu, 12 Sep 2019 19:51:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA45828;
 Thu, 12 Sep 2019 12:51:18 -0700 (PDT)
Received: from [10.37.12.51] (unknown [10.37.12.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4F6A3F67D;
 Thu, 12 Sep 2019 12:51:17 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-2-volodymyr_babchuk@epam.com>
 <45208af4-22b8-2870-f79d-a98960c4700d@arm.com> <87k1aefz3t.fsf@epam.com>
 <1cc4bd9c-44fc-0e6e-254c-c07f4b17ba4c@arm.com> <87h85hfgda.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <24f24620-99c9-d266-5691-4e1962d67b27@arm.com>
Date: Thu, 12 Sep 2019 20:51:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87h85hfgda.fsf@epam.com>
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

SGksCgpPbiA5LzEyLzE5IDg6NDUgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IEhp
IEp1bGllbiwKPiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSBWb2xvZHlteXIsCj4+
Cj4+IE9uIDkvMTEvMTkgNzo0OCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pgo+Pj4g
SnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+Cj4+Pj4gSGkgVm9sb2R5bXlyLAo+Pj4+Cj4+Pj4gT24g
OC8yMy8xOSA3OjQ4IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Pj4gV2Ugd2FudCB0
byBsaW1pdCBudW1iZXIgb2YgY2FsbHMgdG8gbG9va3VwX2FuZF9waW5fZ3Vlc3RfcmFtX2FkZHIo
KQo+Pj4+PiBwZXIgb25lIHJlcXVlc3QuIFRoZXJlIGFyZSB0d28gd2F5cyB0byBkbyB0aGlzOiBl
aXRoZXIgcHJlZW1wdAo+Pj4+PiB0cmFuc2xhdGVfbm9uY29udGlnKCkgb3IgdG8gbGltaXQgc2l6
ZSBvZiBvbmUgc2hhcmVkIGJ1ZmZlciBzaXplLgo+Pj4+Pgo+Pj4+PiBJdCBpcyBxdWl0ZSBoYXJk
IHRvIHByZWVtcHQgdHJhbnNsYXRlX25vbmNvbnRpZygpLCBiZWNhdXNlIGl0IGlzIGRlZXAKPj4+
Pj4gbmVzdGVkLiBTbyB3ZSBjaG9zZSBzZWNvbmQgb3B0aW9uLiBXZSB3aWxsIGFsbG93IDUxMiBw
YWdlcyBwZXIgb25lCj4+Pj4+IHNoYXJlZCBidWZmZXIuIFRoaXMgZG9lcyBub3QgaW50ZXJmZXJl
IHdpdGggR1Agc3RhbmRhcmQsIGFzIGl0Cj4+Pj4+IHJlcXVpcmVzIHRoYXQgc2l6ZSBsaW1pdCBm
b3Igc2hhcmVkIGJ1ZmZlciBzaG91bGQgYmUgYXQgbGVzdCA1MTJrQi4KPj4+Pgo+Pj4+IERvIHlv
dSBtZWFuICJsZWFzdCIgaW5zdGVhZCBvZiAibGVzdCI/Cj4+PiBZZXMKPj4+Cj4+Pj4gSWYgc28s
IHdoeSA1MTIgcGFnZXMgKGkuZSAxTUIpCj4+Pj4gaXMgcGxlbnR5IGVub3VnaCBmb3IgbW9zdCBv
ZiB0aGUgdXNlIGNhc2VzPyBXaGF0IGRvZXMgInh0ZXN0IiBjb25zaXN0Cj4+Pj4gb24/Cj4+PiBC
aWdnZXIgYnVmZmVyIHh0ZXN0IHRyaWVzIHRvIGFsbG9jYXRlIGlzIG1lcmUgMzJLQi4gSSBiZWxp
ZXZlIHRoYXQgMU1CCj4+PiBpcyBlbm91Z2ggZm9yIHRoZSBtb3N0IGNhc2VzLCBiZWNhdXNlIE9Q
LVRFRSBpdHNlbGYgaGF2ZSBhIHZlcnkgbGltaXRlZAo+Pj4gcmVzb3VyY2VzLiBCdXQgdGhpcyB2
YWx1ZSBpcyBjaG9zZW4gYXJiaXRyYXJ5Lgo+Pgo+PiBDb3VsZCB3ZSBwb3RlbnRpYWxseSByZWR1
Y2UgdG8gbGV0IHNheSA1MTJLQiAob3IgbWF5YmUgbG93ZXIpIGlmIHh0ZXN0Cj4+IG9ubHkgYWxs
b2NhdGUgMzJLQj8KPiBQb3RlbnRpYWxseSAtIHllcy4gQnV0IG9ubHkgdG8gNTEyS0IgaWYgd2Ug
d2FudCB0byBiZSBjb21wYXRpYmxlIHdpdGgKPiB0aGUgR2xvYmFsIFBsYXRmb3JtIHNwZWNpZmlj
YXRpb24uIFdoeSBhcmUgeW91IGFza2luZywgdGhvdWdoPwoKRG9lcyB0aGUgR2xvYmFsIFBsYXRm
b3JtIHNwZWNpZmljYXRpb24gbGltaXQgdG8gNTEyS0I/IE9yIGlzIGl0IGEgbWluaW11bT8KCkJl
Y2F1c2UsIHRoZSBzbWFsbGVyIHRoZSBidWZmZXIgaXMsIHRoZSBsZXNzIHRpbWUgaXQgd2lsbCB0
YWtlIHRvIApwcm9jZXNzIGluIHRoZSB3b3JzdCBjYXNlLiBBbHNvLCBpZiB3ZSBjYW4gaGF2ZSBh
IHJlYXNvbiBmb3IgdGhlIHNpemUgCih5b3Ugc2VlbSB0byBzdWdnZXN0IHRoZSBzcGVjIGRlZmlu
ZSBhIHNpemUuLi4pIHRoZW4gaXQgaXMgbXVjaCBiZXR0ZXIgCnRoYW4gYSByYW5kb20gdmFsdWUu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
