Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26837209A9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 16:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRHMs-0005GH-Tu; Thu, 16 May 2019 14:28:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRHMr-0005G7-UH
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:28:21 +0000
X-Inumbo-ID: da699960-77e6-11e9-be46-cff3f40df198
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id da699960-77e6-11e9-be46-cff3f40df198;
 Thu, 16 May 2019 14:28:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F098E1715;
 Thu, 16 May 2019 07:28:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08C673F71E;
 Thu, 16 May 2019 07:28:16 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
 <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
 <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
 <0095c6f0-531c-3794-991e-662a9a1283be@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <837c80dd-4033-a54e-d700-454df167e2d0@arm.com>
Date: Thu, 16 May 2019 15:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0095c6f0-531c-3794-991e-662a9a1283be@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMTYvMDUvMjAxOSAxNToyNSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBI
ZWxsbyBKdWxpZW4sCj4gCj4gT24gMTYuMDUuMTkgMTY6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gVGhlIGxvY2sgY2FuIGJlIGNvbXBsZXRlbHkgcmVtb3ZlZCBhbnl3YXkuIFNlZSBteSBwcmV2
aW91cyBjb21tZW50cy4KPiAKPiBZb3Ugc3VnZ2VzdGVkIGtpbmRhIHNpbXBsaWZpZWQgdHJ5X2xv
Y2sgd2l0aCBydW5zdGF0ZSB1cGRhdGUgc2tpcHBpbmcgaW4gY2FzZSBvZiAKPiBmYWlsLgo+IFRo
ZSBxdWVzdGlvbiBoZXJlIGlzIGlmIHdlIGFyZSBPSyB3aXRoIG5vdCB1cGRhdGluZyBydW5zdGF0
ZSB1bmRlciBjaXJjdW1zdGFuY2VzPwoKV2VsbCwgaWYgeW91IGZhaWwgdGhlIGNoZWNrIHRoZW4g
aXQgbWVhbnMgc29tZW9uZSB3YXMgbW9kaWZ5aW5nIGl0IGJlaGluZCB5b3VyIApiYWNrLiBUaGF0
IHNvbWVvbmUgY291bGQgdXBkYXRlIHRoZSBydW5zdGF0ZSB3aXRoIHRoZSBuZXcgaW5mb3JtYXRp
b24gb25jZSBpdCBpcyAKbW9kaWZpZWQuIFNvIEkgY2FuJ3Qgc2VlIGlzc3VlIHdpdGggbm90IHVw
ZGF0aW5nIHRoZSBydW5zdGF0ZSBpbiB0aGUgY29udGV4dCBzd2l0Y2guCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
