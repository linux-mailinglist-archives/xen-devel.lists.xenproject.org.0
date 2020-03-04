Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0691A1792A6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:44:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9VEN-0006VD-Ah; Wed, 04 Mar 2020 14:42:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9VEL-0006V5-QK
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:42:37 +0000
X-Inumbo-ID: 63fed606-5e26-11ea-a3fb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63fed606-5e26-11ea-a3fb-12813bfff9fa;
 Wed, 04 Mar 2020 14:42:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5A13CACBD;
 Wed,  4 Mar 2020 14:42:36 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-15-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42459c8d-7912-297a-ea68-ea07e12b03c7@suse.com>
Date: Wed, 4 Mar 2020 15:42:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-15-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 14/23] xen/build: use new $(c_flags)
 and $(a_flags) instead of $(CFLAGS)
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL3Nj
cmlwdHMvS2J1aWxkLmluY2x1ZGUKPiArKysgYi94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQo+
IEBAIC0xMCw3ICsxMCw3IEBAIERFUFNfSU5DTFVERSA9ICQoYWRkc3VmZml4IC5kMiwgJChiYXNl
bmFtZSAkKHdpbGRjYXJkICQoREVQUykpKSkKPiAgIyBhcy1pbnNuOiBDaGVjayB3aGV0aGVyIGFz
c2VtYmxlciBzdXBwb3J0cyBhbiBpbnN0cnVjdGlvbi4KPiAgIyBVc2FnZTogY2ZsYWdzLXkgKz0g
JChjYWxsIGFzLWluc24sQ0MgRkxBR1MsImluc24iLG9wdGlvbi15ZXMsb3B0aW9uLW5vKQo+ICBh
cy1pbnNuID0gJChpZiAkKHNoZWxsIGVjaG8gJ3ZvaWQgXyh2b2lkKSB7IGFzbSB2b2xhdGlsZSAo
ICQoMikgKTsgfScgXAo+IC0gICAgICAgICAgICAgICAgICAgICAgIHwgJChmaWx0ZXItb3V0IC1N
JSAlLmQgLWluY2x1ZGUgJS9pbmNsdWRlL3hlbi9jb25maWcuaCwkKDEpKSBcCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgfCAkKGZpbHRlci1vdXQgLWluY2x1ZGUgJS9pbmNsdWRlL3hlbi9jb25m
aWcuaCwkKDEpKSBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1jIC14IGMgLW8g
L2Rldi9udWxsIC0gMj4mMSksJCg0KSwkKDMpKQoKSSdtIHNvcnJ5LCB3aGlsZSBpdCB3YXMgbWUg
dG8gc3VnZ2VzdCB0aGlzIGNoYW5nZSAtIGlzIHRoaXMKY29ycmVjdD8gVGhlIHZhcmlhYmxlIHRv
IG1vZGlmeSBpcyBhIHBhcmFtZXRlciBvZiB0aGlzIG1hY3JvLAppLmUuIHRoaW5ncyBhcmVuJ3Qg
bGltaXRlZCB0byBDRkxBR1MgaGVyZS4gSWYgd2Ugd2FudCB0bwpkaXNhbGxvdyB1c2Ugd2l0aCBl
LmcuIGNfZmxhZ3Mgb3IgYW55dGhpbmcgZGVyaXZlZCBmcm9tIGl0LAp0aGVuIHdlIHNob3VsZCBm
aW5kIHNvbWUgd2F5IHRvIGFjdHVhbGx5IGVuZm9yY2UgdGhpcyAobGlrZQpkcm9wcGluZyB0aGUg
cmVzcGVjdGl2ZSBwYXJhbWV0ZXI7IEknbSB1bmNlcnRhaW4gdGhvdWdoIHdoZXRoZXIKd2Ugd291
bGRuJ3QgcmVncmV0IHRoaXMgaWYgd2UgZXZlciBnb3QgdG8gdGhlIHBvaW50IHdoZXJlIHdlCndh
bnRlZCB0byB1c2UgYSBuZXdlciBpbnNuIGluIGEgLlMgZmlsZSkuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
