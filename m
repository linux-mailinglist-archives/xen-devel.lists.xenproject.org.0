Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63DD6CEC0
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6Hs-0007zi-Q3; Thu, 18 Jul 2019 13:17:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho6Hr-0007zc-Ib
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:17:31 +0000
X-Inumbo-ID: 64df5884-a95e-11e9-ab24-cbee1a191e67
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64df5884-a95e-11e9-ab24-cbee1a191e67;
 Thu, 18 Jul 2019 13:17:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563455849; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Wqg2axRFT05+kHu6GGMEZsB+zr3ib/TiXWRUHk2EeSo=;
 b=tnuuUfLwO6acijjUBV7wYMSWd/3bOj4FrjuzJpzo5wVwvUSEUkGBf/6DQ63LLJ8M6/seX5kL
 IhVTqPIHarWqeuDOcEm5u4qA2HChoDGqEg/JYsC/FFKcGWFAYujq+9tIHB6ivPgVevbHfkCJ
 t5cZwKPGsC8DbKIn1uehb2oAOCk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mxa.mailgun.org with ESMTP id 5d307168.7f8c590d0d30-smtp-out-n03;
 Thu, 18 Jul 2019 13:17:28 -0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r1so28649203wrl.7
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 06:17:28 -0700 (PDT)
X-Gm-Message-State: APjAAAXmtQ4jufYnPm78otjcYU196gHUQXP/jv62nk/l30lyyel7JRAc
 xYMWFDB24/FOovSAL8eFF8RKyq5q+OCbELUbNfw=
X-Google-Smtp-Source: APXvYqxWNYQmdc0q3V9cx4ffIYrHYqTlxsSfPulgKFNC72RNkcqwBzeJYrl4zcLQxwDeRzNisTyIu5D7tdc+5HItMFA=
X-Received: by 2002:adf:9486:: with SMTP id 6mr17552036wrr.242.1563455847287; 
 Thu, 18 Jul 2019 06:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-6-tamas@tklengyel.com>
 <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
 <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
 <95234c89-846c-1f65-7418-0c2187aa0067@suse.com>
In-Reply-To: <95234c89-846c-1f65-7418-0c2187aa0067@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 07:16:51 -0600
X-Gmail-Original-Message-ID: <CABfawhmDTQ6d+FDhY3PLydE1rshew-EnRBH-SjgV2DLCdbAgiw@mail.gmail.com>
Message-ID: <CABfawhmDTQ6d+FDhY3PLydE1rshew-EnRBH-SjgV2DLCdbAgiw@mail.gmail.com>
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

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNzoxNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDcuMjAxOSAxNDo1OSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNDo1NiBBTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTcuMDcuMjAxOSAyMTozMywgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBAQCAtMTM2LDggKzEzNyw4IEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBfcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gPj4+ICAgICAgICAg
ICAgICAgIGNwdV9yZWxheCgpOwo+ID4+PiAgICAgICAgICAgIG54ID0geCArICgxIHwgUEdUX2xv
Y2tlZCk7Cj4gPj4+ICAgICAgICAgICAgaWYgKCAhKHggJiBQR1RfdmFsaWRhdGVkKSB8fAo+ID4+
PiAtICAgICAgICAgICAgICEoeCAmIFBHVF9jb3VudF9tYXNrKSB8fAo+ID4+PiAtICAgICAgICAg
ICAgICEobnggJiBQR1RfY291bnRfbWFzaykgKQo+ID4+PiArICAgICAgICAgICAgICAgICEoeCAm
IFBHVF9jb3VudF9tYXNrKSB8fAo+ID4+PiArICAgICAgICAgICAgICAgICEobnggJiBQR1RfY291
bnRfbWFzaykgKQo+ID4+PiAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPj4+ICAgICAg
ICB9IHdoaWxlICggY21weGNoZygmcGFnZS0+dS5pbnVzZS50eXBlX2luZm8sIHgsIG54KSAhPSB4
ICk7Cj4gPj4KPiA+PiBBcmVuJ3QgeW91IHNjcmV3aW5nIHVwIGluZGVudGF0aW9uIGhlcmU/IEl0
IGxvb2tzIHdyb25nIGJvdGggaW4gbXkKPiA+PiBtYWlsIGNsaWVudCdzIHZpZXcgYW5kIG9uIHRo
ZSBsaXN0IGFyY2hpdmVzLCB3aGVyZWFzLiBGdXJ0aGVybW9yZQo+ID4+IHRoaXMgaXMgY29kZSB5
b3UndmUgaW50cm9kdWNlZCBlYXJsaWVyIGluIHRoZSBzZXJpZXMsIHNvIGl0IHNob3VsZAo+ID4+
IGJlIGdvdCByaWdodCB0aGVyZSwgbm90IGhlcmUuCj4gPgo+ID4gVGhlIHN0eWxlIHdhcyBhdXRv
LWFwcGxpZWQgd2l0aCBhc3R5bGUgdXNpbmcgdGhlIGJzZCBmb3JtYXQuIEluIHRoZQo+ID4gcHJl
dmlvdXMgcGF0Y2ggdGhlcmUgd2VyZSBubyBzdHlsZS1jaGFuZ2VzIGFwcGxpZWQgYmVjYXVzZSBp
dCB3YXMgYQo+ID4gY29weS1wYXN0ZSBqb2IgZnJvbSB0aGUgb3RoZXIgY29kZSBsb2NhdGlvbi4g
SSByYXRoZXIga2VlcAo+ID4gY29kZS1jb3B5aW5nIGFuZCBzdHlsZSBmaXhlcyBzZXBhcmF0ZS4K
Pgo+IEJ1dCB5b3UncmUgYWN0aXZlbHkgYnJlYWtpbmcgWGVuIHN0eWxlIGhlcmUgKGFuZCBiZWxv
dykuCgpJIGRvbid0IHNlZSBhbnkgbWVudGlvbiBvZiBzdHlsZSByZXN0cmljdGlvbnMgcmVnYXJk
aW5nIHRoaXMgaW4KQ09ESU5HX1NUWUxFLiBJZiB0aGVyZSBpcywgSSB3b3VsZCBwcmVmZXIgY2hh
bmdpbmcgdGhhdCBzbyB3ZSBjYW4KYXV0b21hdGUgc3R5bGUgY2hlY2tzIHdoaWNoIElNSE8gYXJl
IHRoZSBiaWdnZXN0IHdhc3RlIG9mIGV2ZXJ5b25lJ3MKdGltZSB0byBkbyBtYW51YWxseS4KClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
