Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029FEB1A23
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 10:50:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8hFN-0005RC-CY; Fri, 13 Sep 2019 08:48:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wm3/=XI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i8hFL-0005R4-FJ
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 08:48:03 +0000
X-Inumbo-ID: 31a664f4-d603-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 31a664f4-d603-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 08:48:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F7BA28;
 Fri, 13 Sep 2019 01:48:01 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 352413F59C;
 Fri, 13 Sep 2019 01:48:00 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <20190913054435.3662-1-jgross@suse.com>
 <0c0cbcdb-cf4c-620e-0d77-b249017c167e@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <75292bbb-2ada-3e68-3b41-5df4cb962601@arm.com>
Date: Fri, 13 Sep 2019 09:47:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0c0cbcdb-cf4c-620e-0d77-b249017c167e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: fix arm build with debugtrace
 configured
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
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTMvMDkvMjAxOSAwNzoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMu
MDkuMjAxOSAwNzo0NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQWRkIG1pc3NpbmcgI2luY2x1
ZGVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBBbGJl
aXQgZm9yIHRoZSBmdXR1cmUgaXQgd291bGQgYmUgbmljZSBpZiB0aGUgY29ubmVjdGlvbiB0byB0
aGUKPiBhY3R1YWwgYnJlYWthZ2Ugd2FzIGVzdGFibGlzaGVkIGluIHRoZSBkZXNjcmlwdGlvbiwg
YnkgbWVudGlvbmluZwo+IHRoZSBvZmZlbmRpbmcgY29tbWl0IGFuZC9vciBieSBuYW1pbmcgdGhl
IHNwZWNpZmljIGJ1aWxkIHByb2JsZW0uCgpJdCB3b3VsZCBoYXZlIGJlZW4gbmljZSB5b3UgdGhl
IGNvbW1pdCBtZXNzYWdlIHdhcyBhdCBsZWFzdCB1cGRhdGVkIGJlZm9yZSAKY29tbWl0dGluZy4g
V2l0aCB0aGUgY3VycmVudCBvbmUgaXQgaXMgdW5jbGVhciB3aHkgaXQgaXMgbmVjZXNzYXJ5IHNv
IGl0IGZlZWxzIApxdWl0ZSByYW5kb20uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
