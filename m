Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BDB131AFC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 23:04:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioaRM-0005Vi-20; Mon, 06 Jan 2020 22:01:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ioaRL-0005Vc-24
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 22:01:35 +0000
X-Inumbo-ID: 1a2c3cea-30d0-11ea-ab76-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a2c3cea-30d0-11ea-ab76-12813bfff9fa;
 Mon, 06 Jan 2020 22:01:34 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1552D2072A;
 Mon,  6 Jan 2020 22:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578348093;
 bh=CNjaa1Tdo3/4I1JLOR7qn67UT6oAxuJYDm5hB87l+hE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KSYD5rxxEqU3AFQ0Ad68z9NvqR2dP/+pjJW5KKg/JbpVNVM73Y/lD1I+9gbih6YBQ
 MUrkpDMgOxYh2h2dT9TI4USGQkjPJUIrBDn7cnzdBQCziBbXysE6uiOgQhAosslOpj
 JRN8mr8Lim1Q/R/FmN6hfDalVZUPVDyd+lDSgFgo=
Date: Mon, 6 Jan 2020 14:01:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Xu <xuwei5@hisilicon.com>
In-Reply-To: <5E071910.2070002@hisilicon.com>
Message-ID: <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ
 active status range
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 linuxarm@huawei.com, shameerali.kolothum.thodi@huawei.com,
 prime.zeng@hisilicon.com, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCAyOCBEZWMgMjAxOSwgV2VpIFh1IHdyb3RlOgo+IEhpIEp1bGllbiwKPiAKPiBPbiAy
MDE5LzEyLzI4IDE2OjA5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gT24g
MjgvMTIvMjAxOSAwMzowOCwgV2VpIFh1IHdyb3RlOgo+ID4gPiBUaGlzIHBhdGNoIGZpeGVzIHRo
ZSB0eXBvIGFib3V0IHRoZSBhY3RpdmUgc3RhdHVzIHJhbmdlIG9mIGFuIElSUQo+ID4gPiB2aWEg
R0lDRC4gT3RoZXJ3aXNlIGl0IHdpbGwgYmUgZmFpbGVkIHRvIGhhbmRsZSB0aGUgbW1pbyBhY2Nl
c3MgYW5kCj4gPiA+IGluamVjdCBhIGRhdGEgYWJvcnQuCj4gPiBJIGhhdmUgc2VlbiBhIHBhdGNo
IHNpbWlsYXIgZnJvbSBOWFAgYSBtb250aCBhZ28gYW5kIEkgZGlzYWdyZWVkIG9uIHRoZQo+ID4g
YXBwcm9hY2guCj4gPiAKPiA+IElmIHlvdSBsb29rIGF0IHRoZSBjb250ZXh0IHlvdSBtb2RpZmVk
LCBpdCBzYXlzIHRoYXQgcmVhZGluZyBBQ1RJVkVSIGlzIG5vdAo+ID4gc3VwcG9ydGVkLiBXaGls
ZSBJIGFncmVlIHRoZSBiZWhhdmlvciBpcyBub3QgY29uc2lzdGVudCBhY2Nyb3NzIEFDVElWRVIs
Cj4gPiBpbmplY3RpbmcgYSBkYXRhIGFib3J0IGlzIGEgcGVyZmVjdGx5IGZpbmUgYmVoYXZpb3Ig
dG8gbWUgKHRob3VnaCBub3Qgc3BlYwo+ID4gY29tcGxpYW50KSBhcyB3ZSBkb24ndCBpbXBsZW1l
bnQgdGhlIHJlZ2lzdGVycyBjb3JyZWN0bHkuCj4gPiAKPiA+IEkgZ3Vlc3MgeW91IGFyZSBzZW5k
aW5nIHRoaXMgcGF0Y2gsIGJlY2F1c2UgeW91IHRyaWVkIExpbnV4IDUuNCAob3IgbGF0ZXIpCj4g
PiBvbiBYZW4sIHJpZ2h0PyBMaW51eCBoYXMgcmVjZW50bHkgYmVnYW4gdG8gcmVhZCBBQ1RJVkVS
IHRvIGNoZWNrIHdoZXRoZXIgYW4KPiA+IElSUSBpcyBhY3RpdmUgYXQgdGhlIEhXIGxldmVsIGR1
cmluZyB0aGUgc3luY2hyb25pemluZyBvZiB0aGUgSVJRUy4gRnJvbSBteQo+ID4gdW5kZXJzdGFu
ZGluZywgdGhpcyBpcyB1c2VkIGJlY2F1c2UgdGhlcmUgaXMgYSB3aW5kb3cgd2hlcmUgdGhlIGlu
dGVycnVwdCBpcwo+ID4gYWN0aXZlIGF0IHRoZSBIVyBsZXZlbCBidXQgdGhlIExpbnV4IElSUSBz
dWJzeXN0ZW0gaXMgbm90IGF3YXJlIG9mIGl0Lgo+ID4gCj4gPiBXaGlsZSB0aGUgcGF0Y2ggYmVs
b3cgd2lsbCBhbGxvdyBMaW51eCA1LjQgdG8gbm90IGNyYXNoLCBpdCBpcyBub3QgZ29pbmcgdG8K
PiA+IG1ha2UgaXQgZmx5IHZlcnkgZmFyIGJlY2F1c2Ugb2YgdGhlIGFib3ZlLiBTbyBJIGFtIHJh
dGhlciBub3QgaGFwcHkgd2l0aAo+ID4gcGVyc3Vpbmcgd2l0aCByZXR1cm5pbmcgMC4KPiA+IAo+
IAo+IFllcywgSSBhbSB1c2luZyBMaW51eCA1LjUtcmMyIDopCj4gR290IGl0IGFuZCB0aGFua3Mg
Zm9yIHRoZSBleHBsYW5hdGlvbi4KPiBJIGFtIG5vdCBpbnNpc3RlbnQgb24gdGhpcyBhbmQgT0sg
dG8gd2FpdCBmb3IgdGhlIHVwZGF0ZS4KPiBUaGFua3MgYW5kIGhhdmUgYSB2ZXJ5IGhhcHB5IG5l
dyB5ZWFyIQoKSGkgV2VpLAoKd2hhdCBkbyB5b3UgZG8gdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZT8g
QXJlIHlvdSBqdXN0IGJvb3RpbmcgTGludXgKNS41LXJjMiBhcyBkb20wIGFuZCBzZWVpbmcgdGhl
IGlzc3VlIGR1cmluZyBib290LCBvciBhcmUgeW91IGRvaW5nCnNvbWV0aGluZyBzcGVjaWZpYz8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
