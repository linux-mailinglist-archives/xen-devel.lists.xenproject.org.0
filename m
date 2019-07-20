Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B436F019
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jul 2019 18:52:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hosXh-0002XZ-NZ; Sat, 20 Jul 2019 16:49:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+V0H=VR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hosXg-0002XU-3c
 for xen-devel@lists.xenproject.org; Sat, 20 Jul 2019 16:49:04 +0000
X-Inumbo-ID: 46c98afc-ab0e-11e9-9170-ffa73abe0a14
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 46c98afc-ab0e-11e9-9170-ffa73abe0a14;
 Sat, 20 Jul 2019 16:49:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 741A8337;
 Sat, 20 Jul 2019 09:49:01 -0700 (PDT)
Received: from [10.37.12.6] (unknown [10.37.12.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAA4A3F59C;
 Sat, 20 Jul 2019 09:48:57 -0700 (PDT)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <49a30043-1dd1-0069-1e3b-c593542f425c@arm.com>
Date: Sat, 20 Jul 2019 17:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpTb3JyeSBmb3IganVtcGluZyBsYXRlIGluIHRoZSBkaXNjdXNzaW9uLgoKT24gNy8xNy8x
OSAyOjAwIEFNLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi9pcnEuaCBiL3hlbi9pbmNsdWRlL3hlbi9pcnEuaAo+IGluZGV4
IDU4NmI3ODMuLmM3YTZhODMgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lycS5oCj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL2lycS5oCj4gQEAgLTkxLDYgKzkxLDcgQEAgdHlwZWRlZiBz
dHJ1Y3QgaXJxX2Rlc2Mgewo+ICAgICAgIHNwaW5sb2NrX3QgbG9jazsKPiAgICAgICBzdHJ1Y3Qg
YXJjaF9pcnFfZGVzYyBhcmNoOwo+ICAgICAgIGNwdW1hc2tfdmFyX3QgYWZmaW5pdHk7Cj4gKyAg
ICBkb21pZF90IGNyZWF0b3JfZG9taWQ7IC8qIHdlYWsgcmVmZXJlbmNlIHRvIGRvbWFpbiBoYW5k
bGluZyB0aGlzIElSUSAqLwoKVGhpcyB4ODYgb25seS4gQ2FuIHRoaXMgYmUgbW92ZWQgaW4gYXJj
aF9pcnFfZGVzYyB0byBhdm9pZCBpbmNyZWFzaW5nIAp0aGUgc3RydWN0dXJlIG9uIEFybT8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
