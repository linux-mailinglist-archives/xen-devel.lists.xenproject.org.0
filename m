Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D564FE160
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:35:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdah-0005zp-7X; Fri, 15 Nov 2019 15:32:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVdaf-0005zh-1m
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:32:53 +0000
X-Inumbo-ID: 2f84d426-07bd-11ea-a276-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f84d426-07bd-11ea-a276-12813bfff9fa;
 Fri, 15 Nov 2019 15:32:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 242B6B9F6;
 Fri, 15 Nov 2019 15:32:51 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <CABfawhkB6M8sTMdSU2t+BQqfZ6jTQjU5k9Q3337Jx8APnowxZg@mail.gmail.com>
 <d981d5d9-6ee0-4bf6-6c76-a217be918aac@citrix.com>
 <CABfawhnyNcnizN1yr-GqiowJFbcWUAOxLegNUEELS84Ftfv6Eg@mail.gmail.com>
 <04b09c11-0983-f77a-055c-15cbb5b9ffd1@citrix.com>
 <CABfawhma6ZW+DDfTr54CG9eF0=E1qHR_noWb6xETk_Bob7E3cg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d3ce8d1b-cf2f-43dc-1ad4-2b87f9e75149@suse.com>
Date: Fri, 15 Nov 2019 16:32:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CABfawhma6ZW+DDfTr54CG9eF0=E1qHR_noWb6xETk_Bob7E3cg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [TESTDAY] Test report
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMTkgMTY6MTksIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBPbiBGcmksIE5vdiAx
NSwgMjAxOSBhdCA0OjU2IEFNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+Pgo+PiBPbiAxNC8xMS8yMDE5IDIyOjM2LCBUYW1hcyBLIExlbmd5ZWwgd3Jv
dGU6Cj4+PiBPbiBUaHUsIE5vdiAxNCwgMjAxOSBhdCAxMTozOSBBTSBBbmRyZXcgQ29vcGVyCj4+
PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gT24gMTQvMTEvMjAxOSAx
ODozNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+PiAqIENvbW1lbnRzOiBBbGwgd29ya3Ms
IGFsdHAybStpbnRyb3NwZWN0aW9uIHJlcXVpcmVzIHRoZSBlcHQ9cG1sPTAKPj4+Pj4gYm9vdCBm
bGFnIHNwZWNpZmllZCB0byB3b3JrYXJvdW5kIGEgZGVhZGxvY2sgaW4gWGVuCj4+Pj4gSXMgdGhp
cyBzZXBhcmF0ZSBmcm9tIHRoZSBnZW5lcmFsIHByb2JsZW0gd2l0aCBFUFQgQS9EIGFuZAo+Pj4+
IHdyaXRlLXByb3RlY3RpbmcgcGFnZXRhYmxlcz8KPj4+Pgo+Pj4gSXQgc291bmRzIGxpa2UgaXQg
aXMsIGl0IGhhcHBlbnMgd2l0aG91dCB3cml0ZS1wcm90ZWN0aW5nIGluLWd1ZXN0Cj4+PiBwYWdl
dGFibGVzLiBJIGRpZG4ndCBoYXZlIHRpbWUgdG8gaW52ZXN0aWdhdGUgd2hlcmUgdGhlIGRlYWRs
b2NrCj4+PiBoYXBwZW5zIGFuZCBzaW5jZSB0aGUgd29ya2Fyb3VuZCBpcyBmaW5lIGZvciB0aGUg
dXNlY2FzZSBpdCB3YXNuJ3QgYQo+Pj4gcHJpb3JpdHkgdG8gZmlndXJlIG91dC4KPj4KPj4gVGhp
bmtpbmcgYWJvdXQgaXQsIFBNTCB3aWxsIGRvIHRoZSB3cm9uZyB0aGluZyAoZGVhZGxvY2tzIGFz
aWRlKSBhcyBzb29uCj4+IGFzIGFueSBhbHRwMm0gZ2ZuIHRyYW5zbGF0aW9ucyBhcmUgdXNlZC4K
Pj4KPj4gSSdkIGJlIHRlbXB0ZWQgdG8gd29yayBhcm91bmQgdGhlIGRlYWRsb2NrIGJ5IGRpc2Fi
bGluZyBwbWwgdGhlIG1vbWVudAo+PiBhbHRwMm0gaXMgdG91Y2hlZC4gIFRoYXQgd291bGQgZ2l2
ZSBhIHNpZ2h0bHkgbGVzcyBiYWQgdXNlciBleHBlcmllbmNlLAo+PiBhbmQgc2hvdWxkIGJlIGVh
c3kgdG8gc29ydCBmb3IgNC4xMy4KPj4KPj4gVGhvdWdodHMsIChpbmMuIEp1ZXJnZW4gYXMgUk0p
ID8KPiAKPiBUaGF0IHNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhIHRvIG1lLCB0aGF0IHdheSB5b3Ug
Y2FuIGtlZXAgcG1sIGZvcgo+IGd1ZXN0cyB3aGVyZSBpdCBkb2Vzbid0IGNhdXNlIGFuIGlzc3Vl
IGluc3RlYWQgb2YgZGlzYWJsaW5nIGl0IHN5c3RlbQo+IHdpZGUuCgpTb3VuZHMgbGlrZSBkZWNl
bnQgd2F5IHRvIGhhbmRsZSBpdC4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
