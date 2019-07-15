Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99268721
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 12:39:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmyLm-0002gM-Kp; Mon, 15 Jul 2019 10:36:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eZ1r=VM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hmyLl-0002gH-Lm
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 10:36:53 +0000
X-Inumbo-ID: 74405342-a6ec-11e9-926b-7b4fa5942067
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74405342-a6ec-11e9-926b-7b4fa5942067;
 Mon, 15 Jul 2019 10:36:50 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Pgm/UNT/R6e5AUfaKfE5m6EKWEYn2DqPlSy8urRB+oeHpISgw3aIjI+fKlvkOTxjLL7cNxAwhq
 AXtEXcP/rBMWyPn47gY7iEk1KRYpl8Ac2KhKRCUc7qwbgb/W55FlOBBlqBXgKz4DIBaQ+1pUma
 y/aRKqTA8yy+J79JrXeSk83q8Uv4Mdo3g5RCkI3u0QViWbClbpb+uz0iSnsrWBVKDY1/XJo1y3
 7tGcYswO/EHZSGHAb3qv2xZGu2Tfbht++e1zi1ChSDIoevZHQZTihEmcK53b0W0TlBXKXT5dhu
 R7E=
X-SBRS: 2.7
X-MesageID: 2991308
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2991308"
Date: Mon, 15 Jul 2019 12:36:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20190715103640.i6gwasdjdkltm47n@MacBook-Air-de-Roger.local>
References: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
 <20190708184711.2984-10-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708184711.2984-10-chaitanya.kulkarni@wdc.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH V4 9/9] xen/blkback: use helper in vbd_sz()
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com, yuchao0@huawei.com,
 colyli@suse.de, linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 jaegeuk@kernel.org, xen-devel@lists.xenproject.org, kent.overstreet@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTE6NDc6MTFBTSAtMDcwMCwgQ2hhaXRhbnlhIEt1bGth
cm5pIHdyb3RlOgo+IFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgdmJkX3N6KCkgbWFjcm8gd2l0aCBu
ZXdseSBpbnRyb2R1Y2VkIGhlbHBlcgo+IGZ1bmN0aW9uIHRvIHJlYWQgdGhlIG5yX3NlY3RzIGZy
b20gYmxvY2sgZGV2aWNlJ3MgaGRfcGFydHMgd2l0aCB0aGUKPiBoZWxwIG9mIHBhcnRfbnJfc2Vj
dHNfcmVhZCgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8Y2hhaXRh
bnlhLmt1bGthcm5pQHdkYy5jb20+CgpBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
