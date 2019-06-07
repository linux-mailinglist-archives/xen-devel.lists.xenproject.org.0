Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8638E9C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 17:11:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZGTy-0007Tu-SO; Fri, 07 Jun 2019 15:08:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3I92=UG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hZGTx-0007Tj-CI
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 15:08:41 +0000
X-Inumbo-ID: 2145ec9c-8936-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2145ec9c-8936-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 15:08:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD098AEB3;
 Fri,  7 Jun 2019 15:08:38 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-7-ankur.a.arora@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <97d41abd-3717-1f78-4d5e-dfa74261e9c7@suse.com>
Date: Fri, 7 Jun 2019 17:08:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509172540.12398-7-ankur.a.arora@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 06/16] x86/xen: add shared_info support
 to xenhost_t
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+IEhZUEVSVklTT1Jfc2hhcmVk
X2luZm8gaXMgdXNlZCBmb3IgaXJxL2V2dGNobiBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlCj4g
Z3Vlc3QgYW5kIHRoZSBob3N0LiBBYnN0cmFjdCBvdXQgdGhlIHNldHVwL3Jlc2V0IGluIHhlbmhv
c3RfdCBzdWNoIHRoYXQKPiBuZXN0ZWQgY29uZmlndXJhdGlvbnMgY2FuIHVzZSBib3RoIHhlbmhv
c3RzIHNpbXVsdGFuZW91c2x5LgoKSSBoYXZlIG1peGVkIGZlZWxpbmdzIGFib3V0IHRoaXMgcGF0
Y2guIE1vc3Qgb2YgdGhlIHNoYXJlZF9pbmZvIHN0dWZmIHdlCmRvbid0IG5lZWQgZm9yIHRoZSBu
ZXN0ZWQgY2FzZS4gSW4gdGhlIGVuZCBvbmx5IHRoZSBldmVudCBjaGFubmVscyBtaWdodApiZSBp
bnRlcmVzdGluZywgYnV0IHdlIG9idmlvdXNseSB3YW50IHRoZW0gbm90IGZvciBhbGwgdmNwdXMg
b2YgdGhlIEwxCmh5cGVydmlzb3IsIGJ1dCBmb3IgdGhvc2Ugb2YgdGhlIGN1cnJlbnQgZ3Vlc3Qu
CgpTbyBJIHRoaW5rIGp1c3QgZHJvcCB0aGF0IHBhdGNoIGZvciBub3cuIFdlIGNhbiBkaWcgaXQg
b3V0IGxhdGVyIGluIGNhc2UKbmVzdGluZyB3YW50cyBpdCBhZ2Fpbi4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
