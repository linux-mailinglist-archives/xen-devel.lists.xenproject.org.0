Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29922B8E1
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 18:21:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVIKo-00036K-KX; Mon, 27 May 2019 16:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVIKm-00036A-Dg
 for xen-devel@lists.xen.org; Mon, 27 May 2019 16:18:48 +0000
X-Inumbo-ID: 18a3f2cc-809b-11e9-b720-3b33622e99df
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18a3f2cc-809b-11e9-b720-3b33622e99df;
 Mon, 27 May 2019 16:18:44 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: KkNY+Hpt++kjrQBtf5oNqhSY7dtMLpmTZ3WESm3lXS25JyFKrmNzkhIuUNAuKffVWPHY2ZhGFr
 Vwl1RSTWOeTm5mGD5u2hGMJi69cqS/ykMTUjyAvgFjSdWYesUX1kmraukXO7BW5J+MI4/C8Ksm
 q4tRSsiJCZ3P04BzUEJBA6nuHMW3uHTDCkaioOYa+Q9kqEuxfObIZfJ9g0KU//Ho4MhDeMOVsC
 nSR02dr0+RLfYovqvAw5BN7EBoJbV8CEj21114PDmQWOYYmFN/Ly794iCIYeKVTDiQhlkNY/sQ
 kU8=
X-SBRS: 2.7
X-MesageID: 952255
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="952255"
Date: Mon, 27 May 2019 18:18:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190527161832.arry25rh4chyxkio@Air-de-Roger>
References: <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
 <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
 <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
 <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
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
Cc: "John L. Poole" <jlpoole56@gmail.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6Mjc6MzRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBJTU8gaXQgd291bGQgYmUgYmV0dGVyIGlmIHlvdSBjYW4gYnVpbGQgZGlyZWN0
bHkgZnJvbSB0aGUgdXBzdHJlYW0gZ2l0Cj4gcmVwb3NpdG9yeSBbMF0sIHRoYXQgd2F5IHlvdSBj
b3VsZCB1c2UgZ2l0LWJpc2VjdCgxKSBpbiBvcmRlciB0byBmaWd1cmUKPiBvdXQgd2hpY2ggY29t
bWl0IGJyb2tlIHlvdXIgc3lzdGVtLiBGb3IgZXhhbXBsZToKPiAKPiAjIGdpdCBjbG9uZSBnaXQ6
Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdAo+ICMgY2QgeGVuCj4gIyBnaXQgY2hlY2tvdXQgUkVM
RUFTRS00LjcuMAo+ICMgbWFrZSB4ZW4gLWo4Cj4gCj4gVGhhdCBzaG91bGQgZ2l2ZSB5b3UgYSBz
ZXQgb2YgWGVuIGJpbmFyaWVzIGluIHRoZSB4ZW4vIGRpcmVjdG9yeSwgSUlSQwo+IHlvdSBhcmUg
Ym9vdGluZyBmcm9tIEVGSSBzbyB5b3UgbGlrZWx5IG5lZWQgeGVuL3hlbi5lZmkuCj4gCj4gSWYg
dGhhdCB3b3JrcywgdGhlbiB5b3UgY2FuIHRlc3QgUkVMRUFTRS00LjguMCBhbmQgaWYgdGhhdCBm
YWlscyB0bwo+IGJvb3QgeW91IHNob3VsZCBoYXZlIGEgcmFuZ2Ugb2YgY29tbWl0cyB0aGF0IHlv
dSBjYW4gYmlzZWN0IGluIG9yZGVyCj4gdG8gZmluZCB0aGUgY3VscHJpdC4KCkZXSVcsIEkndmUg
YmVlbiB1bmFibGUgdG8gZmluZCBhIGJveCB3aXRoIHRoZSBzYW1lIENQVSBtb2RlbCAoQzI3NTAp
CnRoYXQgeW91IGFyZSB1c2luZy4gSSd2ZSBmb3VuZCBhIGNvdXBsZSBvZiBvbGQgQXRvbSBib3hl
cyB1c2luZwpkaWZmZXJlbnQgQ1BVcyBidXQgdGhleSBhbGwgc2VlbSB0byBib290IGZpbmUgdXNp
bmcgbGF0ZXN0Cnhlbi11bnN0YWJsZS4gSSd2ZSBsb29rZWQgb24gZUJheSBmb3IgdGhhdCBDUFUg
YnV0IGV2ZXJ5dGhpbmcKY29udGFpbmluZyBpdCBpcyBzZXJ2ZXItZ3JhZGUgYW5kID4yMDAkIHdo
aWNoIEknbSBzYWRseSBub3QgZ29pbmcgdG8KcGF5LgoKVW5sZXNzIHlvdSBhcmUgYWJsZSB0byBi
aXNlY3QgdGhlIHRyZWUgYW5kIGdpdmUgdXMgdGhlIGJhZCBjb21taXQKdGhhdCdzIGNhdXNpbmcg
eW91ciBpc3N1ZXMgSSdtIGFmcmFpZCBhdCBsZWFzdCBteXNlbGYgSSB3b24ndCBiZSBhYmxlCnRv
IHByb2dyZXNzIHRoaXMgYW55IGZ1cnRoZXIsIHNvcnJ5LgoKUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
