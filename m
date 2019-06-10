Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED8F3B265
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 11:45:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haGoJ-0001z0-Pc; Mon, 10 Jun 2019 09:41:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WP+N=UJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1haGoH-0001yv-IO
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 09:41:49 +0000
X-Inumbo-ID: f5f38106-8b63-11e9-a623-0bc7668174fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5f38106-8b63-11e9-a623-0bc7668174fa;
 Mon, 10 Jun 2019 09:41:46 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k2TNegrQ5kVmOw0hyMyAZ8CqfxcoD9PoS5nDQBmf7BXYGKowxI4uGZpbIRSOgP2m0LEGDqcAzj
 BYcig1sWgKVOrC7J+OpA31nEyiiw3NT+4hHy8/f2yO44UcQ5Bvf9/sUw0UzlUtPy/wTMgsuZd6
 Qc3jreEe58CNhb/xvkV2kmcUo5bf136DQCWEaRt0dUqgoFfL71gAqMsduviJJJB4OpRxrlMa1+
 MfNGNb4EmtkRnFTqlNozlfmZi87jQMG0j66nq8QBDeHuYfwvrW70g/NaV0bOeOmq+Gm1p4ZccJ
 RYg=
X-SBRS: 2.7
X-MesageID: 1525653
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,573,1557201600"; 
   d="scan'208";a="1525653"
Date: Mon, 10 Jun 2019 10:41:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Message-ID: <20190610094143.GA30852@perard.uk.xensource.com>
References: <1050197223.47376247.1559909190275.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1050197223.47376247.1559909190275.JavaMail.zimbra@cert.pl>
User-Agent: Mutt/1.12.0 (2019-05-25)
Subject: Re: [Xen-devel] Relevance of global lock (/var/lock/xl) in xl tool
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDI6MDY6MzBQTSArMDIwMCwgTWljaGHFgiBMZXN6Y3p5
xYRza2kgd3JvdGU6Cj4gSGVsbG8sCgpIaSwKCj4gd2hlbiBlaXRoZXIgInhsIHJlc3RvcmUiIG9y
ICJ4bCBjcmVhdGUiIGNvbW1hbmQgaXMgaW52b2tlZCwgYSBnbG9iYWwgbG9jayBpcyBhY3F1aXJl
ZCBoZXJlOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS94ZW4tcHJvamVjdC94ZW4vYmxvYi9tYXN0
ZXIvdG9vbHMveGwveGxfdm1jb250cm9sLmMjTDg3Ngo+IAo+IEknbSB0cnlpbmcgdG8gZmlndXJl
IG91dCB3aGF0IGlzIHRoZSBleGFjdCBpbXBvcnRhbmNlIG9mIHRoaXMgbG9jaz8gSXMgaXQgcmVh
bGx5IGNyaXRpY2FsIGZvciBYTCBvcGVyYXRpb24/IEkgaGF2ZSBhIHByZXR0eSBwb3dlcmZ1bCBt
YWNoaW5lIG9uIHdoaWNoIEkgd2FudCB0byBydW4gYSBmZXcgZG96ZW4gb2Ygc2hvcnQtbGl2ZWQg
Vk1zLiBUaGlzIGxvY2sgaXMgc2VyaW91c2x5IHNsb3dpbmcgbWUgZG93biwgbm90IGxldHRpbmcg
dG8gcmVzdG9yZSBtb3JlIHRoYW4gb25lIGRvbWFpbiBhdCBvbmNlLiBUdXJucyBvdXQgdGhhdCBl
dmVyeXRoaW5nIHN0aWxsIHdvcmtzIGZpbmUgKGFuZCBtdWNoIGZhc3Rlcikgd2hlbiBJIGNvbW1l
bnQtb3V0IHRoZSBsb2NrIGluIHRoZSBhYm92ZW1lbnRpb25lZCBwbGFjZSwgYnV0IEknbSBub3Qg
c3VyZSBpZiBpdCdzIGEgY29ycmVjdCBpbXByZXNzaW9uLgo+IAo+IERvZXMgYW55b25lIGtub3cg
aWYgdGhlcmUgaXMgYSBzaXR1YXRpb24gaW4gd2hpY2ggWGVuIHdvdWxkIHNjcmV3IHVwIHdpdGhv
dXQgdGhpcyBsb2NrPwoKSGVyZSBpcyB0aGUgcmVhc29uIGZvciB0aGUgbG9jazoKaHR0cHM6Ly94
ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXQ7aD1lYTRkY2U4OWQ0Nzhk
NjIzNDFjZDJmOWQ4OTQ0ZTIxNWY3MDg2MTQ0CgogIHhsOiBmcmVlIG1lbW9yeSBiZWZvcmUgYnVp
bGRpbmcgYSBkb21haW4KICBGcmVlIHRoZSBuZWVkZWQgYW1vdW50IG9mIG1lbW9yeSBiZWZvcmUg
cHJvY2VlZGluZyB3aXRoIHRoZSBkb21haW4KICBidWlsZC4KICBVc2UgYSBmaWxlbG9jayB0byBw
cmV2ZW50IG90aGVyIHhsIGluc3RhbmNlcyBmcm9tIGNvbmZsaWN0aW5nIGR1cmluZwogIHRoaXMg
b3BlcmF0aW9uLgoKU28gdGhlcmUgYXJlIHByb2JhYmx5IGNvbmZpZ3VyYXRpb25zIHdoZXJlIHRo
ZSBsb2NrIGlzbid0IHVzZWZ1bCwgb3IKdGhlcmUgYXJlIGJldHRlciB3YXlzIHRvIHJlc2VydmUg
bWVtb3J5IGZvciBkb21haW4gY3JlYXRpb24uCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
