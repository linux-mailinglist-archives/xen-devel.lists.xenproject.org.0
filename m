Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B07188830
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 15:54:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEDaD-0007ym-6w; Tue, 17 Mar 2020 14:52:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEDaB-0007yU-2j
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:52:39 +0000
X-Inumbo-ID: f15821dc-685e-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f15821dc-685e-11ea-a6c1-bc764e2007e4;
 Tue, 17 Mar 2020 14:52:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AD439AFC6;
 Tue, 17 Mar 2020 14:52:36 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <5fa9d44f9e396a07b87ef9bd63094237b1efecc2.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8f6989f-5b9d-ffec-8e21-971d18a698a4@suse.com>
Date: Tue, 17 Mar 2020 15:52:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5fa9d44f9e396a07b87ef9bd63094237b1efecc2.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Add -MP to CFLAGS along with -MMD.
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAxNTozNCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gVGhpcyBjYXVzZXMgZ2NjICh5ZXMs
IGFuZCBjbGFuZykgdG8gZW1pdCBwaG9ueSB0YXJnZXRzIGZvciBlYWNoIGRlcGVuZGVuY3kuCj4g
Cj4gVGhpcyBtZWFucyB0aGF0IHdoZW4gYSBoZWFkZXIgZmlsZSBpcyBkZWxldGVkLCB0aGUgQyBm
aWxlcyB3aGljaCAqdXNlZCoKPiB0byBpbmNsdWRlIGl0IHdpbGwgbm8gbG9uZ2VyIHN0b3AgYnVp
bGRpbmcgd2l0aCBib2d1cyBvdXQtb2YtZGF0ZQo+IGRlcGVuZGVuY2llcyBsaWtlIHRoaXM6Cj4g
Cj4gICBtYWtlWzVdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldAo+ICAgJy9ob21lL2R3bXcy
L2dpdC94ZW4veGVuL2luY2x1ZGUvYXNtL2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgnLAo+ICAg
bmVlZGVkIGJ5ICdwMm0ubycuIFN0b3AuCgpJbiBwcmluY2lwbGUgdGhpcyB3b3VsZCBiZSBuaWNl
LCBidXQgdGhlcmUgbXVzdCBiZSBhIHJlYXNvbiB0aGlzIGlzbid0CnRoZSBkZWZhdWx0IGJlaGF2
aW9yLiBBcyB0aGUgd29ya2Fyb3VuZCBmb3IgdGhlIGlzc3VlIGF0IGhhbmQgaXMgcXVpdGUKc2lt
cGxlLCBJIHdvdWxkbid0IGxpa2UgdG8gdHJlYXQgYWRkcmVzc2luZyB0aGlzIG9uZSBieSBzb21l
IG90aGVyCmFub21hbHkvcXVpcmsuIERvIHlvdSAob3IgZG9lcyBhbnlvbmUgZWxzZSkgaGF2ZSBp
bnNpZ2h0IGludG8gd2h5IHRoaXMKaXNuJ3QgZGVmYXVsdCBiZWhhdmlvcj8KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
