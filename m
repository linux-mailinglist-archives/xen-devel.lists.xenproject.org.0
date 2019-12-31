Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA8F12D559
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 01:41:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1im5YW-0003qT-4A; Tue, 31 Dec 2019 00:38:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Skpz=2V=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1im5YV-0003qO-3b
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 00:38:39 +0000
X-Inumbo-ID: db466ce0-2b65-11ea-b6f1-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db466ce0-2b65-11ea-b6f1-bc764e2007e4;
 Tue, 31 Dec 2019 00:38:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1577752707; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=34qmdjo+f8tU4/hAzFbl5nC8CuQpyQhRByr9nWLsaZk=;
 b=obxtDU9bNzn2m6ABfAdQXYEQMh/Ziz+bpINjKijwA5BwDsb8+qOzZjSo6YLqewhjkWwtUAK8
 Wjba7nfIQGc6TlNIllGkKd1CWgpR+r83gTdrDl6pN0DV80Kvqiq4FKEx678wYh2Hsfm+GohU
 qaNGGHyJNuOpplzGATy8TFseSb4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mxa.mailgun.org with ESMTP id 5e0a9878.7fc292598df0-smtp-out-n01;
 Tue, 31 Dec 2019 00:38:16 -0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z3so34080119wru.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 16:38:16 -0800 (PST)
X-Gm-Message-State: APjAAAXpE/NurrPyKpJOSC8MnFngtQMBL5g30hZxpKfO9KSHiyOjtTl6
 p5P12j0SH+ZMP/PIMXVzKDK+sd9hFGvDuwMy29Q=
X-Google-Smtp-Source: APXvYqz8bacyEejKxmD6/3szC4tVgU19QZ672D/I6Y9zmisdBIXVt3m8RjgASRxhj9UWB+cGLZNaRyrL/NO0O40rAJw=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr67896252wru.353.1577752694950; 
 Mon, 30 Dec 2019 16:38:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
In-Reply-To: <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 30 Dec 2019 17:37:38 -0700
X-Gmail-Original-Message-ID: <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
Message-ID: <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
To: Julien Grall <julien.grall@gmail.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgNToyMCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIDMwIERlYyAyMDE5LCAyMDo0
OSBUYW1hcyBLIExlbmd5ZWwsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPj4KPj4gT24g
TW9uLCBEZWMgMzAsIDIwMTkgYXQgMTE6NDMgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4gd3JvdGU6Cj4+IEJ1dCBrZWVwIGluIG1pbmQgdGhhdCB0aGUgImZvcmstdm0iIGNvbW1hbmQg
ZXZlbiB3aXRoIHRoaXMgdXBkYXRlCj4+IHdvdWxkIHN0aWxsIG5vdCBwcm9kdWNlIGZvciB5b3Ug
YSAiZnVsbHkgZnVuY3Rpb25hbCIgVk0gb24gaXRzIG93bi4KPj4gVGhlIHVzZXIgc3RpbGwgaGFz
IHRvIHByb2R1Y2UgYSBuZXcgVk0gY29uZmlnIGZpbGUsIGNyZWF0ZSB0aGUgbmV3Cj4+IGRpc2ss
IHNhdmUgdGhlIFFFTVUgc3RhdGUsIGV0Yy4KPgo+Cj4gIElmIHlvdSBmb3JrIHRoZW4gdGhlIGNv
bmZpZ3VyYXRpb24gc2hvdWxkIGJlIHZlcnkgc2ltaWxhci4gUmlnaHQ/Cj4KPiBTbyB3aHkgZG9l
cyB0aGUgdXNlciByZXF1aXJlcyB0byBwcm92aWRlIGEgbmV3IGNvbmZpZyByYXRoZXIgdGhhbiB0
aGUgY29tbWFuZCB0byB1cGRhdGUgdGhlIGV4aXN0aW5nIG9uZT8gVG8gbWUsIGl0IGZlZWxzIHRo
aXMgaXMgYSBjYWxsIHRvIG1ha2UgbWlzdGFrZSB3aGVuIGZvcmtpbmcuCj4KPiBIb3cgaXMgdGhl
IG5ldyBjb25maWcgZGlmZmVyZW50IGZyb20gdGhlIG9yaWdpbmFsIFZNPwoKVGhlIGNvbmZpZyBt
dXN0IGJlIGRpZmZlcmVudCBhdCBsZWFzdCBieSBnaXZpbmcgdGhlIGZvcmsgYSBkaWZmZXJlbnQK
bmFtZS4gVGhhdCdzIHRoZSBtaW5pbXVtIGFuZCBpdCdzIGVub3VnaCBvbmx5IGlmIHRoZSBWTSB5
b3UgYXJlCmZvcmtpbmcgaGFzIG5vIGRpc2sgYXQgYWxsLiBJZiBpdCBoYXMgYSBkaXNrLCB5b3Ug
YWxzbyBoYXZlIHRvIHVwZGF0ZQp0aGUgY29uZmlnIHRvIHBvaW50IHRvIHdoZXJlIHRoZSBuZXcg
ZGlzayBpcy4gSSdtIHVzaW5nIExWTSBzbmFwc2hvdHMKYnV0IHlvdSBjb3VsZCBhbHNvIHVzZSBx
Y293Miwgb3Igd2hhdGV2ZXIgZWxzZSB0aGVyZSBpcyBmb3IgZGlzay1Db1cuClRoZSBmb3JrIGNh
biBhbHNvIGhhdmUgZGlmZmVyZW50IG9wdGlvbnMgZW5hYmxlZCB0aGFuIGl0J3MgcGFyZW50LiBG
b3IKZXhhbXBsZSBpbiBvdXIgdGVzdC1jYXNlLCB0aGUgZm9ya3MgaGF2ZSBhbHRwMm0gZW5hYmxl
ZCB3aGlsZSB0aGUKcGFyZW50IFZNIGRvZXNuJ3QuIFRoZXJlIGNvdWxkIGJlIG90aGVyIG9wdGlv
bnMgbGlrZSB0aGF0IHNvbWVvbmUKbWlnaHQgd2FudCB0byBlbmFibGUgZm9yIHRoZSBmb3JrKHMp
LiBJZiB0aGVyZSBpcyBuZXR3b3JraW5nIGludm9sdmVkCnlvdSBsaWtlbHkgYWxzbyBoYXZlIHRv
IGF0dGFjaCB0aGUgZm9yayB0byBhIG5ldyBWTEFOIGFzIHRvIGF2b2lkCk1BQy1hZGRyZXNzIGNv
bGxpc2lvbiBvbiB0aGUgYnJpZGdlLiBTbyB0aGVyZSBhcmUgcXVpdGUgYSBsb3Qgb2YKdmFyaWF0
aW9uIHBvc3NpYmxlLCBoZW5jZSBpdHMgYmV0dGVyIHRvIGhhdmUgdGhlIHVzZXIgZ2VuZXJhdGUg
dGhlIG5ldwpjb25maWcgdGhleSB3YW50IGluc3RlYWQgb2YgeGwgY29taW5nIHVwIHdpdGggc29t
ZXRoaW5nIG9uIGl0cyBvd24uCgo+Cj4gQXMgYSBzaWRlIG5vdGUsIEkgY2FuJ3Qgc2VlIGFueSBw
YXRjaCBhZGRpbmcgZG9jdW1lbnRhdGlvbi4KCkl0J3Mgb25seSBhbiBleHBlcmltZW50YWwgZmVh
dHVyZSBzbyBhZGRpbmcgZG9jdW1lbnRhdGlvbiB3YXMgbm90IGEKcHJpb3JpdHkuIFRoZSBkb2N1
bWVudGF0aW9uIGlzIHByZXR0eSBtdWNoIGluIHRoZSBjb3ZlciBsZXR0ZXIuIEknbQpoYXBweSB0
byBhZGQgaXRzIGNvbnRlbnQgYXMgYSBmaWxlIHVuZGVyIGRvY3MgaW4gYSBwYXRjaCAod2l0aCB0
aGUKYWJvdmUgZXh0cmEgaW5mb3JtYXRpb24pLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
