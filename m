Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C411F294
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 14:06:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQscU-0006b6-GV; Wed, 15 May 2019 12:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQscT-0006b1-Cc
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 12:02:49 +0000
X-Inumbo-ID: 5a985d94-7709-11e9-8855-3f41b5fae118
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a985d94-7709-11e9-8855-3f41b5fae118;
 Wed, 15 May 2019 12:02:47 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: tyHxMEBnEGp0T2j02LVOkq1LCfKKV4+2iUaiSWTRwIpcKtt/Z76uUR0O2RS2DUid4vV3eX+w4a
 vSghpHNTbh0eUKweH0asdPfYWP3ZL8mTdW3jWx3t5jzsGPZmRndqSMfwRA+6RO/negWSblL8vu
 StpCb3z+DoLI/KASda5UKgH0zz18epLgps9Pxszy55Br077ge2eb0npvBil0MKUIqCzu0ngMn7
 t7phu4xNKd0UhPvzD2HbFeYLYez/XwMGr6RThT23tFbBLHsnKwi8XjubkcFyEh7LIYZq/YP6aF
 Tvo=
X-SBRS: 2.7
X-MesageID: 460879
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="460879"
Date: Wed, 15 May 2019 13:02:35 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190515120235.GQ2798@zion.uk.xensource.com>
References: <20190515114015.25492-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515114015.25492-1-anthony.perard@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] libxc: elf_kernel loader: Remove check for
 shstrtab
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTI6NDA6MTVQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhpcyB3YXMgcHJvYmFibHkgdXNlZnVsIHRvIGxvYWQgRUxGIE5vdGUsIGJ1dCBu
b3cgRUxGIG5vdGVzCj4gInNob3VsZCBsaXZlIGluIGEgUFRfTk9URSBzZWdtZW50IiAoZWxmbm90
ZS5oKS4KPiAKPiBXaXRoIG5vdGVzIGxpdmluZyBpbiBzZWdtZW50LCB0aGVyZSBhcmUgbm8gbmVl
ZCBmb3Igc2VjdGlvbnMsIHNvIHRoZXJlCj4gaXMgbm90aGluZyB0byBiZSBzdG9yZWQgaW4gdGhl
IHNoc3RydGFiLgo+IAo+IFRoaXMgcGF0Y2ggd291bGQgYWxsb3cgdG8gd3JpdGUgYSBzaW1wbGVy
IEVMRiBoZWFkZXIgZm9yIGFuIE9WTUYgYmxvYgo+ICh3aGljaCBpc24ndCBhbiBFTEYpIGFuZCBh
bGxvdyBpdCB0byBiZSBsb2FkZWQgYXMgYSBQVkgga2VybmVsLiBUaGUKPiBoZWFkZXIgb25seSBu
ZWVkcyB0byBkZWNsYXJlIHR3byBwcm9ncmFtIHNlZ21lbnRzOgo+IC0gb25lIHRvIHRlbGwgYW4g
RUxGIGxvYWRlciB3aGVyZSB0byBwdXQgdGhlIGJsb2IsCj4gLSBvbmUgZm9yIGEgWGVuIEVMRk5P
VEUuCj4gCj4gVGhlIEVMRk5PVEUgaXMgdG8gY29tcGx5IHRvIHRoZSBwdmggZGVzaWduIHdoaWNo
IHdhbnRzIHRoZQo+IFhFTl9FTEZOT1RFX1BIWVMzMl9FTlRSWSB0byBkZWNsYXJlIGEgYmxvYiBh
cyBjb21wYXB0aWJsZSB3aXRoIHRoZSBQVkgKPiBib290IEFCSS4KPiAKPiBOb3RlIHRoYXQgd2l0
aG91dCB0aGUgRUxGTk9URSwgbGlieGMgd2lsbCBsb2FkIGFuIEVMRiBidXQgd2l0aAo+IHRoZSBw
bGFpbiBFTEYgbG9hZGVyLCB3aGljaCBkb2Vzbid0IGNoZWNrIGZvciBzaHN0cnRhYi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
CkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
