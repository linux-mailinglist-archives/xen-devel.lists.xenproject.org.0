Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB3D12F6FB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:05:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKjV-0001AP-Nr; Fri, 03 Jan 2020 11:03:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=swuY=2Y=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1inKjU-0001AI-Qb
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:03:08 +0000
X-Inumbo-ID: 9f95b466-2e18-11ea-88e7-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f95b466-2e18-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 11:03:08 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id n96so4471895pjc.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 03:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mWTIB2jxVjuoKiy3Ajw9ZDvxTpaosFUQydWVxCr/O8A=;
 b=EDt9BU36J15YrgdZwDBbdtwHKPTjaIG3NasPOmjKPPVZh2mfHiUKlOAryKBWQ2wG+o
 +waUNmI9yEF7GtiD0pw1LWIKoCXSfsKmLOK5e0SHGf6eWBLc7Pj39N8Ew+S7N+atMJyC
 /G1ZBWYFZFjzBkIYJSNjbd5rIWTxB/CHyhFACaB2VO2JafiShVpGsx96lZw0pj4ssl4D
 dDTKu9N2LEZrcv8DId0dL+1HWMqMuku91+JleQ1XA6bBC3N2jdy42XE6y9MeA5PwNCk2
 cMmWqDfavuoIxXhzwbi2Nsn+PRLQ8cYJdHC3RBY4nbthKxbzzLSByVdfxKi1ImO4MQYw
 FgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWTIB2jxVjuoKiy3Ajw9ZDvxTpaosFUQydWVxCr/O8A=;
 b=WWO9CdtUnFr7I5u4BIsMKAKTTBvWLjYXMmKdbBssukSPRygjH5sCrbrtDZGdixTRzc
 vypBPRKouyh25y10iVnlzg5vZIQSTF4Z4RlYwA6NHwRSoa8lgIGzLo6jRiiSCvXaRxtY
 Agz9fn3sAiRNlRhtBdgMw3XEY3QLNrRVnebvMs/baZgGXciPoY463s61uFGwGtmA1C+J
 m15kE7/YTBjeVBILRjAWYV+zahB2L/HLwr+eOy8mNYlsj7+/74pteCC/p6J9k2rf1j0z
 /ugP9iVBjhSmg/MGMANPGJZxbqRHQH94nrzvvoaiEN/dbpnbZpbm0K4UcnZaSkJyyLmd
 rf8A==
X-Gm-Message-State: APjAAAXw8ZRbeYMrvZmlKq6Z0Fi8kU9EtYyBS1uvaXGFliaLD9o7SDV9
 CLGd8z3idvRl974QCFSPeAs4WksZm8RB8G2Hg70=
X-Google-Smtp-Source: APXvYqwYVlLhyKlXWQg3UzySczfXsVhZLY8h1GhdlTWiVB9KRu991AQ36ZI4a96wOmRcEV5Nv0GMLlQZAF6grkWDU1s=
X-Received: by 2002:a17:902:7c85:: with SMTP id
 y5mr26083817pll.227.1578049387621; 
 Fri, 03 Jan 2020 03:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-4-liuwe@microsoft.com>
In-Reply-To: <20191229183341.14877-4-liuwe@microsoft.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Fri, 3 Jan 2020 11:02:56 +0000
Message-ID: <CACCGGhASYR6q=cLPVaOb+_Re6eo_OHHfscqhgTPKdKcJ-ezNBA@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH 3/8] x86: rename guest/hypercall.h to
 guest/xen-hypercall.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCAyOSBEZWMgMjAxOSBhdCAxODozNCwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6
Cj4KPiBXZSB3aWxsIHByb3ZpZGUgYSBoZWFkZXIgZmlsZSBmb3IgSHlwZXItViBoeXBlcmNhbGxz
Lgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxs
aXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4u
b3JnPgoKPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC97aHlw
ZXJjYWxsLmggPT4geGVuLWh5cGVyY2FsbC5ofSB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gIHJlbmFtZSB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L3toeXBlcmNhbGwuaCA9PiB4ZW4taHlwZXJjYWxsLmh9ICg5OSUpCj4KPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC5oCj4gaW5kZXggOTQ0NDg2MDZkNC4uN2YwOWM2NDNkNCAxMDA2NDQKPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0LmgKPiBAQCAtMTksMTEgKzE5LDExIEBACj4gICNpZm5kZWYgX19YODZfR1VFU1RfSF9fCj4g
ICNkZWZpbmUgX19YODZfR1VFU1RfSF9fCj4KPiAtI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcmNh
bGwuaD4KPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYuaD4KPiAgI2luY2x1ZGUgPGFzbS9n
dWVzdC9oeXBlcnZpc29yLmg+Cj4gICNpbmNsdWRlIDxhc20vZ3Vlc3QvcHZoLWJvb3QuaD4KPiAg
I2luY2x1ZGUgPGFzbS9ndWVzdC94ZW4uaD4KPiArI2luY2x1ZGUgPGFzbS9ndWVzdC94ZW4taHlw
ZXJjYWxsLmg+Cj4gICNpbmNsdWRlIDxhc20vcHYvc2hpbS5oPgo+Cj4gICNlbmRpZiAvKiBfX1g4
Nl9HVUVTVF9IX18gKi8KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9o
eXBlcmNhbGwuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLWh5cGVyY2FsbC5oCj4g
c2ltaWxhcml0eSBpbmRleCA5OSUKPiByZW5hbWUgZnJvbSB4ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVyY2FsbC5oCj4gcmVuYW1lIHRvIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVu
LWh5cGVyY2FsbC5oCj4gaW5kZXggZDBkMmY1MDIyZC4uNjgxZDNhZWNkNyAxMDA2NDQKPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oCj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC94ZW4taHlwZXJjYWxsLmgKPiBAQCAtMSw1ICsxLDUgQEAKPiAgLyoq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKgo+IC0gKiBhc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oCj4gKyAq
IGFzbS14ODYvZ3Vlc3QveGVuLWh5cGVyY2FsbC5oCj4gICAqCj4gICAqIFRoaXMgcHJvZ3JhbSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKPiAgICogbW9k
aWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljCj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
