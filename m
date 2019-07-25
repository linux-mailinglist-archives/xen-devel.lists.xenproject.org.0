Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345174A48
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 11:48:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqaIg-0005jd-7s; Thu, 25 Jul 2019 09:44:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqaIe-0005id-Qq
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 09:44:36 +0000
X-Inumbo-ID: cf92d5d7-aec0-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cf92d5d7-aec0-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 09:44:35 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hQb+sueKbPA5lgFxsLeFio56O0Lds21duEDYzKbzE+jL5p7Zh2k5zHkh/4devyFjWK3vRa+hTW
 +QP91qxQoNQgFm7SbFrL4p+8ozAcpOmcQw4oK2zUGKGnoErBS5DxC7nD4lcjCg8JsdjEcfd4Od
 4xSX5HtB/RbVdju8VYnjuvoPo2FH8dt4Dt6cUnTqQ3c7QcYKGlIq0NGJ51xxwqBq4HkayCVqz/
 bdOjgJdFjeO1dpFtoNMJ9ZDJCrEMZ8Rfi3SXhpyol6O1F/nmPhDip+IheQK8s9GQ5a2zTmH1mn
 1fc=
X-SBRS: 2.7
X-MesageID: 3522840
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3522840"
Date: Thu, 25 Jul 2019 11:44:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190725094420.g2wv7cur7xfoat5t@Air-de-Roger>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-4-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723160609.2177-4-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/6] x86/hvm/domain: remove the
 'hap_enabled' flag
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDU6MDY6MDZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC0jaWZkZWYgQ09ORklHX0hWTQo+IC0jZGVmaW5lIGhhcF9lbmFibGVkKGQpICAoaXNf
aHZtX2RvbWFpbihkKSAmJiAoZCktPmFyY2guaHZtLmhhcF9lbmFibGVkKQo+IC0jZWxzZQo+IC0j
ZGVmaW5lIGhhcF9lbmFibGVkKGQpICAoeyh2b2lkKShkKTsgZmFsc2U7fSkKPiAtI2VuZGlmCj4g
KyNkZWZpbmUgaGFwX2VuYWJsZWQoZCkgXAo+ICsgICAgKGh2bV9oYXBfc3VwcG9ydGVkKCkgJiYg
aXNfaHZtX2RvbWFpbihkKSAmJiBcCj4gKyAgICAgZXZhbHVhdGVfbm9zcGVjKGQtPmNyZWF0ZWZs
YWdzICYgWEVOX0RPTUNUTF9DREZfaGFwKSkKCllvdSBjb3VsZCBtYWtlIHRoaXMgYW4gaW5saW5l
IGZ1bmN0aW9uIHdoaWxlIGF0IGl0IEFGQUlDVC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
