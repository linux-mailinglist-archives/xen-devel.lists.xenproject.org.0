Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2C1C7C7
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:26:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVX0-0001CA-Pg; Tue, 14 May 2019 11:23:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQVWz-0001C5-CH
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:23:37 +0000
X-Inumbo-ID: b7330c22-763a-11e9-9312-171f98fab05f
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b7330c22-763a-11e9-9312-171f98fab05f;
 Tue, 14 May 2019 11:23:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41713374;
 Tue, 14 May 2019 04:23:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C84B3F71E;
 Tue, 14 May 2019 04:23:34 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <5CD3F266020000780022D0F3@prv1-mh.provo.novell.com>
 <1c8b7f5f-09d7-6e38-1e78-9528c1f0a756@arm.com>
 <5CDA8EF0020000780022E756@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d270589f-4076-ee40-d316-2939f67d7c0b@arm.com>
Date: Tue, 14 May 2019 12:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDA8EF0020000780022E756@prv1-mh.provo.novell.com>
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC8wNS8yMDE5IDEwOjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNC4wNS4x
OSBhdCAxMTozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gYSBzaW1pbGFy
IHRvcGljLCBob3cgZG9lcyBLZXhlYyB3b3JrcyBvbiBYZW4/IERvIHdlIHJlc2V0IHRoZQo+PiBk
b21haW4gYXMgd2VsbD8KPiAKPiBObywgaG93IGNvdWxkIHdlPyBXaGF0IGdldHMgaW52b2tlZCBp
c24ndCBYZW4gaW4gdGhlIGNvbW1vbiBjYXNlLAo+IGJ1dCBzb21lIG90aGVyICh0eXBpY2FsbHkg
YmFyZSBtZXRhbCkgT1MgbGlrZSBMaW51eC4KCkl0IGlzIG5vdCB3aGF0IEkgYXNrZWQuIFdoYXQg
SSBhc2tlZCBpcyB3aGV0aGVyIFhlbiBpcyBpbnZvbHZlZCB3aGVuIGEgZ3Vlc3QgCmtlcm5lbCBp
cyBrZXhlY2luZyB0byBhbm90aGVyIGtlcm5lbC4KCkkgZG9uJ3Qga25vdyBlbm91Z2ggS2V4ZWMg
dG8gYmUgYWJsZSB0byBhbnN3ZXIgdGhhdCBxdWVzdGlvbiBteXNlbGYuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
