Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF010CA00
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 14:59:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKIG-0002qm-MC; Thu, 28 Nov 2019 13:57:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaKIE-0002qV-NG
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 13:57:14 +0000
X-Inumbo-ID: fae1d56e-11e6-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fae1d56e-11e6-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 13:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F085ACB6;
 Thu, 28 Nov 2019 13:57:12 +0000 (UTC)
To: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <b5ab956e-36af-a07d-8698-79bf61eb514c@citrix.com>
 <89e137c0-b8ca-436d-b425-705df3506c2c@suse.com>
 <8407b785-8b2c-2f94-cab6-a9ceed502b18@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be8aa6ff-36f7-0572-4711-a8434a18b88e@suse.com>
Date: Thu, 28 Nov 2019 14:57:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8407b785-8b2c-2f94-cab6-a9ceed502b18@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNDo1NCwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gT24gMTEvMjgvMTkg
MTo0OSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjExLjIwMTkgMTM6MTUsIFNlcmdl
eSBEeWFzbGkgd3JvdGU6Cj4+PiBBcHBseWluZyB0aGUgcGF0Y2ggZGlkbid0IGVuZCB1cCB3ZWxs
IGZvciBteSB0ZXN0IExQIChmcm9tIGFub3RoZXIgdGhyZWFkKToKPj4+Cj4+PiBQZXJmb3JtIGZ1
bGwgaW5pdGlhbCBidWlsZCB3aXRoIDggQ1BVKHMpLi4uCj4+PiBSZWFkaW5nIHNwZWNpYWwgc2Vj
dGlvbiBkYXRhCj4+PiBBcHBseSBwYXRjaCBhbmQgYnVpbGQgd2l0aCA4IENQVShzKS4uLgo+Pj4g
VW5hcHBseSBwYXRjaCBhbmQgYnVpbGQgd2l0aCA4IENQVShzKS4uLgo+Pj4gRXh0cmFjdGluZyBu
ZXcgYW5kIG1vZGlmaWVkIEVMRiBzZWN0aW9ucy4uLgo+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2d1ZXN0XzIubwo+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvbW0vc2hh
ZG93L2d1ZXN0XzQubwo+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2d1ZXN0
XzMubwo+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvbW0vZ3Vlc3Rfd2Fsa18zLm8KPj4+IFBy
b2Nlc3NpbmcgeGVuL2FyY2gveDg2L21tL2hhcC9ndWVzdF93YWxrXzNsZXZlbC5vCj4+PiBQcm9j
ZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbS9oYXAvZ3Vlc3Rfd2Fsa180bGV2ZWwubwo+Pj4gUHJvY2Vz
c2luZyB4ZW4vYXJjaC94ODYvbW0vaGFwL2d1ZXN0X3dhbGtfMmxldmVsLm8KPj4+IFByb2Nlc3Np
bmcgeGVuL2FyY2gveDg2L21tL2d1ZXN0X3dhbGtfMi5vCj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNo
L3g4Ni9tbS9ndWVzdF93YWxrXzQubwo+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvZWZpL2Vm
aS9jaGVjay5vCj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9wdi9ncHJfc3dpdGNoLm8KPj4+
IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L2luZGlyZWN0LXRodW5rLm8KPj4+IFByb2Nlc3Npbmcg
eGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5vCj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni94ODZf
NjQva2V4ZWNfcmVsb2Mubwo+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYveDg2XzY0L2NvbXBh
dC9lbnRyeS5vCj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkubwo+Pj4g
UHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvaHZtL3ZteC9lbnRyeS5vCj4+PiBQcm9jZXNzaW5nIHhl
bi9hcmNoL3g4Ni9odm0vc3ZtL2VudHJ5Lm8KPj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L21u
dC9tZWRpYS9naXQvdXBzdHJlYW0veGVuL3hlbi9tbnQvbWVkaWEvZ2l0L3Vwc3RyZWFtL3hlbi94
ZW4vLnhlbi5lZmkuMHMubwo+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvbW50L21lZGlhL2dp
dC91cHN0cmVhbS94ZW4veGVuL21udC9tZWRpYS9naXQvdXBzdHJlYW0veGVuL3hlbi8ueGVuLmVm
aS4wci5vCj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbnQvbWVkaWEvZ2l0L3Vwc3RyZWFt
L3hlbi94ZW4vbW50L21lZGlhL2dpdC91cHN0cmVhbS94ZW4veGVuLy54ZW4uZWZpLjFzLm8KPj4+
IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L21udC9tZWRpYS9naXQvdXBzdHJlYW0veGVuL3hlbi9t
bnQvbWVkaWEvZ2l0L3Vwc3RyZWFtL3hlbi94ZW4vLnhlbi5lZmkuMXIubwo+Pj4gRVJST1I6IG5v
IGZ1bmN0aW9uYWwgY2hhbmdlcyBmb3VuZC4KPj4+Cj4+PiBTbyB0aGlzIGxvb2tzIGxpa2UgYSBy
ZWdyZXNzaW9uLgo+Pgo+PiBUaGFua3MgZm9yIGRvaW5nIHRoZSB0ZXN0aW5nLiBCdXQgd2hhdCBh
bSBJIHRvIGNvbmNsdWRlIGZyb20KPj4gdGhlIGFib3ZlPyBJIGNhbid0IGV2ZW4gdGVsbCB3aHkg
Im5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBmb3VuZCIKPj4gaXMgYW4gZXJyb3IuCj4+Cj4gCj4gSXQn
cyBkdWUgdG8gdGhlIHdheSBsaXZlcGF0Y2gtYnVpbGQgdG9vbCBpbnRlcnBvc2VzIG9uIHRoZSBi
dWlsZCB0byBjYXB0dXJlCj4gY2hhbmdlZCBvYmplY3QgZmlsZXMgZm9yIGxhdGVyIGNvbXBhcmlz
b24uICBOb3cgdGhhdCBvYmpjb3B5IHdyaXRlcyBvdXQgdGhlCj4gcHJvcGVyIG9iamVjdCBmaWxl
cyByYXRoZXIgdGhhbiBnY2MgKHdoaWNoIGp1c3Qgd3JpdGVzIGEgdGVtcG9yYXJ5IG9uZSksIHRo
ZQo+IGxpdmVwYXRjaC1idWlsZCB0b29sIG5lZWRzIHNvbWUgYWRqdXN0bWVudCBvdGhlcndpc2Ug
aXQgZG9lc24ndCBjYXB0dXJlIGFueQo+IGNoYW5nZWQgZmlsZXMuIEknbSB3b3JraW5nIG9uIGEg
cGF0Y2guCgpGb3IgbXkgb3duIGVkdWNhdGlvbiwgYW5kIGp1c3QgaWYgeW91IGhhdmUgdGhlIHRp
bWU6IFdoeSB3b3VsZCB0aGVyZQpiZSBhbnkgZGVwZW5kZW5jeSBvbiB3aGljaCBidWlsZCB1dGls
aXR5IHByb2R1Y2VzIHRoZSBvYmplY3QgZmlsZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
