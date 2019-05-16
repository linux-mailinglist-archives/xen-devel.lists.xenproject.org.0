Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49B20CD6
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 18:21:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRJ4r-0008UR-Nl; Thu, 16 May 2019 16:17:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=62Tc=TQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRJ4q-0008UM-0j
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 16:17:52 +0000
X-Inumbo-ID: 266e4682-77f6-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 266e4682-77f6-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 16:17:50 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: mbDm/LkJ9N/oMero/860fOiFFLB06wpbPY853APpHMV/hrzQ0l/6q8uBjy/+w+/HWQrwVqbRgp
 7dK5NF+HmzkKW/SZrLNfYttSDHFEKtGb4ap4QIRN/D5hMUwtHpH3qXZksXCkCepD5XGWmGhY3H
 J0BnjqvfnAsVdXAXUFvrbQe4bIUaGshshJ8daINXJkYneRdxfUqQXi4IqfR3yX9Z3TNw7T00kT
 mpZG8EXi1/xExldJsJnUD5LnR+IWTCMco5QzUsVOvMjLR/a8jVVruoPHHuS+m6yLpfloAhd/M/
 QDY=
X-SBRS: 2.7
X-MesageID: 515207
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="515207"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23773.36109.688404.996152@mariner.uk.xensource.com>
Date: Thu, 16 May 2019 17:17:17 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] preparations for 4.11.2
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gcHJlcGFyYXRpb25zIGZvciA0
LjExLjIiKToKPiBJbiBhZGRpdGlvbiwKClRoYW5rcy4KCj09PT0gd2FudGluZyBkaXNjdXNzaW9u
OiA9PT09Cgo+IDM2NWFhYmI2ZTUwMiAidG9vbHMvbGlieGVuZGV2aWNlbW9kZWw6IGFkZAo+IHhl
bmRldmljZW1vZGVsX21vZGlmaWVkX21lbW9yeV9idWxrIHRvIG1hcCIgaXMgcG9zc2libHkgYSBj
YW5kaWRhdGUsIGJ1dAo+IGlzIGFsc28gY29tcGxpY2F0ZWQgYnkgdGhlIHN0YWJsZSBTT05BTUUu
wqAgSXQgaXMgcGVyaGFwcyBlYXNpZXN0IHRvCj4gaWdub3JlLCBzZWVpbmcgYXMgdGhlIGlzc3Vl
IGhhcyBhbHJlYWR5IGdvbmUgdW5ub3RpY2VkIGZvciAyIHllYXJzLgoKV2Ugd291bGQgYmUgYnVt
cGluZyB0aGUgbWlub3IgdmVyc2lvbi4gIEkgdGhpbmsgaXQgaXMgQUJJIGNvbXBhdGlibGUuClNv
IEkgYW0gaW5jbGluZWQgdG8gYmFja3BvcnQgdGhpcyBvbmUgYnV0IEkgaGF2ZW4ndCBkb25lIHNv
IHlldC4KCj4gMTI5MDI1ZmUzMDkzICJveGVuc3RvcmVkOiBEb24ndCByZS1vcGVuIGEgeGVuY3Ry
bCBoYW5kbGUgZm9yIGV2ZXJ5Cj4gZG9tYWluIGludHJvZHVjdGlvbiIKCkNhbiB5b3UganVzdGlm
eSBob3cgdGhpcyBpcyBhIGJ1Z2ZpeCA/ICBJdCBkb2Vzbid0IHNlZW0gbGlrZSBiYWNrcG9ydApt
YXRlcmlhbCB0byBtZS4KCj4gN2IyMGE4NjViYzEwICJ0b29scy9vY2FtbDogUmVsZWFzZSB0aGUg
Z2xvYmFsIGxvY2sgYmVmb3JlIGludm9raW5nIGJsb2NrCj4gc3lzY2FsbHMiCgpUaGlzICpyZWFs
bHkqIGRvZXNuJ3QgbG9vayBsaWtlIGEgYnVnZml4LCBsZXQgYWxvbmUgYSBiYWNrcG9ydApjYW5k
aWRhdGUgISAgUmVtb3ZpbmcgYSBsb2NrIGZvciBwZXJmb3JtYW5jZSByZWFzb25zICEKCj4gYzM5
M2I2NGRjZWU2ICJ0b29scy9saWJ4YzogRml4IGlzc3VlcyB3aXRoIGxpYnhjIGFuZCBYZW4gaGF2
aW5nCj4gZGlmZmVyZW50IGZlYXR1cmVzZXQgbGVuZ3RocyIKClRoZSBjb21wYXRpYmlsaXR5IGlt
cGxpY2F0aW9ucyBoZXJlIGFyZSBub3QgY2xlYXJseSBzcGVsbGVkIG91dCBpbiB0aGUKY29tbWl0
IG1lc3NhZ2UuICBBRkFJQ1QsIGFmdGVyIHRoaXMgY29tbWl0LCB0aGUgZWZmZWN0IGlzOgogIC0g
bmV3IHRvb2xzIHdpbGwgd29yayB3aXRoIG9sZCBoeXBlcnZpc29yCiAgLSBvbGQgdG9vbHMgd2ls
bCBub3QgbmVjZXNzYXJpbG95IHdvcmsgd2l0aCBvbGQgaHlwZXJ2aXNvcgpJIGFzc3VtZSB0aGF0
IHdlIGFyZSB0YWxraW5nIGhlcmUgYWJvdXQgb2xkIGFuZCBuZXcgY29kZSB3aXRoIHRoZSBzYW1l
ClhlbiB2ZXJzaW9uLCBlZyBhcyBhIHJlc3VsdCBvZiBhIHNlY3VyaXR5IGZpeC4KClRoZSBwcmV2
aW91cyBiZWhhdmlvdXIsIGllLCB3aGF0IGhhcHBlbnMgd2l0aG91dCB0aGlzIHBhdGNoLCBpcyBu
b3QKZW50aXJlbHkgY2xlYXIgdG8gbWUuCgo+IDgyODU1YWJhNWJmOSAidG9vbHMvbGlieGM6IEZp
eCBlcnJvciBoYW5kbGluZyBpbiBnZXRfY3B1aWRfZG9tYWluX2luZm8oKSIKClRoaXMgbWlnaHQg
YnJlYWsgc29tZSBjYWxsZXJzLCBtaWdodG4ndCBpdCA/ICBXaGF0IGNhbGxlcnMgPyAgT3IgaXMK
dGhlcmUgYW4gYXJndW1lbnQgdGhhdCB0aGVyZSBhcmVuJ3QgY2FsbGVycyB3aGljaCB3aWxsIGJl
IGJyb2tlbiA/CgoKPT09PSBkb25lOiA9PT09Cgo+IDJlYzUzMzllYzkyMSAidG9vbHMvbGlieGw6
IGNvcnJlY3QgdmNwdSBhZmZpbml0eSBvdXRwdXQgd2l0aCBzcGFyc2UKPiBwaHlzaWNhbCBjcHUg
bWFwIgoKQmFja3BvcnRlZCB0byA0LjExIGFuZCA0LjEwLgoKCj4gNDhkYWI5NzY3ZDJlICJ0b29s
cy94bDogdXNlIGxpYnhsX2RvbWFpbl9pbmZvIHRvIGdldCBkb21haW4gdHlwZSBmb3IKPiB2Y3B1
LXBpbiIKCkJhY2twb3J0ZWQgdG8gNC4xMiwgNC4xMSwgNC4xMC4KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
