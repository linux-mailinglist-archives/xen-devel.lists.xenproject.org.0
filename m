Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BFE148679
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 15:02:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuzVJ-0007Ob-Sq; Fri, 24 Jan 2020 14:00:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s6by=3N=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iuzVH-0007LT-Ri
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 14:00:07 +0000
X-Inumbo-ID: cef3f5e8-3eb1-11ea-b833-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cef3f5e8-3eb1-11ea-b833-bc764e2007e4;
 Fri, 24 Jan 2020 13:59:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579874399; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=YzfyDgPlJA214vRemuFIW6cPbZusvKokGGqm0x/h4bo=;
 b=ruqExUJCTS9TYv2OcykWkMONFza+YNvGL0H+tGeuzjYFdVRYP0FFAUReYXDbJ2Gp1YqZtqdp
 3bp1vye/2UALfCrXjt2U5OgkmKrXiqRyCA5DQO1yadIDF0YYNF5vOfwLzw2gFCmEpfy0g8yt
 8ZMyUzsi0vUvXUy32A9nSZTMBTw=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5e2af85b.7fc8f231bc70-smtp-out-n03;
 Fri, 24 Jan 2020 13:59:55 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id b6so2118433wrq.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 05:59:55 -0800 (PST)
X-Gm-Message-State: APjAAAUl+SU6oIZrZu6ktamg6mI2FJUlG0mhu9lHq25C4ZUwMJuGljzL
 TZWIeE2hvtjXk9/ij7UvKlTAQIOx90t2rTmZYoQ=
X-Google-Smtp-Source: APXvYqwyIgJ3CulVUua+WGo+qmrdC7aA1W2NjK/DRKcXmtY1P7fEMB6/PfGAyezxS/M7oK4Ck2nbkii552VsfGdZtk0=
X-Received: by 2002:adf:f288:: with SMTP id k8mr4773493wro.301.1579874394322; 
 Fri, 24 Jan 2020 05:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20200124135621.105766-1-tamas@tklengyel.com>
 <d685f237-fb0c-154d-29cd-021dfa6f34f2@citrix.com>
In-Reply-To: <d685f237-fb0c-154d-29cd-021dfa6f34f2@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 24 Jan 2020 06:59:17 -0700
X-Gmail-Original-Message-ID: <CABfawhmmCPS8tvPRCCYZ4kcyV=Ptnws6hSToUKxHwqyTiGq9Mg@mail.gmail.com>
Message-ID: <CABfawhmmCPS8tvPRCCYZ4kcyV=Ptnws6hSToUKxHwqyTiGq9Mg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/mem_access: move _ve functions to x86
 header
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgNjo1NyBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDI0LzAxLzIwMjAgMTM6NTYsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IFRoZXNlIGZ1bmN0aW9ucyBkb24ndCBiZWxvbmcgaW4gdGhlIGNv
bW1vbiBtZW1fYWNjZXNzIGhlYWRlciBhcyB0aGVyZSBpcyBubyAjVkUKPiA+IGVxdWl2YWxlbnQg
b24gQVJNLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4KPgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLCBidXQgSmFuIGhhcyBhbHJlYWR5
IGNvbW1pdHRlZCB0aGUgbW9yZSBzaW1wbGUKPiBidWlsZCBmaXguICBDYW4geW91IHJlYmFzZSB0
aGlzIG9uIHN0YWdpbmc/Cj4KCkl0IGlzIGJhc2VkIG9uIHN0YWdpbmcuCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
