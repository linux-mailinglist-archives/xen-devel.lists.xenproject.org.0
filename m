Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2711432A0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 20:47:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itcz1-0007TL-UX; Mon, 20 Jan 2020 19:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itcz0-0007TG-Lu
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 19:45:10 +0000
X-Inumbo-ID: 5d997298-3bbd-11ea-9fd7-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d997298-3bbd-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 19:45:10 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y4so300558ljj.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 11:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c9R92c047PuZl9WvEd7QDPmzdNl7Op2IGz8dQjRWmjU=;
 b=vaEJQNqZQqWr2abbG42L/LJAPYDkptZOezAuIW4CsbUduMAijTe6OI7IklZjv3Xv0V
 O0arYV7USh0mzmlZx3UENXiu2qoz37aU1LpczNcCTs1t0T18YTVvXT5B/mxAFmnDxWrh
 SUMaGh32ui/DIq81N1cWb1T15wY7918OaQIyRTHZ2Qi4lDzcCiJT5cDqLYMDRK73MhTs
 GYshdR2bGDlZPpdzwiYBMVXgFptdAdFfACKSd3bU54yBdXBkDuHlLOWkADe7W2Z2kXhX
 xaiwa8Fdz3bh8tg4CXfDlTjK7NxvQ41+gVZZDMcxLWTPDd8NWLfTbvjQTmTIa46FP435
 RZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c9R92c047PuZl9WvEd7QDPmzdNl7Op2IGz8dQjRWmjU=;
 b=S2LgAJIcJNCE1aoL8wIDeWmOnSh2mwSSnZUPHqAts6kBDiLxxwBiBWow/3Hl0E+jWB
 G7nrFlVVYsCPH24gthKli7+R8LqeP+INIiqfasJLF2MlTYzEqkKiNKdAT4rlW0oRmLHX
 yINVHsdrRfGAyODL7oqTWMqfobcF7Hjavtj+7ve9FBKvgFZzFCl7zrfbijjxtcbFk2fu
 /aDsmFuw+QVVDQEAsALGYjqxRzX8R/MNZCiLOk1qX+LHyQUMv2mUR8MI9A1wOXMTUKm9
 QaR2VFMfeHJP/2VuGBKpcMgP2BI+0gDF9awYSYBzmJfwPxhDKhyFKD/HuWqcRvImJVu5
 GOjg==
X-Gm-Message-State: APjAAAWbAZh8zxNI9PqBBw68IBnaKOC429hYOhfOWRVLacgFRcLa/KMl
 A4ONCFXSZBiqj0aQ1hszMnq5uyTEgPIhxUlnrn4=
X-Google-Smtp-Source: APXvYqyk+GNmYDkiQsHl8PsCOtSb1/PR6vCbFj6HHpsiZqBqiFAMB2UrO0eI1tO0+0Sd4xWGnwepwTOUR97/hZ1fIao=
X-Received: by 2002:a2e:9cd2:: with SMTP id g18mr12080159ljj.272.1579549508999; 
 Mon, 20 Jan 2020 11:45:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <047e5ff567ac0c2e0bd92fd8741c03d07b548ab5.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <047e5ff567ac0c2e0bd92fd8741c03d07b548ab5.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 14:44:58 -0500
Message-ID: <CAKf6xpsu2yvtEaQoweWxkR3G3zUM+1Edkoxh4-6MQyXYMKniqw@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 08/16] tools/libvchan: notify server when
 client is connected
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gTGV0IHRoZSBz
ZXJ2ZXIga25vdyB3aGVuIHRoZSBjbGllbnQgaXMgY29ubmVjdGVkLiBPdGhlcndpc2Ugc2VydmVy
IHdpbGwKPiBub3RpY2Ugb25seSB3aGVuIGNsaWVudCBzZW5kIHNvbWUgZGF0YS4KPiBUaGlzIGNo
YW5nZSBkb2VzIG5vdCBicmVhayBleGlzdGluZyBjbGllbnRzLCBhcyBsaWJ2Y2hhbiB1c2VyIHNo
b3VsZAo+IGhhbmRsZSBzcHVyaW91cyBub3RpZmljYXRpb25zIGFueXdheSAoZm9yIGV4YW1wbGUg
YWNrbm93bGVkZ2Ugb2YgcmVtb3RlCj4gc2lkZSByZWFkaW5nIHRoZSBkYXRhKS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT4KPiAtLS0KPiBJIGhhZCB0aGlzIHBhdGNoIGluIFF1YmVzIGZvciBhIGxv
bmcgdGltZSBhbmQgdG90YWxseSBmb3Jnb3QgaXQgd2Fzbid0Cj4gdXBzdHJlYW0gdGhpbmcuLi4K
PiAtLS0KPiAgdG9vbHMvbGlidmNoYW4vaW5pdC5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnZjaGFuL2luaXQuYyBi
L3Rvb2xzL2xpYnZjaGFuL2luaXQuYwo+IGluZGV4IDE4MDgzM2QuLjUwYTY0YzEgMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvbGlidmNoYW4vaW5pdC5jCj4gKysrIGIvdG9vbHMvbGlidmNoYW4vaW5pdC5j
Cj4gQEAgLTQ0Nyw2ICs0NDcsOSBAQCBzdHJ1Y3QgbGlieGVudmNoYW4gKmxpYnhlbnZjaGFuX2Ns
aWVudF9pbml0KHN0cnVjdCB4ZW50b29sbG9nX2xvZ2dlciAqbG9nZ2VyLAo+ICAgICAgICAgY3Ry
bC0+cmluZy0+Y2xpX2xpdmUgPSAxOwo+ICAgICAgICAgY3RybC0+cmluZy0+c3J2X25vdGlmeSA9
IFZDSEFOX05PVElGWV9XUklURTsKPgo+ICsgICAgLyogd2FrZSB1cCB0aGUgc2VydmVyICovCj4g
KyAgICB4ZW5ldnRjaG5fbm90aWZ5KGN0cmwtPmV2ZW50LCBjdHJsLT5ldmVudF9wb3J0KTsKCkxv
b2tzIGxpa2UgeW91IHVzZWQgNCBzcGFjZXMsIGJ1dCB0aGUgdXBzdHJlYW0gZmlsZSB1c2VzIGhh
cmQgdGFicy4KClJlZ2FyZHMsCkphc29uCgo+ICAgb3V0Ogo+ICAgICAgICAgaWYgKHhzKQo+ICAg
ICAgICAgICAgICAgICB4c19kYWVtb25fY2xvc2UoeHMpOwo+IC0tCj4gZ2l0LXNlcmllcyAwLjku
MQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
