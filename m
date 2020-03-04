Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0451796BD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 18:33:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Xq3-0006V0-C7; Wed, 04 Mar 2020 17:29:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jmdh=4V=fem.tu-ilmenau.de=jonas.licht@srs-us1.protection.inumbo.net>)
 id 1j9Xq2-0006Uu-Ff
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 17:29:42 +0000
X-Inumbo-ID: ba5c4ecc-5e3d-11ea-a44d-12813bfff9fa
Received: from smail.fem.tu-ilmenau.de (unknown [141.24.220.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba5c4ecc-5e3d-11ea-a44d-12813bfff9fa;
 Wed, 04 Mar 2020 17:29:40 +0000 (UTC)
Received: from [10.48.20.154] (e073.fem.tu-ilmenau.de [141.24.41.73])
 by smail.fem.tu-ilmenau.de (Postfix) with ESMTPSA id 4FF562005A;
 Wed,  4 Mar 2020 18:29:39 +0100 (CET)
To: xen-devel@lists.xenproject.org
References: <493c670d7726e74e0c5d76da678e190a@fem.tu-ilmenau.de>
 <20200304103153.xg74oqynievvy4sf@debian>
From: Jonas Licht <jonas.licht@fem.tu-ilmenau.de>
Autocrypt: addr=jonas.licht@fem.tu-ilmenau.de; prefer-encrypt=mutual; keydata=
 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
 ZbSb8Q==
Message-ID: <49a5966b-a3b3-541d-52d1-3746b3bc7000@fem.tu-ilmenau.de>
Date: Wed, 4 Mar 2020 18:29:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304103153.xg74oqynievvy4sf@debian>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] libxenstat: fixed Makefile for building
 python-bindings
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gMDQuMDMuMjAgdW0gMTE6MzEgc2NocmllYiBXZWkgTGl1Ogo+IEhpIEpvbmFzCkhpIFdlaQo+
IFRoYW5rcyBmb3IgdGhpcyBwYXRjaC4KPgo+IE9uIE1vbiwgTWFyIDAyLCAyMDIwIGF0IDA2OjUz
OjM4UE0gKzAxMDAsIGpvbmFzLmxpY2h0QGZlbS50dS1pbG1lbmF1LmRlIHdyb3RlOgo+PiBGaXhl
cyB0aGUgbGlieGVuc3RhdCBNYWtlZmlsZSB0byBkZXRlcm1pbmUgdGhlIGNvcnJlY3QgcGF0aHMK
Pj4gb2YgcHl0aG9uIGluY2x1ZGVzIHdoZW4gYnVpbGRpbmcgcHl0aG9uLWJpbmRpbmdzLgo+PiBB
bHNvIHJlcGxhY2VzIHRoZSAtbHhlbnN0YXQgbGlua2luZyB0byBjb3JyZWN0IG9iamVjdCBmaWxl
cwo+PiBhbmQgdXNlIHRoZSBsaWJkaXIgdmFyaWFibGUgZm9yIGluc3RhbGxpbmcuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEpvbmFzIExpY2h0IDxqb25hcy5saWNodEBmZW0udHUtaWxtZW5hdS5kZT4K
Pj4gLS0tCj4+ICB0b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUgfCAxMSArKysrKy0t
LS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZQo+PiBi
L3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZQo+PiBpbmRleCAwM2NiMjEyZTNiLi40
YTAyZDJlNTYzIDEwMDY0NAo+PiAtLS0gYS90b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZp
bGUKPj4gKysrIGIvdG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0L01ha2VmaWxlCj4+IEBAIC0xMTQs
MTggKzExNCwxNyBAQCAkKEJJTkRJTkdTKTogJChTSExJQikgJChTSExJQl9MSU5LUykgc3JjL3hl
bnN0YXQuaAo+PiAgU1dJR19GTEFHUz0tbW9kdWxlIHhlbnN0YXQgLUlzcmMKPj4KPj4gICMgUHl0
aG9uIGJpbmRpbmdzCj4+IC1QWVRIT05fVkVSU0lPTj0kKFBZVEhPTjpweXRob24lPSUpCj4+IC1Q
WVRIT05fRkxBR1M9LUkvdXNyL2luY2x1ZGUvcHl0aG9uJChQWVRIT05fVkVSU0lPTikKPj4gLWxw
eXRob24kKFBZVEhPTl9WRVJTSU9OKQo+PiArUFlUSE9OX0ZMQUdTPWAkKFBZVEhPTikgLWMgJ2lt
cG9ydCBkaXN0dXRpbHMuc3lzY29uZmlnOyBwcmludCgiLUkiICsKPiBBIGJldHRlciBhcHByb2Fj
aCB3b3VsZCBiZSB0byB1c2UgcHl0aG9uLWNvbmZpZyBoZXJlLgpJJ20gbm90IHF1aXRlIHN1cmUg
aWYgSSBjYW4gcmVxdWlyZSB0aGUgcHl0aG9uLWNvbmZpZyB0b29sIGlzIGluc3RhbGxlZC4KQXMg
SSBzZWUgaXQncyBub3QgY2hlY2tlZCBieSB0aGUgY29uZmlndXJlLgpJJ3ZlIHNlZW4gc29tZSBj
b25maWd1cmUgc2NyaXB0cywgd2hpY2ggaGFzIGFuIGV4dHJhIGZhbGxiYWNrIHdoZW4KcHl0aG9u
LWNvbmZpZyBpcyBtaXNzaW5nLgpJIHdhcyBpbnNwaXJlZCBieSB0aGUgbTQvcHl0aG9uX2RldmVs
Lm00IHNjcmlwdCB0b28uCgpCZXN0IHJlZ2FyZHMsCkpvbmFzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
