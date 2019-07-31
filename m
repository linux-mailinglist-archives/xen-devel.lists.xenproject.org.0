Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5A87BC3A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:50:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hskGq-0005sY-CS; Wed, 31 Jul 2019 08:47:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ohEi=V4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hskGo-0005sS-Re
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:47:38 +0000
X-Inumbo-ID: d616df5c-b36f-11e9-a547-4bbb0d3104ed
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d616df5c-b36f-11e9-a547-4bbb0d3104ed;
 Wed, 31 Jul 2019 08:47:33 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DHynZPKDiSbiw+KQLjbkvFsMdRmclH7PHyM92TpVPam/mPigbELLjYmXzRA1++SJGkK4XN0zVj
 IrpUuximK8KMFeNCQOP8XfdiO6nfQ02vBVkjF7Z7HNMeR9QZeMZLRXq7k1Bn/V/7FGI+zFYb6d
 mCU4aRocd8rdm/XExpIMf8w8sm4wnVI7czCNbA7wNYL1u1Uk0PFODy04RmmPvkdNR3qIN9q21y
 cgAGsQyR5oL1912gYKtEMKcJjS8NFiIAnHapcJsmb+qYjg9OZMuj2sI2t7MOMswHLgzCCdtVqO
 INI=
X-SBRS: 2.7
X-MesageID: 3770637
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,329,1559534400"; 
   d="scan'208";a="3770637"
Date: Wed, 31 Jul 2019 10:47:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190731084723.vjkgdvolsfzuk4tp@Air-de-Roger>
References: <20190730170754.31389-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730170754.31389-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Fix build dependenices for reloc.c
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDY6MDc6NTRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgMjAxZjg1MmVhZiBhZGRlZCBzdGFydF9pbmZvLmggYW5kIGtjb25maWcuaCB0
byByZWxvYy5jLCBidXQgb25seSB1cGRhdGVkCj4gc3RhcnRfaW5mby5oIGluIFJFTE9DX0RFUFMu
Cj4gCj4gVGhpcyBjYXVzZXMgcmVsb2MuYyB0byBub3QgYmUgcmVnZW5lcmF0ZWQgd2hlbiBLY29u
ZmlnIGNoYW5nZXMuICBJdCBpcyBtb3N0Cj4gbm90aWNlYWJsZSB3aGVuIGVuYWJsaW5nIENPTkZJ
R19QVkggYW5kIGZpbmRpbmcgdGhlIHJlc3VsdGluZyBiaW5hcnkgY3Jhc2gKPiBlYXJseSB3aXRo
Ogo+IAo+ICAgKGQ5KSAoWEVOKQo+ICAgKGQ5KSAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqCj4gICAoZDkpIChYRU4pIFBhbmljIG9uIENQVSAwOgo+ICAgKGQ5
KSAoWEVOKSBNYWdpYyB2YWx1ZSBpcyB3cm9uZzogYzJjMmMyYzIKPiAgIChkOSkgKFhFTikgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgKGQ5KSAoWEVOKQo+ICAg
KGQ5KSAoWEVOKSBSZWJvb3QgaW4gZml2ZSBzZWNvbmRzLi4uCj4gICAoWEVOKSBkOXYwIFRyaXBs
ZSBmYXVsdCAtIGludm9raW5nIEhWTSBzaHV0ZG93biBhY3Rpb24gMQo+IAo+IFJlcG9ydGVkLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZS5ycGF1QGNpdHJpeC5jb20+CgpOb3RlIHN1cmUgaWYgaXQn
cyB3b3J0aCBzcGVsbGluZyBvdXQgdGhhdCBtdWx0aWJvb3QuaCBkZXBlbmRlbmN5IHdhcwphbHNv
IG1pc3NpbmcuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
