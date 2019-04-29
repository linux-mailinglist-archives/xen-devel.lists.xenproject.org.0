Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A0E6F1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:52:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8XO-00011F-8w; Mon, 29 Apr 2019 15:49:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8XN-000118-An
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:49:49 +0000
X-Inumbo-ID: 6a1f2642-6a96-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6a1f2642-6a96-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:49:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556552987; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=+7jsQGJwEacjF0UPzIbtniuxIx/kcdTZLL8x8wH1qHw=;
 b=r2GtUJtmtbvUSMSULZ34Dky83zcAZvp8p4slf6hhKEqi4ye10asCMWuK0Yb9W7XEXo5bae8N
 4Ddm6lcn9z5QqQOAuka4WEv6uoPRzs8QLbxxXgrVxK0Vle8I/SnBgUnJ/zAditx/nAVXtoV3
 bn4ETfZo4zVyo1pJ5/SF0EbrVVE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mxa.mailgun.org with ESMTP id 5cc71d1a.7f91c82a5bb0-smtp-out-n02;
 Mon, 29 Apr 2019 15:49:46 -0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id c12so16756563wrt.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 08:49:46 -0700 (PDT)
X-Gm-Message-State: APjAAAVCzgHOAGk12fo+y0AzMtQ7ApF3CjK4uR+Qdchn68lhH2e2zjBq
 ZS3+RAKoGBLpsZWIrXe2bx/M+aypFYxWHehK6yg=
X-Google-Smtp-Source: APXvYqzB9u2lEgJyZYj4Zod8Oz0U74AFmZjxlqlOzRz1GneqkIXZrcrMZ/uJPvB4AZSLWIGWOzcJ+9ke3H0UDEsicHQ=
X-Received: by 2002:a5d:6988:: with SMTP id g8mr8713281wru.117.1556552985551; 
 Mon, 29 Apr 2019 08:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-4-tamas@tklengyel.com>
 <5CC718F0020000780022A18A@prv1-mh.provo.novell.com>
In-Reply-To: <5CC718F0020000780022A18A@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 09:49:08 -0600
X-Gmail-Original-Message-ID: <CABfawhkMfBKh2XsPKM-WrbQ2qQWLGTxiUm2gwm7nQ8WTcNR-UA@mail.gmail.com>
Message-ID: <CABfawhkMfBKh2XsPKM-WrbQ2qQWLGTxiUm2gwm7nQ8WTcNR-UA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v3 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTozMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ID4gKysrIGIv
eGVuL2FyY2gveDg2L0tjb25maWcKPiA+IEBAIC0xNyw3ICsxNyw2IEBAIGNvbmZpZyBYODYKPiA+
ICAgICAgIHNlbGVjdCBIQVNfS0VYRUMKPiA+ICAgICAgIHNlbGVjdCBNRU1fQUNDRVNTX0FMV0FZ
U19PTgo+ID4gICAgICAgc2VsZWN0IEhBU19NRU1fUEFHSU5HCj4gPiAtICAgICBzZWxlY3QgSEFT
X01FTV9TSEFSSU5HCj4gPiAgICAgICBzZWxlY3QgSEFTX05TMTY1NTAKPiA+ICAgICAgIHNlbGVj
dCBIQVNfUEFTU1RIUk9VR0gKPiA+ICAgICAgIHNlbGVjdCBIQVNfUENJCj4gPiBAQCAtMTk4LDYg
KzE5NywxMyBAQCBjb25maWcgUFZfU0hJTV9FWENMVVNJVkUKPiA+ICAgICAgICAgZmlybXdhcmUs
IGFuZCB3aWxsIG5vdCBmdW5jdGlvbiBjb3JyZWN0bHkgaW4gb3RoZXIgc2NlbmFyaW9zLgo+ID4K
PiA+ICAgICAgICAgSWYgdW5zdXJlLCBzYXkgTi4KPiA+ICsKPiA+ICtjb25maWcgTUVNX1NIQVJJ
TkcKPiA+ICsgICAgYm9vbAo+ID4gKyAgICBkZWZhdWx0IG4KPiA+ICsgICAgZGVwZW5kcyBvbiBI
Vk0KPiA+ICsgICAgcHJvbXB0ICJYZW4gbWVtb3J5IHNoYXJpbmcgc3VwcG9ydCIgaWYgRVhQRVJU
ID0gInkiCj4gPiArCj4KPiBBcyBwZXIgYWxsIHRoZSBjb250ZXh0IGFib3ZlLCBwbGVhc2UgdXNl
IHByb3BlciAodGFiKSBpbmRlbnRhdGlvbi4KPiBBbHNvIHBsZWFzZSBvbWl0IHRoZSBwb2ludGxl
c3MgImRlZmF1bHQgbiIuIEFuZCB0aGVuIHRoZSAiYm9vbCIKPiBhbmQgInByb21wdCAuLi4iIGNh
biAoYW5kIGhlbmNlIHNob3VsZCkgYmUgY29tYmluZWQgaW50byBhCj4gc2luZ2xlIGxpbmUuCgpT
dXJlLgoKPgo+IEkgYWxzbyB3b25kZXIgd2hldGhlciB0aGlzIHNob3VsZG4ndCBiZSBpbiBjb21t
b24vS2NvbmZpZywgYnV0Cj4gdGhlbiBhZ2FpbiBpdCBjYW4gYmUgbW92ZWQgdGhlcmUgaWYgQXJt
IHdvdWxkIGV2ZXIgZ2Fpbgo+IG1lbS1zaGFyaW5nIHN1cHBvcnQuCgpJdCBpcyBjdXJyZW50bHkg
b25seSBzdXBwb3J0ZWQgZm9yIHg4NiBIVk0gZ3Vlc3RzLiBUaGVyZSBhcmUgbm8gcGxhbnMKZm9y
IGFkZGluZyBBUk0gc3VwcG9ydC4gSWYgYW5kIHdoZW4gdGhhdCBoYXBwZW5zLCBpdCBjb3VsZCBi
ZSBtb3ZlZCB0bwpjb21tb24uIEkgZG9uJ3QgZXhwZWN0IHRoYXQgd2lsbCBldmVyIGhhcHBlbi4K
Cj4KPiA+IEBAIC05OCw0ICsxMDAsMzMgQEAgdm9pZCBtZW1fc2hhcmluZ19pbml0KHZvaWQpOwo+
ID4gICAqLwo+ID4gIGludCByZWxpbnF1aXNoX3NoYXJlZF9wYWdlcyhzdHJ1Y3QgZG9tYWluICpk
KTsKPiA+Cj4gPiArI2Vsc2UKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBt
ZW1fc2hhcmluZ19nZXRfbnJfc2F2ZWRfbWZucyh2b2lkKQo+ID4gK3sKPiA+ICsgICAgcmV0dXJu
IDA7Cj4gPiArfQo+ID4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IG1lbV9zaGFyaW5nX2dl
dF9ucl9zaGFyZWRfbWZucyh2b2lkKQo+ID4gK3sKPiA+ICsgICAgcmV0dXJuIDA7Cj4gPiArfQo+
Cj4gSSBmb2xsb3cgeW91IGZvciB0aGVzZS4KPgo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IG1lbV9z
aGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGdmbiwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgZmxhZ3MpCj4g
PiArewo+ID4gKyAgICByZXR1cm4gMDsKPiA+ICt9Cj4KPiBCdXQgc2hvdWxkbid0IHRoaXMgb25l
IChqdXN0IGFzIGFuIGV4YW1wbGUsIHRoZXJlIG1heSBiZSBtb3JlCj4gYmVsb3cpIHJldHVybiAt
RU9QTk9UU1VQUD8KCkl0IHJlYWxseSBkb2Vzbid0IG1hdHRlci4gTm8gY2FsbGVyIGV2ZXIgcmVh
Y2hlcyB0aGlzIGZ1bmN0aW9uIHdoZW4KbWVtX3NoYXJpbmcgaXMgY29tcGlsZWQgb3V0IHNpbmNl
IGl0J3MgZ2F0ZWQgb24gdGhlIHBhZ2UgdHlwZSBiZWluZwpwMm1fcmFtX3NoYXJlZC4gWW91IGNh
bid0IHNldCB0aGF0IHBhZ2UgdHlwZSB3aGVuIHRoZSBtZW1vcC9kb21jdGwgdG8Kc2V0IGl0IGlz
IGdvbmUuCgo+Cj4gQW5kIGluIGdlbmVyYWwgLSBpZiB0aGVzZSBpbmxpbmUgZnVuY3Rpb25zIGFy
ZSBuZWVkZWQsIHNob3VsZG4ndAo+IGFsbCBvZiB0aGVtIChvciBhdCBsZWFzdCBzb21lKSBnYWlu
IEFTU0VSVF9VTlJFQUNIQUJMRSgpLCBhcyB3ZQo+IGRvIGVsc2V3aGVyZT8KClllcywgc2luY2Ug
dW5zaGFyZV9wYWdlIGlzIHVucmVhY2hhYmxlIGFkZGluZyB0aGF0IGFzc2VydCB3b3VsZCBiZQph
cHByb3ByaWF0ZS4gSXQgd291bGQgcHJvYmFibHkgYmUgYXBwcm9wcmlhdGUgZm9yIHRoZSBvdGhl
cnMgdG9vCihleGNlcHQgZ2V0X25yX3NhdmVkL3NoYXJlZF9tZm5zKS4KClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
