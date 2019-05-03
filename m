Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2731311F
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:26:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMa3A-0003TJ-Hh; Fri, 03 May 2019 15:24:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQLm=TD=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMa38-0003TD-KO
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:24:34 +0000
X-Inumbo-ID: 8d3b52e0-6db7-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8d3b52e0-6db7-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:24:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556897073; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Te6/poifKs5ssLWabOyxddXec9e7PNzz0JP6fN0JrMA=;
 b=cjnTnOIuGpnAKbNDlbIeMJh+eG77GX5zxHetud5t/Dw8bhxeYnavrnGSnDodyBBuHMvVCax1
 5JLRvGjyqcpA+Qioog4J6uf1k42gpHHYUP2HsZpZc1kj+vfdex3aR18vxHoalX5t7/zbRIHa
 rS+zjurVCbmQzH2rtSnDSxw6yH0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mxa.mailgun.org with ESMTP id 5ccc5d2f.7f72f69b1b30-smtp-out-n02;
 Fri, 03 May 2019 15:24:31 -0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id b188so5961487wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:24:30 -0700 (PDT)
X-Gm-Message-State: APjAAAUS/pKY+ClTma7mqgoTu/J9xpoz1LxHYVEMzwdj7ldyhzq7cdIV
 UWgWjankKTw5n5HXmjj5LgVVqIZ2YWzeMB8xl+s=
X-Google-Smtp-Source: APXvYqxdUwk921J9ao2GmZ0DSbuczW1/7TApw0emzbUAYj48NrgZZL+UCFPncRyBjvb7C+eFKO7SRmfekmANO/dDNV8=
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr6886085wma.53.1556897069311; 
 Fri, 03 May 2019 08:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <20190502221345.18459-2-tamas@tklengyel.com>
 <5CCBFB86020000780022B889@prv1-mh.provo.novell.com>
 <CABfawhkocyDAiGyXF+Cf+Y4fB7w8is=GEUJEzMVJ5dXbEEGeLw@mail.gmail.com>
 <5CCC48E5020000780022B9F5@prv1-mh.provo.novell.com>
 <75065571-2518-156f-eeee-90d3778519b1@citrix.com>
In-Reply-To: <75065571-2518-156f-eeee-90d3778519b1@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 3 May 2019 09:23:52 -0600
X-Gmail-Original-Message-ID: <CABfawh==81nx=-XBc7-8BTZ+ueE9TyTrXUdtnbAH1a42gAh68w@mail.gmail.com>
Message-ID: <CABfawh==81nx=-XBc7-8BTZ+ueE9TyTrXUdtnbAH1a42gAh68w@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v4 2/4] x86/mem_sharing: copy a page_lock
 version to be internal to memshr
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA4OjM1IEFNIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiA1LzMvMTkgMjo1NyBQTSwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPj4+PiBPbiAwMy4wNS4xOSBhdCAxNTo0MywgPHRhbWFzQHRrbGVuZ3llbC5jb20+
IHdyb3RlOgo+ID4+IE9uIEZyaSwgTWF5IDMsIDIwMTkgYXQgMjoyNyBBTSBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+Pj4+PiBPbiAwMy4wNS4xOSBhdCAw
MDoxMywgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL21lbV9zaGFyaW5nLmMKPiA+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hh
cmluZy5jCj4gPj4+PiBAQCAtMTEyLDEzICsxMTIsNDggQEAgc3RhdGljIGlubGluZSB2b2lkIHBh
Z2Vfc2hhcmluZ19kaXNwb3NlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gPj4+Pgo+ID4+Pj4g
ICNlbmRpZiAvKiBNRU1fU0hBUklOR19BVURJVCAqLwo+ID4+Pj4KPiA+Pj4+IC1zdGF0aWMgaW5s
aW5lIGludCBtZW1fc2hhcmluZ19wYWdlX2xvY2soc3RydWN0IHBhZ2VfaW5mbyAqcGcpCj4gPj4+
PiArLyoKPiA+Pj4+ICsgKiBQcml2YXRlIGltcGxlbWVudGF0aW9ucyBvZiBwYWdlX2xvY2svdW5s
b2NrIHRvIGJ5cGFzcyBQVi1vbmx5Cj4gPj4+PiArICogc2FuaXR5IGNoZWNrcyBub3QgYXBwbGlj
YWJsZSB0byBtZW0tc2hhcmluZy4KPiA+Pj4+ICsgKi8KPiA+Pj4+ICtzdGF0aWMgaW5saW5lIGJv
b2wgX3BhZ2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+ID4+Pj4gIHsKPiA+Pj4+IC0g
ICAgaW50IHJjOwo+ID4+Pj4gKyAgICB1bnNpZ25lZCBsb25nIHgsIG54Owo+ID4+Pj4gKwo+ID4+
Pj4gKyAgICBkbyB7Cj4gPj4+PiArICAgICAgICB3aGlsZSAoICh4ID0gcGFnZS0+dS5pbnVzZS50
eXBlX2luZm8pICYgUEdUX2xvY2tlZCApCj4gPj4+PiArICAgICAgICAgICAgY3B1X3JlbGF4KCk7
Cj4gPj4+PiArICAgICAgICBueCA9IHggKyAoMSB8IFBHVF9sb2NrZWQpOwo+ID4+Pj4gKyAgICAg
ICAgaWYgKCAhKHggJiBQR1RfdmFsaWRhdGVkKSB8fAo+ID4+Pj4gKyAgICAgICAgICAgICAhKHgg
JiBQR1RfY291bnRfbWFzaykgfHwKPiA+Pj4+ICsgICAgICAgICAgICAgIShueCAmIFBHVF9jb3Vu
dF9tYXNrKSApCj4gPj4+PiArICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+Pgo+ID4+PiBK
dXN0IGZvciBteSBvd24gdW5kZXJzdGFuZGluZzogRGlkIHlvdSB2ZXJpZnkgdGhhdCB0aGUgUEdU
X3ZhbGlkYXRlZAo+ID4+PiBjaGVjayBpcyBpbmRlZWQgbmVlZGVkIGhlcmUsIG9yIGRpZCB5b3Ug
Y29weSBpdCAianVzdCBpbiBjYXNlIj8gSW4gdGhlCj4gPj4+IGxhdHRlciBjYXNlIGEgY29tbWVu
dCBtYXkgYmUgd29ydGh3aGlsZS4KPiA+Pgo+ID4+IFRoaXMgaXMgYW4gZXhhY3QgY29weSBvZiBw
YWdlX2xvY2ssIHNhbnMgdGhlIGFzc2VydHMgdGhhdCBicmVhayBpdAo+ID4+IGZyb20gbWVtX3No
YXJpbmcuIEkgZGlkbid0IGludmVzdGlnYXRlIHdoaWNoIG9mIHRoZXNlIGZsYWdzIGFyZQo+ID4+
IG5lY2Vzc2FyeSBmb3IgbWVtX3NoYXJpbmcuIEZyYW5rbHksIEkgZG9uJ3QgZnVsbHkgdW5kZXJz
dGFuZCB0aGVpcgo+ID4+IG1lYW5pbmcgYW5kIEkgaGF2ZW4ndCBjYW1lIGFjcm9zcyBkb2N1bWVu
dGF0aW9uIGFib3V0IGl0IHlldC4KPgo+IEkgaG9wZSB0byBhZGQgc29tZSBkb2N1bWVudGF0aW9u
IHNvbWV0aW1lIGluIHRoZSBuZXh0IDYgbW9udGhzIG9yIHNvLgo+IEkndmUgc3VibWl0dGVkIGEg
dGFsayBvbiB0aGUgcmVmY291bnRpbmcgc3lzdGVtIHRvIHRoZSBYZW5TdW1taXQgYXMgd2VsbC4K
CkdyZWF0LCBsb29raW5nIGZvcndhcmQgdG8gaXQhCgo+Cj4gU2hvcnQgYW5zd2VyOiBQR1RfdmFs
aWRhdGVkIG1lYW5zIHRoYXQgdGhlIHBhZ2UgaW4gcXVlc3Rpb24gaGFzIGJlZW4KPiB2YWxpZGF0
ZWQgYXMgc2FmZSB0byB1c2UgYXMgdGhlIGRlc2lnbmF0ZWQgdHlwZS4gIEZvciBQR1Rfd3JpdGFi
bGUsIHRoaXMKPiBpcyBpbnN0YW50YW5lb3VzIChpLmUuLCB0aGUgdHlwZSBpcyBzZXQgdG8gUEdU
X3dyaXRhYmxlIHdpdGggdGhlCj4gUEdUX3ZhbGlkYXRlZCBiaXQgc2V0IGluIHRoZSBzYW1lIGNt
cHhjaGcgb3BlcmF0aW9uKS4KPgo+IE90aGVyIHR5cGVzIChzdWNoIGFzIFBHVF9sKl90YWJsZSkg
YWN0dWFsbHkgdGFrZSB0aW1lIHRvIHZlcmlmeSwgYW5kIHNvCj4geW91IG5lZWQgdG8gZmlyc3Qg
Y2hhbmdlIHRoZSB0eXBlIHRvIHRoZSBuZXcgdHlwZSAoc28gbm9ib2R5IHRyaWVzIHRvCj4gdXNl
IGl0IGFzIHlldCBhIGRpZmZlcmVudCB0eXBlKSwgdGhlbiB2ZXJpZnkgdGhhdCBpdCdzIE9LIHRv
IHVzZSBpdCBhcyBhCj4gcGFnZSB0YWJsZSAoYnkgcmVjdXJzaXZlbHkgY2hlY2tpbmcgYWxsIHRo
ZSBlbnRyaWVzKSwgdGhlbiBzZXQgdGhlCj4gUEdUX3ZhbGlkYXRlZCBiaXQuCj4KPiA+IFllcyBz
b21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXMgaXMgd2hhdCBJJ20gYWZ0ZXIuIEJ1dCAidGhlc2Ug
ZmxhZ3MiCj4gPiByZWFsbHkgaXMganVzdCBQR1RfdmFsaWRhdGVkLgo+Cj4gSGVyZSdzIG15IHRh
a2U6Cj4KPiBUaGUgc29ydHMgb2YgIm5lZWRzIHZhbGlkYXRpb24iIHR5cGVzIGFyZSBQVi1vbmx5
IEkgYmVsaWV2ZTsgaWYKPiBtZW1fc2hhcmluZyBpcyBvbmx5IGZvciBIVk0gZ3Vlc3RzLCB0aGVu
IHRoZSB0eXBlcyBzaG91bGQgb25seSBiZQo+IFBHVF93cml0YWJsZSwgZm9yIHdoaWNoIFBHVF92
YWxpZGF0ZWQgc2hvdWxkIGFsd2F5cyBiZSBzZXQuCgpJbiB3aGljaCBjYXNlIGl0IGRvZXMgc291
bmQgbGlrZSBpdCdzIGEgc3VwZXJmbHVvdXMgY2hlY2sgYnV0IGl0J3MKYWxzbyBoYXJtbGVzcy4K
Cj4KPiAqSWYqIHdlIHNvbWVob3cgZG8gZ2V0IHRvIGEgc2l0dWF0aW9uIHdoZXJlIHRoZSB0eXBl
IGNvdW50ID4gMCBidXQKPiBQR1RfdmFsaWRhdGVkIGlzIGNsZWFyLCBzb21ldGhpbmcgaGFzIHBy
b2JhYmx5IGdvbmUgdGVycmlibHkgd3Jvbmc7IGFuZAo+IGl0IHdvdWxkIHByb2JhYmx5IGJlIG11
Y2ggc2FmZXIgdG8ganVzdCBmYWlsIHRoZSBwYWdlIGxvY2suCgpJc24ndCB0aGF0IGV4YWN0bHkg
d2hhdCBoYXBwZW5zPwoKaWYgKCAhKHggJiBQR1RfdmFsaWRhdGVkKSB8fAogICAgICAgICAgICAg
ISh4ICYgUEdUX2NvdW50X21hc2spIHx8CiAgICAgICAgICAgICAhKG54ICYgUEdUX2NvdW50X21h
c2spICkKICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwoKPgo+IEJ1dCBwZXJoYXBzIHRoYXQgaW1w
bGllcyB0aGVyZSBzaG91bGQgYWxzbyBiZSBhbiBBU1NFUlQoISh4ICYKPiBQR1RfdmFsaWRhdGVk
KSk/CgpXZWxsLCBpZiB0aGUgbG9jayBmYWlsZWQgd2UgYWxyZWFkeSBCVUcgb3V0IHdoZW4gaXQn
cyBmb3IgcnVudGltZQpkZWR1cGxpY2F0aW9uIGFuZCByZXR1cm4gZXJyb3Igd2hlbiBpdCdzIGFu
IG9wZXJhdGlvbiBmcm9tIHRvb2xzdGFjay4KU28gSSBkb24ndCB0aGluayB3ZSBuZWVkIHRoYXQg
ZXh0cmEgQVNTRVJULgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
