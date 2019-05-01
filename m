Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8378106C7
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 11:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLly4-0008O9-HL; Wed, 01 May 2019 09:56:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLly2-0008O4-IA
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 09:55:58 +0000
X-Inumbo-ID: 4e64728c-6bf7-11e9-b0f6-238936d3ea30
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e64728c-6bf7-11e9-b0f6-238936d3ea30;
 Wed, 01 May 2019 09:55:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84835296"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23753.27941.895577.102414@mariner.uk.xensource.com>
Date: Wed, 1 May 2019 10:55:49 +0100
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>
In-Reply-To: <osstest-135426-mainreport@xen.org>
References: <osstest-135426-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [linux-linus test] 135426: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltsaW51eC1saW51cyB0ZXN0XSAxMzU0MjY6
IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+IGZsaWdodCAxMzU0MjYgbGludXgtbGludXMgcmVhbCBb
cmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3Mv
MTM1NDI2Lwo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3Vj
Y2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3Qg
YmUgcnVuOgo+ICB0ZXN0LWFybTY0LWFybTY0LWV4YW1pbmUgMTEgZXhhbWluZS1zZXJpYWwvYm9v
dGxvYWRlciBmYWlsIFJFR1IuIHZzLiAxMzM1ODAKClRoaXMgaXMgdGhlIGtub3duIHByb2JsZW0g
d2l0aCB0aGUgcm9jaGVzdGVycycgYm9vdGxvYWRlciBvdXRwdXQKKGFybTY0IGZpcm13YXJlIG9y
IGhhcmR3YXJlIGlzc3VlKS4gIEkgaGF2ZSBhbHJlYWR5IHJlcG9ydGVkIHRoaXMgdG8KdGhlIFhl
biBBUk0gZm9sa3Mgd2hvIGhhdmUgcHJvbWlzZWQgdG8gdHJ5IHRvIGhlbHAuLi4KCj4gIHRlc3Qt
YW1kNjQtYW1kNjQteGwtcWNvdzIgMTcgZ3Vlc3QtbG9jYWxtaWdyYXRlL3gxMCAgIGZhaWwgUkVH
Ui4gdnMuIDEzMzU4MAoKVGhpcyBpcyBhIGtub3duIHByb2JsZW0gd2l0aCBxY293MiBvbiBEZWJp
YW4gc3RyZXRjaC4gIFRoaXMgaXMKcHJvYmFibHkgYSBidWcgaW4gKHN0cmV0Y2gncykgcWVtdS4g
IEluIGFueSBjYXNlIGl0IGlzIGFwcGVhcmluZyBpbgphbGwgb3NzdGVzdCBmbGlnaHRzIGFuZCBp
cyBub3QgYSByZWdyZXNzaW9uIGluIHRoaXMgZmxpZ2h0LiAgSSBoYXZlCm5vdCBpbnZlc3RpZ2F0
ZWQgdGhpcyBwcm9wZXJseSB5ZXQuCgo+ICB0ZXN0LWFtZDY0LWFtZDY0LWxpYnZpcnQtdmhkIDE3
IGd1ZXN0LXN0YXJ0L2RlYmlhbi5yZXBlYXQgZmFpbCBSRUdSLiB2cy4gMTMzNTgwCgpUaGlzIGlz
IHRoZSB4ZW5zdG9yZSBtZW1vcnkgYWxsb2NhdGlvbiBlcnJvci4gIElESyB3aHkgdGhpcyBwYXNz
ZWQKYmVmb3JlLgoKPiAgYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgNiBrZXJuZWwtYnVp
bGQgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMzNTgwCgpUaGlzIGlzIHRoZSB0eXBlIG1p
c21hdGNoIGluIGBkbWFfYWxsb2NfY29oZXJlbnQnLiAgSSBoYXZlIHJlcG9ydGVkCnRoaXMgdG8g
QVJNIGZvbGtzLiAgV2UgdGhpbmsgaXQgaXMgZHVlIHRvIHRoZSBjb21waWxlciB1cGdyYWRlLCBi
dXQgaXQKc2hvdWxkIGNsZWFybHkgYmUgZml4ZWQuCgoKSSBkb24ndCB0aGluayB3ZSBzaG91bGQg
Zm9yY2UgcHVzaCB0aGlzIGF0IHRoaXMgc3RhZ2UuCgpGdXJ0aGVyLCBub3cgdGhhdCBvc3N0ZXN0
IGFwcGVhcnMgdG8gYmUgYnJvYWRseSB3b3JraW5nIEkgd291bGQKYXBwcmVjaWF0ZSBpdCBpZiBr
ZXJuZWwgbWFpbnRhaW5lcnMgd291bGQgdGFrZSBvdmVyIHRoZSB0YXNrIG9mCmtlZXBpbmcgYW4g
ZXllIG9uIHRoZXNlIHRlc3QgcmVwb3J0cy4KClBsZWFzZSB3b3VsZCB5b3UgbGV0IG1lIGtub3cg
d2hlbiB0aGUgb25seSByZW1haW5pbmcgaXNzdWVzIGFyZSB0aGUKZmFpbHVyZXMgaW4gdGVzdC1h
cm02NC1hcm02NC1leGFtaW5lIGFuZCB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFjb3cyLgpUaGVuIHdl
IChpZSwgSSkgc2hvdWxkIGZvcmNlIHB1c2ggaXQuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
