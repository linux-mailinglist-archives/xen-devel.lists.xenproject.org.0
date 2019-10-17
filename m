Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB53DB0E1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:16:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7T9-0001jH-0M; Thu, 17 Oct 2019 15:13:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zIrv=YK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iL7T8-0001j2-6y
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:13:38 +0000
X-Inumbo-ID: b125d4a0-f0f0-11e9-beca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b125d4a0-f0f0-11e9-beca-bc764e2007e4;
 Thu, 17 Oct 2019 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571325218;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qtmyQrQ5viZAHxlhRZJbUYisyVe9PUVzPGHT0RHaMPk=;
 b=BX+K4sb1fzBUoTuxVJKCTLWCI12LTzQ5cYA4e1a8xbjgWEUuISjjQtl3
 Hw+aVIzn28I04xTOflFwzHx+24FWiXmKmRrtZcdoCVgZLLVxtotoff3hm
 /rGppOO4YtEIUXHGT01Zyuh+KIlInQkC61m+rWluVu9P+jxioph5TElrQ M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5FHC2W5a3BYn2hg/hguBeVbuw0GGxKaoAEundZeevFYOUky6uyNw9CFsq/T6RMyVVySsyHmOaq
 Ma0yhPPvMDDOfMydmwFSkSnEu6UXjc9Ddn53YG2/GQuM4FzXtpUHqEHF40FoD8FYx8nhniWaYt
 SUUaSwKjGDcFjVTVME4cV/urKIBzG61zVVfwEda8ka+umy/INp+FkC7N+S1zwKP8Uz8c9S6bb9
 CNIFVI4fJNCm/DoKZiU8p/ua3CzcCJi5joZxW/SrlJYUrUBrYm1/oZD1CxseQR0+J/24jguzLi
 9iQ=
X-SBRS: 2.7
X-MesageID: 7115244
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,308,1566878400"; 
   d="scan'208";a="7115244"
Date: Thu, 17 Oct 2019 17:13:29 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20191017151329.GB17494@Air-de-Roger>
References: <1285554440.4009671.1570271711943.ref@mail.yahoo.com>
 <1285554440.4009671.1570271711943@mail.yahoo.com>
 <20191008083911.GA66437@Air-de-Roger>
 <20191009163556.GB18712@perard.uk.xensource.com>
 <508709693.2680109.1571266029778@mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <508709693.2680109.1571266029778@mail.yahoo.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] How PV frontend and backend initializes?
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "rnikola@vt.edu" <rnikola@vt.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTA6NDc6MDlQTSArMDAwMCwgdG9zaGVyIDEgd3JvdGU6
Cj4gCj4gQW50aG9ueSBhbmQgUm9nZXIsIHRoYW5rcyBmb3IgeW91ciBpbmZvcm1hdGl2ZSByZXNw
b25zZXMuIEl0IGhlbHBlZCBhIGxvdC4KPiAKPiAKPiA+IEknbSBob3dldmVyIHVuc3VyZSBieSB3
aGF0IHlvdSBtZWFuIHdpdGggaW5zdGFuY2UsIHNvIHlvdSBtaWdodCBoYXZlCj4gPiB0byBjbGFy
aWZ5IGV4YWN0bHkgd2hhdCB5b3UgbWVhbiBpbiBvcmRlciB0byBnZXQgYSBtb3JlIGNvbmNpc2UK
PiA+IHJlcGx5Lgo+IAo+IExldCdzIHNheSB0aGVyZSBhcmUgdHdvIERvbVUncywgYW5kIHRoZWly
IHJlc3BlY3RpdmUgbmV0d29yayBpbnRlcmZhY2VzIGFyZSB4ZW5icjAgYW5kIHhlbmJyMS4gVGhl
cmVmb3JlLCB0aGVyZSBzdXBwb3NlZCB0byBiZSB0d28gUFYgbmV0YmFjayBkcml2ZXJzIHJ1bm5p
bmcgaW4gRG9tMCAob3IgZHJpdmVyIGRvbWFpbik6IG9uZSBmb3IgeGVuYnIwIGFuZCBhbm90aGVy
IGZvciB4ZW5icjEuIEJ5IHRoZSB0ZXJtIGluc3RhbmNlLCBJIGFtIHJlZmVyaW5nIHRvIHRoZXNl
IGRyaXZlcnMuIElmIGxhdGVyIHRoZXJlIGNvbWVzIGFub3RoZXIgaW50ZXJmYWNlIHhlbmJyMywg
dGhlcmUgd2lsbCBiZSB0aGUgdGhpcmQgaW5zdGFuY2Ugb2YgdGhlIGJhY2tlbmQgZHJpdmVyLiBJ
IHdhcyB3b25kZXJpbmcgaG93IHRoZXNlIG11bHRpcGxlIGluc3RhbmNlcyBhcmUgY3JlYXRlZCBh
bmQgd2hlbi4KCkkgd291bGQgYXZvaWQgdXNpbmcgeGVuYnIqIGFzIHRoZSBub21lbmNsYXR1cmUg
aGVyZS4geGVuYnIwIGlzIHVzdWFsbHkKYSBicmlkZ2Ugd2l0aCBhIHBoeXNpY2FsIG5ldHdvcmsg
aW50ZXJmYWNlIHRoYXQgcHJvdmlkZXMgb3V0c2lkZQphY2Nlc3MgdG8gZ3Vlc3RzLiBUaGUgbmV0
d29yayBpbnRlcmZhY2VzIHlvdSBhcmUgcmVmZXJlZWluZyB0byBhcmUKdXN1YWxseSBjYWxsZWQg
dmlmcywgYW5kIGhhdmUgdmlmPGRvbWlkPi48aW5zdGFuY2U+IG5vbWVuY2xhdHVyZSBieQpkZWZh
dWx0ICh5b3UgY2FuIGNoYW5nZSB0aGUgaW50ZXJmYWNlIG5hbWUgb24gdGhlIHhsLmNmZyBjb25m
aWcgZmlsZSkuCgo+IE5vdywgYXMgeW91IHBvaW50ZWQgdG8gdGhlIHhlbiB0b29sc3RhY2ssIEkg
ZXhwbG9yZWQgeGwvbGlieGwgYSBsaXR0bGUgYml0LiBJIHJlYWxpemVkIGZvciB0d28gc2VwYXJh
dGUgZGV2aWNlcywgbGlieGwgY3JlYXRlcyB0d28gZGlmZmVyZW50IHBhdGhzIGJvdGggZm9yIHRo
ZSBmcm9udGVuZCBhbmQgYmFja2VuZC4gVGhlIE9TZXMga2VlcHMgd2F0Y2hpbmcgeGVuc3RvcmUg
cGF0aHMuIElmIGFuIE9TIGZpbmRzIGEgZGV2aWNlIG9mIHRoZSB0eXBlIGl0IGlzIGludGVyZXN0
ZWQgaW4sIGl0IGNyZWF0ZXMgdGhlIGluc3RhbmNlIG9mIHRoZSBjb3JyZXNwb25kaW5nIGRyaXZl
ciAoZnJvbnRlbmQgb3IgYmFja2VuZCkgaWYgdGhlIGRldmljZSBpcyBub3QgaW5pdGlhbGl6ZWQg
YWxyZWFkeS4gVGhlIHBhdGggaXMgdGhlIHBhcmFtZXRlciB3aGljaCBtYWtlIG9uZSBpbnN0YW5j
ZSBkaWZmZXJlbnQgZnJvbSB0aGUgb3RoZXJzLgoKVGhvc2UgaW5zdGFuY2VzIGFyZSB1bHRpbWF0
ZWx5IGNyZWF0ZWQgYnkgbmV0YmFjayBhcyBhIHJlc3BvbnNlIHRvCmRldmljZSBkYXRhIGJlaW5n
IHBvcHVsYXRlZCBvbiB4ZW5zdG9yZSwgc2VlIHhlbnZpZl9hbGxvYyBpbiB0aGUgTGludXgKa2Vy
bmVsLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
