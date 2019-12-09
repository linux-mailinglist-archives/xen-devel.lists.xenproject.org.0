Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0A1116CE1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:13:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHsX-00040c-Fq; Mon, 09 Dec 2019 12:11:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieHsW-00040X-7w
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:11:04 +0000
X-Inumbo-ID: f7dee1ce-1a7c-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7dee1ce-1a7c-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 12:11:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B041ADE4;
 Mon,  9 Dec 2019 12:11:02 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191111202443.7154-1-andrew.cooper3@citrix.com>
 <ac802294-a1c6-d6cc-8684-2f50248d85ea@suse.com>
 <6ca0c51b-eb61-338f-4592-e7dd6ea3dc61@citrix.com>
 <17af65cf-fdbe-928e-e018-ee3dad31b59d@suse.com>
 <18da6d78-aac2-6a94-9b06-17a138c4aa64@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b241b5b-7ca3-e2ae-3642-0d921797a6cd@suse.com>
Date: Mon, 9 Dec 2019 13:11:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <18da6d78-aac2-6a94-9b06-17a138c4aa64@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: Drop bogus BOOLEAN
 definitions, TRUE and FALSE
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTIuMjAxOSAyMjowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8xMS8yMDE5
IDE0OjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQm90dG9tIGxpbmUgLSBJJ20gaGFsZiBjb252
aW5jZWQgYW5kIHdpbGxpbmcgdG8gZ2l2ZSBteSBhY2ssIGJ1dAo+PiBJJ20gbm90IGNvbnZpbmNl
ZCB5b3UgdHJ1bHkgdGhvdWdodCB0aHJvdWdoIHRoZSBsb25nZXIgdGVybQo+PiBjb25zZXF1ZW5j
ZXMuIEknZCB0aGVyZWZvcmUgYmUgZmFyIGhhcHBpZXIgdG8gc2VlIHRoaXMgcGF0Y2gKPj4gc3Bs
aXQgaW50byBhIG5vbi1jb250cm92ZXJzaWFsIHBhcnQgKGFueXRoaW5nIHRoYXQncyBub3QgdGll
ZCB0bwo+PiB0aGUgQUNQSSBhbmQgRUZJIGhlYWRlciBpbXBvcnRzKSwgYW4gQUNQSSwgYW5kIGFu
IEVGSSBwYXJ0Lgo+IAo+IEkgZG8gbm90IHdhbnQgdG8gd3JpdGluZyB0aGUgc2FtZSBwYXRjaCBh
Z2FpbiBpbiAkTiB5ZWFycyB0aW1lIGJlY2F1c2UKPiByZXZpZXcgYW5kIENJIG1pc3NlZCBpdCBj
cmVlcGluZyBiYWNrIGluLgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhbiB1bnJlYXNvbmFi
bGUgcG9zaXRpb24gdG8gdGFrZS4KCkl0IGZvciBzdXJlIGlzbid0LiBZZXQgSSBhbHNvIGRvbid0
IHRoaW5rIHRob3VnaCBteSByZXF1ZXN0IGhvdyB0bwpzcGxpdCB0aGluZ3MgaXMuIEJ5IGFza2lu
ZyBmb3IgdGhlIHNwbGl0IEknbSBpbXBseWluZyB0aGF0IHdlIG1heQpzdGlsbCByZWFjaCBhZ3Jl
ZW1lbnQgb24gdGhlIGNvbnRyb3ZlcnNpYWwgcGFydHMsIGZhb2QuIFNhZGx5IG9uY2UKYWdhaW4g
dGhlcmUgYXJlIG5vIG90aGVyIG9waW5pb25zIGhlbHBpbmcgdG8gc29ydCB3aGljaCByb3V0ZSBt
YXkKYmUgdGhlIG92ZXJhbGwgcHJlZmVycmVkIG9uZS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
