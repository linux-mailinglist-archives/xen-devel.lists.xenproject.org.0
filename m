Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E357B8E885
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 11:47:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyCJL-0005Uu-TJ; Thu, 15 Aug 2019 09:44:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WRoS=WL=amazon.de=prvs=123ba6262=wipawel@srs-us1.protection.inumbo.net>)
 id 1hyCJK-0005Um-GR
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 09:44:46 +0000
X-Inumbo-ID: 50b1dd5c-bf41-11e9-96f7-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50b1dd5c-bf41-11e9-96f7-bc764e2007e4;
 Thu, 15 Aug 2019 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565862285; x=1597398285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=R6w7bBOukGiWxc+2EZSJrHo/ukXGPMN8gR8UczrUSck=;
 b=ajQfgHnZ56Jjz9KxuzAQ0uspXH+WrWg7v952Fey48wzLsda1gJgEwhof
 CqPqGPUMG35pW8zNNxuY5Xi2pQFWC5lp0fAZ+0BKOetA0yoPX0DWn3/xQ
 McuJ14dqNLPqalVt/x/iuEBXyay/6gagvr8S2URGRB75mQ0SOJsnFddFy g=;
X-IronPort-AV: E=Sophos;i="5.64,388,1559520000"; d="scan'208";a="415542196"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 15 Aug 2019 09:44:44 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id 12E07A2936; Thu, 15 Aug 2019 09:44:44 +0000 (UTC)
Received: from EX13D03EUC003.ant.amazon.com (10.43.164.192) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 15 Aug 2019 09:44:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D03EUC003.ant.amazon.com (10.43.164.192) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 15 Aug 2019 09:44:42 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 15 Aug 2019 09:44:40 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Thu, 15 Aug 2019 09:44:00 +0000
Message-ID: <20190815094400.126289-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190416125832.32881-3-wipawel@amazon.de>
References: <20190416125832.32881-3-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch: independ. modules 3/3] python: Add XC
 binding for Xen build ID
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, mpohlack@amazon.de, wipawel@amazon.de,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXh0ZW5kIHRoZSBsaXN0IG9mIHhjKCkgb2JqZWN0IG1ldGhvZHMgd2l0aCBhZGRpdGlvbmFsIG9u
ZSB0byBkaXNwbGF5ClhlbidzIGJ1aWxkaWQuIFRoZSBpbXBsZW1lbnRhdGlvbiBmb2xsb3dzIHRo
ZSBsaWJ4bCBpbXBsZW1lbnRhdGlvbgooZS5nLiBtYXggYnVpbGRpZCBzaXplIGFzc3VtcHRpb24g
YmVpbmcgWENfUEFHRV9TSVpFKS4KClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6
IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBNYXplaW4gPGFtYXplaW5A
YW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0Bh
bWF6b24uY29tPgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24u
ZGU+Ci0tLQp2MjoKKiBObyBjb2RlIGNoYW5nZQoqIEFkZGluZyBtYWludGFpbmVycwotLS0KIHRv
b2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMgYi90b29scy9weXRob24veGVuL2xvd2xl
dmVsL3hjL3hjLmMKaW5kZXggNTIyY2JlM2I5Yy4uNTQ1OWQ2ODM0ZCAxMDA2NDQKLS0tIGEvdG9v
bHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jCisrKyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93
bGV2ZWwveGMveGMuYwpAQCAtMTIxMSw2ICsxMjExLDI2IEBAIG91dDoKICAgICByZXR1cm4gcmV0
X29iaiA/IHJldF9vYmogOiBweXhjX2Vycm9yX3RvX2V4Y2VwdGlvbihzZWxmLT54Y19oYW5kbGUp
OwogfQogCitzdGF0aWMgUHlPYmplY3QgKnB5eGNfeGVuYnVpbGRpZChYY09iamVjdCAqc2VsZikK
K3sKKyAgICB4ZW5fYnVpbGRfaWRfdCAqYnVpbGRpZDsKKyAgICBpbnQgaSwgcjsKKyAgICBjaGFy
ICpzdHI7CisKKyAgICBidWlsZGlkID0gYWxsb2NhKHNpemVvZihidWlsZGlkLT5sZW4pICsgWENf
UEFHRV9TSVpFKTsKKyAgICBidWlsZGlkLT5sZW4gPSBYQ19QQUdFX1NJWkUgLSBzaXplb2YoKmJ1
aWxkaWQpOworCisgICAgciA9IHhjX3ZlcnNpb24oc2VsZi0+eGNfaGFuZGxlLCBYRU5WRVJfYnVp
bGRfaWQsIGJ1aWxkaWQpOworICAgIGlmICggciA8PSAwICkKKyAgICAgICAgcmV0dXJuIHB5eGNf
ZXJyb3JfdG9fZXhjZXB0aW9uKHNlbGYtPnhjX2hhbmRsZSk7CisKKyAgICBzdHIgPSBhbGxvY2Eo
KHIgKiAyKSArIDEpOworICAgIGZvciAoIGkgPSAwOyBpIDwgcjsgaSsrICkKKyAgICAgICAgc25w
cmludGYoJnN0cltpICogMl0sIDMsICIlMDJoaHgiLCBidWlsZGlkLT5idWZbaV0pOworCisgICAg
cmV0dXJuIFB5X0J1aWxkVmFsdWUoInMiLCBzdHIpOworfQorCiBzdGF0aWMgUHlPYmplY3QgKnB5
eGNfeGVuaW5mbyhYY09iamVjdCAqc2VsZikKIHsKICAgICB4ZW5fZXh0cmF2ZXJzaW9uX3QgeGVu
X2V4dHJhOwpAQCAtMjI5NCw2ICsyMzE0LDEzIEBAIHN0YXRpYyBQeU1ldGhvZERlZiBweXhjX21l
dGhvZHNbXSA9IHsKICAgICAgICJSZXR1cm5zIFtkaWN0XTogaW5mb3JtYXRpb24gYWJvdXQgWGVu
IgogICAgICAgIiAgICAgICAgW05vbmVdOiBvbiBmYWlsdXJlLlxuIiB9LAogCisgICAgeyAiYnVp
bGRpZCIsCisgICAgICAoUHlDRnVuY3Rpb24pcHl4Y194ZW5idWlsZGlkLAorICAgICAgTUVUSF9O
T0FSR1MsICJcbiIKKyAgICAgICJHZXQgWGVuIGJ1aWxkaWRcbiIKKyAgICAgICJSZXR1cm5zIFtz
dHJdOiBYZW4gYnVpbGRpZCIKKyAgICAgICIgICAgICAgIFtOb25lXTogb24gZmFpbHVyZS5cbiIg
fSwKKwogICAgIHsgInNoYWRvd19jb250cm9sIiwgCiAgICAgICAoUHlDRnVuY3Rpb24pcHl4Y19z
aGFkb3dfY29udHJvbCwgCiAgICAgICBNRVRIX1ZBUkFSR1MgfCBNRVRIX0tFWVdPUkRTLCAiXG4i
Ci0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkty
YXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBT
Y2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxv
dHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAy
MzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
