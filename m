Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA317AE3
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:41:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMn3-0002AA-0y; Wed, 08 May 2019 13:39:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fFX=TI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOMn2-0002A5-4Q
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:39:20 +0000
X-Inumbo-ID: ad87a7f4-7196-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ad87a7f4-7196-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 13:39:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F96280D;
 Wed,  8 May 2019 06:39:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F0CD3F5AF;
 Wed,  8 May 2019 06:39:16 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <fa126315-31af-854e-817a-8640b431c82b@arm.com>
 <CAC1WxdiMzAq5hRC-mhRQuFDs7z_Hj5w7VAy52ec87SJQOGmp3w@mail.gmail.com>
 <a28f95a1-d9da-2caf-f4b4-013100176b02@arm.com>
 <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
Date: Wed, 8 May 2019 14:39:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCt4ZW4tZGV2ZWwsIGp1ZXJnZW4sIGJvcmlzKQoKT24gMDgvMDUvMjAxOSAxMDoyNSwgQW5kcmlp
IEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKdWxpZW4sCj4gCj4gT24gMDMuMDUuMTkgMTM6MTksIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4gQ291bGQgeW91IGJlIGEgYml0IG1vcmUgc3BlY2lmaWMgYWJv
dXQgdGhlIGZhaWx1cmU/IERvIHlvdSBzZWUgIkZhaWxlZCB0byB3YWxrIAo+PiBwYWdlLXRhYmxl
Ij8KPiBTb3JyeSBmb3IgYSBkZWxheWVkIGFuc3dlci4KPiAKPiBZZXMsIEkgc2VlINC10YDRgyBm
b2xsb3dpbmcsIGFsc28gd2l0aCB5b3VyIHBhdGNoIChhbmQgcmVwbGFjaW5nIGRwcmludGsgd2l0
aCAKPiBwcmludGssICdjYXVzZSBpdCBpcyBtb3JlIGNvbnZlbmllbnQgdG8gbWUgdG8gaXNzdWUg
YSBub24tZGVidWcgYnVpbGQpOgo+IAo+IChYRU4pIGQxdjMgcGFyIDB4ODA5Cj4gKFhFTikgZDF2
MSBwYXIgMHg4MDkKPiAoWEVOKSBkMXYyIHBhciAweDgwOQo+IChYRU4pIGQxdjAgcGFyIDB4ODA5
Cj4gKFhFTikgZDF2MzogRmFpbGVkIHRvIHdhbGsgcGFnZS10YWJsZSB2YSAweGZmZmY4MDAwMmZm
N2UzNDgKPiAoWEVOKSBkMXYxOiBGYWlsZWQgdG8gd2FsayBwYWdlLXRhYmxlIHZhIDB4ZmZmZjgw
MDAyZmY0ZTM0OAo+IChYRU4pIGQxdjI6IEZhaWxlZCB0byB3YWxrIHBhZ2UtdGFibGUgdmEgMHhm
ZmZmODAwMDJmZjY2MzQ4Cj4gKFhFTikgZDF2MDogRmFpbGVkIHRvIHdhbGsgcGFnZS10YWJsZSB2
YSAweGZmZmY4MDAwMmZmMzYzNDgKPiAKPiAKPiBBcyBJIHVuZGVyc3RhbmQgQVJNIEFSTSwgRUwx
X1BBUiBzYXlzIGl0IGlzIHRoZSAidHJhbnNsYXRpb24gZmF1bHQgbGV2ZWwiIChhcyAKPiBwZXIg
IklTUyBlbmNvZGluZyBmb3IgYW4gZXhjZXB0aW9uIGZyb20gYSBEYXRhIEFib3J0IiwgREZTQyBi
aXRzKS4KClRoYXQncyBhIHRyYW5zbGF0aW9uIGZhdWx0IGxldmVsIDAgb24gYSBzdGFnZS0xIHBh
Z2UtdGFibGUgd2Fsay4gVG8gY29uZmlybSB5b3UgCmhhdmUga3B0aSBkaXNhYmxlZCwgcmlnaHQ/
IERvZXMgaXQgYWx3YXlzIGZhaWwsIG9yIG9ubHkgdGltZSB0byB0aW1lPyBDb3VsZCB5b3UgCmR1
bXAgdGhlIGd1ZXN0IHJlZ2lzdGVyIHdoZW4gdGhpcyBoYXBwZW4/CgpFdmVuIHdpdGgga3B0aSBk
aXNhYmxlZCwgeW91IGFyZSBzdGlsbCBwb3RlbnRpYWxseSBmYWNpbmcgaXNzdWUgdXNpbmcgdmly
dHVhbCAKYWRkcmVzcyAoYWx0aG91Z2ggdGhleSBtYXkgYmUgbW9yZSBkaWZmaWN1bHQgdG8gdHJp
Z2dlcikuIEluZGVlZCwgeW91IGFyZSAKcmVseWluZyBvbiB0aGUgZ3Vlc3QgT1MgdG8gdW5tYXAg
dGhlIHJlZ2lvbnMgb3IgdG91Y2ggdGhlIHBhZ2UtdGFibGVzIGVudHJpZXMgCnVzZWQgZm9yIHRo
ZSB3YWxrLgoKVW5mb3J0dW5hdGVseSB3ZSBjYW4ndCBwcmV2ZW50IGEgZ3Vlc3QgcGxheWluZyB3
aXRoIGl0cyBwYWdlLXRhYmxlLiBTbyBhdCBiZXN0IAp3ZSBjYW4gb25seSB3b3JrYXJvdW5kIGl0
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
