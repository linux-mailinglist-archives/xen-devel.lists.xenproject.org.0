Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECBB188D7
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 13:20:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOh3F-0001gu-8M; Thu, 09 May 2019 11:17:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DbYa=TJ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hOh3D-0001gp-Ku
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 11:17:23 +0000
X-Inumbo-ID: 02fce927-724c-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 02fce927-724c-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 11:17:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 78PHBUO1TGa5pMGw/SJN77g+hSFH1lhzFrKXf+4jUZ4kSc5E+Sc7zH79nCy73hyHxYRiSiJyCn
 eKoqwIa3gWnDkR12zNKUdiQfdRjZUhldgGxzaRk4VKalYn2YkjqxO5o7FRMiv2auY++bWohtzR
 oH3iLUE1LLb2D4YmOJynckxlFu1T+MKUMe46NCUoskZcJRVAChkxi0o1J/sjJi116il6cJfS6f
 +LOniEC4ElkuXuENbyL1zErzip6viW96euR7DGNV7OjCuxagFtEmQDKGvlZTpxUKIYdL3GlbQn
 nSc=
X-SBRS: 2.7
X-MesageID: 240328
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,449,1549947600"; 
   d="scan'208";a="240328"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23764.3098.687128.584532@mariner.uk.xensource.com>
Date: Thu, 9 May 2019 12:16:42 +0100
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <20190508113947.11920-1-george.dunlap@citrix.com>
References: <20190508113947.11920-1-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0hdIE1BSU5UQUlORVJTOiBBZGQgZXhwbGljaXQg
Y2hlY2staW4gcG9saWN5IHNlY3Rpb24iKToKPiArCUNoZWNrLWluIHBvbGljeQo+ICsJPT09PT09
PT09PT09PT09Cj4gKwo+ICtJbiBvcmRlciBmb3IgYSBwYXRjaCB0byBiZSBjaGVja2VkIGluLCBp
biBnZW5lcmFsLCBzZXZlcmFsIGNvbmRpdGlvbnMKPiArbXVzdCBiZSBtZXQ6CgpJIHRoaW5rIGl0
IGlzIHZlcnkgaGVscGZ1bCB0byB3cml0ZSBndWlkZWxpbmVzLCBidXQgSSBhbSBvcHBvc2VkIHRv
CmRlY2xhcmluZyB0aGlzIGFzIGEgcmlnaWQgcG9saWN5LgoKSW4gcGFydGljdWxhciBhcyBjb21t
aXR0ZXIgSSBvZnRlbiBiZW5kIHRoZSBydWxlcyAoSSBndWVzcywgSSBtZWFuLAppbnNvZmFyIGFz
IHdlIGhhdmUgcnVsZXMsIEkgZG8gdGhpbmdzIHRoYXQgZmVlbCBsaWtlIGJlbmRpbmcgdGhlbSku
CkkgZG8gdGhpcyB3aGVuIElTVE0gdGhhdCBhbGwgdGhlICJyZWxldmFudCIgcGVvcGxlIGVpdGhl
ciBoYXZlCmFwcHJvdmVkLCBvciB3aWxsIGFwcHJvdmUgb2YgbXkgYWN0aW9uIHdoZW4gdGhleSBm
aW5kIG91dCBhYm91dCBpdC4KCkkgbWF5IGJlIHdyb25nIGJ1dCBJIGRvbid0IHRoaW5rIEkgaGF2
ZSBldmVyIGNhdXNlZCBhbnlvbmUgdG8gZmVlbApsaWtlIEkgb3ZlcnN0ZXBwZWQgYSBib3VuZGFy
eSwgYnkgZGVsaWJlcmF0ZWx5IChmb3IgZXhhbXBsZSkKY29tbWl0dGluZyBzb21ldGhpbmcgd2hp
Y2ggc2VlbXMgdG8gbGFjayBhbiBhcHByb3ByaWF0ZSBhY2suCihUaGF0J3Mgbm90IHRvIHNheSB0
aGF0IEkgZG9uJ3QgbWFrZSBlcnJvcnM7IGJ1dCB0aGF0IGlzIHJhdGhlciBhCmRpZmZlcmVudCBx
dWVzdGlvbi4pCgpBdCB0aGUgdmVyeSBsZWFzdCwgSSBhbSBvZnRlbiB2ZXJ5IGtlZW4gdG8gY29t
bWl0IHRoaW5ncyB3aGljaCB1bmJyZWFrCnJlY2VudCBzZXJpb3VzIHJlZ3Jlc3Npb25zLCBlZyB3
aGljaCB1bmJyZWFrIHRoZSBidWlsZC4gIEkgaGF2ZSBldmVuCm9uIG9jY2FzaW9uIGRvbmUgYSBz
dWJzdGFudGl2ZSByZXZpZXcgb2YgYSBwYXRjaCwgYXMgcGFydCBvZgpjb252aW5jaW5nIG15c2Vs
ZiB0aGF0IHRoZSBtYWludGFpbmVyIHdpbGwgYXBwcm92ZSBvZiBpdCAob3IgYXQgbGVhc3QsCmFw
cHJvdmUgb2YgbXkgZGVjaXNpb24gdG8gY29tbWl0IGl0KS4KCkknbSBub3Qgc3VyZSBleGFjdGx5
IGhvdyB0byBjb2RpZnkgdGhpcy4gIEZvciBtZSB0aGUga2V5IHRlc3QgaXM6CmlmIEkgZG8gdGhp
cywgaXMgYW55b25lIGdvaW5nIHRvIGJlIGFubm95ZWQgYmVjYXVzZSB0aGV5IGZlbHQgdGhlaXIK
YWNrIHNob3VsZCBoYXZlIGJlZW4gd2FpdGVkIGZvciAqYW5kIHRoZXkgd291bGRuJ3QgaGF2ZSBn
cmFudGVkIGl0KjsKaWUsIHRoZXkgZmVsdCB0aGUgcGF0Y2ggb3VnaHQgbm90IHRvIGhhdmUgYmVl
biBjb21taXR0ZWQuICBJZiB0aGF0CndlcmUgdG8gaGFwcGVuIEkgd291bGQgaGF2ZSB0byBhcG9s
b2dpc2UgYW5kIHJlY2FsaWJyYXRlIG15CnVuZGVyc3RhbmRpbmcgb2Ygd2hlbiBzdWNoIGEgdGhp
bmcgaXMgYXBwcm9wcmlhdGUgKGFuZCB0aGlzIG1pZ2h0CmluZGVlZCBkZXBlbmQgb24gd2hpY2gg
bWFpbnRhaW5lcihzKSB3ZXJlIGludm9sdmVkLCBldGMuKQoKT2J2aW91c2x5IHRoZSBiZXN0IHdh
eSB0byBhdm9pZCBzdWNoIGZyaWN0aW9uIGlzIHRvIHdhaXQgZm9yIHRoZQpleHBsaWNpdCBhY2ss
IGFuZCBjaGFzZSBpdCBpZiBuZWVkIGJlOyBidXQgc29tZXRpbWVzIChub3QgdXN1YWxseSwgYnV0
Cm9jY2FzaW9uYWxseSkgdGhhdCBpcyBub3QgcHJhY3RpY2FsIGZvciB3aGF0ZXZlciByZWFzb24u
CgpEb2VzIHRoaXMgbWFrZSBzZW5zZSA/CgpSZWdhcmRzLApJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
