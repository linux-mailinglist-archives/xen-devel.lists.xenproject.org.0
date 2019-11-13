Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAC9FB226
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:08:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtHx-0004zv-Sa; Wed, 13 Nov 2019 14:06:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J2+i=ZF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUtHw-0004zn-LF
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:06:28 +0000
X-Inumbo-ID: c862ceaa-061e-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c862ceaa-061e-11ea-984a-bc764e2007e4;
 Wed, 13 Nov 2019 14:06:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63E00B211;
 Wed, 13 Nov 2019 14:06:26 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
 <07358162-1d03-63f5-ad14-95a2e0e23018@suse.com>
 <cd81b75f-bf43-9094-7236-8efa4da27da1@oracle.com>
 <4577bd33-e4b5-9869-3760-c55471382f01@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b6afa49b-e33d-dc4c-3e3b-de260219cd9e@suse.com>
Date: Wed, 13 Nov 2019 15:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4577bd33-e4b5-9869-3760-c55471382f01@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] xen/mcelog: also allow building for
 32-bit kernels
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMTkgMTQ6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjExLjIwMTkgMDE6
MTUsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMTEvMTEvMTkgOTo0NiBBTSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBUaGVyZSdzIG5vIGFwcGFyZW50IHJlYXNvbiB3aHkgaXQgY2FuIGJl
IHVzZWQgb24gNjQtYml0IG9ubHkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4KPj4+IC0tLSBhL2RyaXZlcnMveGVuL0tjb25maWcKPj4+
ICsrKyBiL2RyaXZlcnMveGVuL0tjb25maWcKPj4+IEBAIC0yODUsNyArMjg1LDcgQEAgY29uZmln
IFhFTl9BQ1BJX1BST0NFU1NPUgo+Pj4gICAKPj4+ICAgY29uZmlnIFhFTl9NQ0VfTE9HCj4+PiAg
IAlib29sICJYZW4gcGxhdGZvcm0gbWNlbG9nIgo+Pj4gLQlkZXBlbmRzIG9uIFhFTl9ET00wICYm
IFg4Nl82NCAmJiBYODZfTUNFCj4+PiArCWRlcGVuZHMgb24gWEVOX0RPTTAgJiYgWDg2ICYmIFg4
Nl9NQ0UKPj4KPj4gQ2FuIHdlIGhhdmUgWDg2X01DRSB3aXRob3V0IFg4Nj8KPiAKPiBJIGRvbid0
IHRoaW5rIHdlIGNhbi4gSXMgdGhpcyBhIHJlcXVlc3QgdG8gZHJvcCB0aGUgbWlkZGxlCj4gb3Bl
cmFuZCBhbHRvZ2V0aGVyPwoKSSB0aGluayB0aGlzIHdvdWxkIGJlIHJlYXNvbmFibGUuIFg4Nl82
NCB3YXMgYW4gYWRkaXRpb25hbCBkZXBlbmRlbmN5LAp3aGlsZSBYODYgaXNuJ3QuCgpXaXRoIHRo
ZSBYODYgcmVtb3ZlZDoKClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
