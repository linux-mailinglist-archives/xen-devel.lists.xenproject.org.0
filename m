Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD543D5DE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:52:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1halpx-0007LU-DW; Tue, 11 Jun 2019 18:49:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W27b=UK=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1halpw-0007LN-0s
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:49:36 +0000
X-Inumbo-ID: a73e03d7-8c79-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a73e03d7-8c79-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:49:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v24so8350258ljg.13
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 11:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ibJeI4B0AHM4pXbSLske50KyEAVxh8ue+2aA+VJz/o=;
 b=Hbm4JKHGZzSHxkaB2gQw4xkL37oy66xtq83T6AW5gECxdZojFDG2Uy2edH4989U/hd
 m5itBoHwN0/5NlDOKrFfx2u8fb1yELS9J/4CokiNrRi2pfbTibcaJSTma8fK2ab08ObE
 8+aG9QQx/nWij8uKjay9kpVBV3Lrc5kPlqkXpW8xqAVXdS9hGGPtFoXj0Mc96hrzkpwi
 Eq8TF1J7bpIGzV+nN16rLqyMpReq9YZ2KBc+Ogc9Vyu8ap3oSi5MLgCuga2OFYo7SlHM
 gTDqxFFzaO0atb93XVI5u9fcK27kWibjNoRZ6pfjLyGHBnUFhrIGXnw3jTpNbrEiJ3Nu
 9FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ibJeI4B0AHM4pXbSLske50KyEAVxh8ue+2aA+VJz/o=;
 b=Gb+n5+2qdlZdteYSP9QLUE3Z0sbL7m8mH9rAqs87fkDE6Z30tpRpbqXWf/4/wr4kbt
 UfcXWY9FQ6o6walYdtDey8KXCzjjZ3X+1wqMCy6l99cXyqj3+DAXibD2j4yzvzJgNxe/
 TAf2ZCuqhjYfJplVDvsG84FdWwJ8XC4ZbPuhVEW+EeDE7SKx+hLwSjglDnKNLYCgVMHy
 iuIjtJOGKMkjoGXEtQw+bPpaN0Afj19b/l3zqk+VrcGEMREnvws+3tY32wq+IA0MCVE4
 rzqQHZWRM3b8Ga4BVVrdroRyaidTJwqKoTi00JS0aGaaxwag3cFjSHgmmVt58JEOEZjT
 QfSw==
X-Gm-Message-State: APjAAAUUwH6nle8l8BKoI7GqkuV4ASy14ak0j/Rx34r8stkeL7eL4QY+
 86Z5SAUAbT6dU57uigSEUlXhR2qLL60toYtXF7U=
X-Google-Smtp-Source: APXvYqz6bIDwkcCMH047x++5+6On4XKgltYUkbpQW7XDHNwetnnjc9M2hm8Y2ZD096aR8uFAOVH8fSn+TLodxWRlzpM=
X-Received: by 2002:a2e:824d:: with SMTP id j13mr39773703ljh.137.1560278973166; 
 Tue, 11 Jun 2019 11:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
 <43766a806049b9556dd73ed8c1d6368ab2b26c4f.1560272437.git.tsirakisn@ainfosec.com>
In-Reply-To: <43766a806049b9556dd73ed8c1d6368ab2b26c4f.1560272437.git.tsirakisn@ainfosec.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 11 Jun 2019 11:49:21 -0700
Message-ID: <CACMJ4GZfTrrA=HkWemB96Qb_8wftbSxv+cXDpa6t0Z=gQc-ywQ@mail.gmail.com>
To: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Subject: Re: [Xen-devel] [PATCH 2/2] argo: correctly report pending message
 length
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
 Nicholas Tsirakis <tsirakisn@ainfosec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6MTEgQU0gTmljaG9sYXMgVHNpcmFraXMKPG5pa28u
dHNpcmFraXNAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gYSBtZXNzYWdlIGlzIHJlcXVldWUn
ZCBpbiBYZW4ncyBpbnRlcm5hbCBxdWV1ZSwgdGhlIHF1ZXVlCj4gZW50cnkgY29udGFpbnMgdGhl
IGxlbmd0aCBvZiB0aGUgbWVzc2FnZSBzbyB0aGF0IFhlbiBrbm93cyB0bwo+IHNlbmQgYSBWSVJR
IHRvIHRoZSByZXNwZWN0aXZlIGRvbWFpbiB3aGVuIGVub3VnaCBzcGFjZSBmcmVlcyB1cAo+IGlu
IHRoZSByaW5nLiBEdWUgdG8gYSBzbWFsbCBidWcsIGhvd2V2ZXIsIFhlbiBkb2Vzbid0IHBvcHVs
YXRlCj4gdGhlIGxlbmd0aCBvZiB0aGUgbXNnIGlmIGEgZ2l2ZW4gd3JpdGUgZmFpbHMsIHNvIHRo
aXMgbGVuZ3RoIGlzCj4gYWx3YXlzIHJlcG9ydGVkIGFzIHplcm8uIFRoaXMgY2F1c2VzIFhlbiB0
byBzcHVycmlvdXNseSB3YWtlIHVwCj4gYSBkb21haW4gZXZlbiB3aGVuIHRoZSByaW5nIGRvZXNu
J3QgaGF2ZSBlbm91Z2ggc3BhY2UuCj4KPiBUaGlzIHBhdGNoIG1ha2VzIHN1cmUgdGhhdCB0aGUg
bXNnIGxlbiBpcyBwcm9wZXJseSByZXBvcnRlZCBieQo+IHBvcHVsYXRpbmcgaXQgaW4gdGhlIGV2
ZW50IG9mIGEgd3JpdGUgZmFpbHVyZS4KCllvdSdyZSBjb3JyZWN0IHRoYXQgdGhpcyBpcyBhbiBp
c3N1ZSB0byBiZSBmaXhlZCwgYnV0IHVuZm9ydHVuYXRlbHkKdGhpcyBwYXRjaCBkb2Vzbid0IGNv
bXBpbGUsIGF0IGxlYXN0IHdpdGggZ2NjIDguMiB3aXRoIHdhcm5pbmdzIGFzCmVycm9ycywgcmVw
b3J0aW5nOgoKYXJnby5jOiBJbiBmdW5jdGlvbiAnc2VuZHYnOgphcmdvLmM6MjA1NzozNTogZXJy
b3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiAnaW92X2NvdW50JyBmcm9tCmluY29tcGF0aWJsZSBw
b2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAgICAgICAg
ICAgICBpb3ZfY291bnQoaW92cywgbmlvdiwgJmxlbik7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fgphcmdvLmM6NzIzOjI1OiBub3RlOiBleHBlY3RlZCAndW5zaWduZWQg
aW50IConIGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlCidsb25nIHVuc2lnbmVkIGludCAqJwogICAg
ICAgICAgIHVuc2lnbmVkIGludCAqY291bnQpCiAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5efn5+
fgoKRXZlbiB3aXRob3V0IHRoaXMgZXJyb3IsIHRoZSBsb2dpYyBpdCBpbXBsZW1lbnRzIGNhbiB1
bm5lY2Vzc2FyaWx5Cmludm9rZSBpb3ZfY291bnQgdHdpY2UgdXBvbiB0aGUgc2FtZSBndWVzdC1z
dXBwbGllZCBidWZmZXJzOyBpdCB3b3VsZApiZSBiZXR0ZXIgdG8gYXZvaWQgdGhhdCwgc286IGxv
b2tpbmcgYXQgdGhlIG9yaWdpbmFsIHNlY3Rpb24gb2YgY29kZToKCiogc2VuZHYncyAibGVuIiB2
YXJpYWJsZSBjYW4gYmUgaW50LCByYXRoZXIgdGhhbiBsb25nLgoqIGlvdl9jb3VudCBjYW4gYmUg
Y2FsbGVkIGZyb20gc2VuZHYsIGp1c3QgYmVmb3JlIHJpbmdidWZfaW5zZXJ0LAppbnN0ZWFkIG9m
IHdpdGhpbiByaW5nYnVmX2luc2VydC4gSXQgY2FuIHBvcHVsYXRlIHNlbmR2J3MgImxlbiIKdmFy
aWFibGUuCiogdGhlIGxlbiBvYnRhaW5lZCBmcm9tIGlvdl9jb3VudCAoaWYgc3VjY2Vzc2Z1bCkg
Y2FuIGJlIHBhc3NlZCBpbnRvCnJpbmdidWZfaW5zZXJ0IGFzIGEgcGFyYW1ldGVyLCBhbmQgcmVw
bGFjZSByaW5nYnVmX2luc2VydCdzIGV4aXN0aW5nCiJsZW4iIHZhcmlhYmxlLgoqIHJpbmdidWZf
aW5zZXJ0J3MgIm91dF9sZW4iIHBvaW50ZXIgYXJndW1lbnQgY2FuIHRoZW4gYmUgZHJvcHBlZCBh
cwp1bm5lY2Vzc2FyeS4KKiBwZW5kaW5nX3JlcXVldWUgd2lsbCBiZSBmaW5lIHRvIHVzZSBzZW5k
didzIHBvcHVsYXRlZCAibGVuIiB2YXJpYWJsZS4KCkNocmlzdG9waGVyCgoKPiBTaWduZWQtb2Zm
LWJ5OiBOaWNob2xhcyBUc2lyYWtpcyA8dHNpcmFraXNuQGFpbmZvc2VjLmNvbT4KPiAtLS0KPiAg
eGVuL2NvbW1vbi9hcmdvLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9hcmdvLmMgYi94ZW4vY29tbW9uL2Fy
Z28uYwo+IGluZGV4IDJmODc0YTU3MGQuLmViNTQxODI5ZDYgMTAwNjQ0Cj4gLS0tIGEveGVuL2Nv
bW1vbi9hcmdvLmMKPiArKysgYi94ZW4vY29tbW9uL2FyZ28uYwo+IEBAIC0yMDUwLDYgKzIwNTAs
MTIgQEAgc2VuZHYoc3RydWN0IGRvbWFpbiAqc3JjX2QsIHhlbl9hcmdvX2FkZHJfdCAqc3JjX2Fk
ZHIsCj4gICAgICAgICAgewo+ICAgICAgICAgICAgICBpbnQgcmM7Cj4KPiArICAgICAgICAgICAg
LyoKPiArICAgICAgICAgICAgICogaWYgcmluZ2J1Zl9pbnNlcnQgZmFpbHMsIHRoZW4gbGVuIHdp
bGwgbmV2ZXIgYmUgcG9wdWxhdGVkLgo+ICsgICAgICAgICAgICAgKiBtYWtlIHN1cmUgdG8gcG9w
dWxhdGUgaXQgaGVyZS4KPiArICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgIGlvdl9jb3Vu
dChpb3ZzLCBuaW92LCAmbGVuKTsKPiArCj4gICAgICAgICAgICAgIGFyZ29fZHByaW50aygiYXJn
b19yaW5nYnVmX3NlbmR2IGZhaWxlZCwgRUFHQUlOXG4iKTsKPiAgICAgICAgICAgICAgLyogcmVx
dWV1ZSB0byBpc3N1ZSBhIG5vdGlmaWNhdGlvbiB3aGVuIHNwYWNlIGlzIHRoZXJlICovCj4gICAg
ICAgICAgICAgIHJjID0gcGVuZGluZ19yZXF1ZXVlKGRzdF9kLCByaW5nX2luZm8sIHNyY19pZC5k
b21haW5faWQsIGxlbik7Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
