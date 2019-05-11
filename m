Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7131A615
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2019 03:17:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPGb1-0008Ns-96; Sat, 11 May 2019 01:14:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2IDf=TL=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hPGaz-0008Nl-EW
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 01:14:37 +0000
X-Inumbo-ID: 7347e10f-7389-11e9-8980-bc764e045a96
Received: from mail-vs1-xe33.google.com (unknown [2607:f8b0:4864:20::e33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7347e10f-7389-11e9-8980-bc764e045a96;
 Sat, 11 May 2019 01:09:40 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id y6so4727582vsb.0;
 Fri, 10 May 2019 18:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=N9lkn7Tpyyd6RfzAhROCCd7KMx3RYPIMXMEwlwMWQac=;
 b=oY69cuRx3sRWdtbrLySPtSMwJYYhI7Xi1P6yWZ/yuOvo0JUs1QEqxHoWX83+oiciR5
 8hVgzxPHLcADN/vBdJSlzKic1N1kY18uUZR5bID5VfXHlbs0+D6R9BQ/UzG7pUUqC3PX
 xalsasRQ4JLV/fwY6gkJOE2FZtMA/ggmK8rXgfh1iC/R828LEDahV8MHATco4KbGWGMh
 mi1RnumhNPfHhVvszHRd0tW3y8xCMrmqeX16YbGdG/AqTOjPdNAyOYbiZogJzmRYs3Dn
 vOwv/zDPcuFOr7OlWNTO8W9lDYBu6DddW+wwDYBTxQP86PImBGTduGCMiFijEg6zffu6
 QlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=N9lkn7Tpyyd6RfzAhROCCd7KMx3RYPIMXMEwlwMWQac=;
 b=JY8WzKiSCWkOHokFjABwm0TMi8bs3RQfutDgDO71beDalesj27TztI/TO2vWbSzu7+
 zM5FZM0ftcq5VvXXQ5aS1WYLyYp1fiyNEH/z3XJjOGGDxucrCElocgdu1obBhRfowSjO
 Kn5yhAjLRRoPyK1NRuUgjigeZGeKZBpK+EAQ01CjzyzC8Zy6Hf9acTpq+L7flZdebLaw
 g9tQ0dTxqTRPO+BTILlN+MQ4vuDHWcCPrLFn3EHD+rKtiQ2nCSxHnI4iX5Dw/rcfFYnm
 l9a4YOAHL4Kvzrgk4v4M+DMAMEzyGRRR0cKr8VmMs3NthQWOAzeMnK72W/0YJQKMd9KD
 oQmw==
X-Gm-Message-State: APjAAAWlpAusXZ8X1rlFjjbEg8xaOw1zngEVLccfgpt3ZP2TDjDpHFIY
 aVDBvxcllNdLxcR9xMGuN+KREt98
X-Google-Smtp-Source: APXvYqylEhAyckgLFcajS5t/Qi9Dp0vl8KPUhhFpa78pECEM+hJ+9IAq1kx57ds9g9u6U4d6bpzFqg==
X-Received: by 2002:a67:e41:: with SMTP id 62mr7325954vso.46.1557536978274;
 Fri, 10 May 2019 18:09:38 -0700 (PDT)
Received: from [192.168.0.100] (ip219-141-50-179.ct.co.cr. [179.50.141.219])
 by smtp.gmail.com with ESMTPSA id 2sm7953104vke.27.2019.05.10.18.09.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 18:09:37 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-Id: <175E1DBB-D974-4350-979E-CBC2999A4B25@gmail.com>
Date: Fri, 10 May 2019 19:09:34 -0600
To: xen-announce@lists.xenproject.org
X-Mailer: Apple Mail (2.3445.9.1)
Subject: [Xen-devel] [ANNOUNCE] Xen Developer and Design Summit Program for
 2019 is live
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
Cc: Minios-devel <minios-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 mirageos-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBDb21tdW5pdHkgTWVtYmVycywKCndlIGFyZSBleGNpdGVkIHRvIHVudmVpbCB0aGUgWGVu
IFByb2plY3QgRGV2ZWxvcGVyIGFuZCBEZXNpZ24gU3VtbWl0IHByb2dyYW0gYW5kIHNwZWFrZXIg
c2NoZWR1bGUgWzFdLiBUaGUg4oCLWGVuIFByb2plY3Qg4oCLRGV2ZWxvcGVyIOKAi2FuZCDigItE
ZXNpZ24g4oCLU3VtbWl0IOKAi2JyaW5ncyDigIt0b2dldGhlciDigIt0aGUg4oCLWGVuIOKAi1By
b2plY3TigJlzIOKAi2NvbW11bml0eSDigItvZiDigItkZXZlbG9wZXJzIOKAi2FuZCDigItwb3dl
ciDigIt1c2VycyDigItmb3Ig4oCLdGhlaXIg4oCLYW5udWFsIOKAi2NvbmZlcmVuY2UuIOKAi1Ro
ZSDigItjb25mZXJlbmNlIOKAi2lzIOKAi2Fib3V0IOKAi3NoYXJpbmcg4oCLaWRlYXMg4oCLYW5k
IOKAi3RoZSDigItsYXRlc3Qg4oCLZGV2ZWxvcG1lbnRzLCDigItzaGFyaW5nIOKAi2V4cGVyaWVu
Y2UsIOKAi3BsYW5uaW5nLCDigItjb2xsYWJvcmF0aW9uIOKAi2FuZCDigIthYm92ZSDigIthbGwg
4oCLdG8g4oCLaGF2ZSDigItmdW4g4oCLYW5kIOKAi3RvIOKAi21lZXQg4oCLdGhlIOKAi2NvbW11
bml0eSDigIt0aGF0IOKAi2RlZmluZXMg4oCLdGhlIOKAi1hlbiDigItQcm9qZWN0LgpUaGlzIHll
YXLigJlzIFN1bW1pdCBpcyB0YWtpbmcgcGxhY2UgaW4gQ2hpY2FnbyBmcm9tIEp1bHkgOXRoIHRv
IDExdGggWzJdLiAKCkluIGFkZGl0aW9uIHRvIHByZXNlbnRhdGlvbnMsIHRoZSBYZW4gUHJvamVj
dCB3aWxsIGJlIHJ1bm5pbmcgZGVzaWduIHNlc3Npb25zLiBUaGVzZSBhcmUgcHJvYmxlbS1zb2x2
aW5nIHNlc3Npb25zIHdpdGggdGFuZ2libGUgb3V0cHV0cy4gQ29tbXVuaXR5IG1lbWJlcnMgY2Fu
IHN1Ym1pdCBzZXNzaW9ucyB1bnRpbCBKdWx5IDEwdGggWzNdLiAKClRvIHN1Ym1pdCBhIGRlc2ln
biBzZXNzaW9uLCBnbyB0byBbM10KRm9yIGEgZnVsbCBsaXN0IG9mIHN1Ym1pdHRlZCBkZXNpZ24g
c2Vzc2lvbnMsIGdvIHRvIFs0XQoKQ2hlY2sgb3V0IHRoZSBldmVudCBwYWdlIGZvciBhbGwgZGV0
YWlscyBhbmQgd2UgbG9vayBmb3J3YXJkIHRvIHNlZWluZyB5b3UgaW4gSnVseSEKCkJlc3QgUmVn
YXJkcwpMYXJzCgpbMV0gaHR0cHM6Ly9ldmVudHMubGludXhmb3VuZGF0aW9uLm9yZy9ldmVudHMv
eGVuc3VtbWl0LTIwMTkvcHJvZ3JhbS9zY2hlZHVsZS8KWzJdIGh0dHBzOi8vZXZlbnRzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvZXZlbnRzL3hlbnN1bW1pdC0yMDE5LwpbM10gaHR0cHM6Ly9kZXNpZ24t
c2Vzc2lvbnMueGVucHJvamVjdC5vcmcvCls0XSBodHRwczovL2Rlc2lnbi1zZXNzaW9ucy54ZW5w
cm9qZWN0Lm9yZy9saXN0L2Rpc2N1c3Npb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
