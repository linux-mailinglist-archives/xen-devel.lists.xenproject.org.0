Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB4F84A0E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:46:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJQ5-0006T1-Nf; Wed, 07 Aug 2019 10:43:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AVeY=WD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hvJQ4-0006Ss-Gn
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:43:48 +0000
X-Inumbo-ID: 3b08d9ac-b900-11e9-a287-733b04eb2f9c
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b08d9ac-b900-11e9-a287-733b04eb2f9c;
 Wed, 07 Aug 2019 10:43:45 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ma7X+zD7mZN/6V+CA+RRxlvifJvDw+4vhJbq2Oe/yD4AuPuc24hzawBDSYPvCRRM6b3bV2cX2s
 6Xk/mc3s7abdHxoN4vJYwZ1FhXC50wHR0QzZuKl6L5KDnMJ6kO/CCb2iSt2UZOO0KJGZ8QkJMq
 RWnrz2i7zGtFbQInmXpjlLrSxag0VKMhsS53FFRSxLSymC6R4W3LPDbcOMvgPRD2fcLzU310T2
 R9TOUIiEi0H+HL9rJS1qi2Cz36XP+JSQJ7/GqUuKO4x03So9dt8xMd4svdNl7/0U3hZWA15uDi
 Vlk=
X-SBRS: 2.7
X-MesageID: 3965753
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="3965753"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23882.43835.104513.850685@mariner.uk.xensource.com>
Date: Wed, 7 Aug 2019 11:43:07 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <20190806172500.6409-1-sstabellini@kernel.org>
References: <20190806172500.6409-1-sstabellini@kernel.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] 9pfs has a QEMU backend
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIltQQVRDSCB2Ml0gOXBmcyBoYXMgYSBRRU1VIGJh
Y2tlbmQiKToKPiBBZGQgOXBmcyB0byB0aGUga2luZCBvZiBQViBkcml2ZXJzIHRoYXQgaGFzIGEg
UUVNVSBiYWNrZW5kLCBzcGVjaWZpY2FsbHkKPiB0byB0aGUgbWFjcm8gUUVNVV9CQUNLRU5ELgo+
IAo+IFRoaXMgaXMgbmVlZGVkIG90aGVyd2lzZSB1cG9uIGRvbWFpbiBkZXN0cm95IHdlIGdldCBh
IHRpbWVvdXQgZXJyb3I6Cj4gCj4gbGlieGw6IGVycm9yOiBsaWJ4bF9kZXZpY2UuYzoxMTMyOmRl
dmljZV9iYWNrZW5kX2NhbGxiYWNrOiBEb21haW4gMTp1bmFibGUgdG8gcmVtb3ZlIGRldmljZSB3
aXRoIHBhdGggL2xvY2FsL2RvbWFpbi8wL2JhY2tlbmQvOXBmcy8xLzAKPiBsaWJ4bDogZXJyb3I6
IGxpYnhsX2RvbWFpbi5jOjExMjk6ZGV2aWNlc19kZXN0cm95X2NiOiBEb21haW4gMTpsaWJ4bF9f
ZGV2aWNlc19kZXN0cm95IGZhaWxlZAo+IAo+IFRoaXMgY2hhbmdlIHNob3VsZCBoYXZlIGJlZW4g
cGFydCBvZiBiNTNiNDAzN2NlZjYgImxpYnhsL3hsOiBhZGQgc3VwcG9ydAo+IGZvciBYZW4gOXBm
cyIuCj4gCj4gQWxzbyBhZGQgYSBjb21tZW50IGluIGxpYnhsX3R5cGVzX2ludGVybmFsLmlkbCB0
byBoZWxwIHJlbWVtYmVyIGNoYW5naW5nCj4gUUVNVV9CQUNLRU5EIGdvaW5nIGZvcndhcmQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29t
PgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKYW5k
IHB1c2hlZC4gIEkgYWRkZWQgImxpYnhsOiAiIHRvIHRoZSBjb21taXQgc3ViamVjdCBsaW5lLgoK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
