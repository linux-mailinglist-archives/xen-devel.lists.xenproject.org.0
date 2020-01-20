Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA61427AD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 10:53:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itTiS-0003yU-DY; Mon, 20 Jan 2020 09:51:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itTiQ-0003yP-KZ
 for xen-devel@lists.xen.org; Mon, 20 Jan 2020 09:51:26 +0000
X-Inumbo-ID: 674d439e-3b6a-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 674d439e-3b6a-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 09:51:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E7CCB234;
 Mon, 20 Jan 2020 09:51:16 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf500c2a-3ec1-6d66-6170-f3bbc606f3bb@suse.com>
Date: Mon, 20 Jan 2020 10:51:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117164432.32245-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] xsm: add config option for denied
 string
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxNzo0NCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5
OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CgpJbiBwcmluY2lwbGUK
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkJ1dCBJIHRoaW5rIGl0
IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIG5vbi1lbXB0eSBkZXNjcmlwdGlvbiwgYXQKbGVhc3Qg
dG8gcmVhc29uIHdoeSB0aGUgb3B0aW9uIGFkZGl0aW9uIGlzIGRlZW1lZCB1c2VmdWwuCgo+IC0t
LSBhL3hlbi9jb21tb24vS2NvbmZpZwo+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+IEBAIC0y
MzYsNiArMjM2LDE0IEBAIGNob2ljZQo+ICAJCWJvb2wgIlNJTE8iIGlmIFhTTV9TSUxPCj4gIGVu
ZGNob2ljZQo+ICAKPiArY29uZmlnIFhTTV9ERU5JRURfU1RSSU5HCj4gKwlzdHJpbmcgInhlbl92
ZXJzaW9uIGRlbmllZCBzdHJpbmciCgpJIGd1ZXNzIGluc2VydGluZyAiaHlwZXJjYWxsIiBpbnRv
IHRoaXMgcHJvbXB0IHdvdWxkIHNldCBiZXR0ZXIKY29udGV4dCB3aXRob3V0IG5lZWRpbmcgdG8g
cmVzb3J0IHRvIHRoZSBoZWxwIHRleHQsIGkuZS4KInhlbl92ZXJzaW9uIGh5cGVyY2FsbCBkZW5p
ZWQgc3RyaW5nIi4gVGhvdWdodHM/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
