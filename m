Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5610C9E0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 14:52:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKAl-0001aS-Je; Thu, 28 Nov 2019 13:49:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaKAj-0001aL-Q7
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 13:49:29 +0000
X-Inumbo-ID: e5461888-11e5-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5461888-11e5-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 13:49:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AABC8AF0B;
 Thu, 28 Nov 2019 13:49:27 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <b5ab956e-36af-a07d-8698-79bf61eb514c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89e137c0-b8ca-436d-b425-705df3506c2c@suse.com>
Date: Thu, 28 Nov 2019 14:49:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b5ab956e-36af-a07d-8698-79bf61eb514c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxMzoxNSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBBcHBseWluZyB0aGUg
cGF0Y2ggZGlkbid0IGVuZCB1cCB3ZWxsIGZvciBteSB0ZXN0IExQIChmcm9tIGFub3RoZXIgdGhy
ZWFkKToKPiAKPiBQZXJmb3JtIGZ1bGwgaW5pdGlhbCBidWlsZCB3aXRoIDggQ1BVKHMpLi4uCj4g
UmVhZGluZyBzcGVjaWFsIHNlY3Rpb24gZGF0YQo+IEFwcGx5IHBhdGNoIGFuZCBidWlsZCB3aXRo
IDggQ1BVKHMpLi4uCj4gVW5hcHBseSBwYXRjaCBhbmQgYnVpbGQgd2l0aCA4IENQVShzKS4uLgo+
IEV4dHJhY3RpbmcgbmV3IGFuZCBtb2RpZmllZCBFTEYgc2VjdGlvbnMuLi4KPiBQcm9jZXNzaW5n
IHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvZ3Vlc3RfMi5vCj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2d1ZXN0XzQubwo+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L21tL3NoYWRv
dy9ndWVzdF8zLm8KPiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbS9ndWVzdF93YWxrXzMubwo+
IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L21tL2hhcC9ndWVzdF93YWxrXzNsZXZlbC5vCj4gUHJv
Y2Vzc2luZyB4ZW4vYXJjaC94ODYvbW0vaGFwL2d1ZXN0X3dhbGtfNGxldmVsLm8KPiBQcm9jZXNz
aW5nIHhlbi9hcmNoL3g4Ni9tbS9oYXAvZ3Vlc3Rfd2Fsa18ybGV2ZWwubwo+IFByb2Nlc3Npbmcg
eGVuL2FyY2gveDg2L21tL2d1ZXN0X3dhbGtfMi5vCj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYv
bW0vZ3Vlc3Rfd2Fsa180Lm8KPiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9lZmkvZWZpL2NoZWNr
Lm8KPiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9wdi9ncHJfc3dpdGNoLm8KPiBQcm9jZXNzaW5n
IHhlbi9hcmNoL3g4Ni9pbmRpcmVjdC10aHVuay5vCj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYv
Ym9vdC9oZWFkLm8KPiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni94ODZfNjQva2V4ZWNfcmVsb2Mu
bwo+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L3g4Nl82NC9jb21wYXQvZW50cnkubwo+IFByb2Nl
c3NpbmcgeGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5vCj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94
ODYvaHZtL3ZteC9lbnRyeS5vCj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvaHZtL3N2bS9lbnRy
eS5vCj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvbW50L21lZGlhL2dpdC91cHN0cmVhbS94ZW4v
eGVuL21udC9tZWRpYS9naXQvdXBzdHJlYW0veGVuL3hlbi8ueGVuLmVmaS4wcy5vCj4gUHJvY2Vz
c2luZyB4ZW4vYXJjaC94ODYvbW50L21lZGlhL2dpdC91cHN0cmVhbS94ZW4veGVuL21udC9tZWRp
YS9naXQvdXBzdHJlYW0veGVuL3hlbi8ueGVuLmVmaS4wci5vCj4gUHJvY2Vzc2luZyB4ZW4vYXJj
aC94ODYvbW50L21lZGlhL2dpdC91cHN0cmVhbS94ZW4veGVuL21udC9tZWRpYS9naXQvdXBzdHJl
YW0veGVuL3hlbi8ueGVuLmVmaS4xcy5vCj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvbW50L21l
ZGlhL2dpdC91cHN0cmVhbS94ZW4veGVuL21udC9tZWRpYS9naXQvdXBzdHJlYW0veGVuL3hlbi8u
eGVuLmVmaS4xci5vCj4gRVJST1I6IG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBmb3VuZC4KPiAKPiBT
byB0aGlzIGxvb2tzIGxpa2UgYSByZWdyZXNzaW9uLgoKVGhhbmtzIGZvciBkb2luZyB0aGUgdGVz
dGluZy4gQnV0IHdoYXQgYW0gSSB0byBjb25jbHVkZSBmcm9tCnRoZSBhYm92ZT8gSSBjYW4ndCBl
dmVuIHRlbGwgd2h5ICJubyBmdW5jdGlvbmFsIGNoYW5nZXMgZm91bmQiCmlzIGFuIGVycm9yLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
