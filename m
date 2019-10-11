Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6086D3DE4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 13:03:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIsfE-0003yR-7X; Fri, 11 Oct 2019 11:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MXO=YE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIsfD-0003yK-7Z
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 11:00:51 +0000
X-Inumbo-ID: 61e104c0-ec16-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 61e104c0-ec16-11e9-beca-bc764e2007e4;
 Fri, 11 Oct 2019 11:00:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80EA928;
 Fri, 11 Oct 2019 04:00:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92E8F3F703;
 Fri, 11 Oct 2019 04:00:47 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <17defd97-e6b8-761e-0bd8-0aa0a2de7bed@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <55f7b367-a593-5585-ffd1-7034f045b9a9@arm.com>
Date: Fri, 11 Oct 2019 12:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <17defd97-e6b8-761e-0bd8-0aa0a2de7bed@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@gmail.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8xMC8yMDE5IDEwOjQ3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDEwLzEw
LzIwMTkgMTY6MTEsIElhbiBKYWNrc29uIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+PiBpbmRleCA2
OTk3MWM5N2I2Li5mY2NiNmE2MjcxIDEwMDY0NAo+PiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9j
cmVhdGUuYwo+PiArKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+PiBAQCAtOTY4LDYg
Kzk1Nyw1MCBAQCBpbnQgbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdChsaWJ4bF9fZ2Mg
KmdjLAo+PiAgICAgICAgICAgZ290byBlcnJvcl9vdXQ7Cj4+ICAgICAgIH0KPj4gICAKPj4gKyAg
ICBib29sIG5lZWRfcHQgPSBkX2NvbmZpZy0+bnVtX3BjaWRldnMgfHwgZF9jb25maWctPm51bV9k
dGRldnM7Cj4+ICsgICAgaWYgKGNfaW5mby0+cGFzc3Rocm91Z2ggPT0gTElCWExfUEFTU1RIUk9V
R0hfVU5LTk9XTikgewo+PiArICAgICAgICBjX2luZm8tPnBhc3N0aHJvdWdoID0gbmVlZF9wdAo+
PiArICAgICAgICAgICAgPyBMSUJYTF9QQVNTVEhST1VHSF9FTkFCTEVEIDogTElCWExfUEFTU1RI
Uk9VR0hfRElTQUJMRUQ7Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgYm9vbCBpb21tdV9lbmFibGVk
ID0gcGh5c2luZm8uY2FwX2h2bV9kaXJlY3RpbzsKPj4gKyAgICBpZiAoY19pbmZvLT5wYXNzdGhy
b3VnaCAhPSBMSUJYTF9QQVNTVEhST1VHSF9ESVNBQkxFRCAmJiAhaW9tbXVfZW5hYmxlZCkgewo+
PiArICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwKPj4gKyAgICAgICAgICAgICAiRVJST1I6IHBh
c3N0aHJvdWdoIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBwbGF0Zm9ybVxuIik7Cj4+ICsgICAgICAg
IHJldCA9IEVSUk9SX0lOVkFMOwo+PiArICAgICAgICBnb3RvIGVycm9yX291dDsKPj4gKyAgICB9
Cj4+ICsKPj4gKyAgICBpZiAoY19pbmZvLT5wYXNzdGhyb3VnaCA9PSBMSUJYTF9QQVNTVEhST1VH
SF9ESVNBQkxFRCAmJiBuZWVkX3B0KSB7Cj4+ICsgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLAo+
PiArICAgICAgICAgICAgICJwYXNzdGhyb3VnaCBkaXNhYmxlZCBidXQgZGV2aWNlcyBhcmUgc3Bl
Y2lmaWVkIik7Cj4gCj4gVGhpcyBpcyB0aGUgb25seSBsb2cgbWVzc2FnZSB3aGljaCBpc24ndCBw
cmVmaXhlZCB3aXRoIEVSUk9SOgo+IAo+PiArICAgICAgICByZXQgPSBFUlJPUl9JTlZBTDsKPj4g
KyAgICAgICAgZ290byBlcnJvcl9vdXQ7Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgY29uc3QgY2hh
ciAqd2h5bm90X3B0X3NoYXJlID0KPj4gKyAgICAgICAgY19pbmZvLT50eXBlID09IExJQlhMX0RP
TUFJTl9UWVBFX1BWID8gIm5vdCB2YWxpZCBmb3IgUFYgZG9tYWluIiA6Cj4+ICsgICAgICAgICFw
aHlzaW5mby5jYXBfaW9tbXVfaGFwX3B0X3NoYXJlID8gIm5vdCBzdXBwb3J0ZWQgb24gdGhpcyBw
bGF0Zm9ybSIgOgo+PiArICAgICAgICBOVUxMOwo+IAo+IFRoaXMgaXMgYSBsaXR0bGUgbW9yZSBj
b21wbGljYXRlZC4KPiAKPiBGb3IgQVJNLCBkb2Vzbid0IGxpYnhsIHRyZWF0IGd1ZXN0cyBhcyBQ
Viwgb3IgaGFzIHRoYXQgYmVlbiBmaXhlZCBub3c/CgpsaWJ4bCB0cmVhdHMgQXJtIGd1ZXN0IGFz
IFBWSCBub3cuIE5vdGUgdGhhdCB3ZSBzZWFtbGVzc2x5IGNvbnZlcnQgUFYgdG8gUFZIIGluIAps
aWJ4bF9fYXJjaF9kb21haW5fe2J1aWxkLCBjcmVhdGV9X2luZm9fc2V0ZGVmYXVsdCgpLgoKU28g
YXMgbG9uZyBhcyB0aGlzIGlzIGNhbGxlZCBhZnRlciBhbnkgb2YgdGhvc2UgY2FsbHMsIHRoZW4g
d2Ugc2hvdWxkIGJlIGZpbmUuCgo+IEFSTSdzIG9ubHkgcGFzc3Rocm91Z2ggbW9kZSBpcyBQVF9T
SEFSRS4KCkNvcnJlY3QuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
