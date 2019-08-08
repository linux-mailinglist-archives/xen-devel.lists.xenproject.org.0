Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB785FA0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:29:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfdD-00014F-8O; Thu, 08 Aug 2019 10:26:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hvfdB-00014A-RO
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:26:49 +0000
X-Inumbo-ID: 04f3ef74-b9c7-11e9-9201-0b9b51ea7639
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04f3ef74-b9c7-11e9-9201-0b9b51ea7639;
 Thu, 08 Aug 2019 10:26:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LIlhCBo3IvruhVfJasGXwJtESk8KU+hsS6ncEzBC5JG9y/A0qMh1X4W3uJBw5NyzmFZB3tJs40
 6wfK92MgtUP1/QcGd8Iny4Bu6XBvcELlfF9ZO6QVffKuPJuASmvZbKUTOWi/4GMSThHht7HEE3
 pdPMY+eu+/qNFlxJ8JE8/EAdN7cepkHpnfbUYZYl4su052HEGiRPgfWrIBPWBtFk9Dx0roFhDS
 xawqTHlVI/9JKmnawKZWh12H8OAk7+k9owhLV0hz1qX2JIUXgEEy3rNVqZfauQUeKnjh7PabEl
 Rkw=
X-SBRS: 2.7
X-MesageID: 4017177
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4017177"
Date: Thu, 8 Aug 2019 11:26:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190808102641.GQ1242@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-13-anthony.perard@citrix.com>
 <20190807143558.uxha44jflgmstdkj@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807143558.uxha44jflgmstdkj@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 12/35]
 OvmfPkg/XenPlatformPei: Grab RSDP from PVH guest start of day struct
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

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDQ6MzU6NThQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNDozOToyMVBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IENoZWNrIGlmIHRoZXJlJ3MgYSBzdGFydCBvZiB0aGUgZGF5
IHN0cnVjdCBwcm92aWRlZCB0byBQVkggZ3Vlc3QsIHNhdmUKPiA+IHRoZSBBQ1BJIFJTRFAgYWRk
cmVzcyBmb3IgbGF0ZXIuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggaW1wb3J0IGltcG9ydCBhcmNoLXg4
Ni9odm0vc3RhcnRfaW5mby5oIGZyb20geGVuLmdpdC4KPiAKPiBZb3Ugc2VlbSB0byBjaGFuZ2Ug
dGhlIHR5cGVzIHdoZW4gaW1wb3J0aW5nIHN0YXJ0X2luZm8uaCwgaXMgdGhhdAo+IGFic29sdXRl
bHkgbmVjZXNzYXJ5PwoKSSBndWVzcyBvbmUgY291bGQgdHJ5IHRvIG1hcCB4ZW4ncyB0eXBlcyB0
byBFREtJSSdzIHR5cGUgd2l0aCB0eXBlZGVmcywKYnV0IEknbSBub3Qgc3VyIGhvdyB3ZWxsIHRo
YXQgd291bGQgd29yay4gSW1wb3J0aW5nIHRoZSB4ZW4gaGVhZGVycyBpcwpkb2N1bWVudGVkIHNv
IGNoYW5naW5nIHRoZSB0eXBlcyBpcyBmYWlybHkgZWFzeSwgc2VlCmh0dHBzOi8vZ2l0aHViLmNv
bS90aWFub2NvcmUvZWRrMi9ibG9iL21hc3Rlci9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFu
ZGFyZC9YZW4vUkVBRE1FCgpBbHNvLCBjaGFuZ2luZyB0aGUgaGVhZGVyIGZ1cnRoZXIgbWlnaHQg
aGF2ZSBiZWVuIHNvbWV0aGluZyB1c2VmdWwgdG8KZG8sIHdlIGNvdWxkIGhhdmUgbWF0Y2ggRURL
SUkncyBuYW1pbmcgY29udmVudGlvbiBhbmQgc291cmNlIGZpbGVzIHdvdWxkCmhhdmUgbG9va2Vk
IGEgYml0IGxlc3Mgd2VpcmQuCgo+IEZyb20gbXkgZXhwZXJpZW5jZSB3b3JraW5nIHdpdGggZGlm
ZmVyZW50IHByb2plY3RzIHdoZW4gaW1wb3J0aW5nIHN1Y2gKPiBoZWFkZXJzIGl0J3MgYmV0dGVy
IHRvIGtlZXAgdGhlbSB2ZXJiYXRpbSwgdGhpcyBtYWtlcyBpbXBvcnRpbmcgZnV0dXJlCj4gdmVy
c2lvbnMgZnJvbSB1cHN0cmVhbSBlYXNpZXIuCj4KPiBJIGhhdmUgYSBjb21tZW50IGJlbG93LCBi
dXQgaXQncyBtb3JlIGxpa2UgYSBxdWVzdGlvbi4KPiAKPiA+IGRpZmYgLS1naXQgYS9Pdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+ID4g
aW5kZXggNWM3ZDdkZGMxYy4uYjM2NjEzOWEwYSAxMDA2NDQKPiA+IC0tLSBhL092bWZQa2cvWGVu
UGxhdGZvcm1QZWkvWGVuLmMKPiA+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMK
PiA+IEBAIC0yNSw2ICsyNSw3IEBACj4gPiAgI2luY2x1ZGUgPEluZHVzdHJ5U3RhbmRhcmQvRTgy
MC5oPgo+ID4gICNpbmNsdWRlIDxMaWJyYXJ5L1Jlc291cmNlUHVibGljYXRpb25MaWIuaD4KPiA+
ICAjaW5jbHVkZSA8TGlicmFyeS9NdHJyTGliLmg+Cj4gPiArI2luY2x1ZGUgPEluZHVzdHJ5U3Rh
bmRhcmQvWGVuL2FyY2gteDg2L2h2bS9zdGFydF9pbmZvLmg+Cj4gPiAgCj4gPiAgI2luY2x1ZGUg
IlBsYXRmb3JtLmgiCj4gPiAgI2luY2x1ZGUgIlhlbi5oIgo+ID4gQEAgLTg2LDYgKzg3LDcgQEAg
WGVuQ29ubmVjdCAoCj4gPiAgICBVSU5UMzIgWGVuVmVyc2lvbjsKPiA+ICAgIEVGSV9YRU5fT1ZN
Rl9JTkZPICpJbmZvOwo+ID4gICAgQ0hBUjggU2lnW3NpemVvZiAoSW5mby0+U2lnbmF0dXJlKSAr
IDFdOwo+ID4gKyAgVUlOVDMyICpQVkhSZXNldFZlY3RvckRhdGE7Cj4gPiAgCj4gPiAgICBBc21D
cHVpZCAoWGVuTGVhZiArIDIsICZUcmFuc2ZlclBhZ2VzLCAmVHJhbnNmZXJSZWcsIE5VTEwsIE5V
TEwpOwo+ID4gICAgbVhlbkluZm8uSHlwZXJQYWdlcyA9IEFsbG9jYXRlUGFnZXMgKFRyYW5zZmVy
UGFnZXMpOwo+ID4gQEAgLTEyMSw2ICsxMjMsMjkgQEAgWGVuQ29ubmVjdCAoCj4gPiAgICAgIG1Y
ZW5Idm1sb2FkZXJJbmZvID0gTlVMTDsKPiA+ICAgIH0KPiA+ICAKPiA+ICsgIG1YZW5JbmZvLlJz
ZHBQdmggPSBOVUxMOwo+ID4gKwo+ID4gKyAgLy8KPiA+ICsgIC8vIExvY2F0ZSBhbmQgdXNlIGlu
Zm9ybWF0aW9uIGZyb20gdGhlIHN0YXJ0IG9mIGRheSBzdHJ1Y3R1cmUgaWYgd2UgaGF2ZQo+ID4g
KyAgLy8gYm9vdGVkIHZpYSB0aGUgUFZIIGVudHJ5IHBvaW50Lgo+ID4gKyAgLy8KPiA+ICsKPiA+
ICsgIFBWSFJlc2V0VmVjdG9yRGF0YSA9IChWT0lEICopKFVJTlROKSBQY2RHZXQzMiAoUGNkWGVu
UHZoU3RhcnRPZkRheVN0cnVjdFB0cik7Cj4gPiArICAvLwo+ID4gKyAgLy8gVGhhdCBtYWdpYyB2
YWx1ZSBpcyB3cml0dGVuIGluIFhlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KPiA+
ICsgIC8vCj4gPiArICBpZiAoUFZIUmVzZXRWZWN0b3JEYXRhWzFdID09IFNJR05BVFVSRV8zMiAo
J1gnLCAnUCcsICdWJywgJ0gnKSkgewo+ID4gKyAgICBzdHJ1Y3QgaHZtX3N0YXJ0X2luZm8gKkhW
TVN0YXJ0SW5mbzsKPiA+ICsKPiA+ICsgICAgSFZNU3RhcnRJbmZvID0gKFZPSUQgKikoVUlOVE4p
IFBWSFJlc2V0VmVjdG9yRGF0YVswXTsKPiA+ICsgICAgaWYgKEhWTVN0YXJ0SW5mby0+bWFnaWMg
PT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19WQUxVRSkgewo+ID4gKyAgICAgIEFTU0VSVCAoSFZNU3Rh
cnRJbmZvLT5yc2RwX3BhZGRyICE9IDApOwo+ID4gKyAgICAgIGlmIChIVk1TdGFydEluZm8tPnJz
ZHBfcGFkZHIgIT0gMCkgewo+ID4gKyAgICAgICAgbVhlbkluZm8uUnNkcFB2aCA9IChWT0lEICop
KFVJTlROKUhWTVN0YXJ0SW5mby0+cnNkcF9wYWRkcjsKPiAKPiBJIGd1ZXNzIHlvdSBjYW4gZG8g
dGhpcyBiZWNhdXNlIE9WTUYgaGFzIGFuIGlkZW50aXR5IG1hcCBvZiB2aXJ0dWFsCj4gYWRkcmVz
c2VzIHRvIHBoeXNpY2FsIGFkZHJlc3Nlcz8KCkkgdGhpbmsgc28sIHllcy4gSSBrbm93IHRoYXQg
ZWFybHkgY29kZSBkb2VzIGNyZWF0ZWQgcGFnZSB0YWJsZSBsaWtlCnRoYXQsIGJ1dCBJIGRvbid0
IGtub3cgaWYgbGF0ZXIgY29kZSByZXdvcmsgdGhvc2UgcGFnZSB0YWJsZSBvciBub3QuCgo+IEkg
d29uZGVyIHRoZSBzaXplIG9mIHN1Y2ggaWRlbnRpdHkgbWFwLCBhbmQgd2hldGhlciB5b3UgbmVl
ZCB0byBjaGVjawo+IHRoYXQgdGhlIHJzZHAgYWRkcmVzcyBpcyBpbmRlZWQgaW5zaWRlIG9mIHRo
YXQgcmVnaW9uIGJlZm9yZQo+IGNvbnZlcnRpbmcgaXQgdG8gYSBwb2ludGVyLiBUaGUgc2FtZSB3
b3VsZCBhcHBseSB0bwo+IFBjZFhlblB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHIsIGJ1dCB0aGF0J3Mg
bGlrZWx5IHNhZmUgYmVjYXVzZSBpdCdzCj4gYWx3YXlzIDwgNEdCLCB3aGljaCBJIGFzc3VtZSBP
Vk1GIGFsd2F5cyBoYXMgaWRlbnRpdHkgbWFwcGVkPwoKUGNkWGVuUHZoU3RhcnRPZkRheVN0cnVj
dFB0ciBpcyBzYWZlIGJlY2F1c2UgT1ZNRiBvd25zIGl0LiBBcyBmb3IgdGhlCnJzcGRfcGFkZHIq
IGFuZCB0aGUgSFZNU3RhcnRJbmZvKiwgSSBuZWVkIHRvIGNoZWNrLiBBcyB5b3Ugc2F5LCBpdCdz
CnByb2JhYmx5IGZpbmUgYXMgbG9uZyBhcyBpdCdzIDw0R0IuCgpJJ3ZlIGxvb2tlZCBhdCB0aGUg
Y29tbWVudCBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvYmxvYi9tYXN0
ZXIvT3ZtZlBrZy9SZXNldFZlY3Rvci9JYTMyL1BhZ2VUYWJsZXM2NC5hc20jTDk0ClRoaXMgbWVh
biB0aGF0IHRoZSBjb2RlIGV4ZWN1dGVkIGluIHRoZSBwYXRjaCAoYWNjZXNzaW5nIHRoZSBodm0g
c3RhcnQKaW5mbyBzdHJ1Y3QpIGlzIGV4ZWN1dGVkIHdoaWxlIHRoZSBpZCBtYXAgaXMgc2V0dXAg
dXAgdG8gNEdCLiBTbyBhcyBsb25nCmFzIHRoZSBzdHJ1Y3QgaXMgYmVsb3cgNEcsIGl0J3MgZmlu
ZS4KCkFzIGZvciB0aGUgUlNEUCwgSSB0aGluayB0aGF0IHBvaW50ZXIgaXMgYWNjZXNzZWQgbXVj
aCBsYXRlciwgd2hlbiBhCmRpZmZlcmVudCBwYWdlIHRhYmxlIGlzIHNldHVwLCBJIHRoaW5rIHRo
YXQgd291bGQgYmUgdGhhdCBjb2RlOgpodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIv
YmxvYi9tYXN0ZXIvTWRlTW9kdWxlUGtnL0NvcmUvRHhlSXBsUGVpbS9YNjQvVmlydHVhbE1lbW9y
eS5jCkJ1dCBJJ20gbm90IHN1cmUgaG93IG11Y2ggaXMgc2V0dXAuIEJ1dCBJJ20gZ3Vlc3Npbmcg
dGhhdCB3aGF0ZXZlciBpcwpwb2ludGVkIGJ5IFJTRFAsIGl0IHdpbGwgYmUgaW4gdGhlIDE6MSwg
YmVjYXVzZSB3ZSB0ZWxsIHRoZSBVRUZJIGFib3V0Cml0IHdoaWxlIHBhcnNpbmcgdGhlIGU4MjAu
CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
