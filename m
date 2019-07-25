Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D2874A0A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 11:35:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqa5i-0004yi-0N; Thu, 25 Jul 2019 09:31:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqa5f-0004yd-N1
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 09:31:11 +0000
X-Inumbo-ID: ef29cc8a-aebe-11e9-aa28-c32cd7447536
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef29cc8a-aebe-11e9-aa28-c32cd7447536;
 Thu, 25 Jul 2019 09:31:09 +0000 (UTC)
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
IronPort-SDR: ByJ2CnBTOCOQ9h6NYrn4Lv6ff4wI3iU3AlMTyMtTcoe6TCUwKsV3pkhm1J5pR5DLydkfWST4J+
 qyGFgbvJ0BvYGLhuaojvxCS9sSYxpUyoCIUzUUBmwfXtg4lHCMNa17bYsVIFhIKy5BjfoQObpW
 7B5BPe4N+ZvX7pBKl4lJDYzD8wKSvWb66aUEWye/T5sfD91lik0eVxfZQifaNqgpC755ht6L2f
 wtaidrYMDuDX+Zv5O0gijNodxjB2mfPEA0/9qwxS7W0TqCxcMZsQsRx2vYjZXHGyhggSg9ZN2s
 kxM=
X-SBRS: 2.7
X-MesageID: 3522357
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3522357"
Date: Thu, 25 Jul 2019 11:30:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190725093051.e4p55y46qrpwh2ca@Air-de-Roger>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-3-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723160609.2177-3-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/6] domain: remove 'guest_type' field (and
 enum guest_type)
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDU6MDY6MDVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBlbnVtIGd1ZXN0X3R5cGUgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IDZjNjQ5
Mjc4MGVhICJwdmggcHJlcDoKPiBpbnRyb2R1Y2UgcHYgZ3Vlc3QgdHlwZSBhbmQgaGFzX2h2bV9j
b250YWluZXIgbWFjcm9zIiB0byBhbGxvdyBhIG5ldyBndWVzdAo+IHR5cGUsIGRpc3RpbmN0IGZy
b20gZWl0aGVyIFBWIG9yIEhWTSBndWVzdCB0eXBlcywgdG8gYmUgYWRkZWQgaW4gY29tbWl0Cj4g
ODI3MWQ2NTIyYzYgInB2aDogaW50cm9kdWNlIFBWSCBndWVzdCB0eXBlIi4gU3Vic2VxdWVudGx5
LCBjb21taXQKPiAzM2U1YzMyNTU5ZSAieDg2OiByZW1vdmUgUFZIdjEgY29kZSIgcmVtb3ZlZCB0
aGlzIHRoaXJkIGd1ZXN0IHR5cGUuCj4gCj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBzdHJ1Y3Qg
ZG9tYWluIGZpZWxkIGFuZCBlbnVtZXJhdGlvbiBhcyB0aGUgZ3Vlc3QKPiB0eXBlIGNhbiBub3cg
YmUgdHJpdmlhbGx5IGRldGVybWluZWQgZnJvbSB0aGUgJ2NyZWF0ZWZsYWdzJyBmaWVsZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
