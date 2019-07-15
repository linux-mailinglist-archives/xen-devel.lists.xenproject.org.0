Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F628699AF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 19:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn4hB-0002Vt-2R; Mon, 15 Jul 2019 17:23:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q8SM=VM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hn4h9-0002Vo-GS
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 17:23:23 +0000
X-Inumbo-ID: 3ec09952-a725-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3ec09952-a725-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 17:23:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D36442B;
 Mon, 15 Jul 2019 10:23:21 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C5013F59C;
 Mon, 15 Jul 2019 10:23:19 -0700 (PDT)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190715091756.39065-1-paul.durrant@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <74633a8c-f81d-a9fd-6761-afe46e635fb2@arm.com>
Date: Mon, 15 Jul 2019 18:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190715091756.39065-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS8wNy8yMDE5IDEwOjE3LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gVGhlIF9QR0Nf
YWxsb2NhdGVkIGZsYWcgaXMgc2V0IG9uIGEgcGFnZSB3aGVuIGl0IGlzIGFzc2lnbmVkIHRvIGEg
ZG9tYWluCj4gYWxvbmcgd2l0aCBhbiBpbml0aWFsIHJlZmVyZW5jZSBjb3VudCBvZiBhdCBsZWFz
dCAxLiBUbyBjbGVhciB0aGlzCj4gJ2FsbG9jYXRpb24nIHJlZmVyZW5jZSBpdCBpcyBuZWNlc3Nh
cnkgdG8gdGVzdC1hbmQtY2xlYXIgX1BHQ19hbGxvY2F0ZWQgYW5kCj4gdGhlbiBvbmx5IGRyb3Ag
dGhlIHJlZmVyZW5jZSBpZiB0aGUgdGVzdC1hbmQtY2xlYXIgc3VjY2VlZHMuIFRoaXMgaXMgb3Bl
bi0KPiBjb2RlZCBpbiBtYW55IHBsYWNlcy4gSXQgaXMgYWxzbyB1bnNhZmUgdG8gdGVzdC1hbmQt
Y2xlYXIgX1BHQ19hbGxvY2F0ZWQKPiB1bmxlc3MgdGhlIGNhbGxlciBob2xkcyBhbiBhZGRpdGlv
bmFsIHJlZmVyZW5jZS4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSBoZWxwZXIgZnVuY3Rpb24sIHB1
dF9wYWdlX2FsbG9jX3JlZigpLCB0byByZXBsYWNlIGFsbCB0aGUKPiBvcGVuLWNvZGVkIHRlc3Qt
YW5kLWNsZWFyL3B1dF9wYWdlIG9jY3VycmVuY2VzIGFuZCBpbmNvcnBvcmF0ZXMgaW4gdGhhdCBh
Cj4gQlVHX09OKCkgYW4gYWRkaXRpb25hbCBwYWdlIHJlZmVyZW5jZSBub3QgYmVpbmcgaGVsZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
PgoKRm9yIHRoZSBBcm0gYml0czoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
