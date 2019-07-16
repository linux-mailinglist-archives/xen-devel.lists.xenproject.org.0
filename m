Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65746A150
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 06:24:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnExR-0005Bq-JG; Tue, 16 Jul 2019 04:20:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3lYY=VN=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1hnExQ-0005Bl-0Z
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 04:20:52 +0000
X-Inumbo-ID: 17e8bf86-a781-11e9-8980-bc764e045a96
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 17e8bf86-a781-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 04:20:50 +0000 (UTC)
Received: from [192.168.2.33] (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id CB827720090;
 Tue, 16 Jul 2019 05:17:33 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com CB827720090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1563268653;
 bh=pFQB+f5biUM02KU6u5qSb1m6XWhgFbGGUwrsn+xIAKw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=RiOSYZ/uj+NCj3M6ze+tg6qTsKmhXfO78MDb/LB9XzcgsJOhMthhS0hgb0SJkil/3
 XAl1W85fNZ7zuwrKGnWPWvbjryKEYRS6yNHOCa1smJv2IitwMreNlSiIrHX+/jKTp/
 +bMvl8UVbmZrqKuuBDlZpq13kKUVUMC27zQ/PALw=
To: Juergen Gross <jgross@suse.com>, "Foerster, Leonard" <foersleo@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1563217075.6815.14.camel@amazon.com>
 <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
 <35baad47-f22c-2378-a7a5-f0c48c3eafb8@suse.com>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <aca2e606-17fa-6266-1e9c-1989d4da6217@prgmr.com>
Date: Mon, 15 Jul 2019 21:20:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <35baad47-f22c-2378-a7a5-f0c48c3eafb8@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xNS8xOSA4OjQ4IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDE1LjA3LjE5IDIx
OjMxLCBTYXJhaCBOZXdtYW4gd3JvdGU6Cj4+IE9uIDcvMTUvMTkgMTE6NTcgQU0sIEZvZXJzdGVy
LCBMZW9uYXJkIHdyb3RlOgo+PiAuLi4KPj4+IEEga2V5IGNvcm5lcnN0b25lIGZvciBMaXZlLXVw
ZGF0ZSBpcyBndWVzdCB0cmFuc3BhcmVudCBsaXZlIG1pZ3JhdGlvbgo+PiAuLi4KPj4+IMKgwqDC
oMKgLT4gZm9yIGxpdmUgbWlncmF0aW9uOiBkb21pZCBpcyBhIHByb2JsZW0gaW4gdGhpcyBjYXNl
Cj4+PiDCoMKgwqDCoMKgwqDCoCAtPiByYW5kb21pemUgYW5kIHByYXkgZG9lcyBub3Qgd29yayBv
biBzbWFsbGVyIGZsZWV0cwo+Pj4gwqDCoMKgwqDCoMKgwqAgLT4gdGhpcyBpcyBub3QgYSBwcm9i
bGVtIGZvciBsaXZlLXVwZGF0ZQo+Pj4gwqDCoMKgwqDCoMKgwqAgLT4gQlVUOiBhcyBhIGNvbW11
bml0eSB3ZSBzaG91ZGwgbWFrZSB0aGlzIHJlc3RyaWN0aW9uIGdvIGF3YXkKPj4KPj4gQW5kcmV3
IENvb3BlciBwb2ludGVkIG91dCB0byBtZSB0aGF0IG1hbnVhbGx5IGFzc2lnbmluZyBkb21haW4g
SURzIGlzIHN1cHBvcnRlZCBpbiBtdWNoIG9mIHRoZSBjb2RlIGFscmVhZHkuIElmIGd1ZXN0IHRy
YW5zcGFyZW50IGxpdmUgbWlncmF0aW9uIAo+PiBnZXRzIG1lcmdlZCwgd2UnbGwgbG9vayBhdCBw
YXNzaW5nIGluIGEgZG9tYWluIElEIHRvIHhsLCB3aGljaCB3b3VsZCBiZSBnb29kIGVub3VnaCBm
b3IgdXMuIEkgZG9uJ3Qga25vdyBhYm91dCB0aGUgb3RoZXIgdG9vbHN0YWNrcy4KPiAKPiBUaGUg
bWFpbiBwcm9ibGVtIGlzIHRoZSBjYXNlIHdoZXJlIG9uIHRoZSB0YXJnZXQgaG9zdCB0aGUgZG9t
aWQgb2YgdGhlCj4gbWlncmF0ZWQgZG9tYWluIGlzIGFscmVhZHkgaW4gdXNlIGJ5IGFub3RoZXIg
ZG9tYWluLiBTbyB5b3UgZWl0aGVyIG5lZWQKPiBhIGRvbWlkIGFsbG9jYXRvciBzcGFubmluZyBh
bGwgaG9zdHMgb3IgdGhlIGNoYW5nZSBvZiBkb21pZCBkdXJpbmcKPiBtaWdyYXRpb24gbXVzdCBi
ZSBoaWRkZW4gZnJvbSB0aGUgZ3Vlc3QgZm9yIGd1ZXN0IHRyYW5zcGFyZW50IG1pZ3JhdGlvbi4K
Clllcy4gVGhlcmUgYXJlIHNvbWUgY2x1c3RlciBtYW5hZ2VtZW50IHN5c3RlbXMgd2hpY2ggdXNl
IHhsIHJhdGhlciB0aGFuIHhhcGkuClRoZXkgY291bGQgYmUgZXh0ZW5kZWQgdG8gbWFuYWdlIGRv
bWFpbiBJRHMgaWYgaXQncyB0b28gZGlmZmljdWx0IHRvIGFsbG93CnRoZSBkb21haW4gSUQgdG8g
Y2hhbmdlIGR1cmluZyBtaWdyYXRpb24uCgotLVNhcmFoCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
