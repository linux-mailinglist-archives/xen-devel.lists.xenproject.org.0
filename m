Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7980D4CDE4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 14:44:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdwNh-0000sA-Bd; Thu, 20 Jun 2019 12:41:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AtfB=UT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdwNf-0000s0-Hp
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 12:41:31 +0000
X-Inumbo-ID: b9d6f24f-9358-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b9d6f24f-9358-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 12:41:29 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ygb4LcZ/8a/1icj+nPoVDn7vbPvUSjQFo06V+Ei78wTrqMkH7xifkJKtU5YdXyAq4JIiONGiGf
 raV1OveuEnVK1HqpnHXedbTtrD4wQhJuPEZFJx16CnoAmDIKBcIBg/01RSvgGh18ZHOq/bRNLP
 WkwP6/fr197cMcEfvaNQK6oFZv3VQW5zQ67gw6NVUG4Ch7MvNaBf9z2VDTWU/IuUi+qxVjAd3b
 6ALWXtaLb23ZcHr3VkUGW1JVnwjVcVmTrY+aIG9LV/+V9iakmQpxal+3DnkI6bhwEow2dTQdez
 aLI=
X-SBRS: 2.7
X-MesageID: 1998853
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,396,1557201600"; 
   d="scan'208";a="1998853"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-3-git-send-email-andrew.cooper3@citrix.com>
 <20190620084028.5ozq2o4wr545mpb3@MacBook-Air-de-Roger.local>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5fb3f53f-a92c-bbae-941f-577b94420046@citrix.com>
Date: Thu, 20 Jun 2019 13:34:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190620084028.5ozq2o4wr545mpb3@MacBook-Air-de-Roger.local>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/4] xen/link: Link .data.schedulers and
 CONSTRUCTERS in more appropriate locations
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDYvMjAxOSAwOTo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEp1
biAxOSwgMjAxOSBhdCAwOToxMToyNVBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBO
ZWl0aGVyIG9mIHRoZXNlIHNob3VsZCBsaXZlIGluIC5kYXRhCj4+Cj4+ICAqIC5kYXRhLnNjaGVk
dWxlcnMgaXMgb25seSBldmVyIHJlYWQsIHNvIGlzIG1vdmVkIGludG8gLnJvZGF0YQo+PiAgKiBD
T05TVFJVQ1RPUlMgaXMgb25seSBldmVyIHJlYWQsIGFuZCBvbmx5IGF0IGJvb3QsIHNvIGlzIG1v
dmVkIHRvIGJlc2lkZQo+PiAgICAuaW5pdC5yb2RhdGEKPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBGb3IgeDg2Ogo+Cj4gUmV2
aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Cj4gT25l
IGNvbW1lbnQgYmVsb3c6Cj4KPj4gLS0tCj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+Cj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+PiBDQzogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Cj4+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+PiAtLS0KPj4gIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgfCAxMSArKysrKystLS0tLQo+
PiAgeGVuL2FyY2gveDg2L3hlbi5sZHMuUyB8IDExICsrKysrKy0tLS0tCj4+ICAyIGZpbGVzIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPj4gaW5k
ZXggZWMzN2QzOC4uOWZhNmM5OSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMu
Uwo+PiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4+IEBAIC0xNDAsNiArMTQwLDExIEBA
IFNFQ1RJT05TCj4+ICAgICAgICAgKiguZGF0YS5wYXJhbSkKPj4gICAgICAgICBfX3BhcmFtX2Vu
ZCA9IC47Cj4+ICAKPj4gKyAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7Cj4+ICsgICAg
ICAgX19zdGFydF9zY2hlZHVsZXJzX2FycmF5ID0gLjsKPj4gKyAgICAgICAqKC5kYXRhLnNjaGVk
dWxlcnMpCj4+ICsgICAgICAgX19lbmRfc2NoZWR1bGVyc19hcnJheSA9IC47Cj4+ICsKPj4gICNp
ZiBkZWZpbmVkKENPTkZJR19IQVNfVlBDSSkgJiYgZGVmaW5lZChDT05GSUdfTEFURV9IV0RPTSkK
Pj4gICAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7Cj4+ICAgICAgICAgX19zdGFydF92
cGNpX2FycmF5ID0gLjsKPj4gQEAgLTIwNyw2ICsyMTIsNyBAQCBTRUNUSU9OUwo+PiAgCj4+ICAg
ICAgICAgKiguaW5pdC5yb2RhdGEpCj4+ICAgICAgICAgKiguaW5pdC5yb2RhdGEuKikKPj4gKyAg
ICAgICBDT05TVFJVQ1RPUlMKPiBBY2NvcmRpbmcgdG8gdGhlIGxkIG1hbnVhbCBDT05TVFJVQ1RP
UlMgaXMgb25seSByZWxldmFudCBmb3IgYS5vdXQsCj4gRUNPRkYgYW5kIFhDT0ZGLiBJJ20gdW5z
dXJlIHdoZXRoZXIgUEUgZG9lcyB1c2UgQ09OU1RSVUNUT1JTIG9yIG5vdCwKPiBzaW5jZSBpdCdz
IGEgZGVzY2VuZGFudCBvZiBDT0ZGLgoKQ09OU1RSVUNUT1JTIGlzIHN0cmljdGx5IG5lZWRlZCBm
b3IgdGhlIEdDQyBjb3ZlcmFnZSBidWlsZCB0byBmdW5jdGlvbgooaGVuY2UgaXRzIGludHJvZHVj
dGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UpLCBhbmQgYW55IGNvZGUgd2hpY2ggdXNlcwpfX2F0dHJp
YnV0ZV9fKChjb25zdHJ1Y3RvcikpICh3aGljaCB3ZSB1c2UgaXQgaW4gbGlieGMsIGJ1dCBub3Qg
aW4gWGVuKS4KCkknZCBzYXkgdGhhdCB0aGUgbGQgbWFudWFsIGlzIG91dC1vZi1kYXRlLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
