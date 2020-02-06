Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B740A1540A4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 09:48:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izcnI-0002ae-91; Thu, 06 Feb 2020 08:45:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izcnG-0002aZ-Nm
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 08:45:50 +0000
X-Inumbo-ID: 130d440e-48bd-11ea-8952-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 130d440e-48bd-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 08:45:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1F54AACBD;
 Thu,  6 Feb 2020 08:45:46 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <fe250b28cc42442c86fdb108e1702c45@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97420ba1-ecc1-8545-d36b-8d67d6ac226a@suse.com>
Date: Thu, 6 Feb 2020 09:45:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <fe250b28cc42442c86fdb108e1702c45@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 0/4] purge free_shared_domheap_page()
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAwOToyOCwgRHVycmFudCwgUGF1bCB3cm90ZToKPiBBRkFJQ1QgdGhlc2Ug
cGF0Y2hlcyBoYXZlIHRoZSBuZWNlc3NhcnkgQS1iL1ItYi1zLCBvciBhcmUgdGhlcmUgc29tZSBt
aXNzaW5nIHRoYXQgSSBuZWVkIHRvIGNoYXNlPwoKQWNjb3JkaW5nIHRvIG15IHJlY29yZHMgLi4u
Cgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBk
dXJyYW50QGFtYXpvbi5jb20+Cj4+IFNlbnQ6IDAzIEZlYnJ1YXJ5IDIwMjAgMTA6NTcKPj4KPj4g
UGF1bCBEdXJyYW50ICg0KToKPj4gICB4ODYgLyB2bXg6IG1vdmUgdGVhcmRvd24gZnJvbSBkb21h
aW5fZGVzdHJveSgpLi4uCj4+ICAgYWRkIGEgZG9tYWluX3RvdF9wYWdlcygpIGhlbHBlciBmdW5j
dGlvbgo+PiAgIG1tOiBtYWtlIHBhZ2VzIGFsbG9jYXRlZCB3aXRoIE1FTUZfbm9fcmVmY291bnQg
c2FmZSB0byBhc3NpZ24KPj4gICB4ODYgLyB2bXg6IHVzZSBhIE1FTUZfbm9fcmVmY291bnQgZG9t
aGVhcCBwYWdlIGZvcgo+PiAgICAgQVBJQ19ERUZBVUxUX1BIWVNfQkFTRQo+Pgo+PiAgeGVuL2Fy
Y2gvYXJtL2FybTY0L2RvbWN0bC5jICAgICB8ICAyICstCgouLi4gdGhpcyAoQXJtKSwgLi4uCgo+
PiAgeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgICB8ICAyICstCj4+ICB4ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYyAgICAgIHwgMjUgKysrKysrKystLS0KCi4uLiB0aGlzIChWTVgpLCAu
Li4KCj4+ICB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgIHwgMTUgKystLS0tLQo+PiAg
eGVuL2FyY2gveDg2L21tL3AybS1wb2QuYyAgICAgICB8IDEwICsrLS0tCgouLi4gdGhpcyAoTU0p
LCAuLi4KCj4+ICB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jIHwgIDIgKy0KCi4uLiB0
aGlzIChzaGFkb3cpLCAuLi4KCj4+ICB4ZW4vYXJjaC94ODYvbXNpLmMgICAgICAgICAgICAgIHwg
IDIgKy0KPj4gIHhlbi9hcmNoL3g4Ni9udW1hLmMgICAgICAgICAgICAgfCAgMiArLQo+PiAgeGVu
L2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyAgICB8IDI1ICsrKysrKy0tLS0tCj4+ICB4ZW4vYXJj
aC94ODYvcHYvZG9tYWluLmMgICAgICAgIHwgIDIgKy0KPj4gIHhlbi9hcmNoL3g4Ni9wdi9zaGlt
LmMgICAgICAgICAgfCAgNCArLQo+PiAgeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAgICAgICB8
ICAyICstCj4+ICB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgIHwgIDQgKy0KPj4gIHhl
bi9jb21tb24va2V5aGFuZGxlci5jICAgICAgICAgfCAgMiArLQo+PiAgeGVuL2NvbW1vbi9tZW1v
cnkuYyAgICAgICAgICAgICB8ICAyICstCj4+ICB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgICAg
ICAgIHwgNzggKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+ICB4ZW4vaW5jbHVk
ZS9hc20tYXJtL21tLmggICAgICAgIHwgIDUgKystCgouLi4gYW5kIHRoaXMgKEFybSBhZ2Fpbiku
IEkgdGhpbmsgYWxtb3N0IGFsbCBhcmUgZm9yIHBhdGNoIDIsIHdpdGgKYW4gQXJtIG9uZSBuZWVk
ZWQgb24gcGF0Y2ggMy4gSWYgSSBvdmVybG9va2VkIGFueSwgcGxlYXNlIHBvaW50IG1lCmF0IHRo
ZW0uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
