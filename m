Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F1204AB
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:27:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREVL-0001Oo-UQ; Thu, 16 May 2019 11:24:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREVK-0001Od-8L
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:24:54 +0000
X-Inumbo-ID: 39896d2e-77cd-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 39896d2e-77cd-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:24:53 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: JB36jRYAben3eMlpu6naBQyVCedoKLeYAZ4MRjN/FZOjcFLJV+rFWZ4hYzdeMRyshA4izCTT9f
 axo8yMmwROWeFuvMhebdQbzWKl8I2usYD2mVlD/kbpzoxlOqT/ajbkKeNrH/kSFx0JG+W6iX3l
 ny1X58RQGUvlEMYGBfVEz8QuaMfw7UbUyiYLArfBqcgvWNqrUdGrTjXrNOSaIxi2PZzfwGFoXF
 O9auUuYplu7vzMk/hyh3r4MkosaEe3AMfkVU7xKSSv7REqbU6lthP74i6itfH5/emP7dFvhmS9
 wOA=
X-SBRS: 2.7
X-MesageID: 508436
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="508436"
Date: Thu, 16 May 2019 12:24:50 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <ohering@suse.com>
Message-ID: <20190516112450.GW2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516125735.6c1bf1ca.ohering@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6NTc6MzVQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxMjo0NTo0MCArMDIwMAo+IHNjaHJpZWIgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+IAo+ID4gSGF2aW5nIGEgZmllbGQg
aW4gYnVpbGRfaW5mbyB3aXRoIGEgZGVmYXVsdCB2YWx1ZSB0aGF0IGRlcGVuZHMgb24KPiA+IGZp
ZWxkcyBvdXRzaWRlIG9mIGJ1aWxkX2luZm8gaXMgcHJvYmxlbWF0aWMsIHNpbmNlIG5vdCBhbGwg
Y2FsbGVycyBvZgo+ID4gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQgaGF2ZSBh
Y2Nlc3MgdG8gbGlieGxfZG9tYWluX2NvbmZpZy4KPiAKPiBPbmUgb3B0aW9uIHdvdWxkIGJlIGEg
bmV3IEFQSSB0aGF0IGdldHMgYSBsaWJ4bF9kb21haW5fY29uZmlnIGFuZCB3aGljaAo+IGNhbGxz
IGxpYnhsX19kb21haW5fc2V0X2RldmljZV9tb2RlbCwgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5m
b19zZXRkZWZhdWx0Cj4gYW5kIGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0LiBU
byBtZSBpdCBsb29rcyBsaWtlIGNyZWF0ZV9kb21haW4KPiBjYW4gbm90IGJ1aWxkIGEgcHJvcGVy
IGRfY29uZmlnIGFsbCBvbiBpdHMgb3duLCBpdCBqdXN0IGhhcyBub3QgZW5vdWdoIGluZm8uCgpJ
ZiB5b3UncmUgdGFsa2luZyBhYm91dCBhZGRpbmcgYSBuZXcgX3B1YmxpY18gQVBJOgoKVGhlIHBy
b2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgaXQgZG9lc24ndCBoZWxwIGV4aXN0aW5n
IGxpYnhsCnVzZXJzLiBUaGV5IHdpbGwgbmVlZCB0byBiZSBmaXhlZCBieSBjYWxsaW5nIHRoaXMg
bmV3IEFQSS4KCldpbGwgaXQgd29yayBpZiAxKSB5b3UgbWFrZSBsaWJ4bF9fZG9tYWluX3NldF9k
ZXZpY2VfbW9kZWwgaWRlbXBvdGVudAphbmQgMikgY2FsbCBpdCBmcm9tIHdpdGhpbiBsaWJ4bF9f
ZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCAod2hpY2gKYmFzaWNhbGx5IHJlc3RvcmVzIHRo
ZSBvcmlnaW5hbCBjb2RlIHBhdGggYmVmb3JlIHlvdXIgcGF0Y2gpPwoKV2VpLgoKCj4gCj4gT2xh
ZgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
