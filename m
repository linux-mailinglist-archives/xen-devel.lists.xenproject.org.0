Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED717DD87
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 11:27:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBFYz-00005p-Ps; Mon, 09 Mar 2020 10:23:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eS/D=42=xen.org=prvs=330d716a0=paul@srs-us1.protection.inumbo.net>)
 id 1jBFYy-00005j-Qd
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 10:23:08 +0000
X-Inumbo-ID: f85d441f-61ef-11ea-abfc-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f85d441f-61ef-11ea-abfc-12813bfff9fa;
 Mon, 09 Mar 2020 10:23:08 +0000 (UTC)
IronPort-SDR: twx9yUMq35b1tGGWawdmNZo6rVAN1r29VhQe24qAA30ZDT1F2GuehSxUHKau9VYrXgh9AlV4FG
 cdRtIzPakmaA==
X-IronPort-AV: E=Sophos;i="5.70,532,1574121600"; d="scan'208";a="30043979"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 09 Mar 2020 10:23:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id 21203A1C24; Mon,  9 Mar 2020 10:23:07 +0000 (UTC)
Received: from EX13D15UEA004.ant.amazon.com (10.43.61.215) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 9 Mar 2020 10:23:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D15UEA004.ant.amazon.com (10.43.61.215) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 9 Mar 2020 10:23:06 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1236.3 via Frontend Transport; Mon, 9 Mar 2020 10:23:06 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Mar 2020 10:22:58 +0000
Message-ID: <20200309102304.1251-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 0/6] remove one more shared xenheap page:
 shared_info
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpQYXVsIER1cnJhbnQgKDYpOgogIGRv
bWFpbjogaW50cm9kdWNlIGFsbG9jL2ZyZWVfc2hhcmVkX2luZm8oKSBoZWxwZXJzLi4uCiAgeDg2
IC8gcDJtOiByZXBsYWNlIHBhZ2VfbGlzdCBjaGVjayBpbiBwMm1fYWxsb2NfdGFibGUuLi4KICB4
ODYgLyBwdjogZG8gbm90IHRyZWF0IFBHQ19leHRyYSBwYWdlcyBhcyBSQU0KICB4ODYgLyBpb3Jl
cTogdXNlIGEgTUVNRl9ub19yZWZjb3VudCBhbGxvY2F0aW9uIGZvciBzZXJ2ZXIgcGFnZXMuLi4K
ICBtbTogYWRkICdpc19zcGVjaWFsX3BhZ2UnIGlubGluZSBmdW5jdGlvbi4uLgogIGRvbWFpbjog
dXNlIFBHQ19leHRyYSBkb21oZWFwIHBhZ2UgZm9yIHNoYXJlZF9pbmZvCgogeGVuL2FyY2gvYXJt
L2RvbWFpbi5jICAgICAgICAgICB8IDEwICsrKy0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAg
ICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgIHwgMjAgKysr
KysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgIHwgIDIgKy0KIHhlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYyAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21tLmMgICAg
ICAgICAgICAgICB8IDExICsrKy0tLS0KIHhlbi9hcmNoL3g4Ni9tbS9hbHRwMm0uYyAgICAgICAg
fCAgMiArLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgICB8ICAzICstCiB4ZW4vYXJj
aC94ODYvbW0vcDJtLmMgICAgICAgICAgIHwgIDYgKystLQogeGVuL2FyY2gveDg2L21tL3NoYWRv
dy9jb21tb24uYyB8IDEzICsrKysrLS0tCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMg
IHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9udW1hLmMgICAgICAgICAgICAgfCAgMyArKwogeGVuL2Fy
Y2gveDg2L3B2L2RvbTBfYnVpbGQuYyAgICB8ICA2ICsrKy0KIHhlbi9hcmNoL3g4Ni9wdi9zaGlt
LmMgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L3Rib290LmMgICAgICAgICAgICB8IDEx
ICsrKysrLS0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgfCA1NiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAg
fCAgMiArLQogeGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMgICAgICB8ICAzICsrCiB4ZW4vY29t
bW9uL3RpbWUuYyAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrLS0KIHhlbi9pbmNsdWRlL2Fz
bS14ODYvc2hhcmVkLmggICAgfCAxNSArKysrLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9kb21haW4u
aCAgICAgICAgfCAgNCArKysKIHhlbi9pbmNsdWRlL3hlbi9tbS5oICAgICAgICAgICAgfCAgNSAr
KysKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgfCAgNSArKy0KIHhlbi9pbmNsdWRl
L3hlbi9zaGFyZWQuaCAgICAgICAgfCAgMiArLQogMjQgZmlsZXMgY2hhbmdlZCwgMTU1IGluc2Vy
dGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
