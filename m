Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F783793
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 19:03:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv2p3-0006C1-8G; Tue, 06 Aug 2019 17:00:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PT6Y=WC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hv2p1-0006Bw-HW
 for xen-devel@lists.xen.org; Tue, 06 Aug 2019 17:00:27 +0000
X-Inumbo-ID: af89aedb-b86b-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id af89aedb-b86b-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 17:00:26 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xRpERaJ/pyAoq8b3BS9Ly/iy841rlDXqdvuCw3InzZoJF5aQJiSwu6PeRPYBUOH6C2H/E5Bnmi
 83YY0DxYNX2igf130G8XkPno/jtCdIzCNCLvRBoHq/ucrbLnVwUoFsEt1HefjmLMKn/yoEEa2u
 IlU6mwoDBfqdaekupCx8oPb8H4jGoZsJp/2lrg7ERXRY7s2/IToo/7tZDYJhBDCchxBpST9Dol
 ldB7j0wXdQC0rpWr9JFiRVAs92s5M/CUg2u2fGQNAQcIcUXH0Zo26IYzLP5YtoXky/W5UOgDKx
 EuU=
X-SBRS: 2.7
X-MesageID: 4089195
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="4089195"
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Message-ID: <d4c85799-4422-ead1-5a80-6c338b3edb6c@citrix.com>
Date: Tue, 6 Aug 2019 18:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: [Xen-devel] SWAPGSAttack and CVE-2019-1125
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpXaXRoIHRoZSBlbWJhcmdvIHVwLCB5b3UnbGwgc3VyZWx5IGFsbCBiZSBwbGVhc2Vk
IHRvIHNlZSB0aGF0IHRoaXMgaXMKbm90IGEgemVyb2RheSBYU0EuCgpodHRwczovL3d3dy5iaXRk
ZWZlbmRlci5jb20vU1dBUEdTQXR0YWNrCgpUaGVyZSBhcmUgdHdvIGlzc3VlcyBoZXJlLgoKCjEp
IFNwZWN0cmUgYXR0YWNrcyBhZ2FpbnN0IFNXQVBHUyBpbiBpbnRlcnJ1cHQvZXhjZXB0aW9uIGhh
bmRsZXJzCgpUaGlzIGhhcyBiZWVuIGFzc2lnbmVkIENWRS0yMDE5LTExMjUgYW5kIGFmZmVjdHMg
YWxsIDY0Yml0IG9wZXJhdGluZwpzb2Z0d2FyZSB1c2luZyAlZ3MgYmFzZSBpbiB0aGUgbWFubmVy
IGludGVuZGVkIGJ5IHRoZSBBTUQ2NCBzcGVjLgoKWGVuIGlzIG5vdCBvbmUgb2YgdGhlc2Ugc3lz
dGVtcywgYW5kIGlzIHRoZXJlZm9yZSBub3QgYWZmZWN0ZWQgYnkgdGhlCmlzc3VlLsKgIFRoaXMg
aXMgb3dpbmcgdG8gYSBkZXNpZ24gZGVjaXNpb24gbWFkZSBtb3JlIHRoYW4gYSBkZWNhZGUgYWdv
LgoKSW4gYWRkaXRpb24sIDY0Yml0IFBWIGd1ZXN0cyBydW5uaW5nIHVuZGVyIFhlbiBhcmUgbm90
IGFmZmVjdGVkLsKgIFNXQVBHUwppcyBhIHByaXZpbGVnZWQgaW5zdHJ1Y3Rpb24gYW5kIHRoZSA2
NGJpdCBQViBBQkkgd2FzIGRlc2lnbmVkIGFyb3VuZAp0aGlzIHJlc3RyaWN0aW9uLgoKCjIpIFN0
YWxlIHNlZ21lbnQgbGVha2FnZS4KCk9uIHNvbWUgQ1BVcywgdGhlIHByZXZpb3VzIGNvbnRlbnQg
b2YgdGhlIHNlZ21lbnQgcmVnaXN0ZXJzIGlzCnJlY292ZXJhYmxlIHVuZGVyIHNwZWN1bGF0aXZl
IGV4ZWN1dGlvbiBhZnRlciBhIGNvbnRleHQgc3dpdGNoLsKgIFRoaXMgaXMKbm90IHNlY3JldCBp
bmZvcm1hdGlvbiwgc28gYSBDVkUgaGFzIG5vdCBiZWVuIGFzc2lnbmVkLgoKSG93ZXZlciwgdGhp
cyBpcyBhIHZlcnkgbG93LW5vaXNlIGNvdmVydCBjaGFubmVsIHdpdGggc29tZSBpbnRlcmVzdGlu
ZwpkYXRhIHRyYW5zZmVyIGNoYXJhY3RlcmlzdGljcy4KCkluIHRoZSBkZWZhdWx0IGNhc2UsIGEg
dkNQVSBjYW4gb2JzZXJ2ZSB0aGUgc2VnbWVudCBiYXNlIHZhbHVlcyB1c2VkIGJ5CnRoZSBwcmV2
aW91cyB2Q1BVIHRvIGV4ZWN1dGUgb24gdGhlIGN1cnJlbnQgQ1BVLsKgIFRoaXMgbWF5IGJlIGEK
ZGlmZmVyZW50IHZDUFUgZnJvbSB0aGUgc2FtZSBndWVzdCwgb3IgZnJvbSBhIGRpZmZlcmVudCBn
dWVzdC4KCkZ1cnRoZXJtb3JlLCB3aXRob3V0IFNwZWN0cmUgdjIgbWl0aWdhdGlvbnMgaW4gcGxh
Y2UgaW4gWGVuIChhbmQgb3RoZXIKa2VybmVsIGxldmVsIHNvZnR3YXJlKSwgdGhlcmUgYXJlIHBy
YWN0aWNhbCwgYWxiZWl0IHRoZW9yZXRpY2FsIGF0IHRoaXMKcG9pbnQsIHdheXMgdG8gbGVhayBz
cGVjdWxhdGl2ZWx5LW9idGFpbmVkIGRhdGEgdmlhIHRoaXMgY292ZXJ0IGNoYW5uZWwsCnJhdGhl
ciB0aGFuLCBlLmcuIHZpYSB0aGUgTDFEIGNhY2hlLsKgIEkgZXhwZWN0IHNvbWUgcmVzZWFyY2gg
cGFwZXJzIHdpbGwKaGF2ZSBmdW4gd2l0aCB0aGlzIGF2ZW51ZSBpbiB0aGUgbmVhciBmdXR1cmUu
CgpJIGhhdmUgc29tZSBwYXRjaGVzIHRvIG1pdGlnYXRlIHRoaXMgY292ZXJ0IGNoYW5uZWwgd2hp
Y2ggd2lsbCBiZSBwb3N0ZWQKdG8geGVuLWRldmVsIHdoZW4gdGhleSBhcmUgcmVhZHkuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
