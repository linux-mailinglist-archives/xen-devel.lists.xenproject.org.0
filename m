Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D849EFF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:16:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdC3C-0000DR-J9; Tue, 18 Jun 2019 11:13:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhYq=UR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdC3A-0000DI-Dg
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:13:16 +0000
X-Inumbo-ID: 1147e217-91ba-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1147e217-91ba-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:13:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 064D6344;
 Tue, 18 Jun 2019 04:13:15 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 228A53F246;
 Tue, 18 Jun 2019 04:15:00 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
 <a0eaef9c-543f-831c-c856-862f9e20c2f7@arm.com>
 <alpine.DEB.2.21.1906171541120.2072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <37bd50b0-e8dc-f9af-c6f4-613095c17ba8@arm.com>
Date: Tue, 18 Jun 2019 12:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906171541120.2072@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 03/10] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 JBeulich@suse.com, Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNy8wNi8yMDE5IDIzOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gVHVl
LCA3IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiArI2RlZmluZSBNRU1PUllfUE9M
SUNZX0FSTV9ERVZfbkdSRSAgICAgICAwCj4+PiArLyogQXJtIG9ubHkuIE91dGVyIFNoYXJlYWJs
ZSwgT3V0ZXIvSW5uZXIgV3JpdGUtQmFjayBDYWNoZWFibGUgbWVtb3J5ICovCj4+PiArI2RlZmlu
ZSBNRU1PUllfUE9MSUNZX0FSTV9NRU1fV0IgICAgICAgICAxCj4+Cj4+IEkgYW0gd29uZGVyaW5n
IHdoZXRoZXIgd2Ugc2hvdWxkIHB1dCBBcm0gKHJlc3AuIHg4NikgZGVmaW5lcyB1bmRlciBhbiBp
ZmRlZgo+PiBhcm0gKHJlc3AuIHg4NikuIERvIHlvdSBzZWUgYW55IHVzZSBpbiB0aGUgY29tbW9u
IHRvb2xzdGFjayBjb2RlIG9mIHRob3NlCj4+ICNpZmRlZj8KPiAKPiBZZXMsIHRoZXkgYXJlIHVz
ZWQgaW4gbGlieGxfY3JlYXRlLmMuIEkgd291bGQgcHJlZmVyIHRvIGF2b2lkCj4gaW50cm9kdWNp
bmcgI2lmZGVmIGhlcmUgYmVjYXVzZSBpdCB3aWxsIGFsbG93IHVzIHRvIGdldCBhd2F5IHdpdGgg
bm8KPiAjaWZkZWYgaW4gbGlieGwveGwuCgpXZWxsLCB5b3UgY2FuIGludHJvZHVjZSBhbiBhcmNo
IHNwZWNpZmljIGZ1bmN0aW9uIHRoYXQgY29udmVydCB0aGUgbWVtb3J5IApwb2xpY3kuIEJ1dCBJ
IHdpbGwgbGVhdmUgdGhpcyBkZWNpc2lvbiB0byB0aGUgdG9vbHMgbWFpbnRhaW5lcnMuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
