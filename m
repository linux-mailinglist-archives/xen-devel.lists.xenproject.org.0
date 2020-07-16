Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007FE2221C5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 13:55:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw2TG-0005um-B1; Thu, 16 Jul 2020 11:54:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXgs=A3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jw2TE-0005uh-BC
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 11:54:36 +0000
X-Inumbo-ID: 1e16853c-c75b-11ea-bb8b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e16853c-c75b-11ea-bb8b-bc764e2007e4;
 Thu, 16 Jul 2020 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594900476;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=VZ84eSJHuEXHFeY9Oq583Sd5WV44pROfefSm7ED9P8A=;
 b=XgTbwsrKHz5B6LGpy9pnsVegECm1jCXR6WIH0j98/HWu7e7ln2Mcnsud
 8EpcOqsjYclJqT1r0O872ryfJ/q1B0t6/zaOavaNWA+uXQ1o94xcw06rA
 wLK03hGXPJYf624QxwvkiX4oiMUALXaSfhAnVn7MEzNiTGs8xHWCwijeZ c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hSgwiYzQK5sUKsr3JM2ioRs/WbQFPbZnxLG0eJv7z/VL7K3V6ARoMpsUojGK8WYQDHJfBHFlB0
 n4NEItZ7txnZDnLmmzmbj7tnzO2Nmri7w5QPmtjDKwOmBvAZJTnS7xWvfhtAZTYL7XHZITDU5o
 CUKe2jNgqJNQaY6fn1VPwojEQgUlly+4bvRoJ+Pk+hFwvPjqzBlaRJV/Z+6G1dw+Um/F0Ti6SE
 oH6NFjbjcZ0jii00awptbm1YaZEJJxg3CY3+/aAoI1KlV50TaKCkfUj1jxvfcJLkRXeDDcQu9V
 at8=
X-SBRS: 2.7
X-MesageID: 22835307
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,359,1589256000"; d="scan'208";a="22835307"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Saved notes for design sessions
Thread-Topic: Saved notes for design sessions
Thread-Index: AQHWW2fcrzg6m88NVUmqDHsRdn6IYw==
Date: Thu, 16 Jul 2020 11:54:29 +0000
Message-ID: <8D97F48E-1948-4C1D-965F-0B42797516DD@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E51A99BF8E6A140922844A77786B437@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hey all,

PDFs of the saved shared notes for the design sessions can be found in this=
 zipfile:

https://cryptpad.fr/file/#/2/file/LoJZpSq+vHKNoisVqdsPj3Z9/

The files are labeled with the start/end time and the room in which they we=
re held; that should help you find out the notes which are pertinent to you=
.

Please remember to post a summary of your design session to xen-devel for p=
osterity.

Thanks!

 -George=

