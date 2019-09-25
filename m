Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F4DBDE35
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:42:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6ZU-0004t7-VA; Wed, 25 Sep 2019 12:39:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD6ZT-0004t2-CP
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:39:03 +0000
X-Inumbo-ID: 73bc7288-df91-11e9-9630-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 73bc7288-df91-11e9-9630-12813bfff9fa;
 Wed, 25 Sep 2019 12:39:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3FC3DAD85;
 Wed, 25 Sep 2019 12:39:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190905194909.6811-1-andrew.cooper3@citrix.com>
 <0d059668-7e2d-e5ca-4946-7024ec680bb8@suse.com>
 <8b7e7d18-cdec-dbd1-e11f-7058b2646b5a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d10717d-1f63-5fef-d199-32189f2528f6@suse.com>
Date: Wed, 25 Sep 2019 14:39:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8b7e7d18-cdec-dbd1-e11f-7058b2646b5a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpuid: Extend the cpuid= option to
 support all named features
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNDozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNS8wOS8yMDE5
IDEzOjMwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMDkuMjAxOSAyMTo0OSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEZvciBnZW4tY3B1aWQucHksIGZpeCBhIGNvbW1lbnQgZGVzY3Jp
YmluZyBzZWxmLm5hbWVzLCBhbmQgZ2VuZXJhdGUgdGhlCj4+PiByZXZlcnNlIG1hcHBpbmcgaW4g
c2VsZi52YWx1ZXMuICBXcml0ZSBvdXQgSU5JVF9GRUFUVVJFX05BTUVTIHdoaWNoIG1hcHMgYQo+
Pj4gc3RyaW5nIG5hbWUgdG8gYSBiaXQgcG9zaXRpb24uCj4+Pgo+Pj4gRm9yIHBhcnNlX2NwdWlk
KCksIHVzZSBjbWRsaW5lX3N0cmNtcCgpIGFuZCBwZXJmb3JtIGEgYmluYXJ5IHNlYXJjaCBvdmVy
Cj4+PiBJTklUX0ZFQVRVUkVfTkFNRVMuICBBIHR3ZWFrIHRvIGNtZGxpbmVfc3RyY21wKCkgaXMg
bmVlZGVkIHRvIGJyZWFrIGF0IGVxdWFscwo+Pj4gc2lnbnMgYXMgd2VsbC4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4g
LS0tCj4+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+Pj4gQ0M6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+Cj4+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4+Pgo+Pj4gdjI6Cj4+PiAgKiBSZWJhc2Ugb3ZlciBjbWRsaW5lX3N0cmNtcCgpCj4+
PiAtLS0KPj4+ICB4ZW4vYXJjaC94ODYvY3B1aWQuYyAgIHwgNzUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICB4ZW4vY29tbW9uL2tlcm5lbC5j
ICAgIHwgIDYgKystLQo+Pj4gIHhlbi9pbmNsdWRlL3hlbi9saWIuaCAgfCAgNCArLS0KPj4+ICB4
ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5IHwgMjIgKysrKysrKysrKysrKy0tCj4+PiAgNCBmaWxlcyBj
aGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKPj4gSSd2ZSBub3RpY2Vk
IHRoaXMgb25seSBub3c6IFRoaXMgY2hhbmdlIHdvdWxkIGhhdmUgd2FudGVkIHRvIGJlCj4+IGFj
Y29tcGFuaWVkIGJ5IGFuIGFkanVzdG1lbnQgdG8gdGhlIGNvbW1hbmQgbGluZSBkb2MuCj4gCj4g
SSBkZWJhdGVkIHRoYXQsIGJ1dCBJIGRvbid0IHdhbnQgdG8gZ2l2ZSBwZW9wbGUgdGhlIGlkZWEg
dGhhdCB1c2luZwo+IGNwdWlkPW5vLWxtIG1pZ2h0IGJlIGEgc2Vuc2libGUgdGhpbmcgdG8gZG8u
CgpXZWxsLCB0aGlzIGlzIGEgcGFydGljdWxhcmx5IGJhZCBleGFtcGxlLiBUaGVyZSBhcmUgc3Vy
ZWx5IG1vcmUKc2Vuc2libGUgZm9ybXMgb2YgdGhpcyBvcHRpb24gbm93IHdoaWNoIHdlcmVuJ3Qg
cHJldmlvdXNseQpzdXBwb3J0ZWQsIGFuZCB3aGljaCBhcmVuJ3QgbWVudGlvbmVkIGJ5IHRoZSBl
eGlzdGluZyBkb2MgdGV4dC4KVGhlIGV4YW1wbGUgeW91IGdpdmUgc3VnZ2VzdHMgdGhhdCB3ZSBh
bHNvIHdhbnQgdG8gaGF2ZSBhCiJtaW5pbWFsIiBwb2xpY3ksIGRpc2FibGluZyBvZiBlbGVtZW50
cyBvZiB3aGljaCB3ZSBzaG91bGQKcmVqZWN0IHdoZW4gZ2l2ZW4gdG8gImNwdWlkPSIuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
