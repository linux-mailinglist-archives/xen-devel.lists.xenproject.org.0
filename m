Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E10109EB5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:14:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZadM-0001FC-J0; Tue, 26 Nov 2019 13:12:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZadK-0001F7-RV
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:11:58 +0000
X-Inumbo-ID: 5328bd04-104e-11ea-a55d-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5328bd04-104e-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574773918; x=1606309918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=8bC40VMOZoNeBLwk9gCn6M2g06aiQ9xuGY1pnSFJKcs=;
 b=pr7x3EK0TC0VYMHbCpbXmh68prFfNr9bX2Hf362RE+FO568CGQ2lRUIz
 FbMqAiY/nNa+WYwoukqc8IWCCyq5/kkt3Ri2xghPkGToOSLpz81EHuq2q
 Zxrh5hjvjQ3kadxgDzpFYFQ64KMpodGlm/SzZR3TLjPD5VMrg8ydNykeJ A=;
IronPort-SDR: +g3ctbpp2YeGi/QSUFPlx9aF5AvuJpoBkA8mtRks+FXTcCtvwQbvqX5CxaTlv4Gm9QDT3TQvGu
 8U7foCJQt6jw==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="9949957"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Nov 2019 13:11:46 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5CADEA2882; Tue, 26 Nov 2019 13:11:45 +0000 (UTC)
Received: from EX13D05EUC003.ant.amazon.com (10.43.164.207) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 13:11:44 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05EUC003.ant.amazon.com (10.43.164.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 13:11:43 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 13:11:41 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 13:11:39 +0000
Message-ID: <20191126131139.14476-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20191126123027.9032-1-wipawel@amazon.de>
References: <20191126123027.9032-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] MAINTAINERS: Add mandatory V: version
 identifier
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>, Lars
 Kurth <lars.kurth@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxpdmVwYXRjaC1idWlsZC10b29scyBNQUlOVEFJTkVSUyBmaWxlIGlzIG1pc3NpbmcgVjog
dmVyc2lvbgppZGVudGlmaWVyLiBUaGlzIHNlZW1zIHJlcXVpcmVkIGJ5IHRoZSBYZW4gcmVwbydz
IGFkZF9tYWludGFpbmVycy5wbApzY3JpcHQuCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9y
a2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Ci0tLQogTUFJTlRBSU5FUlMgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJ
TlRBSU5FUlMKaW5kZXggZGUyYWVkYi4uYWEwNGQwNiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMK
KysrIGIvTUFJTlRBSU5FUlMKQEAgLTksMyArOSw0IEBAIEw6CXhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwogUzoJU3VwcG9ydGVkCiBGOgkqCiBGOgkqLworVjoJeGVuLW1haW50YWluZXJz
LTEKLS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgK
S3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFu
IFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFy
bG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5
IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
