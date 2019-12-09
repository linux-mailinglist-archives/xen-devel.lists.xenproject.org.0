Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C71174ED
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 19:54:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieO6d-0007yA-MM; Mon, 09 Dec 2019 18:50:03 +0000
Resent-Date: Mon, 09 Dec 2019 18:50:03 +0000
Resent-Message-Id: <E1ieO6d-0007yA-MM@lists.xenproject.org>
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0IkR=Z7=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1ieO6c-0007oY-6T
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 18:50:02 +0000
X-Inumbo-ID: b3b20912-1ab4-11ea-a1e1-bc764e2007e4
Received: from sender4-of-o58.zoho.com (unknown [136.143.188.58])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3b20912-1ab4-11ea-a1e1-bc764e2007e4;
 Mon, 09 Dec 2019 18:50:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1575917392; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V98KN0t2WKNFb1Zr5Ah2IM+39LwRAHnIuUwl5V78N3n58qI36FfNth45WeNWbXUJm+7wuhji20qIrx+qScDjKveVRIU1nuTC5/B2/4CnizZOvzNZDOOb7EiMp/dKSuHdJKogv2tgJwm3uwPKbQhRJ8WguqDJS03hdaeF/loZiew=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1575917392;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=NGGBVe99txQfOsq9cZq1irlEdHWrvh+3aiYwy3FvxE4=; 
 b=DRNYiZnpzcpWxmx9KQ7AeM1BAR+D97qRPj6saMygJkHoqWRGVqUd8E7K6XKe6wddquQ+Wxd2/OaQCst20pZYYCinIfPoMKgDoz/K29yG440ZL35YQO0OT8wz80nZfp3gnU5263+VONsNw0Gxwr1NDBVC8KSneUKeVYDODumCAEk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1575917391331182.37874226413294;
 Mon, 9 Dec 2019 10:49:51 -0800 (PST)
In-Reply-To: <20191209095002.32194-1-philmd@redhat.com>
Message-ID: <157591738957.7675.17320249356246930041@37313f22b938>
MIME-Version: 1.0
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Date: Mon, 9 Dec 2019 10:49:51 -0800 (PST)
X-ZohoMailClient: External
Subject: Re: [Xen-devel] [PATCH-for-5.0 v3 0/6] hw/pci-host: Add Kconfig
 selector for IGD PCIe pass-through
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
Reply-To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, sstabellini@kernel.org, paul@xen.org, mst@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 xen-devel@lists.xenproject.org, anthony.perard@citrix.com, pbonzini@redhat.com,
 philmd@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTIwOTA5NTAwMi4zMjE5
NC0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojISAvYmluL2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1ha2UgZG9ja2VyLWlt
YWdlLWZlZG9yYSBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5nd0BmZWRv
cmEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN1Ym1vZHVsZSAnZHRj
JyAoaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2R0Yy5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGgg
J2R0YycKQ2xvbmluZyBpbnRvICdkdGMnLi4uCnJlbW90ZTogQ291bnRpbmcgb2JqZWN0czogNTI4
MCwgZG9uZS4gICAgICAgIAplcnJvcjogUlBDIGZhaWxlZDsgcmVzdWx0PTE4LCBIVFRQIGNvZGUg
PSAyMDAKZmF0YWw6IFRoZSByZW1vdGUgZW5kIGh1bmcgdXAgdW5leHBlY3RlZGx5CmZhdGFsOiBw
cm90b2NvbCBlcnJvcjogYmFkIHBhY2sgaGVhZGVyCkNsb25lIG9mICdodHRwczovL2dpdC5xZW11
Lm9yZy9naXQvZHRjLmdpdCcgaW50byBzdWJtb2R1bGUgcGF0aCAnZHRjJyBmYWlsZWQKZmFpbGVk
IHRvIHVwZGF0ZSBzdWJtb2R1bGUgZHRjClN1Ym1vZHVsZSAnZHRjJyAoaHR0cHM6Ly9naXQucWVt
dS5vcmcvZ2l0L2R0Yy5naXQpIHVucmVnaXN0ZXJlZCBmb3IgcGF0aCAnZHRjJwptYWtlWzFdOiAq
KiogWy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC13NHc4bGkxdS9zcmMvZG9ja2VyLXNyYy4y
MDE5LTEyLTA5LTEzLjQ0LjMyLjExOTM0XSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0
b3J5IGAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtdzR3OGxpMXUvc3JjJwptYWtlOiAqKiog
W2RvY2tlci1ydW4tdGVzdC1taW5nd0BmZWRvcmFdIEVycm9yIDIKCnJlYWwgICAgNW0xNy44MTNz
CnVzZXIgICAgMG0yLjQ3MHMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9w
YXRjaGV3Lm9yZy9sb2dzLzIwMTkxMjA5MDk1MDAyLjMyMTk0LTEtcGhpbG1kQHJlZGhhdC5jb20v
dGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5l
cmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
