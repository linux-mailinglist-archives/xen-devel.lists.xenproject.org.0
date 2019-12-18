Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF48A1242D1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:18:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVRm-0004q4-Bv; Wed, 18 Dec 2019 09:16:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihVRl-0004py-9u
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:16:45 +0000
X-Inumbo-ID: 16bf2f58-2177-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16bf2f58-2177-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 09:16:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A0EFACC4;
 Wed, 18 Dec 2019 09:16:35 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-2-jgross@suse.com>
 <2ee2b27f31eeb85bff40bcfd588a6d45c7e80488.camel@suse.com>
 <7c867097-d289-34af-0e89-3413b0480912@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4d04f99d-5e4d-d16d-3570-4857bd9f379a@suse.com>
Date: Wed, 18 Dec 2019 10:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <7c867097-d289-34af-0e89-3413b0480912@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/9] xen/sched: move schedulers and cpupool
 coding to dedicated directory
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTA6MDgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTgvMTIvMjAxOSAw
ODo1OCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4+IE9uIFdlZCwgMjAxOS0xMi0xOCBhdCAwODo0
OCArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IE1vdmUgc2NoZWQqYyBhbmQgY3B1cG9v
bC5jIHRvIGEgbmV3IGRpcmVjdG9yeSBjb21tb24vc2NoZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pj4gLS0tCj4+PiAgIE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKy0tCj4+PiAg
IHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNjYg
Ky0tLS0tLS0tLS0tCj4+PiAtLS0tLS0tLS0tCj4+PiAgIHhlbi9jb21tb24vTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKy0tCj4+PiAgIHhlbi9jb21tb24vc2No
ZWQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNjUKPj4+ICsrKysrKysrKysr
KysrKysrKysrKwo+Pj4gICB4ZW4vY29tbW9uL3NjaGVkL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA3ICsrKwo+Pj4gICAuLi4ve2NvbXBhdC9zY2hlZHVsZS5jID0+IHNjaGVk
L2NvbXBhdF9zY2hlZHVsZS5jfSB8ICAyICstCj4+PiAgIHhlbi9jb21tb24veyA9PiBzY2hlZH0v
Y3B1cG9vbC5jICAgICAgICAgICAgICAgICAgIHwgIDAKPj4+ICAgeGVuL2NvbW1vbi97ID0+IHNj
aGVkfS9zY2hlZF9hcmluYzY1My5jICAgICAgICAgICAgfCAgMAo+Pj4gICB4ZW4vY29tbW9uL3sg
PT4gc2NoZWR9L3NjaGVkX2NyZWRpdC5jICAgICAgICAgICAgICB8ICAwCj4+PiAgIHhlbi9jb21t
b24veyA9PiBzY2hlZH0vc2NoZWRfY3JlZGl0Mi5jICAgICAgICAgICAgIHwgIDAKPj4+ICAgeGVu
L2NvbW1vbi97ID0+IHNjaGVkfS9zY2hlZF9udWxsLmMgICAgICAgICAgICAgICAgfCAgMAo+Pj4g
ICB4ZW4vY29tbW9uL3sgPT4gc2NoZWR9L3NjaGVkX3J0LmMgICAgICAgICAgICAgICAgICB8ICAw
Cj4+PiAgIHhlbi9jb21tb24veyA9PiBzY2hlZH0vc2NoZWR1bGUuYyAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPj4+ICAgMTMgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgNzggZGVs
ZXRpb25zKC0pCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL3NjaGVkL0tjb25m
aWcKPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9jb21tb24vc2NoZWQvTWFrZWZpbGUKPj4+
ICAgcmVuYW1lIHhlbi9jb21tb24ve2NvbXBhdC9zY2hlZHVsZS5jID0+IHNjaGVkL2NvbXBhdF9z
Y2hlZHVsZS5jfQo+Pj4gKDk3JSkKPj4+ICAgcmVuYW1lIHhlbi9jb21tb24veyA9PiBzY2hlZH0v
Y3B1cG9vbC5jICgxMDAlKQo+Pj4gICByZW5hbWUgeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9zY2hl
ZF9hcmluYzY1My5jICgxMDAlKQo+Pj4gICByZW5hbWUgeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9z
Y2hlZF9jcmVkaXQuYyAoMTAwJSkKPj4+ICAgcmVuYW1lIHhlbi9jb21tb24veyA9PiBzY2hlZH0v
c2NoZWRfY3JlZGl0Mi5jICgxMDAlKQo+Pj4gICByZW5hbWUgeGVuL2NvbW1vbi97ID0+IHNjaGVk
fS9zY2hlZF9udWxsLmMgKDEwMCUpCj4+PiAgIHJlbmFtZSB4ZW4vY29tbW9uL3sgPT4gc2NoZWR9
L3NjaGVkX3J0LmMgKDEwMCUpCj4+PiAgIHJlbmFtZSB4ZW4vY29tbW9uL3sgPT4gc2NoZWR9L3Nj
aGVkdWxlLmMgKDk5JSkKPj4+Cj4+IE1hdHRlciBvZiB0YXN0ZSwgSSBndWVzcywgYnV0IHdoYXQg
YWJvdXQgbm90IHJlcGVhdGluZyAnc2NoZWQnLCBpLmUuOgo+Pgo+PiB4ZW4vY29tbW9uL3NjaGVk
X2NyZWRpdC5jICAtLT4geGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQuYwo+PiB4ZW4vY29tbW9uL3Nj
aGVkX2NyZWRpdDIuYyAtLT4geGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMKPj4geGVuL2NvbW1v
bi9zY2hlZF9udWxsLmMgICAgLS0+IHhlbi9jb21tb24vc2NoZWQvbnVsbC5jCj4+IC4uLgo+Pgo+
PiBzY2hlZHVsZS5jIGNhbiBiZSBjYWxsZWQgc29tZXRoaW5nIGxpa2UgJ2NvcmUuYycsCj4gCj4g
KzEgRldJVywgYW5kIGNvbXBhdF9zY2hlZHVsZS5jIGNhbiBqdXN0IGJlY29tZSBjb21wYXQuYwoK
WWVzLCBpbmRlZWQuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
