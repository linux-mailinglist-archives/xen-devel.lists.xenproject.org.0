Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D113DF7C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:02:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7ZO-0007xC-BF; Thu, 16 Jan 2020 16:00:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pBP5=3F=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1is7ZM-0007wx-Oo
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:00:28 +0000
X-Inumbo-ID: 5049141e-3879-11ea-a985-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5049141e-3879-11ea-a985-bc764e2007e4;
 Thu, 16 Jan 2020 16:00:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q6so19609789wro.9
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 08:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eLgZnrY0BI50p2Ul0NfHHYd3nrbPPLeqTLzaBfsYM5E=;
 b=d5qR87sPNCi3m3jeFtNxVgXyBIUTtr7LR1/8B+e+az1KiehvfUMVf1x4EQcC5KaiKB
 R9dm+lSM904/1dHxGO5Tw5bYs4cXfpiyiP8bYsXrWayNeeY8UV5knYCWEo7QXVQSy5g3
 OObOwo1xdbvl08UT5ucppsUhbQPuU8cdazJvGIbRlwBmFALcg7ubu7Dp2bTSBsiHUfXv
 rskMF4WVjn7ueQ23+GfhCL9tFh66ZKVNyTrDqWi2u7Wwv2DWlwjTeHgFvbxdBU+IkCo2
 TB8NY9SDGVIFZzqAdK2NBOfzOYF9Pm+Up3aRltMSYj1KAIaLVI/uitdw2IZNNEECUJrT
 3neA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eLgZnrY0BI50p2Ul0NfHHYd3nrbPPLeqTLzaBfsYM5E=;
 b=J9IVBtCblKoR/KHqSRCD1LchJIgVTiAuSRfrCIouyVrv7t593y8sFY0/S9/dWx+9R7
 oKEQYqwul+l1lfVvJOQKOSsnogGPI8esWaHKQqJ5zHmHGNkuZYnxSCpfuRMpEAlM0NaQ
 ERvkC+jQANJ1QlXzJ1nMAMGxtzu3KlhRk9lYM6AkMzZwjc3VfASrsd4Q2ytJC8jfcF8b
 9JEeGoN0D0084cjF7j9C7L2Coc3lrxJ6BM+upZyqucyvw/2pLMQ8ZE7Wn1DZopav/hTA
 Cgf/c79/Fcd6Wsvd6WITImZ1EdvoHsBDeJDGV751/DUgsBn84cuEqCL/uVJPYbYJK/LO
 53Ig==
X-Gm-Message-State: APjAAAX72kogjDbAFRNIcwv+B8vrS5S07PeofB5Mp1QyRf/aJAtDZrKd
 Ae93u7vzNFHTCzAvGYaALScd2N1WL+jRY1kTjIo=
X-Google-Smtp-Source: APXvYqwZQ13sODHqaOUwAFjisP7EKPxmQQZ7hmY3MLprmthebAdWQ9j4KgvZ9uGG7sCNE+IrB6/lhgzvhWrkksoL/Ng=
X-Received: by 2002:adf:e74a:: with SMTP id c10mr3943736wrn.386.1579190427095; 
 Thu, 16 Jan 2020 08:00:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <199ba3c6fbe8f3de3b1513f70c5ea77f67aa2b42.1578503483.git.tamas.lengyel@intel.com>
 <845a06c6-478d-fe76-1954-2ddb7333bd89@suse.com>
In-Reply-To: <845a06c6-478d-fe76-1954-2ddb7333bd89@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 16 Jan 2020 08:59:50 -0700
Message-ID: <CABfawh=+JigDvOYi19eDHx+1o4jeBtcXkH-sE1AqO29j9AChDQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 05/18] x86/mem_sharing: don't try to
 unshare twice during page fault
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgNzo1NSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gQEAgLTE3MDIsMTEgKzE3MDMsMTQgQEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2Vf
ZmF1bHQocGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAo+ID4gICAgICBzdHJ1Y3QgZG9t
YWluICpjdXJyZCA9IGN1cnItPmRvbWFpbjsKPiA+ICAgICAgc3RydWN0IHAybV9kb21haW4gKnAy
bSwgKmhvc3RwMm07Cj4gPiAgICAgIGludCByYywgZmFsbF90aHJvdWdoID0gMCwgcGFnZWQgPSAw
Owo+ID4gLSAgICBpbnQgc2hhcmluZ19lbm9tZW0gPSAwOwo+ID4gICAgICB2bV9ldmVudF9yZXF1
ZXN0X3QgKnJlcV9wdHIgPSBOVUxMOwo+ID4gICAgICBib29sIHN5bmMgPSBmYWxzZTsKPiA+ICAg
ICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXI7Cj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfTUVNX1NI
QVJJTkcKPiA+ICsgICAgYm9vbCBzaGFyaW5nX2Vub21lbSA9IGZhbHNlOwo+ID4gKyNlbmRpZgo+
Cj4gVG8gcmVkdWNlICNpZmRlZi1hcnksIGNvdWxkIHlvdSBsZWF2ZSB0aGlzIGFsb25lIChvciBj
b252ZXJ0IHRvCj4gYm9vbCBpbiBwbGFjZSwgd2l0aG91dCAjaWZkZWYpIGFuZCAuLi4KPgo+ID4g
QEAgLTE5NTUsMTkgKzE5NjEsMjEgQEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFk
ZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAo+ID4gICAgICAgKi8KPiA+ICAgICAgaWYgKCBw
YWdlZCApCj4gPiAgICAgICAgICBwMm1fbWVtX3BhZ2luZ19wb3B1bGF0ZShjdXJyZCwgZ2ZuKTsK
PiA+ICsKPiA+ICsjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCj4gPiAgICAgIGlmICggc2hhcmlu
Z19lbm9tZW0gKQo+ID4gICAgICB7Cj4gPiAtICAgICAgICBpbnQgcnY7Cj4gPiAtCj4gPiAtICAg
ICAgICBpZiAoIChydiA9IG1lbV9zaGFyaW5nX25vdGlmeV9lbm9tZW0oY3VycmQsIGdmbiwgdHJ1
ZSkpIDwgMCApCj4gPiArICAgICAgICBpZiAoICF2bV9ldmVudF9jaGVja19yaW5nKGN1cnJkLT52
bV9ldmVudF9zaGFyZSkgKQo+ID4gICAgICAgICAgewo+ID4gLSAgICAgICAgICAgIGdkcHJpbnRr
KFhFTkxPR19FUlIsICJEb21haW4gJWh1IGF0dGVtcHQgdG8gdW5zaGFyZSAiCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgImdmbiAlbHgsIEVOT01FTSBhbmQgbm8gaGVscGVyIChyYyAlZClcbiIs
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgY3VycmQtPmRvbWFpbl9pZCwgZ2ZuLCBydik7Cj4g
PiArICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLCAiRG9tYWluICVwZCBhdHRlbXB0IHRv
IHVuc2hhcmUgIgo+ID4gKyAgICAgICAgICAgICAgICAgICAgImdmbiAlbHgsIEVOT01FTSBhbmQg
bm8gaGVscGVyXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgY3VycmQsIGdmbik7Cj4gPiAg
ICAgICAgICAgICAgLyogQ3Jhc2ggdGhlIGRvbWFpbiAqLwo+ID4gICAgICAgICAgICAgIHJjID0g
MDsKPiA+ICAgICAgICAgIH0KPiA+ICAgICAgfQo+ID4gKyNlbmRpZgo+Cj4gLi4uIG1vdmUgdGhl
ICNpZmRlZiBpbnNpZGUgdGhlIGJyYWNlcyBoZXJlPyBXaXRoIHRoaXMKPiBBY2tlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKU0dUTSwgSSBhc3N1bWUgeW91IGFyZSBjb3Vu
dGluZyBvbiB0aGUgY29tcGlsZXIgdG8ganVzdCBnZXQgcmlkIG9mIHRoZQp2YXJpYWJsZSB3aGVu
IGl0IHNlZXMgaXRzIG5ldmVyIHVzZWQ/CgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
