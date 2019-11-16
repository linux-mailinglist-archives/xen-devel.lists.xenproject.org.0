Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A076FEA03
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2019 02:16:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVme1-0003n2-Hs; Sat, 16 Nov 2019 01:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=st+B=ZI=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iVme0-0003mx-92
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2019 01:12:56 +0000
X-Inumbo-ID: 381e23b6-080e-11ea-9631-bc764e2007e4
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 381e23b6-080e-11ea-9631-bc764e2007e4;
 Sat, 16 Nov 2019 01:12:55 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id i19so9662879qki.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 17:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=GPx4tYPj+C0+/qVNdCVFP+JY3W+RkovwWz4tU10x6AI=;
 b=NAyiJQ0KSE8422m3Tk6Eja048UauT8AS3xdSrlWLEdizlmNJVSwPpr/UpmTOfoNtCx
 G45y9V15yQg/1CKz2le8aMy7BwbZ0V0Svift4BHlhBBGS1mUuXw0AC0IL9ZP8LLXCLwx
 JW07UU1YqbboJomSSNuU0t0tyIpJEAFWOu5l1d9xFAG1c+6hMPgJy6CJrgew3SWMQBKR
 8zlbXBPphrMnOYdl643KW0nAttaCY8gwnt3GJEiX01Rpozw4uefq+vw65GxTnCQXTIVH
 s/Co10DFZruz07odXqLyADquWiwwSWIW0d1AaGrRV9mpwfXZdGr3l3NuWR0FjBbksrNR
 7Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GPx4tYPj+C0+/qVNdCVFP+JY3W+RkovwWz4tU10x6AI=;
 b=J7/8Pr4wMNXLWSspyxiJjt60/ohqUurwK1m1gvv1WeGVrXfqVbrrp1qDQu1Yhc1qCx
 jbNGrPZPB1iGAe5jop0lIuB3E7S5kK9lt5DqSqDtOrmFltQc3sjeWMAnd97EFsPKxJTP
 vWFIafZRsIeJBlnxLTziDKJfL+KnNeT3MKV0aP8up/h8jjVxCUVHguwAcygfFRbJkBXs
 CuAxsVhHucIThLk/AYiw9OZaNkZLb0O5eb1C7vu8UjmRdg/b7bhDqNzAgTtMnE42h8oc
 tnw59zxqU6I0ezgulq3U9BEPzuIF+S5Vz3KT09xBtkxaQ++g2ee2EbZ+iGrYYItJQ5cp
 ToTA==
X-Gm-Message-State: APjAAAW1OuDjj43F7BA4YgzYDOLYWhU3zDo5lCTVq/TvP5DPzPFUJ5BV
 O73HEH8q//TcYtlLiC68OQBV19GXlBTnD2e4k/ysmX6Ri/1OBw==
X-Google-Smtp-Source: APXvYqwSDH6eZfNhe6rjB/RCa1361MNXEliYmwhWXKIk9wB7PnBBZLKcJjO+9Y+ufHpaL5KIYcvj3qtumn6vA8ygYGU=
X-Received: by 2002:a37:9d12:: with SMTP id g18mr13170065qke.157.1573866774560; 
 Fri, 15 Nov 2019 17:12:54 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 15 Nov 2019 17:12:43 -0800
Message-ID: <CAMmSBy8qFCEssF6vdTTAgxpijGns4QFgKQpT6Kvj9AorQ5mSZQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] [TESTDAY] Test report
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tk9URTogdGhpcyBtYXkgb3IgbWF5IG5vdCBiZSBhIGhhaXIgb24gZmlyZSBwcm9ibGVtLCByZXBv
cnRpbmcgaXQKYW55d2F5IHNpbmNlIEknZCBoYXRlIHRvIHBhc3Mgb24gc29tZXRoaW5nIHRoYXQg
bWF5YmUgYSBzZXJpb3VzIGlzc3VlLgpJIGhhdmVuJ3QgaGFkIHRpbWUgdG8gZGVidWcgdGhpcyBq
dXN0IHlldCAtLSBzbyBqdXN0IHJlcG9ydGluZyBpdCBoZXJlCnByZXR0eSByYXcuCgpTb2Z0d2Fy
ZToKICAgWGVuIDQuMTMgUkMyCiAgIExpbnV4IGtlcm5lbCA0LjE5LjUKSGFyZHdhcmU6CiAgIFN1
cGVybWljcm8gRTMwMAogICAgICAgaHR0cHM6Ly93d3cuc3VwZXJtaWNyby5jb20vZW4vcHJvZHVj
dHMvc3lzdGVtL01pbmktSVRYL1NZUy1FMzAwLThELmNmbQogICBTdXBlcm1pY3JvIEUxMDAKICAg
ICAgIGh0dHBzOi8vd3d3LnN1cGVybWljcm8uY29tL2VuL3Byb2R1Y3RzL3N5c3RlbS9Cb3hfUEMv
U1lTLUUxMDAtOVMuY2ZtCiAgIFN1cGVybWljcm8gRTUwCiAgICAgICBodHRwczovL3d3dy5zdXBl
cm1pY3JvLmNvbS9lbi9wcm9kdWN0cy9zeXN0ZW0vQm94X1BDL1NZUy1FNTAtOUFQLmNmbQoKRnVu
Y3Rpb25hbGl0eSB0ZXN0ZWQ6IHRyeWluZyB0byBib290IERvbTAKQ29tbWVudHM6IFhlbiBib290
cyBjb21wbGV0ZWx5IGFuZCB0aGVuIHNlZW1zIGxpa2UgaXQgZWl0aGVyIGRpZXMKcmlnaHQgYWZ0
ZXIgc2F5aW5nCiAgICBYZW4gcmVsaW5xdWlzaGluZyBhIGNvbnNvbGUKb3IgRG9tMCBkaWVzICh3
aXRob3V0IHByaW50aW5nIGEgc2luZ2xlIGxpbmUgb2Ygb3V0cHV0KQoKRldJVywgdGhpcyBzdGFy
dGVkIGhhcHBlbmluZyBhZnRlciB1cGdyYWRlIHRvIFJDMi4gSU9XLCBpZiBJIHRha2UgbXkKcHJl
dmlvdXMgUkMxIGJpbmFyeSBhbmQgc3RpY2sgaXQgaW50byB0aGUgdmVyeSBzYW1lIHNldHVwIC0t
CmV2ZXJ5dGhpbmcgYm9vdHMgZmluZS4KClRoZSBpc3N1ZSBkb2Vzbid0IHNlZW0gdG8gYmUgcmVw
cm9kdWNpYmxlIG9uIERlbGwgYm94ZXMgKGFuZCBpbiBteQp2aXJ0dWFsIFFFbXUgc2V0dXApIHRo
YXQgSSd2ZSBnb3QuCgpUaGFua3MsClJvbWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
