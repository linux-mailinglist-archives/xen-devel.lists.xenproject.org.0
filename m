Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843031661BB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:03:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oG7-0005uu-Ca; Thu, 20 Feb 2020 16:01:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4oG6-0005um-C2
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:01:02 +0000
X-Inumbo-ID: 30dc40c8-53fa-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30dc40c8-53fa-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 16:01:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 394C3AC37;
 Thu, 20 Feb 2020 16:01:01 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200220155843.1795-1-wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <834f04c9-e164-e03e-7793-69145b8d5ad0@suse.com>
Date: Thu, 20 Feb 2020 17:01:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220155843.1795-1-wl@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: make Roger VPCI maintainer
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAxNjo1OCwgV2VpIExpdSB3cm90ZToKPiBSb2dlciBoYXMga2luZGx5IGFn
cmVlZCB0byB0YWtlIG9uIHRoZSBidXJkZW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2xAeGVuLm9yZz4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cndp
dGggLi4uCgo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtNTAw
LDYgKzUwMCwxMiBAQCBGOgl4ZW4vaW5jbHVkZS8qL3ZtX2V2ZW50LmgKPiAgRjoJeGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vbW9uaXRvci5oCj4gIEY6CXhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3Zt
X2V2ZW50LmgKPiAgCj4gK1ZQQ0kKPiArTToJUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gK1M6CVN1cHBvcnRlZAo+ICtGOgl4ZW4vZHJpdmVycy92cGNpCgouLi4gYSB0
cmFpbGluZyBzbGFzaCBhZGRlZCBoZXJlIHRvIGluZGljYXRlIGl0J3MgYSBkaXJlY3RvcnkuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
