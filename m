Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580FBDB0D7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:14:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7S1-0001ZC-U6; Thu, 17 Oct 2019 15:12:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hugR=YK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iL7S0-0001Z7-4g
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:12:28 +0000
X-Inumbo-ID: 87d1d52c-f0f0-11e9-93d3-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87d1d52c-f0f0-11e9-93d3-12813bfff9fa;
 Thu, 17 Oct 2019 15:12:27 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C4A8D757C5
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 15:12:26 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id h4so1105001wrx.15
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6URh6sfF5SY+GjIiIeygv7Pue70RSRcvYor9Y98FLzs=;
 b=eUUiQpuNCn/tbVyKJmv2BTuazVjTlt4ZtqkoJ4/lVbLqjEsPBe3Dpo0FOseyh1of/A
 GwkGWpGyj4yhVz56EymXF/EOHaSsICpgV0ehI6BatbcoaSz667KvdHqCxZpzhLlq8Jl7
 8oztBD2GX2CqhdXgridpgGsSoaMOjpYh7wHli6v3DlSFFo9Rv17snSdkcYEJ5Ap0NN6C
 m8DoOz9PAebn+SEpSscJ0GTHXFtwqrR98Sr2jJAkRGl2Jlr7F/IJT7htCBZTMfDSuUI2
 ghH4CYvSvUAIN8TGfEKJ+7cx26bUyyhX7AZ5ZwAt7/Vc4oQZEs3BDJnNVvMmfs6zYEBn
 dA+Q==
X-Gm-Message-State: APjAAAUddLTp2yA2icZqSko3aT1p7FbM1ByuTilxLpIGwCpr3013NmnI
 hlbqaASeKLaGH/FTY212XsSHM0AqyaAhA+R62xw3a9N+B1sqkZS8tHxBWTRWVNkTXGJhoDYjsUq
 62Gm2LSMQppanOVUcC6tazdoPV4A=
X-Received: by 2002:a5d:6506:: with SMTP id x6mr3498644wru.366.1571325145506; 
 Thu, 17 Oct 2019 08:12:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySU6DS/RqeRVbBcOi9QO31rcYMYaBXaBuv0ezlv/Z4bgIg5NWR+I6f0LoIGcDuKW0FQqw/eg==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr3498623wru.366.1571325145314; 
 Thu, 17 Oct 2019 08:12:25 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id a3sm2711161wmj.35.2019.10.17.08.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 08:12:24 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-5-philmd@redhat.com>
 <CAL1e-=jOiMe2--=ht0Wgwh0a_At=sDhUzX7EkNU86nPt230a-g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ff0603bb-ffef-ca67-6d0f-9e7a36abaa7f@redhat.com>
Date: Thu, 17 Oct 2019 17:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=jOiMe2--=ht0Wgwh0a_At=sDhUzX7EkNU86nPt230a-g@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 04/32] mc146818rtc: Move RTC_ISA_IRQ
 definition
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTcvMTkgNTowMiBQTSwgQWxla3NhbmRhciBNYXJrb3ZpYyB3cm90ZToKPiAKPiAKPiBP
biBUdWVzZGF5LCBPY3RvYmVyIDE1LCAyMDE5LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhp
bG1kQHJlZGhhdC5jb20gCj4gPG1haWx0bzpwaGlsbWRAcmVkaGF0LmNvbT4+IHdyb3RlOgo+IAo+
ICAgICBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnIDxtYWls
dG86ZjRidWdAYW1zYXQub3JnPj4KPiAKPiAgICAgVGhlIElTQSBkZWZhdWx0IG51bWJlciBmb3Ig
dGhlIFJUQyBkZXZpY2VzIGlzIG5vdCByZWxhdGVkIHRvIGl0cwo+ICAgICByZWdpc3RlcnMgbmVp
dGhlci4gTW92ZSB0aGlzIGRlZmluaXRpb24gdG8gImh3L3RpbWVyL21jMTQ2ODE4cnRjLmgiLgo+
IAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJl
ZGhhdC5jb20KPiAgICAgPG1haWx0bzpwaGlsbWRAcmVkaGF0LmNvbT4+Cj4gICAgIC0tLQo+ICAg
ICAgwqBpbmNsdWRlL2h3L3RpbWVyL21jMTQ2ODE4cnRjLmjCoCDCoCDCoCB8IDIgKysKPiAgICAg
IMKgaW5jbHVkZS9ody90aW1lci9tYzE0NjgxOHJ0Y19yZWdzLmggfCAyIC0tCj4gICAgICDCoHRl
c3RzL3J0Yy10ZXN0LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDEgKwo+ICAgICAg
wqAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiAK
PiBQaGlsaXBwZSwgZG8gdGhpcyBhbmQgcmVsYXRlZCBwYXRjaGVzIGNsYXNoIHdpdGggeW91ciBy
ZWNlbnQgCj4gcmVvcmdhbml6YXRpb24gb2YgdGltZXJzL3J0Y3M/CgpJbmRlZWQsIGJ1dCBzaW5j
ZSBiaWcgYm9yaW5nIHNlcmllcyB0YWtlIHRpbWUgdG8gZ2V0IG1lcmdlZCwgSSBwcmVmZXIgdG8g
CmhhdmUgaXQgcmV2aWV3ZWQgYWxyZWFkeSwgdGhlbiBJJ2xsIHJlYmFzZSBhbmQgZml4IGNvbmZs
aWN0cyBvbiB0aGUgb25lIAp0aGF0IGlzbid0IG1lcmdlZC4KClRoYW5rcyBmb3IgcmV2aWV3aW5n
IHRoZSBvdGhlciBwYXRjaGVzIQoKPiBBLgo+IAo+ICAgICBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9o
dy90aW1lci9tYzE0NjgxOHJ0Yy5oCj4gICAgIGIvaW5jbHVkZS9ody90aW1lci9tYzE0NjgxOHJ0
Yy5oCj4gICAgIGluZGV4IDBmMWM4ODZlNWIuLjE3NzYxY2Y2ZDkgMTAwNjQ0Cj4gICAgIC0tLSBh
L2luY2x1ZGUvaHcvdGltZXIvbWMxNDY4MThydGMuaAo+ICAgICArKysgYi9pbmNsdWRlL2h3L3Rp
bWVyL21jMTQ2ODE4cnRjLmgKPiAgICAgQEAgLTM5LDYgKzM5LDggQEAgdHlwZWRlZiBzdHJ1Y3Qg
UlRDU3RhdGUgewo+ICAgICAgwqAgwqAgwqBRTElTVF9FTlRSWShSVENTdGF0ZSkgbGluazsKPiAg
ICAgIMKgfSBSVENTdGF0ZTsKPiAKPiAgICAgKyNkZWZpbmUgUlRDX0lTQV9JUlEgOAo+ICAgICAr
Cj4gICAgICDCoElTQURldmljZSAqbWMxNDY4MThfcnRjX2luaXQoSVNBQnVzICpidXMsIGludCBi
YXNlX3llYXIsCj4gICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBxZW11X2lycSBpbnRlcmNlcHRfaXJxKTsKPiAgICAgIMKgdm9pZCBydGNfc2V0X21lbW9y
eShJU0FEZXZpY2UgKmRldiwgaW50IGFkZHIsIGludCB2YWwpOwo+ICAgICBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9ody90aW1lci9tYzE0NjgxOHJ0Y19yZWdzLmgKPiAgICAgYi9pbmNsdWRlL2h3L3Rp
bWVyL21jMTQ2ODE4cnRjX3JlZ3MuaAo+ICAgICBpbmRleCBiZmJiNTdlNTcwLi42MzFmNzFjZmQ5
IDEwMDY0NAo+ICAgICAtLS0gYS9pbmNsdWRlL2h3L3RpbWVyL21jMTQ2ODE4cnRjX3JlZ3MuaAo+
ICAgICArKysgYi9pbmNsdWRlL2h3L3RpbWVyL21jMTQ2ODE4cnRjX3JlZ3MuaAo+ICAgICBAQCAt
MjcsOCArMjcsNiBAQAo+IAo+ICAgICAgwqAjaW5jbHVkZSAicWVtdS90aW1lci5oIgo+IAo+ICAg
ICAtI2RlZmluZSBSVENfSVNBX0lSUSA4Cj4gICAgIC0KPiAgICAgIMKgI2RlZmluZSBSVENfU0VD
T05EU8KgIMKgIMKgIMKgIMKgIMKgIMKgMAo+ICAgICAgwqAjZGVmaW5lIFJUQ19TRUNPTkRTX0FM
QVJNwqAgwqAgwqAgwqAxCj4gICAgICDCoCNkZWZpbmUgUlRDX01JTlVURVPCoCDCoCDCoCDCoCDC
oCDCoCDCoDIKPiAgICAgZGlmZiAtLWdpdCBhL3Rlc3RzL3J0Yy10ZXN0LmMgYi90ZXN0cy9ydGMt
dGVzdC5jCj4gICAgIGluZGV4IDYzMDliMGVmNmMuLjE4Zjg5NTY5MGYgMTAwNjQ0Cj4gICAgIC0t
LSBhL3Rlc3RzL3J0Yy10ZXN0LmMKPiAgICAgKysrIGIvdGVzdHMvcnRjLXRlc3QuYwo+ICAgICBA
QCAtMTUsNiArMTUsNyBAQAo+IAo+ICAgICAgwqAjaW5jbHVkZSAibGlicXRlc3Qtc2luZ2xlLmgi
Cj4gICAgICDCoCNpbmNsdWRlICJxZW11L3RpbWVyLmgiCj4gICAgICsjaW5jbHVkZSAiaHcvdGlt
ZXIvbWMxNDY4MThydGMuaCIKPiAgICAgIMKgI2luY2x1ZGUgImh3L3RpbWVyL21jMTQ2ODE4cnRj
X3JlZ3MuaCIKPiAKPiAgICAgIMKgI2RlZmluZSBVSVBfSE9MRF9MRU5HVEjCoCDCoCDCoCDCoCDC
oCDCoCg4ICogTkFOT1NFQ09ORFNfUEVSX1NFQ09ORCAvIDMyNzY4KQo+ICAgICAtLSAKPiAgICAg
Mi4yMS4wCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
