Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238DE204E3
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREk5-0003Zw-JC; Thu, 16 May 2019 11:40:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREk4-0003Xv-0y
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:40:08 +0000
X-Inumbo-ID: 5a4f7047-77cf-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5a4f7047-77cf-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:40:07 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: BS6ULgE65j/84qGwWFqFWFbs5BhB4FRNdBx4fngmBZ1hlT8eFsEToPtMv0Yyuifag5mxditMzB
 dnOM4x/v59sojsKbVID1cxzCpexS3ah7wLa35AQqgzUT+9CnZCku4BI8iJ+f1w4ihV+NFvzFE0
 ItNx8D6DsJ1xUnZmAPX8PvPmJx84BFwKA6TMP/R1nw4ch4NK66vrqZNdEXjT47vDzvkiTW0Shk
 W2FrnXgY9N3LPUz3L29fJp2mOkG+2pYgv2pCSOO6GUZj/Ncr9a5Q+YogFVLBeTGnuluvPuBR3C
 RiU=
X-SBRS: 2.7
X-MesageID: 506498
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="506498"
Date: Thu, 16 May 2019 12:39:58 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Julien Grall <Julien.Grall@arm.com>
Message-ID: <20190516113958.GA2798@zion.uk.xensource.com>
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
 <20190516112638.GX2798@zion.uk.xensource.com>
 <611b22f7-8125-15e0-6154-93638c2a14ad@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <611b22f7-8125-15e0-6154-93638c2a14ad@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] coverage: GCC coverage libfdt Makefile fix
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Wei Liu <wei.liu2@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6Mzc6MzNBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDE2LzA1LzIwMTkgMTI6MjYsIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBU
aHUsIE1heSAxNiwgMjAxOSBhdCAwMjoxMzo1NFBNICswMzAwLCBWaWt0b3IgTWl0aW4gd3JvdGU6
Cj4gPj4gVGhlIHBhdGNoIHJlc29sdmVzICd4ZW5jb3YnIGNyYXNoZXMgaW4gY2FzZSBvZiBBYXJj
aDY0Lgo+ID4+Cj4gPj4gQWxsIHRoZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRl
ciBib290LAo+ID4+IGl0IG1lYW5zIHRoYXQgYW55dGhpbmcgaW4gLmluaXQuZGF0YSBjYW5ub3Qg
YmUgYWNjZXNzZWQgYW55bW9yZS4KPiA+PiBUaGUgYnVpbGQgc3lzdGVtIGV4cGxpY2l0bHkgY29t
cGlsZXMgYW55IC5pbml0IGJpbmFyeSB3aXRob3V0IGdjb3Ygb3B0aW9uLgo+ID4+IFRoZSBwcm9i
bGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4KPiA+PiBUaGUgZW50aXJlIGxpYnJhcnkgaXMgbW92
ZWQgdG8gLmluaXQgdXNpbmc6Cj4gPj4gJChPQkpDT1BZKSAkKGZvcmVhY2ggcywkKFNFQ1RJT05T
KSwtLXJlbmFtZS1zZWN0aW9uIC4kKHMpPS5pbml0LiQocykpICQ8ICRACj4gPj4gU28gd2UgbmVl
ZCB0byB0ZWxsIHRoZSB0b3AgTWFrZWZpbGUgdG8gZmlsdGVyIG91dCBsaWJmZHQuCj4gPj4KPiA+
PiBSZXBvcnRlZC1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPgo+
ID4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4g
Pj4gVGVzdGVkLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb20+Cj4g
PiAKPiA+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gCj4g
PiBBbHRob3VnaCBJIHdvdWxkIGxpa2UgdG8gYXNrIHlvdSB0byBhZGp1c3QgdGhlIHN1YmplY3Qg
dG8gYmUgbW9yZQo+ID4gc3BlY2lmaWM6Cj4gPiAKPiA+ICAgIGNvdmVyYWdlOiBmaWx0ZXIgb3V0
IGxpYmZkdC5vCj4gPiAKPiA+IGlmIHlvdSBhZ3JlZSwgdGhpcyBjYW4gYmUgZG9uZSB3aGlsZSBj
b21taXR0aW5nLgo+IAo+IFRoZXJlIGFyZSBtb3JlIHRoYW4gdGhhdCB0aGUgdGl0bGUgdG8gZml4
IG9uIGNvbW1pdC4gVGhlIFNpZ25lZC1vZmYtYnkgCj4gYW5kIGRvZXMgbm90IG1hdGNoIHRoZSBG
cm9tIGZvciBpbnN0YW5jZS4KPiAKPiBJIGluaXRpYWxseSBzdWdnZXN0ZWQgdGhlIGNoYW5nZSwg
c28gU3VnZ2VzdGVkLWJ5IHdvdWxkIGJlIG1vcmUgCj4gc3VpdGFibGUuIEFuZCB0aGVuIFZpa3Rv
ciBuZWVkcyB0byBhZGQgaGlzIHNpZ25lZC1vZmYtYnkuCj4gCj4gQWxzbywgY291bGQgd2UgYWxz
byBmaXggbGliZWxmIGF0IHRoZSBzYW1lIHRpbWU/CgorMS4gVmlrdG9yPwoKV2VpLgoKPiAKPiBD
aGVlcnMsCj4gCj4gLS0gCj4gSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
