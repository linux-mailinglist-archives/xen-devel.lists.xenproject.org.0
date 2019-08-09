Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B0C877B7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2MR-0002ks-Lw; Fri, 09 Aug 2019 10:43:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iEig=WF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hw2MP-0002kf-QL
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:43:01 +0000
X-Inumbo-ID: 746b1564-ba92-11e9-b4a6-c72a6d263c06
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 746b1564-ba92-11e9-b4a6-c72a6d263c06;
 Fri, 09 Aug 2019 10:42:59 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oJoMDs6dA1gsLfvBPmpC1/v63K3yrx3iAe2guMGQW43pPnglSWDdf4BqXrZA5/95BI2fy1RpWj
 9euvVzRUjstlm9ei++yQtbNcf3E++oPaC68MrSQWwptoU30KdvuUUaCNgSLkOeJOKNMxF2rhgJ
 yHC5pXiXMHMPFzrwsd7ZP7D+ApDHc3/WUniaEnmfx2LfCHaOt1/YE/tbUqrFiS70PJQD0ygG4u
 DQU0GCk4wM/YnJS9kT+ivrdEcNNK9i2QKcSxjrTDR52ifb/NM5kazDtyhNsGcrvE1qBE6iRRHu
 WS4=
X-SBRS: 2.7
X-MesageID: 4083657
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4083657"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23885.19985.495081.380143@mariner.uk.xensource.com>
Date: Fri, 9 Aug 2019 11:42:25 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
In-Reply-To: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
References: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] python: fix -Wsign-compare warnings
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltQQVRDSCAxLzJdIHB5dGhvbjog
Zml4IC1Xc2lnbi1jb21wYXJlIHdhcm5pbmdzIik6Cj4gU3BlY2lmaWNhbGx5Ogo+IHhlbi9sb3ds
ZXZlbC94Yy94Yy5jOiBJbiBmdW5jdGlvbiDigJhweXhjX2RvbWFpbl9jcmVhdGXigJk6Cj4geGVu
L2xvd2xldmVsL3hjL3hjLmM6MTQ3OjI0OiBlcnJvcjogY29tcGFyaXNvbiBvZiBpbnRlZ2VyIGV4
cHJlc3Npb25zIG9mIGRpZmZlcmVudCBzaWduZWRuZXNzOiDigJhpbnTigJkgYW5kIOKAmGxvbmcg
dW5zaWduZWQgaW504oCZIFstV2Vycm9yPXNpZ24tY29tcGFyZV0KPiAgIDE0NyB8ICAgICAgICAg
Zm9yICggaSA9IDA7IGkgPCBzaXplb2YoeGVuX2RvbWFpbl9oYW5kbGVfdCk7IGkrKyApCgpUaGFu
a3MsCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cgph
bmQgY29tbWl0dGVkLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
