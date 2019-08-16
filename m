Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A5790A7D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 23:54:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyk8X-0001fX-Mr; Fri, 16 Aug 2019 21:51:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyk8W-0001fS-70
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 21:51:52 +0000
X-Inumbo-ID: 0ddb1f40-c070-11e9-a661-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0ddb1f40-c070-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 21:51:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 202AE344;
 Fri, 16 Aug 2019 14:51:51 -0700 (PDT)
Received: from [10.37.12.84] (unknown [10.37.12.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7C5D3F718;
 Fri, 16 Aug 2019 14:51:48 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190805132955.1630-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <82c9bda7-c915-8423-786c-eb004838108a@arm.com>
Date: Fri, 16 Aug 2019 22:51:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805132955.1630-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/console: Bug fixes and doc
 improvement
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
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzUvMTkgMjoyOSBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIGFsbCwKPiAK
PiBUaGlzIHNlcmllcyBjb250YWlucyBhIGJ1bmNoIG9mIGJ1ZyBmaXhlcyBmb3IgdGhlIGh5cGVy
Y2FsbCBDT05TT0xFSU9fd3JpdGUKPiBhbmQgc29tZSBkb2N1bWVudGF0aW9uLgo+IAo+IENoZWVy
cywKPiAKPiBKdWxpZW4gR3JhbGwgKDQpOgo+ICAgIHhlbi9jb25zb2xlOiBEb24ndCB0cmVhdCBO
VUwgY2hhcmFjdGVyIGFzIHRoZSBlbmQgb2YgdGhlIGJ1ZmZlcgo+ICAgIHhlbi9jb25zb2xlOiBS
ZXdvcmsgSFlQRVJDQUxMX2NvbnNvbGVfaW8gaW50ZXJmYWNlCj4gICAgeGVuL3B1YmxpYzogRG9j
dW1lbnQgSFlQRVJDQUxMX2NvbnNvbGVfaW8oKQo+ICAgIHhlbi9jb25zb2xlOiBTaW1wbGlmeSBk
b21VIGNvbnNvbGUgaGFuZGxpbmcgaW4gZ3Vlc3RfY29uc29sZV93cml0ZQoKSSBoYXZlIG1lcmdl
ZCB0aGUgc2VyaWVzLiBUaGFuayB5b3UgYWxsIGZvciB0aGUgcmV2aWV3IQoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
