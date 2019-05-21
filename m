Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5112527D
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 16:46:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT5z9-0001sX-Vh; Tue, 21 May 2019 14:43:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mDO=TV=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hT5z9-0001sS-6U
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:43:23 +0000
X-Inumbo-ID: c636b84e-7bd6-11e9-8771-4f13579c64e2
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c636b84e-7bd6-11e9-8771-4f13579c64e2;
 Tue, 21 May 2019 14:43:19 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: PoKvbA2LsvcO1KFom1A3ms+87t5a/gMPfqp8gkeoQY4Zn8zgZ8Waa1lb0Y+s2vVCkPjNusFTXp
 fGMxJ4fJJtm39xeRUCG2DNw7toaWu4EVVfyRG0xNVJ+fveJM0rTN4VlVIFrX/dkMdeN9eypIdz
 t2tlQaUM4QBShQXcKwWPgdvQKB+fw9KLeKVKemq1hyOMWxXR+sspi6p+REqKnvqR4muHcSbTZK
 tyHVIcC8e+rLZ+mf8LsZMCYs7qdHGdd3eK+bq2HARp+NiMiH5EEGUgGw75hIAr4/33kJ0rbie3
 g1M=
X-SBRS: 2.7
X-MesageID: 717649
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,495,1549947600"; 
   d="scan'208";a="717649"
Date: Tue, 21 May 2019 15:43:15 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190521144315.GI1846@zion.uk.xensource.com>
References: <20190521143702.GH1846@zion.uk.xensource.com>
 <20190521164122.187e51f6.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521164122.187e51f6.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Unhandle NONE type device model broke QDISK backend
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDQ6NDE6MjJQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVHVlLCAyMSBNYXkgMjAxOSAxNTozNzowMiArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBieGw6IGRlYnVnOiBsaWJ4bF9kZXZpY2Uu
YzozODA6bGlieGxfX2RldmljZV9kaXNrX3NldF9iYWNrZW5kOiBEaXNrIHZkZXY9eHZkYSBzcGVj
LmJhY2tlbmQ9cWRpc2sKPiA+IGxpYnhsOiBkZWJ1ZzogbGlieGxfbGludXguYzoyMzU6bGlieGxf
X2dldF9ob3RwbHVnX3NjcmlwdF9pbmZvOiBEb21haW4gMTpiYWNrZW5kX2tpbmQgMywgbm8gbmVl
ZCB0byBleGVjdXRlIHNjcmlwdHMKPiAKPiBJIHdpbGwgY2hlY2sgd2h5IHFkaXNrIGRvZXMgbm90
IHRyaWdnZXIgUUVNVV9YRU4uCgpZZWFoLCB0aGF0J3MgaW5kZWVkIHN0cmFuZ2UuIFRoYW5rcyBm
b3IgaGF2aW5nIGEgbG9vay4KCldlaS4KCj4gCj4gT2xhZgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
