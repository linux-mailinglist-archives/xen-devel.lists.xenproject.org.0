Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10DACB408
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 06:53:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGFYA-0004wy-IE; Fri, 04 Oct 2019 04:50:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGFY8-0004wt-Mm
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 04:50:40 +0000
X-Inumbo-ID: 83047d26-e662-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83047d26-e662-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 04:50:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CB042AFC3;
 Fri,  4 Oct 2019 04:50:38 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>, Paul Durrant <pdurrant@gmail.com>
References: <20191001145714.556-1-paul.durrant@citrix.com>
 <23956.51705.860315.343098@mariner.uk.xensource.com>
 <CACCGGhDXHhuF7z-ezZUWyGGLY8T9a+JDC4_yw-TrCY3HuPyKPQ@mail.gmail.com>
 <23957.63479.327739.875395@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aa039949-c535-2f80-99bc-6a77696004e4@suse.com>
Date: Fri, 4 Oct 2019 06:50:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23957.63479.327739.875395@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2 0/2] libxl: fix assertion failure
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTAuMTkgMTU6MzAsIElhbiBKYWNrc29uIHdyb3RlOgo+IFBhdWwgRHVycmFudCB3cml0
ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENILWZvci00LjEzIHYyIDAvMl0gbGlieGw6IGZpeCBh
c3NlcnRpb24gZmFpbHVyZSIpOgo+PiBPbiBXZWQsIDIgT2N0IDIwMTkgYXQgMTc6MDQsIElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPj4+IEkgYW0gY29udGludWlu
ZyB0byBsb29rIGF0IHRoZSBkZWZhdWx0aW5nIGFuZCBjb25maWcgbWFuYWdlbWVudCBoZXJlCj4+
PiB3aXRoIGEgdmlldyB0byBnZXR0aW5nIHJpZCBvZiBzb21lIG9mIHRoZSBkdXBsaWNhdGVkIGNv
ZGUgYW5kIG1vdmluZwo+Pj4gaXQgYWxsIGludG8gbGlieGwuCj4+Cj4+IFRoYXQgd291bGQgaW5k
ZWVkIGJlIGJlbmVmaWNpYWwgZm9yIHRoZSBsaWtlcyBvZiBsaWJ2aXJ0Lgo+IAo+IEkgcHJvcG9z
ZSB0aGUgZm9sbG93aW5nIHBsYW4gZm9yIDQuMTM6CgpGaW5lIHdpdGggbWUuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
