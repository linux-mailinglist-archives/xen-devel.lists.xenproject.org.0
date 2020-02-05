Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B521529EA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:30:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIrk-0003Tm-AX; Wed, 05 Feb 2020 11:29:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izIrj-0003Tg-3O
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:29:07 +0000
X-Inumbo-ID: b7f9ff92-480a-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7f9ff92-480a-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 11:29:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A0A88ADF0;
 Wed,  5 Feb 2020 11:29:05 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200205112412.19414-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8eeaa31c-990d-e4d4-539f-092747bd7def@suse.com>
Date: Wed, 5 Feb 2020 12:29:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205112412.19414-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix assertion failure in stub
 domain creation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxMjoyNCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9kb21jdGwuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+
IEBAIC00Miw3ICs0Miw4IEBACj4gIAo+ICAvKgo+ICAgKiBOQi4geGVuX2RvbWN0bC5kb21haW4g
aXMgYW4gSU4vT1VUIHBhcmFtZXRlciBmb3IgdGhpcyBvcGVyYXRpb24uCj4gLSAqIElmIGl0IGlz
IHNwZWNpZmllZCBhcyB6ZXJvLCBhbiBpZCBpcyBhdXRvLWFsbG9jYXRlZCBhbmQgcmV0dXJuZWQu
Cj4gKyAqIElmIGl0IGlzIHNwZWNpZmllZCBhcyBhbiBpbnZhbGlkIHZhbHVlICgwIG9yID49IERP
TUlEX0ZJUlNUX1JFU0VSVkVEKSwKPiArICogYW4gaWQgaXMgYXV0by1hbGxvY2F0ZWQgYW5kIHJl
dHVybmVkLgo+ICAgKi8KPiAgLyogWEVOX0RPTUNUTF9jcmVhdGVkb21haW4gKi8KPiAgc3RydWN0
IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHsKCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
