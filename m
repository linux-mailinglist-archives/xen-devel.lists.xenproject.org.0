Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792AA3819
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 15:53:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hIf-0007O1-Ep; Fri, 30 Aug 2019 13:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3hId-0007Nw-QD
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 13:50:47 +0000
X-Inumbo-ID: 2ac3ead4-cb2d-11e9-ae8a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ac3ead4-cb2d-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 13:50:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AA51EB67F;
 Fri, 30 Aug 2019 13:50:45 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <20190819120845.18846-1-elnikety@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c87d137-55d1-505e-9fea-571182ca7a21@suse.com>
Date: Fri, 30 Aug 2019 15:50:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819120845.18846-1-elnikety@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] evtchn: Introduce a per-guest knob to
 control FIFO ABI
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAxNDowOCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gLS0tIGEveGVuL2Nv
bW1vbi9ldmVudF9jaGFubmVsLmMKPiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYwo+
IEBAIC0xMTcwLDYgKzExNzAsNyBAQCBsb25nIGRvX2V2ZW50X2NoYW5uZWxfb3AoaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCj4gIAo+ICAgICAgY2FzZSBFVlRDSE5P
UF9pbml0X2NvbnRyb2w6IHsKPiAgICAgICAgICBzdHJ1Y3QgZXZ0Y2huX2luaXRfY29udHJvbCBp
bml0X2NvbnRyb2w7Cj4gKwo+ICAgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZpbml0X2Nv
bnRyb2wsIGFyZywgMSkgIT0gMCApCj4gICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICAg
ICAgICAgIHJjID0gZXZ0Y2huX2ZpZm9faW5pdF9jb250cm9sKCZpbml0X2NvbnRyb2wpOwoKU3Ry
YXkgKGxlZnRvdmVyPykgY2hhbmdlLiBJZiBpbnRlbmRlZCwgaXQgc2hvdWxkIGJlIGEgc2VwYXJh
dGUKcGF0Y2ggZGVhbGluZyB3aXRoIGFsbCBzaW1pbGFyIGlzc3VlcyB3aXRoaW4gdGhpcyBzd2l0
Y2goKS4KCkFwYXJ0IGZyb20gdGhpcyBjb3NtZXRpYyBhZGp1c3RtZW50ICh3aGljaCBjb3VsZCBi
ZSBkb25lIGJ5CnRoZSBjb21taXR0ZXIgaWYgbm8gb3RoZXIgbmVlZCBmb3IgYSB2NCBhcmlzZXMp
IEkgY2FuIGxpdmUgd2l0aAp0aGlzIGNoYW5nZSBpbiBpdHMgY3VycmVudCBzaGFwZSBub3csIGJ1
dCBJJ20gaGVzaXRhbnQgdG8gZ2l2ZQpteSBhY2sgZm9yIHRoZSByZWFzb24gc3RhdGVkIGR1cmlu
ZyB2MS92MiByZXZpZXcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
