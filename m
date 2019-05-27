Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14ED2B8B9
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 18:11:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVIBC-0002ED-5R; Mon, 27 May 2019 16:08:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVIBA-0002E8-Pz
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 16:08:52 +0000
X-Inumbo-ID: b7261512-8099-11e9-99dd-fbf5fa8517ec
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7261512-8099-11e9-99dd-fbf5fa8517ec;
 Mon, 27 May 2019 16:08:50 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: pwsEcX6b3Zow/vuO/k0v0xS+2FG23BR/+HQx+iAwgxizfsM0+tXWDhSd28Efr0t2PkEPXaBBhT
 nAccJNyNqTO/gIm1/9lQcGUdhnztmn9jZd6TOmI/tfAPQLcuoAf0cWlgyQjXpfZJqKy6bIA0ex
 Foh4WXBD7KqwAzOGzw2iWXxRzBA2SFKMEvIvU49DfgjxX5aIadV+aowG2+GjKVf9nOqAgYal9S
 vSjC7PzKauzL2172VshT8WOUcTm2IaEDRL+CbjeAOOgAvs8h3fDlyNx69MMcMF09ppVMkPx5cK
 nto=
X-SBRS: 2.7
X-MesageID: 961450
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="961450"
Date: Mon, 27 May 2019 18:08:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190527160837.ilyt76lgcxtqqhgg@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-3-roger.pau@citrix.com>
 <cdc13026-212f-65a0-0fdf-a6bcb919de0e@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cdc13026-212f-65a0-0fdf-a6bcb919de0e@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/5] pci: use function generation macros for
 pci_config_{write, read}<size>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMTA6Mjk6MjZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMC8wNS8yMDE5IDE3OjEwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBU
aGlzIGF2b2lkcyBjb2RlIGR1cGxpY2F0aW9uIGJldHdlZW4gdGhlIGhlbHBlcnMuCj4gPgo+ID4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gLTEuwqAgSSBzZWUgdGhp
cyBhcyBhY3RpdmVseSBtYWtpbmcgdGhlIGNvZGUgd29yc2UsIG5vdCBhbiBpbXByb3ZlbWVudC4K
ClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJJ20gbm90IHNwZWNpYWxseSB0aHJpbGxlZCBlaXRo
ZXIgd2F5IChzZWVpbmcKSmFuIHByb3ZpZGVkIGhpcyBSQiksIHRoZSBtYWluIG1vdGl2YXRpb24g
YmVoaW5kIHRoZSBjaGFuZ2Ugd2FzIHRvCmF2b2lkIGhhdmluZyB0byBjaGFuZ2UgdGhlIGxpc3Qg
b2YgcGFyYW1ldGVycyB0byBhIHBjaV9zYmRmX3QgaW4gZWFjaApoZWxwZXIsIEkgZmluZCB0aGlz
IGVycm9yIHByb25lIHdoZW4gdGhlIGNvZGUgaXMgdGhlIHNhbWUgaW4gYWxsIDMKZGlmZmVyZW50
IGhlbHBlcnMgZXhjZXB0IGZvciB0aGUgc2l6ZSBkaWZmZXJlbmNlLgoKR2l2ZW4gQW5kcmV3J3Mg
b3BpbmlvbiBkbyB5b3Ugc3RpbGwgY29uc2lkZXIgdGhpcyB1c2VmdWwgSmFuPwoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
