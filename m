Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289471893B
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 13:47:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOhUU-00042p-UY; Thu, 09 May 2019 11:45:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYh4=TJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hOhUS-00042k-N7
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 11:45:32 +0000
X-Inumbo-ID: f25d9091-724f-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f25d9091-724f-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 11:45:30 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=SoftFail smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: N9qMXkJ28tXoLIF0+CMe1p40nIPrHVgusowYmUOTQGV2EKij9oCr1DBFqbWbQlmb9qXdi+6L3E
 RFzuRCBmMdfB0jK8yaZ5Uaany0OyCVZ+V28WbUx0ttzyl02lR7zfNdhg0hbojVynMIo994xntK
 05bONMpk4xazYtaT28aAA59Z5kZ6KIndB4HSgDgWVNCNv+/meLGg2fyKyK5QaCb/Se1XZpfeiF
 z7LvmS3i6JDl3/j9Azlk381OZUWw2DhsA5RjIMXP2gWzO5LZSq07PvPcuDwf6qAsrl3q2c5Dus
 XIA=
X-SBRS: 2.7
X-MesageID: 241396
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,449,1549947600"; 
   d="scan'208";a="241396"
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190508113947.11920-1-george.dunlap@citrix.com>
 <23764.3098.687128.584532@mariner.uk.xensource.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <392fbd7e-cc50-7418-d602-2cbb203585a0@citrix.com>
Date: Thu, 9 May 2019 12:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23764.3098.687128.584532@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add explicit check-in policy
 section
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS85LzE5IDEyOjE2IFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBHZW9yZ2UgRHVubGFwIHdy
aXRlcyAoIltQQVRDSF0gTUFJTlRBSU5FUlM6IEFkZCBleHBsaWNpdCBjaGVjay1pbiBwb2xpY3kg
c2VjdGlvbiIpOgo+PiArCUNoZWNrLWluIHBvbGljeQo+PiArCT09PT09PT09PT09PT09PQo+PiAr
Cj4+ICtJbiBvcmRlciBmb3IgYSBwYXRjaCB0byBiZSBjaGVja2VkIGluLCBpbiBnZW5lcmFsLCBz
ZXZlcmFsIGNvbmRpdGlvbnMKPj4gK211c3QgYmUgbWV0Ogo+IAo+IEkgdGhpbmsgaXQgaXMgdmVy
eSBoZWxwZnVsIHRvIHdyaXRlIGd1aWRlbGluZXMsIGJ1dCBJIGFtIG9wcG9zZWQgdG8KPiBkZWNs
YXJpbmcgdGhpcyBhcyBhIHJpZ2lkIHBvbGljeS4KClRoZSBwaHJhc2UgImluIGdlbmVyYWwiIHdh
cyBtZWFudCB0byBpbmRpY2F0ZSB0aGF0IGl0IHdhcyBub3QgYSByaWdpZApwb2xpY3ksIGJ1dC4u
LiB3ZWxsLCBhIGdlbmVyYWwgb25lLCB3aGljaCB3YXMgdW5kZXJzdG9vZCBtYXkgbm90IGFwcGx5
CmluIGV4Y2VwdGlvbmFsIGNpcmN1bXN0YW5jZXMuCgo+IEluIHBhcnRpY3VsYXIgYXMgY29tbWl0
dGVyIEkgb2Z0ZW4gYmVuZCB0aGUgcnVsZXMgKEkgZ3Vlc3MsIEkgbWVhbiwKPiBpbnNvZmFyIGFz
IHdlIGhhdmUgcnVsZXMsIEkgZG8gdGhpbmdzIHRoYXQgZmVlbCBsaWtlIGJlbmRpbmcgdGhlbSku
Cgpbc25pcF0KCj4gRG9lcyB0aGlzIG1ha2Ugc2Vuc2UgPwoKU3VyZSwgYnV0IGlzIHRoaXMgbm90
IGFscmVhZHkgY292ZXJlZCBieSB0aGUgc2VjdGlvbiBhdCB0aGUgZW5kIG9mICJUaGUKbWVhbmlu
ZyBvZiBuZXN0aW5nIj8gIE9yIGFyZSB5b3Ugc3BlY2lmaWNhbGx5IHRoaW5raW5nIG9mIGEgY2Fz
ZSB3aGVyZQoxKSB5b3Ugd3JpdGUgdGhlIGZpeCwgYW5kIDIpIG5vYm9keSBmcm9tIFRIRSBSRVNU
IGlzIGFyb3VuZCB0byBwcm92aWRlCmFuICJzdGFuZC1pbiBmb3IgdGhlIG1vcmUgc3BlY2lmaWMg
bWFpbnRhaW5lciIgQWNrPwoKSWYgdGhlIGxhdHRlciwgd2UgY2FuIGNlcnRhaW5seSBhZGQgc29t
ZSB0ZXh0IHRvIHNheSB0aGF0IGluIHN1Y2ggYW4KZXhjZXB0aW9uYWwgY2lyY3Vtc3RhbmNlLCBh
IGNvbW1pdHRlciBtYXkgYWN0IHVuaWxhdGVyYWxseS4KCkkgdGhpbmsgaW4gZ2VuZXJhbCwgZmly
c3QgdGhlIHNwZWNpZmljIG1haW50YWluZXIncyBBY2sgb3VnaHQgdG8gYmUKc291Z2h0OyBhbmQg
aWYgdGhhdCBjYW5ub3QgYmUgZm91bmQsIHRoZW4gYSB0aGVuIG1vcmUgZ2VuZXJhbAptYWludGFp
bmVyJ3MgQWNrIHNob3VsZCBiZSBzb3VnaHQ7IGFuZCBpZiB0aGVyZSBpcyBub2JvZHkgZnJvbSB0
aGUgbW9zdApnZW5lcmFsIHNldCBvZiBtYWludGFpbmVycyAoVEhFIFJFU1QpIG90aGVyIHRoYW4g
dGhlIHN1Ym1pdHRlciBvZiB0aGUKcGF0Y2gsIHRoZW4gdGhlIHN1Ym1pdHRlci9jb21taXR0ZXIg
c2hvdWxkIG1ha2UgYSBjYWxsIGFzIHRvIHdoZXRoZXIgdG8KYWN0IHVuaWxhdGVyYWxseSBvciB0
byB3YWl0LiAgSW4gYWxsIGNhc2VzIHdoZXJlIGEgbW9yZSBnZW5lcmFsCm1haW50YWluZXIgaGFz
IHN0b29kIGluIGZvciBhIG1vcmUgc3BlY2lmaWMgbWFpbnRhaW5lciwgdGhleSBzaG91bGQgYmUK
cHJlcGFyZWQgdG8gZGVmZW5kIHRoZWlyIGNob2ljZS4KCklzIHRoYXQgd2hhdCB5b3UgaGFkIGlu
IG1pbmQ/CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
