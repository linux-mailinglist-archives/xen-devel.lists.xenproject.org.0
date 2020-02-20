Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5B165AF6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:01:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4icE-0005sa-JV; Thu, 20 Feb 2020 09:59:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4icD-0005sV-Tu
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:59:29 +0000
X-Inumbo-ID: aeab036e-53c7-11ea-84f2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeab036e-53c7-11ea-84f2-12813bfff9fa;
 Thu, 20 Feb 2020 09:59:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4icB-0004pm-3g; Thu, 20 Feb 2020 09:59:27 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4icA-0001kQ-Qi; Thu, 20 Feb 2020 09:59:27 +0000
Date: Thu, 20 Feb 2020 00:48:16 +0000
From: Wei Liu <wl@xen.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200220004816.qydrhtyedkko4rc7@debian>
References: <cover.1582143896.git.linux@eikelenboom.it>
 <416169fe34ec346a5edde2c66c4b017871c2a891.1582143896.git.linux@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <416169fe34ec346a5edde2c66c4b017871c2a891.1582143896.git.linux@eikelenboom.it>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/3] tools/xentop: Fix calculation of used
 memory.
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvZGUgbG9va3MgY29ycmVjdCB0byBtZSwgYnV0IEkgd291bGQgbGlrZSB0byBhZGQgdGhl
IGZvbGxvd2luZwpjb21taXQgbWVzc2FnZSB0byB0aGlzIGNoYW5nZS4KClVzZWQgbWVtb3J5IHNo
b3VsZCBiZSBjYWxjdWxhdGVkIGJ5IHN1YnRyYWN0aW5nIGZyZWUgbWVtb3J5IGZyb20gdG90YWwK
bWVtb3J5LgoKCk9uIFdlZCwgRmViIDE5LCAyMDIwIGF0IDA5OjMxOjMwUE0gKzAxMDAsIFNhbmRl
ciBFaWtlbGVuYm9vbSB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBTYW5kZXIgRWlrZWxlbmJvb20g
PGxpbnV4QGVpa2VsZW5ib29tLml0Pgo+IC0tLQo+ICB0b29scy94ZW5zdGF0L3hlbnRvcC94ZW50
b3AuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0YXQveGVudG9wL3hlbnRvcC5jIGIvdG9v
bHMveGVuc3RhdC94ZW50b3AveGVudG9wLmMKPiBpbmRleCBhZjExZWJmYmY3Li4xM2I2MTJmMjZk
IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3hlbnN0YXQveGVudG9wL3hlbnRvcC5jCj4gKysrIGIvdG9v
bHMveGVuc3RhdC94ZW50b3AveGVudG9wLmMKPiBAQCAtOTY5LDcgKzk2OSw3IEBAIHZvaWQgZG9f
c3VtbWFyeSh2b2lkKQo+ICAJICAgICAgIiV1IGNyYXNoZWQsICV1IGR5aW5nLCAldSBzaHV0ZG93
biBcbiIsCj4gIAkgICAgICBudW1fZG9tYWlucywgcnVuLCBibG9jaywgcGF1c2UsIGNyYXNoLCBk
eWluZywgc2h1dGRvd24pOwo+ICAKPiAtCXVzZWQgPSB4ZW5zdGF0X25vZGVfdG90X21lbShjdXJf
bm9kZSk7Cj4gKwl1c2VkID0geGVuc3RhdF9ub2RlX3RvdF9tZW0oY3VyX25vZGUpLXhlbnN0YXRf
bm9kZV9mcmVlX21lbShjdXJfbm9kZSk7CgpBbHNvLCBJIHdpbGwgYWRkIHNwYWNlcyBhcm91bmQg
Ii0iLgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgo+ICAJZnJlZWFibGVfbWIgPSAw
Owo+ICAKPiAgCS8qIER1bXAgbm9kZSBtZW1vcnkgYW5kIGNwdSBpbmZvcm1hdGlvbiAqLwo+IC0t
IAo+IDIuMjAuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
