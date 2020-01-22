Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6B145EA5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 23:34:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuOXB-0001LR-5o; Wed, 22 Jan 2020 22:31:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ac9L=3L=amazon.com=prvs=2839ba572=elnikety@srs-us1.protection.inumbo.net>)
 id 1iuOX9-0001LC-K5
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 22:31:35 +0000
X-Inumbo-ID: ed48a77e-3d66-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed48a77e-3d66-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579732287; x=1611268287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=fAU7RXcVYKM4RzTTmYku+vAXd+8d0igXKYPM4rM5cTk=;
 b=DxUb1RJLiMLbtKMVG9I1Qcdadx9UeNo+XhKBe3ElZJpffi2qfLpm1rYp
 4e1A2pq9cCj3VlEBCCezpDtv10plp9qUn0NQIAObmJUipLXxolQ96Kl8P
 3bsy1MQBeHhjz6+ztMcq/uhYPMwDy6HWRZ9Ey11ubVAT8QvCN59dD3J5A w=;
IronPort-SDR: HAS62dKdjtrt3cp+6ROnN/LOwJ0Vf/gJFpG80jEA6E0R1s1Zx4NQ7o7lkIZtmEkhk38xoRFA8K
 fB+9l0ifbY5A==
X-IronPort-AV: E=Sophos;i="5.70,351,1574121600"; d="scan'208";a="21840651"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 22 Jan 2020 22:31:16 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 12FD3A1DA4; Wed, 22 Jan 2020 22:31:14 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 22:31:13 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 22:31:13 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 30E0CA013F; Wed, 22 Jan 2020 22:31:13 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 22:30:43 +0000
Message-ID: <29772dcab47696af624d9c0a9026af38ac3be577.1579727989.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <cover.1579727989.git.elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v1 1/4] x86/microcode: Improve documentation for
 ucode=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam
 Elnikety <elnikety@amazon.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3BlY2lmeSBhcHBsaWNhYmlsaXR5IGFuZCB0aGUgZGVmYXVsdCB2YWx1ZS4gQWxzbyBzdGF0ZSB0
aGF0LCBpbiBjYXNlIG9mCkVGSSwgdGhlIG1pY3JvY29kZSB1cGRhdGUgYmxvYiBzcGVjaWZpZWQg
aW4gdGhlIEVGSSBjZmcgdGFrZXMgcHJlY2VkZW5jZQpvdmVyIGB1Y29kZT1zY2FuYCwgaWYgdGhl
IGxhdHRlciBpcyBzcGVjaWZpZWQgb24gWGVuIGNvbW1lbmQgbGluZS4KCk5vIGZ1bmN0aW9uYWwg
Y2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IEVzbGFtIEVsbmlrZXR5IDxlbG5pa2V0eUBhbWF6b24u
Y29tPgotLS0KIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDggKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21pc2MveGVuLWNv
bW1hbmQtbGluZS5wYW5kb2MKaW5kZXggOTgxYTVlMjM4MS4uZWJlYzZkMzg3ZSAxMDA2NDQKLS0t
IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCisrKyBiL2RvY3MvbWlzYy94ZW4t
Y29tbWFuZC1saW5lLnBhbmRvYwpAQCAtMjEzNCw3ICsyMTM0LDEyIEBAIGxvZ2ljIGFwcGxpZXM6
CiAjIyMgdWNvZGUgKHg4NikKID4gYD0gTGlzdCBvZiBbIDxpbnRlZ2VyPiB8IHNjYW49PGJvb2w+
LCBubWk9PGJvb2w+IF1gCiAKLVNwZWNpZnkgaG93IGFuZCB3aGVyZSB0byBmaW5kIENQVSBtaWNy
b2NvZGUgdXBkYXRlIGJsb2IuCisgICAgQXBwbGljYWJpbGl0eTogeDg2CisgICAgRGVmYXVsdDog
YG5taWAKKworQ29udHJvbHMgZm9yIENQVSBtaWNyb2NvZGUgbG9hZGluZy4gRm9yIGVhcmx5IGxv
YWRpbmcsIHRoaXMgcGFyYW1ldGVyIGNhbgorc3BlY2lmeSBob3cgYW5kIHdoZXJlIHRvIGZpbmQg
dGhlIG1pY3JvY29kZSB1cGRhdGUgYmxvYi4gRm9yIGxhdGUgbG9hZGluZywKK3RoaXMgcGFyYW1l
dGVyIHNwZWNpZmllcyBpZiB0aGUgdXBkYXRlIGhhcHBlbnMgd2l0aGluIGEgTk1JIGhhbmRsZXIu
CiAKICdpbnRlZ2VyJyBzcGVjaWZpZXMgdGhlIENQVSBtaWNyb2NvZGUgdXBkYXRlIGJsb2IgbW9k
dWxlIGluZGV4LiBXaGVuIHBvc2l0aXZlLAogdGhpcyBzcGVjaWZpZXMgdGhlIG4tdGggbW9kdWxl
IChpbiB0aGUgR3JVQiBlbnRyeSwgemVybyBiYXNlZCkgdG8gYmUgdXNlZApAQCAtMjE1Miw2ICsy
MTU3LDcgQEAgaW1hZ2UgdGhhdCBjb250YWlucyBtaWNyb2NvZGUuIERlcGVuZGluZyBvbiB0aGUg
cGxhdGZvcm0gdGhlIGJsb2Igd2l0aCB0aGUKIG1pY3JvY29kZSBpbiB0aGUgY3BpbyBuYW1lIHNw
YWNlIG11c3QgYmU6CiAgIC0gb24gSW50ZWw6IGtlcm5lbC94ODYvbWljcm9jb2RlL0dlbnVpbmVJ
bnRlbC5iaW4KICAgLSBvbiBBTUQgIDoga2VybmVsL3g4Ni9taWNyb2NvZGUvQXV0aGVudGljQU1E
LmJpbgorSWYgRUZJIGJvb3QsIHRoZSBgdWNvZGU9PGZpbGVuYW1lPmAgY29uZmlnIHRha2VzIHBy
ZWNlbmRlbmNlIG92ZXIgYHNjYW5gLgogCiAnbm1pJyBkZXRlcm1pbmVzIGxhdGUgbG9hZGluZyBp
cyBwZXJmb3JtZWQgaW4gTk1JIGhhbmRsZXIgb3IganVzdCBpbgogc3RvcF9tYWNoaW5lIGNvbnRl
eHQuIEluIE5NSSBoYW5kbGVyLCBldmVuIE5NSXMgYXJlIGJsb2NrZWQsIHdoaWNoIGlzCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
