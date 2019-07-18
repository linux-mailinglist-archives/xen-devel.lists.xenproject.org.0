Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0E6D26E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 18:57:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho9h4-0002YW-Tv; Thu, 18 Jul 2019 16:55:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MdgZ=VP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ho9h2-0002YR-Qe
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 16:55:44 +0000
X-Inumbo-ID: dee863be-a97c-11e9-9afb-87e6bccc5cd4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dee863be-a97c-11e9-9afb-87e6bccc5cd4;
 Thu, 18 Jul 2019 16:55:39 +0000 (UTC)
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
IronPort-SDR: UjOqjFMLVQI1lgcWXosJ+JhmDFGOgqi9hk7wWb95D58mbv4I436BeqRlM+YkUBfetQN7TQbC0t
 b3hy+WBNSMFbpJBZ/dyM82IPv3pmUqGFcNe+uHEWGIM33dtITa/r9cxKl1RkrZWIyh7uz7oOGT
 8Y1BFLARfgQ54FIZE1PdlTwgVjF9LHm4JljR+6m6JdNjRHku2FuUPAWeoRM/CLGEfmubWpMukG
 bRsecUBTNlym5Ih3eET0nCZh5O0N7zSW+Ax9GiasTEZZYAyvAYbSFdKzN6JIIezcmuPweQINrp
 zRM=
X-SBRS: 2.7
X-MesageID: 3136680
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3136680"
Date: Thu, 18 Jul 2019 18:55:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190718165529.wh4vphksuwsxyu66@Air-de-Roger.citrite.net>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717095435.sds3wsivmforlxzj@Air-de-Roger.citrite.net>
 <20190717150912.GW1250@mail-itl>
 <20190718092939.2m3di3dtspsku6jk@Air-de-Roger.citrite.net>
 <20190718151254.GZ1250@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718151254.GZ1250@mail-itl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDU6MTI6NTRQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDExOjI5OjM5QU0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBh
dCAwNTowOToxMlBNICswMjAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4g
PiA+IE9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDExOjU0OjM1QU0gKzAyMDAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDM6MDA6NDJBTSAr
MDIwMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMKPiA+ID4gPiA+IGluZGV4IGU4ODY4OTQuLjUwN2IzZDEgMTAwNjQ0Cj4gPiA+
ID4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+ID4gPiA+ID4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiA+ID4gPiA+IEBAIC04NDUsNiArODQ1LDkg
QEAgaW50IHBjaV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pCj4gPiA+
ID4gPiAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBwZGV2LCAmcHNlZy0+YWxsZGV2c19saXN0
LCBhbGxkZXZzX2xpc3QgKQo+ID4gPiA+ID4gICAgICAgICAgaWYgKCBwZGV2LT5idXMgPT0gYnVz
ICYmIHBkZXYtPmRldmZuID09IGRldmZuICkKPiA+ID4gPiA+ICAgICAgICAgIHsKPiA+ID4gPiA+
ICsgICAgICAgICAgICByZXQgPSAtRUJVU1k7Cj4gPiA+ID4gPiArICAgICAgICAgICAgaWYgKCBw
ZGV2LT5kb21haW4gJiYgcGRldi0+ZG9tYWluICE9IGhhcmR3YXJlX2RvbWFpbiApCj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgc2VlbXMgbGlr
ZSBhbiB1bmxyZWxhdGVkIGZpeD8KPiA+ID4gPiAKPiA+ID4gPiBpZTogcHJldmVudGluZyBkZXZp
Y2UgcmVtb3ZhbCB3aGlsZSBpbiB1c2UgYnkgYSBkb21haW4gZGlmZmVyZW50IHRoYW4KPiA+ID4g
PiBkb20wPwo+ID4gPiAKPiA+ID4gSW5kZWVkIGl0IG1heSB3YXJyYW50IHNlcGFyYXRlIGNvbW1p
dCBub3cuCj4gPiA+IAo+ID4gPiA+IE5vdGUgdGhhdCB5b3UgZG9uJ3QgbmVlZCB0aGUgcGRldi0+
ZG9tYWluICE9IE5VTEwgY2hlY2ssIGp1c3QgZG9pbmcKPiA+ID4gPiBwZGV2LT5kb21haW4gIT0g
aGFyZHdhcmVfZG9tYWluIHNlZW1zIGVub3VnaCwgc2luY2UgeW91IGRvbid0Cj4gPiA+ID4gZGVy
ZWZlcmVuY2UgdGhlIHBkZXYtPmRvbWFpbiBwb2ludGVyIGluIHRoZSBleHByZXNzaW9uICh1bmxl
c3MgSSdtCj4gPiA+ID4gbWlzc2luZyBvdGhlciB1c2FnZXMgYmVsb3cpLgo+ID4gPiAKPiA+ID4g
SSBkb24ndCB3YW50IHRvIHByZXZlbnQgcmVtb3ZhbCBpZiBwZGV2LT5kb21haW4gaXMgTlVMTCAo
aWYgdGhhdCdzIGV2ZW4KPiA+ID4gcG9zc2libGUpLgo+ID4gCj4gPiBCdXQgaWYgcGRldi0+ZG9t
YWluID09IE5VTEwsIHRoZW4gaXQncyBjZXJ0YWlubHkgZ29pbmcgdG8gYmUgZGlmZmVyZW50Cj4g
PiBmcm9tIGhhcmR3YXJlX2RvbWFpbiwgCj4gCj4gRXhhY3RseS4gQW5kIEkgZG8gX25vdF8gd2Fu
dCB0byBoaXQgdGhhdCBicmVhayBpZiBwZGV2LT5kb21haW4gPT0gTlVMTC4KCk9oIHNvcnJ5IGZv
ciBiZWluZyBvYnR1c2UsIHlvdSBhcmUgcmlnaHQuIEluIGFueSBjYXNlLCBwbGVhc2Ugc2VuZAp0
aGlzIGFzIGEgc2VwYXJhdGUgcGF0Y2guCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
