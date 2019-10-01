Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8657AC388D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:07:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJiK-0005Wd-SF; Tue, 01 Oct 2019 15:05:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFJiJ-0005WT-F1
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:05:19 +0000
X-Inumbo-ID: e0a88b28-e45c-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e0a88b28-e45c-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 15:05:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D7C7AEFB;
 Tue,  1 Oct 2019 15:05:16 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20191001145714.556-1-paul.durrant@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0e187808-f45e-a07a-76c4-83159d1f6122@suse.com>
Date: Tue, 1 Oct 2019 17:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001145714.556-1-paul.durrant@citrix.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMTkgMTY6NTcsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGlzIHdhcyBvcmlnaW5h
bGx5IGEgc2luZ2xlIHBhdGNoLCB3aGljaCBpcyBub3cgcGF0Y2ggIzIgb2YgdGhpcyBzZXJpZXMu
Cj4gCj4gUGF1bCBEdXJyYW50ICgyKToKPiAgICBsaWJ4bDogcmVwbGFjZSAnZW5hYmxlZCcgd2l0
aCAndW5rbm93bicgaW4gbGlieGxfcGFzc3Rocm91Z2gKPiAgICAgIGVudW1lcmF0aW9uCj4gICAg
bGlieGw6IGNob29zZSBhbiBhcHByb3ByaWF0ZSBkZWZhdWx0IGZvciBwYXNzdGhyb3VnaC4uLgo+
IAo+ICAgdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgIHwgMTAgKysrKysrKy0tLQo+ICAgdG9v
bHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgIDIgKy0KPiAgIHRvb2xzL3hsL3hsX3BhcnNlLmMg
ICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKRm9yIHRoZSBzZXJpZXM6CgpS
ZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
