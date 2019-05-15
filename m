Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14081FB52
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 22:02:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hR02Z-000229-DH; Wed, 15 May 2019 19:58:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E9wX=TP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hR02Y-000224-0B
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 19:58:14 +0000
X-Inumbo-ID: c5008173-774b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c5008173-774b-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 19:58:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B38A374;
 Wed, 15 May 2019 12:58:12 -0700 (PDT)
Received: from [10.37.12.96] (unknown [10.37.12.96])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E05213F5AF;
 Wed, 15 May 2019 12:58:10 -0700 (PDT)
To: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3c245c5b-51c6-1d0e-ad6c-42414573166f@arm.com>
Date: Wed, 15 May 2019 20:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] struct vcpu_guest_core_reg stable ABI?
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKSXQgbG9va3MgbGlrZSB0aGUgc3RydWN0dXJlcyB2Y3B1X2d1ZXN0X2NvcmVfcmVn
cyBhbmQgdmNwdV9ndWVzdF9jb250ZXh0IApkb2VzIG5vdCBjb3JyZWN0bHkgcmVmbGVjdCB0aGUg
QUFyY2g2NCBzdGF0ZS4gRm9yIGluc3RhbmNlLCBhbGwgQXJtNjQgCnN5c3RlbSByZWdpc3RlcnMg
KGUuZyBzY3RsciwgY3Bzciwgc3Bzcl9lbDEpIHNob3VsZCBiZSA2NC1iaXQgd2lkZSBub3QgCjMy
LWJpdCB3aWRlLgoKT24gQVJNdjguMCwgc29tZSBvZiB0aGUgcmVnaXN0ZXJzIGhhdmUgb25seSB0
aGUgbG93IDMyLWJpdCBkZWZpbmVkLCB0aGUgCnJlc3QgaXMgUkVTMC4gUkVTMCBvbmx5IG1lYW5z
IHRoZXkgYXJlIHJlc2VydmVkIGZvciBmdXR1cmUgdXNlLCBpdCBkb2VzIApub3QgbWVhbiB0aGV5
IGNhbiBiZSBpZ25vcmVkLiBOZXdlciByZXZpc2lvbiAoc3VjaCBhcyBBUk12OC4wLVNTQlMpIAph
Y3R1YWxseSBiZWdhbiB0byBkZWZpbmUgYml0IGluIHRoZSB0b3AgMzItYml0LgoKVGhpcyBtZWFu
cyB0aGF0IHRoZSBzdHJ1Y3R1cmVzIHZjcHVfZ3Vlc3RfY29yZV9yZWdzIGFuZCAKdmNwdV9ndWVz
dF9jb250ZXh0IHdvdWxkIG5vdCBiZSBhYmxlIHRvIHN0b3JlIHRoZSB0b3AgMzItYml0IGFuZCAK
dGhlcmVmb3JlIG1pc3JlcHJlc2VudGluZyB0aGUgaGFyZHdhcmUuCgogRnJvbSBteSB1bmRlcnN0
YW5kaW5nLCB2Y3B1X2d1ZXN0X2NvbnRleHQgaXMgZGVmaW5lZCBiZXR3ZWVuIHRoZSB0b29scyAK
YW5kIFhlbi4gU28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gbW9kaWZ5IGl0IHdpdGhvdXQgY2Fy
aW5nIG9uIGJhY2t3YXJkIApjb21wYXRpYmx5LgoKSG93ZXJ2ZXIsIHN0cnVjdCB2Y3B1X2d1ZXN0
X2NvcmVfcmVnIHNlZW1zIHRvIGJlIG91dHNpZGUgb2YgdGhlICNpZmRlZi4gClNvIEkgYXNzdW1l
IGl0IGlzIHBhcnQgb2YgdGhlIHN0YWJsZSBBQkkuIEFtIEkgY29ycmVjdD8KCkRvIHlvdSBoYXZl
IGFueSBzdWdnZXN0aW9uIGhvdyB0aGlzIGNvdWxkIHNhZmVseSBiZSBleHRlbmRlZD8KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
