Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA05847E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 16:31:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgVNm-0007Yw-W2; Thu, 27 Jun 2019 14:28:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZViG=U2=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1hgVNl-0007Yr-Tv
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 14:28:13 +0000
X-Inumbo-ID: cb0e894b-98e7-11e9-8980-bc764e045a96
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb0e894b-98e7-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 14:28:13 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s49so7323042edb.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2019 07:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4jiA8XGSBN8OpIJNRtPP1ZU8b1ZquQ4ku5/iy+utuQ=;
 b=NAZ5EryBws9rKDjHoAoW1qXryIPF5uVZ7K3IP0Vps5J6B9lSL7TOrhWYzGvD3O2Iso
 AaVlRySOff9iGnEVaAEAtxlPDgKCaL9+31/LRxoMhmNy0HHBbMk6zcvppZ7QxsI8kFVb
 0wSTCrwcCJ5ADyAddj+VXuYbN+U/I46tia9bcy4Iy9yeC4xn5rVH27INyNdL0FxgLj7N
 wbudpHfLWf5ADfeS1lCYT47Yaezauuh5H1F0BMPRygVblMP9hRLyO08lXZkh0ydXD0MI
 2NsHz8F1xo/0dhmj7GhYgg8pk83x8qr7pF47uHbYhcLGkzt3SLrYue89HPPOZrB52VG7
 vadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4jiA8XGSBN8OpIJNRtPP1ZU8b1ZquQ4ku5/iy+utuQ=;
 b=ULk5oX/E+zCaoux6HjpRvCDtznQfTS7iOZmojD6LapZm6tjQb0tGGmIr2e6itms0IA
 Nixhi77u2roTBom5ERCRw99y/90WjlSnbfTGBKZmnc6f6zWiew4K5ExHYZ0NHPkLNB8v
 dQPCBi8ggIHA4k1vrnfZvl/OPGhOovkn3IQYpeHgYHzRLYa2OtYrGm4/C2dG+Ug0fCWM
 PVY8M1RLBsDHndGGG6IIR6IzVU1lhajOH+Jo1jEJ7vsv1vJNZ9e8umpcRQDZl0A2bY15
 g76Y1aTWOGs785hwUivWx/IVZ0AinFYABex8e6+xPv0pRtS8yUtzsN1TXvgEORYzjImY
 62bA==
X-Gm-Message-State: APjAAAXVCfAKlPPPUV9eR3BK0UBawSdmHhJPRsTbcNzYd6l3+SMthFf9
 DUqJP62haC4PvyV22tOqn0xCWOF52Zgtpm/vY6UMj+TuxqY=
X-Google-Smtp-Source: APXvYqzsq5oVOmV0eL8Ae8vh4p+Kam+Z9xN1xB+Q/trVilHzRQGYIWRW4sExPHezar5rdBsxOF71Fhb3cSfxRMug/Io=
X-Received: by 2002:a17:906:4a10:: with SMTP id
 w16mr3469776eju.299.1561645691917; 
 Thu, 27 Jun 2019 07:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190626102732.27872-1-nicolas.belouin@gandi.net>
In-Reply-To: <20190626102732.27872-1-nicolas.belouin@gandi.net>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 27 Jun 2019 15:28:00 +0100
Message-ID: <CAFLBxZbhhmxao+p0BEigHzbYNzu4TzpgFcs9e6PaUEdwDTgErA@mail.gmail.com>
To: Nicolas Belouin <nicolas.belouin@gandi.net>
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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

VGhhbmtzIGZvciB0aGUgcGF0Y2ghICBMb29rcyBsaWtlIGEgZ29vZCBzdGFydDsganVzdCBhIGNv
dXBsZSBvZiBjb21tZW50czoKCk9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDExOjMxIEFNIE5pY29s
YXMgQmVsb3Vpbgo8bmljb2xhcy5iZWxvdWluQGdhbmRpLm5ldD4gd3JvdGU6Cj4KPiBUaGUgR28g
YmluZGluZ3MgZm9yIGxpYnhsIG1pc3MgZnVuY3Rpb25zIGZyb20gbGlieGxfdXRpbHMsIGxldHMg
c3RhcnQKCmxldCdzCgo+IHdpdGggdGhlIHNpbXBsZSBsaWJ4bF9kb21pZF90b19uYW1lIGFuZCBp
dHMgY291bnRlcnBhcnQKPiBsaWJ4bF9uYW1lX3RvX2RvbWlkLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Tmljb2xhcyBCZWxvdWluIDxuaWNvbGFzLmJlbG91aW5AZ2FuZGkubmV0PgoKPiAraW1wb3J0ICJD
Igo+ICsKPiArLyoKPiArICogT3RoZXIgZmxhZ3MgdGhhdCBtYXkgYmUgbmVlZGVkIGF0IHNvbWUg
cG9pbnQ6Cj4gKyAqICAtbG5sLXJvdXRlLTMgLWxubC0zCj4gKyAqCj4gKyAqIFRvIGdldCBiYWNr
IHRvIHN0YXRpYyBsaW5raW5nOgo+ICsgKiAjY2dvIExERkxBR1M6IC1seGVubGlnaHQgLWx5YWps
X3MgLWx4ZW5nbnR0YWIgLWx4ZW5zdG9yZSAtbHhlbmd1ZXN0IC1seGVudG9vbGxvZyAtbHhlbmV2
dGNobiAtbHhlbmN0cmwgLWx4ZW5mb3JlaWdubWVtb3J5IC1seGVuY2FsbCAtbHogLWx1dWlkIC1s
dXRpbAo+ICsgKi8KCkkgdGhpbmsgd2UgY2FuIGRyb3AgdGhpcyBjb21tZW50IC0tIGlmIGFueW9u
ZSBkZWNpZGVzIHRoZXkgd2FudCB0byBnbwpiYWNrIHRvIHN0YXRpYyBsaW5raW5nLCBvciB0byBh
ZGQgdGhvc2Ugb3RoZXIgZmxhZ3MsIHRoZXkgY2FuIGdldCB0aGVtCmZyb20gYHhlbmxpZ2h0Lmdv
YC4KCj4gK2ltcG9ydCAoCj4gKyAgICAgICAidW5zYWZlIgo+ICspCj4gKwo+ICsvL2NoYXIqIGxp
YnhsX2RvbWlkX3RvX25hbWUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkKTsKPiArZnVu
YyAoQ3R4ICpDb250ZXh0KSBEb21pZFRvTmFtZShpZCBEb21pZCkgKG5hbWUgc3RyaW5nKSB7Cj4g
KyAgICAgICBjRG9tTmFtZSA6PSBDLmxpYnhsX2RvbWlkX3RvX25hbWUoQ3R4LmN0eCwgQy51aW50
MzJfdChpZCkpCgpsaWJ4bF9kb21pZF90b19uYW1lKCkgZXhwZWN0cyB0aGUgY2FsbGVyIHRvIGZy
ZWUoKSB0aGUgc3RyaW5nIHJldHVybmVkCnRvIGl0LiAgUHJvYmFibHkgYmVzdCBpZiB3ZSBgZGVm
ZXIgQy5mcmVlKClgIGhlcmUuCgpFdmVyeXRoaW5nIGVsc2UgbG9va3MgZ29vZCwgdGhhbmtzIQoK
IC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
