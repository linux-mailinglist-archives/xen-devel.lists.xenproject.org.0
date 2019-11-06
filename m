Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F4F19C4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 16:19:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSN2M-0003OD-Tn; Wed, 06 Nov 2019 15:15:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cVPj=Y6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSN2K-0003O8-QH
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 15:15:56 +0000
X-Inumbo-ID: 5364e7b2-00a8-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5364e7b2-00a8-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 15:15:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9EC53B071;
 Wed,  6 Nov 2019 15:15:53 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
Date: Wed, 6 Nov 2019 16:16:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/3] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dXBkYXRlX3BhZ2luZ19tb2RlKCkgaW4gdGhlIEFNRCBJT01NVSBjb2RlIGV4cGVjdHMgdG8gYmUg
aW52b2tlZCB3aXRoCnRoZSBQQ0kgZGV2aWNlcyBsb2NrIGhlbGQuIFRoZSBjaGVjayBvY2N1cnJp
bmcgb25seSB3aGVuIHRoZSBtb2RlCmFjdHVhbGx5IG5lZWRzIHVwZGF0aW5nLCB0aGUgdmlvbGF0
aW9uIG9mIHRoaXMgcnVsZSBieSB0aGUgbWFqb3JpdHkKb2YgY2FsbGVycyBkaWQgZ28gdW5ub3Rp
Y2VkIHVudGlsIHBlci1kb21haW4gSU9NTVUgc2V0dXAgd2FzIGNoYW5nZWQKdG8gZG8gYXdheSB3
aXRoIG9uLWRlbWFuZCBjcmVhdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcy4KClVuZm9ydHVuYXRl
bHkgdGhlIG9ubHkgaGFsZiB3YXkgcmVhc29uYWJsZSBmaXggdG8gdGhpcyB0aGF0IEkgY291bGQK
Y29tZSB1cCB3aXRoIHJlcXVpcmVzIG1vcmUgcmUtd29yayB0aGFuIHdvdWxkIHNlZW0gZGVzaXJh
YmxlIGF0IHRoaXMKdGltZSBvZiB0aGUgcmVsZWFzZSBwcm9jZXNzLCBidXQgYWRkcmVzc2luZyB0
aGUgaXNzdWUgc2VlbXMKdW5hdm9pZGFibGUgdG8gbWUgYXMgaXRzIG1hbmlmZXN0YXRpb24gaXMg
YSByZWdyZXNzaW9uIGZyb20gdGhlCklPTU1VIHBhZ2UgdGFibGUgc2V0dXAgcmUtd29yay4gVGhl
IGNoYW5nZSBhbHNvIGlzbid0IHdpdGhvdXQgcmlzawpvZiBmdXJ0aGVyIHJlZ3Jlc3Npb25zIC0g
aWYgaW4gcGF0Y2ggMiBJJ3ZlIG1pc3NlZCBhIGNvZGUgcGF0aCB0aGF0CndvdWxkIGFsc28gbmVl
ZCB0byBpbnZva2UgdGhlIG5ldyBob29rLCB0aGVuIHRoaXMgbWlnaHQgbWVhbiBub24tCndvcmtp
bmcgZ3Vlc3RzICh3aXRoIHBhc3NlZC10aHJvdWdoIGRldmljZXMgb24gQU1EIGhhcmR3YXJlKS4K
CjE6IEFNRC9JT01NVTogZG9uJ3QgbmVlZGxlc3NseSB0cmlnZ2VyIGVycm9ycy9jcmFzaGVzIHdo
ZW4gdW5tYXBwaW5nIGEgcGFnZQoyOiBpbnRyb2R1Y2UgR0ZOIG5vdGlmaWNhdGlvbiBmb3IgdHJh
bnNsYXRlZCBkb21haW5zCjM6IEFNRC9JT01NVTogdXNlIG5vdGlmeV9kZm4oKSBob29rIHRvIHVw
ZGF0ZSBwYWdpbmcgbW9kZQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
