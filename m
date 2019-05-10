Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF98F19630
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 03:32:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOuLI-00047z-Vy; Fri, 10 May 2019 01:28:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0ItA=TK=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hOuLH-00047u-CN
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 01:28:55 +0000
X-Inumbo-ID: f94d2418-72c2-11e9-8980-bc764e045a96
Received: from mail-vs1-xe44.google.com (unknown [2607:f8b0:4864:20::e44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f94d2418-72c2-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 01:28:54 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id q64so2665580vsd.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 18:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=iAhcOyrTwWZmWTN7BT2+7car5gsrlpFJPF5tUURYhiQ=;
 b=M0ZlnCztAJGR+CLBNcuKUzU5T2oEH2LaYuwARjNjEVQ/9aS8yUGu8ISToI0KfFtBFO
 Buo7E8cOsLbiTvh6LP15qNpZdC5pbc5mxVwtEXALGVhG5Jm1sQcdlGCXsKBdd1FN5hAL
 V06KImq2ZL/WPdg2VFFqTQeHR68ATPQwj8w849lMGMOMRlbye6Xwkpu2DWrv0S5jyNsa
 Ik0ZEukWUR8gwrX77rDnjFI06xm/QUF/m2yraiI7TvAWLJ8FFbKIkaACvG6ntVN4OYKa
 96isohzyTKjXsjfEErplI2zaHXnhLABstXglYxuM5rk9VD95hEI41RLr8GDpqmbLFqtT
 djvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=iAhcOyrTwWZmWTN7BT2+7car5gsrlpFJPF5tUURYhiQ=;
 b=kd2U9fWiVtq0vUxeQZqjU3p4FrXEupnzCn1m0c6xlue23aPcM9seS7Od4uPUDgeKeo
 fg6XYlU0PsT0SOUIGjFgBTXC4bAPbLOHFlANGxifqIaEY3ClhtmDPGccjQA9CN4ckyGO
 TV6zGeLzuhiAthWC46z4U1yBMzdDfDHV5Tl5f4r5a2YyhQAu9w/cZSjmf5Ud+izDuFuh
 hvZ+WDe44yoMTEKgZZjMmN9Ob06OTpWS0GiI9Dn7HcE69ZsQI7wG2GeYIrVCgPafTGvK
 mK4NiyM+USPc/RzjeV6EZxdVEuSiRdOyTWHadZ7L2ZCUwkJdxVfA6bgEFexyT0chHkk7
 6lPA==
X-Gm-Message-State: APjAAAV2BaUkOnkT0PLVEZDhI15CZJWds96s4OwuvGTa1slpjLzGHyjD
 cv89EobO0mFM0BaNUH+ntpNuxbKm
X-Google-Smtp-Source: APXvYqx3v1EL9+bqa/EmH0WjWEMH0Wrb09hu3eHFf78A9/R4yMrjP0Nu6G4i58bJfVHf7JjPKpbp6w==
X-Received: by 2002:a67:8988:: with SMTP id l130mr4032831vsd.137.1557451733176; 
 Thu, 09 May 2019 18:28:53 -0700 (PDT)
Received: from [192.168.0.100] (ip133-193-64-186.ct.co.cr. [186.64.193.133])
 by smtp.gmail.com with ESMTPSA id u4sm465103uaq.11.2019.05.09.18.28.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 18:28:52 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-Id: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
Date: Thu, 9 May 2019 19:28:47 -0600
To: xen-devel <xen-devel@lists.xenproject.org>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: [Xen-devel] Guest Testing in OSSTEST - What distros and versions
 should we test against
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
Cc: Juergen Gross <jgross@suse.com>, Committers <committers@xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKZm9sbG93aW5nIGEgZGlzY3Vzc2lvbiB3aXRoIGNvbW1pdHRlcnMgYWJvdXQgR3Vl
c3QgdGVzdGluZyBpbiBPU1NURVNULCBpdCBzdXJmYWNlZCB0aGF0IHdlIGhhdmUgbm90IHVwZGF0
ZWQgd2hhdCBkaXN0cm9zIHdlIHRlc3QgaW4gT1NTVEVTVCBmb3IgYSB2ZXJ5IGxvbmcgdGltZS4g
QWxsIGFncmVlZCB0aGF0IHdlIHNob3VsZCByZWd1bGFybHkgcmV2aWV3IHdoYXQgd2UgdGVzdCBh
Z2FpbnN0OiBtYXliZSBhdCB0aGUgYmVnaW5uaW5nIG9mIGEgcmVsZWFzZSBjeWNsZQoKSW4gYW55
IGNhc2UsIGN1cnJlbnRseSB3ZSB0ZXN0IGFnYWluc3QKCng4NiBIVk0gZ3Vlc3RzOgogIGRlYmlh
bi05LjQuMC17aTM4NixhbWQ2NH0tQ0QtMS5pc28KICByaGVsLXNlcnZlci02LjEtaTM4Ni1kdmQu
aXNvCiAgd2luMTB2MTcwMy14ODYuaXNvCiAgd2luNy14NjQuaXNvCiAgd3MxNi14NjQuaXNvCiAg
RnJlZUJTRC0xMC4xLUNVU1RPTS17aTM4NixhbWQ2NH0tMjAxNTA1MjUucmF3Lnh6CiAgRGViaWFu
IEhWTSB7aTM4NixhbWQ2NH0gdmlhIGRlYmlhbi1pbnN0YWxsZXIgbmV0aW5zdCBbMV0KCng4NiBQ
ViBndWVzdHM6CiAgRGViaWFuIFBWIHtpMzg2LGFtZDY0fSB2aWEgZGViaWFuLWluc3RhbGxlciBu
ZXRpbnN0IFsxXQoKQVJNIGd1ZXN0czoKICBEZWJpYW4gUFYgdmlhIGRlYmlhbi1pbnN0YWxsZXIg
bmV0aW5zdCBbMV0KClsxXSB3aGF0ZXZlciBEZWJpYW4gcmVsZWFzZSBvc3N0ZXN0IGl0c2VsZiBt
b3N0bHkgcnVucwoKU28gSSBhbSBvcGVuaW5nIHRoZSBmbG9vciB0byBzdWdnZXN0aW9ucy4KCldp
dGggcmVnYXJkcyB0byBXaW5kb3dzIHRlc3Rpbmcgd2UgaGF2ZSBzb21lIHJlc3RyaWN0aW9ucy4g
V2UgaGF2ZSB0cmllZCBzZXZlcmFsIHRpbWVzIHRvIGJ1eSBhZGRpdGlvbmFsIHRlc3QgbGljZW5z
ZXMsIGJ1dCB0aGlzIG5ldmVyIHdlbnQgYW55d2hlcmUgKHNvbWUgb2YgdGhlIFZNIGxpY2Vuc2Vz
IGFyZSBub3QgYXZhaWxhYmxlIGZvciBvdXIgZW52aXJvbm1lbnQsIHVubGVzcyB5b3UgYnVsayBi
dXksIHdoaWNoIGlzIHZlcnkgZXhwZW5zaXZlKS4gVGhlIG9ubHkgYXBwcm9hY2ggdGhhdCB3b3Vs
ZCBhbGxvdyB1cyB0byB0ZXN0IGFnYWluc3QgZGlmZmVyZW50IHdpbmRvd3MgdmVyc2lvbnMgd291
bGQgYmUgdG8gcmVxdWlyZSBldmVyeW9uZSB3aG8gbWF5IHRvdWNoIE9TU1RFU1Qgd2hpY2ggaXMg
bm90IGRvYWJsZS4KCkkgY2FuIGJyaW5nIHRoaXMgdXAgd2l0aCB0aGUgTVMgb3BlbiBzb3VyY2Ug
b2ZmaWNlLCBpZiB0aGVyZSBhcmUgc3Ryb25nIGZlZWxpbmdzIGFib3V0IHRoaXMgYW5kIHRyeSBh
Z2FpbgoKTGFycwoKICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
