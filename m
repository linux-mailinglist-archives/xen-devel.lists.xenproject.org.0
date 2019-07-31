Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D87BC70
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 11:00:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hskQf-0006qq-76; Wed, 31 Jul 2019 08:57:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mXbA=V4=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hskQd-0006ql-0R
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:57:47 +0000
X-Inumbo-ID: 430928a6-b371-11e9-8980-bc764e045a96
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 430928a6-b371-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 08:57:45 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id h6so9416542iom.7
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PqEr3cD7Lx/8KhMwXt3lz+eROXgcKWsN3uB6Q9pP5wE=;
 b=G87oLswwu52x4EA/8mZYqJ/aPU41prnEWy6/KHkhNPVnGTakjK0mR7JAJ3HYHilgRD
 Lv9zQKU+T6bhiaf8Q4dpBRHncnoyJv+enYPlmitmOiJUba54kSLjiCljtr7AuV29Ptnz
 irVEa2K+WJVyLKt79nlRlELHIGeUZ2JieupOUsYmlmbc8kib8yO3nPP1Ji1S89M4GFML
 2vv7wV8e8KsBJ5ZD7oeoNSAbT15zlTJsJT4rxmaEMR1GYbxW+PAOPbSWNIna7DCZzBZl
 M70vVm+UZ7WIapkOlVQ6b/TbEye/D2SaZ4ul+HNPPDcnq5mNrk/juaeocbe0pXd11C/H
 K6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PqEr3cD7Lx/8KhMwXt3lz+eROXgcKWsN3uB6Q9pP5wE=;
 b=F0+Dg7w+wRHn3Qek+EM7/T2LATpES55YVD1WnZlrKEUw8D3qhBy5hp0AFiuFNvvNyS
 rlN2xENHVc2NOoOAJgXrXZHNroJYcoIorEJcKQmJQuGA0IN/hPbs8h05R0wGiN55Fzg2
 cMiY74tidG7XWItTA6NlIHTPA9hLljF/96rkcoCsjUOpvrIarcEb4H+Oh3/DJ/XAUufh
 ooeTmExT1oaTQ1xJH5yvH3bQWcf/WIz0uY2zxQ9YBStMJ63FhmZPFQ69n5zCTAI6XWyq
 usT28rIs2IEYpzBVSG+BayOGsqihjc8btuKoT3FeUjzO1XJ4n93WZxzPsahOLvvlmOjZ
 JQ6A==
X-Gm-Message-State: APjAAAUjgJV2/vmKI9vAOG94piSs7qYRrXRxkyNcVx1hMh5MpLTE14hO
 U/qRjwkepl9ufD5NeNVkJJ/xpCStGpf46nahB5M=
X-Google-Smtp-Source: APXvYqylP9y34WTKCH1XEnzQOf01D6xnAq8rNVAdWi5lC6z5QU1e5BbSENLzN0BV51bVQS3nfTsmpbqcBQuIZ4pDPO0=
X-Received: by 2002:a02:b10b:: with SMTP id
 r11mr118133884jah.140.1564563464543; 
 Wed, 31 Jul 2019 01:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190731081041.25256-1-viktor.mitin.19@gmail.com>
 <934d90a9-0b01-1b5a-0d41-c7692c9a29ec@arm.com>
In-Reply-To: <934d90a9-0b01-1b5a-0d41-c7692c9a29ec@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Wed, 31 Jul 2019 11:57:33 +0300
Message-ID: <CAOcoXZbP_e7Ye4wTTyA9a=tF240EHQwb7+ikJ4ZCq+VQ0XKL_g@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v4] xen/doc: Improve Dom0-less documentation
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
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTE6NDAgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgpIaSBKdWxpZW4sCgoKPiBPbiA3LzMxLzE5IDk6
MTAgQU0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiA+IC0gQ2hhbmdlZCB1bnByaW50YWJsZSBjaGFy
YWN0ZXJzIHdpdGggJXMvXCV4QTAvIC9nCj4gPiAgICBTbyBhbGwgdGhlIHNwYWNlcyBhcmUgMHgy
MCBub3cuCj4gPgo+ID4gLSBBZGRlZCBhZGRyZXNzLWNlbGxzIGFuZCBzaXplLWNlbGxzIHRvIGNv
bmZpZ3VyYXRpb24gZXhhbXBsZS4KPiA+ICAgIFRoaXMgcmVzb2x2ZXMgdGhlIGRvbTBsZXNzIGJv
b3QgaXNzdWUgaW4gY2FzZSBvZiBhcm02NC4KPiA+Cj4gPiAtIEFkZGVkIHNvbWUgbm90ZXMgYWJv
dXQgeGwgdG9vbHMgdXNhZ2UgaW4gY2FzZSBvZiBkb20wbGVzcy4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KPiA+IC0tLQo+ID4gdjQg
dXBkYXRlczoKPiA+ICAgICAtIGZpeGVkIGNwdXMgPDE+Owo+ID4gICAgIC0gYWRkZWQgbWVtb3J5
IHNpemUgbm90ZTsKPiA+ICAgICAtIGNoYW5nZWQgc29tZSBudW1iZXJzIHRvIGRlY2ltYWw7Cj4g
Pgo+ID4gLS0tCj4gPiAgIGRvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jIHwgNjEgKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQyIGlu
c2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kb2NzL2Zl
YXR1cmVzL2RvbTBsZXNzLnBhbmRvYyBiL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jCj4g
PiBpbmRleCBlMDc2ZTM3MzllLi5hMmM5NWQxZmQ0IDEwMDY0NAo+ID4gLS0tIGEvZG9jcy9mZWF0
dXJlcy9kb20wbGVzcy5wYW5kb2MKPiA+ICsrKyBiL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFu
ZG9jCj4gPiBAQCAtNDAsOCArNDAsOCBAQCB0byBib290LiBGb3IgZXhhbXBsZSBpZiB0aGlzIGlz
IHRoZSBib290Y21kIGZvciBYZW4gYW5kIERvbTA6Cj4gPgo+ID4gICAgICAgYm9vdG0gMHgxNDAw
MDAwIDB4OTAwMDAwMCAweDEyODAwMDAKPiA+Cj4gPiAtSWYgd2Ugd2FudCB0byBhZGQgb25lIERv
bVUgd2l0aCBJbWFnZS1Eb21VIGFzIHRoZSBEb21VIGtlcm5lbAo+ID4gLWFuZCByYW1kaXNrLURv
bVUgYXMgRG9tVSByYW1kaXNrOgo+ID4gK0lmIHdlIHdhbnQgdG8gYWRkIG9uZSBEb21VIHdpdGgg
SW1hZ2UtRG9tVSBhcyB0aGUgRG9tVSBrZXJuZWwKPiA+ICthbmQgcmFtZGlzay1Eb21VIGFzIERv
bVUgcmFtZGlzazoKPiA+Cj4gPiAgICAgICB0ZnRwYiAweDEyODAwMDAgeGVuLmR0Ygo+ID4gICAg
ICAgdGZ0cGIgMHg4MDAwMCB4ZW4tSW1hZ2UKPiA+IEBAIC02MSwyNyArNjEsMzIgQEAgdGhlIHBy
ZXNlbmNlIG9mIHRoZSBhZGRpdGlvbmFsIFZNIGFuZCBpdHMgY29uZmlndXJhdGlvbi4gSXQgaXMg
ZG9uZSB2aWEKPiA+ICAgZGV2aWNlIHRyZWUgYWRkaW5nIGEgbm9kZSB1bmRlciAvY2hvc2VuIGFz
IGZvbGxvd3M6Cj4gPgo+ID4gICAgICAgZG9tVTEgewo+ID4gLSAgICAgICAgY29tcGF0aWJsZSA9
ICJ4ZW4sZG9tYWluIjsKPiA+IC0gICAgICAgIG1lbW9yeSA9IDwweDIwMDAwPjsKPiA+IC0gICAg
ICAgIGNwdXMgPSAxOwo+ID4gLSAgICAgICAgdnBsMDExOwo+ID4gLQo+ID4gLSAgICAgICAgbW9k
dWxlQDIwMDAwMDAgewo+ID4gLSAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LGtl
cm5lbCIsICJtdWx0aWJvb3QsbW9kdWxlIjsKPiA+IC0gICAgICAgICAgICByZWcgPSA8MHgyMDAw
MDAwIDB4ZmZmZmZmPjsKPiA+IC0gICAgICAgICAgICBib290YXJncyA9ICJjb25zb2xlPXR0eUFN
QTAiOwo+ID4gLSAgICAgICAgfTsKPiA+IC0KPiA+IC0gICAgICAgIG1vZHVsZUAzMDAwMDAwMCB7
Cj4gPiAtICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0
aWJvb3QsbW9kdWxlIjsKPiA+IC0gICAgICAgICAgICByZWcgPSA8MHgzMDAwMDAwIDB4ZmZmZmZm
PjsKPiA+IC0gICAgICAgIH07Cj4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+
ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJ4
ZW4sZG9tYWluIjsKPiA+ICsgICAgICAgIG1lbW9yeSA9IDwwIDUyNDI4OD47Cj4KPiBGb3IgYSBm
aXJzdCwgdGhlIG5ldyB2YWx1ZSBkb2VzIG5vdCBtYXRjaCB0aGUgb2xkIG9uZSAoMHgyMDAwMCA9
IDEzMTA3Mgo+IGluIGRlY2ltYWwpLgo+Cj4gSG93ZXZlciwgdGhpcyBkb2VzIG5vdCBtYWtlcyBt
dWNoIHNlbnNlIHRvIGRlc2NyaWJlIHRoZSBtZW1vcnkgc2l6ZSBpbgo+IGRlY2ltYWwgaGVyZSBh
bmQgLi4uCj4KPiA+ICsgICAgICAgIGNwdXMgPSA8MT47Cj4gPiArICAgICAgICB2cGwwMTE7Cj4g
PiArCj4gPiArICAgICAgICBtb2R1bGVAMjAwMDAwMCB7Cj4gPiArICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11bHRpYm9vdCxtb2R1bGUiOwo+ID4gKyAgICAg
ICAgICAgIHJlZyA9IDwweDIwMDAwMDAgMHhmZmZmZmY+Owo+Cj4gLi4uIGhlcmUgaW4gaGV4YWRl
Y2ltYWwuIEZvciBtZW1vcnksIGl0IGlzIGZhaXJseSBjb21tb24gdG8gdXNlIGhleGFkZWNpbWFs
Lgo+Cj4gSSBjYW4gc3dpdGNoIHRoZSBtZW1vcnkgcHJvcGVydHkgYmFjayB0byBoZXhhZGVjaW1h
bCBvbiBjb21taXQuIEJ1dCBJCj4gd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSB0aGUgdmFs
dWUgaGFzIGNoYW5nZWQgYmVmb3JlIGRvaW5nIHRoYXQuCgpPaywgbGV0J3Mga2VlcCBoZXhhZGVj
aW1hbC4KMTI4TWIgaXMgb2sgaW4gdGhpcyBleGFtcGxlLCBJIHVzZSA1MTJNYiBmb3IgbXkgdGVz
dHMsCnNvIHdoaWxlIHRlc3RpbmcgdGhpcyBleGFtcGxlIEkgY2hhbmdlZCBpdCBhbmQgZGlkbid0
IHJlc3RvcmUuCgpUaGlzIHNob3VsZCBiZSBsZWZ0IHVudG91Y2hlZCwgYXMgeW91IG1lbnRpb25l
ZC4KbWVtb3J5ID0gPDB4MCAweDIwMDAwPjsKClRoYW5rcwoKPgo+IENoZWVycywKPgo+IC0tCj4g
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
