Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB9784B38
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:09:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKir-0004kT-7p; Wed, 07 Aug 2019 12:07:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dGpx=WD=amazon.com=prvs=115058da6=elnikety@srs-us1.protection.inumbo.net>)
 id 1hvKiq-0004kO-7u
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:07:16 +0000
X-Inumbo-ID: e4bc8448-b90b-11e9-b259-0b054e93e651
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4bc8448-b90b-11e9-b259-0b054e93e651;
 Wed, 07 Aug 2019 12:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1565179635; x=1596715635;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bbW6tEDA74LAFCaPqF7mTHbNfTxR/D/uv684duC8QlY=;
 b=qqF1GyBIgSXwcBugUA/nedjPhpinUQifBtKhOqxI7gQrYFsZEJiSByTK
 TjsIAHKUTEBZffkAGVu8kIBmwnADQPPeSMHWz89cjrDLy+svW6LEqJEON
 0l/AwlBgPvuJOGMRPNMd5P1z87cnp9Dk56vHVIwlAB4LvCy76XSzvhmfr M=;
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; d="scan'208";a="691691402"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 07 Aug 2019 12:07:10 +0000
Received: from EX13MTAUEB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id DB05BA23AE; Wed,  7 Aug 2019 12:07:09 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.96) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 12:07:09 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 12:07:08 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Wed, 7 Aug 2019 12:07:08 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] evtchn: make support for different ABIs tunable
Thread-Index: AQHVTRIxUNF+eOebUkSjRBUx8cK6Dqbvj84AgAAHUYA=
Date: Wed, 7 Aug 2019 12:07:07 +0000
Message-ID: <9F89B8B5-D92E-4CA6-ABCF-5F8E9707AE94@amazon.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
In-Reply-To: <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.63]
Content-ID: <CC9BAE2748892D40A1184C7C3319FC03@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDcuIEF1ZyAyMDE5LCBhdCAxMzo0MCwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gT24gMDcvMDgvMjAxOSAxMjoyMCwgRXNsYW0gRWxu
aWtldHkgd3JvdGU6Cj4+IEFkZGluZyBzdXBwb3J0IGZvciBGSUZPIGV2ZW50IGNoYW5uZWwgQUJJ
IHdhcyBmaXJzdCBpbnRyb2R1Y2VkIGluIFhlbiA0LjQKPj4gKHNlZSA4ODkxMDA2MWVjNikuIE1h
a2UgdGhpcyBzdXBwb3J0IHR1bmFibGUsIHNpbmNlIHRoZSBjaG9pY2Ugb2Ygd2hpY2gKPj4gZXZl
bnQgY2hhbm5lbCBBQkkgaGFzIGltcGxpY2F0aW9ucyBmb3IgaGliZXJuYXRpb24uIENvbnNpZGVy
IHJlc3VtaW5nIGEKPj4gcHJlIFhlbiA0LjQgaGliZXJuYXRlZCBMaW51eCBndWVzdC4gVGhlIGd1
ZXN0IGJvb3Qga2VybmVsIGRlZmF1bHRzIHRvIEZJRk8KPj4gQUJJLCB3aGVyZWFzIHRoZSByZXN1
bWUga2VybmVsIGFzc3VtZXMgMkwuIFRoaXMsIGluIHR1cm4sIHJlc3VsdHMgaW4gWGVuCj4+IGFu
ZCB0aGUgcmVzdW1lZCBrZXJuZWwgdGFsa2luZyBwYXN0IGVhY2ggb3RoZXIgKGR1ZSB0byBkaWZm
ZXJlbnQgcHJvdG9jb2xzCj4+IEZJRk8gdnMgMkwpLgo+IAo+IEknbSBhZnJhaWQgSSBkb24ndCBm
b2xsb3cuCj4gCj4gV2UgaGF2ZSBhIExpbnV4IGtlcm5lbCB3aGljaCBrbm93cyBhYm91dCBGSUZP
LCB3aGljaCB3YXMgZmlyc3QgYm9vdGVkIG9uCj4gWGVuIDwgNC40LCBzbyBjb25maWd1cmVkIDJM
IG1vZGUuCj4gCj4gSXQgaXMgdGhlbiBzdXNwZW5kZWQsIGFuZCByZXN1bWVkIG9uIGEgbmV3ZXIg
WGVuID49IDQuNC4gIFRoZSBndWVzdCBub3cKPiBoYXMgYSBjaG9pY2UgYmV0d2VlbiAyTCBtb2Rl
LCBhbmQgRklGTyBtb2RlLgo+IAo+IFdoYXQgaXMgdGhlIHByb2JsZW0/Cj4gCj4gV2hlbiByZXN1
bWluZywgdGhlIGd1ZXN0IGluIHF1ZXN0aW9uIHNob3VsZCBjb250aW51ZSB0byB1c2UgMkwgbW9k
ZSwKPiBiZWNhdXNlIHRoYXQgaXMgd2hhdCBpdCB3YXMgdXNpbmcgcHJldmlvdXNseS4KPiAKPiB+
QW5kcmV3CgoKQWZ0ZXIgcmVzdW1pbmcgKGkuZS4sIExpbnV4J3Mgc29mdHdhcmVfcmVzdW1lKSwg
dGhlIGd1ZXN0IHdpbGwgaW5kZWVkIGNvbnRpbnVlIHRvIHVzZSAyTC4gSG93ZXZlciwgWGVuIGhh
cyBhbHJlYWR5IGRvbmUgZXZ0Y2huX2ZpZm9faW5pdF9jb250cm9sIGFzIHBhcnQgb2YgdGhlIGJv
b3Qga2VybmVsIGluaXQgKGJlZm9yZSB0aGUgZ3Vlc3QncyBzb2Z0d2FyZV9yZXN1bWUpLiBUaGVu
LCB3ZSByZWFjaCB0aGUgcG9pbnQgd2hlcmUgZ3Vlc3QgYXNzdW1lcyAyTCBhbmQgWGVuIGFzc3Vt
ZXMgRklGTy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
