Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055795F37
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 14:53:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i03c4-0000kZ-SV; Tue, 20 Aug 2019 12:51:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xv/m=WQ=amazon.de=prvs=128763efb=wipawel@srs-us1.protection.inumbo.net>)
 id 1i03c2-0000kP-TX
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 12:51:46 +0000
X-Inumbo-ID: 43f5691a-c349-11e9-8bf7-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43f5691a-c349-11e9-8bf7-12813bfff9fa;
 Tue, 20 Aug 2019 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566305505; x=1597841505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=hVoPdeyWBLpUeHrB6jau8Zmw2/d8DmPJ6X4Zx4H66ZY=;
 b=odbxgJvK6xXUtHOO6xkYyzdZGlQX9CfCPphA2T83u+QgP57U6SupFM2P
 478Ar/06vX43v2CTBhIS/QcTKjRA8DnJSEfX05lEmooIVDBWWHvrIwlzV
 flxJ56aoLe7UCUgPsn2+NX1VQCTJgNxULoHOhijcMYtoV35g05qaniJuy k=;
X-IronPort-AV: E=Sophos;i="5.64,408,1559520000"; d="scan'208";a="821632886"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 20 Aug 2019 12:51:42 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 20C00A1C2B; Tue, 20 Aug 2019 12:51:42 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 12:51:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 12:51:21 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 20 Aug 2019 12:51:20 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Tue, 20 Aug 2019 12:51:08 +0000
Message-ID: <20190820125108.104102-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190815094400.126289-1-wipawel@amazon.de>
References: <20190815094400.126289-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch: independ. modules v3 3/3] python: Add XC
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
 amazein@amazon.de, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXh0ZW5kIHRoZSBsaXN0IG9mIHhjKCkgb2JqZWN0IG1ldGhvZHMgd2l0aCBhZGRpdGlvbmFsIG9u
ZSB0byBkaXNwbGF5ClhlbidzIGJ1aWxkaWQuIFRoZSBpbXBsZW1lbnRhdGlvbiBmb2xsb3dzIHRo
ZSBsaWJ4bCBpbXBsZW1lbnRhdGlvbgooZS5nLiBtYXggYnVpbGRpZCBzaXplIGFzc3VtcHRpb24g
YmVpbmcgWENfUEFHRV9TSVpFIG1pbnVzCnNpemVvZihidWlsZGlkLT5sZW4pKS4KClNpZ25lZC1v
ZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQt
Ynk6IE1hcnRpbiBNYXplaW4gPGFtYXplaW5AYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQW5kcmEt
SXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogTm9yYmVy
dCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Ci0tLQp2MzoKKiBJbnN0ZWFkIG9mIGFsbG9j
YXRpbmcgWENfUEFHRV9TSVpFIHBsdXMgc2l6ZSBvZiB0aGUgbGVuIGZpZWxkLAogYWxsb2NhdGUg
b25lIFhDX1BBR0VfU0laRSBmb3IgdGhlIHdob2xlIGJ1aWxkaWQgc3RydWN0LgoqIE1vZGlmeSBj
b21taXQgbWVzc2FnZSB0byByZWZsZWN0IHRoZSBhYm92ZSBjaGFuZ2UuCnYyOgoqIE5vIGNvZGUg
Y2hhbmdlCiogQWRkaW5nIG1haW50YWluZXJzCi0tLQogdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZl
bC94Yy94Yy5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2
ZWwveGMveGMuYyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYwppbmRleCA1MjJj
YmUzYjljLi43ZWQ0YTI1M2RlIDEwMDY0NAotLS0gYS90b29scy9weXRob24veGVuL2xvd2xldmVs
L3hjL3hjLmMKKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jCkBAIC0xMjEx
LDYgKzEyMTEsMjYgQEAgb3V0OgogICAgIHJldHVybiByZXRfb2JqID8gcmV0X29iaiA6IHB5eGNf
ZXJyb3JfdG9fZXhjZXB0aW9uKHNlbGYtPnhjX2hhbmRsZSk7CiB9CiAKK3N0YXRpYyBQeU9iamVj
dCAqcHl4Y194ZW5idWlsZGlkKFhjT2JqZWN0ICpzZWxmKQoreworICAgIHhlbl9idWlsZF9pZF90
ICpidWlsZGlkOworICAgIGludCBpLCByOworICAgIGNoYXIgKnN0cjsKKworICAgIGJ1aWxkaWQg
PSBhbGxvY2EoWENfUEFHRV9TSVpFKTsKKyAgICBidWlsZGlkLT5sZW4gPSBYQ19QQUdFX1NJWkUg
LSBzaXplb2YoKmJ1aWxkaWQpOworCisgICAgciA9IHhjX3ZlcnNpb24oc2VsZi0+eGNfaGFuZGxl
LCBYRU5WRVJfYnVpbGRfaWQsIGJ1aWxkaWQpOworICAgIGlmICggciA8PSAwICkKKyAgICAgICAg
cmV0dXJuIHB5eGNfZXJyb3JfdG9fZXhjZXB0aW9uKHNlbGYtPnhjX2hhbmRsZSk7CisKKyAgICBz
dHIgPSBhbGxvY2EoKHIgKiAyKSArIDEpOworICAgIGZvciAoIGkgPSAwOyBpIDwgcjsgaSsrICkK
KyAgICAgICAgc25wcmludGYoJnN0cltpICogMl0sIDMsICIlMDJoaHgiLCBidWlsZGlkLT5idWZb
aV0pOworCisgICAgcmV0dXJuIFB5X0J1aWxkVmFsdWUoInMiLCBzdHIpOworfQorCiBzdGF0aWMg
UHlPYmplY3QgKnB5eGNfeGVuaW5mbyhYY09iamVjdCAqc2VsZikKIHsKICAgICB4ZW5fZXh0cmF2
ZXJzaW9uX3QgeGVuX2V4dHJhOwpAQCAtMjI5NCw2ICsyMzE0LDEzIEBAIHN0YXRpYyBQeU1ldGhv
ZERlZiBweXhjX21ldGhvZHNbXSA9IHsKICAgICAgICJSZXR1cm5zIFtkaWN0XTogaW5mb3JtYXRp
b24gYWJvdXQgWGVuIgogICAgICAgIiAgICAgICAgW05vbmVdOiBvbiBmYWlsdXJlLlxuIiB9LAog
CisgICAgeyAiYnVpbGRpZCIsCisgICAgICAoUHlDRnVuY3Rpb24pcHl4Y194ZW5idWlsZGlkLAor
ICAgICAgTUVUSF9OT0FSR1MsICJcbiIKKyAgICAgICJHZXQgWGVuIGJ1aWxkaWRcbiIKKyAgICAg
ICJSZXR1cm5zIFtzdHJdOiBYZW4gYnVpbGRpZCIKKyAgICAgICIgICAgICAgIFtOb25lXTogb24g
ZmFpbHVyZS5cbiIgfSwKKwogICAgIHsgInNoYWRvd19jb250cm9sIiwgCiAgICAgICAoUHlDRnVu
Y3Rpb24pcHl4Y19zaGFkb3dfY29udHJvbCwgCiAgICAgICBNRVRIX1ZBUkFSR1MgfCBNRVRIX0tF
WVdPUkRTLCAiXG4iCi0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
