Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63046F54
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2019 11:42:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hc58V-0007j7-Ch; Sat, 15 Jun 2019 09:38:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JENa=UO=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hc58T-0007j2-7g
 for xen-devel@lists.xenproject.org; Sat, 15 Jun 2019 09:38:09 +0000
X-Inumbo-ID: 476e7d89-8f51-11e9-8980-bc764e045a96
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 476e7d89-8f51-11e9-8980-bc764e045a96;
 Sat, 15 Jun 2019 09:38:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id h19so1013405wme.0
 for <xen-devel@lists.xenproject.org>; Sat, 15 Jun 2019 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zS4jeazNBkjjzgBxUF0jM6TO5xb7F8bfqKKUgr5V9Mc=;
 b=PZmroEL0n8CDkiWoE9g1IC4metIWF7SFIFm7A5pHy2Illp7fSRZcU4hvLJ2sc9moNw
 Idt9yNKxqTqsLo0mPPMixNR45imep2B4FZP3E5SXP8cMTW88AaGci7s6887uee0eoox6
 TBrI4GcFk70jjK74+w8Tys9yNFZLxoOzxsmntVFXAFp+VVt2qlAu6MDibO+lEvf3M8At
 BikkRNv2KYqZASlMDdhGOzPudq8iqVGcxcjJm3DWYcaoqCCdfDcMDtRlpKEYWtAyyM92
 dk5FxW1qV0bWZ3dfBvYN56lX+G2IaLEMb0EnYc+BCEUbd2B9v6FRaSZZCIqaPsCcqkuP
 CmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zS4jeazNBkjjzgBxUF0jM6TO5xb7F8bfqKKUgr5V9Mc=;
 b=IkOJ4j4OG9xlCLTZx2Np46B0rRk7hi8JNnaNvFGzquBUeo1SC4v4VGIYTwU+KddflG
 JxCbx7kvgNqv2kBX7DgbsfvpTs3bY4mJqdlZ+Is1ZH7SNfjXMOlXVoT1qd+v6my0MLiC
 6gQZ8qDXXq/ZAaQpEDZ6E8JPpKjNYi6eCodqj/i4isG51Ubb/bayNFkHXPccT+z71qp9
 Qi34zPHpqJKNh82qskZoSv3JHdePIEVsrYRuDQBoxKYejzWKqVHl/h6sgmQXUf1d3wNY
 U2C8xxzrPgtF5c0z818FITtPLM502QbrhWDxl0ljm/fLs5LA/ygKfkL973dFfqUfQBR5
 E8VA==
X-Gm-Message-State: APjAAAVcnzXNVz3KSLE4cJxjqQ6V1+L50X0W5W94zymIEnK24xKNmsFn
 GOKQzJelyIBxbWMScyrVD1x/3+xwxVdT79i0Jg3SwSf5lTgs4w==
X-Google-Smtp-Source: APXvYqw2rf69DrnJIBeQNxefiyHJIVESymMNtSqyhvrawziF8bvSfgVdswN7TKTL65GAQ6A6kzeNpMGHEXhS/7htx+I=
X-Received: by 2002:a1c:44d4:: with SMTP id
 r203mr10913559wma.158.1560591486039; 
 Sat, 15 Jun 2019 02:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <CABwOO=eye8yL=gJ6XNdDo0Tfm8UPa_9ESNatWpV5tDE4adp1Zg@mail.gmail.com>
In-Reply-To: <CABwOO=eye8yL=gJ6XNdDo0Tfm8UPa_9ESNatWpV5tDE4adp1Zg@mail.gmail.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Sat, 15 Jun 2019 17:37:54 +0800
Message-ID: <CABwOO=dBcH0qHEFzknXOVZ=aLSkymWhy7E-f8bhDS9jQfNX4nQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] pygrub gives "raise RuntimeError("Unable to find
 partition containing kernel")"
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

Qml0IG1vcmUgb24gdGhpczoKCkkgY3JlYXRlZCBhIGRpZmZlcmVudCBWQkQtYmFja2VkIFZNLCBj
b250YWluaW5nIGFuIFVidW50dSAxNDA0NSBpbnN0YWxsLApvbiBhIENlbnRPUyA2LjEwIGhvc3Qs
IHdpdGggWGVuIDQuMTAsIGFuZCBhIDQuOS4xMjcga2VybmVsLCB3aGVyZSB0aGUgVk0KYm9vdHMg
dXAgZmluZS4KCkJhY2sgaW4gbXkgTGludXhGcm9tU2NyYXRjaCBlbnZpcm9ubWVudCBJIHN0aWxs
IHNlZSB0aGUgYm9vdGxvYWRlciBsaWcKZXJyb3IgbWVzc2FnZSBhcyBiZWZvcmUKClVzaW5nIDxj
bGFzcyAnZ3J1Yi5HcnViQ29uZi5HcnViMkNvbmZpZ0ZpbGUnPiB0byBwYXJzZSAvYm9vdC9ncnVi
L2dydWIuY2ZnClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICIvdXNy
L2xpYi94ZW4vYmluL3B5Z3J1YiIsIGxpbmUgOTI4LCBpbiA8bW9kdWxlPgogICAgcmFpc2UgUnVu
dGltZUVycm9yKCJVbmFibGUgdG8gZmluZCBwYXJ0aXRpb24gY29udGFpbmluZyBrZXJuZWwiKQpS
dW50aW1lRXJyb3I6IFVuYWJsZSB0byBmaW5kIHBhcnRpdGlvbiBjb250YWluaW5nIGtlcm5lbAoK
SGVyZSdzIHRoZSBwYXJ0aXRpb24gdGFibGUgb2YgdGhlIFZCRAoKTW9kZWw6IExpbnV4IGRldmlj
ZS1tYXBwZXIgKGxpbmVhcikgKGRtKQpEaXNrIC9kZXYvZG0tMTogODM4ODYwOHMKU2VjdG9yIHNp
emUgKGxvZ2ljYWwvcGh5c2ljYWwpOiA1MTJCLzQwOTZCClBhcnRpdGlvbiBUYWJsZTogbXNkb3MK
RGlzayBGbGFnczoKCk51bWJlciAgU3RhcnQgICAgIEVuZCAgICAgICBTaXplICAgICAgVHlwZSAg
ICAgIEZpbGUgc3lzdGVtICAgICBGbGFncwogICAgICAgIDYzcyAgICAgICAyMDQ3cyAgICAgMTk4
NXMgICAgICAgICAgICAgICBGcmVlIFNwYWNlCiAxICAgICAgMjA0OHMgICAgIDMyMDcxNjdzICAz
MjA1MTIwcyAgcHJpbWFyeSAgIGV4dDQKICAgICAgICAzMjA3MTY4cyAgMzIwOTIxM3MgIDIwNDZz
ICAgICAgICAgICAgICAgRnJlZSBTcGFjZQogMiAgICAgIDMyMDkyMTRzICA4Mzg2NTU5cyAgNTE3
NzM0NnMgIGV4dGVuZGVkCiA1ICAgICAgMzIwOTIxNnMgIDM1ODE5NTFzICAzNzI3MzZzICAgbG9n
aWNhbCAgIGxpbnV4LXN3YXAodjEpCiAgICAgICAgMzU4MTk1MnMgIDM1ODI0OTRzICA1NDNzICAg
ICAgICAgICAgICAgIEZyZWUgU3BhY2UKIDYgICAgICAzNTg0MDAwcyAgODM4NjU1OXMgIDQ4MDI1
NjBzICBsb2dpY2FsICAgZXh0NAogICAgICAgIDgzODY1NjBzICA4Mzg4NjA3cyAgMjA0OHMgICAg
ICAgICAgICAgICBGcmVlIFNwYWNlCgoKSSBkaWQgdGhvdWdoLCB0aGluayB0byB0cnkgdGhlIGZv
bGxpd2luZwoKIyAvdXNyL2xpYi94ZW4vYmluL3B5Z3J1YiAtLWRlYnVnIC0tb2Zmc2V0PTEwNDg1
NzYgLS1saXN0LWVudHJpZXMKL2Rldi92Z194ZW5fdmJkcy9sdl80Z18wMgpVc2luZyA8Y2xhc3Mg
J2dydWIuR3J1YkNvbmYuR3J1YjJDb25maWdGaWxlJz4gdG8gcGFyc2UgL2Jvb3QvZ3J1Yi9ncnVi
LmNmZwpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiL3Vzci9saWIv
eGVuL2Jpbi9weWdydWIiLCBsaW5lIDkwNywgaW4gPG1vZHVsZT4KICAgIGNob3NlbmNmZyA9IHJ1
bl9ncnViKGZpbGUsIGVudHJ5LCBmcywgaW5jZmdbImFyZ3MiXSkKICBGaWxlICIvdXNyL2xpYi94
ZW4vYmluL3B5Z3J1YiIsIGxpbmUgNjI1LCBpbiBydW5fZ3J1YgogICAgZyA9IEdydWIoZmlsZSwg
ZnMpCiAgRmlsZSAiL3Vzci9saWIveGVuL2Jpbi9weWdydWIiLCBsaW5lIDI0OSwgaW4gX19pbml0
X18KICAgIHNlbGYucmVhZF9jb25maWcoZmlsZSwgZnMpCiAgRmlsZSAiL3Vzci9saWIveGVuL2Jp
bi9weWdydWIiLCBsaW5lIDQ2MCwgaW4gcmVhZF9jb25maWcKICAgIHNlbGYuY2YucGFyc2UoYnVm
KQogIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuNy9zaXRlLXBhY2thZ2VzL2dydWIvR3J1YkNvbmYu
cHkiLCBsaW5lIDM3NiwgaW4gcGFyc2UKICAgIGxpbmVzID0gYnVmLnNwbGl0KCJcbiIpClR5cGVF
cnJvcjogYSBieXRlcy1saWtlIG9iamVjdCBpcyByZXF1aXJlZCwgbm90ICdzdHInCiMKCndoaWNo
IHN1Z2dlc3RzIHRvIG1lIHRoYXQgWGVuJ3MgcHlncnViIGlzIHJlYWRpbmcgdGhlIGdydWIuY2Zn
IGZyb20Kd2l0aGluIHRoZSBWQkQgaW1hZ2UgYnV0IHRoYXQgbGFzdCBsaW5lIGlzbid0IHJlYWxs
eSB0ZWxsaW5nIG1lIG11Y2guCgpOb3RlIHRoYXQgdGhlIEdydWIgaW5zdGFsbGF0aW9uLCBmcm9t
IHdoZXJlCi91c3IvbGliL3B5dGhvbjMuNy9zaXRlLXBhY2thZ2VzL2dydWIvR3J1YkNvbmYucHki
CmNvbWUsIGlzIGFibGUgdG8gcGFyc2UgYSBzaW1pbGFyIGdydWIuY2ZnIHdoZW4gaXQgYm9vdHMg
dXAgdGhlIExGUwppbnN0YW5jZSBob3N0aW5nIG15IFhlbgoKS2V2aW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
