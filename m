Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F16E282
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:29:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoODi-0001oT-4A; Fri, 19 Jul 2019 08:26:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoODg-0001oM-Sg
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:26:24 +0000
X-Inumbo-ID: e4cafe11-a9fe-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e4cafe11-a9fe-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 08:26:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D51A28;
 Fri, 19 Jul 2019 01:26:23 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4C483F71A;
 Fri, 19 Jul 2019 01:26:21 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhkQdRqC1fBd2BBgUrfiy2LighirOjVWzs4VXg31-DvZng@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1894fc71-50ac-f600-0bad-c7ab22b55183@arm.com>
Date: Fri, 19 Jul 2019 09:26:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkQdRqC1fBd2BBgUrfiy2LighirOjVWzs4VXg31-DvZng@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8wNy8yMDE5IDE4OjE4LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+ICAgICAt
IExpbmUgMjg5OiBGaWxlcyBpbXBvcnRlZCBmcm9tIExpbnV4IHNob3VsZCBub3QgYmUgdG91Y2gg
aGVyZS4KPiAKPiBUaGlzIGlzIGp1c3QgYSByYXcgZHVtcCBvZiB3aGF0IGhhcHBlbnMgaWYgSSBy
dW4gYXN0eWxlIG9uIGFsbCBzb3VyY2UKPiBhbmQgaGVhZGVyIGZpbGVzLiBPYnZpb3VzbHkgSSB3
b24ndCBhdHRlbXB0IHRvIHVwc3RyZWFtIGFsbCB0aGVzZQo+IGNoYW5nZXMgeW91IHNlZSBpbiB0
aGUgZ2lzdC4gUmVzcGVjdGl2ZSBtYWludGFpbmVycyBhcmUgd2VsY29tZSB0byB1c2UKPiB0aGUg
dG9vbCBpZiB0aGV5IGZpbmQgdmFsdWUgaW4gaXQuCgpNYWludGFpbmVycyB1c3VhbGx5IGtub3cg
dGhlIHN0eWxlIG9mIGEgZmlsZS4gSG93ZXZlciwgdGhpcyBpcyBub3QgdGhlIGNhc2Ugb2YgYSAK
dXNlcnMgb3IgZXZlbiB0aGUgQ0kuCgpJIGFncmVlIHRoaXMgaXMgbm90IGEgbmV3IHByb2JsZW0g
YnV0IGEgbGlzdCBvZiBmaWxlcyB1c2luZyBYZW4vTGludXggQ29kaW5nIApTdHlsZSB3b3VsZCBi
ZSBoZWxwZnVsIGluIHRoZSB0d28gY29udGV4dHMgbWVudGlvbmVkLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
