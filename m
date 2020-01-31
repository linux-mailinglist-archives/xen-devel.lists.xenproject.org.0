Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3814EEE1
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:59:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXi3-00051c-7y; Fri, 31 Jan 2020 14:55:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixXi1-00051X-Vo
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:55:50 +0000
X-Inumbo-ID: c49be212-4439-11ea-8bd7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c49be212-4439-11ea-8bd7-12813bfff9fa;
 Fri, 31 Jan 2020 14:55:49 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixXhz-0004iQ-PS; Fri, 31 Jan 2020 14:55:47 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixXhz-0001Qx-F0; Fri, 31 Jan 2020 14:55:47 +0000
Date: Fri, 31 Jan 2020 14:55:44 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200131145544.wzm7537gpzmx3bov@debian>
References: <20200131142557.2896-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131142557.2896-1-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/xenstore: don't apply write limiting
 for privileged domain
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

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDM6MjU6NTdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBYZW5zdG9yZSB3cml0ZSBsaW1pdGluZyBzaG91bGQgbm90IGJlIGFwcGxpZWQgdG8g
ZG9tMC4gVW5mb3J0dW5hdGVseQo+IHdyaXRlIGxpbWl0aW5nIGlzIGRpc2FibGVkIG9ubHkgZm9y
IGNvbm5lY3Rpb25zIHZpYSBzb2NrZXRzLiBXaGVuCj4gcnVubmluZyBpbiBhIHN0dWJkb20gWGVu
c3RvcmUgd2lsbCBhcHBseSB3cml0ZSBsaW1pdGluZyB0byBkb20wLCB0b28uCj4gQ2hhbmdlIHRo
YXQgYnkgdGVzdGluZyBmb3IgdGhlIGRvbWFpbiB0byBiZSBwcml2aWxlZ2VkIGFzIHdlbGwuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKQWNrZWQt
Ynk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgo+IC0tLQo+ICB0b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfZG9tYWluLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVk
X2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jCj4gaW5kZXggMWE4
MzA5Nzk1Mi4uYzdjNmM1NzRkZiAxMDA2NDQKPiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfZG9tYWluLmMKPiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMKPiBA
QCAtOTE4LDggKzkxOCw4IEBAIHZvaWQgd3JsX2FwcGx5X2RlYml0X2FjdHVhbChzdHJ1Y3QgZG9t
YWluICpkb21haW4pCj4gIHsKPiAgCXN0cnVjdCB3cmxfdGltZXN0YW1wdCBub3c7Cj4gIAo+IC0J
aWYgKCFkb21haW4pCj4gLQkJLyogc29ja2V0cyBlc2NhcGUgdGhlIHdyaXRlIHJhdGUgbGltaXQg
Ki8KPiArCWlmICghZG9tYWluIHx8ICFkb21pZF9pc191bnByaXZpbGVnZWQoZG9tYWluLT5kb21p
ZCkpCj4gKwkJLyogc29ja2V0cyBhbmQgZG9tMCBlc2NhcGUgdGhlIHdyaXRlIHJhdGUgbGltaXQg
Ki8KPiAgCQlyZXR1cm47Cj4gIAo+ICAJd3JsX2dldHRpbWVfbm93KCZub3cpOwo+IC0tIAo+IDIu
MTYuNAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
