Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5934620841
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:33:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGSq-00075u-EZ; Thu, 16 May 2019 13:30:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRGSo-00075p-NQ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:30:26 +0000
X-Inumbo-ID: c165ba96-77de-11e9-bb1f-cfe0e04174a0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c165ba96-77de-11e9-bb1f-cfe0e04174a0;
 Thu, 16 May 2019 13:30:22 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: sfGn+9DABQuk9q4bJveUc0GeUHPFz5JBOCIB1qKqgy4idqWwM+lx0TXOHpl3HVOTrBOcLgCZXn
 87Vb5UDXc5thYDX/vpn+zsU/YEnUBhG0u/lvve7ZHie2Oag+W1n9MDWsyiWsMg2lZAaWEyomqP
 wF/2YTZu86tlnD6mRfWS3qMJIscQQoRq9kG9et+T6xZl9oPGk1crmpD2KU6/0rtJDaNSFSRt0e
 voTIHepIdSqYxPyf6mXUMsEbWCmem+Mubg2Do/wpBOe0GiH3jvipjTnNddPB1UjGQO2zAoDtYf
 0zE=
X-SBRS: 2.7
X-MesageID: 524680
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="524680"
Date: Thu, 16 May 2019 14:30:13 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190516133013.GG2798@zion.uk.xensource.com>
References: <20190516125000.23559-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516125000.23559-1-olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix device_model_version related
 assert
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDI6NTA6MDBQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gSW4gY29tbWl0IDM4MDJlY2JhYTkgKCJsaWJ4bDogYWRkIGhlbHBlciBmdW5jdGlvbiB0
byBzZXQKPiBkZXZpY2VfbW9kZWxfdmVyc2lvbiIpIGFuIGFzc2VydCB3YXMgYWRkZWQgdG8KPiBs
aWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCB0byBtYWtlIHN1cmUgY2FsbGVycyBw
cm92aWRlCj4gY29tcGxldGUgaW5mbyB0byB0aGlzIGZ1bmN0aW9uLiBUaGlzIHVudmVpbGVkIGEg
ZmxhdyBpbiB0aGUgd2F5IGhvdwo+IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIGlzIHBhc3NlZCB0
byBsaWJ4bC4gVGhlIHB1YmxpYyBBUEkKPiBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgcGFzc2Vz
IGFuIGluY29tcGxldGUgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gdG8KPiBsaWJ4bF9fZG9tYWlu
X2J1aWxkX2luZm9fc2V0ZGVmYXVsdCwgd2hpY2ggdHJpZ2dlcnMgdGhlIGFzc2VydC4gUHJpb3Ig
dG8KPiB0aGUgY2hhbmdlIGFib3ZlLCBkZXZpY2VfbW9kZWxfdmVyc2lvbiB3YXMgaGFyZGNvZGVk
IHRvIFFFTVVfWEVOIHdoaWNoCj4gbGVhZCB0byB0aGUgYnVncyBkZXNjcmliZWQgaW4gdGhhdCBj
aGFuZ2VzZXQuCj4gCj4gQSBuZXcgbGlieGwgQVBJIHdvdWxkIG5lZWQgdG8gYmUgY3JlYXRlZCB0
byBmdWxseSBwb3B1bGF0ZQo+IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIHdpdGggbWlzc2luZyBk
ZWZhdWx0cy4gRm9yIGV4aXN0aW5nLCB1bmNoYW5nZWQKPiBjb25zdW1lcnMgb2YgbGlieGwgdGhl
IGFzc3VtcHRpb24gYWJvdXQgUUVNVV9YRU4gbmVlZHMgdG8gYmUgcmVzdG9yZWQKPiB3aXRoaW4g
dGhpcyBmdW5jdGlvbiB0byBwcm9wZXJseSBwb3B1bGF0ZSB0aGUgYW1vdW50IG9mIHJlcXVpcmVk
IG1lbW9yeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+
Cj4gUmVwb3J0ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAg
dG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgfCAxMyArKysrKysrKy0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMK
PiBpbmRleCA4OWY5OWY3ZjQ0Li4wMzA4NTFmYjI4IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBAQCAt
MTIzLDYgKzEyMyw3IEBAIGludCBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChs
aWJ4bF9fZ2MgKmdjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmJfaW5mbykKPiAgewo+ICAgICAgaW50IGksIHJjOwo+
ICsgICAgbGlieGxfZGV2aWNlX21vZGVsX3ZlcnNpb24gZGV2aWNlX21vZGVsX3ZlcnNpb247Cj4g
IAo+ICAgICAgaWYgKGJfaW5mby0+dHlwZSAhPSBMSUJYTF9ET01BSU5fVFlQRV9IVk0gJiYKPiAg
ICAgICAgICBiX2luZm8tPnR5cGUgIT0gTElCWExfRE9NQUlOX1RZUEVfUFYgJiYKPiBAQCAtMTMx
LDcgKzEzMiw5IEBAIGludCBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChsaWJ4
bF9fZ2MgKmdjLAo+ICAgICAgICAgIHJldHVybiBFUlJPUl9JTlZBTDsKPiAgICAgIH0KPiAgCj4g
LSAgICBhc3NlcnQoYl9pbmZvLT5kZXZpY2VfbW9kZWxfdmVyc2lvbik7Cj4gKyAgICBkZXZpY2Vf
bW9kZWxfdmVyc2lvbiA9IGJfaW5mby0+ZGV2aWNlX21vZGVsX3ZlcnNpb247Cj4gKyAgICBpZiAo
IWRldmljZV9tb2RlbF92ZXJzaW9uKQo+ICsgICAgICAgIGRldmljZV9tb2RlbF92ZXJzaW9uID0g
TElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU47CgpUaGlzIGlzIGEgYml0IG1vcmUg
Y29kZSBjaHVybiB0aGFuIEkgbGlrZS4KCkxpa2UgSSBzYWlkLCBsaWJ4bF9kb21haW5fbmVlZF9t
ZW1vcnkgaXMgdGhlIG9ubHkgcHVibGljIEFQSSB3aGljaCB0YWtlcwpiX2luZm8uIEFsbCBvdGhl
ciBjYWxsZXJzIHRvIGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0IHNob3VsZApo
YXZlIGRfY29uZmlnIHRvIGhhbmQuIFNvIGNoYW5naW5nIHRoZSBjb2RlIGhlcmUgc2VlbXMgb3Zl
cmtpbGxlZC4KCldvdWxkIHRoZSBmb2xsb3dpbmcgd29yaz8KCmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9tZW0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCmluZGV4IDQ0OGEyYWY4
ZmQuLjEyYWYzNGY3MGUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCisrKyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCkBAIC00NTcsNiArNDU3LDEyIEBAIGludCBsaWJ4bF9k
b21haW5fbmVlZF9tZW1vcnkobGlieGxfY3R4ICpjdHgsCiAgICAgbGlieGxfZG9tYWluX2J1aWxk
X2luZm9faW5pdChiX2luZm8pOwogICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2NvcHkoY3R4
LCBiX2luZm8sIGJfaW5mb19pbik7CiAKKyAgICAvKiBDb21wYXRpYmlsaXR5OiBpZiB3ZSBkb24n
dCBzZXQgdGhpcywgYnVpbGRfaW5mb19zZXRkZWZhdWx0IHdpbGwKKyAgICAgKiB0cnkgdG8gYWNj
ZXNzIGRvbWFpbl9jb25maWcsIHdoaWNoIHdlIGRvbid0IGhhdmUgaGVyZS4KKyAgICAgKi8KKyAg
ICBpZiAoIWJfaW5mby0+ZGV2aWNlX21vZGVsX3ZlcnNpb24pCisgICAgICAgYl9pbmZvLT5kZXZp
Y2VfbW9kZWxfdmVyc2lvbiA9IExJQlhMX0RFVklDRV9NT0RFTF9YWFg7CisKICAgICByYyA9IGxp
YnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KGdjLCBiX2luZm8pOwogICAgIGlmIChy
YykgZ290byBvdXQ7CgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
