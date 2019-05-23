Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BD927A72
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 12:25:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkst-0004Ne-Kl; Thu, 23 May 2019 10:23:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TQZZ=TX=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hTksr-0004NW-Mx
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:23:37 +0000
X-Inumbo-ID: d215da72-7d44-11e9-ab86-c3bbffa48e60
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d215da72-7d44-11e9-ab86-c3bbffa48e60;
 Thu, 23 May 2019 10:23:35 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 9Vwr1zrKHL2mZp7Rlw1Euf3ZEeXXpPKL0punaDvgjR6rVK819N9bxApeWra531z2ZSaCMM5PDO
 lBIvjfduYVjj4uI8cZAvv/dTijr4BK3xgsRla+nslXvAID5ytrNe7nLO83l8e0yx19jCs3xc0n
 yiVYMAsd9Qz74UA1Ztx4c79fOSXP+3PlG+33/pkMu5z+CDzfLc6dyFRILbhvO2xOzzvIwk2yt2
 pLP3T32wzZsbjyslc0VnVFvHqz87sfBHUYd22u0BfdD15/QftL9R4U6jcwuwFNGakZ8GBhYtF8
 mek=
X-SBRS: 2.7
X-MesageID: 820992
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="820992"
Date: Thu, 23 May 2019 11:23:31 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190523102331.GC2373@zion.uk.xensource.com>
References: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
 <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/2] x86: init_hypercall_page() cleanup
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6MjA6MTVBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgdmFyaW91cyBwaWVjZXMgb2YgdGhlIGh5cGVyY2FsbCBwYWdlIGluZnJhc3Ry
dWN0dXJlIGhhdmUgZ3Jvd24KPiBvcmdhbmljYWxseSBvdmVyIHRpbWUgYW5kIGVuZGVkIHVwIGlu
IGEgYml0IG9mIGEgbWVzcy4KPiAKPiAgKiBSZW5hbWUgYWxsIGZ1bmN0aW9ucyB0byBiZSBvZiB0
aGUgZm9ybSAqX2luaXRfaHlwZXJjYWxsX3BhZ2UoKS4gIFRoaXMKPiAgICBtYWtlcyB0aGVtIHNv
bWV3aGF0IHNob3J0ZXIsIGFuZCBtZWFucyB0aGV5IGNhbiBhY3R1YWxseSBiZSBncmVwcGVkCj4g
ICAgZm9yIGluIG9uZSBnby4KPiAgKiBNb3ZlIGluaXRfaHlwZXJjYWxsX3BhZ2UoKSB0byBkb21h
aW4uYy4gIFRoZSA2NC1iaXQgdHJhcHMuYyBpc24ndCBhCj4gICAgdGVycmlibHkgYXBwcm9wcmlh
dGUgcGxhY2UgZm9yIGl0IHRvIGxpdmUuCj4gICogRHJvcCBhbiBvYnNvbGV0ZSBjb21tZW50IGZy
b20gaHZtX2luaXRfaHlwZXJjYWxsX3BhZ2UoKSBhbmQgZHJvcCB0aGUKPiAgICBkb21haW4gcGFy
YW1ldGVyIGZyb20gaHZtX2Z1bmNzLmluaXRfaHlwZXJjYWxsX3BhZ2UoKSBhcyBpdCBpc24ndAo+
ICAgIG5lY2Vzc2FyeS4KPiAgKiBSZWFycmFuZ2UgdGhlIGxvZ2ljIGluIHRoZSBlYWNoIGZ1bmN0
aW9uIHRvIGF2b2lkIG5lZWRpbmcgZXh0cmEgbG9jYWwKPiAgICB2YXJpYWJsZXMsIGFuZCB0byB3
cml0ZSB0aGUgcGFnZSBpbiBvbmUgc2luZ2xlIHBhc3MuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
