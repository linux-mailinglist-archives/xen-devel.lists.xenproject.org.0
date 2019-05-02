Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B89124AF
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 00:44:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMKOM-0001Ij-Ih; Thu, 02 May 2019 22:41:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bVeI=TC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMKOL-0001Ie-BE
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 22:41:25 +0000
X-Inumbo-ID: 69f682dd-6d2b-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69f682dd-6d2b-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 22:41:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556836884; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=4eHqJMxKfo/IaMAP3LLU5ZJXCaCyzcRv1wgfDgXZa4E=;
 b=PBO6eM+x4NhmKXUK/mZ6uazmup9wOeEZ11Fh0tIz5wx48izE51r6O23yeZVpi/mJQPZT2cYO
 SJR+SFuCoJDVAZ9ZogEHIr47aRSa0TSF80u9vJXnC5DMeS61fuGtn/4SCEmHXUMMQ7ZwCtuA
 8vaPaJ0YrZGMcozph4VIkDCpDh8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mxa.mailgun.org with ESMTP id 5ccb7213.7ff1d7c28930-smtp-out-n02;
 Thu, 02 May 2019 22:41:23 -0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e9so5516346wrc.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 15:41:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUjUGXyiUYKvRNbZSye+fkISw7iMVtNiWBWdpVnZpW7j5fLiV3A
 JexbFvgc11DYDA8wJFsHuhnLWbenByfbWg20Bg4=
X-Google-Smtp-Source: APXvYqwfLJ9fK+jJNZoCfQITHlZxV195/jTxwfoWW8pvViyem5z9GVB+jGeDLeBneNwJWym7Y5RcTcXTCUQKDBp2HMw=
X-Received: by 2002:adf:b645:: with SMTP id i5mr4632063wre.272.1556836881350; 
 Thu, 02 May 2019 15:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190502214203.17279-1-tamas@tklengyel.com>
In-Reply-To: <20190502214203.17279-1-tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 2 May 2019 16:40:43 -0600
X-Gmail-Original-Message-ID: <CABfawhkCizO=8Y2gsF=X1ppgGeaV0Trb7108awRsKOOYAYQjLA@mail.gmail.com>
Message-ID: <CABfawhkCizO=8Y2gsF=X1ppgGeaV0Trb7108awRsKOOYAYQjLA@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [PATCH v2] x86/vm_event: add gdtr_base to the
 vm_event structure
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAzOjQyIFBNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4KPiBSZWNlaXZpbmcgdGhpcyByZWdpc3RlciBpcyB1c2VmdWwg
Zm9yIGludHJvc3BlY3RpbmcgMzItYml0IFdpbmRvd3Mgd2hlbiB0aGUKPiBldmVudCBiZWluZyB0
cmFwcGVkIGhhcHBlbmVkIHdoaWxlIGluIHJpbmczLgo+Cj4gU2lnbmVkLW9mZi1ieTogVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IENjOiBSYXp2YW4gQ29qb2NhcnUgPHJj
b2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4gQ2M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+IENjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+IC0tLQo+IHYyOiBhZGQgZ2R0ciBsaW1pdAo+IC0tLQo+ICB4ZW4vYXJjaC94ODYv
dm1fZXZlbnQuYyAgICAgICB8IDYgKysrKysrCj4gIHhlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVu
dC5oIHwgNiArKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jIGIveGVu
L2FyY2gveDg2L3ZtX2V2ZW50LmMKPiBpbmRleCA1MWMzNDkzYjFkLi41MmMyYTcxZmEwIDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3Zt
X2V2ZW50LmMKPiBAQCAtMTc5LDYgKzE3OSwxMSBAQCBzdGF0aWMgdm9pZCB2bV9ldmVudF9wYWNr
X3NlZ21lbnRfcmVnaXN0ZXIoZW51bSB4ODZfc2VnbWVudCBzZWdtZW50LAo+ICAgICAgICAgIHJl
Zy0+ZXNfc2VsID0gc2VnLnNlbDsKPiAgICAgICAgICBicmVhazsKPgo+ICsgICAgY2FzZSB4ODZf
c2VnX2dkdHI6Cj4gKyAgICAgICAgcmVnLT5nZHRyX2Jhc2UgPSBzZWcuYmFzZTsKPiArICAgICAg
ICByZWctPmdkdHJfbGltaXQgPSBzZWcubGltaXQ7Cj4gKyAgICAgICAgYnJlYWs7Cj4gKwo+ICAg
ICAgZGVmYXVsdDoKPiAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiAgICAgIH0KPiBA
QCAtMjM4LDYgKzI0Myw3IEBAIHZvaWQgdm1fZXZlbnRfZmlsbF9yZWdzKHZtX2V2ZW50X3JlcXVl
c3RfdCAqcmVxKQo+ICAgICAgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyKHg4Nl9zZWdf
c3MsICZyZXEtPmRhdGEucmVncy54ODYpOwo+ICAgICAgdm1fZXZlbnRfcGFja19zZWdtZW50X3Jl
Z2lzdGVyKHg4Nl9zZWdfZHMsICZyZXEtPmRhdGEucmVncy54ODYpOwo+ICAgICAgdm1fZXZlbnRf
cGFja19zZWdtZW50X3JlZ2lzdGVyKHg4Nl9zZWdfZXMsICZyZXEtPmRhdGEucmVncy54ODYpOwo+
ICsgICAgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyKHg4Nl9zZWdfZ2R0ciwgJnJlcS0+
ZGF0YS5yZWdzLng4Nik7Cj4KPiAgICAgIHJlcS0+ZGF0YS5yZWdzLng4Ni5zaGFkb3dfZ3MgPSBj
dHh0LnNoYWRvd19nczsKPiAgICAgIHJlcS0+ZGF0YS5yZWdzLng4Ni5kcjYgPSBjdHh0LmRyNjsK
PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IGluZGV4IGIyYmFmYzBkNzcuLjk1OTA4M2Q4YzQgMTAwNjQ0
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IEBAIC0yOSw3ICsyOSw3IEBACj4KPiAgI2luY2x1ZGUgInhl
bi5oIgo+Cj4gLSNkZWZpbmUgVk1fRVZFTlRfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAwNAo+
ICsjZGVmaW5lIFZNX0VWRU5UX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMDUKPgo+ICAjaWYg
ZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pCj4KPiBAQCAtMTk4LDYg
KzE5OCw3IEBAIHN0cnVjdCB2bV9ldmVudF9yZWdzX3g4NiB7Cj4gICAgICB1aW50NjRfdCBtc3Jf
ZWZlcjsKPiAgICAgIHVpbnQ2NF90IG1zcl9zdGFyOwo+ICAgICAgdWludDY0X3QgbXNyX2xzdGFy
Owo+ICsgICAgdWludDY0X3QgZ2R0cl9iYXNlOwo+ICAgICAgdWludDMyX3QgY3NfYmFzZTsKPiAg
ICAgIHVpbnQzMl90IHNzX2Jhc2U7Cj4gICAgICB1aW50MzJfdCBkc19iYXNlOwo+IEBAIC0yMTEs
MTMgKzIxMiwxNCBAQCBzdHJ1Y3Qgdm1fZXZlbnRfcmVnc194ODYgewo+ICAgICAgc3RydWN0IHZt
X2V2ZW50X3g4Nl9zZWxlY3Rvcl9yZWcgZnM7Cj4gICAgICBzdHJ1Y3Qgdm1fZXZlbnRfeDg2X3Nl
bGVjdG9yX3JlZyBnczsKPiAgICAgIHVpbnQ2NF90IHNoYWRvd19nczsKPiArICAgIHVpbnQxNl90
IGdkdHJfbGltaXQ7CgpXaG9vcHMsIGp1c3Qgbm90aWNlZCB0aGF0IGxpbWl0IGFjdHVhbGx5IG5l
ZWRzIDIwLWJpdHMuIEknbGwganVzdCBncm93CnRoaXMgdG8gMzIgYW5kIGRyb3AgdGhlIHBhZCBh
dCB0aGUgZW5kLgoKPiAgICAgIHVpbnQxNl90IGNzX3NlbDsKPiAgICAgIHVpbnQxNl90IHNzX3Nl
bDsKPiAgICAgIHVpbnQxNl90IGRzX3NlbDsKPiAgICAgIHVpbnQxNl90IGVzX3NlbDsKPiAgICAg
IHVpbnQxNl90IGZzX3NlbDsKPiAgICAgIHVpbnQxNl90IGdzX3NlbDsKPiAtICAgIHVpbnQzMl90
IF9wYWQ7Cj4gKyAgICB1aW50MTZfdCBfcGFkOwo+ICB9OwoKVGFtYXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
