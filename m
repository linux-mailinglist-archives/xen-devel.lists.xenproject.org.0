Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D195CF8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 13:12:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i021C-0007HV-1j; Tue, 20 Aug 2019 11:09:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYQB=WQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i021A-0007HQ-HI
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 11:09:36 +0000
X-Inumbo-ID: fc6d3e78-c33a-11e9-8bf7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fc6d3e78-c33a-11e9-8bf7-12813bfff9fa;
 Tue, 20 Aug 2019 11:09:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06D2A344;
 Tue, 20 Aug 2019 04:09:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36F923F706;
 Tue, 20 Aug 2019 04:09:31 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-3-sstabellini@kernel.org>
 <17051895-1517-94b5-7ab9-4fb802251d8f@arm.com>
 <alpine.DEB.2.21.1908191552270.20094@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f9c48dd8-7fba-8268-ef25-29222547b39d@arm.com>
Date: Tue, 20 Aug 2019 12:09:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908191552270.20094@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/6] xen/arm: assign devices to boot
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
 Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDIwLzA4LzIwMTkgMDA6MjAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBGcmksIDkgQXVnIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgU3RlZmFu
bywKPj4KPj4gT24gOC85LzE5IDEyOjEyIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+
PiBTY2FuIHRoZSB1c2VyIHByb3ZpZGVkIGR0YiBmcmFnbWVudCBhdCBib290LiBGb3IgZWFjaCBk
ZXZpY2Ugbm9kZSwgbWFwCj4+PiBtZW1vcnkgdG8gZ3Vlc3RzLCBhbmQgcm91dGUgaW50ZXJydXB0
cyBhbmQgc2V0dXAgdGhlIGlvbW11Lgo+Pj4KPj4+IFRoZSBpb21tdSBpcyBzZXR1cCBieSBwYXNz
aW5nIHRoZSBub2RlIG9mIHRoZSBkZXZpY2UgdG8gYXNzaWduIG9uIHRoZQo+Pj4gaG9zdCBkZXZp
Y2UgdHJlZS4gVGhlIHBhdGggaXMgc3BlY2lmaWVkIGluIHRoZSBkZXZpY2UgdHJlZSBmcmFnbWVu
dCBhcwo+Pj4gdGhlICJ4ZW4scGF0aCIgc3RyaW5nIHByb3BlcnR5Lgo+Pj4KPj4+IFRoZSBtZW1v
cnkgcmVnaW9uIHRvIHJlbWFwIGlzIHNwZWNpZmllZCBieSB0aGUgInhlbixyZWciIHByb3BlcnR5
Lgo+Pj4gKFBlcmhhcHMgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gdXNlICJyYW5nZSIgaW5zdGVh
ZCBvZiAieGVuLHJlZ3MiLiBUaGlzCj4+Cj4+IHMveGVuLHJlZ3MveGVuLHJlZy8KPj4KPj4gQnV0
IEkgZG9uJ3Qgc2VlIGhvdyB5b3UgY291bGQgdXNlIHJhbmdlIGhlcmUuLi4gVGhpcyBpcyBmb3Ig
dHJhbnNsYXRpb24KPj4gYWRkcmVzcyBiZXR3ZWVuIHR3byBhZGRyZXNzLXNwYWNlLgo+IAo+IEkn
bGwgcmVtb3ZlIHRoZSBjb21tZW50Cj4gCj4gCj4+PiBpcyBzb21ldGhpbmcgdG8gaW52ZXN0aWdh
dGUuKQo+Pj4KPj4+IFRoZSBpbnRlcnJ1cHRzIGFyZSB0YWtlbiBmcm9tIHRoZSBob3N0IGRldmlj
ZSB0cmVlIGNvcnJlc3BvbmRpbmcgbm9kZS4KPj4+IFRvIG1hcCB0aGUgaW50ZXJydXB0IGNhbGwg
aGFuZGxlX2ludGVycnVwdHMsIHdoaWNoIGlzIHNoYXJlZCB3aXRoIHRoZQo+Pj4gZXhpc3Rpbmcg
ZG9tMCBwYXRoLgo+Pj4KPj4+IEFkZCBhIGludGVycnVwdC1wYXJlbnQgcHJvcGVydHkgYXV0b21h
dGljYWxseSB0byB0aGUgZ3Vlc3QgZGV2aWNlIHRyZWUKPj4+IHdoZW4gdGhlIGludGVycnVwdC1w
YXJlbnQgc2hvdWxkIGJlIHRoZSBHSUMuIENvcHkgb3ZlciB0aGUgaW50ZXJydXB0Cj4+PiBwcm9w
ZXJ0eSBmcm9tIHRoZSBob3N0IGRldmljZSB0cmVlIG5vZGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+Pj4gLS0tCj4+PiBD
aGFuZ2VzIGluIHYzOgo+Pj4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4+PiAtIHJlbW92ZSBz
dXBlcmZsdW91cyBjYXN0Cj4+PiAtIG1lcmdlIGNvZGUgd2l0aCB0aGUgY29weSBjb2RlCj4+PiAt
IGFkZCBpbnRlcnJ1cC1wYXJlbnQKPj4+IC0gZGVtb3ZlIGRlcHRoID4gMiBjaGVjawo+Pj4gLSBy
ZXVzZSBjb2RlIGZyb20gaGFuZGxlX2ludGVycnVwdHMKPj4+IC0gY29weSBpbnRlcnJ1cHRzIGZy
b20gaG9zdCBkdAo+Pj4KPj4+IENoYW5nZXMgaW4gdjI6Cj4+PiAtIHJlbmFtZSAicGF0aCIgdG8g
InhlbixwYXRoIgo+Pj4gLSBncmFtbWFyIGZpeAo+Pj4gLSB1c2UgZ2FkZHJfdG9fZ2ZuIGFuZCBt
YWRkcl90b19tZm4KPj4+IC0gcmVtb3ZlIGRlcHRoIDw9IDIgbGltaXRhdGlvbiBpbiBzY2Fubmlu
ZyB0aGUgZHRiIGZyYWdtZW50Cj4+PiAtIGludHJvZHVjZSBhbmQgcGFyc2UgeGVuLHJlZwo+Pj4g
LSBjb2RlIHN0eWxlCj4+PiAtIHN1cHBvcnQgbW9yZSB0aGFuIG9uZSBpbnRlcnJ1cHQgcGVyIGRl
dmljZQo+Pj4gLSBzcGVjaWZ5IG9ubHkgdGhlIEdJQyBpcyBzdXBwb3J0ZWQKPj4+IC0tLQo+Pj4g
ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+PiBpbmRleCA3MGJjZGM0NDlkLi4wMDU3YTUwOWQxIDEw
MDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+PiArKysgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4+IEBAIC0xNzEyLDYgKzE3MTIsOSBAQCBzdGF0aWMg
aW50IF9faW5pdCBoYW5kbGVfcHJvcGVydGllcyhzdHJ1Y3QgZG9tYWluICpkLAo+Pj4gdm9pZCAq
ZmR0LCBjb25zdCB2b2lkICpwZmQKPj4+ICAgIHsKPj4+ICAgICAgICBpbnQgcHJvcG9mZiwgbmFt
ZW9mZiwgcjsKPj4+ICAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOwo+Pj4g
KyAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGU7Cj4+PiArICAgIGNvbnN0IF9fYmUzMiAq
Y2VsbDsKPj4+ICsgICAgaW50IGksIGxlbjsKPj4KPj4gQWdhaW4gYW55IHZhcmlhYmxlIHRoYXQg
Y2FuJ3QgYmUgbmVnYXRpdmUgc2hvdWxkIGJlIHVuc2lnbmVkLgo+IAo+IE9LCj4gCj4gCj4+PiAg
ICAgICAgICBmb3IgKCBwcm9wb2ZmID0gZmR0X2ZpcnN0X3Byb3BlcnR5X29mZnNldChwZmR0LCBu
b2Rlb2ZmKTsKPj4+ICAgICAgICAgICAgICBwcm9wb2ZmID49IDA7Cj4+PiBAQCAtMTcyNiw2ICsx
NzI5LDY5IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9wcm9wZXJ0aWVzKHN0cnVjdCBkb21h
aW4gKmQsCj4+PiB2b2lkICpmZHQsIGNvbnN0IHZvaWQgKnBmZAo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHByb3AtPmRhdGEsIGZkdDMyX3RvX2NwdShwcm9wLT5sZW4pKTsKPj4+ICAg
ICAgICAgICAgaWYgKCByICkKPj4+ICAgICAgICAgICAgICAgIHJldHVybiByOwo+Pj4gKwo+Pj4g
KyAgICAgICAgaWYgKCBzdHJjbXAoInhlbixyZWciLCBmZHRfc3RyaW5nKHBmZHQsIG5hbWVvZmYp
KSA9PSAwICkKPj4KPj4gVGhpcyBzaG91bGQgYmUgZHRfcHJvcF9jbXAuIEJ1dCB0aGlzIHByb3Bl
cnR5IHNob3VsZCBub3QgYmUgcGFydCBvZiB0aGUgZ3Vlc3QKPj4gRFRCIGFmdGVyd2FyZHMuCj4g
Cj4gR29vZCBwb2ludCEKPiAKPiAKPj4gTGFzdGx5LCBhIGJpdCBvZiBkb2N1bWVudGF0aW9uIHdv
dWxkIGJlIG5pY2UuCj4gCj4gRG8geW91IG1lYW4gYW4gaW4tY29kZSBjb21tZW50LCBvciBhIGRv
Y3VtZW50IHNvbWV3aGVyZT8KCmluLWNvZGUgY29tbWVudC4gVGhpcyBpcyBub3QgYSBuZXcgcmVx
dWVzdCBmcm9tIG15IHNpZGUsIHRoZSBjb2RlIHNob3VsZCBiZSAKZWl0aGVyIHNlbGYtZXhwbGFp
bmVkIG9yIGNvbnRhaW4gaW4tY29kZSBjb21tZW50IHRvIHVuZGVyc3RhbmQgaXQuCgpIYXZlIGEg
bG9vayBhdCB3cml0ZV9wcm9wZXJ0aWVzKCkgZm9yIGV4YW1wbGUuCgo+IAo+IAo+Pj4gKyAgICAg
ICAgewo+Pj4gKyAgICAgICAgICAgIHBhZGRyX3QgbXN0YXJ0LCBzaXplLCBnc3RhcnQ7Cj4+PiAr
ICAgICAgICAgICAgY2VsbCA9IChjb25zdCBfX2JlMzIgKilwcm9wLT5kYXRhOwo+Pj4gKyAgICAg
ICAgICAgIGxlbiA9IGZkdDMyX3RvX2NwdShwcm9wLT5sZW4pIC8KPj4+ICsgICAgICAgICAgICAg
ICAgKChhZGRyZXNzX2NlbGxzKjIgKyBzaXplX2NlbGxzKSAqIHNpemVvZiAodTMyKSk7Cj4+PiAr
Cj4+PiArICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBsZW47IGkrKyApCj4+PiArICAgICAg
ICAgICAgewo+Pj4gKyAgICAgICAgICAgICAgICBtc3RhcnQgPSBkdF9uZXh0X2NlbGwoYWRkcmVz
c19jZWxscywgJmNlbGwpOwo+Pj4gKyAgICAgICAgICAgICAgICBzaXplID0gZHRfbmV4dF9jZWxs
KHNpemVfY2VsbHMsICZjZWxsKTsKPj4KPj4gUGxlYXNlIHVzZSBkZXZpY2VfZ2V0X3JlZyBoZXJl
Lgo+IAo+IE9LIChkZXZpY2VfdHJlZV9nZXRfcmVnKQo+IAo+IAo+Pj4gKyAgICAgICAgICAgICAg
ICBnc3RhcnQgPSBkdF9uZXh0X2NlbGwoYWRkcmVzc19jZWxscywgJmNlbGwpOwo+Pj4gKwo+Pj4g
KyAgICAgICAgICAgICAgICByID0gZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoZCwgZ2FkZHJfdG9f
Z2ZuKGdzdGFydCksCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKG1z
dGFydCksCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X29yZGVyX2Zyb21fYnl0ZXMo
c2l6ZSksCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgcDJtX21taW9fZGlyZWN0X2Rldik7
Cj4+Cj4+IFRoZSBpbmRlbnRhdGlvbiBpcyB3cm9uZy4KPiAKPiBJJ2xsIGZpeAo+IAo+IAo+Pj4g
KyAgICAgICAgICAgICAgICBpZiAoIHIgPCAwICkKPj4+ICsgICAgICAgICAgICAgICAgewo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLAo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIG1hcCAlIlBSSXBhZGRyIiB0byB0aGUgZ3Vlc3QK
Pj4+IGF0JSJQUklwYWRkciJcbiIsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1z
dGFydCwgZ3N0YXJ0KTsKPj4+ICsgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+
Pj4gKyAgICAgICAgICAgICAgICB9Cj4+PiArICAgICAgICAgICAgfQo+Pj4gKyAgICAgICAgfQo+
Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCBzdHJjbXAoInhlbixwYXRoIiwgZmR0X3N0cmluZyhwZmR0
LCBuYW1lb2ZmKSkgPT0gMCApCj4+Cj4+IFNhbWUgcmVtYXJrIGFzIGZvciAieGVuLHJlZyIuCj4g
Cj4gT0sKPiAKPiAKPj4+ICsgICAgICAgIHsKPj4+ICsgICAgICAgICAgICBub2RlID0gZHRfZmlu
ZF9ub2RlX2J5X3BhdGgocHJvcC0+ZGF0YSk7Cj4+PiArICAgICAgICAgICAgaWYgKCBub2RlICE9
IE5VTEwgKQo+Pj4gKyAgICAgICAgICAgICAgICByID0gaW9tbXVfYXNzaWduX2R0X2RldmljZShk
LCBub2RlKTsKPj4+ICsgICAgICAgICAgICBlbHNlCj4+PiArICAgICAgICAgICAgewo+Pj4gKyAg
ICAgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsICJDb3VsZG4ndCBmaW5kIG5vZGUgJXMg
aW4gaG9zdF9kdCFcbiIsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgKGNoYXIgKilwcm9w
LT5kYXRhKTsKPj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArICAgICAg
ICAgICAgfQo+Pj4gKwo+Pj4gKyAgICAgICAgICAgIHIgPSBoYW5kbGVfaW50ZXJydXB0cyhkLCBu
b2RlLCB0cnVlKTsKPj4+ICsgICAgICAgICAgICBpZiAoIHIgPCAwICkKPj4+ICsgICAgICAgICAg
ICAgICAgcmV0dXJuIHI7Cj4+PiArICAgICAgICAgICAgaWYgKCByID4gMCApCj4+PiArICAgICAg
ICAgICAgewo+Pj4gKyAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaW50bGVuOwo+Pj4gKyAg
ICAgICAgICAgICAgICBjb25zdCB1MzIqIGludHNwZWM7Cj4+Cj4+IEkgZG9uJ3QgdGhpbmsgdGhl
IGNvZGUgYmVsb3cgaXMgY29ycmVjdC4gRm9yIGEgZmlyc3QsIHlvdXIgaW1wbGVtZW50YXRpb24g
b2YKPj4gaGFuZGxlX2ludGVycnVwdHMgaXMgbm90IHJpZ2h0IChzZWUgbXkgY29tbWVudHMgb24g
dGhlIHBhdGNoIHdoZXJlIHlvdSBhZGRlZAo+PiB0aGUgZnVuY3Rpb24pLiBUaGVuIHlvdSBtYXkg
YmUgaGVyZSBldmVuIGlmIG5vIGludGVycnVwdHMgcHJvcGVydHkuIFNvIHRoZQo+PiBjb2RlIGJl
bG93IHdpbGwgZmFpbCB0byBjb3B5IHRob3NlIG5vZGVzLgo+IAo+IEkgZG9uJ3QgZ2V0IHRoZSBs
YXN0IHNlbnRlbmNlOiAiVGhlbiB5b3UgbWF5IGJlIGhlcmUgZXZlbiBpZiBubwo+IGludGVycnVw
dHMgcHJvcGVydHkuIFNvIHRoZSBjb2RlIGJlbG93IHdpbGwgZmFpbCB0byBjb3B5IHRob3NlIG5v
ZGVzLiIKPiBXaHkgdGhlIGNvZGUgd291bGQgZmFpbCB0byBjb3B5IHRob3NlIG5vZGVzPyBXaGlj
aCBub2Rlcz8KCllvdXIgYXNzdW1wdGlvbiBoZXJlIGlzIGlmIGhhbmRsZV9pbnRlcnJ1cHRzIHJl
dHVybiBhIHN0cmljdGx5IHBvc2l0aXZlIGludGVnZXIgCihpLmUgc29tZSBpbnRlcnJ1cHRzIGhh
dmUgYmVlbiByb3V0ZWQpLCB0aGVuIHRoZSAiaW50ZXJydXB0cyIgcHJvcGVydHkgZXhpc3RzLgoK
QnV0IHRoaXMgaXMgZGVmaW5pdGVseSBub3QgY29ycmVjdCwgWGVuIGlzIGFibGUgdG8gaGFuZGxl
ICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiAKc28gaWYgeW91IGhhdmUgYSBub2RlIHVzaW5nIHRoYXQg
cHJvcGVydHkgYW5kIHVzaW5nIEdJQyBpbnRlcnJ1cHRzLiBUaGVuIHlvdSAKd291bGQgYmUgZXhl
Y3V0aW5nIHRoaXMgcGF0aC4KClNvIGlmIHRoZSBwcm9wZXJ0eSAiaW50ZXJydXB0cy1leHRlbmRl
ZCIgaXMgdXNlZCwgdGhlbiB0aGUgY29kZSBiZWxvdyB3aWxsIGZhaWwgCmFzIHRoZSBwcm9wZXJ0
eSAiaW50ZXJydXB0cyIgaXMgbm90IHByZXNlbnQuCgo+IAo+IAo+Pj4gKwo+Pj4gKyAgICAgICAg
ICAgICAgICAvKiBnZW5lcmF0ZSBpbnRlcnJ1cHQtcGFyZW50IHRvIHBvaW50IHRvIHRoZSB2aXJ0
dWFsIEdJQyAqLwo+Pj4gKyAgICAgICAgICAgICAgICByID0gZmR0X3Byb3BlcnR5X3UzMihmZHQs
ICJpbnRlcnJ1cHQtcGFyZW50IiwKPj4+IEdVRVNUX1BIQU5ETEVfR0lDKTsKPj4gIEZyb20geW91
ciBpbXBsZW1lbnRhdGlvbiBvZiBoYW5kbGVfaW50ZXJydXB0cygpLCB0aGVyZSBhcmUgbm8gcHJv
bWlzZSB5b3UKPj4gd291bGQgYmUgaGVyZSB3aXRoIGp1c3QgYSBHSUMgaW50ZXJydXB0cy4gWW91
IG1heSBhbHNvIG5lZWQgdG8gY29weSBhbnkKPj4gaW50ZXJydXB0cyBwcm9wZXJ0eSBmb3Igbm9k
ZSB0aGF0IGRvZXMgbm90IGJlbG9uZyB0byB0aGUgR0lDLgo+IAo+IExldCdzIHNheSB0aGF0IHdl
IGhhdmUgYSBtaXggb2YgR0lDIGFuZCBub24tR0lDIGludGVycnVwdHMgYXQgdGhlIG5vZGUKPiB3
aXRoIHhlbixwYXRoIGFuZCB4ZW4scmVnLiBMZXQncyBhbHNvIHNheSB0aGF0IHdlIGFyZSBpbiBh
IHJlZ3VsYXIKPiBpbnRlcnJ1cHQtcGFyZW50L2ludGVycnVwdHMgY29uZmlndXJhdGlvbiAobm8g
aW50ZXJydXB0cy1leHRlbmRlZCwgc2VlCj4gYmVsb3cpLiBJcyBpdCBwb3NzaWJsZSB3aXRob3V0
IGludGVycnVwdHMtZXh0ZW5kZWQ/IEhvdyB3b3VsZCBpdCBsb29rCj4gbGlrZT8KCkl0IGlzIG5v
dCBwb3NzaWJsZSB0byBoYXZlIGEgbm9kZSB1c2luZyBhIG1peCBvZiBHSUMgYW5kIG5vbi1HSUMg
aW50ZXJydXB0cyAKd2l0aG91dCB0aGUgcHJvcGVydHkgImludGVycnVwdHMtZXh0ZW5kZWQiLgoK
SG93ZXZlciwgdGhpcyBpcyBub3QgbXkgcG9pbnQgaGVyZS4gTXkgcG9pbnQgaXMgdGhlIHByZXNl
bmNlIG9mIHhlbixwYXRoIGRvZXMgCm5vdCBtZWFuIHRoZSBub2RlIHdpbGwgYmUgdXNpbmcgR0lD
IGludGVycnVwdHMuIFNvIGJsaW5kbHkgc2V0dGluZyAKImludGVycnVwdC1wYXJlbnQiIHRvIHBv
aW50IHRvIHRoZSBHSUMgbm9kZSBpcyB3cm9uZy4KCj4gCj4gCj4+PiArICAgICAgICAgICAgICAg
IGlmICggciApCj4+PiArICAgICAgICAgICAgICAgICAgICByZXR1cm4gcjsKPj4+ICsKPj4+ICsg
ICAgICAgICAgICAgICAgLyogY29weSBpbnRlcnJ1cHRzL2ludGVycnVwdHMtZXh0ZW5kZWQgZnJv
bSB0aGUgaG9zdCBEVAo+Pj4gbm9kZSAqLwo+Pj4gKyAgICAgICAgICAgICAgICBpbnRzcGVjID0g
ZHRfZ2V0X3Byb3BlcnR5KG5vZGUsICJpbnRlcnJ1cHRzIiwgJmludGxlbik7Cj4+PiArICAgICAg
ICAgICAgICAgIGlmICggaW50c3BlYyA9PSBOVUxMICkKPj4+ICsgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUZBVUxUOwo+Pgo+PiBZb3UgZG9uJ3QgaGFuZGxlIGludGVycnVwdHMtZXh0ZW5k
ZWQgbm9yIGludGVycnVwdC1tYXBwaW5nLgo+IAo+IEkgd2FzIHdvbmRlcmluZyB3aGF0IHRvIGRv
IGFib3V0IHRoYXQuIEZvciBub3csIEkgYWRkZWQgYSBub3RlIGluIHRoZQo+IGxhc3QgcGF0Y2gg
b2YgdGhlIHNlcmllcywgdGhlIG9uZSBhZGRpbmcgaW5mbyB0byB0aGUgZG9jLiBBbHJlYWR5IGlu
Cj4gdGhpcyB2MyBzZXJpZXM6CgpNeSBwb2ludCBoZXJlIGlzIHlvdXIgaW4tY29kZSBjb21tZW50
IGRvZXMgbm90IG1hdGNoIHRoZSBjb2RlLiBCdXQuLi4KCj4gCj4gIkZvciBHSUMgaW50ZXJydXB0
cywgb25seSB0aGUgaW50ZXJydXB0cyBwcm9wZXJ0eSBpcyBjdXJyZW50bHkKPiBzdXBwb3J0ZWQs
IG5vdCB0aGUgbmV3ZXIgaW50ZXJydXB0cy1leHRlbmRlZCBwcm9wZXJ0eS4iCgouLi4gSSBkb24n
dCB0aGluayB0aGlzIHNlcmllcyBzaG91bGQgYmUgbWVyZ2VkIHdpdGggImludGVycnVwdHMtZXh0
ZW5kZWQiIG5vdCAKaGFuZGxlZC4gSSBkb24ndCB0aGluayB0aGlzIGlzIHJpZ2h0IHRvIHJlcXVl
c3QgdGhlIHVzZXIgdG8gZml4IGl0cyBkZXZpY2UtdHJlZSAKaW4gb3JkZXIgdG8gdGVzdCBwYXNz
dGhyb3VnaCBkb20wbGVzcy4KClRoZSBwcm9wZXJ0eSBpcyBhbHNvIG5vdCB2ZXJ5IGRpZmZpY3Vs
dCB0byBoYW5kbGUgYXMgdGhpcyBpcyBjb3B5aW5nIHRoZSAKcHJvcGVydHkgb3Zlci4KClJlZ2Fy
ZGluZyB0aGUgcHJvcGVydHkgImludGVycnVwdC1tYXAiIChhbmQgaW50ZXJydXB0LW1hcC1tYXNr
KSwgaXQgaXMgdXNlZCBmb3IgCmJ1cyAoaS5lIFBDSS4uLikgc28gSSB0aGluayBpdCBtYXkgbm90
IGJlIGNyaXRpY2FsIHlldC4KCkhvd2V2ZXIsIGl0IG1hZGUgbWUgcmVhbGl6ZWQgdGhhdCB0aGUg
bm9kZSB5b3UgYXJlIHRyeWluZyB0byBwYXNzdGhyb3VnaCBtYXkgYmUgCnVuZGVyIGEgYnVzLiBU
aGF0IGJ1cyBtYXkgaGF2ZSBhbiAiaW50ZXJydXB0LW1hcCIgc28gdGhlIHByb3BlcnR5ICJpbnRl
cnJ1cHRzIiAKd2lsbCBub3QgY29udGFpbiBkaXJlY3RseSBHSUMgaW50ZXJydXB0cy4gWW91IGNh
biByZWxhdGUgdGhpcyB0byB0aGUgd2F5IG1lbW9yeSAKcmVnaW9uIGFyZSB0cmFuc2xhdGVkLgoK
U28gdGhpcyBtZWFucyB0byBjb3B5aW5nIG92ZXIgImludGVycnVwdHMiIGRvZXMgbm90IGxvb2sg
dG8gYmUgYSBnb29kIHNvbHV0aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
