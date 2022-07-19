Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A075579366
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370372.602094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh1K-00050Y-22; Tue, 19 Jul 2022 06:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370372.602094; Tue, 19 Jul 2022 06:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh1J-0004xC-VV; Tue, 19 Jul 2022 06:47:49 +0000
Received: by outflank-mailman (input) for mailman id 370372;
 Tue, 19 Jul 2022 06:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lzD=XY=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oDh1I-0004x6-4z
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:47:48 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b29ad0d5-072e-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:47:46 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b29ad0d5-072e-11ed-924f-1f966e50362f
Date: Tue, 19 Jul 2022 06:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1658213266; x=1658472466;
	bh=37G2tlaVzyhPuFL2u35GdUqZ0+Z/S5NnoDpS8FxgTTA=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=WVUsmYiBKOLX3Jqg6TKoI5sMPNv+2ERj8khHVZLfX4FhMwvIJcihu2+bg6NUrAaD3
	 4C2sbYSXG11i1Bx7YKTCDPOGIzSpsKPzVxI1pmOlbiEKNWRQTv8vz968AfU2I7pZuW
	 nYLeNJhU08Jbs8zHU5vdcejD6YNitQU2RvKfo7RVLfZEAlpFDd2NuUqwNIbScyIvu6
	 gSFtoQb3M7a12mG+/h3ozkHqzlOspMrcYJQvPLDMNASDdNPhlDy+o9oGGcibHwBlNP
	 Z1uMaglif7LrSwQJkR4iGx4jbdwQmExCkC6CXUFWlepFC16Gz3+rLxZTGpKfrdhh3E
	 wrUHb6K7npyQQ==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <sGaL_QpFhQEiJk7_54MdbSxBBCvIi-2gER0UjTpNnTLAE_fK5FaydH3wahN-Flcwqe4VEAMcUNdQqWB1g-LC8t3iCFrFIbFktuVv58Wwk3A=@protonmail.com>
In-Reply-To: <7c369f0f-f602-8699-6ec6-9fb05b603825@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <7c369f0f-f602-8699-6ec6-9fb05b603825@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_oKAIByR0E9jJOnj9JiOdROHoWzIjV572oGI9ouH4GbE"

This is a multi-part message in MIME format.

--b1_oKAIByR0E9jJOnj9JiOdROHoWzIjV572oGI9ouH4GbE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

WWVzIOKYue+4jywgZG8geW91IGtub3cgaWYgaXQncyBwb3NzaWJsZSB0byBvYnRhaW4gbG9ncyBz
b21lIG90aGVyIHdheSBmb3IgYSBzeXN0ZW0gdGhhdCBkb2Vzbid0IGhhdmUgYSBDT00gcG9ydD8g
Y29uc29sZT12Z2EgZXhpc3RzIGJ1dCBJIGNhbid0IHNlZW0gdG8gZmxpcCBvdmVyIHRvIHRoZSB2
Z2EgImNvbnNvbGUiIGFmdGVyIEkgdHJpZ2dlciB0aGUgc3RhcnQgb2YgYSBWTQoKLS0tLS0tLS0g
T3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tLQpPbiBKdWwgMTksIDIwMjIsIDQ6MjkgUE0sIEphbiBC
ZXVsaWNoIHdyb3RlOgoKPiBPbiAxOS4wNy4yMDIyIDAxOjA0LCBEeWxhbmdlciBEYWx5IHdyb3Rl
OiA+IEknbSBoYXZpbmcgaXNzdWVzIGdldHRpbmcgUXViZXNPUyBydW5uaW5nIG9uIG15IExlbm92
byBZb2dhIFNsaW0gNyBQcm9YIChBTUQgUnl6ZW4gNjgwMEhTKSA+ID4gRmlyc3RseSBpbiBvcmRl
ciB0byBib290IHRoZSBkZXZpY2UgYXQgYWxsLCBJJ20gcmVxdWlyZWQgdG8gYWRkIGBkb20wX21h
eF92Y3B1cz0xIGRvbTBfdmNwdXNfcGluYCB0byBkb20wJ3MgQ01ETElORSwgdGhpcyBpcyBzaW1p
bGFyIHRvIHdoYXQgSSBoYWQgdG8gZG8gcHJldmlvdXNseSAtIGh0dHBzOi8veGVuLm1hcmttYWls
Lm9yZy9zZWFyY2gvP3E9Unl6ZW4jcXVlcnk6Unl6ZW4rcGFnZToxK21pZDpmM2hlbDR5ajI1cWls
YWJ2K3N0YXRlOnJlc3VsdHMgd2l0aCB0aGUgUnl6ZW4gNDAwMCBzZXJpZXMsIGhvd2V2ZXIgd2l0
aG91dCB0aGVzZSBvcHRpb25zIGFkZGVkIGRvbTAgbmV2ZXIgZnVsbHkgYm9vdHMgaW50byBGZWRv
cmEuID4gPiBUaGUgb3RoZXIgaW50ZXJlc3RpbmcgaXNzdWUgSSdtIGhhdmluZyBpcyB1cG9uIGJv
b3RpbmcgYW55IFZNLCBqdXN0IGEgbm9ybWFsIHNpbXBsZSBWTSB3aXRob3V0IGFueSBQQ0kgZGV2
aWNlcyBhdHRhY2hlZCwgaXQnbGwgc3VjY2Vzc2Z1bGx5IHN0YXJ0LCBhYm91dCAxIHNlY29uZCB3
aWxsIHBhc3MgdGhlbiB0aGUgZW50aXJlIGRldmljZSB3aWxsIGhhbmcgYW5kIHJlc2V0LCBpdCdz
IHZpcnR1YWxseSBpbXBvc3NpYmxlIHRvIGdldCBhbnkgbG9ncyBhdCBhbGwgb3V0IG9mIHRoZSBk
ZXZpY2Ugd2hlbiBpdCdzIGluIHRoaXMgc3RhdGUuID4gPiBGWUk6IFF1YmVzT1MgdXNlcyBYZW4g
NC4xNCBJIGd1ZXNzIHlvdSB1bmRlcnN0YW5kIHRoYXQgd2l0aCBubyBsb2dzIG9yIGFueXRoaW5n
IGVsc2UgdGVjaG5pY2FsIHRoZXJlJ3MgdmVyeSBsaXR0bGUgY2hhbmNlIGFueW9uZSBpcyBnb2lu
ZyB0byBiZSBhYmxlIHRvIGRvIGFueXRoaW5nIGFib3V0IHRoaXMsIHdpdGhvdXQgaGF2aW5nIGFj
Y2VzcyB0byBhbiBhZmZlY3RlZCBzeXN0ZW0/IEphbg==

--b1_oKAIByR0E9jJOnj9JiOdROHoWzIjV572oGI9ouH4GbE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

WWVzIOKYue+4jywgZG8geW91IGtub3cgaWYgaXQncyBwb3NzaWJsZSB0byBvYnRhaW4gbG9ncyBz
b21lIG90aGVyIHdheSBmb3IgYSBzeXN0ZW0gdGhhdCBkb2Vzbid0IGhhdmUgYSBDT00gcG9ydD8g
Y29uc29sZT12Z2EgZXhpc3RzIGJ1dCBJIGNhbid0IHNlZW0gdG8gZmxpcCBvdmVyIHRvIHRoZSB2
Z2EgImNvbnNvbGUiIGFmdGVyIEkgdHJpZ2dlciB0aGUgc3RhcnQgb2YgYSBWTTxicj48YnI+PGJy
Pjxicj4tLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tPGJyPk9uIEp1bCAxOSwgMjAy
MiwgNDoyOSBQTSwgSmFuIEJldWxpY2ggPCBqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6PGJsb2Nr
cXVvdGUgY2xhc3M9InByb3Rvbm1haWxfcXVvdGUiPjxicj5PbiAxOS4wNy4yMDIyIDAxOjA0LCBE
eWxhbmdlciBEYWx5IHdyb3RlOg0KPiBJJ20gaGF2aW5nIGlzc3VlcyBnZXR0aW5nIFF1YmVzT1Mg
cnVubmluZyBvbiBteSBMZW5vdm8gWW9nYSBTbGltIDcgUHJvWCAoQU1EIFJ5emVuIDY4MDBIUykN
Cj4NCj4gRmlyc3RseSBpbiBvcmRlciB0byBib290IHRoZSBkZXZpY2UgYXQgYWxsLCBJJ20gcmVx
dWlyZWQgdG8gYWRkIGBkb20wX21heF92Y3B1cz0xIGRvbTBfdmNwdXNfcGluYCB0byBkb20wJ3Mg
Q01ETElORSwgdGhpcyBpcyBzaW1pbGFyIHRvIHdoYXQgSSBoYWQgdG8gZG8gcHJldmlvdXNseSAt
IGh0dHBzOi8veGVuLm1hcmttYWlsLm9yZy9zZWFyY2gvP3E9Unl6ZW4jcXVlcnk6Unl6ZW4rcGFn
ZToxK21pZDpmM2hlbDR5ajI1cWlsYWJ2K3N0YXRlOnJlc3VsdHMgd2l0aCB0aGUgUnl6ZW4gNDAw
MCBzZXJpZXMsIGhvd2V2ZXIgd2l0aG91dCB0aGVzZSBvcHRpb25zIGFkZGVkIGRvbTAgbmV2ZXIg
ZnVsbHkgYm9vdHMgaW50byBGZWRvcmEuDQo+DQo+IFRoZSBvdGhlciBpbnRlcmVzdGluZyBpc3N1
ZSBJJ20gaGF2aW5nIGlzIHVwb24gYm9vdGluZyBhbnkgVk0sIGp1c3QgYSBub3JtYWwgc2ltcGxl
IFZNIHdpdGhvdXQgYW55IFBDSSBkZXZpY2VzIGF0dGFjaGVkLCBpdCdsbCBzdWNjZXNzZnVsbHkg
c3RhcnQsIGFib3V0IDEgc2Vjb25kIHdpbGwgcGFzcyB0aGVuIHRoZSBlbnRpcmUgZGV2aWNlIHdp
bGwgaGFuZyBhbmQgcmVzZXQsIGl0J3MgdmlydHVhbGx5IGltcG9zc2libGUgdG8gZ2V0IGFueSBs
b2dzIGF0IGFsbCBvdXQgb2YgdGhlIGRldmljZSB3aGVuIGl0J3MgaW4gdGhpcyBzdGF0ZS4NCj4N
Cj4gRllJOiBRdWJlc09TIHVzZXMgWGVuIDQuMTQNCg0KSSBndWVzcyB5b3UgdW5kZXJzdGFuZCB0
aGF0IHdpdGggbm8gbG9ncyBvciBhbnl0aGluZyBlbHNlIHRlY2huaWNhbA0KdGhlcmUncyB2ZXJ5
IGxpdHRsZSBjaGFuY2UgYW55b25lIGlzIGdvaW5nIHRvIGJlIGFibGUgdG8gZG8gYW55dGhpbmcN
CmFib3V0IHRoaXMsIHdpdGhvdXQgaGF2aW5nIGFjY2VzcyB0byBhbiBhZmZlY3RlZCBzeXN0ZW0/
DQoNCkphbg0KPC9kaXY+


--b1_oKAIByR0E9jJOnj9JiOdROHoWzIjV572oGI9ouH4GbE--


