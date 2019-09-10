Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0BEAEE8B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:33:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7i7M-0004T1-1g; Tue, 10 Sep 2019 15:31:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7i7K-0004Sw-FZ
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:31:42 +0000
X-Inumbo-ID: 15759de3-d3e0-11e9-ac1f-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 15759de3-d3e0-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 15:31:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A0691000;
 Tue, 10 Sep 2019 08:31:40 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 598FF3F71F;
 Tue, 10 Sep 2019 08:31:38 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
 <c3c41841ac809b600241b41400f18e12971aad8f.1567596460.git-series.lars.kurth@citrix.com>
 <2db8eb91-9ac2-8db5-cf98-2f7ef60ac0da@arm.com>
Message-ID: <9dc5a111-93e0-43fe-fa13-4b225fd5fe1d@arm.com>
Date: Tue, 10 Sep 2019 16:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2db8eb91-9ac2-8db5-cf98-2f7ef60ac0da@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] Add V section entry to allow
 identification of Xen MAINTAINERS file
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
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpBY3R1YWxseSwgSSBoYXZlIG9uZSBxdWVzdGlvbiBhYm91dCB0aGUgdGVtcGxhdGUgKG15
IGFjayBzdGlsbCBzdGFuZHMpLgoKT24gOS8xMC8xOSA0OjE4IFBNLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4gSGkgTGFycywKPiAKPiBPbiA5LzQvMTkgMTI6MzAgUE0sIExhcnMgS3VydGggd3JvdGU6
Cj4+IFRoaXMgY2hhbmdlIHByb3ZpZGVzIHN1ZmZpY2llbnQgaW5mb3JtYXRpb24gdG8gYWxsb3cg
Z2V0X21haW50YWluZXIucGwgLwo+PiBhZGRfbWFpbnRhaW5lcnMucGwgc2NyaXB0cyB0byBiZSBy
dW4gb24geGVuIHNpc3RlciByZXBvc2l0b3JpZXMgc3VjaCBhcwo+PiBtaW5pLW9zLmdpdCwgb3Nz
dGVzdC5naXQsIGV0Ywo+Pgo+PiBBIHN1Z2dlc3RlZCB0ZW1wbGF0ZSBmb3Igc2lzdGVyIHJlcG9z
aXRvcmllcyBvZiBYZW4gaXMKPj4KPj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPj4gVGhpcyBmaWxlIGZvbGxvd3MgdGhlIHNhbWUgY29u
dmVudGlvbnMgYXMgb3V0bGluZWQgaW4KPj4geGVuLmdpdDpNQUlOVEFJTkVSUy4gUGxlYXNlIHJl
ZmVyIHRvIHRoZSBmaWxlIGluIHhlbi5naXQKPj4gZm9yIG1vcmUgaW5mb3JtYXRpb24uCj4+Cj4+
IFRIRSBSRVNUCj4+IE06wqDCoMKgwqDCoCBNQUlOVEFJTkVSMSA8bWFpbnRhaW5lcjFAZW1haWwu
Y29tPgo+PiBNOsKgwqDCoMKgwqAgTUFJTlRBSU5FUjIgPG1haW50YWluZXIyQGVtYWlsLmNvbT4K
Pj4gTDrCoMKgwqDCoMKgIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwoKSSB3YXMgdW5k
ZXIgdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgc2NyaXB0cyB3b3VsZCBiZSB1c2VkIGZvciBVbmlr
cmFmdC4gCklmIHNvLCBkbyB3ZSBleHBlY3QgdGhlbSB0byBDQyB4ZW4tZGV2ZWwgZXZlcnl0aW1l
PwoKSWYgdGhlIGFuc3dlciBpcyBubywgdGhlbiB3ZSB3aWxsIHByb2JhYmx5IHdhbnQgdG8gYWRk
X21haW50YWluZXJzLnBsLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
