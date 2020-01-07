Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743BF132973
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 16:00:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioqJe-0005Er-8m; Tue, 07 Jan 2020 14:58:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C5lm=24=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ioqJd-0005Ed-2R
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 14:58:41 +0000
X-Inumbo-ID: 2fcd0c6c-315e-11ea-ac2b-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fcd0c6c-315e-11ea-ac2b-12813bfff9fa;
 Tue, 07 Jan 2020 14:58:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578409120; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=kisQrz8quD/anBmrnuFH1QA6ZjvrjJecgdvaktE7+2U=;
 b=UGBFlKx7ojivfOrbb1RQ/BnuVGnttUgWnb3f00n9vx5zdtyqoCguS0IyRx3G6LKgxo2WYG59
 Aa/uC6wgGLUAMq0294n/Zj4AIHCQYv9r22vNQvK1xRaTY0a/VcqcrzQY92qynn6zNDADG5y7
 dLzT+AgAJXaK7s4Ecw+0aeb4Rnk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mxa.mailgun.org with ESMTP id 5e149c9c.7fb71b27dc30-smtp-out-n02;
 Tue, 07 Jan 2020 14:58:36 -0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q6so54201727wro.9
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 06:58:36 -0800 (PST)
X-Gm-Message-State: APjAAAUJwAsvO31ca/bg7c8/zodOEuIGTWWLAwEFq7aIiUgrG4ZF2bkH
 xquz5YGT4AS9dV6FfiNzMGKRuxQ87n7d/5cNWqA=
X-Google-Smtp-Source: APXvYqzrol5lBasPn/PpbDcwcMtrVt4OxoLuR2lwhp3ORnIFsjEVuJB90bq+TQE8SvAkyL300bktwiV9XQOGgdZNK5U=
X-Received: by 2002:adf:b60f:: with SMTP id
 f15mr103758424wre.372.1578409115370; 
 Tue, 07 Jan 2020 06:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20200107134943.21063-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200107134943.21063-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 7 Jan 2020 07:58:00 -0700
X-Gmail-Original-Message-ID: <CABfawhn5OwJDKdjPh3sD1b9qsiasr-uiaV4OOgmL_t9xBk_9Ug@mail.gmail.com>
Message-ID: <CABfawhn5OwJDKdjPh3sD1b9qsiasr-uiaV4OOgmL_t9xBk_9Ug@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/mem_sharing: Fix RANDCONFIG build
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gNywgMjAyMCBhdCA2OjQ5IEFNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gVHJhdmlzIHJlcG9ydHM6IGh0dHBzOi8vdHJhdmlz
LWNpLm9yZy9hbmR5aGhwL3hlbi9qb2JzLzYzMzc1MTgxMQo+Cj4gICBtZW1fc2hhcmluZy5jOjM2
MToxMzogZXJyb3I6ICdybWFwX2hhc19lbnRyaWVzJyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdl
cnJvcj11bnVzZWQtZnVuY3Rpb25dCj4gICAgc3RhdGljIGJvb2wgcm1hcF9oYXNfZW50cmllcyhj
b25zdCBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+ICAgICAgICAgICAgICAgIF4KPiAgIGNjMTog
YWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4KPiBUaGlzIGhhcHBlbnMgaW4g
YSByZWxlYXNlIGJ1aWxkIChkaXNhYmxlcyBNRU1fU0hBUklOR19BVURJVCkgd2hlbgo+IENPTkZJ
R19NRU1fU0hBUklORyBpcyBlbmFibGVkLgoKTXkgYmFkLCBzZWVtZWQgdG8gaGF2ZSBtaXNzZWQg
dGhpcyBzb21laG93LgoKPgo+IE1hcmsgdGhlIGhlbHBlciBhcyBtYXliZV91bnVzZWQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
IC0tLQo+IENDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4KPiBUaGUg
YWx0ZXJuYXRpdmUgaXMgdG8gZGVsZXRlIHRoZSBoZWxwZXIgYW5kIG9wZW5jb2RlIGl0IGZvciBp
dHMgb25lIGNhbGxlci4KCklNSE8gdGhhdCB3b3VsZCBiZSBiZXR0ZXIsIG5vIHJlYXNvbiB0byBr
ZWVwIHRoaXMgdHJpdmlhbCBjaGVjayBhcyBhCnNlcGFyYXRlIGZ1bmN0aW9uIGZvciBvbmUgY2Fs
bGVyLiBTYW1lIHN0YW5kcyBmb3IgdGhlCnJtYXBfaGFzX29uZV9lbnRyeSBmdW5jdGlvbiBhcyB3
ZWxsIChmZWVsIGZyZWUgdG8gYnVuY2ggdGhhdCBpbiB0b28KYnV0IEkgY291bGQgYWxzbyBkbyB0
aGF0IHNlcGFyYXRlbHkpLgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
