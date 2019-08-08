Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DBB86057
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:48:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfvs-0003uj-EK; Thu, 08 Aug 2019 10:46:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvfvr-0003uc-1N
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:46:07 +0000
X-Inumbo-ID: b8b90ce4-b9c9-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b8b90ce4-b9c9-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 10:46:05 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NadQIsAcnjp7EmaTgrIoVN21iVu/T3zkib1J0gnqpJNT1+iwM1frDDymzn2BW5WHIoxKwxIz4L
 MORPd0gV7AyvkA2GwaZyBsmOHWO9zfYVRtLLrHM7J8gXos0Qs0ar8wW2rvydVSDUReJ5TLqsYl
 aZkXqwKpKvEQ9i5yG5YlM7ygvUksSCZ3AcV5HSIGDZgnxq6EV5Kt1Wh4+wncVfYT/6oig5tcz7
 og0Ni5Je477ZONjDXdK3I+kbZsFAY0vRRNBS9BJ7MbOH7xhTqvT6C71t250fgq2Yx7psW/clw7
 koQ=
X-SBRS: 2.7
X-MesageID: 4017724
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4017724"
Date: Thu, 8 Aug 2019 12:45:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190808104558.vm6dfic5dntjsnt4@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-23-anthony.perard@citrix.com>
 <20190807150849.b6alhjw2lgcjpmxx@Air-de-Roger>
 <20190808104118.GS1242@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808104118.GS1242@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 22/35]
 OvmfPkg/XenPlatformPei: no hvmloader: get the E820 table via hypercall
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMTE6NDE6MThBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6MTQ6MzNQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDA0OjM5OjMxUE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBXaGVuIHRoZSBYZW4gUFZIIGVudHJ5
IHBvaW50IGhhcyBiZWVuIHVzZWQsIGh2bWxvYWRlciBoYXNuJ3QgcnVuIGFuZAo+ID4gPiBoYXNu
J3QgcHJlcGFyZWQgYW4gRTgyMCB0YWJsZS4gVGhlIG9ubHkgd2F5IGxlZnQgdG8gZ2V0IGFuIEU4
MjAgdGFibGUKPiA+ID4gaXMgdG8gYXNrIFhlbiB2aWEgYW4gaHlwZXJjYWxsLCB0aGUgY2FsbCBj
YW4gb25seSBiZSBtYWRlIG9uY2Ugc28ga2VlcAo+ID4gPiB0aGUgcmVzdWx0IGNhY2hlZCBmb3Ig
bGF0ZXIuCj4gPiAKPiA+IEkgdGhpbmsgd2UgYWdyZWVkIHRoYXQgdGhlIGFib3ZlIGlzIG5vdCB0
cnVlLCBhbmQgdGhhdCB0aGUgbWVtb3J5Cj4gPiBtYXAgY2FuIGJlIGZldGNoZWQgYXMgbWFueSB0
aW1lcyBhcyBkZXNpcmVkIHVzaW5nIHRoZSBoeXBlcmNhbGwKPiA+IGludGVyZmFjZS4KPiAKPiBZ
ZXMsIEknbGwgY2hhbmdlIHRoZSBjb21taXQgbWVzc2FnZS4gSG93IGFib3V0Ogo+IAo+ICAgV2hl
biB0aGUgWGVuIFBWSCBlbnRyeSBwb2ludCBoYXMgYmVlbiB1c2VkLCBodm1sb2FkZXIgaGFzbid0
IHJ1biBhbmQKPiAgIGhhc24ndCBwcmVwYXJlZCBhbiBFODIwIHRhYmxlLiBUaGUgb25seSB3YXkg
bGVmdCB0byBnZXQgYW4gRTgyMCB0YWJsZQo+ICAgaXMgdG8gYXNrIFhlbiB2aWEgYW4gaHlwZXJj
YWxsLiAgV2Uga2VlcCB0aGUgcmVzdWx0IGNhY2hlZCB0byBhdm9pZAo+ICAgbWFraW5nIGEgc2Vj
b25kIGh5cGVyY2FsbCB3aGljaCB3b3VsZCBnaXZlIHRoZSBzYW1lIHJlc3VsdC4KCkxHVE0sIHRo
YW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
