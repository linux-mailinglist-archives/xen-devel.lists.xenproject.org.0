Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D413136971
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 10:16:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipqLg-0005Qs-Sk; Fri, 10 Jan 2020 09:12:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ryA=27=amazon.co.uk=prvs=27124b7d2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipqLf-0005Qn-Fn
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 09:12:55 +0000
X-Inumbo-ID: 62808774-3389-11ea-beae-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62808774-3389-11ea-beae-12813bfff9fa;
 Fri, 10 Jan 2020 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578647575; x=1610183575;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=9ahEYIioX1LLQRGbnTkJ6/JN7UC5pyit9rAxshIfqo8=;
 b=iussjyLOIAok39JvJhj2CGUzIcIdZIpvQASdJOO+AWB11J76Kcu4miS9
 jDqLCTpbHxOzMhaC/1dYX0lKfmr2wjxJs2jcF9tp34tOhcsKFpy/PmiPo
 NkX+POgkS1F84KXunAYSZxeGAniOQdUmHZ70HhNXZTEMVtCpKZRUzHgR9 M=;
IronPort-SDR: JU8hvHBuzE1XzlkjBtsb/z7nbMonHK8SuOnMgQEQY6YMJ8N2R+kCJBm/5vb1rCLqJgTfwT41XO
 G1EeJ3PgvH8g==
X-IronPort-AV: E=Sophos;i="5.69,415,1571702400"; 
   d="scan'208";a="9513710"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 10 Jan 2020 09:12:53 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id BF7BCA22B9; Fri, 10 Jan 2020 09:12:49 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 10 Jan 2020 09:12:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 09:12:48 +0000
Received: from CBG-5CG9341D0C.cbg10.amazon.com (10.55.227.19) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 10 Jan 2020 09:12:45 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 09:12:38 +0000
Message-ID: <20200110091238.845-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] Introduce CHANGELOG.md
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
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
MC4wLwoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgot
LS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogTGFy
cyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgoKU2hvdWxkIHRoZXJlIGJlIG90aGVyIG1h
aW50YWluZXJzIGFwYXJ0IGZyb20gbXlzZWxmICh3aXRoIG15IFJNIGhhdCBvbik/ClBlcmhhcHMg
TGFycyBzaG91bGQgYWxzbyBiZSBhZGRlZCBhcyBhIGRlc2lnbmF0ZWQgcmV2aWV3ZXI/Ci0tLQog
Q0hBTkdFTE9HLm1kIHwgMTQgKysrKysrKysrKysrKysKIE1BSU5UQUlORVJTICB8ICA1ICsrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBD
SEFOR0VMT0cubWQKCmRpZmYgLS1naXQgYS9DSEFOR0VMT0cubWQgYi9DSEFOR0VMT0cubWQKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZWM1ZTE3NGFhMAotLS0gL2Rldi9u
dWxsCisrKyBiL0NIQU5HRUxPRy5tZApAQCAtMCwwICsxLDE0IEBACisjIENoYW5nZWxvZworCitB
bGwgbm90YWJsZSBjaGFuZ2VzIHRvIFhlbiB3aWxsIGJlIGRvY3VtZW50ZWQgaW4gdGhpcyBmaWxl
LgorCitUaGUgZm9ybWF0IGlzIGJhc2VkIG9uIFtLZWVwIGEgQ2hhbmdlbG9nXShodHRwczovL2tl
ZXBhY2hhbmdlbG9nLmNvbS9lbi8xLjAuMC8pCisKKyMjIFtVbnJlbGVhc2VkXShodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXNob3J0bG9nKQorCisjIyMgQWRkZWQK
KyAtIFRoaXMgZmlsZSBhbmQgTUFJTlRBSU5FUlMgZW50cnkuCisKKyMjIFs0LjEzLjBdKGh0dHBz
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c2hvcnRsb2c7aD1SRUxFQVNF
LTQuMTMuMCkgLSAyMDE5LTEyLTE3CisKKz4gUG9pbnRlciB0byByZWxlYXNlIGZyb20gd2hpY2gg
Q0hBTkdFTE9HIHRyYWNraW5nIHN0YXJ0cwpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwppbmRleCBkNWJkODMwNzNjLi42OGM2OTEzNjFhIDEwMDY0NAotLS0gYS9NQUlOVEFJ
TkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTk4LDYgKzE5OCwxMSBAQCBGOgl4ZW4vaW5jbHVk
ZS9hc20tYXJtLwogRjoJeGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLwogRjoJeGVuL2luY2x1
ZGUvcHVibGljL2FyY2gtYXJtLmgKIAorQ2hhbmdlIExvZworTToJUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPgorUzoJTWFpbnRhaW5lZAorRjoJQ0hBTkdFTE9HLm1kCisKIENvbnRp
bnVvdXMgSW50ZWdyYXRpb24gKENJKQogTToJRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2Uu
Y29tPgogVzoJaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbgotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
