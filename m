Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7651549B3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 17:51:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izkKC-0004fP-J0; Thu, 06 Feb 2020 16:48:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RI0J=32=amazon.co.uk=prvs=29855b991=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izkKB-0004fK-77
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 16:48:19 +0000
X-Inumbo-ID: 7a280140-4900-11ea-b015-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a280140-4900-11ea-b015-12813bfff9fa;
 Thu, 06 Feb 2020 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581007698; x=1612543698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HQkhoKNcEKSx0SG4VIWKTOImNdQeTgbj5pX8JkFPY1Y=;
 b=gveOwO/R6k/aGLhyF4Gwl3TvVb5Sd0+kDVACp+Bu9V6DEeoa1aYMaAuK
 v8NErVFWyOGVGwvq8z7UxJ48aLCeJsUEtwyE82fRe5JcFjWw8k+nxq6Cy
 QuR7VMn/JBOVKBn2Q9lTBUTeQA6KvHc4pU0VcB+eKR8BlkjkFvkYszv4T A=;
IronPort-SDR: oDTgUzSh3e54jBfaPeWn0uilv9+ztuuTOuCydH1EBkkKOWPPIdDiZpVqV4VQrkQMMdPYZJc3qG
 LbyHjMPtUwKw==
X-IronPort-AV: E=Sophos;i="5.70,410,1574121600"; d="scan'208";a="16002580"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 06 Feb 2020 16:48:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id C8C0CA1768; Thu,  6 Feb 2020 16:48:15 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 6 Feb 2020 16:48:15 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 6 Feb 2020 16:48:14 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 6 Feb 2020 16:48:12 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 6 Feb 2020 16:48:10 +0000
Message-ID: <20200206164810.30168-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] MAINTAINERS: cc community manager on patches to
 CHANGELOG.md
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

VGhlIHB1cnBvc2Ugb2YgdGhlIGNoYW5nZS1sb2cgaXMgdG8gYmUgYSBodW1hbi1yZWFkYWJsZSBs
aXN0IG9mIG5vdGFibGUKY2hhbmdlcyBhbmQsIGFzIHN1Y2gsIGFkZGl0aW9ucyB0byBpdCBhcmUg
bGlrZWx5IG9mIGludGVyZXN0IHRvIHRoZQpjb21tdW5pdHkgbWFuYWdlciBpbiBwcmVwYXJpbmcg
YmxvZyBlbnRyaWVzLCByZWxlYXNlIHN1bW1hcmllcywgZXRjLgoKU2lnbmVkLW9mZi1ieTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFw
QGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIE1BSU5UQUlORVJTIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTUFJ
TlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAwNGQ5MTQ4MmNkLi5iYjJiMWYzNGRhIDEwMDY0
NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMjAwLDcgKzIwMCw3IEBA
IEY6CXhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCiAKIENoYW5nZSBMb2cKIE06CVBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLVI6CUxhcnMgS3VydGggPGxhcnMua3VydGhA
Y2l0cml4LmNvbT4KK1I6CUNvbW11bml0eSBNYW5hZ2VyIDxjb21tdW5pdHkubWFuYWdlckB4ZW5w
cm9qZWN0Lm9yZz4KIFM6CU1haW50YWluZWQKIEY6CUNIQU5HRUxPRy5tZAogCi0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
