Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765BA50EF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hOR-0002YR-1I; Mon, 02 Sep 2019 08:08:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4hOP-0002Y8-Dt
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:08:53 +0000
X-Inumbo-ID: e47402f2-cd58-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e47402f2-cd58-11e9-951b-bc764e2007e4;
 Mon, 02 Sep 2019 08:08:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3AD3BB016;
 Mon,  2 Sep 2019 08:08:48 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>
References: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
 <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
 <84a9fed12bc752498bb90a7db3fdb46912736d6a.1567195654.git-series.lars.kurth@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da2aac3d-6264-bee9-6c51-996cd5352805@suse.com>
Date: Mon, 2 Sep 2019 10:08:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <84a9fed12bc752498bb90a7db3fdb46912736d6a.1567195654.git-series.lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/3] Add V section entry to allow
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAyMjowOSwgTGFycyBLdXJ0aCB3cm90ZToKPiBUaGlzIGNoYW5nZSBwcm92
aWRlcyBzdWZmaWNpZW50IGluZm9ybWF0aW9uIHRvIGFsbG93IGdldF9tYWludGFpbmVyLnBsIC8K
PiBhZGRfbWFpbnRhaW5lcnMucGwgc2NyaXB0cyB0byBiZSBydW4gb24geGVuIHNpc3RlciByZXBv
c2l0b3JpZXMgc3VjaCBhcwo+IG1pbmktb3MuZ2l0LCBvc3N0ZXN0LmdpdCwgZXRjCj4gCj4gQSBz
dWdnZXN0ZWQgdGVtcGxhdGUgZm9yIHNpc3RlciByZXBvc2l0b3JpZXMgb2YgWGVuIGlzCj4gCj4g
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
PiBUaGlzIGZpbGUgZm9sbG93cyB0aGUgc2FtZSBjb252ZW50aW9ucyBhcyBvdXRsaW5lZCBpbgo+
IHhlbi5naXQ6TUFJTlRBSU5FUlMuIFBsZWFzZSByZWZlciB0byB0aGUgZmlsZSBpbiB4ZW4uZ2l0
Cj4gZm9yIG1vcmUgaW5mb3JtYXRpb24uCj4gCj4gVEhFIFJFU1QKPiBNOiAgICAgIE1BSU5UQUlO
RVIxIDxtYWludGFpbmVyMUBlbWFpbC5jb20+Cj4gTTogICAgICBNQUlOVEFJTkVSMiA8bWFpbnRh
aW5lcjJAZW1haWwuY29tPgo+IEw6ICAgICAgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gUzogICAgICBTdXBwb3J0ZWQKPiBGOiAgICAgICoKPiBGOiAgICAgICovCj4gVjogICAgICB4
ZW4tbWFpbnRhaW5lcnMtMQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4gCj4gU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5r
dXJ0aEBjaXRyaXguY29tPgoKRldJVwpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
