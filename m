Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9094B7856
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:22:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuTi-0006WH-87; Thu, 19 Sep 2019 11:20:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r/sg=XO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iAuTg-0006Tc-DY
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:20:00 +0000
X-Inumbo-ID: 69b97018-dacf-11e9-9656-12813bfff9fa
Received: from mail-lf1-f66.google.com (unknown [209.85.167.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69b97018-dacf-11e9-9656-12813bfff9fa;
 Thu, 19 Sep 2019 11:19:58 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d17so2069506lfa.7
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 04:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XP04pbRdJfTEnupAu2bNkFZvuiYGub/b1tDOt09PhAo=;
 b=NDJ608u5aQSjq4PmRL6XAm8hOzz8WA2AdjVdu7i7kALgFkr0aFRHcC+fC0GRRJD/JE
 xX2C/X+HMFAvHooqOAe32qKQ5LvZPJEQTp2on2FtN56+XKwh1abEYDWyhC3ckUYL9SOt
 PvZiwmTgX0hCMaW6di6f0rGzLlw26jAN+a6t+QOskEp2vz1XBGtWivb3tgkvhYMdIQMV
 46vLsx2vPJ1rq7ibJGrWiqXk+S0f+9yXao1aMpmwaSHbI3EhH/UXj71hBB/P4k5MCx04
 MLeM9+J2iP1NS39ySc0Uo7g3WfjnVdvUvzWtf+xfee5Laeu6ImsvA9RSMj4qsz8Q52Vp
 JQsQ==
X-Gm-Message-State: APjAAAVNGhJlNa4BugaeRpl7ihknWM1dEIH+d9EQ7llEjOXvJ6UGQnKE
 vQnqlzVpY/B8fl9xhVpxne9R9FGo+Ek=
X-Google-Smtp-Source: APXvYqysluw83yMXGrCZatXGRpaFyQcQGthGl8RCm2qCGeYgVenHRQ7nB3sReiL6F4945fbea5z3Rw==
X-Received: by 2002:ac2:4902:: with SMTP id n2mr4835257lfi.0.1568891997326;
 Thu, 19 Sep 2019 04:19:57 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id z8sm1716496lfg.18.2019.09.19.04.19.56
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 04:19:57 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id w67so2079386lff.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 04:19:56 -0700 (PDT)
X-Received: by 2002:a05:6512:488:: with SMTP id
 v8mr4833127lfq.37.1568891996776; 
 Thu, 19 Sep 2019 04:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190919111722.iajioonuzqfharaf@debian>
In-Reply-To: <20190919111722.iajioonuzqfharaf@debian>
From: Wei Liu <wl@xen.org>
Date: Thu, 19 Sep 2019 12:19:40 +0100
X-Gmail-Original-Message-ID: <CAK9nU=oUVsbJN28BmJ=aHR5UEBNv4CAxLO8xTUqY+__czX40CA@mail.gmail.com>
Message-ID: <CAK9nU=oUVsbJN28BmJ=aHR5UEBNv4CAxLO8xTUqY+__czX40CA@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH for-4.13] configure: fix print syntax for
 python 3
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxOSBTZXAgMjAxOSBhdCAxMjoxNywgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiAxNmNjMzM2MmEgbWlzc2VkIG9uZSBwcmludCBzdGF0ZW1lbnQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IC0tLQo+ICBtNC9weXRob25fZGV2ZWwubTQgfCAy
ICstCj4gIHRvb2xzL2NvbmZpZ3VyZSAgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbTQvcHl0aG9uX2Rl
dmVsLm00IGIvbTQvcHl0aG9uX2RldmVsLm00Cj4gaW5kZXggN2YyNjM4MTM3Ni4uZTM2NWNkNjU4
ZSAxMDA2NDQKPiAtLS0gYS9tNC9weXRob25fZGV2ZWwubTQKPiArKysgYi9tNC9weXRob25fZGV2
ZWwubTQKPiBAQCAtNiw3ICs2LDcgQEAgQUNfUEFUSF9QUk9HKFtweWNvbmZpZ10sIFskUFlUSE9O
LWNvbmZpZ10sIFtub10pCj4gIEFTX0lGKFt0ZXN0IHgiJHB5Y29uZmlnIiA9IHgibm8iXSwgWwo+
ICAgICAgZG5sIEZvciB0aG9zZSB0aGF0IGRvbid0IGhhdmUgcHl0aG9uLWNvbmZpZwo+ICAgICAg
Q1BQRkxBR1M9IiRDRkxBR1MgYCRQWVRIT04gLWMgJ2ltcG9ydCBkaXN0dXRpbHMuc3lzY29uZmln
OyBcCj4gLSAgICAgICAgcHJpbnQgIi1JIiArIGRpc3R1dGlscy5zeXNjb25maWcuZ2V0X2NvbmZp
Z192YXIoIklOQ0xVREVQWSIpJ2AiCj4gKyAgICAgICAgcHJpbnQoIi1JIiArCj4gZGlzdHV0aWxz
LnN5c2NvbmZpZy5nZXRfY29uZmlnX3ZhcigiSU5DTFVERVBZIikpJ2AiCgpVcmdoLiBUaGlzIGhh
cyBiZWVuIG1hbmdsZWQuIEhvcGUgeW91IGdldCB0aGUgaWRlYS4uLgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
