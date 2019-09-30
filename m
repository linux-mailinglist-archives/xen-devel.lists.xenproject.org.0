Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37793C25EF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 20:12:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF07J-0007TQ-3f; Mon, 30 Sep 2019 18:09:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l1Tp=XZ=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iF07H-0007TK-BY
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 18:09:47 +0000
X-Inumbo-ID: 7b7235c4-e3ad-11e9-96dc-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by localhost (Halon) with ESMTPS
 id 7b7235c4-e3ad-11e9-96dc-12813bfff9fa;
 Mon, 30 Sep 2019 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JEpPEEJ3Cq5YHwi5ponnzgwN/V9SG/e5DDSdROahTUs=; b=dGNWHjzx29gcJfYdzC6WL4BuNR
 LLWFq46mHJjDVF0LKdA8y9XyBRvvd0XBdJejWSwiPPyqb4XM0zSFX+LYF+jnan8RUnGxrQhldt3It
 N8dtbTLhEsrfkQR09MW5fZxucH0v5UoZS8bJTc3x/7+T7oYUWCAEma+MvVeZgzD4xZ6k=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:56622
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iF07k-0002AS-EK; Mon, 30 Sep 2019 20:10:16 +0200
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20190930172327.784520-1-anthony.perard@citrix.com>
 <20190930172327.784520-3-anthony.perard@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <0590e03b-a455-1aa3-40f3-2ef96827d669@eikelenboom.it>
Date: Mon, 30 Sep 2019 20:10:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930172327.784520-3-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] libxl_pci: Fix guest shutdown with PCI
 PT attached
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDkvMjAxOSAxOToyMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gQmVmb3JlIHRoZSBw
cm9ibGVtYXRpYyBjb21taXQsIGxpYnhsIHVzZWQgdG8gaWdub3JlIGVycm9yIHdoZW4KPiBkZXN0
cm95aW5nIChmb3JjZSA9PSB0cnVlKSBhIHBhc3N0aHJvdWdoIGRldmljZS4gSWYgdGhlIERNIGZh
aWxlZCB0bwo+IGRldGFjaCB0aGUgcGNpIGRldmljZSB3aXRoaW4gdGhlIGFsbG93ZWQgdGltZSwg
dGhlIHRpbWVkIG91dCBlcnJvcgo+IHJhaXNlZCBza2lwIHBhcnQgb2YgcGNpX3JlbW92ZV8qLCBi
dXQgYWxzbyByYWlzZSB0aGUgZXJyb3IgdXAgdG8gdGhlCj4gY2FsbGVyIG9mIGxpYnhsX19kZXZp
Y2VfcGNpX2Rlc3Ryb3lfYWxsLCBsaWJ4bF9fZGVzdHJveV9kb21pZCwgYW5kCj4gdGh1cyB0aGUg
ZGVzdHJ1Y3Rpb24gb2YgdGhlIGRvbWFpbiBmYWlscy4KPiAKPiBXaGVuIGEgKnBjaV9kZXN0cm95
KiBmdW5jdGlvbiBpcyBjYWxsZWQgKHNvIHdlIGhhdmUgZm9yY2U9dHJ1ZSksIGVycm9yCj4gc2hv
dWxkIG1vc3RseSBiZSBpZ25vcmVkLiBJZiB0aGUgRE0gZGlkbid0IGNvbmZpcm1lZCB0aGF0IHRo
ZSBkZXZpY2UKPiBpcyByZW1vdmVkLCB3ZSB3aWxsIHByaW50IGEgd2FybmluZyBhbmQga2VlcCBn
b2luZyBpZiBmb3JjZT10cnVlLgo+IFRoZSBwYXRjaCByZW9yZGVyIHRoZSBmdW5jdGlvbnMgc28g
dGhhdCBwY2lfcmVtb3ZlX3RpbWVvdXQoKSBjYWxscwo+IHBjaV9yZW1vdmVfZGV0YXRjaGVkKCkg
bGlrZSBpdCdzIGRvbmUgd2hlbiBETSBjYWxscyBhcmUgc3VjY2Vzc2Z1bC4KPiAKPiBXZSBhbHNv
IGNsZWFuIHRoZSBRTVAgc3RhdGVzIGFuZCBhc3NvY2lhdGVkIHRpbWVvdXRzIGVhcmxpZXIsIGFz
IHNvb24KPiBhcyB0aGV5IGFyZSBub3QgbmVlZGVkIGFueW1vcmUuCj4gCj4gUmVwb3J0ZWQtYnk6
IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+Cj4gRml4ZXM6IGZhZTQ4
ODBjNDVmZTAxNWU1NjdhZmEyMjNmNzhiZjE3YTZkOThlMWIKPiBTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCkhpIEFudGhvbnksCgpKdXN0
IHRlc3RlZCBhbmQgaXQgd29ya3MgZm9yIG1lLCB0aGFua3MgIQoKLS0KU2FuZGVyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
