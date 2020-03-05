Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA017AD56
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 18:34:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9uKs-0002sL-5Y; Thu, 05 Mar 2020 17:31:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BTO=4W=amzn.com=prvs=326a7180f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9uKr-0002sG-19
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 17:31:01 +0000
X-Inumbo-ID: 14c5e688-5f07-11ea-90c4-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14c5e688-5f07-11ea-90c4-bc764e2007e4;
 Thu, 05 Mar 2020 17:31:00 +0000 (UTC)
IronPort-SDR: AjjEn5f06VESBK/Lt6fw2xrfMc+ah1R5nlJuMZF8ka6b3W2DgTaWn0p50Nu8nGMJAQB71DE6rr
 42TUkqJHnTeA==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="21208502"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 05 Mar 2020 17:30:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id CEE9B14194F; Thu,  5 Mar 2020 17:30:44 +0000 (UTC)
Received: from EX13D25UEA003.ant.amazon.com (10.43.61.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 17:30:44 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D25UEA003.ant.amazon.com (10.43.61.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 5 Mar 2020 17:30:43 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Mar 2020 17:30:42 +0000
From: <pdurrant@amzn.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 17:30:39 +0000
Message-ID: <20200305173041.5141-1-pdurrant@amzn.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6 0/2] docs: Migration design documents
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <pdurrant@amzn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbXpuLmNvbT4KClBhdWwgRHVycmFudCAoMik6
CiAgZG9jcy9kZXNpZ25zOiBBZGQgYSBkZXNpZ24gZG9jdW1lbnQgZm9yIG5vbi1jb29wZXJhdGl2
ZSBsaXZlIG1pZ3JhdGlvbgogIGRvY3MvZGVzaWduczogQWRkIGEgZGVzaWduIGRvY3VtZW50IGZv
ciBtaWdyYXRpb24gb2YgeGVuc3RvcmUgZGF0YQoKIGRvY3MvZGVzaWducy9ub24tY29vcGVyYXRp
dmUtbWlncmF0aW9uLm1kIHwgMjgwICsrKysrKysrKysrKysrKysrKysrKysKIGRvY3MvZGVzaWdu
cy94ZW5zdG9yZS1taWdyYXRpb24ubWQgICAgICAgIHwgMTcxICsrKysrKysrKysrKysKIGRvY3Mv
bWlzYy94ZW5zdG9yZS50eHQgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiAzIGZpbGVzIGNo
YW5nZWQsIDQ1NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRvY3MvZGVzaWducy9ub24tY29vcGVyYXRpdmUtbWlncmF0aW9uLm1kCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZAotLS0KQ2M6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLSAKMi4yMC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
