Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30AE11A9A
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:57:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCA9-0007ZF-MM; Thu, 02 May 2019 13:54:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bVeI=TC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMCA7-0007Z6-Tv
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:54:11 +0000
X-Inumbo-ID: c2ffc487-6ce1-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2ffc487-6ce1-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 13:54:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556805250; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=kMBEk9CaB7fEy6FBGCys7yBsp1jTWpu/yZgh64qlY4Q=;
 b=NvW8jjv+rgIAr3Qzf9s6ScWgdLvXgTVgIfVPNp0wKTORyaEZbL5p+GY4s40G9xya4+rGFO5Q
 bniP2vQxcKQNXjj4L6KNtMqetprZvyXJdiN0cXWQSLzHZMcuo9zsSuahtWCA2zCD4+UGpD2V
 kq0+ujSxoLqCTjUb8CP3xdxZlOU=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mxa.mailgun.org with ESMTP id 5ccaf682.7f98e08510b0-smtp-out-n02;
 Thu, 02 May 2019 13:54:10 -0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id w15so2764777wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 06:54:10 -0700 (PDT)
X-Gm-Message-State: APjAAAVebkYbG8g0pt1pfwIncky+i971RglvjQX2zNbM7rDiSQRHZ7kd
 bi/PxQkS71Ehm/n8njfKQXcPjP0dGBoij4huJIA=
X-Google-Smtp-Source: APXvYqyazS2atUd6dPO6xLivb1E1RGCtM4fBXDHX08/z5gNKXsD1dYPnoTiZbibxAm0RGbAinHX0GUlWdvzvzPuLmjY=
X-Received: by 2002:a1c:35c3:: with SMTP id c186mr2617018wma.135.1556805249374; 
 Thu, 02 May 2019 06:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
 <5CCAB0FC020000780022B12F@prv1-mh.provo.novell.com>
 <CABfawh=Kmsj=y1XcV8fiqbCZ6_bDp2-E+OoQHr_+_NCAy4OeSw@mail.gmail.com>
 <5CCAF0F1020000780022B416@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAF0F1020000780022B416@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 2 May 2019 07:53:33 -0600
X-Gmail-Original-Message-ID: <CABfawhkpSz6mOr+1jhQtw=08ZZWvne1agJkbsXdNYbGRrs33OQ@mail.gmail.com>
Message-ID: <CABfawhkpSz6mOr+1jhQtw=08ZZWvne1agJkbsXdNYbGRrs33OQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA3OjMwIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDIuMDUuMTkgYXQgMTU6MDksIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IFRoYXQgc2FpZCBJIGRvbid0IGhhdmUgYSB1c2UgZm9yIGlkdCBh
bmQgZ2R0cl9saW1pdCB0aGF0IHdhcnJhbnRzCj4gPiBoYXZpbmcgdG8gcmVjZWl2ZSBpdCB2aWEg
dGhlIHZtX2V2ZW50IHN0cnVjdHVyZQo+Cj4gU28gd2hhdCB1c2UgaWYgdGhlIEdEVCBiYXNlIHdp
dGhvdXQgdGhlIGxpbWl0PyBBcmUgeW91IHNpbGVudGx5Cj4gYXNzdW1pbmcgYWxsIHByZXNlbnRs
eSBsb2FkZWQgc2VsZWN0b3JzIGFyZSAoc3RpbGwpIHdpdGhpbiBsaW1pdHM/CgpPbiAzMi1iaXQg
V2luZG93cyB0aGUgS1BDUidzIGFkZHJlc3MgaXMgY2FjaGVkIGF0IGdkdHJfYmFzZSArIDB4MzAK
d2hpbGUgaW4gcmluZzMuIEluIHJpbmcwIHdlIGNhbiBqdXN0IHVzZSBmc19iYXNlIGZvciB0aGF0
LiBBdCB0aGUKbW9tZW50IEkgc3RpbGwganVzdCBjYWNoZSB0aGUgS1BDUiBsb2NhdGlvbiBvbiBl
dmVyeSBNT1YtVE8tQ1IzIGJ1dAp0aGF0IGJlY2FtZSBhbiBpc3N1ZSB3aXRoIHJlY2VudCB2ZXJz
aW9ucyBvZiBXaW5kb3dzMTAgaW1wbGVtZW50aW5nCk1lbHRkb3duIG1pdGlnYXRpb25zIGJlY2F1
c2UgaXQgbGVhZHMgdG8gZXh0cmVtZSBwZXJmb3JtYW5jZQpkZWdyYWRhdGlvbiBpbiB0aGUgZ3Vl
c3QgKG9wZW5pbmcgYW4gYXBwIHRha2VzIH4yMHMpLiBTbyBub3cgSSBqdXN0CnRyeSB0byBmaW5k
IHRoZSBLUENSIGJhc2VkIG9uIHRoZSByZWdpc3RlcnMgcmVwb3J0ZWQgaW4gZWFjaCB2bV9ldmVu
dC4KV2UgdXNlIHRoZSBLUENSIHRvIHF1aWNrbHkgZmluZCB0aHJlYWQvcHJvY2VzcyBiYXNlIGFk
ZHJlc3NlcyB0bwpnYXRoZXIgaW5mbyByZWxldmFudCB0byBpbnRyb3NwZWN0aW9uLgoKVGFtYXMK
ClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
