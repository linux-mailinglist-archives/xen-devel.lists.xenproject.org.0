Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919F6E2CE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:48:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoOUT-0003Nf-CD; Fri, 19 Jul 2019 08:43:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoOUR-0003Na-Mp
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:43:43 +0000
X-Inumbo-ID: 4fca6661-aa01-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4fca6661-aa01-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 08:43:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0989D337;
 Fri, 19 Jul 2019 01:43:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 724223F71A;
 Fri, 19 Jul 2019 01:43:40 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
Date: Fri, 19 Jul 2019 09:43:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
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

SGkgVGFtYXMsCgpPbiAxOC8wNy8yMDE5IDE4OjQ4LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+
ICAgICAtIExpbmUgMTAyNTogVGhlIHRvb2xzIG5lZWRzIHRvIGJlIGFibGUgdG8gZGVhbCBmb3Jf
ZWFjaF92Y3B1KC4uLikgJiBjby4KPiAKPiBUaGVzZSBjYW4gYmUgbWFkZSBPSyBieSBhZGRpbmcg
YnJhY2VzLiBPdGhlciB0aGFuIHRoYXQgdGhlIG9ubHkgd2F5IEkKPiBmb3VuZCB0byBtYWtlIGl0
IG5vdCBjaGFuZ2UgdGhlIGluZGVudGF0aW9uIGlzIHRvIGFkZCB0aGUgY29tbWVudCAiLyoKPiAq
SU5ERU5ULU9GRiogKi8iIGJlZm9yZSB0aGUgYmxvY2sgYW5kICIvKiAqSU5ERU5ULU9OKiAqLyIg
YWZ0ZXJ3YXJkcy4KCk5vbmUgb2YgdGhlbSBsb29rcyByZWFsbHkgYXBwZWFsaW5nIGJlY2F1c2Ug
aXQgbWVhbnMgYXN0eWxlIHdpbGwgbm90IGNvcnJlY3RseSAKaW5kZW50IGlmIHRoZSB1c2VyIGRv
ZXMgbm90IGFkZCBicmFjZXMgb3IgY29tbWVudHMuCgpDb3VsZCBhc3R5bGUgYmUgZWFzaWx5IG1v
ZGlmaWVkIHRvIHJlY29nbml6ZSBmb3JlYWNoIG1hY3Jvcz8KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
