Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5DD25F2C
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 10:13:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTMJp-00072h-6O; Wed, 22 May 2019 08:09:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Clyk=TW=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hTMJn-00072c-J1
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 08:09:47 +0000
X-Inumbo-ID: f585c1b0-7c68-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f585c1b0-7c68-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 08:09:45 +0000 (UTC)
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
IronPort-SDR: TbWq9fBXF+NRhjpTFNCKlrJjJuTaio11A1+hRxcOaPA8jkNN0ahUeW8tXiWEtsxGOeaLnOfyc0
 CkuvptmX89GpYRV3O0/0bdHcEqh5veqRIeYnOiqjLLSY2hjR7TzHU6cfknM2+4lDGVv8Ln1Tom
 0C8mBrG0oInEalsG7BZt07PtMCTkv1nrc/VL6suQOYkuRFSp6c88YFCt9jQTZpAbMZV4NORWBK
 eCjzz8OIu4WwKyow0X8RS/XTuoHGXDWSfkkglB5biqr4Sk+/EA8DNFLAhewyY9zF1W911hIpsY
 m2M=
X-SBRS: 2.7
X-MesageID: 755647
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,498,1549947600"; 
   d="scan'208";a="755647"
Date: Wed, 22 May 2019 09:09:42 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190522080942.GK1846@zion.uk.xensource.com>
References: <5CE4F63A0200007800231313@prv1-mh.provo.novell.com>
 <20190522092544.2d7d835f.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522092544.2d7d835f.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] libxl assertion failure when creating any kind of
 guest
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDk6MjU6NDRBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gV2VkLCAyMiBNYXkgMjAxOSAwMToxMTo1NCAtMDYwMAo+IHNjaHJpZWIgIkphbiBC
ZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+Ogo+IAo+ID4gbGlieGxfX2RvbWFpbl9idWlsZF9p
bmZvX3NldGRlZmF1bHQgKGdjPTB4N2ZmZmZmZmZkZWUwLCBiX2luZm89MHg3ZmZmZmZmZmRiODAp
Cj4gPiAgICAgYXQgbGlieGxfY3JlYXRlLmM6MTQzCj4gCj4gVGhpcyBpcyBsaWJ4bF9kZWZib29s
X3ZhbChiX2luZm8tPmRldmljZV9tb2RlbF9zdHViZG9tYWluKS4KPiAKPiBEdWUgdG8gdGhlIGxh
Y2sgb2YgYSBwcm9wZXIgd2F5IHRvIGRlc2NyaWJlIGFsbCB0aGUgZGVwZW5kZW5jaWVzIHdpdGhp
bgo+IGxpYnhsIEkgc3VnZ2VzdCB0byByZXZlcnQgdGhlc2UgY29tbWl0cyBmb3IgdGhlIHRpbWUg
YmVpbmc6Cj4gCj4gMjc4YzY0NTE5YyBsaWJ4bDogZml4IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9y
eSBhZnRlciA4OTk0MzNmMTQ5ZAo+IDg5OTQzM2YxNDkgbGlieGw6IGZpeCBtaWdyYXRpb24gb2Yg
UFYgYW5kIFBWSCBkb21VcyB3aXRoIGFuZCB3aXRob3V0IHFlbXUKPiAzODAyZWNiYWE5IGxpYnhs
OiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIHNldCBkZXZpY2VfbW9kZWxfdmVyc2lvbgoKT0suIEkg
d2lsbCBkbyB0aGF0IHRvZGF5LgoKV2VpLgoKPiAKPiAKPiBPbGFmCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
