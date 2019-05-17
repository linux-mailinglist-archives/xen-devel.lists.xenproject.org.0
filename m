Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C921BD2
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 18:40:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRfrw-00045X-0S; Fri, 17 May 2019 16:38:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3oPk=TR=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRfru-00045L-IN
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 16:38:02 +0000
X-Inumbo-ID: 220fd934-78c2-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 220fd934-78c2-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 16:38:00 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
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
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: HFIB+00/qLWA20iOL2nHeox111w+mRe/bUnzkQ9BezSP9Wz0K+curEemu0010cu5NTAULDsaMO
 RaG8rHca7NWoIKljCNgVXy6gKJA0cGOON7g0vUgo1P4lShEXcgm33Ro7X4IEIh+0LGZkfrRS4P
 rzcfZ2LFkSQDjegsKGZBTpDNXtlEuPD2bvUcs94vAnoht8IUnckvuuByHZENqjo6DO/vr6TOYX
 Tyr8ExukFhFzGNj3eAa5V82alc9j1PG/liQ416BmAVgMPhnr3RPV2oa9e4WbdCm16T0X2Dbxl2
 oIs=
X-SBRS: 2.7
X-MesageID: 580684
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="580684"
Date: Fri, 17 May 2019 17:37:56 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20190517163756.GP2798@zion.uk.xensource.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
 <20190516151819.168c6b36.olaf@aepfle.de>
 <20190516133037.GH2798@zion.uk.xensource.com>
 <CAKmqyKPjkTJEHe_AR7sqZ+Od34A6ZTU4-N0+rYpLAS1h2HoL6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKmqyKPjkTJEHe_AR7sqZ+Od34A6ZTU4-N0+rYpLAS1h2HoL6g@mail.gmail.com>
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
Cc: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6Mjc6MTlQTSAtMDcwMCwgQWxpc3RhaXIgRnJhbmNp
cyB3cm90ZToKPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCA2OjMwIEFNIFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDAz
OjE4OjE5UE0gKzAyMDAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+ID4gPiBBbSBUaHUsIDE2IE1heSAy
MDE5IDEyOjM5OjAyICswMTAwCj4gPiA+IHNjaHJpZWIgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT46Cj4gPiA+Cj4gPiA+ID4gYXV0b3Rvb2xzIHNoaXBwZWQgaW4gYWxsIHRoZSBkaXN0cm9z
IHdlIGNhcmUgYWJvdXQKPiA+ID4KPiA+ID4gSSBzZWUgYXV0b2NvbmYgMi42OSBpcyBhdmFpbGFi
bGUgcHJhY3RpY2FsbHkgZXZlcnl3aGVyZSwgc3RhcnRpbmcKPiA+ID4gd2l0aCBvcGVuU1VTRSAx
Mi4yLCB3aGljaCB3YXMgcmVsZWFzZWQgaW4gUTMgMjAxMi4gU0xFMTEsIHdoaWNoCj4gPiA+IGNh
biBub3QgYmUgcHJvcGVybHkgc3VwcG9ydGVkIGFueW1vcmUsIGhhZCBhdXRvY29uZiAyLjYzLgo+
ID4gPgo+ID4KPiA+IFRoYW5rcyBmb3IgY2hlY2tpbmchCj4gCj4gT2ssIEkgaGF2ZSB1cGRhdGVk
IHRoZSBwYXRjaCB0byByZW1vdmUgdGhlIGNvbmZpZ3VyZSBzY3JpcHQsIGJ1dCB3ZQo+IHN0aWxs
IGFyZSBzdHVjayB3aXRoIGNvbmZpZy5zdWIgYW5kIGNvbmZpZy5ndWVzcyBhcyB3ZSBhcmUgdXNp
bmcgdGhlCj4gQUNfQ0FOT05JQ0FMX0hPU1QgbWFjcm8gWzFdLiBJIHdpbGwgc2VuZCBhIHYyIHRo
YXQgcmVtb3ZlcyB0aGUKPiBjb25maWd1cmUgc2NyaXB0LCBidXQgdGhpcyBwYXRjaCBpcyBzdGls
bCByZXF1aXJlZC4KPiAKPiAxOiBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2F1dG9jb25m
L21hbnVhbC9hdXRvY29uZi5odG1sI0Nhbm9uaWNhbGl6aW5nCj4gCgpCZWZvcmUgeW91IGdvIGF3
YXkgYW5kIGRvIHdvcmssIHBsZWFzZSB3YWl0IGZvciByZXBseSBmcm9tIElhbi4KCldlaS4KCj4g
QWxpc3RhaXIKPiAKPiA+Cj4gPiBXZWkuCj4gPgo+ID4gPiBPbGFmCj4gPgo+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
