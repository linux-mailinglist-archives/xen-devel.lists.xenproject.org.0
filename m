Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E86712BA0
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 12:38:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMVXb-0001Lp-99; Fri, 03 May 2019 10:35:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMVXY-0001Lk-VL
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 10:35:40 +0000
X-Inumbo-ID: 26ff2ea0-6d8f-11e9-a5c1-837720a2a6df
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26ff2ea0-6d8f-11e9-a5c1-837720a2a6df;
 Fri, 03 May 2019 10:35:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,425,1549929600"; d="scan'208";a="85050034"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23756.6502.516380.800716@mariner.uk.xensource.com>
Date: Fri, 3 May 2019 11:35:18 +0100
To: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>
In-Reply-To: <20190502162550.21038-1-anthony.perard@citrix.com>
References: <20190502162550.21038-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/Makefile: Fix build of QEMU,
 remove --source-path
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
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkaW5nIFN0ZWZhbm8gZm9yIGFyY2hhZWxvZ2ljYWwgcmVhc29ucy4KCkFudGhvbnkgUEVSQVJE
IHdyaXRlcyAoIltQQVRDSF0gdG9vbHMvTWFrZWZpbGU6IEZpeCBidWlsZCBvZiBRRU1VLCByZW1v
dmUgLS1zb3VyY2UtcGF0aCIpOgo+IEZvbGxvd2luZyBRRU1VJ3MgY29tbWl0IDc5ZDc3YmNkMzYg
KGNvbmZpZ3VyZTogUmVtb3ZlIC0tc291cmNlLXBhdGgKPiBvcHRpb24pLCBYZW4ncyBidWlsZCBz
eXN0ZW0gZmFpbHMgdG8gYnVpbGQgcWVtdS14ZW4uIFRoZSAtLXNvdXJjZS1wYXRoCj4gb3B0aW9u
IGdpdmVzIHJlZHVuZGFudCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbG9jYXRpb24gb2YgdGhlIHNv
dXJjZXMKPiBzbyBzaW1wbHkgcmVtb3ZlIGl0LiAoY29uZmlndXJlIGFscmVhZHkgbG9va3MgYXQg
aXRzICQwIHRvIGZpbmQgdGhlCj4gc291cmNlLXBhdGguKQoKRm9yIFhlbiBzdGFnaW5nOgoKQWNr
ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSSB3YW50ZWQg
dG8gZm9sbG93IHRoZSBwcmluY2lwbGUgb2YgQ2hlc3RlcnRvbidzIEZlbmNlIFsxXSwKcGFydGlj
dWxhcmx5IHRvIGtub3cgaG93IGZhciBiYWNrIHRvIGJhY2twb3J0IHRoaXMgY2hhbmdlLCBzbyBJ
CmNoZWNrZWQgdGhlIGdpdCBoaXN0b3J5LiAgVGhpcyBvcHRpb24gaGFzIGJlZW4gcGFzc2VkIHNp
bmNlIHRoZSB2ZXJ5CmZpcnN0IHRpbWUgeGVuLmdpdCBidWlsdCBxZW11IHVwc3RyZWFtLCBpbgog
ICBlNzM3YjQzMzNiYjI4N2I2MTM0YTg5ZWRmZjJiZGUyYTdlMDQ4YTllCiAgIENsb25lIGFuZCBi
dWlsZCB1cHN0cmVhbSBRZW11IGJ5IGRlZmF1bHQKClN0ZWZhbm8sIGNhbiB5b3UgcmVtZW1iZXIg
YW55dGhpbmcgYWJvdXQgdGhpcyA/ICBEWUsgaG93IGZhciBiYWNrIHdlCnNob3VsZCBiYWNrcG9y
dCB0aGlzIGNoYW5nZSA/CgpUaGFua3MsCklhbi4KClsxXSBodHRwczovL2VuLndpa2lwZWRpYS5v
cmcvd2lraS9DaGVzdGVydG9uJTI3c19mZW5jZSNDaGVzdGVydG9uJ3NfZmVuY2UKCj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0t
Cj4gVGhpcyBwYXRjaCB3b3VsZCB1bmJsb2NrIHRoZSBxZW11LW1haW5saW5lIGJyYW5jaCBpbiBv
c3N0ZXN0Lgo+IC0tLQo+ICB0b29scy9NYWtlZmlsZSB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9NYWtlZmlsZSBiL3Rvb2xzL01h
a2VmaWxlCj4gaW5kZXggYzkwM2Q2YTYzZS4uOTljYmM5NTBkYyAxMDA2NDQKPiAtLS0gYS90b29s
cy9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL01ha2VmaWxlCj4gQEAgLTI0Niw3ICsyNDYsNiBAQCBz
dWJkaXItYWxsLXFlbXUteGVuLWRpcjogcWVtdS14ZW4tZGlyLWZpbmQKPiAgCQktLXByZWZpeD0k
KExJQkVYRUMpIFwKPiAgCQktLWxpYmRpcj0kKExJQkVYRUNfTElCKSBcCj4gIAkJLS1pbmNsdWRl
ZGlyPSQoTElCRVhFQ19JTkMpIFwKPiAtCQktLXNvdXJjZS1wYXRoPSQkc291cmNlIFwKPiAgCQkt
LWV4dHJhLWNmbGFncz0iLURYQ19XQU5UX0NPTVBBVF9FVlRDSE5fQVBJPTEgXAo+ICAJCS1EWENf
V0FOVF9DT01QQVRfR05UVEFCX0FQST0xIFwKPiAgCQktRFhDX1dBTlRfQ09NUEFUX01BUF9GT1JF
SUdOX0FQST0xIFwKPiAtLSAKPiBBbnRob255IFBFUkFSRAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
