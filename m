Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A26F17126C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 09:24:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7ERj-00011d-B3; Thu, 27 Feb 2020 08:23:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7ERh-00011Y-OF
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 08:23:01 +0000
X-Inumbo-ID: 5db0e096-593a-11ea-95f6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5db0e096-593a-11ea-95f6-12813bfff9fa;
 Thu, 27 Feb 2020 08:23:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0E0ACB1F1;
 Thu, 27 Feb 2020 08:23:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e63ccaf7-b25c-cc35-513a-80b98d2646aa@suse.com>
Date: Thu, 27 Feb 2020 09:23:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226202221.6555-11-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/10] x86/hvm: Do not enable MPX by default
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBNZW1vcnkgUHJvdGVj
dGlvbiBlWHRlbnNpb24gc3VwcG9ydCBoYXMgYmVlbiBkcm9wcGVkIGZyb20gR0NDIGFuZCBMaW51
eCwgYW5kCj4gd2lsbCBiZSBkcm9wcGVkIGZyb20gZnV0dXJlIEludGVsIENQVXMuCj4gCj4gV2l0
aCBhbGwgb3RoZXIgZGVmYXVsdC9tYXggcGllY2VzIGluIHBsYWNlLCBtb3ZlIE1QWCBmcm9tIGRl
ZmF1bHQgdG8gbWF4Lgo+IFRoaXMgbWVhbnMgdGhhdCBWTXMgd29uJ3QgYmUgb2ZmZXJlZCBpdCBi
eSBkZWZhdWx0LCBidXQgY2FuIGV4cGxpY2l0bHkgb3B0Cj4gaW50byB1c2luZyBpdCB2aWEgY3B1
aWQ9Imhvc3QsbXB4PTEiIGluIHRoZWlyIHZtLmNmZyBmaWxlLgo+IAo+IFRoZSBkaWZmZXJlbmNl
IGFzIHZpc2libGUgdG8gdGhlIGd1ZXN0IGlzOgo+IAo+ICAgZGlmZiAtLWdpdCBhL2RlZmF1bHQg
Yi9tcHgKPiAgIGluZGV4IDBlOTE3NjVkNmIuLmM4YzMzY2Q1ODQgMTAwNjQ0Cj4gICAtLS0gYS9k
ZWZhdWx0Cj4gICArKysgYi9tcHgKPiAgIEBAIC0xMywxNSArMTMsMTcgQEAgTmF0aXZlIGNwdWlk
Ogo+ICAgICAgMDAwMDAwMDQ6MDAwMDAwMDQgLT4gMDAwMDAwMDA6MDAwMDAwMDA6MDAwMDAwMDA6
MDAwMDAwMDAKPiAgICAgIDAwMDAwMDA1OmZmZmZmZmZmIC0+IDAwMDAwMDAwOjAwMDAwMDAwOjAw
MDAwMDAwOjAwMDAwMDAwCj4gICAgICAwMDAwMDAwNjpmZmZmZmZmZiAtPiAwMDAwMDAwMDowMDAw
MDAwMDowMDAwMDAwMDowMDAwMDAwMAo+ICAgLSAgMDAwMDAwMDc6MDAwMDAwMDAgLT4gMDAwMDAw
MDA6MDA5YzJmYmI6MDAwMDAwMDA6OWMwMDA0MDAKPiAgICsgIDAwMDAwMDA3OjAwMDAwMDAwIC0+
IDAwMDAwMDAwOjAwOWM2ZmJiOjAwMDAwMDAwOjljMDAwNDAwCj4gICAgICAwMDAwMDAwODpmZmZm
ZmZmZiAtPiAwMDAwMDAwMDowMDAwMDAwMDowMDAwMDAwMDowMDAwMDAwMAo+ICAgICAgMDAwMDAw
MDk6ZmZmZmZmZmYgLT4gMDAwMDAwMDA6MDAwMDAwMDA6MDAwMDAwMDA6MDAwMDAwMDAKPiAgICAg
IDAwMDAwMDBhOmZmZmZmZmZmIC0+IDAwMDAwMDAwOjAwMDAwMDAwOjAwMDAwMDAwOjAwMDAwMDAw
Cj4gICAgICAwMDAwMDAwYjpmZmZmZmZmZiAtPiAwMDAwMDAwMDowMDAwMDAwMDowMDAwMDAwMDow
MDAwMDAwMAo+ICAgICAgMDAwMDAwMGM6ZmZmZmZmZmYgLT4gMDAwMDAwMDA6MDAwMDAwMDA6MDAw
MDAwMDA6MDAwMDAwMDAKPiAgIC0gIDAwMDAwMDBkOjAwMDAwMDAwIC0+IDAwMDAwMDA3OjAwMDAw
MjQwOjAwMDAwMzQwOjAwMDAwMDAwCj4gICArICAwMDAwMDAwZDowMDAwMDAwMCAtPiAwMDAwMDAx
ZjowMDAwMDI0MDowMDAwMDQ0MDowMDAwMDAwMAo+ICAgICAgMDAwMDAwMGQ6MDAwMDAwMDEgLT4g
MDAwMDAwMGY6MDAwMDAyNDA6MDAwMDAwMDA6MDAwMDAwMDAKPiAgICAgIDAwMDAwMDBkOjAwMDAw
MDAyIC0+IDAwMDAwMTAwOjAwMDAwMjQwOjAwMDAwMDAwOjAwMDAwMDAwCj4gICArICAwMDAwMDAw
ZDowMDAwMDAwMyAtPiAwMDAwMDA0MDowMDAwMDNjMDowMDAwMDAwMDowMDAwMDAwMAo+ICAgKyAg
MDAwMDAwMGQ6MDAwMDAwMDQgLT4gMDAwMDAwNDA6MDAwMDA0MDA6MDAwMDAwMDA6MDAwMDAwMDAK
PiAgICAgIDQwMDAwMDAwOmZmZmZmZmZmIC0+IDQwMDAwMDA1OjU2NmU2NTU4OjY1NTg0ZDRkOjRk
NGQ1NjZlCj4gICAgICA0MDAwMDAwMTpmZmZmZmZmZiAtPiAwMDA0MDAwZTowMDAwMDAwMDowMDAw
MDAwMDowMDAwMDAwMAo+ICAgICAgNDAwMDAwMDI6ZmZmZmZmZmYgLT4gMDAwMDAwMDE6NDAwMDAw
MDA6MDAwMDAwMDA6MDAwMDAwMDAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
