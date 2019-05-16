Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A74320CDD
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 18:24:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRJ99-0000pZ-K7; Thu, 16 May 2019 16:22:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=62Tc=TQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRJ98-0000pT-H8
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 16:22:18 +0000
X-Inumbo-ID: c3f5a4c0-77f6-11e9-911c-efd0d044e891
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3f5a4c0-77f6-11e9-911c-efd0d044e891;
 Thu, 16 May 2019 16:22:15 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: lakNmxa3rs6gniI/8rfj2kFGLtvpY2BdOEn+NVLCVqZtPcCgLl2neF/I5qR4lTU7mcM3vD4FPA
 jKerO1Yf7lVrUgu7edWT93ApsYylQDX5uhVf6RHu8/L6matF+2amqnEJ9fbB8G+UY26WfSq3xo
 0c95AtkCJiXL+JUFcLyMsIkvF0szEbdkBt+PzOmQWO8N9KSNnPD8ed1cXDBV+WFyGoGbckfPXx
 rKXBfMeEeuo/NUg9l4Z1bDdaZHFJYEt2qikzU4E7UbI5Pc6jaVgTnmbKSu+xKEpzij9/jsuS8W
 +JU=
X-SBRS: 2.7
X-MesageID: 516832
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="516832"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23773.36372.890326.392603@mariner.uk.xensource.com>
Date: Thu, 16 May 2019 17:21:40 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CDD7FD9020000780022FCC0@prv1-mh.provo.novell.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
 <5CDD7FD9020000780022FCC0@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIHByZXBhcmF0aW9ucyBmb3IgNC4x
MS4yIik6Cj4gVW5sZXNzIHRoZXNlIGFyZSByZWFsbHkgdXJnZW50IHRvIHB1dCBpbiwgSSdkIGxp
a2UgdGhlbSB0byBiZSBkZWZlcnJlZAo+IHRvIDQuMTEuMy4gV2l0aCBYU0EtMjk3IG91dCB3ZSd2
ZSBhbHJlYWR5IHN0YXJ0ZWQgdGhlIChsZWFmIHRyZWUpCj4gdGFnZ2luZyBwcm9jZXNzLCBzbyBJ
IHdhcyByZWFsbHkgaG9waW5nIHRvIGdldCB0aGlzIG11Y2ggZGVsYXllZAo+IHJlbGVhc2Ugb3V0
IHJhdGhlciBzb29uZXIgdGhhbiBsYXRlci4KCkknbSBzb3JyeSB0byB0aHJvdyBhIHNwYW5uZXIg
aW4gdGhlIHdvcmtzIGJ1dCBhdCB0aGUgdmVyeSBsZWFzdAoKICB0b29scy9vY2FtbDogRHVwMiAv
ZGV2L251bGwgdG8gc3RkaW4gaW4gZGFlbW9uaXplKCkKCmZpeGVzIHF1aXRlIGFuIGFsYXJtaW5n
IGJ1Zy4gIEFuZCBBbmR5IGlzIG1ha2luZyBhIGNhc2UgZm9yIHRoZSBTTVQKZml4ZXMuCgpDdXJy
ZW50bHkgSSBoYXZlIHRoZXNlIChub3QgeWV0IHB1c2hlZCk6Cgo5ODlhMmVjNGYzYmEgdG9vbHMv
eGw6IHVzZSBsaWJ4bF9kb21haW5faW5mbyB0byBnZXQgZG9tYWluIHR5cGUgZm9yIHZjcHUtcGlu
CmI1NWZmNGM4NzlhYyB0b29scy9saWJ4bDogY29ycmVjdCB2Y3B1IGFmZmluaXR5IG91dHB1dCB3
aXRoIHNwYXJzZSBwaHlzaWNhbCBjcHUgbWFwCjRiNzI0NzAxNzVhNSB0b29scy9vY2FtbDogRHVw
MiAvZGV2L251bGwgdG8gc3RkaW4gaW4gZGFlbW9uaXplKCkKNWM2YmU1OTViMWJjIHRvb2xzL21p
c2MveGVucG06IGZpeCBnZXR0aW5nIGluZm8gd2hlbiBzb21lIENQVXMgYXJlIG9mZmxpbmUKCkFu
ZHkgYWxzbyBtZW50aW9uZWQgdGhpczoKCj4gYzM5M2I2NGRjZWU2ICJ0b29scy9saWJ4YzogRml4
IGlzc3VlcyB3aXRoIGxpYnhjIGFuZCBYZW4gaGF2aW5nCj4gZGlmZmVyZW50IGZlYXR1cmVzZXQg
bGVuZ3RocyIKCndoaWNoIEkgdGhpbmsgbWF5IGJlIGltcG9ydGFudCBidXQgSSBhc2tlZCBhIHF1
ZXN0aW9uIGFib3V0IGl0LgoKClNvcnJ5LCBidXQgSSB0aGluayBpdCBtYXkgYmUgYmVzdCB0byB3
YWl0LiAgSSdtIG9wZW4gdG8gYmVpbmcKcGVyc3VhZGVkLi4uCgpSZWdhcmRzLApJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
