Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5804E42C5F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 18:33:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb68J-00026v-7J; Wed, 12 Jun 2019 16:29:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb68I-00026q-E2
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 16:29:54 +0000
X-Inumbo-ID: 4d8e0392-8d2f-11e9-948d-5fd457b090d6
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4d8e0392-8d2f-11e9-948d-5fd457b090d6;
 Wed, 12 Jun 2019 16:29:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 637542B;
 Wed, 12 Jun 2019 09:29:51 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BCB33F73C;
 Wed, 12 Jun 2019 09:29:49 -0700 (PDT)
To: Razvan Cojocaru <rcojocaru@bitdefender.com>,
 xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>
References: <1560355333-21065-1-git-send-email-rcojocaru@bitdefender.com>
 <39fa32ee-378e-0bbf-1c21-c1dbd5ecb58b@bitdefender.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c551a377-43e7-619d-90cb-c5695de52497@arm.com>
Date: Wed, 12 Jun 2019 17:29:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <39fa32ee-378e-0bbf-1c21-c1dbd5ecb58b@bitdefender.com>
Content-Language: en-US
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
 ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8wNi8yMDE5IDE3OjA4LCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gT24gNi8xMi8x
OSA3OjAyIFBNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IFJlbW92ZSBteXNlbGYgYXMgdm1f
ZXZlbnQgbWFpbnRhbmVyLCBhZGQgQWxleGFuZHJ1IGFuZCBQZXRyZSBhcwo+PiBCaXRkZWZlbmRl
ciB2bV9ldmVudCBtYWludGFpbmVycy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+PiAtLS0KPj4gwqAgTUFJTlRBSU5FUlMg
fCAzICsrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4+IGluZGV4
IDZmYmRjMmIuLmQ2MGUzYTUgMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01B
SU5UQUlORVJTCj4+IEBAIC00MDUsNyArNDA1LDggQEAgTDrCoMKgwqAgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4+IMKgIEY6wqDCoMKgIHVubW9kaWZpZWRfZHJpdmVycy9saW51eC0y
LjYvCj4+IMKgIFZNIEVWRU5ULCBNRU0gQUNDRVNTIGFuZCBNT05JVE9SCj4+IC1NOsKgwqDCoCBS
YXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4+ICtNOsKgwqDCoCBB
bGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPj4gK006wqDCoMKgIFBl
dHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+Cj4+IMKgIE06wqDCoMKg
IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPj4gwqAgUzrCoMKgwqAgU3Vw
cG9ydGVkCj4+IMKgIEY6wqDCoMKgIHRvb2xzL3Rlc3RzL3hlbi1hY2Nlc3MKPj4KPiAKPiBJJ20g
bm90IHN1cmUgd2h5IGdldC1tYWludGFpbmVycy5wbCBkaWQgbm90IGFkZCBUYW1hcycgZW1haWwg
YWRkcmVzcyAoYWRkZWQgbm93KS4KCmdldC1tYWludGFpbmVyLnBsIG9ubHkgbG9vayBmb3IgdGhl
IG1haW50YWluZXJzIG9mIHRoZSBmaWxlIHlvdSBtb2RpZnkuIEZvciAKTUFJTlRBSU5FUlMsIHRo
aXMgd291bGQgZmFsbCB1bmRlciAiVEhFIFJFU1QiLgoKQXMgTUFJTlRBSU5FUlMgaXMgYSBiaXQg
dGhlIG9kZCBvbmUsIHlvdSBoYXZlIHRvIGFkZCBtYW51YWxseSB0aGUgbWFpbnRhaW5lcnMgb2Yg
CnRoZSBzdWJzeXN0ZW0geW91IG1vZGlmeS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
