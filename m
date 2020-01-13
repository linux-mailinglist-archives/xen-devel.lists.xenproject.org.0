Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81C1394E2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 16:34:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir1hc-0008Mn-V9; Mon, 13 Jan 2020 15:32:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fwWm=3C=amazon.co.uk=prvs=2743aefcc=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ir1hb-0008Mi-Oq
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 15:32:27 +0000
X-Inumbo-ID: e78541d4-3619-11ea-a2eb-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e78541d4-3619-11ea-a2eb-bc764e2007e4;
 Mon, 13 Jan 2020 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578929548; x=1610465548;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ux+8Tvc5qL66EWWZE5JSmYN5TdcTDIQBI60lEvwlvWA=;
 b=aroR+JL7ZMvUAJJTM0dmkShO+h/TPF3MwK5bP3rEJsXqLNGIYC6DMZDs
 MDReB8TMYRv1M9vxKwIPqWe/QfEFdQhUigoeeBam5jBaaORQl9472DDkI
 s9TuG+LPauEdbIC1N0BL0WiGAjeEXibIYLKqlw8p9ejpy45BI6FPzRfwO A=;
IronPort-SDR: EBKNtaIPOSM8UUJk0KCi3DbAk86XPx3ZgSgHlDPWjvyJRQaBHQdLiddqIMGQhzJEv5A2aAu3mj
 1zM1GBePIPNQ==
X-IronPort-AV: E=Sophos;i="5.69,429,1571702400"; d="scan'208";a="12208039"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 13 Jan 2020 15:32:26 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id DFF89A1D70; Mon, 13 Jan 2020 15:32:22 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 13 Jan 2020 15:32:22 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 13 Jan 2020 15:32:21 +0000
Received: from CBG-5CG9341D0C.amazon.com (10.85.95.147) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 13 Jan 2020 15:32:18 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 15:32:17 +0000
Message-ID: <20200113153217.3419-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] Introduce CHANGELOG.md
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgYWdyZWVkIGR1cmluZyB0aGUgMjAyMC0wMSBjb21tdW5pdHkgY2FsbCBbMV0gdGhpcyBwYXRj
aCBpbnRyb2R1Y2VzIGEKY2hhbmdlbG9nLCBiYXNlZCBvbiB0aGUgcHJpbmNpcGxlcyBleHBsYWlu
ZWQgYXQga2VlcGFjaGFuZ2Vsb2cuY29tIFsyXS4KQSBuZXcgTUFJTlRBSU5FUlMgZW50cnkgaXMg
YWxzbyBhZGRlZCwgd2l0aCBteXNlbGYgYXMgKGN1cnJlbnRseSBzb2xlKQptYWludGFpbmVyLgoK
WzFdIFNlZSBDLjIgYXQgaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0L0VSWnRN
WUQ1ajZrMHN2LU5HNkh0bC1BSi8KWzJdIGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEu
MC4wLwoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpB
Y2tlZC1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgotLS0KQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKdjI6CiAtIERyb3BwZWQgJ0Fs
bCcgZnJvbSAnQWxsIG5vdGFibGUgY2hhbmdlcycKIC0gQWRkZWQgTGFycyBhcyBhIGRlc2lnbmF0
ZWQgcmV2aWV3ZXIKLS0tCiBDSEFOR0VMT0cubWQgfCAxNCArKysrKysrKysrKysrKwogTUFJTlRB
SU5FUlMgIHwgIDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBDSEFOR0VMT0cubWQKCmRpZmYgLS1naXQgYS9DSEFOR0VMT0cubWQg
Yi9DSEFOR0VMT0cubWQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYjEx
ZTliYzRlMwotLS0gL2Rldi9udWxsCisrKyBiL0NIQU5HRUxPRy5tZApAQCAtMCwwICsxLDE0IEBA
CisjIENoYW5nZWxvZworCitOb3RhYmxlIGNoYW5nZXMgdG8gWGVuIHdpbGwgYmUgZG9jdW1lbnRl
ZCBpbiB0aGlzIGZpbGUuCisKK1RoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vs
b2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykKKworIyMgW1VucmVsZWFz
ZWRdKGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c2hvcnRsb2cp
CisKKyMjIyBBZGRlZAorIC0gVGhpcyBmaWxlIGFuZCBNQUlOVEFJTkVSUyBlbnRyeS4KKworIyMg
WzQuMTMuMF0oaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9y
dGxvZztoPVJFTEVBU0UtNC4xMy4wKSAtIDIwMTktMTItMTcKKworPiBQb2ludGVyIHRvIHJlbGVh
c2UgZnJvbSB3aGljaCBDSEFOR0VMT0cgdHJhY2tpbmcgc3RhcnRzCmRpZmYgLS1naXQgYS9NQUlO
VEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGQ1YmQ4MzA3M2MuLjFmZmMzZGM2MDAgMTAwNjQ0
Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xOTgsNiArMTk4LDEyIEBA
IEY6CXhlbi9pbmNsdWRlL2FzbS1hcm0vCiBGOgl4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0v
CiBGOgl4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAogCitDaGFuZ2UgTG9nCitNOglQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CitSOglMYXJzIEt1cnRoIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+CitTOglNYWludGFpbmVkCitGOglDSEFOR0VMT0cubWQKKwogQ29udGludW91
cyBJbnRlZ3JhdGlvbiAoQ0kpCiBNOglEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+
CiBXOglodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QveGVuCi0tIAoyLjE3LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
