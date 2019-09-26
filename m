Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E3CBEE74
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:28:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQ2e-0001cZ-Ou; Thu, 26 Sep 2019 09:26:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDQ2c-0001cU-U0
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:26:26 +0000
X-Inumbo-ID: b67b168e-e03f-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b67b168e-e03f-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:26:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E142E1000;
 Thu, 26 Sep 2019 02:26:25 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F3823F67D;
 Thu, 26 Sep 2019 02:26:22 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Oleksandr'
 <olekstysh@gmail.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
 <7f18c7f3-1d25-6d24-b44b-27cf77163eec@arm.com>
 <3c719420dabd4cc1860f0d687cdc3f78@AMSPEX02CL03.citrite.net>
 <dc48b203-2213-ba55-3335-18328b4f78bf@arm.com>
 <2e20c26c2c7e4289bbb4a18481335087@AMSPEX02CL03.citrite.net>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3b68f173-9e02-154c-b37d-7ae87b97dce6@arm.com>
Date: Thu, 26 Sep 2019 10:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2e20c26c2c7e4289bbb4a18481335087@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCgpPbiA5LzI2LzE5IDEwOjE3IEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IElm
IHNvLCBJIHRoaW5rCj4+IGl0IHNob3VsZCBzdGF5IHdlcmUgaXQgaXMuIFRoaXMgaXMgYSBnZW5l
cmljIGZ1bmN0aW9uIHRoYXQgbWlnaHQgYmUKPj4gcmUtdXNlZCBmb3Igb3RoZXIgYXJjaGl0ZWN0
dXJlIGluIHRoZSBmdXR1cmUuCj4+Cj4gCj4gVGhhdCBzZWVtcyBsaWtlIGEgYml0IG9mIGEgbG9u
ZyBzaG90LiBJZiBJIHJlbW92ZSB0aGUgY2FsbCBmcm9tIGlvbW11X3NldHVwKCkgdGhlbiB0aGUg
b25seSByZW1haW5pbmcgY2FsbGVycyBhcmUgaW4geDg2IGNvZGUsIGJ1dCBJIHN1cHBvc2UgaXQg
Y2FuIHN0YXkgd2hlcmUgaXQgaXMgdG8gYXZvaWQgdGhlIGNodXJuLiBJJ2xsIHNwaW4gYSBuZXcg
dGVzdCBwYXRjaC4KCk5vdCByZWFsbHksIEkga25vdyB0aGF0IHdlIHdpbGwgbGlrZWx5IG5lZWQg
aXQgb24gQXJtIHdoZW4gTVNJIGRvb3JiZWxsIAp3aWxsIGJlIGV4cG9zZWQgdG8gdGhlIGd1ZXN0
IGJlY2F1c2Ugc29tZSBtYXBwaW5ncyBjYW5ub3QgYmUgYWNjZXNzZWQgYnkgCnRoZSBwcm9jZXNz
b3IuIEFsdGhvdWdoLCBJIGNhbid0IHRlbGwgd2hlbiB0aGlzIHdpbGwgaGFwcGVuLgoKQW55d2F5
LCBJIHdpbGwgaGF2ZSBhIGxvb2sgYXQgeW91ciBuZXh0IHBhdGNoIDopLgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
