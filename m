Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F01116C9F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:57:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHd3-0001jg-NI; Mon, 09 Dec 2019 11:55:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieHd2-0001ja-1G
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:55:04 +0000
X-Inumbo-ID: bb920162-1a7a-11ea-87c2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb920162-1a7a-11ea-87c2-12813bfff9fa;
 Mon, 09 Dec 2019 11:55:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1914EAEE9;
 Mon,  9 Dec 2019 11:55:02 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
Date: Mon, 9 Dec 2019 12:55:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209113926.GS980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTI6MzksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBEZWMg
MDUsIDIwMTkgYXQgMDI6MDE6MjFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBPbmx5
IGZvcmNlIHN0YXRlIHRvIGNsb3NlZCBpbiB0aGUgY2FzZSB3aGVuIHRoZSB0b29sc3RhY2sgbWF5
IG5lZWQgdG8KPj4gY2xlYW4gdXAuIFRoaXMgY2FuIGJlIGRldGVjdGVkIGJ5IGNoZWNraW5nIHdo
ZXRoZXIgdGhlIHN0YXRlIGluIHhlbnN0b3JlCj4+IGhhcyBiZWVuIHNldCB0byBjbG9zaW5nIHBy
aW9yIHRvIGRldmljZSByZW1vdmFsLgo+IAo+IEknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQg
b2YgdGhpcywgSSB3b3VsZCBleHBlY3QgdGhhdCBhIGZhaWx1cmUgdG8KPiBwcm9iZSBvciB0aGUg
cmVtb3ZhbCBvZiB0aGUgZGV2aWNlIHdvdWxkIGxlYXZlIHRoZSB4ZW5idXMgc3RhdGUgYXMKPiBj
bG9zZWQsIHdoaWNoIGlzIGNvbnNpc3RlbnQgd2l0aCB0aGUgYWN0dWFsIGRyaXZlciBzdGF0ZS4K
PiAKPiBDYW4geW91IGV4cGxhaW4gd2hhdCdzIHRoZSBiZW5lZml0IG9mIGxlYXZpbmcgYSBkZXZp
Y2Ugd2l0aG91dCBhCj4gZHJpdmVyIGluIHN1Y2ggdW5rbm93biBzdGF0ZT8KCkFuZCBtb3JlIGNv
bmNlcm5pbmc6IGRpZCB5b3UgY2hlY2sgdGhhdCBubyBmcm9udGVuZC9iYWNrZW5kIGlzCnJlbHlp
bmcgb24gdGhlIGNsb3NlZCBzdGF0ZSB0byBiZSB2aXNpYmxlIHdpdGhvdXQgY2xvc2luZyBoYXZp
bmcgYmVlbgpzZXQgYmVmb3JlPwoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
