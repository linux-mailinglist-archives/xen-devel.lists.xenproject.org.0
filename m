Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7176E2A0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:39:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoON0-0002fM-Gp; Fri, 19 Jul 2019 08:36:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoOMy-0002fH-Dp
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:36:00 +0000
X-Inumbo-ID: 3be34d7a-aa00-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3be34d7a-aa00-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 08:35:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A0AE337;
 Fri, 19 Jul 2019 01:35:59 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 706543F71A;
 Fri, 19 Jul 2019 01:35:57 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d60c933e-7f30-191c-2d75-4558223ef3e4@arm.com>
Date: Fri, 19 Jul 2019 09:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
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

SGkgVGFtYXMsCgpPbiAxOC8wNy8yMDE5IDE4OjIyLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+
ICAgICAtIExpbmUgMTM5OiBUaGUgeyBhcmUgY29tbW9ubHkgb24gdGhlIHNhbWUgbGluZSBhcyBz
dHJ1Y3Qgb3IgZGVmaW5pdGlvbi4KPiAKPiBBY2NvcmRpbmcgdG8gQ09ESU5HX1NUWUxFIHRoYXQn
cyBub3QgaG93IGl0IHNob3VsZCBiZS4KCkkgZ3Vlc3MgeW91IHJlZmVyIHRvIHRoZSBzZWN0aW9u
ICJCcmFjaW5nIi4gSWYgc28sIEkgdGhpbmsgd2UgZG9uJ3QgZm9sbG93IHRoZSAKQ09ESU5HX1NU
WUxFIGZvciBzdHJ1Y3Qgb3IgZGVmaW5pdGlvbi4KCkkgaGF2ZSB0byBhZG1pdCB0aGF0IGZvciB0
aGlzIGNhc2UsIEkgYWx3YXlzIGhhdmUgdG8gbG9vayBhdCBvdGhlciB1c2FnZSBpbiB0aGUgCmNv
ZGUgYmVjYXVzZSBJIHRlbmQgdG8gcHV0IHRoZSB7IG9uIGEgbmV3bGluZS4KCkkgd2FzIGdvaW5n
IHRvIHNheSB0aGF0IHRoZXJlIG1heSBiZSBzb21lIGNhc2VzIHdoZXJlIGl0IG1ha2VzIHNlbnNl
IHRvIGtlZXAgeyAKb24gdGhlIHNhbWUgbGluZS4gRm9yIGluc3RhbmNlOgoKICAgIHsgYSwgYiwg
YywgZCB9LAogICAgeyBlLCBmLCBnLCBoIH0sCgpCdXQgaXQgbG9va3MgbGlrZSBhc3R5bGUgaXMg
YWxsb3dpbmcgaXQgKHNlZSBsaW5lIDI0NzU5KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
