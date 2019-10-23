Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DCFE1E8A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHuL-0002f4-OA; Wed, 23 Oct 2019 14:46:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNHuJ-0002er-Ld
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:46:39 +0000
X-Inumbo-ID: eaf7abd8-f5a3-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaf7abd8-f5a3-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 14:46:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6376B392;
 Wed, 23 Oct 2019 14:46:37 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-6-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d2836a5b-bfe0-7acb-c008-9a89d44ea4c2@suse.com>
Date: Wed, 23 Oct 2019 16:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gRnJvbTogUm9zcyBMYWdl
cndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4gCj4gVGhlIGJpbmFyeSBkaWZmaW5n
IGFsZ29yaXRobSB1c2VkIGJ5IHhlbi1saXZlcGF0Y2ggZGVwZW5kcyBvbiBoYXZpbmcgdW5pcXVl
Cj4gc3ltYm9scy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdl
cndhbGxAY2l0cml4LmNvbT4KPiAKPiBUaGUgbGl2ZXBhdGNoIGxvYWRpbmcgYWxnb3JpdGhtIHVz
ZWQgYnkgWGVuIHJlc29sdmVzIHJlbG9jYXRpb25zIGJ5IHN5bWJvbAo+IG5hbWUsIGFuZCB0aHVz
IGFsc28gZGVwZW5kcyBvbiBoYXZpbmcgdW5pcXVlIHN5bWJvbHMuCj4gCj4gSW50cm9kdWNlIENP
TkZJR19FTkZPUkNFX1VOSVFVRV9TWU1CT0xTIHRvIGNvbnRyb2wgZmFpbGluZyB0aGUgYnVpbGQg
aWYKPiBkdXBsaWNhdGUgc3ltYm9scyBhcmUgZm91bmQsIGFuZCBkaXNhYmxlIGl0IGluIHRoZSBS
QU5EQ09ORklHIGJ1aWxkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
