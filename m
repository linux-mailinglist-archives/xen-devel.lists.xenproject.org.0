Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791B02058E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:46:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREn0-0003nj-3c; Thu, 16 May 2019 11:43:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hREmy-0003ne-QO
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:43:08 +0000
X-Inumbo-ID: c4b928ea-77cf-11e9-a307-cbbf0870548a
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4b928ea-77cf-11e9-a307-cbbf0870548a;
 Thu, 16 May 2019 11:43:05 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: L26vUAi309AYlTpofVBXj7q4hEvSpZfSwV5622moY8LXyDYcxLVOzB4P1YOBowRYKm6dEQKhnV
 1LEfKJMcovekb6MWwalbh7HMMtHsqfPFkACyhFFeLLJ2DcF/faUNVfUnmekyg+JKqxvw/+PEpt
 HaArWB342t9612ajeg92wQ/pkeiA1Z8KgckLLA7nPIM5nhCZEz9pQdn8AUoYzNKz1ui1C/3QlS
 BrTbcgif9wyC76yc0KefiNO8bO2p5Gqlc84nX6/fMKXXMnEfkrf2sszlTOZbnC5ypBm1++Gbom
 52Q=
X-SBRS: 2.7
X-MesageID: 497806
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="497806"
Date: Thu, 16 May 2019 13:42:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516114255.7t6re7yot6wp3mom@Air-de-Roger>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516112450.GW2798@zion.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Olaf Hering <ohering@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6MjQ6NTBQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMjo1NzozNVBNICswMjAwLCBPbGFmIEhlcmluZyB3
cm90ZToKPiA+IEFtIFRodSwgMTYgTWF5IDIwMTkgMTI6NDU6NDAgKzAyMDAKPiA+IHNjaHJpZWIg
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+ID4gCj4gPiA+IEhhdmlu
ZyBhIGZpZWxkIGluIGJ1aWxkX2luZm8gd2l0aCBhIGRlZmF1bHQgdmFsdWUgdGhhdCBkZXBlbmRz
IG9uCj4gPiA+IGZpZWxkcyBvdXRzaWRlIG9mIGJ1aWxkX2luZm8gaXMgcHJvYmxlbWF0aWMsIHNp
bmNlIG5vdCBhbGwgY2FsbGVycyBvZgo+ID4gPiBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0
ZGVmYXVsdCBoYXZlIGFjY2VzcyB0byBsaWJ4bF9kb21haW5fY29uZmlnLgo+ID4gCj4gPiBPbmUg
b3B0aW9uIHdvdWxkIGJlIGEgbmV3IEFQSSB0aGF0IGdldHMgYSBsaWJ4bF9kb21haW5fY29uZmln
IGFuZCB3aGljaAo+ID4gY2FsbHMgbGlieGxfX2RvbWFpbl9zZXRfZGV2aWNlX21vZGVsLCBsaWJ4
bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQKPiA+IGFuZCBsaWJ4bF9fZG9tYWluX2J1
aWxkX2luZm9fc2V0ZGVmYXVsdC4gVG8gbWUgaXQgbG9va3MgbGlrZSBjcmVhdGVfZG9tYWluCj4g
PiBjYW4gbm90IGJ1aWxkIGEgcHJvcGVyIGRfY29uZmlnIGFsbCBvbiBpdHMgb3duLCBpdCBqdXN0
IGhhcyBub3QgZW5vdWdoIGluZm8uCj4gCj4gSWYgeW91J3JlIHRhbGtpbmcgYWJvdXQgYWRkaW5n
IGEgbmV3IF9wdWJsaWNfIEFQSToKPiAKPiBUaGUgcHJvYmxlbSB3aXRoIHRoaXMgYXBwcm9hY2gg
aXMgdGhhdCBpdCBkb2Vzbid0IGhlbHAgZXhpc3RpbmcgbGlieGwKPiB1c2Vycy4gVGhleSB3aWxs
IG5lZWQgdG8gYmUgZml4ZWQgYnkgY2FsbGluZyB0aGlzIG5ldyBBUEkuCj4gCj4gV2lsbCBpdCB3
b3JrIGlmIDEpIHlvdSBtYWtlIGxpYnhsX19kb21haW5fc2V0X2RldmljZV9tb2RlbCBpZGVtcG90
ZW50Cj4gYW5kIDIpIGNhbGwgaXQgZnJvbSB3aXRoaW4gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZv
X3NldGRlZmF1bHQgKHdoaWNoCj4gYmFzaWNhbGx5IHJlc3RvcmVzIHRoZSBvcmlnaW5hbCBjb2Rl
IHBhdGggYmVmb3JlIHlvdXIgcGF0Y2gpPwoKQ2FsbGluZyBsaWJ4bF9fZG9tYWluX3NldF9kZXZp
Y2VfbW9kZWwgZnJvbQpsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCB3b3VsZCBy
ZXF1aXJlIHBhc3NpbmcKZG9tYWluX2NvbmZpZyB0byBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9f
c2V0ZGVmYXVsdCwgd2hpY2ggZ2V0cyBiYWNrCnRvIG15IHByb3Bvc2FsLgoKSW4gb3JkZXIgdG8g
a25vdyBpZiBhIFBWIG9yIFBWSCBkb21haW4gcmVxdWlyZXMgYSBkZXZpY2UgbW9kZWwgKGZvcgp0
aGUgUFYgYmFja2VuZHMpIGxpYnhsIG5lZWRzIHRvIGxvb2sgYXQgdGhlIGNvbnRlbnRzIG9mIGRv
bWFpbl9jb25maWcKYmVjYXVzZSB0aGF0J3Mgd2hlcmUgdGhlIGxpc3Qgb2YgZGV2aWNlcyBpcyBz
dG9yZWQuCgpBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4g
ZGV2aWNlIG1vZGVsIGFuZCBQVgpiYWNrZW5kLiBJbiB0aGUgUFYvUFZIIGNhc2UgUUVNVSBpcyBu
b3QgYWN0aW5nIGFzIGEgZGV2aWNlIG1vZGVsIGJ1dApyYXRoZXIgYXMgYSBQViBiYWNrZW5kLCBo
ZW5jZSBpdCBjb3VsZCBiZSBzaWduYWxlZCB1c2luZyBhIGRpZmZlcmVudApmaWVsZCwgdGhhdCBj
b3VsZCBsaXZlIGluIGRvbWFpbl9jb25maWcgaW5zdGVhZCBvZgpkb21haW5fYnVpbGRfaW5mbz8K
ClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
