Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F835C7AB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 15:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109091.208195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVwdq-0008UH-4Z; Mon, 12 Apr 2021 13:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109091.208195; Mon, 12 Apr 2021 13:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVwdq-0008Tr-0C; Mon, 12 Apr 2021 13:30:14 +0000
Received: by outflank-mailman (input) for mailman id 109091;
 Mon, 12 Apr 2021 13:30:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OvXO=JJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lVwdo-0008Ti-K4
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 13:30:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27ee8b5d-b582-442c-b466-945de4eadc47;
 Mon, 12 Apr 2021 13:30:11 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 27ee8b5d-b582-442c-b466-945de4eadc47
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618234211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4G0liXTRoDoxxIpwz1j4AW2gX9FwMKi9LjHo2rv5814=;
  b=GjvIbaKj1nJHGZIrrRt6ENx5DQ1kJDQnk89Ul5a0cPFGnWmleOpZdlrz
   0IJyC3tRy31fm3ijItg/K+fACOBwxb2RMbZNcxgER5y1C6Z4zu5gi2PGT
   gj8v0l8jcY0kE+UiscTmC/HwYwvwP09K7dw/yHzSbCsHw+0AgVD1iWbgO
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2F3sBJWOu/g2rgQckHxWIr4DiDKUxjDWwXZQZ/oS7/dorTqiH1kfmf72VPIe1lzKCePoH1YyAh
 qG9nCqSXOTBDBWwyR1yytlnZRU2rfU2UyvOsF/1yjWpFHGDU9I1pcliEdkzSsaD9iplAcPxsYR
 HTvwaKUWi1F1y7CVh79nXY/d5c0dWC7ugQ9ligUov1+JC4XwrWrxvVZgHYuqhOZprvLJdL0ZOM
 +nsIaEdbn6YPNRNMoU9u89+a/IO1Geh353YV4Ow7aI5AM3IlSRrPtMCvZ/LS7wWJ9/v9Vyjtkq
 Xeg=
X-SBRS: 4.0
X-MesageID: 41522596
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YvfPLa5MyhXGyDZlUgPXwEvXdLJzesId70hD6mlaY3VuHfCwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkO4sFJ2lWxTrv3btEZF64eLZskTdMgD36+I178
 ZdWodkDtmYNzVHpOb8pDK1CtMxhOSAmZrY59v261dIYUVUZ7p77wF/YzzrdnFeYAVdH5I2GN
 69y6N8xwaIQngcYsSlCnRtZYGqzLf2vanrbhIcCxks5BPmt0LM1JfAHwWFxRBbajtTwN4ZgA
 74ujbk7aauuezT8HHh/lLUhq47pPLRjv9KBMmBkaEuW1bRtjo=
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41522596"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
CC: Laszlo Ersek <lersek@redhat.com>, Jordan Justen
	<jordan.l.justen@intel.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>,
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 3/7] OvmfPkg/IndustryStandard/Xen: Apply EDK2 coding style to XEN_VCPU_TIME_INFO
Date: Mon, 12 Apr 2021 14:29:59 +0100
Message-ID: <20210412133003.146438-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412133003.146438-1-anthony.perard@citrix.com>
References: <20210412133003.146438-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain

V2UgYXJlIGdvaW5nIHRvIHVzZSBuZXcgZmllbGRzIGZyb20gdGhlIFhlbiBoZWFkZXJzLiBBcHBs
eSB0aGUgRURLMgpjb2Rpbmcgc3R5bGUgc28gdGhhdCB0aGUgY29kZSB0aGF0IGlzIGdvaW5nIHRv
IHVzZSBpdCBkb2Vzbid0IGxvb2sgb3V0Cm9mIHBsYWNlLgoKUmVmOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTI0OTAKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBMYXN6bG8g
RXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgogICAgdjI6CiAgICAtIGZpeCBj
YXNlIG9mIFRzYyogZmllbGQKCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4v
eGVuLmggfCAxNyArKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0
cnlTdGFuZGFyZC9YZW4veGVuLmggYi9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9Y
ZW4veGVuLmgKaW5kZXggZTU1ZDkzMjYzMjg1Li43OWE0ZTIxMmU3YzIgMTAwNjQ0Ci0tLSBhL092
bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi94ZW4uaAorKysgYi9Pdm1mUGtnL0lu
Y2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4veGVuLmgKQEAgLTE4MywxMCArMTgzLDEwIEBAIHN0
cnVjdCB2Y3B1X3RpbWVfaW5mbyB7CiAgICAgICogVGhlIGNvcnJlY3Qgd2F5IHRvIGludGVyYWN0
IHdpdGggdGhlIHZlcnNpb24gbnVtYmVyIGlzIHNpbWlsYXIgdG8NCiAgICAgICogTGludXgncyBz
ZXFsb2NrOiBzZWUgdGhlIGltcGxlbWVudGF0aW9ucyBvZiByZWFkX3NlcWJlZ2luL3JlYWRfc2Vx
cmV0cnkuDQogICAgICAqLw0KLSAgICBVSU5UMzIgdmVyc2lvbjsNCisgICAgVUlOVDMyIFZlcnNp
b247DQogICAgIFVJTlQzMiBwYWQwOw0KLSAgICBVSU5UNjQgdHNjX3RpbWVzdGFtcDsgICAvKiBU
U0MgYXQgbGFzdCB1cGRhdGUgb2YgdGltZSB2YWxzLiAgKi8NCi0gICAgVUlOVDY0IHN5c3RlbV90
aW1lOyAgICAgLyogVGltZSwgaW4gbmFub3NlY3MsIHNpbmNlIGJvb3QuICAgICovDQorICAgIFVJ
TlQ2NCBUc2NUaW1lc3RhbXA7ICAgLyogVFNDIGF0IGxhc3QgdXBkYXRlIG9mIHRpbWUgdmFscy4g
ICovDQorICAgIFVJTlQ2NCBTeXN0ZW1UaW1lOyAgICAgLyogVGltZSwgaW4gbmFub3NlY3MsIHNp
bmNlIGJvb3QuICAgICovDQogICAgIC8qDQogICAgICAqIEN1cnJlbnQgc3lzdGVtIHRpbWU6DQog
ICAgICAqICAgc3lzdGVtX3RpbWUgKw0KQEAgLTE5NCwxMSArMTk0LDExIEBAIHN0cnVjdCB2Y3B1
X3RpbWVfaW5mbyB7CiAgICAgICogQ1BVIGZyZXF1ZW5jeSAoSHopOg0KICAgICAgKiAgICgoMTBe
OSA8PCAzMikgLyB0c2NfdG9fc3lzdGVtX211bCkgPj4gdHNjX3NoaWZ0DQogICAgICAqLw0KLSAg
ICBVSU5UMzIgdHNjX3RvX3N5c3RlbV9tdWw7DQotICAgIElOVDggICB0c2Nfc2hpZnQ7DQorICAg
IFVJTlQzMiBUc2NUb1N5c3RlbU11bHRpcGxpZXI7DQorICAgIElOVDggICBUc2NTaGlmdDsNCiAg
ICAgSU5UOCAgIHBhZDFbM107DQogfTsgLyogMzIgYnl0ZXMgKi8NCi10eXBlZGVmIHN0cnVjdCB2
Y3B1X3RpbWVfaW5mbyB2Y3B1X3RpbWVfaW5mb190Ow0KK3R5cGVkZWYgc3RydWN0IHZjcHVfdGlt
ZV9pbmZvIFhFTl9WQ1BVX1RJTUVfSU5GTzsNCiANCiBzdHJ1Y3QgdmNwdV9pbmZvIHsNCiAgICAg
LyoNCkBAIC0yMzQsNyArMjM0LDcgQEAgc3RydWN0IHZjcHVfaW5mbyB7CiAjZW5kaWYgLyogWEVO
X0hBVkVfUFZfVVBDQUxMX01BU0sgKi8NCiAgICAgeGVuX3Vsb25nX3QgZXZ0Y2huX3BlbmRpbmdf
c2VsOw0KICAgICBzdHJ1Y3QgYXJjaF92Y3B1X2luZm8gYXJjaDsNCi0gICAgc3RydWN0IHZjcHVf
dGltZV9pbmZvIHRpbWU7DQorICAgIHN0cnVjdCB2Y3B1X3RpbWVfaW5mbyBUaW1lOw0KIH07IC8q
IDY0IGJ5dGVzICh4ODYpICovDQogI2lmbmRlZiBfX1hFTl9fDQogdHlwZWRlZiBzdHJ1Y3QgdmNw
dV9pbmZvIHZjcHVfaW5mb190Ow0KQEAgLTI1MCw3ICsyNTAsNyBAQCB0eXBlZGVmIHN0cnVjdCB2
Y3B1X2luZm8gdmNwdV9pbmZvX3Q7CiAgKiBvZiB0aGlzIHN0cnVjdHVyZSByZW1haW5pbmcgY29u
c3RhbnQuDQogICovDQogc3RydWN0IHNoYXJlZF9pbmZvIHsNCi0gICAgc3RydWN0IHZjcHVfaW5m
byB2Y3B1X2luZm9bWEVOX0xFR0FDWV9NQVhfVkNQVVNdOw0KKyAgICBzdHJ1Y3QgdmNwdV9pbmZv
IFZjcHVJbmZvW1hFTl9MRUdBQ1lfTUFYX1ZDUFVTXTsNCiANCiAgICAgLyoNCiAgICAgICogQSBk
b21haW4gY2FuIGNyZWF0ZSAiZXZlbnQgY2hhbm5lbHMiIG9uIHdoaWNoIGl0IGNhbiBzZW5kIGFu
ZCByZWNlaXZlDQpAQCAtMjk5LDYgKzI5OSw3IEBAIHN0cnVjdCBzaGFyZWRfaW5mbyB7CiB9Ow0K
ICNpZm5kZWYgX19YRU5fXw0KIHR5cGVkZWYgc3RydWN0IHNoYXJlZF9pbmZvIHNoYXJlZF9pbmZv
X3Q7DQordHlwZWRlZiBzdHJ1Y3Qgc2hhcmVkX2luZm8gWEVOX1NIQVJFRF9JTkZPOw0KICNlbmRp
Zg0KIA0KIC8qIFR1cm4gYSBwbGFpbiBudW1iZXIgaW50byBhIEMgVUlOVE4gY29uc3RhbnQuICov
DQotLSAKQW50aG9ueSBQRVJBUkQKCg==

