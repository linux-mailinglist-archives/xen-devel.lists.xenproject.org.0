Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FFBFE0C5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:02:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVd5J-0001Wz-Bb; Fri, 15 Nov 2019 15:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVd5H-0001Wp-S8
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:00:27 +0000
X-Inumbo-ID: a80dc22c-07b8-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a80dc22c-07b8-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 15:00:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C9239B17D;
 Fri, 15 Nov 2019 15:00:25 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
 <20191115143959.GI72134@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ee086c8-3527-99e6-aad6-238f031dd41f@suse.com>
Date: Fri, 15 Nov 2019 16:00:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191115143959.GI72134@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] x86: clang build check adjustments
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, JulienGrall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxNTo0NSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBO
b3YgMTUsIDIwMTkgYXQgMTE6NDM6MjFBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IDE6
IGZpeCBjbGFuZyAubWFjcm8gcmV0ZW50aW9uIGNoZWNrCj4+IDI6IGNsYW5nOiBtb3ZlIGFuZCBm
aXggLnNraXAgY2hlY2sKPiAKPiBGb3IgYm90aDoKPiAKPiBUZXN0ZWQtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhc3VAY2l0cml4LmNvbT4KPiBbT24gRnJlZUJTRCBhbmQgRGViaWFuIDku
NV0KClRoYW5rcyBtdWNoLiBJJ2xsIHRha2UgdGhlIGxpYmVydHkgYW5kIGRyb3AgdGhlIHNlZW1p
bmdseSBzdHJheQoncycgZnJvbSB5b3VyIGVtYWlsIGFkZHJlc3MgaGVyZS4KCj4gUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IE5vdGUgdGhl
cmUncyBhIHR5cG8gaW4gdGhpcyBlbWFpbCdzIHN1YmplY3QgKGNsYW5rIHYgY2xhbmcpLgoKWWVh
aCwgSSBoYWQgbm90aWNlZCB0aGlzIHJpZ2h0IGFmdGVyIHNlbmRpbmcuIEZpbmdlcnMgYW5kIGJy
YWluCm11c3QgaGF2ZSBoYWQgYSBkaXNjb25uZWN0LgoKPiBBbHNvLCBpZgo+IHBvc3NpYmxlLCBj
b3VsZCBib3RoIHBhdGNoZXMgaGF2ZSB0aGUgc2FtZSBwcmVmaXg/ICh4ODYvY2xhbmcpCgpJIGRp
ZCBub3RpY2UgdGhlIHByZWZpeCBkaWZmZXJlbmNlIGJlZm9yZSBzZW5kaW5nIHRoZSBzZXJpZXMu
IApJIHdvdWxkbid0IG1pbmQgbWFraW5nIGJvdGgganVzdCB4ODY6IChtb3ZpbmcgImNsYW5nIiBl
bHNld2hlcmUKaW4gdGhlIHRpdGxlIG9mIHlvdXJzKSwgYnV0IEkgZG9uJ3Qgd2FudCB0byBtYWtl
IG1pbmUgaGF2ZQp4ODYvY2xhbmcsIGJlY2F1c2UgSSB0aGluayB0aGVzZSBzaG91bGQgcmVwcmVz
ZW50IHN1YnN5c3RlbXMgb3IKYWxpa2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
