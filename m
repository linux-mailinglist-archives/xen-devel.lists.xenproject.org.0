Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED951346CA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:58:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDgi-0000gB-3O; Wed, 08 Jan 2020 15:56:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=35UJ=25=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1ipDgg-0000g0-E1
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:56:02 +0000
X-Inumbo-ID: 5e46a932-322f-11ea-b840-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e46a932-322f-11ea-b840-12813bfff9fa;
 Wed, 08 Jan 2020 15:56:01 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20FA320705;
 Wed,  8 Jan 2020 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578498961;
 bh=mIybP4hijuAZNFwcJH7CrRcU+FHWkFZ73CZ/1r0Pnx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bBQfwWd5QGEc5g3fjdlxVj5i8T0yuRUFW1nHnXreVZ6rKhUWkgeyR/be309xRqBoy
 vt9G7u3FScxOFMirZal2juXZLYjHg3H+CYEp6QhS6Qfz3DVUB3Vx26vAK18ZgJSKR/
 57HDbFtFVhlCDGP9Lh70YRVOtgV2uC/2nfFuPIaQ=
Date: Wed, 8 Jan 2020 15:55:52 +0000
From: Will Deacon <will@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20200108155551.GA19197@willie-the-truck>
References: <20191219122532.6538-1-broonie@kernel.org>
 <alpine.DEB.2.21.1912191307410.9832@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1912191307410.9832@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2] arm64: xen: Use modern annotations for
 assembly functions
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Julien Grall <julien@xen.org>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMDE6MDc6NTBQTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIFRodSwgMTkgRGVjIDIwMTksIE1hcmsgQnJvd24gd3JvdGU6Cj4gPiBJ
biBhbiBlZmZvcnQgdG8gY2xhcmlmeSBhbmQgc2ltcGxpZnkgdGhlIGFubm90YXRpb24gb2YgYXNz
ZW1ibHkgZnVuY3Rpb25zCj4gPiBpbiB0aGUga2VybmVsIG5ldyBtYWNyb3MgaGF2ZSBiZWVuIGlu
dHJvZHVjZWQuIFRoZXNlIHJlcGxhY2UgRU5UUlkgYW5kCj4gPiBFTkRQUk9DLiBVcGRhdGUgdGhl
IGFubm90YXRpb25zIGluIHRoZSB4ZW4gY29kZSB0byB0aGUgbmV3IG1hY3Jvcy4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+ID4gUmV2aWV3
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gPiBSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IFRoYW5rIHlvdSEK
PiAKPiA+IC0tLQo+ID4gIGFyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TIHwgOCArKysrLS0tLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpJcyB0
aGlzIGdvaW5nIHZpYSB0aGUgWGVuIHRyZWUsIG9yIHNoYWxsIEkgcXVldWUgaXQgYWxvbmcgd2l0
aCB0aGUgb3RoZXIKYXNtIGFubm90YXRpb24gcGF0Y2hlcyBpbiB0aGUgYXJtNjQgdHJlZT8gSSBk
b24ndCBzZWUgaXQgaW4gLW5leHQgeWV0LgoKQ2hlZXJzLAoKV2lsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
