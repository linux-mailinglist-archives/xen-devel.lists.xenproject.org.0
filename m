Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9414C926
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 11:58:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwl0m-0007XG-2A; Wed, 29 Jan 2020 10:55:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwl0k-0007XA-Di
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 10:55:54 +0000
X-Inumbo-ID: eb60fef6-4285-11ea-b211-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb60fef6-4285-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580295354; x=1611831354;
 h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=S3JoveFO/jbwFUPNlOkjfFpquixihoxDm87p4tIldwA=;
 b=Y4TlYvi1runbukZkQ9hOA0svWF30dDWNS8qmRpLoq3JJ1+uElUeaIe+G
 4D27PfLIV65ObVazZdJvSeHw/+kR/e37Z5NOjNIljGTziAm49R29maorl
 12czu0THfQfknSN/Gxw3H4yN8CtxCjSddX/Toy1ovcD/gJXjKxwhxN9Od 8=;
IronPort-SDR: wD8YY+ELGffTXnJur6TnAJmt1OoD/HOi+dyfa8TO0/MerLj8EAtEKiwWYWyrbRr8AvSV2Qt4Xm
 qLdqGE5ahi/g==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="13368342"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Jan 2020 10:55:39 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1B72BA04A8
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 10:55:39 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 10:55:38 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 10:55:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 10:55:37 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Xen 4.14 dates
Thread-Index: AdXWkkwE4oZwwZGcROeg+q8Um7FCag==
Date: Wed, 29 Jan 2020 10:55:37 +0000
Message-ID: <a239c82563154aa7801fc9fa2ec70b1b@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] Xen 4.14 dates
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgogIEknbSBub3QgYXdhcmUgb24gYW55IHByaW9yIGRpc2N1c3Npb24gdy5yLnQuIGRhdGVz
IGZvciBYZW4gNC4xNCBzbyBhcyBSTSBJJ2QgbGlrZSB0byBwcm9wb3NlIHRoZSBmb2xsb3dpbmc6
CgpMYXN0IHBvc3Rpbmc6IE1heSAxc3QgMjAyMApIYXJkIEZyZWV6ZTogTWF5IDIybmQgMjAyMApS
ZWxlYXNlOiBKdW5lIDI2dGgKCiAgVGhhdCBwdXRzIHN1bW1pdCBiZXR3ZWVuIGhhcmQgZnJlZXpl
IGFuZCByZWxlYXNlLCBidXQgSSBkb24ndCBzZWUgdGhhdCBhcyBhIHByb2JsZW0gYW5kIG1heSBl
dmVuIGJlIGJlbmVmaWNpYWwuCgogIFRob3VnaHRzPwoKICAgIFBhdWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
