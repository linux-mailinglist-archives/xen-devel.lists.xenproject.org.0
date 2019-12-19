Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968D126660
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 17:06:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihyGn-0006hE-JE; Thu, 19 Dec 2019 16:03:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihyGl-0006h9-RK
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 16:03:19 +0000
X-Inumbo-ID: 0e160630-2279-11ea-a1e1-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e160630-2279-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 16:03:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576771391; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=fmf2npS0MPBUG+bgaA2IOHsrPoc8sGN8kosLo/23wT0=;
 b=Ur7M2j3suM8U2+Xq9ex8m7dj6K9AgH02eK7pu/jF2sWg15wIDGBZ9tfDvUY9TH34wiY9O7PZ
 83+9bfJa0yv9SaF9qlV5YyXpXzVVkKtGvLCQHFEZXkso0L/QURO8ifmR8BKKVhk9PavqsAg7
 8OLnguMDBYFJcdwxwy60S7ZyS0c=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mxa.mailgun.org with ESMTP id 5dfb9f3e.7f3b3d6fd030-smtp-out-n03;
 Thu, 19 Dec 2019 16:03:10 -0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q10so6504643wrm.11
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 08:03:09 -0800 (PST)
X-Gm-Message-State: APjAAAUj+js6RdbtGKjAfehk1PajgnciuGtChPNVkNoieg3fBRXG02WH
 k1J5h2Av6aNEZZhh6a2cwL9ZrAvRA6sSjpLtgJk=
X-Google-Smtp-Source: APXvYqwYjlUSYQXPSj3nENgpGldDT7qpiSOIG3wFNj8hOLh67M6/0es8FGgQQxDgQdaJEzYNZ6/F0DBoA/E3DUxYYjE=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr9985212wru.353.1576771388358; 
 Thu, 19 Dec 2019 08:03:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <22a6cb7bd5593ed38cf6f66c26c4734a04718e1a.1576697796.git.tamas.lengyel@intel.com>
 <c6d975b9-638f-355d-79f8-1c1fae4c6007@xen.org>
 <CABfawhnVbzv4UEQFQoRwYurKOWB4Vw=OtsxXUDtFX1HRxr-sWA@mail.gmail.com>
 <5339f10e-6d93-35ac-5777-acf13ba9835f@xen.org>
 <CABfawhmzjE6c0msjpPEBTciTnCTVQGd46ovSuB_7qqXdY6BvsQ@mail.gmail.com>
 <b26a1aa1-afa2-aedd-09d2-b0557fb8b339@suse.com>
In-Reply-To: <b26a1aa1-afa2-aedd-09d2-b0557fb8b339@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 09:02:31 -0700
X-Gmail-Original-Message-ID: <CABfawhnME+8qA_Eez=BpEBXW=ir88TBupu7515cxcj0FFEZFfg@mail.gmail.com>
Message-ID: <CABfawhnME+8qA_Eez=BpEBXW=ir88TBupu7515cxcj0FFEZFfg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 19/20] x86/mem_sharing: reset a fork
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgNDowNSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTkuMTIuMjAxOSAwMToxNSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgNDowMiBQTSBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToKPiA+PiBPbiAxOC8xMi8yMDE5IDIyOjMzLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPj4+IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDM6MDAgUE0gSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6Cj4gPj4+PiBZb3UgYWxzbyBoYXZlIG11bHRp
cGxlIGxvb3Agb24gdGhlIHBhZ2VfbGlzdCBpbiB0aGlzIGZ1bmN0aW9uLiBHaXZlbiB0aGUKPiA+
Pj4+IG51bWJlciBvZiBwYWdlX2xpc3QgY2FuIGJlIHF1aXRlIGJpZywgdGhpcyBpcyBhIGNhbGwg
Zm9yIGhvZ2dpbmcgdGhlCj4gPj4+PiBwQ1BVIGFuZCBhbiBSQ1UgbG9jayBvbiB0aGUgZG9tYWlu
IHZDUFUgcnVubmluZyB0aGlzIGNhbGwuCj4gPj4+Cj4gPj4+IFRoZXJlIGlzIGp1c3Qgb25lIGxv
b3Agb3ZlciBwYWdlX2xpc3QgaXRzZWxmLCB0aGUgc2Vjb25kIGxvb3AgaXMgb24KPiA+Pj4gdGhl
IGludGVybmFsIGxpc3QgdGhhdCBpcyBiZWluZyBidWlsdCBoZXJlIHdoaWNoIHdpbGwgYmUgYSBz
dWJzZXQuIFRoZQo+ID4+PiBsaXN0IGl0c2VsZiBpbiBmYWN0IHNob3VsZCBiZSBzbWFsbCAoaW4g
b3VyIHRlc3RzIHVzdWFsbHkgPDEwMCkuCj4gPj4KPiA+PiBGb3IgYSBmaXJzdCwgbm90aGluZyBp
biB0aGlzIGZ1bmN0aW9uIHRlbGxzIG1lIHRoYXQgdGhlcmUgd2lsbCBiZSBvbmx5Cj4gPj4gMTAw
IHBhZ2VzLiBCdXQgdGhlbiwgSSBkb24ndCB0aGluayB0aGlzIGlzIHJpZ2h0IHRvIGltcGxlbWVu
dCB5b3VyCj4gPj4gaHlwZXJjYWxsIGJhc2VkIG9ubHkgdGhlICAibm9ybWFsIiBzY2VuYXJpby4g
WW91IHNob3VsZCBhbHNvIHRoaW5rIGFib3V0Cj4gPj4gdGhlICJ3b3JzdCIgY2FzZSBzY2VuYXJp
by4KPiA+Pgo+ID4+IEluIHRoaXMgY2FzZSB0aGUgd29yc3QgY2FzZSBzY2VuYXJpbyBpcyBoYXZl
IGh1bmRyZWRzIG9mIHBhZ2UgaW4gcGFnZV9saXN0Lgo+ID4KPiA+IFdlbGwsIHRoaXMgaXMgb25s
eSBhbiBleHBlcmltZW50YWwgc3lzdGVtIHRoYXQncyBjb21wbGV0ZWx5IGRpc2FibGVkCj4gPiBi
eSBkZWZhdWx0LiBNYWtpbmcgdGhlIGFzc3VtcHRpb24gdGhhdCBwZW9wbGUgd2hvIG1ha2UgdXNl
IG9mIGl0IHdpbGwKPiA+IGtub3cgd2hhdCB0aGV5IGFyZSBkb2luZyBJIHRoaW5rIGlzIGZhaXIu
Cj4KPiBGV0lXIEknbSB3aXRoIEp1bGllbiBoZXJlOiBUaGUgcHJlZmVycmVkIGNvdXJzZSBvZiBh
Y3Rpb24gaXMgdG8gbWFrZQo+IHRoZSBvcGVyYXRpb24gc2FmZSBhZ2FpbnN0IGFidXNlLiBUaGUg
bWluaW11bSByZXF1aXJlbWVudCBpcyB0bwo+IGRvY3VtZW50IG9idmlvdXMgbWlzc2luZyBwaWVj
ZXMgZm9yIHRoaXMgdG8gYmVjb21lIHN1cHBvcnRlZCBjb2RlLgoKVGhhdCdzIHBlcmZlY3RseSBm
aW5lIGJ5IG1lLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
