Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F22C084
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 09:45:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVWji-0006Nw-Nl; Tue, 28 May 2019 07:41:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2UAK=T4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVWjh-0006Nr-H2
 for xen-devel@lists.xen.org; Tue, 28 May 2019 07:41:29 +0000
X-Inumbo-ID: fff69249-811b-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fff69249-811b-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 07:41:27 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
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
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: a9Ap0zu1bKQCHmsqN8BuK23bM2CQBlNpKU8VZZieE6D35ThOsj0LJpWPkBRnOcwg1fDZnn40F0
 LKeWPZFie9jEN0qWM+8ecbR/mlByVNjaA7VaMPhNqCrj3qPHR19ObJZlMzvVI22IMoVgc32A3U
 Q3Q2Un6+sCPCIc+C4kCyClyamGYtUeMHLfDh0QjsrPsLZdpMPt107//OlWg8XMw5fZ0VVo19V2
 sMsVjag23oCMVO/2h5YvEFmpNiv1Twypg8+1oRygG2jrKRLVuoWdUILPdy4cKh+G9eT6klMoAP
 /E8=
X-SBRS: 2.7
X-MesageID: 971848
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,521,1549947600"; 
   d="scan'208";a="971848"
Date: Tue, 28 May 2019 09:41:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <20190528074113.4o7e4did46e4yymb@Air-de-Roger>
References: <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
 <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
 <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
 <20190527161832.arry25rh4chyxkio@Air-de-Roger>
 <b00833f8-22a2-3f1e-65f6-7a4178377ee1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b00833f8-22a2-3f1e-65f6-7a4178377ee1@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
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
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDM6MzU6MjFQTSAtMDcwMCwgSm9obiBMLiBQb29sZSB3
cm90ZToKPiAKPiBPbiA1LzI3LzIwMTkgOToxOCBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA1OjI3OjM0UE0gKzAyMDAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6Cj4gPiA+IElNTyBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgeW91IGNhbiBidWls
ZCBkaXJlY3RseSBmcm9tIHRoZSB1cHN0cmVhbSBnaXQKPiA+ID4gcmVwb3NpdG9yeSBbMF0sIHRo
YXQgd2F5IHlvdSBjb3VsZCB1c2UgZ2l0LWJpc2VjdCgxKSBpbiBvcmRlciB0byBmaWd1cmUKPiA+
ID4gb3V0IHdoaWNoIGNvbW1pdCBicm9rZSB5b3VyIHN5c3RlbS4gRm9yIGV4YW1wbGU6Cj4gPiA+
IAo+ID4gPiAjIGdpdCBjbG9uZSBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdAo+ID4gPiAj
IGNkIHhlbgo+ID4gPiAjIGdpdCBjaGVja291dCBSRUxFQVNFLTQuNy4wCj4gPiA+ICMgbWFrZSB4
ZW4gLWo4Cj4gPiA+IAo+ID4gPiBUaGF0IHNob3VsZCBnaXZlIHlvdSBhIHNldCBvZiBYZW4gYmlu
YXJpZXMgaW4gdGhlIHhlbi8gZGlyZWN0b3J5LCBJSVJDCj4gPiA+IHlvdSBhcmUgYm9vdGluZyBm
cm9tIEVGSSBzbyB5b3UgbGlrZWx5IG5lZWQgeGVuL3hlbi5lZmkuCj4gPiA+IAo+ID4gPiBJZiB0
aGF0IHdvcmtzLCB0aGVuIHlvdSBjYW4gdGVzdCBSRUxFQVNFLTQuOC4wIGFuZCBpZiB0aGF0IGZh
aWxzIHRvCj4gPiA+IGJvb3QgeW91IHNob3VsZCBoYXZlIGEgcmFuZ2Ugb2YgY29tbWl0cyB0aGF0
IHlvdSBjYW4gYmlzZWN0IGluIG9yZGVyCj4gPiA+IHRvIGZpbmQgdGhlIGN1bHByaXQuCj4gPiBG
V0lXLCBJJ3ZlIGJlZW4gdW5hYmxlIHRvIGZpbmQgYSBib3ggd2l0aCB0aGUgc2FtZSBDUFUgbW9k
ZWwgKEMyNzUwKQo+ID4gdGhhdCB5b3UgYXJlIHVzaW5nLiBJJ3ZlIGZvdW5kIGEgY291cGxlIG9m
IG9sZCBBdG9tIGJveGVzIHVzaW5nCj4gPiBkaWZmZXJlbnQgQ1BVcyBidXQgdGhleSBhbGwgc2Vl
bSB0byBib290IGZpbmUgdXNpbmcgbGF0ZXN0Cj4gPiB4ZW4tdW5zdGFibGUuIEkndmUgbG9va2Vk
IG9uIGVCYXkgZm9yIHRoYXQgQ1BVIGJ1dCBldmVyeXRoaW5nCj4gPiBjb250YWluaW5nIGl0IGlz
IHNlcnZlci1ncmFkZSBhbmQgPjIwMCQgd2hpY2ggSSdtIHNhZGx5IG5vdCBnb2luZyB0bwo+ID4g
cGF5Lgo+ID4gCj4gPiBVbmxlc3MgeW91IGFyZSBhYmxlIHRvIGJpc2VjdCB0aGUgdHJlZSBhbmQg
Z2l2ZSB1cyB0aGUgYmFkIGNvbW1pdAo+ID4gdGhhdCdzIGNhdXNpbmcgeW91ciBpc3N1ZXMgSSdt
IGFmcmFpZCBhdCBsZWFzdCBteXNlbGYgSSB3b24ndCBiZSBhYmxlCj4gPiB0byBwcm9ncmVzcyB0
aGlzIGFueSBmdXJ0aGVyLCBzb3JyeS4KPiA+IAo+ID4gUm9nZXIuCj4gSSBhdHRlbXB0ZWQgdG8g
d29yayBiYWNrd2FyZHMgYW5kIHJhbiBpbnRvIGEgbmlnaHRtYXJlIHdpdGggR2VudG9vLsKgwqAg
SSBrZXB0Cj4gZ2V0dGluZyBjb21waWxlciBlcnJvcnMgd2hpY2ggSSBzdXNwZWN0IHdhcyBhIHJl
c3VsdCBvZiBoYXZpbmcgYSBuZXdlcgo+IHZlcnNpb24KPiBvZiBHQ0MgYW5kIG90aGVyIHRoaW5n
cy7CoCBJdCdzIG5vdCBhbiBlYXN5IHRoaW5nIHRvIHRyYXZlbAo+IGJhY2sgaW4gdGltZSBpbiBH
ZW50b28gYmVjYXVzZSBldmVyeXRoaW5nIGtlZXBzIGdldHRpbmcgdXBncmFkZWQuwqAgSSBqdXN0
Cj4gY2Fubm90IG1ha2UgdGhlIHRpbWUgbm93IHRvIHVucmF2ZWwgdGhpcyBhcyBJIGhhdmUgc29t
ZSBkZW1hbmRzIG9uIG15IHRpbWUKPiBhbmQgd2lsbCBiZSBlbmdhZ2VkIGZvciB0aGUgbmV4dCBm
b3VyIHRvIHNpeCB3ZWVrcy4KCklNTyB5b3VyIGJlc3QgYmV0IGlzIHRvIGJ1aWxkIFhlbiB1c2lu
ZyBEZWJpYW4gc3RyZXRjaCwgdGhhdCdzIHVzZWQgYnkKdGhlIFhlbiB0ZXN0IHN5c3RlbSwgYW5k
IGlzIGxpa2VseSB0byBiZSBhYmxlIHRvIGJ1aWxkIHRoZSBkaWZmZXJlbnQKWGVuIHZlcnNpb25z
LCBzdGFibGUtKiBicmFuY2hlcyB0ZXN0ZWQgYnkgb3NzdGVzdCBzaG91bGQgYnVpbGQgb24Kc3Ry
ZXRjaC4KCldoYXQgSSd2ZSBkb25lIGluIHRoZSBwYXN0IGlmIHRoYXQgYWxzbyB0cmlnZ2VycyBj
b21waWxlciBlcnJvcnMgaXMgdG8KYnVpbGQgYSBjaHJvb3Qgd2l0aCBhbiBvbGRlciB2ZXJzaW9u
IG9mIERlYmlhbiBhbmQgdGhlbiBidWlsZCBYZW4KaW5zaWRlIG9mIGl0LiBZb3UgY2FuIGRvIHRo
aXMgaW4gYSBib3ggZGlmZmVyZW50IGZyb20gdGhlIG9uZSB5b3UgYXJlCnRlc3RpbmcsIGllOiB5
b3UgY291bGQgY3JlYXRlIGEgRGViaWFuIFZNIGFuZCBidWlsZCBYZW4gZnJvbSB0aGVyZS4KCk5v
dGUgdGhhdCBpbiBvcmRlciB0byBiaXNlY3QgdGhpcyBpc3N1ZSB5b3Ugb25seSBuZWVkIHRvIGJ1
aWxkIHRoZSBYZW4Ka2VybmVsIChtYWtlIHhlbiwgbm8gbmVlZCB0byBydW4gLi9jb25maWd1cmUp
LCB0aGVyZSdzIG5vIG5lZWQgdG8KYnVpbGQgdGhlIHRvb2xzLCBoZW5jZSB5b3UgbmVlZCBhbG1v
c3Qgbm8gZGVwZW5kZW5jaWVzIGluc3RhbGxlZCBvbgp0aGUgYnVpbGRlci4KCkkndmUgZG9uZSBh
IGJ1aWxkIG9mIHRoZSBzdGFibGUtNC43IGJyYW5jaCBteXNlbGYgYW5kIHVwbG9hZGVkIHRoZQpo
eXBlcnZpc29yIGJpbmFyaWVzIHRvOgoKaHR0cDovL3hlbmJpdHMueGVuLm9yZy9wZW9wbGUvcm95
Z2VyL3N0YWJsZS00LjcvCgpDb3VsZCB5b3UgZ2l2ZSB0aG9zZSBhIHRyeSAoSSB3YXNuJ3Qgc3Vy
ZSB3aGV0aGVyIHlvdSBuZWVkIHhlbi5neiBvcgp4ZW4uZWZpIHNvIEkndmUgdXBsb2FkZWQgYm90
aCkgYW5kIHNlZSBpZiB5b3Ugc3RpbGwgaGF2ZSBpc3N1ZXMKYm9vdGluZz8KClRlc3RpbmcgdGhv
c2UgYmluYXJpZXMgc2hvdWxkIGJlIGFzIHNpbXBsZSBhcyBwbGFjaW5nIHRoZW0gaW4gL2Jvb3Qv
CmFuZCBmaXhpbmcgeW91ciBib290bG9hZGVyIGNvbmZpZ3VyYXRpb24gdG8gYm9vdCBmcm9tIHRo
b3NlLiBQbGVhc2UKc2VuZCB0aGUgc2VyaWFsIGxvZyB3aGVuIGJvb3RpbmcgZnJvbSB0aGUgcHJv
dmlkZWQgYmluYXJpZXMuCgo+IEhvdyBtdWNoIHdvdWxkIGl0IGNvc3QgZm9yIHlvdSB0byBvYnRh
aW4gdGhlIG1hY2hpbmUgeW91IG5lZWQ/IEkgbWF5Cj4gY29uc2lkZXIgcGF5aW5nIGZvciBpdC4g
SSBib3VnaHQgdGhpcyBBdG9tIHNlcnZlciBqdXN0IHRvIGVjb25vbWljYWxseSBydW4KPiBYZW4g
c28gdGhlIG1hY2hpbmUgaGFzIG1hcmdpbmFsIHZhbHVlIHRvIG1lIGlmIEkgY2Fubm90IHJ1biBY
ZW4gb24gaXQuCgpFdmVuIGlmIHdlIGdvIHRoYXQgcm91dGUsIHRoZXJlJ3Mgbm8gZ3VhcmFudGVl
IHRoYXQgSSB3b3VsZCBiZSBhYmxlIHRvCmZpeCB0aGUgaXNzdWUsIGFuZCB0aGVyZSdzIGFsc28g
dGhlIHBvc3NpYmlsaXR5IHRoYXQgdGhlIGhhcmR3YXJlIHlvdQpoYXZlIGlzIHNvbWVob3cgYnJv
a2VuLCBhbmQgdGhhdCB0aGUgbmV3IG9uZSB3b24ndCBleGhpYml0IHRoaXMgaXNzdWUuCgpSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
