Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A1C115B4A
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 07:03:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idT7b-0000Ul-OD; Sat, 07 Dec 2019 05:59:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ba90=Z5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1idT7a-0000Ug-Sr
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 05:59:14 +0000
X-Inumbo-ID: b10ccc56-18b6-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b10ccc56-18b6-11ea-88e7-bc764e2007e4;
 Sat, 07 Dec 2019 05:59:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E73FDB1FB;
 Sat,  7 Dec 2019 05:59:11 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191205171649.10614-1-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d105a30a-8027-9c73-2d17-fab56416d995@suse.com>
Date: Sat, 7 Dec 2019 06:59:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191205171649.10614-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH] ts-xen-build-prep: Install
 python3-docutils
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMTkgMTg6MTYsIElhbiBKYWNrc29uIHdyb3RlOgo+IFRoaXMgaXMgdGhlIHBhY2th
Z2UgKG9yLCBvbmUgb2YgdGhlIHBhY2thZ2VzKSBjb250YWluaW5nIHJzdDJodG1sLgo+IFRoaXMg
aXMgbm93IG5lZWRlZCBmb3IgYnVpbGRzIG9mIGxpYnZpcnQgdXBzdHJlYW0uCj4gCj4gUmVhbGx5
IHRoaXMgcGFja2FnZXMgaW5zdGFsbCBjYWxsIHNob3VsZCBiZSB0cy1saWJ2aXJ0LWJ1aWxkLCBi
dXQ6Cj4gSGlzdG9yaWNhbGx5IHdlIGhhdmUgZG9uZSBpdCBhbGwgaW4gdHMteGVuLWJ1aWxkLXBy
ZXAuICBJbiB0aGUKPiBtZWFudGltZSB3ZSBoYXZlIHB1dCBhIGxvY2sgYXJvdW5kIHRoZSBjYWxs
IHRvIHRoZSBwYWNrYWdlIG1hbmFnZXIsCj4gYnV0IHRoaXMgaGFzIG9ubHkgYmVlbiBsaWdodGx5
IHRlc3RlZC4gIEF0IHRoaXMgc3RhZ2Ugb2YgdGhlIFhlbgo+IHJlbGVhc2Ugd2Ugd291bGQgcmF0
aGVyIGJlIGNhdXRpb3VzLgo+IAo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
