Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BA81352FD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 07:03:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipQsD-0002I0-Qk; Thu, 09 Jan 2020 06:00:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J+Nm=26=gmail.com=xumengpanda@srs-us1.protection.inumbo.net>)
 id 1ipQsC-0002Hv-RK
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 06:00:48 +0000
X-Inumbo-ID: 619411ee-32a5-11ea-9832-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 619411ee-32a5-11ea-9832-bc764e2007e4;
 Thu, 09 Jan 2020 06:00:48 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id v28so4578946edw.12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 22:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9bNLZr3PoYnuhcTu//ncg18q2rReiD+OyWuyQP/s498=;
 b=SXHrWbxqiYfVYPSOdO9kqXnBXhaQJ6S0tQKvtKgn/hjJZeX2qxpRJVRPZl7cp8QI9l
 PTJvXEfEoAwFklf6KDVZNLLnYfnIs678Sutp3gzeoUIQHAkBszARsXZqikjaC9jLkYx+
 EiU+rJieuxoAmgBP+Pkvh8Wk1dPg7lHVnpDwrHzXvXwzfs95KkfBTpBLitFmThlI4L1Z
 7uOMONU0xquW4n66CpttmyW/IgwnyH1+NY6G9jgjcbsJdPYTRmjewKoi9xsE04Mm7hc/
 FBB7HtA+qSvyUHJobjZtDmD+MdHkzeEOaBNgk6UNckAnxI5cIJHzPRNnmb9iuAoK6F4u
 tutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9bNLZr3PoYnuhcTu//ncg18q2rReiD+OyWuyQP/s498=;
 b=AwVom0n52qiv0dmGs8EkDuErhUlsH3F3mI05r1Q36jxWS+zg5x4YKMzlVPTh1JrSn1
 LlJRt42OuFQeqgjjIt/1Sory6ZcyDO8YqSTkULVP1HzG43CllAB6xOi51BC4NrjoFQ8a
 lAsUOGij1ZNF8fJ93JijoNTofaPit9aYsIhdBvhr7b9wVD5EUat1t+ywwK8FRDFLXQD7
 S1LEnLxR/arTnspAPtDRrKTI7b3uFfjcPhtk0iFErP8UueZ+m7uHBa65c0Qwof39ukC5
 MWZMtpymyMax2fEgehw9wZS7P2xNOabOr8rpIE89aE34PvWrZH7Zd2ZQWihLDiI8yovT
 5BVA==
X-Gm-Message-State: APjAAAUK1tDC7PYbDzGg1IoueE++9S4ejnUd3QpDRak0ZXJR2jk5aw9v
 klIgJ5xf05tuRknGljvFXmK4QLyWWVMiJ/YLsA==
X-Google-Smtp-Source: APXvYqy9cgmaQZmj+WYzMZlWqv6sguh/x0CVw2lQBMUlyv04wyA3XYrmyxPIOZgmJgbAXYzGFy6wHzwWMlew1hxsA8k=
X-Received: by 2002:a05:6402:17e4:: with SMTP id
 t4mr9312153edy.83.1578549647210; 
 Wed, 08 Jan 2020 22:00:47 -0800 (PST)
MIME-Version: 1.0
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-10-jgross@suse.com>
In-Reply-To: <20200108152328.27194-10-jgross@suse.com>
From: Meng Xu <xumengpanda@gmail.com>
Date: Wed, 8 Jan 2020 22:00:10 -0800
Message-ID: <CAENZ-+njrhp1D8y79u2ZSGOq0_1Nh1DE6BP26SMumzBAy04RcA@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 9/9] xen/sched: add const qualifier where
 appropriate
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gOCwgMjAyMCBhdCA3OjIzIEFNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBNYWtlIHVzZSBvZiB0aGUgY29uc3QgcXVhbGlmaWVyIG1vcmUgb2Z0
ZW4gaW4gc2NoZWR1bGluZyBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xp
QHN1c2UuY29tPgo+IC0tLQo+ICB4ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMgfCAgNCArKy0t
Cj4gIHhlbi9jb21tb24vc2NoZWQvY29yZS5jICAgICB8IDI1ICsrKysrKysrKysrLS0tLS0tLS0t
LS0KPiAgeGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMgIHwgIDIgKy0KPiAgeGVuL2NvbW1vbi9z
Y2hlZC9jcmVkaXQuYyAgIHwgNDQgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0KPiAgeGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMgIHwgNTIgKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHhlbi9jb21tb24vc2NoZWQvbnVsbC5jICAg
ICB8IDE3ICsrKysrKysrLS0tLS0tLQo+ICB4ZW4vY29tbW9uL3NjaGVkL3J0LmMgICAgICAgfCAz
MiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5o
ICAgICB8ICA5ICsrKystLS0tCj4gIDggZmlsZXMgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwg
ODkgZGVsZXRpb25zKC0pCj4KCkFzIHRvIHhlbi9jb21tb24vc2NoZWQvcnQuYywKCkFja2VkLWJ5
OiBNZW5nIFh1IDxtZW5neHVAY2lzLnVwZW5uLmVkdT4KCk1lbmcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
