Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F8105E43
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 02:30:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXxiv-0004pz-VI; Fri, 22 Nov 2019 01:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=evt+=ZO=gmail.com=jcmvbkbc@srs-us1.protection.inumbo.net>)
 id 1iXxiu-0004pu-Fc
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 01:27:00 +0000
X-Inumbo-ID: 2dbd2a44-0cc7-11ea-9631-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dbd2a44-0cc7-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 01:26:59 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id az9so2381425plb.11
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 17:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TU/4Ef2jiJlWVCQ4cQLrxn75XZh8TZ+zwtkucEXiu6Y=;
 b=m2BETWVpqlllD08mHYTdBJVrgblUy6CNB+DVYcBf9k1lTWIC7q1zlf4DUt7C76yvFH
 G6g+FzKXJOEn6Vlo815oRlNBTnuOYeh6pCdoJ1hx+Svn5rOtOL1wNOb+UEMgHBUphhlH
 P8cv6J335QcanJ1JahmxBQ5wp52tqT2vEclNYvdd1JfgV6k5eQEDGUUqW3uoh8dfQHoS
 9xXdeB8VoyFb6OzA2Q8Ztk9qWRPfX+qdV3hUp7yzrKXrqPW/4+evxgguDIUq/jyml/xl
 uRx2Z/AjTUK5d/DHjDDKOSV8NRou6QR+IdZLRPjDl5zRTY1jkB6dh0gQ9Z1oePhabV1F
 e0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TU/4Ef2jiJlWVCQ4cQLrxn75XZh8TZ+zwtkucEXiu6Y=;
 b=P+l+sv+aUmdu5HMt522+6a0XVvowDmn2qYLv7KD2e12sBNyiWPGV/5KRqzobHmgRzO
 3RRIGxXv1EyLlepN9XMGjO5Bi6VYSIvTh/+VjQFh61vgaqUEU8/SbS+jwiwjqHXXBc3s
 9FioJdoQScqjIGPtvJAf5vKLHAjsUCJmHJhTfGw9x+4Xz8XoLZX/ZEu3wY7k81sMCVAU
 DlBeKubtmD9Ep9n14htjBgABx7NzSnw2P7M5yRo82R/8Nm6vw39PTOMbcDKzK0+Pc6zs
 kzhwuzDmTvwZFG1nQCHwosDxNuXNrnPsXtDPUIlb1Qh0XHAEdHuB5xhi0Dpb5iys77Ky
 wutw==
X-Gm-Message-State: APjAAAXfflvHmp62gSe8qx35lAH6Zik8L4GbYluV3LIqvaKhg+AJwktm
 JSuAApCJ5C5hBw+bZMvq6bfjuRI3OTd/GI8NHQY=
X-Google-Smtp-Source: APXvYqyEm29BCL9dYSdTsXPxmgv2TKuC1svdFqNukvJ2stRS4zyFKH8B0gohRL0YLXx0L/gX9Xmw6kRwgk7gtVPhA6k=
X-Received: by 2002:a17:90a:d818:: with SMTP id
 a24mr14948297pjv.40.1574386018942; 
 Thu, 21 Nov 2019 17:26:58 -0800 (PST)
MIME-Version: 1.0
References: <20191121184805.414758-1-pasha.tatashin@soleen.com>
 <20191121184805.414758-4-pasha.tatashin@soleen.com>
In-Reply-To: <20191121184805.414758-4-pasha.tatashin@soleen.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 21 Nov 2019 17:26:47 -0800
Message-ID: <CAMo8BfJYEh_HYGuKwKgfwVdVwg-w-AxN=+6zDuYdwB+E_dTSzA@mail.gmail.com>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [Xen-devel] [PATCH 3/3] arm64: remove the rest of asm-uaccess.h
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, jmorris@namei.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 vladimir.murzin@arm.com, marc.zyngier@arm.com, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTA6NTAgQU0gUGF2ZWwgVGF0YXNoaW4KPHBhc2hhLnRh
dGFzaGluQHNvbGVlbi5jb20+IHdyb3RlOgo+Cj4gVGhlIF9fdWFjY2Vzc190dGJyMF9kaXNhYmxl
IGFuZCBfX3VhY2Nlc3NfdHRicjBfZW5hYmxlLAo+IGFyZSB0aGUgbGFzdCB0d28gbWFjcm9zIGRl
ZmluZWQgaW4gYXNtLXVhY2Nlc3MuaC4KPgo+IFJlcGxhY2UgdGhlbSB3aXRoIEMgd3JhcHBlcnMg
YW5kIGNhbGwgQyBmdW5jdGlvbnMgZnJvbQo+IGtlcm5lbF9lbnRyeSBhbmQga2VybmVsX2V4aXQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXZlbCBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ac29sZWVu
LmNvbT4KPiAtLS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hc20tdWFjY2Vzcy5oIHwgMzgg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL2FybTY0L2tlcm5lbC9lbnRyeS5T
ICAgICAgICAgICAgfCAgNiArKy0tLQo+ICBhcmNoL2FybTY0L2xpYi9jbGVhcl91c2VyLlMgICAg
ICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0L2xpYi9jb3B5X2Zyb21fdXNlci5TICAgICAgfCAg
MiArLQo+ICBhcmNoL2FybTY0L2xpYi9jb3B5X2luX3VzZXIuUyAgICAgICAgfCAgMiArLQo+ICBh
cmNoL2FybTY0L2xpYi9jb3B5X3RvX3VzZXIuUyAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0
L21tL2NhY2hlLlMgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtNjQvbW0vY29udGV4
dC5jICAgICAgICAgICAgICB8IDEyICsrKysrKysrKwo+ICBhcmNoL3h0ZW5zYS9rZXJuZWwvY29w
cm9jZXNzb3IuUyAgICAgfCAgMSAtCj4gIDkgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgNDcgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2luY2x1
ZGUvYXNtL2FzbS11YWNjZXNzLmgKClsuLi5dCgo+IGRpZmYgLS1naXQgYS9hcmNoL3h0ZW5zYS9r
ZXJuZWwvY29wcm9jZXNzb3IuUyBiL2FyY2gveHRlbnNhL2tlcm5lbC9jb3Byb2Nlc3Nvci5TCj4g
aW5kZXggODA4MjhiOTVhNTFmLi42MzI5ZDE3ZTJhYTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94dGVu
c2Eva2VybmVsL2NvcHJvY2Vzc29yLlMKPiArKysgYi9hcmNoL3h0ZW5zYS9rZXJuZWwvY29wcm9j
ZXNzb3IuUwo+IEBAIC0xOCw3ICsxOCw2IEBACj4gICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+
Cj4gICNpbmNsdWRlIDxhc20vY29wcm9jZXNzb3IuaD4KPiAgI2luY2x1ZGUgPGFzbS90aHJlYWRf
aW5mby5oPgo+IC0jaW5jbHVkZSA8YXNtL2FzbS11YWNjZXNzLmg+Cj4gICNpbmNsdWRlIDxhc20v
dW5pc3RkLmg+Cj4gICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gICNpbmNsdWRlIDxhc20vY3Vy
cmVudC5oPgoKVGhpcyBpcyBub3QgcmVsYXRlZCB0byBhcm02NCBvciB0byB0aGUgY2hhbmdlcyBp
biB0aGUgZGVzY3JpcHRpb24sCmJ1dCB0aGUgY2hhbmdlIGl0c2VsZiBpcyBPSy4gV2hldGhlciB5
b3Uga2VlcCBpdCBpbiB0aGlzIHBhdGNoLApvciBjaG9vc2UgdG8gc3BsaXQgaXQgb3V0IGZlZWwg
ZnJlZSB0byBhZGQKCkFja2VkLWJ5OiBNYXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWlsLmNvbT4g
IyBmb3IgeHRlbnNhIGJpdHMKCi0tIApUaGFua3MuCi0tIE1heAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
