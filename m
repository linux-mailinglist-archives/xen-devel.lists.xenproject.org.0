Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3E29555
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 12:00:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU6xK-0006IF-Hq; Fri, 24 May 2019 09:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MrwS=TY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hU6xJ-0006I8-S1
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 09:57:41 +0000
X-Inumbo-ID: 5c42be8e-7e0a-11e9-a867-53fbe62978f2
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c42be8e-7e0a-11e9-a867-53fbe62978f2;
 Fri, 24 May 2019 09:57:37 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: vp0zcJRVAEsc/T38y74e6KzpQoWZHGeTNiAjnZpOuCKsuLUV37CDbmEpKRUBiKfO5fqCPgEOGQ
 7HCSjJAq5AgY3ymaAVAgbeaksX+aepzrdq5gPdvomOYL2iravwJOF03rXLJeHUMeN1233Omfny
 K2EewKsSayWKlIqUa2tNUiY4JaAbksiYgi8gH0gEYyXoABwkVw8nZ6dyary4E7qMNLjMSu1MrI
 3D11dLgBuGn3zg6KKHgH8DofF2clnZrpXUHoEqjw4/9wCNAQetSiKFJ1l84ZC/HWQ4nzCF26/K
 Qws=
X-SBRS: 2.7
X-MesageID: 873292
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,506,1549947600"; 
   d="scan'208";a="873292"
Date: Fri, 24 May 2019 10:57:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190524095727.su3wxkxgovfxpyne@Air-de-Roger>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-5-roger.pau@citrix.com>
 <23782.28680.411030.121451@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23782.28680.411030.121451@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/6] osstest: introduce a helper to get the
 svn revision of a git commit
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6MDM6NTJBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltYZW4tZGV2ZWxdIFtQQVRDSCA0LzZdIG9z
c3Rlc3Q6IGludHJvZHVjZSBhIGhlbHBlciB0byBnZXQgdGhlIHN2biByZXZpc2lvbiBvZiBhIGdp
dCBjb21taXQiKToKPiA+IFRoaXMgb25seSB3b3JrcyB3aGVuIHRoZSBzdm4gcmV2aXNpb24gaXMg
c3RvcmVkIGFzIGEgZ2l0IG5vdGUKPiA+IHdpdGggdGhlIGZvcm1hdCAncmV2aXNpb249PHJldmlz
aW9uIG51bWJlcj4nLgo+IAo+IFdvdy4gIFRoaXMgaXMgcHJldHR5IHVnbHkuCgpJbmRlZWQgOigu
Cgo+IAo+ID4gU3VjaCBjb252ZXJzaW9uIGlzIHJlcXVpcmVkIGluIG9yZGVyIHRvIGJvb3RzdHJh
cCBhIEZyZWVCU0Qgc3lzdGVtCj4gPiB3aXRob3V0IHJlbHlpbmcgb24gZXh0ZXJuYWwgcGFja2Fn
ZSByZXBvc2l0b3JpZXMuIEZyZWVCU0QgYmFzZSBzeXN0ZW0KPiA+IG9ubHkgY29udGFpbnMgYSBz
dWJ2ZXJzaW9uIGNsaWVudCAobm8gZ2l0IGNsaWVudCksIGFuZCB0aHVzIGluIG9yZGVyCj4gPiB0
byBmZXRjaCB0aGUgcG9ydHMgcmVwb3NpdG9yeSAodGhhdCBjb250YWluIHRoZSBleHRlcm5hbCBw
YWNrYWdlcwo+ID4gYnVpbGQgbWFrZWZpbGVzKSBzdm4gbXVzdCBiZSB1c2VkLgo+IAo+IGdpdCBu
b3RlcyBoYXZlIHNvbWUgZGlmZmVyZW50IHdheSBvZiB0cmF2ZWxsaW5nIHRoYW4gY29tbWl0cywg
ZG9uJ3QKPiB0aGV5ID8gIFdoZXJlIGlzIHRoaXMgZ2l0IG5vdGUgY29taW5nIGZyb20gYW5kIGhv
dyBkbyB3ZSBrbm93IGl0IGlzCj4gdGhlIHJpZ2h0IG5vdGUsIElZU1dJTSA/CgpJJ20gbm90IGFu
IGV4cGVydCBvbiB0aGlzLCBidXQgSSB0aGluayBub3RlcyBhcmUgYWx3YXlzIHN0b3JlZCBpbiBh
CnNlcGFyYXRlIGJyYW5jaCBvbiB0aGUgc2FtZSByZXBvPyBJbiB0aGUgRnJlZUJTRCBjYXNlIGF0
IGxlYXN0IGl0J3MKZ2l0L3JlZnMvbm90ZXMuCgo+IEFzaWRlIGZyb20gdGhhdCwgcGxlYXNlIGJy
ZWFrIHRoZSByZWZhY3RvcmluZyAoaW4gdGhpcyBjYXNlLCB0aGUKPiBicmVha2luZyBvdXQgb2Yg
cmVwb19nZXRfcmVhbHVybCkgaW50byBhIHNlcGFyYXRlIE5GQyBwYXRjaC4KClN1cmUhCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
