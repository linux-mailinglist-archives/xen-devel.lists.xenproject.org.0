Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE64768907
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 14:39:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn0Di-0003dt-0v; Mon, 15 Jul 2019 12:36:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TQSl=VM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hn0Dh-0003do-0m
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 12:36:41 +0000
X-Inumbo-ID: 30f53cdf-a6fd-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30f53cdf-a6fd-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 12:36:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B99DAD14;
 Mon, 15 Jul 2019 12:36:38 +0000 (UTC)
To: Peter Zijlstra <peterz@infradead.org>
References: <20190715113739.17694-1-jgross@suse.com>
 <20190715123207.GE3419@hirez.programming.kicks-ass.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <83fd65e0-9b6f-39a0-4f10-4f535d523ac8@suse.com>
Date: Mon, 15 Jul 2019 14:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715123207.GE3419@hirez.programming.kicks-ass.net>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 Alok Kataria <akataria@vmware.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMTkgMTQ6MzIsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIE1vbiwgSnVsIDE1
LCAyMDE5IGF0IDAxOjM3OjM3UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRoZSBs
b25nIHRlcm0gcGxhbiBoYXMgYmVlbiB0byByZXBsYWNlIFhlbiBQViBndWVzdHMgYnkgUFZILiBU
aGUgZmlyc3QKPj4gdmljdGltIG9mIHRoYXQgcGxhbiBhcmUgbm93IDMyLWJpdCBQViBndWVzdHMs
IGFzIHRob3NlIGFyZSB1c2VkIG9ubHkKPj4gcmF0aGVyIHNlbGRvbSB0aGVzZSBkYXlzLiBYZW4g
b24geDg2IHJlcXVpcmVzIDY0LWJpdCBzdXBwb3J0IGFuZCB3aXRoCj4+IEdydWIyIG5vdyBzdXBw
b3J0aW5nIFBWSCBvZmZpY2lhbGx5IHNpbmNlIHZlcnNpb24gMi4wNCB0aGVyZSBpcyBubwo+PiBu
ZWVkIHRvIGtlZXAgMzItYml0IFBWIGd1ZXN0IHN1cHBvcnQgYWxpdmUgaW4gdGhlIExpbnV4IGtl
cm5lbC4KPj4gQWRkaXRpb25hbGx5IE1lbHRkb3duIG1pdGlnYXRpb24gaXMgbm90IGF2YWlsYWJs
ZSBpbiB0aGUga2VybmVsIHJ1bm5pbmcKPj4gYXMgMzItYml0IFBWIGd1ZXN0LCBzbyBkcm9wcGlu
ZyB0aGlzIG1vZGUgbWFrZXMgc2Vuc2UgZnJvbSBzZWN1cml0eQo+PiBwb2ludCBvZiB2aWV3LCB0
b28uCj4+Cj4+IEp1ZXJnZW4gR3Jvc3MgKDIpOgo+PiAgICB4ODYveGVuOiByZW1vdmUgMzItYml0
IFhlbiBQViBndWVzdCBzdXBwb3J0Cj4+ICAgIHg4Ni9wYXJhdmlydDogcmVtb3ZlIDMyLWJpdCBz
dXBwb3J0IGZyb20gUEFSQVZJUlRfWFhMCj4gCj4gSG9vcmF5IQo+IAoKQWx3YXlzIGEgcGxlYXN1
cmUgdG8gY2hlZXIgdGhlIGNvbW11bml0eSB1cCBieSBzZW5kaW5nIFhlbiBwYXRjaGVzLiA6LUQK
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
