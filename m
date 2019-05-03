Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3013287
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:51:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbMm-0006Fn-Oh; Fri, 03 May 2019 16:48:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zhHS=TD=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hMbMl-0006Fi-OM
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:48:55 +0000
X-Inumbo-ID: 55fcff25-6dc3-11e9-843c-bc764e045a96
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 55fcff25-6dc3-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 16:48:54 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id d10so772074otp.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcDply2rN7LkqY72JOFtusTLmzpeC77Q7JUVfh2rZGc=;
 b=E2d3JPyXXY85CwnQWcgWX4bgDRj02L+3OPxH1A0u/psNE/ak0BpYV6w6gQG4rtwgZv
 38ttWIy/rPWKz/qDGZ7GLf+pjrDbjidETyvcbH/wXwyZR4qyS0cimZ/ZbeFHYPuCVBM3
 wMsAkFIX4nWe/vUQxhtNPMexZSlhcUGzyaYDNfixQ/bcHF+K+iH4nQ8bU1gDTv6z5bed
 9mcaiw4GfLQPvdZo6pzp3QxaBO7X2mQXrJUBU8Xv4wwoKwm6DS5Zf41MX2g41A8zyJbq
 niUlFKbQcbe4Dm52uLhuqygypGcn3e3PlKga20T3Cex76A1A0KhORmhgYdjSGe6GtJBc
 zlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcDply2rN7LkqY72JOFtusTLmzpeC77Q7JUVfh2rZGc=;
 b=MkWCg5q0HPCHsms0CE2AxtBKfdZebGhlZfR6y+TwnroX0KSnZMpCRI/p95hl40lVdv
 /1UGbypEyPOULvoLBXtaDDw9QPVLvSyuKqPuAbWiwjVKLD4vMVvc9XiKIpEif1En7zJq
 znWe1ZnPffdlG/qJ2N9niXY5hbjO+02W5KXtvccTyDBDtsMHNYv4T9JPOrNn+EgGODiN
 s8cO1O4k+8gJpbnuv1YXQFwBp/56PfMLlJVYEVB0SlO/8zNQqdpY+X8rsUPYX991INMo
 oNbMiKYAZFHaIN/lcwM0wuPv5s83VlP++OT5/KgE43Qi96LkD4XoQ2/MBmB8eooBPANl
 vFpw==
X-Gm-Message-State: APjAAAUjdUGwlIdw6kzL16Gt1WU4WuUqd1BaN7z7a39ytaQPxjsmCcO7
 /v4WumEgeXjMCtwdjM5pzNgAA5apVuc61/pBxCrdNA==
X-Google-Smtp-Source: APXvYqwAapHL9w9kvWKdKk0zVLEZDp+tyt7tZQhCCV0eUGEfwHH7bQ4Vn56ztFexKrv87/L7CL6VXQ/m7Uav4ymT56E=
X-Received: by 2002:a9d:5604:: with SMTP id e4mr7217870oti.336.1556902133311; 
 Fri, 03 May 2019 09:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <1556901723-11740-1-git-send-email-amittomer25@gmail.com>
In-Reply-To: <1556901723-11740-1-git-send-email-amittomer25@gmail.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Fri, 3 May 2019 22:18:16 +0530
Message-ID: <CABHD4K80HuGpRdtf8T2-ELfGBZqfQ-MkfFGZnHTZ84yC-bOAUw@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] [PATCH] xen/arm: Black list everything with a PPI
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnkgSnVzdCBzZW50IHRoZSB3cm9uZyBwYXRjaCAsIFBsZWFzZSBpZ25vcmUgdGhpcy4KCk9u
IEZyaSwgTWF5IDMsIDIwMTkgYXQgMTA6MTMgUE0gQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVy
MjVAZ21haWwuY29tPiB3cm90ZToKPgo+IFhFTiBzaG91bGQgbm90IGZvcndhcmQgUFBJcyB0byBE
b20wIGFzIGl0IG9ubHkgc3VwcG9ydCBTUElzLgo+IE9uZSBvZiBzb2x1dGlvbiB0byB0aGlzIHBy
b2JsZW0gaXMgdG8gc2tpcCBhbnkgZGV2aWNlIHRoYXQKPiB1c2VzIFBQSSBzb3VyY2UgY29tcGxl
dGVseSB3aGlsZSBidWlsZGluZyBkb21haW4gaXRzZWxmLgo+Cj4gVGhpcyBwYXRjaCBnb2VzIHRo
cm91Z2ggYWxsIHRoZSBpbnRlcnJ1cHQgc291cmNlcyBvZiBkZXZpY2UgYW5kIHNraXAgaXQKPiBp
ZiBvbmUgb2YgaW50ZXJydXB0IHNvdXJjZSBpcyBQUEkuIEl0IGZpeGVzIFhFTiBib290IG9uIGku
TVg4TVEgYnkKPiBza2lwcGluZyBQTVUgbm9kZS4KPgo+IFN1Z2dlc3RlZC1ieTogIEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaW5naCBU
b21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgo+IC0tLQo+ICAgICAqIFRoaXMgcmVwbGFjZXMg
Zm9sbG93aW5nIHBhdGNoLgo+ICAgICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTA4OTk4ODEvCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDE3ICsr
KysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggZDk4MzY3Ny4uMGFlNTRkYiAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysgYi94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMTMzNCw2ICsxMzM0LDcgQEAgc3RhdGljIGludCBfX2lu
aXQgaGFuZGxlX25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5m
bywKPiAgICAgICAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJhcm0sY29ydGV4LWExNS1wbXUiKSwK
PiAgICAgICAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJhcm0sY29ydGV4LWE1My1lZGFjIiksCj4g
ICAgICAgICAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgiYXJtLGFybXY4LXBtdXYzIiksCj4gKyAgICAg
ICAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgiYXJtLGNvcnRleC1hNTMtcG11IiksCj4gICAgICAgICAg
RFRfTUFUQ0hfUEFUSCgiL2NwdXMiKSwKPiAgICAgICAgICBEVF9NQVRDSF9UWVBFKCJtZW1vcnki
KSwKPiAgICAgICAgICAvKiBUaGUgbWVtb3J5IG1hcHBlZCB0aW1lciBpcyBub3Qgc3VwcG9ydGVk
IGJ5IFhlbi4gKi8KPiBAQCAtMTM1Myw3ICsxMzU0LDcgQEAgc3RhdGljIGludCBfX2luaXQgaGFu
ZGxlX25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiAg
ICAgICAgICB7IC8qIHNlbnRpbmVsICovIH0sCj4gICAgICB9Owo+ICAgICAgc3RydWN0IGR0X2Rl
dmljZV9ub2RlICpjaGlsZDsKPiAtICAgIGludCByZXM7Cj4gKyAgICBpbnQgcmVzLCBpLCBuaXJx
LCBpcnFfaWQ7Cj4gICAgICBjb25zdCBjaGFyICpuYW1lOwo+ICAgICAgY29uc3QgY2hhciAqcGF0
aDsKPgo+IEBAIC0xMzk5LDYgKzE0MDAsMjAgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25v
ZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiAgICAgICAg
ICByZXR1cm4gMDsKPiAgICAgIH0KPgo+ICsgICAgLyogU2tpcCB0aGUgbm9kZSwgdXNpbmcgUFBJ
IHNvdXJjZSAqLwo+ICsgICAgbmlycSA9IGR0X251bWJlcl9vZl9pcnEobm9kZSk7Cj4gKwo+ICsg
ICAgZm9yICggaSA9IDAgOyBpIDwgbmlycSA7IGkrKyApCj4gKyAgICB7Cj4gKyAgICAgICAgaXJx
X2lkID0gcGxhdGZvcm1fZ2V0X2lycShub2RlLCBpKTsKPiArCj4gKyAgICAgICAgaWYgKCBpcnFf
aWQgPj0gMTYgJiYgaXJxX2lkIDwgMzIgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgZHRf
ZHByaW50aygiIFNraXAgbm9kZSB3aXRoIChQUEkgc291cmNlKVxuIik7Cj4gKyAgICAgICAgICAg
IHJldHVybiAwOwo+ICsgICAgICAgIH0KPiArICAgIH0KPiArCj4gICAgICAvKgo+ICAgICAgICog
WGVuIGlzIHVzaW5nIHNvbWUgcGF0aCBmb3IgaXRzIG93biBwdXJwb3NlLiBXYXJuIGlmIGEgbm9k
ZQo+ICAgICAgICogYWxyZWFkeSBleGlzdHMgd2l0aCB0aGUgc2FtZSBwYXRoLgo+IC0tCj4gMi43
LjQKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
