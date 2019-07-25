Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C774C70
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 13:06:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqbX1-0004Se-33; Thu, 25 Jul 2019 11:03:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqbWz-0004SV-Ty
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 11:03:29 +0000
X-Inumbo-ID: d33afc08-aecb-11e9-81bd-2f8e9d6ffc03
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d33afc08-aecb-11e9-81bd-2f8e9d6ffc03;
 Thu, 25 Jul 2019 11:03:26 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fyjYNnGPqj5nyRzSN9nQSD9nyNq78atAUuffswnMBsnPdGeuqiALL86XOmO+Bki3ZVkcOwpqqu
 rETvLk5h8/jBAG2ekZoQYzCll0gvCrjC0aO7FYmtG9p2IsOpjlWNGHlknjGEvoHn4L6n2cW3Xh
 PLBJ6BC5oy4eD89BdnJfVg92pzwhk4Eh2Ek2394MDD0v7Lr9bYW9q7TJJILhJWQe/EXgF+YHpd
 hg70c1729nruJxMrp3mbAf8qbnBVLFrw8Qb7zHeoJ3X9raJt7nS57Do1XgeoKGuBi8rI/O9G8d
 iVo=
X-SBRS: 2.7
X-MesageID: 3525494
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3525494"
Date: Thu, 25 Jul 2019 13:03:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190725110310.2egzbmy6kdpp5fep@Air-de-Roger>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-25-anthony.perard@citrix.com>
 <20190715141521.aqmpchgzyleoergc@MacBook-Air-de-Roger.local>
 <20190722145319.GG1208@perard.uk.xensource.com>
 <20190723094207.ccnzyzuma4ydpugi@Air-de-Roger>
 <20190724161759.GB1242@perard.uk.xensource.com>
 <20190725090829.yiq2wpszksp5n2ab@Air-de-Roger>
 <20190725100534.GC1242@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725100534.GC1242@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 24/35] OvmfPkg/XenPlatformPei: Rework
 memory detection
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
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTE6MDU6MzRBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTE6MDg6MjlBTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0IDA1OjE3OjU5UE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBh
dCAxMTo0MjowN0FNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+IE9uIE1v
biwgSnVsIDIyLCAyMDE5IGF0IDAzOjUzOjE5UE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3Rl
Ogo+ID4gPiA+ID4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDQ6MTU6MjFQTSArMDIwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiA+ID4gT24gVGh1LCBKdWwgMDQsIDIwMTkgYXQg
MDM6NDI6MjJQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gKyAg
ICAgIC8vIGVycm9yIG1lc3NhZ2U6IENwdUR4ZTogSW50ZXJzZWN0TWVtb3J5RGVzY3JpcHRvcjoK
PiA+ID4gPiA+ID4gPiArICAgICAgLy8gICAgICAgIGRlc2MgW0ZDMDAwMDAwLCAxMDAwMDAwMDAp
IHR5cGUgMSBjYXAgODcwMDAwMDAwMDAyNjAwMQo+ID4gPiA+ID4gPiA+ICsgICAgICAvLyAgICAg
ICAgY29uZmxpY3RzIHdpdGggYXBlcnR1cmUgW0ZFRTAwMDAwLCBGRUUwMTAwMCkgY2FwIDEKPiA+
ID4gPiA+ID4gPiAgICAgICAgLy8KPiA+ID4gPiA+ID4gPiAtICAgICAgaWYgKEVudHJ5LT5UeXBl
ICE9IEVmaUFjcGlBZGRyZXNzUmFuZ2VNZW1vcnkpIHsKPiA+ID4gPiA+ID4gPiAtICAgICAgICBj
b250aW51ZTsKPiA+ID4gPiA+ID4gPiArICAgICAgaWYgKCFYZW5Idm1sb2FkZXJEZXRlY3RlZCAo
KSkgewo+ID4gPiA+ID4gPiA+ICsgICAgICAgIEFkZFJlc2VydmVkTWVtb3J5QmFzZVNpemVIb2Ig
KEJhc2UsIEVuZCAtIEJhc2UsIEZBTFNFKTsKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoaXMg
c3BlY2lhbCBjYXNpbmcgZm9yIFBWSCBsb29rcyB3ZWlyZCwgaWRlYWxseSB3ZSB3b3VsZCBsaWtl
IHRvIHVzZQo+ID4gPiA+ID4gPiB0aGUgc2FtZSBjb2RlIHBhdGgsIG9yIGVsc2UgaXQgc2hvdWxk
IGJlIGV4cGxpY2l0bHkgbWVudGlvbmVkIHdoeSBQVkgKPiA+ID4gPiA+ID4gaGFzIGRpdmVyZ2lu
ZyBiZWhhdmlvdXIuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgdGhpbmsgaHZtbG9hZGVyIGlzIHRo
ZSBpc3N1ZSByYXRoZXIgdGhhbiBQVkguIEhlcmUgaXMgcGFydCBvZiB0aGUKPiA+ID4gPiA+ICJt
ZW1vcnkgbWFwIiBhcyBmb3VuZCBpbiBodm1sb2FkZXIvY29uZmlnLmg6Cj4gPiA+ID4gPiAKPiA+
ID4gPiA+ICAgLyogU3BlY2lhbCBCSU9TIG1hcHBpbmdzLCBldGMuIGFyZSBhbGxvY2F0ZWQgZnJv
bSBoZXJlIHVwd2FyZHMuLi4gKi8KPiA+ID4gPiA+ICAgI2RlZmluZSBSRVNFUlZFRF9NRU1CQVNF
ICAgICAgICAgICAgICAweEZDMDAwMDAwCj4gPiA+ID4gPiAgIC8qIE5CLiBBQ1BJX0lORk9fUEhZ
U0lDQUxfQUREUkVTUyAqTVVTVCogbWF0Y2ggZGVmaW5pdGlvbiBpbiBhY3BpL2RzZHQuYXNsISAq
Lwo+ID4gPiA+ID4gICAjZGVmaW5lIEFDUElfSU5GT19QSFlTSUNBTF9BRERSRVNTICAgIDB4RkMw
MDAwMDAKPiA+ID4gPiA+ICAgI2RlZmluZSBSRVNFUlZFRF9NRU1PUllfRFlOQU1JQ19TVEFSVCAw
eEZDMDAxMDAwCj4gPiA+ID4gPiAgICNkZWZpbmUgUkVTRVJWRURfTUVNT1JZX0RZTkFNSUNfRU5E
ICAgMHhGRTAwMDAwMAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBhbmQgaHZtbG9hZGVyIHNpbXBseSBj
cmVhdGVzIGEgc2luZ2xlIGU4MjAgcmVzZXJ2ZWQgZW50cnksIGZyb20KPiA+ID4gPiA+IFJFU0VS
VkVEX01FTUJBU0UgdG8gdGhlIHRvcCBvZiA0R0IuIEl0J3MgcHJvYmFibHkgdG9vIG11Y2guCj4g
PiA+ID4gCj4gPiA+ID4gQnV0IGlzbid0IHRoaXMga2luZCBvZiBkYW5nZXJvdXM/IEhvdyBjYW4g
eW91IGFzc3VyZSBmdXR1cmUgdmVyc2lvbnMKPiA+ID4gPiBvZiBodm1sb2FkZXIgd29uJ3QgdXNl
IHRoaXMgc3BhY2U/Cj4gPiA+ID4gCj4gPiA+ID4gPiBJZiBodm1sb2FkZXIgb25seSByZXNlcnZl
ZAo+ID4gPiA+ID4gQUNQSV9JTkZPX1BIWVNJQ0FMX0FERFJFU1MtUkVTRVJWRURfTUVNT1JZX0RZ
TkFNSUNfRU5ELCBJIG1pZ2h0IG5vdCBoYXZlCj4gPiA+ID4gPiB0byBzcGVjaWFsIGNhc2UgaHZt
bG9hZGVyLgo+ID4gPiA+IAo+ID4gPiA+IENvdWxkIHdlIGxvb2sgaW50byBnZXR0aW5nIHRoaXMg
Zml4ZWQgaW4gaHZtbG9hZGVyIHRoZW4/Cj4gPiA+ID4gCj4gPiA+ID4gSSB0aGluayBpdCdzIGRh
bmdlcm91cyBmb3IgT1ZNRiB0byBwbGF5IHN1Y2ggdHJpY2tzIHdpdGggdGhlIG1lbW9yeQo+ID4g
PiA+IG1hcC4KPiA+ID4gPiAKPiA+ID4gPiA+IEFzIGZhciBhcyBJIGtub3cgMHhmZWUwMDAwMCBp
c24ndCBhIHNwZWNpYWwKPiA+ID4gPiA+IGJpb3MgbWFwcGluZywgYnV0IHNvbWV0aGluZyB0aGUg
aGFyZHdhcmUgcHJvdmlkZXMuCj4gPiA+ID4gCj4gPiA+ID4gWWVzLCB0aGF0J3MgdXNlZCBieSB0
aGUgbGFwaWMsIHNvIGl0J3Mgbm90IHNwZWNpZmljIHRvIGh2bWxvYWRlci4KPiA+ID4gCj4gPiA+
IFJpZ2h0LCBJJ3ZlIGdvdCBhIGNsb3NlciBsb29rIGF0IHRoYXQgQ3B1RHhlIG1vZHVsZSwgaXQg
d2FudHMgdGhlIGxvY2FsCj4gPiA+IEFQSUMgbWVtb3J5IG1hcHBlZCBzcGFjZSB0byBiZSAibWFw
cGVkIElPIiwgYW5kIHRoYXQgZGlmZmVyZW50IHRoYW4KPiA+ID4gInJlc2VydmVkIi4KPiA+ID4g
Cj4gPiA+IFNvIHdoaWxlIHBhcnNpbmcgdGhlIGU4MjAgZnJvbSBodm1sb2FkZXIsIGluc3RlYWQg
b2YgaWdub3JpbmcgYWxsCj4gPiA+IHJlc2VydmVkIHJlZ2lvbiwgSSdtIGdvaW5nIHRvIGF2b2lk
IGFkZGluZyB0aGUgbG9jYWwgYXBpYyBtZW1vcnkgbWFwcGVkCj4gPiA+IHNwYWNlLgo+ID4gPiAK
PiA+ID4gc29tZXRoaW5nIGxpa2U6Cj4gPiA+ICAgaWYgKGh2bWxvYWRlckRldGVjdGVkKCkpCj4g
PiAKPiA+IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdG8gZ2F0ZSB0aGlzIG9uIGh2bWxvYWRlciBi
ZWluZyB1c2VkLCB3aGlsZQo+ID4gaXQncyB0cnVlIHRoYXQgUFZIIG1lbW9yeSBtYXAgZG9lc24n
dCBjb250YWluIHN1Y2ggcmVzZXJ2ZWQgbWVtb3J5Cj4gPiByZWdpb24gQVRNIEkgZG9uJ3Qgc2Vl
IGFueSBoYXJtIGluIGRvaW5nIHRoaXMgZm9yIFBWSCBhbHNvLgo+IAo+IE9rLgo+IAo+ID4gPiAg
ICAgQmFzZSA9ICQoc3RhcnQgb2YgdGhlIGU4MjAgZW50cnkpOwo+ID4gPiAgICAgRW5kID0gJChz
dGFydCBvZiB0aGUgZTgyMCBlbnRyeSArIHNpemUpOwo+ID4gPiAgICAgTG9jYWxBcGljID0gMHhm
ZWUwMDAwMDsKPiA+ID4gICAgIGlmIChCYXNlIDwgTG9jYWxBcGljICYmIExvY2FsQXBpYyA8IEVu
ZCkgewo+ID4gPiAgICAgICBBZGRSZXNlcnZlZE1lbW9yeVJhbmdlSG9iIChCYXNlLCBMb2NhbEFw
aWMsIEZBTFNFKTsKPiA+ID4gICAgICAgaWYgKEVuZCA+IChMb2NhbEFwaWMgKyBTSVpFXzRLQikp
IHsKPiA+IAo+ID4gVGhlIHJhbmdlIGlzIGFjdHVhbGx5IGZyb20gMHhmZWUwMDAwMCB0byAweGZl
ZWZmZmZmICgyTUIpLCBzbyB5b3UKPiA+IGxpa2VseSB3YW50IHRvIG1ha2Ugc3VyZSBub24gb2Yg
dGhpcyBpcyBhZGRlZCBhcyByZXNlcnZlZD8KPiAKPiBZb3UgbWVhbiAxTUIsIHJpZ2h0ID8gOi0p
LgoKRCdvaCwgeWVzIDopLgoKPiBJJ3ZlIHRyeSB0byBmaW5kIG91dCBpbiB0aGUgSW50ZWwgbWFu
dWFsIHdoeQo+IGl0IHdvdWxkIGJlIDFNQiBhbmQgY291bGRuJ3QgZmluZCB0aGF0LCBidXQgb24g
dGhlIG90aGVyIGhhbmQgdGhlCj4gaW5pdGlhbGlzYXRpb24gY29kZSBmb3IgT1ZNRiBydW5uaW5n
IG9uIFFFTVUgZG9lcyBhbHNvIHJlc2VydmUgMU1CIGZvcgo+IHRoZSBsb2NhbCBhcGljLiBTbyBJ
J2xsIGNoYW5nZSB0byAxTUIuCgpJdCdzIHRoZSBJbnRlcnJ1cHQgQWRkcmVzcyBSYW5nZSwgd2hp
Y2ggY29udGFpbnMgdGhlIG1taW8gbGFwaWMKcmVnaXN0ZXJzIGFuZCB0aGUgbW1pbyByZWdpb24g
d2hlcmUgZGV2aWNlcyB3cml0ZSBpbiBvcmRlciB0byBzaWduYWwKaW50ZXJydXB0cyB0byB0aGUg
YXBpYyAodXNlZCBhcyB0aGUgYWRkcmVzcyBmaWVsZCBmb3IgTVNJKC1YKSkuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
