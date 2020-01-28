Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38714B42E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 13:30:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwPys-00079f-QQ; Tue, 28 Jan 2020 12:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0vDG=3R=amazon.co.uk=prvs=289a7b1b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwPyr-00078L-N6
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 12:28:33 +0000
X-Inumbo-ID: b109968b-41c9-11ea-86a1-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b109968b-41c9-11ea-86a1-12813bfff9fa;
 Tue, 28 Jan 2020 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580214511; x=1611750511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rAdMsl3Uq9cNEYv0vM8Q59O9eucqOG8FbTePBwejzy0=;
 b=CAEZ3Rfe+/gvkqKWhncBmgyPCRK8wIdLkcha7o9wNgQVWj0VlMKqNGpy
 83xE1p1IptdXGjMIs6bNDMd06m5UKTJGkazpjiIjMtMa313ZarWKesX9X
 wa2+sBIeLf4zVavrtcLu3dypKMWAlCfAsm6eBjA5W536Mf4xg69fpe257 c=;
IronPort-SDR: 4zeQZkHIWaGMvPFCuFW1A9XgmjuT+J1EtwgYqhIn/UiJgah6ISRrL6/0FlJZBNqJNfkCqwntfw
 fcDKYIi6IV8g==
X-IronPort-AV: E=Sophos;i="5.70,373,1574121600"; d="scan'208";a="15097909"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 28 Jan 2020 12:28:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id E47A3A202C
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 12:28:29 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 12:28:29 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 12:28:28 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 28 Jan 2020 12:28:26 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 28 Jan 2020 12:28:21 +0000
Message-ID: <20200128122823.12920-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/2] docs: Migration design documents
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggIzEgd2FzIHN0YW5kYWxvbmUgaW4gdjIgYW5kIGlzIHVubW9kaWZpZWQgaW4gdjMuCgpQ
YXVsIER1cnJhbnQgKDIpOgogIGRvY3MvZGVzaWduczogQWRkIGEgZGVzaWduIGRvY3VtZW50IGZv
ciBub24tY29vcGVyYXRpdmUgbGl2ZSBtaWdyYXRpb24KICBkb2NzL2Rlc2lnbnM6IEFkZCBhIGRl
c2lnbiBkb2N1bWVudCBmb3IgbWlncmF0aW9uIG9mIHhlbnN0b3JlIGRhdGEKCiBkb2NzL2Rlc2ln
bnMvbm9uLWNvb3BlcmF0aXZlLW1pZ3JhdGlvbi5tZCB8IDI1OSArKysrKysrKysrKysrKysrKysr
KysrCiBkb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kICAgICAgICB8IDEyMiArKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM4MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZG9jcy9kZXNpZ25zL25vbi1jb29wZXJhdGl2ZS1taWdyYXRpb24ubWQKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kCgotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
