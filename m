Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274D2B3C6
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 13:59:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVEFe-0006ba-FM; Mon, 27 May 2019 11:57:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVEFc-0006bV-SP
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 11:57:12 +0000
X-Inumbo-ID: 8d16f584-8076-11e9-b6e8-d76c2fac6d90
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d16f584-8076-11e9-b6e8-d76c2fac6d90;
 Mon, 27 May 2019 11:57:08 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: gIkQg2phpqylJW3Dz168f51Xg5uTf0u/RW4vyan/nY57sGSbisVqbajBR8r/SrjJdbM2Y5ebnt
 BP0I1HNneWZpUR7nULga4VMWLV7zyG0Qk0VQUj2bwSj6Jcec1gwmbl1NLPsBLHJ0Euri3j7wO8
 HP2YZyaoKvUDHFjcA+ndgHLQeFwi9FLUTOAS3IHIZh5AXL9NZNmG5ZE2aTVagbZUbuk/M3hpoQ
 GCAvgCKxvIBlifw3OyBDQP52RFGnNgXLY5vusyknytGObxVvTAaXuHxzUYsQvEyKVM72uwGtdS
 dfg=
X-SBRS: 2.7
X-MesageID: 945832
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="945832"
Date: Mon, 27 May 2019 13:56:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190527115649.zhpfcskp7rtpnqdr@Air-de-Roger>
References: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
 <5CD52CEA020000780022D6B1@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD52CEA020000780022D6B1@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Guest Testing in OSSTEST - What distros and
 versions should we test against
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
Cc: Lars Kurth <lars.kurth.xen@gmail.com>, Juergen Gross <jgross@suse.com>,
 committers@xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDE6NDg6NThBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA1LjE5IGF0IDAzOjI4LCA8bGFycy5rdXJ0aC54ZW5AZ21haWwuY29t
PiB3cm90ZToKPiA+IEhpIGFsbCwKPiA+IAo+ID4gZm9sbG93aW5nIGEgZGlzY3Vzc2lvbiB3aXRo
IGNvbW1pdHRlcnMgYWJvdXQgR3Vlc3QgdGVzdGluZyBpbiBPU1NURVNULCBpdCAKPiA+IHN1cmZh
Y2VkIHRoYXQgd2UgaGF2ZSBub3QgdXBkYXRlZCB3aGF0IGRpc3Ryb3Mgd2UgdGVzdCBpbiBPU1NU
RVNUIGZvciBhIHZlcnkgCj4gPiBsb25nIHRpbWUuIEFsbCBhZ3JlZWQgdGhhdCB3ZSBzaG91bGQg
cmVndWxhcmx5IHJldmlldyB3aGF0IHdlIHRlc3QgYWdhaW5zdDogCj4gPiBtYXliZSBhdCB0aGUg
YmVnaW5uaW5nIG9mIGEgcmVsZWFzZSBjeWNsZQo+ID4gCj4gPiBJbiBhbnkgY2FzZSwgY3VycmVu
dGx5IHdlIHRlc3QgYWdhaW5zdAo+ID4gCj4gPiB4ODYgSFZNIGd1ZXN0czoKPiA+ICAgZGViaWFu
LTkuNC4wLXtpMzg2LGFtZDY0fS1DRC0xLmlzbwo+ID4gICByaGVsLXNlcnZlci02LjEtaTM4Ni1k
dmQuaXNvCj4gPiAgIHdpbjEwdjE3MDMteDg2Lmlzbwo+ID4gICB3aW43LXg2NC5pc28KPiA+ICAg
d3MxNi14NjQuaXNvCj4gPiAgIEZyZWVCU0QtMTAuMS1DVVNUT00te2kzODYsYW1kNjR9LTIwMTUw
NTI1LnJhdy54ego+IAo+IFRlc3RpbmcgZml4ZWQgc25hcHNob3RzIChjb21tb25seSB0aGUgb3Jp
Z2luYWwgcmVsZWFzZSBhZmFpY3QpIGluc3RlYWQKPiBvZiBsYXRlc3QgdXBkYXRlcyBpcyBwcmV0
dHkgbWVhbmluZ2xlc3MgaW1vLiBXaGlsZSBJIHdvdWxkIGxpa2UgdG8KPiByZWNvbW1lbmQgdGVz
dGluZyBhbGwgdGhlIChhY3RpdmUpIGRpc3Ryb3Mgb2YgcGFydGllcyBhY3RpdmVseSBpbnZvbHZl
ZAo+IGluIFhlbiBkZXZlbG9wbWVudCwgSSBoYXZlIHRvIGFkbWl0ZSB0aGF0IEkgaGF2ZSBubyBp
ZGVhIGF0IGFsbCBob3cKPiB0aGlzIHdvdWxkIHdvcmsgZm9yIGUuZy4gb3VyIFNMRSB2ZXJzaW9u
cyAoc3VjaCB0aGF0IGxhdGVzdCBiaXRzIHdvdWxkCj4gZ2V0IHRlc3RlZCkuCgpGV0lXLCB0aGlz
IGlzIHdoYXQgb3NzdGVzdCBkb2VzIGluIG9yZGVyIHRvIHRlc3QgRnJlZUJTRCBIRUFELiBJJ20g
bm90CnN1cmUgaG93IG11Y2ggb2YgdGhpcyB3b3VsZCBhcHBseSB0byBTTEUuCgpUaGVyZSdzIGEg
ZGVkaWNhdGVkIEZyZWVCU0QgZmxpZ2h0LCB0aGF0IGRvZXMgdGhlIGZvbGxvd2luZzoKCiAtIElu
c3RhbGwgYSBiYXJlLW1ldGFsIGJveCB1c2luZyB0aGUgbGF0ZXN0IGtub3duIHRvIHdvcmsgaW5z
dGFsbAogICBtZWRpYS4KIC0gRmV0Y2ggRnJlZUJTRCBzb3VyY2VzIGFuZCBidWlsZCBuZXcgaW5z
dGFsbCBtZWRpYSBmcm9tIHNjcmF0Y2guCiAtIFVzZSB0aGUgbmV3bHkgYnVpbHQgbWVkaWEgdG8g
aW5zdGFsbCBhIGJveCBmcm9tIHNjcmF0Y2guCiAtIEJ1aWxkIEZyZWVCU0QgYWdhaW4gdG8gbWFr
ZSBzdXJlIHRoZSBuZXcgdmVyc2lvbiBpcyBjYXBhYmxlIG9mCiAgIGJ1aWxkaW5nIGl0c2VsZiBh
dCBsZWFzdC4KIC0gQnVpbGQgWGVuIHVzaW5nIHRoZSBuZXcgRnJlZUJTRCB2ZXJzaW9uLgoKSWYg
YWxsIG9mIHRob3NlIHN0ZXBzIHN1Y2NlZWQgdGhlIG5ldyB2ZXJzaW9uIGlzIGFub2ludGVkLCBh
bmQgaXQgd2lsbApiZSB1c2VkIGFzIHRoZSBpbnN0YWxsIG1lZGlhIGZvciBuZXcgZmxpZ2h0cy4K
Ck5vdGUgdGhhdCB0aGlzIGlzIGEgdGltZSBjb25zdW1pbmcgcHJvY2Vzcywgc28gbWFraW5nIHRo
aXMgcGFydCBvZiBhCnJlZ3VsYXIgWGVuIGZsaWdodCBpcyBub3QgZmVhc2libGUsIGhlbmNlIHRo
ZSBhbm9pbnRtZW50IGluIG9yZGVyIHRvCnN0b3JlIHRoZSBiaW5hcnkgaW5zdGFsbGVyIHNvIG90
aGVyIGZsaWdodHMgY2FuIHJlLXVzZSBpdC4KCkFsc28gbm90ZSB0aGF0IHRoaXMgcHJvY2VzcyBp
cyBjaXJjdWxhciwgYW5kIG5lZWRzIGFuIGluaXRpYWwgc2VlZAooYmluYXJ5IGluc3RhbGxlcikg
dG8gYmUgbWFudWFsbHkgYW5vaW50ZWQgZm9yIGFsbCB0aGlzIHRvIHdvcmsuCgpSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
