Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA221357C3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 12:18:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipVmV-00063D-Op; Thu, 09 Jan 2020 11:15:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kEnv=26=amazon.co.uk=prvs=2706230f4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipVmT-000638-R3
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 11:15:13 +0000
X-Inumbo-ID: 4dd08259-32d1-11ea-b9a1-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dd08259-32d1-11ea-b9a1-12813bfff9fa;
 Thu, 09 Jan 2020 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578568513; x=1610104513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I/6LC1a/RF40EnbDi240ZnKPhi29X3SDHAwKGh2MYvU=;
 b=b9kBEqTRmgcMs1KqHzHQXkPZ5JsnOttBxbGFd0bJwCEG7BEEqRXGCiTI
 7bAuwangBIhwsNSca2+dNq6f3iloFBdZT2BYfPMhQUI8LxCW0fY1u7UkF
 rx5kz+t3c3ADkNLeTH0RXyELzC+e9fB4MJsovw+JLgkp1+yQxg+emQH9y 8=;
IronPort-SDR: 12b3fYnanPp8npBYzmdnonfx4hLGQVTyREbyPvWRKJ5/CBu+7tO/FfCAh7rfCUNfa1wJq+A2KJ
 WlyXOPSoXbYA==
X-IronPort-AV: E=Sophos;i="5.69,413,1571702400"; d="scan'208";a="11585844"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 09 Jan 2020 11:15:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6D42BA029A; Thu,  9 Jan 2020 11:15:11 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 9 Jan 2020 11:15:10 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 9 Jan 2020 11:15:10 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 9 Jan 2020 11:15:07 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 9 Jan 2020 11:15:05 +0000
Message-ID: <20200109111505.12328-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] tools/Rules.mk: fix distclean
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UnVubmluZyAnbWFrZSBkaXN0Y2xlYW4nIHVuZGVyIHRvb2xzIHdpbGwgY3VycmVudGx5IHJlc3Vs
dCBpbjoKCnRvb2xzL1J1bGVzLm1rOjI0NTogKioqIFlvdSBoYXZlIHRvIHJ1biAuL2NvbmZpZ3Vy
ZSBiZWZvcmUgYnVpbGRpbmcgb3IgaW5zdGFsbGluZyB0aGUgdG9vbHMuICBTdG9wLgoKVGhpcyBw
YXRjaCBhZGRzICdkaXN0Y2xlYW4nLCAnc3ViZGlyLWRpc3RjbGVhbiUnIGFuZCAnc3ViZGlyLWNs
ZWFuJScgdG8Kbm8tY29uZmlndXJlLXRhcmdldHMsIHdoaWNoIGFsbG93cyAnbWFrZSBkaXN0Y2xl
YW4nIHRvIHJ1biB0byBjb21wbGV0aW9uLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiB0b29scy9SdWxlcy5tayB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL1J1bGVzLm1rIGIvdG9vbHMvUnVsZXMubWsKaW5kZXggMzFjZjQxOWVm
NC4uNTJmNDdiZTNmOCAxMDA2NDQKLS0tIGEvdG9vbHMvUnVsZXMubWsKKysrIGIvdG9vbHMvUnVs
ZXMubWsKQEAgLTIzOSw3ICsyMzksNyBAQCBzdWJkaXItYWxsLSUgc3ViZGlyLWNsZWFuLSUgc3Vi
ZGlyLWluc3RhbGwtJSBzdWJkaXItdW5pbnN0YWxsLSU6IC5waG9ueQogc3ViZGlyLWRpc3RjbGVh
bi0lOiAucGhvbnkKIAkkKE1BS0UpIC1DICQqIGRpc3RjbGVhbgogCi1uby1jb25maWd1cmUtdGFy
Z2V0cyA6PSBjbGVhbiBzdWJ0cmVlLWZvcmNlLXVwZGF0ZS1hbGwgJS1kaXItZm9yY2UtdXBkYXRl
Cituby1jb25maWd1cmUtdGFyZ2V0cyA6PSBkaXN0Y2xlYW4gc3ViZGlyLWRpc3RjbGVhbiUgY2xl
YW4gc3ViZGlyLWNsZWFuJSBzdWJ0cmVlLWZvcmNlLXVwZGF0ZS1hbGwgJS1kaXItZm9yY2UtdXBk
YXRlCiBpZmVxICgsJChmaWx0ZXIgJChuby1jb25maWd1cmUtdGFyZ2V0cyksJChNQUtFQ01ER09B
TFMpKSkKICQoWEVOX1JPT1QpL2NvbmZpZy9Ub29scy5tazoKIAkkKGVycm9yIFlvdSBoYXZlIHRv
IHJ1biAuL2NvbmZpZ3VyZSBiZWZvcmUgYnVpbGRpbmcgb3IgaW5zdGFsbGluZyB0aGUgdG9vbHMp
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
