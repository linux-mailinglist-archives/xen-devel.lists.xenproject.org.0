Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEE13694B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 09:58:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipq5O-0003kt-7e; Fri, 10 Jan 2020 08:56:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ryA=27=amazon.co.uk=prvs=27124b7d2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipq5M-0003ko-ST
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 08:56:04 +0000
X-Inumbo-ID: 07f6ab6e-3387-11ea-b89f-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07f6ab6e-3387-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578646564; x=1610182564;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=M75JXyohVPiaE+pUjvTBarVA0vAgbRtjunhlFEuR4Fg=;
 b=bCM9ZuPrVxT4NEfF/Psq9sIn/y9HJyC7LP8JdIZy0HUAWLY1cPZdoNFC
 LDlmef1PZtCs60tRvW8B8m3EvCcMkoRM6SZ5OVRarbAUqeOx4MCaMi/BG
 /EL5S2l93Iwl7r6jiUpLSNi3iUziIcydZs+UERo/prbVvT18gULsalkz0 k=;
IronPort-SDR: Xk55ESS9gYJJ2ekThSEbpozqFK/so37Say0Ar7DHXgyAX5ohV531FFzRFv7Rb+10ftZbrpzaqI
 +FSPW1qBFLxA==
X-IronPort-AV: E=Sophos;i="5.69,415,1571702400"; 
   d="scan'208";a="9511403"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 10 Jan 2020 08:54:47 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 39404A1DA7; Fri, 10 Jan 2020 08:54:44 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 08:54:43 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 08:54:42 +0000
Received: from CBG-5CG9341D0C.cbg10.amazon.com (10.55.227.19) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 10 Jan 2020 08:54:39 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 08:54:37 +0000
Message-ID: <20200110085437.543-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] MAINTAINERS: Update my email address
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

SXQgaXMgbm93IG1vcmUgY292ZW5pZW50IGZvciBtZSB0byB1c2UgbXkgQW1hem9uIGFkZHJlc3Mu
CgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ2M6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogTUFJTlRB
SU5FUlMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBhNDJm
ZWY2YWI5Li5kNWJkODMwNzNjIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJ
TkVSUwpAQCAtNDgwLDcgKzQ4MCw3IEBAIEY6CXRvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvCiBGOgl0
b29scy90ZXN0cy94ODZfZW11bGF0b3IvCiAKIFg4NiBJL08gRU1VTEFUSU9OCi1NOglQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4KK006CVBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNv
bT4KIFM6CVN1cHBvcnRlZAogRjoJeGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKIEY6CXhlbi9h
cmNoL3g4Ni9odm0vaW50ZXJjZXB0LmMKQEAgLTUxMiw3ICs1MTIsNyBAQCBTOglNYWludGFpbmVk
CiBGOgl4ZW4vYXJjaC94ODYvbW0vc2hhZG93LwogCiBYODYgVklSSURJQU4gRU5MSUdIVEVOTUVO
VFMKLU06CVBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgorTToJUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPgogUzoJU3VwcG9ydGVkCiBGOgl4ZW4vYXJjaC94ODYvaHZtL3Zpcmlk
aWFuLwogRjoJeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlyaWRpYW4uaAotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
