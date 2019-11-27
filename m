Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1310B384
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:37:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0Hi-0007oa-Fq; Wed, 27 Nov 2019 16:35:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ia0Hh-0007oP-01
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:35:21 +0000
X-Inumbo-ID: e6a41f48-1133-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6a41f48-1133-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 16:35:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 608F3AD6F;
 Wed, 27 Nov 2019 16:35:19 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
 <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
 <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
 <55667545-7298-e4ef-8022-ca3c05009719@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aac11d8f-7945-1126-e5f8-9cacaef69614@suse.com>
Date: Wed, 27 Nov 2019 17:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <55667545-7298-e4ef-8022-ca3c05009719@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMTc6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI3LjExLjIwMTkgMTc6
MjEsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDExLzI3LzE5IDQ6MTQgUE0sIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMjcuMTEuMjAxOSAxNzowMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3Rl
Ogo+Pj4+IExpdmUtcGF0Y2hpbmcgcmVxdWlyZXMgdW5pcXVlIHN5bWJvbHMsIGFuZCBzYWRseSB0
aGUgY2xhbmcgYnVpbGQKPj4+PiBnZW5lcmF0ZXMgYSBsb3Qgb2YgZHVwbGljYXRlIHN5bWJvbHM6
Cj4+Pj4KPj4+PiBEdXBsaWNhdGUgc3ltYm9sICdhc2lkLmMjZ2V0X2NwdV9pbmZvJyAoZmZmZjgy
ZDA4MDMwMzJjMCAhPSBmZmZmODJkMDgwMmUwZjUwKQo+Pj4+IER1cGxpY2F0ZSBzeW1ib2wgJ2Fz
aWQuYyNnZXRfY3B1X2luZm9fZnJvbV9zdGFjaycgKGZmZmY4MmQwODAyZTEwODAgIT0gZmZmZjgy
ZDA4MDMwMzJmMCkKPj4+PiBEdXBsaWNhdGUgc3ltYm9sICdhdHMuYyNfX2xpc3RfYWRkJyAoZmZm
ZjgyZDA4MDI2MGEwMCAhPSBmZmZmODJkMDgwMjY3YzcwKQo+Pj4+IER1cGxpY2F0ZSBzeW1ib2wg
J2Jvb3QuYyNjb25zdGFudF90ZXN0X2JpdCcgKGZmZmY4MmQwODA0MGVhNjAgIT0gZmZmZjgyZDA4
MDQzNzJmMCkKPj4+PiBEdXBsaWNhdGUgc3ltYm9sICdjb21tb24uYyNjbGVhcl9iaXQnIChmZmZm
ODJkMDgwMzMyNDQwICE9IGZmZmY4MmQwODAyZDMzYjApCj4+Pj4gRHVwbGljYXRlIHN5bWJvbCAn
Y29tbW9uLmMjY29uc3RhbnRfdGVzdF9iaXQnIChmZmZmODJkMDgwMzMyMzQwICE9IGZmZmY4MmQw
ODAyZDIyMjApCj4+Pj4gRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjY3B1bWFza19jaGVjaycg
KGZmZmY4MmQwODAyZDMzNzAgIT0gZmZmZjgyZDA4MDMzN2I2MCkKPj4+PiBEdXBsaWNhdGUgc3lt
Ym9sICdjb21tb24uYyNnZXRfY3B1X2luZm8nIChmZmZmODJkMDgwMmQyMmIwICE9IGZmZmY4MmQw
ODAzMzE1OTApCj4+Pj4gRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjZ2V0X2NwdV9pbmZvX2Zy
b21fc3RhY2snIChmZmZmODJkMDgwMmQzMWMwICE9IGZmZmY4MmQwODAzMzc0YjApCj4+Pj4gRHVw
bGljYXRlIHN5bWJvbCAnY29tbW9uLmMjcGZuX3RvX3BkeCcgKGZmZmY4MmQwODAyZDMyNzAgIT0g
ZmZmZjgyZDA4MDMzMWUwMCkKPj4+PiBEdXBsaWNhdGUgc3ltYm9sICdjb21tb24uYyN0ZXN0X2Fu
ZF9zZXRfYml0JyAoZmZmZjgyZDA4MDJkMzM2MCAhPSBmZmZmODJkMDgwMzMyMjUwKQo+Pj4+IER1
cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI3ZhcmlhYmxlX2NsZWFyX2JpdCcgKGZmZmY4MmQwODAy
ZDIyNzAgIT0gZmZmZjgyZDA4MDMzN2I1MCkKPj4+PiBEdXBsaWNhdGUgc3ltYm9sICdjb21wYXQu
YyNnZXRfY3B1X2luZm8nIChmZmZmODJkMDgwMjZlYWIwICE9IGZmZmY4MmQwODAyMDA0NjApCj4+
Pj4gRHVwbGljYXRlIHN5bWJvbCAnY29tcGF0LmMjZ2V0X2NwdV9pbmZvX2Zyb21fc3RhY2snIChm
ZmZmODJkMDgwMjZlYmQwICE9IGZmZmY4MmQwODAyMDBmNzApCj4+Pj4gRHVwbGljYXRlIHN5bWJv
bCAnY3B1X2lkbGUuYyNnZXRfY3B1X2luZm8nIChmZmZmODJkMDgwMmNjYjAwICE9IGZmZmY4MmQw
ODAzNWZjYzApCj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+IEZvciB0aGUgdGltZSBiZWluZyBkaXNhYmxl
IGxpdmUtcGF0Y2hpbmcgd2hlbiBidWlsZGluZyB3aXRoIGNsYW5nLAo+Pj4+IHNpbmNlIGR1cGxp
Y2F0ZSBzeW1ib2xzIHdpbGwgdHJpZ2dlciBhIGJ1aWxkIGZhaWx1cmUgYmVjYXVzZQo+Pj4+IEVO
Rk9SQ0VfVU5JUVVFX1NZTUJPTFMgaXMgbm93IGFsc28gZW5hYmxlZCBieSBkZWZhdWx0IGluIGNv
bmp1bmN0aW9uCj4+Pj4gd2l0aCBsaXZlLXBhdGNoaW5nLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Pgo+Pj4gVG8gYmUg
aG9uZXN0LCBhcyBpbmRpY2F0ZWQgYmVmb3JlIEknbSBpbmNsaW5lZCB0byBuYWsgdGhpcyBwYXRj
aAo+Pj4gb24gdGhlIGJhc2lzIHRoYXQgYSBwcm9wZXIgc29sdXRpb24gaGFzIGJlZW4gcG9zdGVk
IGFsbW9zdCAzIHdlZWtzCj4+PiBhZ28gKGFuZCB0aGlzIHdhcyBhbHJlYWR5IHYyKS4KPj4KPj4g
V2hhdCdzIHRoYXQgcGF0Y2ggd2FpdGluZyBvbj8KPiAKPiB4ODYgYW5kIHJlbGVhc2UgYWNrcy4K
CkkgcGxhbiB0byByZWxlYXNlIGFjayB0aGUgcGF0Y2ggaW4gY2FzZSB0aGUgbWlzc2luZyBtYWlu
dGFpbmVyJ3MgYWNrcwphcmUgbm90IGNvbWluZyBpbiB0b28gbGF0ZS4KCgpKdWVyZ2VuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
