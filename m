Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A23AAEA1F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:19:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7f5C-0000yr-E5; Tue, 10 Sep 2019 12:17:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7f5A-0000yk-VO
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:17:17 +0000
X-Inumbo-ID: ecfe04d2-d3c4-11e9-ac1d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecfe04d2-d3c4-11e9-ac1d-12813bfff9fa;
 Tue, 10 Sep 2019 12:17:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D5EEEB701;
 Tue, 10 Sep 2019 12:17:14 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
 <20190910120207.10358-4-ian.jackson@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60334e88-15ba-40fc-8199-ebc555a91623@suse.com>
Date: Tue, 10 Sep 2019 14:17:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190910120207.10358-4-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 03/12] tools/ocaml: Introduce xenctrl ABI
 build-time checks
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, DavidScott <dave@recoil.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMjAxOSAxNDowMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gYy9zIGYwODlmZGRkOTQx
IGJyb2tlIHRoZSBPY2FtbCBBQkkgYnkgcmVudW1lcmluZwo+IFhFTl9TWVNDVExfUEhZU0NBUF9k
aXJlY3RpbyB3aXRob3V0IGFkanVzdGluZyB0aGUgT2NhbWwKPiBwaHlzaW5mb19jYXBfZmxhZyBl
bnVtZXJhdGlvbi4KPiAKPiBBZGQgYnVpbGQgbWFjaGluZXJ5IHdoaWNoIHdpbGwgY2hlY2sgdGhl
IEFCSSBjb3JyZXNwb25kZW5jZS4KPiAKPiBUaGlzIHdpbGwgcmVzdWx0IGluIGEgY29tcGlsZSB0
aW1lIGZhaWx1cmUgd2hlbmV2ZXIgY29uc3RhbnRzIGdldAo+IHJlbnVtYmVyZWQvYWRkZWQgd2l0
aG91dCBhIGNvbXBhdGlibGUgYWRqdXN0bWVudCB0byB0aGUgT2NhbWwgQUJJLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQWNr
ZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KCkp1
c3QgaW4gY2FzZSB5b3Ugd2FudCBhbiBleHRyYSBhY2sgZm9yIHRoZSB0aW55IHN5c2N0bC5oIGFk
ZGl0aW9uOgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKPiAtLS0g
YS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
c3lzY3RsLmgKPiBAQCAtOTAsNiArOTAsMTAgQEAgc3RydWN0IHhlbl9zeXNjdGxfdGJ1Zl9vcCB7
Cj4gICAvKiBUaGUgcGxhdGZvcm0gc3VwcG9ydHMgZGlyZWN0IGFjY2VzcyB0byBJL08gZGV2aWNl
cyB3aXRoIElPTU1VLiAqLwo+ICAjZGVmaW5lIF9YRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8g
ICAgIDIKPiAgI2RlZmluZSBYRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8gICgxdTw8X1hFTl9T
WVNDVExfUEhZU0NBUF9kaXJlY3RpbykKPiArCj4gKy8qIE1heCBYRU5fU1lTQ1RMX1BIWVNDQVBf
KiBjb25zdGFudC4gIFVzZWQgZm9yIEFCSSBjaGVja2luZy4gKi8KPiArI2RlZmluZSBYRU5fU1lT
Q1RMX1BIWVNDQVBfTUFYIFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbwoKSSBkb24ndCBwYXJ0
aWN1bGFybHkgbGlrZSBzdWNoICJtYXgiIHZhbHVlcyBwdXQgaW4gKHB1YmxpYykgaGVhZGVycwoo
YXMgdGhleSByZXF1aXJlIGNvbnN0YW50IHVwZGF0aW5nKSwgYnV0IEkgY2FuJ3Qgc2VlIGEgZ29v
ZAphbHRlcm5hdGl2ZSBlaXRoZXIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
