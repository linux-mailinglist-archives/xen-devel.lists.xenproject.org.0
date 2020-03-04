Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6C1792EE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 16:03:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9VW4-0008M0-FM; Wed, 04 Mar 2020 15:00:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9VW3-0008Lv-1S
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:00:55 +0000
X-Inumbo-ID: f1b8fca4-5e28-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1b8fca4-5e28-11ea-8eb5-bc764e2007e4;
 Wed, 04 Mar 2020 15:00:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEE7AB071;
 Wed,  4 Mar 2020 15:00:52 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-16-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd7bf903-6f51-7610-3963-2b572a6bde49@suse.com>
Date: Wed, 4 Mar 2020 16:00:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-16-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 15/23] xen/build: have the root
 Makefile generates the CFLAGS
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gQEAgLTExMyw2ICsx
MTUsNjQgQEAgJChLQ09ORklHX0NPTkZJRyk6Cj4gIGluY2x1ZGUvY29uZmlnLyUuY29uZiBpbmNs
dWRlL2NvbmZpZy8lLmNvbmYuY21kOiAkKEtDT05GSUdfQ09ORklHKQo+ICAJJChNQUtFKSAtZiAk
KEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JD
QVJDSD0kKFNSQ0FSQ0gpIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiBz
eW5jY29uZmlnCj4gIAo+ICtpZmVxICgkKENPTkZJR19ERUJVRykseSkKPiArQ0ZMQUdTICs9IC1P
MQo+ICtlbHNlCj4gK0NGTEFHUyArPSAtTzIKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQ09ORklH
X0ZSQU1FX1BPSU5URVIpLHkpCj4gK0NGTEFHUyArPSAtZm5vLW9taXQtZnJhbWUtcG9pbnRlcgo+
ICtlbHNlCj4gK0NGTEFHUyArPSAtZm9taXQtZnJhbWUtcG9pbnRlcgo+ICtlbmRpZgo+ICsKPiAr
Q0ZMQUdTICs9IC1ub3N0ZGluYyAtZm5vLWJ1aWx0aW4gLWZuby1jb21tb24KPiArQ0ZMQUdTICs9
IC1XZXJyb3IgLVdyZWR1bmRhbnQtZGVjbHMgLVduby1wb2ludGVyLWFyaXRoCj4gKyQoY2FsbCBj
Yy1vcHRpb24tYWRkLENGTEFHUyxDQywtV3ZsYSkKPiArQ0ZMQUdTICs9IC1waXBlIC1EX19YRU5f
XyAtaW5jbHVkZSAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2NvbmZpZy5oCj4gK0NGTEFHUy0kKENP
TkZJR19ERUJVR19JTkZPKSArPSAtZwo+ICsKPiAraWZuZXEgKCQoQ09ORklHX0NDX0lTX0NMQU5H
KSx5KQo+ICsjIENsYW5nIGRvZXNuJ3QgdW5kZXJzdGFuZCB0aGlzIGNvbW1hbmQgbGluZSBhcmd1
bWVudCwgYW5kIGRvZXNuJ3QgYXBwZWFyIHRvCj4gKyMgaGF2ZSBhbiBzdWl0YWJsZSBhbHRlcm5h
dGl2ZS4gIFRoZSByZXN1bHRpbmcgY29tcGlsZWQgYmluYXJ5IGRvZXMgZnVuY3Rpb24sCj4gKyMg
YnV0IGhhcyBhbiBleGNlc3NpdmVseSBsYXJnZSBzeW1ib2wgdGFibGUuCj4gK0NGTEFHUyArPSAt
V2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0ZQo+ICtlbmRpZgo+ICsKPiArQUZMQUdTICs9IC1EX19B
U1NFTUJMWV9fCj4gKwo+ICtDRkxBR1MgKz0gJChDRkxBR1MteSkKCkkgY2FuJ3Qgc2VlbSB0byBi
ZSBhYmxlIHRvIHNwb3QgYSBzaW1pbGFyIGxpbmUgZm9yIEFGTEFHUy4KCj4gQEAgLTEwNyw3ICs2
NSw3IEBAICQoZm9yZWFjaCBvLCQoZmlsdGVyLW91dCAlLywkKG9iai15KSAkKG9iai1iaW4teSkg
JChleHRyYS15KSksJChldmFsICQoY2FsbCBnZW5kCj4gIHN1YmRpci15IDo9ICQoc3ViZGlyLXkp
ICQoZmlsdGVyICUvLCAkKG9iai15KSkKPiAgb2JqLXkgICAgOj0gJChwYXRzdWJzdCAlLywgJS9i
dWlsdF9pbi5vLCAkKG9iai15KSkKPiAgCj4gLSQoZmlsdGVyICUuaW5pdC5vLCQob2JqLXkpICQo
b2JqLWJpbi15KSAkKGV4dHJhLXkpKTogQ0ZMQUdTICs9IC1ESU5JVF9TRUNUSU9OU19PTkxZCj4g
KyQoZmlsdGVyICUuaW5pdC5vLCQob2JqLXkpICQob2JqLWJpbi15KSAkKGV4dHJhLXkpKTogQ0ZM
QUdTLXkgKz0gLURJTklUX1NFQ1RJT05TX09OTFkKCldoaWxlIGluIHRoZSBkZXNjcmlwdGlvbiB5
b3Ugc2F5ICJXZSBjYW4ndCB1c2UgQ0ZMQUdTIGluCnN1YmRpcmVjdG9yaWVzIHRvIGFkZCBmbGFn
cyB0byBwYXJ0aWN1bGFyIHRhcmdldHMsIC4uLiIsIGl0CnJlbWFpbnMgdW5jbGVhciB0aGVyZSB3
aHkgdGhhdCBpcywgYW5kIGhlbmNlIHdoeSBjaGFuZ2VzIGxpa2UKdGhpcyBvbmUgYXJlIG5lY2Vz
c2FyeS4gSWYgdGhpcyBpcyBhIHJlc3RyaWN0aW9uIHRoYXQncyBnb2luZyB0bwpyZW1haW4sIHRo
aXMgYWxzbyBuZWVkcyB3cml0aW5nIGRvd24gaW4gYSBwcm9taW5lbnQgcGxhY2UuIEFmdGVyCmFs
bCBpZiAoZm9yIGV4YW1wbGUpIHNwZWNpYWwgY29tcGlsZXIgb3B0aW9ucyBhcmUgbmVlZGVkLCBD
RkxBR1MKd291bGQgYmUgdGhlIG5hdHVyYWwgdGhpbmcgb25lIHdvdWxkIHdhbnQgdG8gYWx0ZXIu
IChFdmVuIGJldHRlcgppZiB3cm9uZyBwbGF5aW5nIHdpdGggQ0ZMQUdTIGNvdWxkIGJlIGRldGVj
dGVkIGFuZCBhdCBsZWFzdAp3YXJuZWQgYWJvdXQsIGJ1dCBJJ20gY29tcGxldGVseSB1bmNsZWFy
IG9uIGhvdyBmZWFzaWJsZSB0aGlzCndvdWxkIGJlLikKCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9SdWxlcy5tayBiL3hlbi9hcmNoL2FybS9SdWxlcy5tawo+IGluZGV4IDAyMmEzYTZmODJi
YS4uZTY5ZGUyOWJiMmQxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9SdWxlcy5tawo+ICsr
KyBiL3hlbi9hcmNoL2FybS9SdWxlcy5tawo+IEBAIC0xLDkzICswLDAgQEAKCkFzIHBlciB0aGUg
aGVhZGVyIGhlcmUgeW91J3JlIHVzaW5nIGdpdC4gQ2FuIHlvdSBwbGVhc2UgYXJyYW5nZSBmb3IK
dGhpcyBmaWxlIG1vdmVtZW50ICh0byBhcmNoLm1rLCBhbmQgYWxzbyBmb3IgeDg2KSB0byBhY3R1
YWxseSBiZQpleHByZXNzZWQgaGVyZSBhcyBhIHJlbmFtZSwgaS5lLiBzdWNoIHRoYXQgb25lIGNh
biBzZWUgd2hhdCAtIGlmCmFueXRoaW5nIC0gY2hhbmdlcz8KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
