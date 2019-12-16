Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD01205F1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:39:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpcq-0004GD-P9; Mon, 16 Dec 2019 12:37:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igpcp-0004Fv-8r
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:37:23 +0000
X-Inumbo-ID: ce34cb70-2000-11ea-939b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce34cb70-2000-11ea-939b-12813bfff9fa;
 Mon, 16 Dec 2019 12:37:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CE73AF65;
 Mon, 16 Dec 2019 12:37:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
 <5e833675-602c-7aa6-4fb7-34814355b844@suse.com>
 <8c98d4bb-52cd-3a78-f063-f791f1d37980@citrix.com>
 <73109279-76ec-3127-9d01-d901f6701f6c@suse.com>
 <c438d19a-2dcc-ebcd-dddc-7f8c4df899b9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d27447f-979c-65ec-635e-1aec109ffb73@suse.com>
Date: Mon, 16 Dec 2019 13:37:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c438d19a-2dcc-ebcd-dddc-7f8c4df899b9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86: explicitly disallow guest
 access to PPIN
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMjAxOSAxMzoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNi8xMi8yMDE5
IDExOjQ3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IMKgIFdoYXQKPj4+IHlvdSd2ZSBkb25lIGhl
cmUgaXMgaGFsZi12aXJ0dWFsaXNlIHNvbWV0aGluZyB3ZSBoYXZlIG5vIGludGVudGlvbiB0bwo+
Pj4gZXZlciB2aXJ0dWFsaXNlIGZvciBndWVzdHMuCj4+Pgo+Pj4gQm90aCBvZiB0aGVzZSBzaG91
bGQgYmUgYmxhbmtldCAjR1AgZmF1bHRzLsKgIEFNRCBzaG91bGQgbmV2ZXIgYmUgaW4gdGhlCj4+
PiBwb3NpdGlvbiBvZiBzZWVpbmcgYW1kX3BwaW4gY2xlYXIgYnV0IFBQSU5fQ1RMIHJldHVybmlu
ZyBMT0NLT1VULCBhbmQKPj4+IHdoaWxlIEludGVsIGRvZXMgaGF2ZSBtb2RlbCBzcGVjaWZpYyBi
ZWhhdmlvdXIsIHdoYXRldmVyIGVsc2UgbWlnaHQgYmUKPj4+IGJlaGluZCB0aGF0IE1TUiBvYnZp
b3VzbHkgc2hvdWxkbid0IGJlIGxlYWtpbmcgdGhvdWdoIGVpdGhlci4KPj4gSW4gdGhlIGludGVy
ZXN0IG9mIGdldHRpbmcgdGhpcyBhY2stZWQgSSBtaWdodCBzd2l0Y2ggdG8gdGhlCj4+IGJsYW5r
ZXQtI0dQIGFzIHlvdSBzdWdnZXN0LCBidXQgSSdtIGhhdmluZyB0cm91YmxlIHNlZWluZyB3aHkK
Pj4gZ2l2aW5nIGJhY2sgc2FuZSAoYW5kIHNhZmUpIHZhbHVlcyBpcyB3cm9uZy4gVGhpcyBpc24n
dCBtZWFudAo+PiB0byBpbmRpY2F0ZSB3ZSBtaWdodCB2aXJ0dWFsaXplIG1vcmUgb2YgdGhpcy4g
QnV0IHdoeSBpbmN1ciBhbgo+PiB1bm5lY2Vzc2FyeSAjR1AoMCkgaW4gdGhlIGd1ZXN0IHdoZW4g
d2UgY2FuIGluZGljYXRlIHRoZSBzYW1lCj4+IGluIGEgbW9yZSAiZnJpZW5kbHkiIG1hbm5lcj8K
PiAKPiBXaHkgYWRkIGRlYWQgY29kZSB0byBYZW4/CgpXZWxsLCBhcyB5b3Ugc2FpZCB5b3Vyc2Vs
ZiAtIGF0IGxlYXN0IHRoZSBJbnRlbCBwYXJ0IG9mIHRoaXMKaXNuJ3QgcmVhbGx5IGRlYWQuIE9m
IGNvdXJzZSB3ZSBfZXhwZWN0XyBndWVzdCBrZXJuZWxzIHRvIGNvcGUKd2l0aCAjR1AgaGVyZSwg
YnV0IHRoZXJlIGFyZSBtYW55IGV4cGVjdGF0aW9ucyBvZiBvdXJzIHdoaWNoCmdldCB2aW9sYXRl
ZCAuLi4gKFRvIGdpdmUgYSBjb25jcmV0ZSBleGFtcGxlIGluIHRoaXMgdmVyeSBhcmVhCm9mIGNv
ZGU6IEEgY3VzdG9tZXIgb2Ygb3VycyBub3RpY2VkIHRoZSB4MkFQSUMgTVNScyBoYXZpbmcKYmVj
b21lIGluYWNjZXNzaWJsZSBhdCBzb21lIHBvaW50LiBDbGVhcmx5IHdlIGRpZG4ndCBleHBlY3Qg
UFYKZ3Vlc3RzIHRvIHRyeSB0byBhY2Nlc3MgdGhlbS4pCgo+IEl0IGlzIHVubmVjZXNzYXJ5IGNv
bXBsZXhpdHkgaW4gc29tZSBhbHJlYWR5LWNvbXBsaWNhdGVkIGZ1bmN0aW9ucyB3aGljaAo+IGFy
ZSBnb2luZyB0byBiZWNvbWUgZmFyIG1vcmUgY29tcGxpY2F0ZWQgYnkgdGhlIHRpbWUgd2UgZ2V0
IFhlbidzIE1TUgo+IGJlaGF2aW91ciBpbnRvIGEgc29tZXdoYXQtcmVhc29uYWJsZSBzdGF0ZS4K
CklmIHRoaXMgd2FzIHJlYWxseSBhYm91dCAiY29tcGxleGl0eSIsIEknZCBmdWxseSBhZ3JlZS4g
QnV0CndlIHRhbGsgYWJvdXQgdHdvIGluc3RhbmNlIG9mIGFsbW9zdCB0aGUgc2FtZSA1LWxpbmUg
cGllY2Ugb2YKY29kZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
