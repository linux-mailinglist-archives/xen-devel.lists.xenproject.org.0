Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10476140529
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 09:17:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isMl0-00078M-6t; Fri, 17 Jan 2020 08:13:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isMky-00078H-He
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 08:13:28 +0000
X-Inumbo-ID: 3c64c1a4-3901-11ea-8874-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c64c1a4-3901-11ea-8874-12813bfff9fa;
 Fri, 17 Jan 2020 08:13:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 485D4B12A;
 Fri, 17 Jan 2020 08:13:25 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <ce51dd78fd7aa0856d160b2d94c82f68dd4e7056.1579055705.git-series.marmarek@invisiblethingslab.com>
 <f0712623-fbc7-eca2-8303-6cc6b46f36b1@suse.com>
 <20200116171123.GX1314@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be05e3de-9452-441b-05f3-26778e47647e@suse.com>
Date: Fri, 17 Jan 2020 09:13:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200116171123.GX1314@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 11/16] tools: add simple
 vchan-socket-proxy
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxODoxMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIEphbiAxNSwgMjAyMCBhdCAxMjowMjo0MlBNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMTUuMDEuMjAyMCAwMzozOSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
IHdyb3RlOgo+Pj4gIC5naXRpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICst
Cj4+Cj4+IEkgZ3Vlc3MgdGhpcyBpcyB3aHkgdmFyaW91cyBub24tdG9vbC1zdGFjayBtYWludGFp
bmVycyBoYXZlCj4+IGJlZW4gQ2MtZWQuIEl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHlvdSBo
YWQgc3RyaXBwZWQgdGhlCj4+IHVubmVjZXNzYXJ5IENjLXMuIEkgZG9uJ3QgdGhpbmsgLi9NQUlO
VEFJTkVSUyBjYW4gcHJvcGVybHkKPj4gZXhwcmVzcyBhIHN1aXRhYmxlIHJ1bGUgb2YgQ2MgUkVT
VCBpZiB0aGUgYWRqdXN0bWVudCBpcyBub3QKPj4gc2ltcGx5IGFjY29tcGFueWluZyB0aGUgYWRk
aXRpb24gb2Ygc29tZSBuZXcgb3V0cHV0IGZpbGUuCj4gCj4gTWF5YmUgYSBzb2x1dGlvbiB3b3Vs
ZCBiZSB0byBtYWtlIHVzZSBvZiBtb3JlIC5naXRpZ25vcmUgZmlsZXMgaW4KPiBzcGVjaWZpYyBz
dWJkaXJzPyBJIHNlZSB0aGVyZSBhcmUgc29tZSwgYnV0IGZvciBleGFtcGxlIHRvb2xzL21pc2Mg
aXMKPiBtZW50aW9uZWQgaW4gX2JvdGhfIHRvcGxldmVsIC5naXRpZ25vcmUgYW5kIHRvb2xzL21p
c2MvLmdpdGlnbm9yZS4KCldlbGwsIHllcywgd2UndmUgYmVlbiBkaXNjdXNzaW5nIHRoaXMgZWxz
ZXdoZXJlLiBXZSBzaG91bGQgc2V0dGxlCm9uIG9uZSBtb2RlbCAoY2VudHJhbCB2cyBwZXItbWFp
bi1zdWJ0cmVlIHZzIHBlci1kaXIpLCBJIHRoaW5rLiBJCmhhdmUgbm8gcGFydGljdWxhciBwcmVm
ZXJlbmNlIGV4Y2VwdCBmb3IgZGlzbGlraW5nIGFueSBtaXhlZCBtb2RlbHMuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
