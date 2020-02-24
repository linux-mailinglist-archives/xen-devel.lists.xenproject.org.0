Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C2169B93
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 02:09:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j62D5-0002MD-VZ; Mon, 24 Feb 2020 01:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZQR9=4M=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j62D4-0002M7-DX
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 01:06:58 +0000
X-Inumbo-ID: f2b7e9f0-56a1-11ea-ade5-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.190])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2b7e9f0-56a1-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 01:06:57 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 832D7770149FF4B905D2;
 Mon, 24 Feb 2020 09:06:54 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Feb 2020
 09:06:44 +0800
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <5E4F3EF4.4050701@hisilicon.com>
 <3a4f47ed-215f-f518-e819-a4b6503968c0@suse.com>
 <d21dd32d-8a5b-bb91-f83b-ed7aa72d2758@xen.org>
 <63a33275-3aca-3bb1-3028-c890e1474d07@suse.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E5321A4.4080408@hisilicon.com>
Date: Mon, 24 Feb 2020 09:06:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <63a33275-3aca-3bb1-3028-c890e1474d07@suse.com>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH v4] ns16550: Add ACPI support for ARM only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjAyMC8yLzIxIDIzOjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMS4w
Mi4yMDIwIDE1OjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDIxLzAyLzIwMjAgMTQ6MDIs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjEuMDIuMjAyMCAwMzoyMiwgV2VpIFh1IHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCj4+Pj4gKysrIGIveGVuL2Ry
aXZlcnMvY2hhci9uczE2NTUwLmMKPj4+PiBAQCAtMTYyMCw2ICsxNjIwLDg1IEBAIERUX0RFVklD
RV9TVEFSVChuczE2NTUwLCAiTlMxNjU1MCBVQVJUIiwgREVWSUNFX1NFUklBTCkKPj4+PiAgIERU
X0RFVklDRV9FTkQKPj4+Pgo+Pj4+ICAgI2VuZGlmIC8qIEhBU19ERVZJQ0VfVFJFRSAqLwo+Pj4+
ICsKPj4+PiArI2lmIGRlZmluZWQoQ09ORklHX0FDUEkpICYmIGRlZmluZWQoQ09ORklHX0FSTSkK
Pj4+PiArI2luY2x1ZGUgPHhlbi9hY3BpLmg+Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IF9faW5p
dCBuczE2NTUwX2FjcGlfdWFydF9pbml0KGNvbnN0IHZvaWQgKmRhdGEpCj4+Pj4gK3sKPj4+PiAr
ICAgIHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqdGFibGU7Cj4+Pj4gKyAgICBzdHJ1Y3QgYWNw
aV90YWJsZV9zcGNyICpzcGNyOwo+Pj4+ICsgICAgYWNwaV9zdGF0dXMgc3RhdHVzOwo+Pj4+ICsg
ICAgLyoKPj4+PiArICAgICAqIFNhbWUgYXMgdGhlIERUIHBhcnQuCj4+Pj4gKyAgICAgKiBPbmx5
IHN1cHBvcnQgb25lIFVBUlQgb24gQVJNIHdoaWNoIGhhcHBlbiB0byBiZSBuczE2NTUwX2NvbVsw
XS4KPj4+PiArICAgICAqLwo+Pj4+ICsgICAgc3RydWN0IG5zMTY1NTAgKnVhcnQgPSAmbnMxNjU1
MF9jb21bMF07Cj4+Pj4gKwo+Pj4+ICsgICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9T
SUdfU1BDUiwgMCwgJnRhYmxlKTsKPj4+PiArICAgIGlmICggQUNQSV9GQUlMVVJFKHN0YXR1cykg
KQo+Pj4+ICsgICAgewo+Pj4+ICsgICAgICAgIHByaW50aygibnMxNjU1MDogRmFpbGVkIHRvIGdl
dCBTUENSIHRhYmxlXG4iKTsKPj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+PiArICAg
IH0KPj4+PiArCj4+Pj4gKyAgICBzcGNyID0gY29udGFpbmVyX29mKHRhYmxlLCBzdHJ1Y3QgYWNw
aV90YWJsZV9zcGNyLCBoZWFkZXIpOwo+Pj4+ICsKPj4+PiArICAgIC8qCj4+Pj4gKyAgICAgKiBU
aGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBtYXkgYmUgMCBmb3IgZXhhbXBsZQo+Pj4+ICsgICAgICog
aWYgdGhlIGNvbnNvbGUgcmVkaXJlY3Rpb24gaXMgZGlzYWJsZWQuCj4+Pj4gKyAgICAgKi8KPj4+
PiArICAgIGlmICggdW5saWtlbHkoIXNwY3ItPnNlcmlhbF9wb3J0LmFkZHJlc3MpICkKPj4+PiAr
ICAgIHsKPj4+PiArICAgICAgICBwcmludGsoIm5zMTY1NTA6IENvbnNvbGUgcmVkaXJlY3Rpb24g
aXMgZGlzYWJsZWRcbiIpOwo+Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICsgICAg
fQo+Pj4+ICsKPj4+PiArICAgIGlmICggdW5saWtlbHkoc3Bjci0+c2VyaWFsX3BvcnQuc3BhY2Vf
aWQgIT0gQUNQSV9BRFJfU1BBQ0VfU1lTVEVNX01FTU9SWSkgKQo+Pj4+ICsgICAgewo+Pj4+ICsg
ICAgICAgIHByaW50aygibnMxNjU1MDogQWRkcmVzcyBzcGFjZSB0eXBlIGlzIG5vdCBtbWlvXG4i
KTsKPj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+PiArICAgIH0KPj4+Cj4+PiBUaGUg
c3BhY2VfaWQgZmllbGQgcXVhbGlmaWVzIHRoZSBhZGRyZXNzIG9uZSwgaS5lLiB3aGV0aGVyIGEg
dmFsdWUgb2YKPj4+IHplcm8gY2FuIHNlbnNpYmx5IG1lYW4gImRpc2FibGVkIiBkZXBlbmRzIG9u
IHRoZSBhZGRyZXNzIHNwYWNlLiBIZW5jZQo+Pj4gbG9naWNhbGx5IHRoZSBhZGRyZXNzIHNwYWNl
IGNoZWNrIHNob3VsZCBjb21lIGZpcnN0Lgo+Pj4KPj4+IFRoaXMgaXMgdGhlIGxhc3QgdGhpbmcg
SSdkIGxpa2UgdG8gc2VlIGNoYW5nZWQuIEkgd29uJ3QgZ2l2ZSB0aGUKPj4+IHBhdGNoIG15IGFj
ayB0aG91Z2gsIGFzIEkgdGhpbmsgaXQgc2hvdWxkIGJlIGFuIEFybSBtYWludGFpbmVyIHRvIGFj
awo+Pj4gaXQuCj4+Cj4+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+
Pgo+PiBBbHRob3VnaCwgYSByZXZpZXdlZC1ieSB0YWcgZnJvbSB5b3Ugd291bGQgYmUgbmljZSBh
cyB5b3UgZGlkIG1vc3Qgb2YgCj4+IHRoZSByZXZpZXcgZm9yIHRoaXMgcGF0Y2guCj4gCj4gV2Vs
bCwgdG8gY2xhcmlmeSAtIHRoaXMgaXMgb25lIG9mIHRoZSB2ZXJ5IGZldyAoYWZhaWN0KSBjYXNl
cyB3aGVyZSBvdXIKPiBSLWIgaW1wbHlpbmcgQS1iICh3aGVuIHBlb3BsZSBhcmUgZW50aXRsZWQg
dG8gYWNrIHRoZSByZXNwZWN0aXZlIGNvZGUpCj4gZ2V0cyBpbiB0aGUgd2F5LiBJZiB0aGlzIHdh
c24ndCB0aGUgY2FzZSwgSSdkIGhhdmUgZ2l2ZW4gdGhlIGZvcm1lciwKPiBtYWtpbmcgaXQgY2xl
YXIgKGFsc28gbGF0ZXIgZnJvbSBqdXN0IGxvb2tpbmcgYXQgdGhlIHJlc3VsdGluZyBjb21taXQp
Cj4gdGhhdCB0aGUgKG9ubHkpIGFjayBjYW1lIGZyb20gYW4gQXJtIHBlcnNvbi4KCkkgd2lsbCBj
aGVjayB0aGUgYWRkcmVzcyBzcGFjZSBpbiB0aGUgdjUgYW5kIGFkZCB5b3VyIFItYi4KVGhhbmtz
IQoKQmVzdCBSZWdhcmRzLApXZWkKCj4gCj4gSmFuCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
