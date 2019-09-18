Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E1FB5E49
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 09:50:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAUdn-0006op-IK; Wed, 18 Sep 2019 07:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAUdm-0006oP-81
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 07:44:42 +0000
X-Inumbo-ID: 2be8a700-d9e8-11e9-9625-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2be8a700-d9e8-11e9-9625-12813bfff9fa;
 Wed, 18 Sep 2019 07:44:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C16CAAD14;
 Wed, 18 Sep 2019 07:44:39 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
 <7a5adec2-4134-9617-555c-3dd2adf140ac@suse.com>
 <b1f9bb69-5fe5-69b8-0dce-93d13f363b0a@bitdefender.com>
 <5fe3bf07-31e7-12c8-ad2b-0fb1fe15c226@suse.com>
 <180e12c1-501b-d638-6f21-14e39de6dc06@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be3b70ed-7409-735c-2ed8-7ab11ac962fb@suse.com>
Date: Wed, 18 Sep 2019 09:44:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <180e12c1-501b-d638-6f21-14e39de6dc06@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxNzozOSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTcuMDkuMjAxOSAxODowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3LjA5LjIwMTkgMTc6
MDAsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gVGhlcmUgaXMgbm8gcHJvYmxl
bSwgSSB1bmRlcnN0YW5kIHRoZSByaXNrIG9mIGhhdmluZyBzdXNwaWNpb3VzIHJldHVybgo+Pj4g
dmFsdWVzLiBJIGFtIG5vdCBoYW5nZWQgb24gaGF2aW5nIHRoaXMgcmV0dXJuLiBJIHVzZWQgdGhp
cyB0byBza2lwCj4+PiBhZGRpbmcgYSBuZXcgcmV0dXJuIHZhbHVlLiBJIGNhbiBkbyB0aGlzIGlm
IHdlIGFncmVlIG9uIGEgc3VpdGFibGUgbmFtZQo+Pj4gZm9yIGEgbmV3IHJldHVybiB2YWx1ZSBp
biBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQuIEkgY2FuIHByb3Bvc2UKPj4+IEhWTVRSQU5T
X2JhZF9nZm5fYWNjZXNzLgo+Pgo+PiBIb3cgaW50cnVzaXZlIHdvdWxkIHN1Y2ggYSBjaGFuZ2Ug
YmU/Cj4+Cj4gCj4gT25seSB0aGUgcmV0dXJuIGZvciBodm1fY29weV90b19ndWVzdF9saW5lYXIo
KSBhbmQgCj4gaHZtX2NvcHlfZnJvbV9ndWVzdF9saW5lYXIoKSB3aWxsIGJlIGFmZmVjdGVkLgo+
IFRoZXJlIGFyZSAyIHBsYWNlcyB0byBhZGQgY2hlY2tzLCBpbiBsaW5lYXJfd3JpdGUoKSBhbmQg
bGluZWFyX3JlYWQoKS4KPiBUaGUgbmV3IHJldHVybiB2YWx1ZSBjYW4gdHVybiB1cCBvbmx5IGlu
IGh2bV9lbXVsYXRlX29uZV92bV9ldmVudCgpIAo+IGNvbnRleHQsIHdoZW4gdm1fZXZlbnQtPnNl
bmRfZXZlbnQgZmxhZyBpcyB0cnVlLgoKQnV0IHdoeSB3b3VsZCBlLmcuIHRoZSBzd2l0Y2goKSBp
biBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpIG5vdAphbHNvIG5lZWQgYWRqdXN0bWVudD8gQW5k
IGlmIHRoZSBuZXcgcmV0dXJuIHZhbHVlIGlzIHRvIGJlCm1vc3RseSBzaW1pbGFyIHRvIEhWTVRS
QU5TX2dmbl9wYWdlZF9vdXQsIHRoaW5ncyBsaWtlCmh2bWVtdWxfcmVwX21vdnMoKSBvdWdodCB0
byBuZWVkIGFkanVzdG1lbnQgdG9vIChwb3NzaWJseSBqdXN0CmluIHRoZSBmb3JtIG9mIGFuIGFk
ZGVkIEFTU0VSVCgpLCBidXQgYW55d2F5KS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
