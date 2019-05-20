Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610C2316B
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:36:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfbr-0001lo-Jn; Mon, 20 May 2019 10:33:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSfbq-0001lj-61
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:33:34 +0000
X-Inumbo-ID: b71e44b9-7aea-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b71e44b9-7aea-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 10:33:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A01D374;
 Mon, 20 May 2019 03:33:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51E3D3F5AF;
 Mon, 20 May 2019 03:33:30 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190516132016.8032-1-viktor.mitin.19@gmail.com>
 <37a3a6c6-7de4-e496-5619-00f31e8e338f@arm.com>
 <20190517064745.GA14853@localhost>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9bc2b400-c65d-3761-869d-4cad2d8959c4@arm.com>
Date: Mon, 20 May 2019 11:33:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517064745.GA14853@localhost>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] coverage: filter out libfdt.o and
 libelf.o
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNy8wNS8yMDE5IDA3OjQ3LCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4gT24gVGh1LCBNYXkg
MTYsIDIwMTkgYXQgMDY6NDA6MTRQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+PiBO
byBuZWVkIHRvIHJlc2VuZCB0aGUgcGF0Y2gsIEkgY2FuIGRvIHRoZSBtb2RpZmljYXRpb24gd2hl
biBJIHdpbGwgY29tbWl0IHRoZSBwYXRjaC4KPj4KPiAKPiBIaSBKdWxpZW4sCgpIaSwKCj4gCj4g
VGhhbmsgeW91IGZvciBkZXRhaWxlZCBkZXNjcmlwdGlvbiBwcm92aWRlZC4KPiBXaWxsIHRha2Ug
aW50byBjb25zaWRlcmF0aW9uIGFsbCB0aGUgbm90ZXMuCgpEb2VzIGl0IG1lYW4geW91IGFyZSBo
YXBweSB3aXRoIHRoZSBjb21taXQgbWVzc2FnZSBJIHN1Z2dlc3RlZD8KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
