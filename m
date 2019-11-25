Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DE7109045
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:44:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFZ5-0003mz-6H; Mon, 25 Nov 2019 14:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZFZ3-0003mu-GP
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 14:42:09 +0000
X-Inumbo-ID: bf589aca-0f91-11ea-b3bd-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf589aca-0f91-11ea-b3bd-bc764e2007e4;
 Mon, 25 Nov 2019 14:42:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1CF5AD18;
 Mon, 25 Nov 2019 14:42:03 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <070c28df-c4b4-dd49-fb9d-efb233f39b0d@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7cf3d8b-9706-b31b-6ee5-a9f8af0ad142@suse.com>
Date: Mon, 25 Nov 2019 15:42:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <070c28df-c4b4-dd49-fb9d-efb233f39b0d@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable + linux 5.4.0-rc8: RIP:
 0010:xennet_poll+0x35f/0xae0
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxNToyMSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IEwuUy4sCj4g
Cj4gQXQgcHJlc2VudCBvbmUgb2YgbXkgUFZIIFZNJ3Mga2VybmVsIGNyYXNoZWQgd2l0aCB0aGUg
c3BsYXQgYmVsb3cKPiAoaGF2ZW4ndCBzZWVuIGl0IGJlZm9yZSwgc28gY291bGQgYmUgc29tZXRo
aW5nIHRoYXQgaGFwcGVucyBzcG9yYWRpY2FsbHkpLgo+IAo+IEFueSBpZGVhcyA/Cj4gCj4gLS0K
PiBTYW5kZXIKPiAKPiAKPiAKPiBkYXRhYmFzZSBkYXRhYmFzZWxvZ2luOiAgbG9naW46IFsxODQ1
MDMuNDI4ODExXSBnZW5lcmFsIHByb3RlY3Rpb24gZmF1bHQ6IDAwMDAgWyMxXSBTTVAgTk9QVEkK
PiBbMTg0NTAzLjQyODg4N10gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50
ZWQgNS40LjAtcmM4LTIwMTkxMTIzLWRvZmxyLW1hYzgwMjExZGVidWcrICMxCj4gWzE4NDUwMy40
Mjg5MzJdIFJJUDogMDAxMDp4ZW5uZXRfcG9sbCsweDM1Zi8weGFlMAo+IFsxODQ1MDMuNDI4OTU1
XSBDb2RlOiBiYSAwMCAwMSAwMCAwMCA0OCA4YiA4ZCBjMCAwMCAwMCAwMCAwZiBiNyBiNCAyNCA5
MiAwMCAwMCAwMCA0OCA4YiA1YyAyNCA3OCAzZCAwMCAwMSAwMCAwMCAwZiA0ZSBkMCA4OSA1NSAy
OCA4YiA5NSBiYyAwMCAwMCAwMCA8ODk+IDc0IDExIDNjIDQ4IDhiIDhkIGMwIDAwIDAwIDAwIDhi
IDk1IGJjIDAwIDAwIDAwIDg5IDQ0IDExIDM4IDg5CgpUaGUgaW5zbiBoZXJlIGJlaW5nICJtb3Yg
ICAgICVlc2ksKCVyY3gsJXJkeCwweDNjKSIgLi4uCgo+IFsxODQ1MDMuNDI5MDI3XSBSU1A6IDAw
MTg6ZmZmZmM5MDAwMDAwM2UxMCBFRkxBR1M6IDAwMDEwMjg3Cj4gWzE4NDUwMy40MjkwNDldIFJB
WDogMDAwMDAwMDAwMDAwMDA0MiBSQlg6IGZmZmZjOTAwMDAwMDNlODggUkNYOiBmZmZlODg4MDBi
ODY1YTgwCgouLi4gSSBub3RpY2UgY29ycnVwdGlvbiB0byBiaXQgNDggb2YgUkNYIGhlcmUuIFRo
aXMgY2FuIGJlIGEgcmVzdWx0IG9mCm1lbW9yeSBjb3JydXB0aW9uLCBidXQgcHJpb3IgaW5zdGFu
Y2VzIG9mIHN1Y2ggdGhhdCBJIGhhZCB0byBsb29rIGludG8Kd2VyZSBiaXQgZmxpcHMgaW4gdGhl
IENQVSBpbnN0ZWFkLiBJcyB0aGlzIGEgc2VydmVyIG9yIGRlc2t0b3AgY2xhc3MKQ1BVPwoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
