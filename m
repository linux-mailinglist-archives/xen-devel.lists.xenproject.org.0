Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3F1EB80
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 11:55:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQqbP-0002th-Pe; Wed, 15 May 2019 09:53:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQqbO-0002tc-RN
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:53:34 +0000
X-Inumbo-ID: 4a8bd5be-76f7-11e9-a9a3-fb1ba6a40960
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a8bd5be-76f7-11e9-a9a3-fb1ba6a40960;
 Wed, 15 May 2019 09:53:31 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ET7/ECfQSD9ZFeGTcewUrMbdMcjCUYCf6lS0y5kwY3Ziyv7Qgq9lXCrFXJ/atodSzjtvVBE162
 PpmwIr6aLkmbCwyguHPKNh5su3UyyqnXjHeiZduQKmtTycD1kf76/D+vdIHQ5PXr90EPgTF2c6
 I+3dLwyRE+4+9h6/VccSxNfiQck4SRw1gBHe18NgAIIaxbsYVw9LpM8EaJqo5cPxCBNswUPk23
 18Ny4JxF+kGJc07qqsHTfDoVvILJHogCbgoqgMPswtQ5dFYKRUsHvsj//NyZZy3S8CWjiTjMZe
 9SQ=
X-SBRS: 2.7
X-MesageID: 459664
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="459664"
Date: Wed, 15 May 2019 10:53:14 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190515095314.GD3977@zion.uk.xensource.com>
References: <20190514084325.43928-1-elnikety@amazon.com>
 <20190515094711.GM2798@zion.uk.xensource.com>
 <3b441efd-c459-eee5-12c9-6c749fc18689@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b441efd-c459-eee5-12c9-6c749fc18689@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v3] libxl: make vkbd tunable for HVM guests
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTA6NDk6NThBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8wNS8yMDE5IDEwOjQ3LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVHVlLCBN
YXkgMTQsIDIwMTkgYXQgMDg6NDM6MjVBTSArMDAwMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4g
Pj4gRWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2JkIGZyb250ZW5kL2JhY2tlbmQg
cGFpciAoYy9zIGViYmQyNTYxYjRjKS4KPiA+PiBUaGlzIGNvbnN1bWVzIGhvc3QgcmVzb3VyY2Vz
IHVubmVjZXNzYXJpbHkgZm9yIGd1ZXN0cyB0aGF0IGhhdmUgbm8gdXNlIGZvcgo+ID4+IHZrYmQu
IE1ha2UgdGhpcyBiZWhhdmlvdXIgdHVuYWJsZSB0byBhbGxvdyBhbiBhZG1pbmlzdHJhdG9yIHRv
IGNob29zZS4gVGhlCj4gPj4gY29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0t
IEhWTSBndWVzdHMgc3RpbGwgZ2V0IHZrZGIgdW5sZXNzCj4gPj4gc3BlY2lmaWVkIG90aGVyd2lz
ZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEVzbGFtIEVsbmlrZXR5IDxlbG5pa2V0eUBhbWF6
b24uY29tPgo+ID4+IC0tLQo+ID4+ICAgICBDaGFuZ2VzIGluIHYyOgo+ID4+ICAgICAgICAgLSBB
ZGRlZCBhIG1pc3NpbmcgaHVuayAvIHNldHRpbmcgdmtiX2RldmljZSBwZXIgY29uZmlnCj4gPj4K
PiA+PiAgICAgQ2hhbmdlcyBpbiB2MzoKPiA+PiAgICAgICAgIC0gQWRkZWQgZW50cmllcyBpbiBs
aWJ4bC5oIGFuZCBpbiBkb2N1bWVudGF0aW9uCj4gPj4gLS0tCj4gPj4gIGRvY3MvbWFuL3hsLmNm
Zy5wb2QuNS5pbiAgICB8IDQgKysrKwo+ID4gSSB3b25kZXIgd2hlcmUgeW91IGdvdCB0aGlzIGZp
bGUuIDpwCj4gPgo+ID4gVGhlIGNvcnJlY3QgZmlsZSBuYW1lIGlzIHhsLmNmZy41LnBvZC5pbi4K
PiAKPiBJIHJldmVyc2VkIHRoZSAucG9kIGFuZCAuNSBpbiA4NDEwZmNiNTRhYzgwOGMxOWEwMzBj
NmYwZWM2NGU3NjBhYzY0Y2E1Cj4gCj4gVGhpcyBpcyBsaWtlbHkgYSBwYXRjaCBhZ2FpbnN0IDQu
MTEgb3IgZWFybGllci4KCk9oLCB0aGF0IGV4cGxhaW5zIGl0LgoKV2VpLgoKPiAKPiB+QW5kcmV3
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
