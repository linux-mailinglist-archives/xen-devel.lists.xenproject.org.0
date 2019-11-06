Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A5F1D97
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 19:33:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSQ46-0004IJ-0L; Wed, 06 Nov 2019 18:29:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvBH=Y6=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iSQ43-0004IE-ML
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 18:29:55 +0000
X-Inumbo-ID: 6c532db8-00c3-11ea-a1b1-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c532db8-00c3-11ea-a1b1-12813bfff9fa;
 Wed, 06 Nov 2019 18:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2o6n8CD8PZxQzZPXheV6RxVtvLARIayA6hiY44SwJBI=; b=QDNv5wFnbi6NdGByTSV1UMp6Z6
 H4pVm83PNZoMx7XZk3LIZOcJHSEmeuEeDx0jPtXQoDlEG95aMWkbZNx5SqqlHVO9B8IVzFtZhkPgF
 1rbVJL/1pH0TQjOYyuo6RVD3h5rammf3NX80cSwPhW0QlskQFFRiPup1mXTVD+eOGIAw=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:46002
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iSQ4p-0000gx-CZ; Wed, 06 Nov 2019 19:30:43 +0100
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <e2f2efa0-8f52-087a-9c72-2c8b176cc092@eikelenboom.it>
Date: Wed, 6 Nov 2019 19:29:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMTEvMjAxOSAxNjoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gdXBkYXRlX3BhZ2luZ19t
b2RlKCkgaW4gdGhlIEFNRCBJT01NVSBjb2RlIGV4cGVjdHMgdG8gYmUgaW52b2tlZCB3aXRoCj4g
dGhlIFBDSSBkZXZpY2VzIGxvY2sgaGVsZC4gVGhlIGNoZWNrIG9jY3VycmluZyBvbmx5IHdoZW4g
dGhlIG1vZGUKPiBhY3R1YWxseSBuZWVkcyB1cGRhdGluZywgdGhlIHZpb2xhdGlvbiBvZiB0aGlz
IHJ1bGUgYnkgdGhlIG1ham9yaXR5Cj4gb2YgY2FsbGVycyBkaWQgZ28gdW5ub3RpY2VkIHVudGls
IHBlci1kb21haW4gSU9NTVUgc2V0dXAgd2FzIGNoYW5nZWQKPiB0byBkbyBhd2F5IHdpdGggb24t
ZGVtYW5kIGNyZWF0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzLgo+IAo+IFVuZm9ydHVuYXRlbHkg
dGhlIG9ubHkgaGFsZiB3YXkgcmVhc29uYWJsZSBmaXggdG8gdGhpcyB0aGF0IEkgY291bGQKPiBj
b21lIHVwIHdpdGggcmVxdWlyZXMgbW9yZSByZS13b3JrIHRoYW4gd291bGQgc2VlbSBkZXNpcmFi
bGUgYXQgdGhpcwo+IHRpbWUgb2YgdGhlIHJlbGVhc2UgcHJvY2VzcywgYnV0IGFkZHJlc3Npbmcg
dGhlIGlzc3VlIHNlZW1zCj4gdW5hdm9pZGFibGUgdG8gbWUgYXMgaXRzIG1hbmlmZXN0YXRpb24g
aXMgYSByZWdyZXNzaW9uIGZyb20gdGhlCj4gSU9NTVUgcGFnZSB0YWJsZSBzZXR1cCByZS13b3Jr
LiBUaGUgY2hhbmdlIGFsc28gaXNuJ3Qgd2l0aG91dCByaXNrCj4gb2YgZnVydGhlciByZWdyZXNz
aW9ucyAtIGlmIGluIHBhdGNoIDIgSSd2ZSBtaXNzZWQgYSBjb2RlIHBhdGggdGhhdAo+IHdvdWxk
IGFsc28gbmVlZCB0byBpbnZva2UgdGhlIG5ldyBob29rLCB0aGVuIHRoaXMgbWlnaHQgbWVhbiBu
b24tCj4gd29ya2luZyBndWVzdHMgKHdpdGggcGFzc2VkLXRocm91Z2ggZGV2aWNlcyBvbiBBTUQg
aGFyZHdhcmUpLgo+IAo+IDE6IEFNRC9JT01NVTogZG9uJ3QgbmVlZGxlc3NseSB0cmlnZ2VyIGVy
cm9ycy9jcmFzaGVzIHdoZW4gdW5tYXBwaW5nIGEgcGFnZQo+IDI6IGludHJvZHVjZSBHRk4gbm90
aWZpY2F0aW9uIGZvciB0cmFuc2xhdGVkIGRvbWFpbnMKPiAzOiBBTUQvSU9NTVU6IHVzZSBub3Rp
ZnlfZGZuKCkgaG9vayB0byB1cGRhdGUgcGFnaW5nIG1vZGUKPiAKPiBKYW4KPiAKCkhpIEphbiwK
CkkganVzdCB0ZXN0ZWQgYW5kIEkgZG9uJ3QgZ2V0IHRoZSAgInBjaWRldnMiIG1lc3NhZ2UgYW55
IG1vcmUuCgpJIGFzc3VtZSB0aGlzIG9ubHkgd2FzIGEgZml4IGZvciB0aGF0IGlzc3VlLCBzbyBp
dCdzIHByb2JhYmx5IGV4cGVjdGVkCnRoYXQgdGhlIG90aGVyIGlzc3VlOgogICBBTUQtVmk6IElO
VkFMSURfREVWX1JFUVVFU1QgMDAwMDA4MDAgOGEwMDAwMDAgZjgwMDA4NDAgMDAwMDAwZmQKICAg
YW5kIG1hbGZ1bmN0aW9uaW5nIGRldmljZSBpbiBvbmUgb2YgdGhlIGd1ZXN0cy4KaXMgc3RpbGwg
YXJvdW5kLgoKLS0KU2FuZGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
