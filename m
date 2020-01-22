Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E07144B17
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:16:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8L8-00057L-43; Wed, 22 Jan 2020 05:14:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5KJ-00067M-5b
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:01:03 +0000
X-Inumbo-ID: fd254654-3cba-11ea-aecd-bc764e2007e4
Received: from mail-yw1-xc41.google.com (unknown [2607:f8b0:4864:20::c41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd254654-3cba-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:40 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id b186so2509850ywc.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecljCB/QewVVvxelCthHZrjZzvUypArKJmwNJlVKo2I=;
 b=eP+clRbh/Q195KxOgSf9n6so2Q5UIN1acQ9GAnDKJlmwBTguwFeQK8825Fd4mZduUe
 Gekg/BbIf3fJ7mFszBdZ3ucZdyplt31av8WuO6BbD9SEL69luA3KqPZDsb8nQQXYEfnu
 sGTeqckeuRc68AyCDLrwWj4CN2cBDRNmZZN1LmJBk8akdyGOwxFuJWNraoLL7u+4IGE9
 3G6xo/nHd+Sw7GRaaIyJfiVhOtq2RDpKNwtF2aEzusJDMG9k70k4jFX1ZA6dFwY1/shM
 V7F4TIfhq0E3guE0opC7vMsCYD0XNPnrxDF4shnYsEdC4WwC+qSSdqiQIdV8KM1TehDq
 NOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecljCB/QewVVvxelCthHZrjZzvUypArKJmwNJlVKo2I=;
 b=EoeNpEeGXFDleaeZORjPr9AmKm3Wsh1zzFqdnhN6HozUX4yznmA35REV3OcjkFlxWl
 ecnWytWzjvOM1EDlnPDVi0UzJi/7RKMcdeltB8S5co7fNnaPhvPyNjtCxlRIXFOtvhbY
 0TCwApCiQeoHuQc70OTJOei9j9SSv8n/VfgIVpFAPljwfjdfrl0hj2ddH3ZW3rpWKqaR
 EH7VyfRy3Lzti55IggEj1nRDgN5GKq0LUilC48XEgIqJCg8EuU6dhjFby5jmc4vZH7Cx
 VosR/rTzREzFziQYO//QB7i0a1+WkB7Wi82AnBYZB1zGcHUeVuIn2gyIWCp0SC/Jxb0S
 D4Kw==
X-Gm-Message-State: APjAAAVhdIN4vWgZyiYig+AYszpewZMZRK3M9tQJtA+YtA2j00OlUH4U
 moRzTCAABRtjmzrgIUh7iLN32ZtdvtkiHg==
X-Google-Smtp-Source: APXvYqxAZX0mJ2PaFB95GsPEo21ABHzC0DtcoUvlY/ADeGF13rfx0xfBjATWGiLCRDBK2/HT/C1KXA==
X-Received: by 2002:a81:294c:: with SMTP id p73mr800541ywp.477.1579658439060; 
 Tue, 21 Jan 2020 18:00:39 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:38 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:46 -0600
Message-Id: <86cabe821999135cf3b02c29edc249e78afa5078.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 07/23] riscv: Add asm-offsets.c
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHhlbi9hcmNoL3Jpc2N2L2FzbS1vZmZzZXRzLmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvcmlzY3YvYXNtLW9mZnNldHMuYwoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3Jpc2N2L2FzbS1vZmZzZXRzLmMgYi94ZW4vYXJjaC9yaXNjdi9hc20tb2Zmc2V0cy5j
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjRjNTNmOGFmODQKLS0tIC9k
ZXYvbnVsbAorKysgYi94ZW4vYXJjaC9yaXNjdi9hc20tb2Zmc2V0cy5jCkBAIC0wLDAgKzEsMzgg
QEAKKy8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMTIgUmVnZW50cyBvZiB0aGUgVW5pdmVyc2l0eSBv
ZiBDYWxpZm9ybmlhCisgKiBDb3B5cmlnaHQgKEMpIDIwMTcgU2lGaXZlCisgKgorICogICBUaGlz
IHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
CisgKiAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlCisgKiAgIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCB2ZXJzaW9uIDIuCisgKgorICogICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4g
dGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqICAgYnV0IFdJVEhPVVQgQU5ZIFdB
UlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqICAgTUVSQ0hB
TlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQor
ICogICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorICovCisK
KyNkZWZpbmUgQ09NUElMRV9PRkZTRVRTCisKKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KKyNpbmNs
dWRlIDx4ZW4vc2NoZWQuaD4KKyNpbmNsdWRlIDx4ZW4vYml0b3BzLmg+CisjaW5jbHVkZSA8cHVi
bGljL3hlbi5oPgorI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KKyNpbmNsdWRlIDxhc20vaW5p
dC5oPgorI2luY2x1ZGUgPGFzbS9jdXJyZW50Lmg+CisKKyNkZWZpbmUgREVGSU5FKF9zeW0sIF92
YWwpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAg
ICBhc20gdm9sYXRpbGUgKCJcbi5hc2NpaVwiPT0+I2RlZmluZSAiICNfc3ltICIgJTAgLyogIiAj
X3ZhbCAiICovPD09XCIiIFwKKyAgICAgICAgICAgICAgICAgIDogOiAiaSIgKF92YWwpICkKKyNk
ZWZpbmUgQkxBTksoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKKyAgICBhc20gdm9sYXRpbGUgKCAiXG4uYXNjaWlcIj09Pjw9PVwi
IiA6IDogKQorI2RlZmluZSBPRkZTRVQoX3N5bSwgX3N0ciwgX21lbSkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgIERFRklORShfc3ltLCBvZmZzZXRvZihf
c3RyLCBfbWVtKSk7CisKK3ZvaWQgYXNtX29mZnNldHModm9pZCkKK3sKKworICAgQkxBTksoKTsK
KyAgIE9GRlNFVChJTklUSU5GT19zdGFjaywgc3RydWN0IGluaXRfaW5mbywgc3RhY2spOworfQot
LSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
