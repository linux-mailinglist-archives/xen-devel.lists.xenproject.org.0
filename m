Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01881073E
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:51:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnK-0005eR-M1; Wed, 01 May 2019 10:48:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnJ-0005cm-7D
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:57 +0000
X-Inumbo-ID: b69a1ddc-6bfe-11e9-ab6a-6be2c0a142d9
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b69a1ddc-6bfe-11e9-ab6a-6be2c0a142d9;
 Wed, 01 May 2019 10:48:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837309"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:24 +0100
Message-ID: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 00/15] Do armhf kernel builds on amd64
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3Jvc3MgYnVpbGRpbmcgdGhpcyB3aWxsIGJlIG11Y2ggbXVjaCBmYXN0ZXIgYW5kIGhlbHAgd2l0
aCBvdXIgc2V2ZXJlCmFybWhmIHJlc291cmNlIHNob3J0YWdlLiAgVG8gYWNoaWV2ZSB0aGlzIGl0
IGlzIG5lY2Vzc2FyeSB0byBjbGVhbiB1cApzb21lIHRlY2huaWNhbCBkZWJ0LCBzbyB0aGF0IHdl
IGNhbiBzZXBhcmF0ZWx5IGNvbnRyb2wgaG9zdAphcmNoaXRlY3R1cmUsIHJhdGhlciB0aGFuIGp1
c3QgdXNpbmcgdGhlIGpvYidzIG1haW4gJHJ7YXJjaH0uCgpUaGlzIGlzIHYyIG9mIHRoZSBzZXJp
ZXMsIHdpdGggc29tZSBtaW5vciBidWdmaXhlcyBhbmQgc29tZSBhY2tzIGZyb20KQVJNIHJldmll
d2VycyAodGhhbmtzKS4gIEl0IGhhcyBjb21wbGV0ZWQgYWxsIGl0cyBhZC1ob2MgdGVzdHMgYW5k
IGlzCm5leHQgaW4gdGhlIHF1ZXVlIGZvciB0aGUgb3NzdGVzdCBzZWxmLXB1c2gtZ2F0ZS4KCklh
biBKYWNrc29uICgxNSk6CiAgVGVzdFN1cHBvcnQ6IHRhcmdldF92YXI6IFJlZmFjdG9yIHRvIGFs
bG93IGZvciBhbm90aGVyIGhvc3QgY2FzZQogIFRlc3RTdXBwb3J0OiB0YXJnZXRfdmFyOiBVc2Ug
aG9zdF9WIGZvciBob3N0IHZhcmlhYmxlcwogIGFyY2ggcmVwbHVtYmluZzogdHMtaG9zdC1pbnN0
YWxsOiBNb3ZlICRrZXJuX2FyY2hfaW5mbyBzZXR0aW5nCiAgYXJjaCByZXBsdW1iaW5nOiBQcm92
aWRlICRoby0+e0FyY2h9IGFuZCAkZ2hvLT57QXJjaH0KICBhcmNoIHJlcGx1bWJpbmc6IHRzLWRl
Ymlhbi1kaS1pbnN0YWxsOiBSZW1vdmUgdW5pZGlvbWF0aWMgeyB9CiAgYXJjaCByZXBsdW1iaW5n
OiB0cy1tZW1kaXNrLXRyeS1hcHBlbmQ6IFJlbW92ZSB1bmlkaW9tYXRpYyAiICIKICBhcmNoIHJl
cGx1bWJpbmc6IFJlcGxhY2UgbWFueSAkcnthcmNofSB3aXRoICRbZ11oby0+e0FyY2h9CiAgYXJj
aCByZXBsdW1iaW5nOiBtYWtlLWZsaWdodDogRml4ICRye2FyY2h9IGNvbW1lbnQKICBhcmNoIHJl
cGx1bWJpbmc6IHRzLWRlYmlhbi1kaS1pbnN0YWxsOiBVc2UgJGdoby0+e0FyY2h9CiAgdHMta2Vy
bmVsLWJ1aWxkOiBJbnRyb2R1Y2UgY21kKCkKICBjcm9zcyBidWlsZHM6IHRzLWtlcm5lbC1idWls
ZDogU3VwcG9ydCBjcm9zcyB0YXJnZXQgYXJtaGYKICBjcm9zcyBidWlsZHM6IG1maS1jb21tb246
IEJyZWFrIG91dCBzZXRfYnVpbGRfaG9zdGZsYWdzCiAgY3Jvc3MgYnVpbGRzOiBtZmktY29tbW9u
OiBQcmVwYXJlIGZvciBrZXJuZWwgY3Jvc3MgYnVpbGRpbmcKICBjcm9zcyBidWlsZHM6IEJ1aWxk
IGFybWhmIGtlcm5lbHMgb24gYW1kNjQgaG9zdHMKICB0cy1rZXJuZWwtYnVpbGQ6IE1vdmUgbWFp
biBwcm9ncmFtIHRvIGJvdHRvbSBvZiBzY3JpcHQKCiBPc3N0ZXN0L0RlYmlhbi5wbSAgICAgIHwg
MTQgKysrKystLS0tLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAyNiArKysrKysrKysrKysr
LS0tLS0tLQogbWFrZS1mbGlnaHQgICAgICAgICAgICB8ICA0ICsrLS0KIG1maS1jb21tb24gICAg
ICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIHRzLWRlYmlhbi1k
aS1pbnN0YWxsICAgfCAgNiArKy0tLQogdHMtZGViaWFuLWluc3RhbGwgICAgICB8ICAyICstCiB0
cy1mcmVlYnNkLWJ1aWxkICAgICAgIHwgIDIgKy0KIHRzLWhvc3QtaW5zdGFsbCAgICAgICAgfCAy
NCArKysrKysrKysrKystLS0tLS0tCiB0cy1rZXJuZWwtYnVpbGQgICAgICAgIHwgNjQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIHRzLW1lbWRpc2st
dHJ5LWFwcGVuZCAgfCAgMiArLQogdHMteGVuLWJ1aWxkLXByZXAgICAgICB8ICA0ICsrLS0KIHRz
LXhlbi1pbnN0YWxsICAgICAgICAgfCAgOCArKystLS0tCiAxMiBmaWxlcyBjaGFuZ2VkLCAxMzIg
aW5zZXJ0aW9ucygrKSwgNjMgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
