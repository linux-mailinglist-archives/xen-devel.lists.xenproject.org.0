Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043BDEC51
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 23:56:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLEDV-00066B-O0; Mon, 29 Apr 2019 21:53:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v5GZ=S7=rimuhosting.com=glenn@srs-us1.protection.inumbo.net>)
 id 1hLEDT-000665-M6
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 21:53:39 +0000
X-Inumbo-ID: 3e4b39c0-6ac9-11e9-843c-bc764e045a96
Received: from mail.rimuhosting.com (unknown [206.123.102.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3e4b39c0-6ac9-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 21:53:37 +0000 (UTC)
Received: from mail.rimuhosting.com (localhost [127.0.0.1])
 by mail.rimuhosting.com (Postfix) with ESMTP id 3262D61944;
 Mon, 29 Apr 2019 21:53:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail.rimuhosting.com
X-Spam-Level: 
X-Spam-Status: No, score=-109.2 required=6.0 tests=ALL_TRUSTED,BAYES_50,
 USER_IN_WHITELIST autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.0.140] (office.rimuhosting.com [203.86.204.227])
 by mail.rimuhosting.com (Postfix) with ESMTPSA id 1322E6186D;
 Mon, 29 Apr 2019 21:53:35 +0000 (UTC)
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-4-wipawel@amazon.de>
 <20190425045339.GE11831@char.us.oracle.com>
 <2a5512e7-7f82-340d-75cf-cd14be0018b9@citrix.com>
From: Glenn Enright <glenn@rimuhosting.com>
Organization: RimuHosting
Message-ID: <b67c1a12-ea7d-544f-f6ca-9bef7696a62f@rimuhosting.com>
Date: Tue, 30 Apr 2019 09:53:34 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2a5512e7-7f82-340d-75cf-cd14be0018b9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 4/6] livepatch-build:
 detect special section group sizes
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
Reply-To: glenn@rimuhosting.com
Cc: mpohlack@amazon.de, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDQvMTkgMjoxNCBBTSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gT24gNC8yNS8xOSA1
OjUzIEFNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgd3JvdGU6Cj4+IE9uIFR1ZSwgQXByIDE2LCAy
MDE5IGF0IDEyOjA3OjE0UE0gKzAwMDAsIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+Pj4g
SGFyZC1jb2RpbmcgdGhlIHNwZWNpYWwgc2VjdGlvbiBncm91cCBzaXplcyBpcyB1bnJlbGlhYmxl
LiBJbnN0ZWFkLAo+Pj4gZGV0ZXJtaW5lIHRoZW0gZHluYW1pY2FsbHkgYnkgZmluZGluZyB0aGUg
cmVsYXRlZCBzdHJ1Y3QgZGVmaW5pdGlvbnMKPj4+IGluIHRoZSBEV0FSRiBtZXRhZGF0YS4KPj4+
Cj4+PiBUaGlzIGlzIGEgbGl2ZXBhdGNoIGJhY2twb3J0IG9mIGtwYXRjaCB1cHN0cmVhbSBjb21t
aXQgWzFdOgo+Pj4ga3BhdGNoLWJ1aWxkOiBkZXRlY3Qgc3BlY2lhbCBzZWN0aW9uIGdyb3VwIHNp
emVzIDE3MDQ0OTg0NzEzNmE0OGIxOWZjCj4+Pgo+Pj4gWGVuIG9ubHkgZGVhbHMgd2l0aCBhbHRf
aW5zdHIsIGJ1Z19mcmFtZSBhbmQgZXhjZXB0aW9uX3RhYmxlX2VudHJ5Cj4+PiBzdHJ1Y3R1cmVz
LCBzbyBzaXplcyBvZiB0aGVzZSBzdHJ1Y3RlcnMgYXJlIG9idGFpbmVkIGZyb20geGVuLXN5bXMu
Cj4+Pgo+Pj4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVkIHNpbmNlIHdpdGggcmVjZW50IFhlbiB0aGUg
YWx0X2luc3RyIHN0cnVjdHVyZQo+Pj4gaGFzIGNoYW5nZWQgc2l6ZSBmcm9tIDEyIHRvIDE0IGJ5
dGVzLgo+Pgo+PiBPaCB0aGlzIGlzIHNvIG11Y2ggYmV0dGVyIHRoYW4gdGhlICJzb2x1dGlvbiIg
d2UgY29kZWQuCj4+Cj4+IFRoYW5rIHlvdSEKPj4KPj4gUm9zcywgd2lsbCBjb21taXQgdG8gcmVw
byB1bmxlc3MgeW91IGhhdmUgY29uY2VybnMuLgo+IEkgaGF2ZSByZXZpZXdlZCBpdCB3aXRoIGEg
ZmV3IGNvbW1lbnRzLiBOb3RlIHRoYXQgdGhpcyBpcyBiYXNpY2FsbHkgdGhlCj4gc2FtZSBhcyBH
bGVubiBFbnJpZ2h0J3MgcmVjZW50IHBhdGNoICgibGl2ZXBhdGNoLWJ1aWxkLXRvb2xzOiBEZXRl
Y3QKPiBzcGVjaWFsIHNlY3Rpb24gZ3JvdXAgc2l6ZXMiKSBidXQgc2xpZ2h0bHkgbW9yZSBjb21w
bGV0ZSBhcyBpdCBkZXRlY3RzCj4gc2l6ZXMgZm9yIHRoZSBidWcgZnJhbWVzIHRvbyBzbyBpdCBz
aG91bGQgcHJvYmFibHkgYmUgdXNlZCBpbnN0ZWFkLgo+IAo+IFRoYW5rcywKCgpUaGlzIGlzIGEg
Z29vZG5lc3MuIEdsYWQgdG8gc2VlIGFuIGFwcHJvcHJpYXRlIHBhdGNoIGdldCBpbiByZWdhcmRs
ZXNzCm9mIHdoaWNoIHBhdGNoIGlzIHVzZWQuCgpCZXN0LCBHbGVubgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
