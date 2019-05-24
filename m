Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED6829508
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 11:44:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU6ir-0005GY-Mm; Fri, 24 May 2019 09:42:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MrwS=TY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hU6iq-0005GS-6t
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 09:42:44 +0000
X-Inumbo-ID: 4726c2c5-7e08-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4726c2c5-7e08-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 09:42:43 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: T7LSQFxZKELlTkoWqdglZoCFvLXN87HxoZpOrXz+IacYGJYP1tMA+lcWFCqboMhy8zt6bmWRNF
 KKnxiEO1YsdTW72ueEdM5Bt9gXwL4AoHkvTS4hleg37BVkRfuH2HRItyDkMQwgjAn4EjShvA5L
 V8OBxoqxgkioWiEGU8HPFfOTui9kwOrGJhxY7c1hVINNbSD0NJTZl4EY3UJ+LQR/iEhPoGRnPO
 +p2vXxqW+1J2eIi13H0nEyAAKmfbFNerROOc0Muid+1sMi6PSCGnJcjbjOssqedeFAFlI5Ef14
 q5E=
X-SBRS: 2.7
X-MesageID: 870831
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,506,1549947600"; 
   d="scan'208";a="870831"
Date: Fri, 24 May 2019 10:42:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190524094234.xvyclhi5dihqbrqu@Air-de-Roger>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-2-roger.pau@citrix.com>
 <23782.27740.739024.532029@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23782.27740.739024.532029@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/6] osstest: introduce a helper to stash a
 whole directory
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTA6NDg6MTJBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltYZW4tZGV2ZWxdIFtQQVRDSCAxLzZdIG9z
c3Rlc3Q6IGludHJvZHVjZSBhIGhlbHBlciB0byBzdGFzaCBhIHdob2xlIGRpcmVjdG9yeSIpOgo+
ID4gV2l0aG91dCBjb21wcmVzc2luZyBpdC4KPiAKPiBZb3UndmUgb3Blbi1jb2RlZCBhIHJlY3Vy
c2l2ZSBkaXJlY3RvcnkgY29weS4gIElzIHJzeW5jIGF2YWlsYWJsZSBvbgo+ICRobyBhdCB0aGlz
IHBvaW50ID8gIEkgdGhpbmsgbWF5YmUgaXQgY291bGQgYmUgLi4uCgpEJ29oLCB5ZXMsIHJzeW5j
IGNvdWxkIGJlIG1hZGUgYXZhaWxhYmxlIG9uICRobyBhdCB0aGlzIHBvaW50LgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
