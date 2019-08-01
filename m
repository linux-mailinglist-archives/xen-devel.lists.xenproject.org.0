Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA907D8E8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 11:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht7nm-0007Ls-09; Thu, 01 Aug 2019 09:55:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gEk7=V5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ht7nl-0007Ln-2j
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 09:55:13 +0000
X-Inumbo-ID: 73132754-b442-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 73132754-b442-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 09:55:10 +0000 (UTC)
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
IronPort-SDR: d3Q3dlh7d+aXr8eNnu6jZQTxbeXeoE87Vbz6s9O/i8DbJzjyHRjuy0OglKioNEI0RSXzn6EymS
 JSGMP5EJqbCHVAs8hOnss81ct36Fz4mIoFONBcqZczL3x4Ne1zu29HscF0TReV/87EAIKsscfD
 COT+JM29X8UUW+UAEjWgcPyvJv5SL29R2XItgVj6iLrBsy8RF5Psr/xYmptReIjkBMbt1yDlNJ
 GWhC4uG0XUzSSeLzEl7HIfwxXJB2rJThJ2Vkc9KU5Aq+9XFiNnKUhH9hD8VRRv3yfmEHfBPiMz
 Bvw=
X-SBRS: 2.7
X-MesageID: 3751616
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,333,1559534400"; 
   d="scan'208";a="3751616"
Date: Thu, 1 Aug 2019 10:55:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Message-ID: <20190801095500.GB5791@perard.uk.xensource.com>
References: <20190731162434.12837-1-volodymyr_babchuk@epam.com>
 <bb494090-f6d4-8f19-5784-8f8b20cbafdd@citrix.com>
 <CAOcoXZY5Kwtuy9nLxaxw5FLd0jSmjuvZfNc3SYyuKVP7HtG2tg@mail.gmail.com>
 <FA7398EE-7206-40B7-9AAD-D0D6155C5DE4@gmail.com> <8736imhyt0.fsf@epam.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8736imhyt0.fsf@epam.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] CODING_STYLE: clarify function argument
 indentation
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDU6NTc6MzJQTSArMDAwMCwgVm9sb2R5bXlyIEJhYmNo
dWsgd3JvdGU6Cj4gTGFycyBLdXJ0aCB3cml0ZXM6Cj4gPiBVbHRpbWF0ZWx5IHdlIGhhdmUgdG8g
bWFrZSBzb21lIHRyYWRlLW9mZnMgYXMgdG8gd2hhdCBpcyBtb3JlIGltcG9ydGFudDoKPiA+IGEp
IGF1dG9tYXRpYyBzdHlsZSBjaGVja2luZyAtIHdoaWNoIG1lYW5zICJjb21tb24gc2Vuc2UiIGNh
bid0IGJlIGZvcm1hbGlzZWQgYW5kIHRoZXJlIHdpbGwgYmUgYm91bmRhcnkgY2FzZXMgbGlrZSB0
aGUgYWJvdmUKPiA+IGIpIHJlY2xhaW1pbmcgY29kZSByZXZpZXcgYmFuZHdpZHRoIHRocm91Z2gg
YXV0b21hdGlvbiBvciBnb2luZyBmb3IgYSBsYWJvdXIgaW50ZW5zaXZlIG1hbnVhbCBhcHByb2Fj
aAo+IEkgbGlrZSB0aGUgbGludXgga2VybmVsIGFwcHJvYWNoLiAgY2hlY2twYXRjaC5wbCBwcm9k
dWNlcyBlcnJvcnMsIHdoaWNoIGFyZQo+ICJubyBnbyIsIGJ1dCBpdCBhbHNvIHByb2R1Y2VzIHdh
cm5pbmdzIGZvciBzdWNoIGJvdW5kYXJ5IGNhc2VzLCBmb3IKPiBtYWludGFpbmVyL3Jldmlld2Vy
IHRvIGRlY2lkZS4KClllcyEgUUVNVSBhbHNvIHVzZXMgY2hlY2twYXRjaC5wbCBzY3JpcHQgYW5k
IEkgZm91bmQgdGhhdCB2ZXJ5IHVzZWZ1bAooYm90aCBhcyByZXZpZXdlciBhbmQgYXV0aG9yIG9m
IGEgcGF0Y2gpLiBJdCB0ZWxscyB5b3Ugd2hhdCBhcmUgdGhlCmNvZGluZyBzdHlsZSB2aW9sYXRp
b24gaW4gbmV3bHkgYWRkZWQgY29kZSBhbmQgZG9lc24ndCB0cnkgdG8gcmVmb3JtYXQKdGhlIHdo
b2xlIGZpbGUuCgpCdXQgdGhhdCBzY3JpcHQgd291bGQgbmVlZHMgcXVpdGUgYSBsb3Qgb2YgcmV3
cml0aW5nLCBJIHRoaW5rLCB0byBiZQphYmxlIHRvIGJlIHVzZWQgb24gdGhlIG11bHRpcGxlIGNv
ZGluZyBzdHlsZSBvZiB4ZW4uZ2l0LgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
