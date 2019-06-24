Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06595090F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 12:37:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfMIE-0003sj-TS; Mon, 24 Jun 2019 10:33:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VJaK=UX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfMID-0003se-AG
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 10:33:45 +0000
X-Inumbo-ID: 88af600c-966b-11e9-8097-73595ffb21a4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 88af600c-966b-11e9-8097-73595ffb21a4;
 Mon, 24 Jun 2019 10:33:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC31B2B;
 Mon, 24 Jun 2019 03:33:40 -0700 (PDT)
Received: from [10.37.9.192] (unknown [10.37.9.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64AD43F718;
 Mon, 24 Jun 2019 03:33:39 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190624101723.23291-1-andrew.cooper3@citrix.com>
 <20190624101723.23291-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <da5adbd3-af96-e089-4285-05b7bc9d1709@arm.com>
Date: Mon, 24 Jun 2019 11:33:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624101723.23291-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/ubsan: Don't perform alignment
 checking on supporting compilers
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNi8yNC8xOSAxMToxNyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBH
Q0MgNSBpbnRyb2R1Y2VkIC1mc2FuaXRpemU9YWxpZ25tZW50IHdoaWNoIGlzIGVuYWJsZWQgYnkg
ZGVmYXVsdCBieQo+IENPTkZJR19VQlNBTi4gIFRoaXMgdHJpcHMgYSBsb2FkIG9mIHdvbnQtZml4
IGNhc2VzIGluIHRoZSBBQ1BJIHRhYmxlcyBhbmQgdGhlCj4gaHlwZXJjYWxsIHBhZ2UgYW5kIHN0
dWJzIHdyaXRpbmcgbG9naWMuCj4gCj4gSXQgYWxzbyBjYXVzZXMgdGhlIG5hdGl2ZSBYZW4gYm9v
dCB0byBjcmFzaCBiZWZvcmUgdGhlIGNvbnNvbGUgaXMgc2V0IHVwLCBmb3IKPiBhbiBhcy15ZXQg
dW5pZGVudGlmaWVkIHJlYXNvbiAobW9zdCBsaWtsZXkgYSB3b250LWZpeCBjYXNlIGVhcmxpZXIg
b24gYm9vdCkuCj4gCj4gRGlzYWJsZSBhbGlnbm1lbnQgc2FuaXRpc2F0aW9uIG9uIGNvbXBpbGVy
cyB3aGljaCB3b3VsZCB0cnkgdXNpbmcgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2gg
PEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgo+IAo+IFRoaXMgaXNuJ3QgaWRlYWwsIGJ1dCB3ZSBjYW4ndCBkbyBiZXR0
ZXIgd2l0aG91dCBhIGJpdCBvZiBhbiBvdmVyaGF1bCB3aGljaCBJCj4gZG9uJ3QgaGF2ZSB0aW1l
IGZvciBub3cuICBMaW51eCB1c2VzIGEgd2hpdGVsaXN0IG9mIHNhbml0aXNlcnMgYnV0IEknbSBu
b3QKPiBlbnRpcmVseSBzdXJlIHdlIHdhbnQgdG8gZ28gdGhhdCByb3V0ZS4gIEFSTSBjdXJyZW50
bHkgaXNuJ3Qgd29ya2luZyB3ZWxsIHdpdGgKPiBVQlNBTiwgYnV0IEFGQUNJVCwgYWxsIEFSTSBw
bGF0Zm9ybXMgdGhhdCB3ZSBzdXBwb3J0IGFsc28gZGlzYWJsZSBhbGlnbm1lbnQKPiBzYW5pdGlz
YXRpb24gaW4gTGludXguCgpMaW51eCBoYXMgYW4gb3B0aW9uIHRvIGRpc2FibGUvZW5hYmxlIGFs
aWdtZW50IHNhbml0aXNhdGlvbi4gSG93ZXZlciwgCklJUkMsIExpbnV4IGFsbG93cyB1bmFsaWdu
ZWQgYWNjZXNzIGZvciBib3RoIEFybTMyIGFuZCBBcm02NC4KCkZvciBYZW46CiAgIC0gT24gQXJt
MzIsIGFsaWdubWVudCBjaGVjayBpcyBlbmFibGVkLCBzbyBhbnkgdW5hbGlnbmVkIGFjY2VzcyB3
aWxsIApyZXN1bHQgdG8gYSBjcmFzaC4KICAgLSBPbiBBcm02NCwgYWxpZ25tZW50IGNoZWNrIGlz
IGRpc2FibGVkLCB0aGUgb25seSByZWFzb24gaXMgYmVjYXVzZSAKbWVtY3B5IGlzIHVzaW5nIHVu
YWxpZ25lZCBhY2Nlc3MgKGZvciBwZXJmb3JtYW5jZSByZWFzb24pLiBCdXQgd2Ugc2hvdWxkIApz
dGlsbCBub3QgcmVseSBvbiB1bmFsaWduZWQgYWNjZXNzIGFzIHRoZXkgYXJlIG5vdCBhdG9taWMu
CgpUaGUgb25seSBsaW1pdGF0aW9uIGZvciB1c2luZyBVQlNBTiBvbiBYZW4gb24gQXJtIHRvZGF5
IGlzIHRoZSBzaXplIG9mIAp0aGUgYmluYXJ5ICh3ZSBvbmx5IHN1cHBvcnQgdXAgdG8gMk1CKS4g
U28gbXkgcHJlZmVyZW5jZSBoZXJlIHdvdWxkIGJlIAp0byBtYWtlIHRoZSBuZXcgZmxhZyB4ODYg
b25seS4KCklkZWFsbHkgbG9uZ2VyIHBsYW4gd291bGQgYmUgdG8gbWFrZSBhIHBlci1maWxlIGRl
Y2lzaW9uIG9uIHRoZSAKc2FuaXRpemF0aW9uIHRvIHVzZS4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
