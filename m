Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7990242BD3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 18:11:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb5nh-0008WP-6c; Wed, 12 Jun 2019 16:08:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kbPO=UL=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hb5nf-0008WH-Jh
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 16:08:35 +0000
X-Inumbo-ID: 53a6d504-8d2c-11e9-90bd-2fdd2ee1f536
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53a6d504-8d2c-11e9-90bd-2fdd2ee1f536;
 Wed, 12 Jun 2019 16:08:34 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 CCBA9305FFA1; Wed, 12 Jun 2019 19:08:32 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B1EA9306E477;
 Wed, 12 Jun 2019 19:08:32 +0300 (EEST)
To: xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>
References: <1560355333-21065-1-git-send-email-rcojocaru@bitdefender.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <39fa32ee-378e-0bbf-1c21-c1dbd5ecb58b@bitdefender.com>
Date: Wed, 12 Jun 2019 19:08:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560355333-21065-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: hand over vm_event
 maintainership
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
Cc: sstabellini@kernel.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com,
 jbeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xMi8xOSA3OjAyIFBNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gUmVtb3ZlIG15c2Vs
ZiBhcyB2bV9ldmVudCBtYWludGFuZXIsIGFkZCBBbGV4YW5kcnUgYW5kIFBldHJlIGFzCj4gQml0
ZGVmZW5kZXIgdm1fZXZlbnQgbWFpbnRhaW5lcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmF6dmFu
IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IC0tLQo+ICAgTUFJTlRBSU5F
UlMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXgg
NmZiZGMyYi4uZDYwZTNhNSAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5U
QUlORVJTCj4gQEAgLTQwNSw3ICs0MDUsOCBAQCBMOgl4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKPiAgIEY6CXVubW9kaWZpZWRfZHJpdmVycy9saW51eC0yLjYvCj4gICAKPiAgIFZNIEVW
RU5ULCBNRU0gQUNDRVNTIGFuZCBNT05JVE9SCj4gLU06CVJhenZhbiBDb2pvY2FydSA8cmNvam9j
YXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiArTToJQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRk
ZWZlbmRlci5jb20+Cj4gK006CVBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRl
ci5jb20+Cj4gICBNOglUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gICBT
OglTdXBwb3J0ZWQKPiAgIEY6CXRvb2xzL3Rlc3RzL3hlbi1hY2Nlc3MKPiAKCkknbSBub3Qgc3Vy
ZSB3aHkgZ2V0LW1haW50YWluZXJzLnBsIGRpZCBub3QgYWRkIFRhbWFzJyBlbWFpbCBhZGRyZXNz
IAooYWRkZWQgbm93KS4KCkknbGwgc3RpbGwgYmUgaW4gQml0ZGVmZW5kZXIsIHN1YnNjcmliZWQg
dG8geGVuLWRldmVsIGFuZCBmb2xsb3dpbmcgdGhlIApwcm9qZWN0LCBidXQgSSdsbCBiZSBxdWl0
ZSBhIGJpdCBtb3JlIGludm9sdmVkIGluIG90aGVyIHByb2plY3RzIGFuZCAKdGhhdCBtYWtlcyBi
ZWluZyBhIG1haW50YWluZXIgZGlmZmljdWx0LgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
