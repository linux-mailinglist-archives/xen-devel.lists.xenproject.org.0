Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB31121BCE
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 18:40:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRfrM-00042o-L9; Fri, 17 May 2019 16:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3oPk=TR=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRfrK-00042i-QG
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 16:37:26 +0000
X-Inumbo-ID: 0b4101aa-78c2-11e9-98b2-13158763c6ea
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b4101aa-78c2-11e9-98b2-13158763c6ea;
 Fri, 17 May 2019 16:37:22 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: W57rad8K0k9uENBP+AUUoQxuA23+LlaVub6v8JGAOfJmKWkrJNSVIGZoEHsdsl9YE+fdvQlJyg
 c7oGJueKpb4oeq62VCInDt5tw01Eezq2AxG+ERivTIv7Y+rtnFmLG7YgreqlH0c6nGdgEDel4R
 OyNhifeth2zbUNZQfLHOc9W/+pkHl0MZrQq+Q4y5GzNkPhhYCQ2vxZ/w69yAXGYs6AL/0EH3Ao
 y/2cD+Bb9D5BYoWsyTHpo14TatlkUB93tN2UenpVCpRHbpQbH11ZnYTr9sw/0wMT1I1U/JAxsy
 Q/o=
X-SBRS: 2.7
X-MesageID: 568227
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="568227"
Date: Fri, 17 May 2019 17:37:19 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20190517163719.GO2798@zion.uk.xensource.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <CAKmqyKNs8U4o9PJUF6pLMLrRMs4=f8OwDV1a=2fyatMqzdnbfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKmqyKNs8U4o9PJUF6pLMLrRMs4=f8OwDV1a=2fyatMqzdnbfA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: Wei Liu <wei.liu2@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6MjU6MzZQTSAtMDcwMCwgQWxpc3RhaXIgRnJhbmNp
cyB3cm90ZToKPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAzOjMxIEFNIEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPj4+IE9uIDE2LjA1LjE5IGF0IDAyOjAy
LCA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPiB3cm90ZToKPiA+ID4gU2lnbmVkLW9mZi1ieTog
QWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgo+ID4KPiA+IEF0IGxl
YXN0IHRvIG1lIGl0IGlzIGZhciBmcm9tIG9idmlvdXMgd2h5IHdlIHdvdWxkIHdhbnQvbmVlZCB0
bwo+ID4gZG8gdGhpcyB1cGRhdGUsIG9yIHdoZXJlIHRoZSBjYW5vbmljYWwgImxhdGVzdCB2ZXJz
aW9uIiBsaXZlcyBhbmQKPiA+IGhlbmNlIHdoZXJlIHRoaXMgaXMgY29taW5nIGZyb20uIEFub3Ro
ZXIgcXVlc3Rpb24gbWlnaHQgYmUKPiA+IHdoZXRoZXIgaXQgaXMgYSBnb29kIHRoaW5nIHRvIHB1
bGwgdGhpcyBpbiBhcyBhIHNpbmdsZSBibG9iIChjb3ZlcmluZwo+ID4gYSBnYXAgb2YgNyB5ZWFy
cyksIHRodXMgcHJlc3VtYWJseSBhbHNvIGRpc2NhcmRpbmcgYXV0aG9yc2hpcAo+ID4gb2YgZG96
ZW5zIG9mIHBlb3BsZS4gQnV0IG9mIGNvdXJzZSwgaW4gdGhlIGVuZCBpdCdzIHRoZSBwZW9wbGUK
PiA+IHlvdSd2ZSBDYy1lZCB3aG8gbmVlZCB0byBkZWNpZGUgd2hldGhlciB0aGlzIGlzIGZpbmUg
dG8gdGFrZSBpbgo+ID4gdGhpcyBzaGFwZS4KPiAKPiBObyBib2R5IHNob3VsZCBiZSBlZGl0aW5n
IHRoaXMgZmlsZS4gSWRlYWxseSBpdCB3b3VsZCBiZSBhdXRvZ2VuZXJhdGVkCj4gYnkgYXV0b2Nv
bmYsIGJ1dCBhcyB3ZSBkZWZpbmUgQUNfQ0FOT05JQ0FMX0hPU1QgdGhlIGZpbGUgaXMgbm90Cj4g
Z2VuZXJhdGVkIChzZWUgWzFdKS4KPiAKPiBJIGhhdmUgdXBkYXRlZCB0aGUgY29tbWl0IHRvIGlu
Y2x1ZGUgdGhlIHVwc3RyZWFtIFNIQSB3aGVyZSB3ZSBhcmUKPiBnZXR0aW5nIHRoZSBmaWxlIGZy
b20uCj4gCj4gVGhlIGN1cnJlbnQgZmlsZSBpcyBzbyBvbGQgdGhhdCBpdCBkb2Vzbid0IHN1cHBv
cnQgbmV3IGFyY2hpdGVjdHVyZXMKPiBzdWNoIGFzIFJJU0MtVi4KPiAKCkkgdGhpbmsgdGhpcyBp
cyBhIHN0cm9uZyBhcmd1bWVudCBmb3IgdXBkYXRpbmcgY29uZmlnLnN1Yi4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
