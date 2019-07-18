Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6136CF7C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:13:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho77F-0005Eb-3M; Thu, 18 Jul 2019 14:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho77E-0005EW-GW
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:10:36 +0000
X-Inumbo-ID: cfa36578-a965-11e9-a04e-c714e0e0d0a4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfa36578-a965-11e9-a04e-c714e0e0d0a4;
 Thu, 18 Jul 2019 14:10:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563459035; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=7Ad4FXx1bBAus8tTXCBmdeRy5hMvrOXcYCsrqnWeHKQ=;
 b=TppDzc+VdMAHtrKqe3r4Yt9rH1QHVeM+yeXnti8SfhLq6sE4qEoXg6CBd6tYXCRAw4bQG/MW
 Xdlw65Ohep6dLTREtPLXYIl1fKFNhiW0pk5vJSGkOqGhLg3vxqYGAJx3DpucpGKNpsYTe075
 rO240TEpuyz23cJtnQGLjUjqzgY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mxa.mailgun.org with ESMTP id 5d307dda.7fdc8e2a85b0-smtp-out-n01;
 Thu, 18 Jul 2019 14:10:34 -0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id y4so28889911wrm.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 07:10:34 -0700 (PDT)
X-Gm-Message-State: APjAAAX7pijYRVPXe2iE0+6NXMZhaWoOHr1lxk8Z48WIZwCrwfLI6qrY
 +U/iIhOkNfOWJ8WDdqjkmNQYmhVWoXjEIruKuv8=
X-Google-Smtp-Source: APXvYqwmfDs9N4vVINKJYBFz12zrlFeZ24Z99jVj004aLlnWA3OCIA1q9IhitwjK9an/lI7PdWlICoU1V8SbJDY9mcc=
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr48477838wro.60.1563459033696; 
 Thu, 18 Jul 2019 07:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-6-tamas@tklengyel.com>
 <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
 <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
 <95234c89-846c-1f65-7418-0c2187aa0067@suse.com>
 <CABfawhmDTQ6d+FDhY3PLydE1rshew-EnRBH-SjgV2DLCdbAgiw@mail.gmail.com>
 <9d59429f-c54e-9e3c-1b85-3b49ed98a6b7@suse.com>
 <CABfawh=+4qXQs-Ch2+cKHoE0KzUmGgYBsb2rAS4sdSQQrmZXng@mail.gmail.com>
In-Reply-To: <CABfawh=+4qXQs-Ch2+cKHoE0KzUmGgYBsb2rAS4sdSQQrmZXng@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 08:09:57 -0600
X-Gmail-Original-Message-ID: <CABfawhn9oX7t+OxDfQaT1rNkLi3J5Jk4_qJGmyA=0cagk9-BbA@mail.gmail.com>
Message-ID: <CABfawhn9oX7t+OxDfQaT1rNkLi3J5Jk4_qJGmyA=0cagk9-BbA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNzo1MiBBTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNzozNyBBTSBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDE4LjA3LjIw
MTkgMTU6MTYsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gT24gVGh1LCBKdWwgMTgsIDIw
MTkgYXQgNzoxNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4g
Pj4KPiA+ID4+IE9uIDE4LjA3LjIwMTkgMTQ6NTksIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+
ID4+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA0OjU2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cj4gPiA+Pj4+Cj4gPiA+Pj4+IE9uIDE3LjA3LjIwMTkgMjE6MzMs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4+Pj4+IEBAIC0xMzYsOCArMTM3LDggQEAgc3Rh
dGljIGlubGluZSBib29sIF9wYWdlX2xvY2soc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKPiA+ID4+
Pj4+ICAgICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsKPiA+ID4+Pj4+ICAgICAgICAgICAgIG54
ID0geCArICgxIHwgUEdUX2xvY2tlZCk7Cj4gPiA+Pj4+PiAgICAgICAgICAgICBpZiAoICEoeCAm
IFBHVF92YWxpZGF0ZWQpIHx8Cj4gPiA+Pj4+PiAtICAgICAgICAgICAgICEoeCAmIFBHVF9jb3Vu
dF9tYXNrKSB8fAo+ID4gPj4+Pj4gLSAgICAgICAgICAgICAhKG54ICYgUEdUX2NvdW50X21hc2sp
ICkKPiA+ID4+Pj4+ICsgICAgICAgICAgICAgICAgISh4ICYgUEdUX2NvdW50X21hc2spIHx8Cj4g
PiA+Pj4+PiArICAgICAgICAgICAgICAgICEobnggJiBQR1RfY291bnRfbWFzaykgKQo+ID4gPj4+
Pj4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4+Pj4+ICAgICAgICAgfSB3aGls
ZSAoIGNtcHhjaGcoJnBhZ2UtPnUuaW51c2UudHlwZV9pbmZvLCB4LCBueCkgIT0geCApOwo+ID4g
Pj4+Pgo+ID4gPj4+PiBBcmVuJ3QgeW91IHNjcmV3aW5nIHVwIGluZGVudGF0aW9uIGhlcmU/IEl0
IGxvb2tzIHdyb25nIGJvdGggaW4gbXkKPiA+ID4+Pj4gbWFpbCBjbGllbnQncyB2aWV3IGFuZCBv
biB0aGUgbGlzdCBhcmNoaXZlcywgd2hlcmVhcy4gRnVydGhlcm1vcmUKPiA+ID4+Pj4gdGhpcyBp
cyBjb2RlIHlvdSd2ZSBpbnRyb2R1Y2VkIGVhcmxpZXIgaW4gdGhlIHNlcmllcywgc28gaXQgc2hv
dWxkCj4gPiA+Pj4+IGJlIGdvdCByaWdodCB0aGVyZSwgbm90IGhlcmUuCj4gPiA+Pj4KPiA+ID4+
PiBUaGUgc3R5bGUgd2FzIGF1dG8tYXBwbGllZCB3aXRoIGFzdHlsZSB1c2luZyB0aGUgYnNkIGZv
cm1hdC4gSW4gdGhlCj4gPiA+Pj4gcHJldmlvdXMgcGF0Y2ggdGhlcmUgd2VyZSBubyBzdHlsZS1j
aGFuZ2VzIGFwcGxpZWQgYmVjYXVzZSBpdCB3YXMgYQo+ID4gPj4+IGNvcHktcGFzdGUgam9iIGZy
b20gdGhlIG90aGVyIGNvZGUgbG9jYXRpb24uIEkgcmF0aGVyIGtlZXAKPiA+ID4+PiBjb2RlLWNv
cHlpbmcgYW5kIHN0eWxlIGZpeGVzIHNlcGFyYXRlLgo+ID4gPj4KPiA+ID4+IEJ1dCB5b3UncmUg
YWN0aXZlbHkgYnJlYWtpbmcgWGVuIHN0eWxlIGhlcmUgKGFuZCBiZWxvdykuCj4gPiA+Cj4gPiA+
IEkgZG9uJ3Qgc2VlIGFueSBtZW50aW9uIG9mIHN0eWxlIHJlc3RyaWN0aW9ucyByZWdhcmRpbmcg
dGhpcyBpbgo+ID4gPiBDT0RJTkdfU1RZTEUuIElmIHRoZXJlIGlzLCBJIHdvdWxkIHByZWZlciBj
aGFuZ2luZyB0aGF0IHNvIHdlIGNhbgo+ID4gPiBhdXRvbWF0ZSBzdHlsZSBjaGVja3Mgd2hpY2gg
SU1ITyBhcmUgdGhlIGJpZ2dlc3Qgd2FzdGUgb2YgZXZlcnlvbmUncwo+ID4gPiB0aW1lIHRvIGRv
IG1hbnVhbGx5Lgo+ID4KPiA+IC4vQ09ESU5HX1NUWUxFIGZhaWxzIHRvIG1lbnRpb24gbWFueSBh
c3BlY3RzIG9mIHdoYXQgd2UgZG8gZXZlcnl3aGVyZS4KPiA+IEFsbW9zdCBhbnkgYXR0ZW1wdCBv
ZiB1cGRhdGluZyBpdCBoYXMgZmFpbGVkIGZvciBtZSBpbiB0aGUgcGFzdCwgb2Z0ZW4KPiA+IGR1
ZSB0byBlbnRpcmUgbGFjayBvZiByZXNwb25zZXMgb24gcGF0Y2hlcyAoaW4gb3RoZXIgY2FzZXMg
YWxzbyBiZWNhdXNlCj4gPiBvZiBwZW9wbGUgZGlzYWdyZWVpbmcpLiBEZXNwaXRlIHlvdSBiZWlu
ZyB0aGUgbWFpbnRhaW5lciBvZiB0aGUgZmlsZSBJCj4gPiBzdHJvbmdseSB0aGluayB5b3Ugc2hv
dWxkbid0IGFjdGl2ZWx5IGJyZWFrIHN0eWxlIHRoYXQncyBpbiBsaW5lIHdpdGgKPiA+IGxhcmdl
IHN3YXRoZXMgb2YgY29kZSBlbHNld2hlcmUuCj4gPgo+Cj4gSSB3aG9sbHkgZGlzYWdyZWUuIEkg
ZG9uJ3QgaGF2ZSBoYXZlIHRpbWUgdG8gY2hlY2sgZm9yIHN0eWxlIGlzc3Vlcwo+IG1hbnVhbGx5
LiBQYXRjaGVzIGxvb2sgbGlrZSBjcmFwIHRvIGJlZ2luIHdpdGggdmlhIGVtYWlsIGFuZCBJIG1v
c3QKPiBjZXJ0YWlubHkgd29uJ3QgYm90aGVyIGNhcnZpbmcgcGF0Y2hlcyBvdXQgb2YgZW1haWxz
IHdoZW4gcGVvcGxlIGZhaWwKPiB0byBib3RoZXIgdG8gcHVzaCB0aGluZ3MgYXMgZ2l0IGJyYW5j
aGVzLiBUaGlzIHNob3VsZCBiZSBzb21ldGhpbmcKPiB0aGF0J3MgZG9uZSBhdXRvbWF0aWNhbGx5
LiBJIGRvbid0IGV2ZW4gdGhpbmsgd2Ugc2hvdWxkIGJlIGhhdmluZyBhCj4gZGlzY3Vzc2lvbnMg
YWJvdXQgc3R5bGUgaXNzdWVzIG9uIHRoZSBtYWlsaW5nbGlzdC4gU3R5bGUgZml4ZXMgY291bGQK
PiBiZSBtYWRlIGF1dG9tYXRpY2FsbHkgd2hlbiB0aGUgcGF0Y2hlcyBhcmUgYXBwbGllZCBieSB0
aGUgY29tbWl0dGVycy4KPiBBbnl0aGluZyBlbHNlIGlzIGp1c3QgYSB3YXN0ZSBvZiB0aW1lLgo+
CgpGb3J0dW5hdGVseSBJIGZvdW5kIGFuIGFzdGx5ZSBvcHRpb24gdGhhdCBsZXRzIG1lIG92ZXJy
aWRlIHRoZSBic2QKc3R5bGUgaW4gdGhpcyByZWdhcmQgYW5kIGtlZXAgdGhlIGluZGVudGF0aW9u
IGZvciB0aGVzZSBibG9ja3MsIHNvIGl0CmNhbiBzdGlsbCBiZSBhdXRvbWF0ZWQuIFRoZSBvbmx5
IHBhcnQgSSBjYW4ndCBmaW5kIGFuIG9wdGlvbiB0byBpcyB0bwppbmNvcnBvcmF0ZSB0aGUgWGVu
IGV4Y2VwdGlvbiBpbiB0aGUgZG8td2hpbGUgc3R5bGUgb2Ygd3JpdGluZyAiZG8geyIuCkkgY2Fu
IGtlZXAgdGhlIHdoaWxlLXBhcnQgaW4gdGhlIHNhbWUgbGluZSBidXQgbm90IHRoZSBicmFjZSB3
aXRoIHRoZQpkby4gSWYgY291bGQgbWFrZSBhbiBleGNlcHRpb24gZm9yIHRoYXQgaW4gdGhlIENP
RElOR19TVFlMRSwgdGhlbiB0aGUKd2hvbGUgdGhpbmcgY291bGQgYmUgYXV0b21hdGVkIHdpdGgg
dGhlIGZvbGxvd2luZyAuYXN0eWxlcmMgSSdtIHVzaW5nCmF0IHRoZSBtb21lbnQ6CgpzdHlsZT1i
c2QKc3VmZml4PW5vbmUKYWxpZ24tcG9pbnRlcj1uYW1lCmFsaWduLXJlZmVyZW5jZT1uYW1lCmlu
ZGVudD1zcGFjZXM9NAptYXgtY29kZS1sZW5ndGg9ODAKbWluLWNvbmRpdGlvbmFsLWluZGVudD0w
CmF0dGFjaC1jbG9zaW5nLXdoaWxlCnJlbW92ZS1icmFjZXMKaW5kZW50LXN3aXRjaGVzCmJyZWFr
LWJsb2NrcwpicmVhay1vbmUtbGluZS1oZWFkZXJzCmtlZXAtb25lLWxpbmUtYmxvY2tzCnBhZC1j
b21tYQpwYWQtaGVhZGVyCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
