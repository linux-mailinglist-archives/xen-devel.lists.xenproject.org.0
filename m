Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CBB130F0E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 10:00:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioOC8-0006LX-HK; Mon, 06 Jan 2020 08:57:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioOC7-0006LF-5T
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 08:57:03 +0000
X-Inumbo-ID: 80de829a-3062-11ea-aad7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80de829a-3062-11ea-aad7-12813bfff9fa;
 Mon, 06 Jan 2020 08:57:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C5AFABB1;
 Mon,  6 Jan 2020 08:57:01 +0000 (UTC)
To: Aaron Janse <aaron@ajanse.me>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <2006e043-240d-fede-034c-7898d855f18d@suse.com>
 <6a9a3a45-5b92-46e9-8732-62e7629810a2@www.fastmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e0ac060-4a1b-1eef-90f0-a04f6dcd3985@suse.com>
Date: Mon, 6 Jan 2020 09:57:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6a9a3a45-5b92-46e9-8732-62e7629810a2@www.fastmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAwMTozNSwgIEFhcm9uIEphbnNlICB3cm90ZToKPiBPbiBGcmksIEphbiAz
LCAyMDIwLCBhdCA0OjUxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRGlkIHlvdSB0cnkgZGlz
YWJsaW5nIHVzZSBvZiB0aGUgSU9NTVUgKCJpb21tdT0wIiBvbiB0aGUgWGVuCj4+IGNvbW1hbmQg
bGluZSk/Cj4gCj4gVW5mb3J0dW5hdGVseSwgUXViZXMgcmVxdWlyZXMgaW9tbXUuIFNldHRpbmcg
ImlvbW11PTAiIHJlc3VsdHMgaW4gYSBwYW5pYzoKPiAKPiBgYGAKPiBDb3VsZG4ndCBlbmFibGUg
SU9NTVUgYW5kIGlvbW11PXJlcXVpcmVkL2ZvcmNlCj4gYGBgCgpTaW5jZSB0aGlzIGlzbid0IHRo
ZSB1cHN0cmVhbSBkZWZhdWx0LCB0aGVyZSBhcmUgdHdvIG9wdGlvbnM6IEVpdGhlcgp5b3Ugc2lt
cGx5IGhhdmUgZS5nLiAiaW9tbXU9Zm9yY2UiIGVsc2V3aGVyZSBvbiB0aGUgY29tbWFuZCBsaW5l
IC0gaW4KdGhpcyBjYXNlIHNpbXBseSBkZWxldGUgdGhlIG9wdGlvbiBmb3IgdGhpcyBleHBlcmlt
ZW50aW5nLiBPciB0aGV5J3ZlCnBhdGNoZWQgdGhlaXIgc291cmNlcyB0byB0aGlzIGVmZmVjdCwg
aW4gd2hpY2ggY2FzZSB5b3UnbGwgd2FudCB0bwp1bmRvIHRoYXQgc291cmNlIGNoYW5nZS4KCj4g
SSBjb3VsZG4ndCBmaW5kIGFueXdoZXJlIHRvIGRpc2FibGUgdGhlIGZsYWcgKGV2ZW4gdGhvdWdo
IGl0IHdvdWxkIGJyZWFrCj4gUXViZXMsIGF0IGxlYXN0IHRoZSBmbGFnIGNvdWxkIGhlbHAgbWlu
aW1pemUgdGhlIHNjb3BlIG9mIHRoZSBjYXVzZSBvZiB0aGUKPiB0aW1lciBjcmFzaCkuCj4gCj4g
SSBpbnN0YWxsZWQgWGVuIG9uIEFyY2ggTGludXggaW4gb3JkZXIgdG8gdGVzdCB0aGlzIGZsYWcs
IGJ1dCBJJ20gaGF2aW5nCj4gdGhlIHNhbWUgcHJvYmxlbSBJIGhhZCBvbiBVYnVudHU6IGJvb3Rp
bmcgdG8gWGVuIGhhbmdzIG9uIGxvYWRpbmcKPiBpbml0cmFtZnMuIFsxXQoKQm9vdGluZyB3aGlj
aCBleGFjdCB2ZXJzaW9uIG9mIFhlbj8gSWlyYyB0aGVzZSBpbml0cmFtZnMgaXNzdWVzCih3aXRo
IExaNCBjb21wcmVzc2lvbikgaGF2ZSBiZWVuIGZpeGVkIG9uIDQuMTMuMCBhcyB3ZWxsIGFzCjQu
MTIuMi4gQWxzbyB5b3UgbWF5IG5vdCBoYXZlIHJlYWxpemVkIHRoYXQgX2FueV8gaW5pdHJhbWZz
IChvcgpEb20wIGtlcm5lbCBpbWFnZSkgaXNzdWUgY291bGQgYmUgYXZvaWRlZCBmb3IgdGhlIHB1
cnBvc2VzIGhlcmUKYnkgc2ltcGx5IG9taXR0aW5nIHRoZW0gZnJvbSB0aGUgZGlyZWN0aXZlcyBp
c3N1ZWQgdG8gZ3J1YiAtCmFmdGVyIGFsbCB5b3UgZG9uJ3QgZ2V0IGFzIGZhciBhcyBib290aW5n
IERvbTAuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
