Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6D18F5EC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 14:41:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGNHV-0000bs-M8; Mon, 23 Mar 2020 13:38:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xNlF=5I=amazon.de=prvs=344d8b8e3=nmanthey@srs-us1.protection.inumbo.net>)
 id 1jGNHT-0000bn-Nk
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 13:38:15 +0000
X-Inumbo-ID: 8b7c24ba-6d0b-11ea-82d5-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b7c24ba-6d0b-11ea-82d5-12813bfff9fa;
 Mon, 23 Mar 2020 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1584970695; x=1616506695;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=eAJFTkvbvrJtoZLgDnbR6uZHfr2brwVkjhpUPDs5R00=;
 b=Hpk2MWamuBm/ShX2x6NsxeRUS1hz+6heljCWM32N7/wsEpzgbz4LPtVL
 1MePf5k5m2V/snn1j8m7XPxm8KyfLAG+Nz+2lVuoKqeB2vjT0Xfyzghlu
 /4j+OxKebMdOdZz31k+t5zaA/uhD6b5t7apU8DJq6/eLM6ffo/clvF5SE 4=;
IronPort-SDR: 8538lUkE5cB6DzsLx1z0wakfoZ/PDtjzoM1ZZp1PTZOmGJKcTegMpgqDdlTQlU/mh4VZsY+GUW
 1MvNeesIr+iQ==
X-IronPort-AV: E=Sophos;i="5.72,296,1580774400"; d="scan'208";a="24543959"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 23 Mar 2020 13:38:13 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id CF2CDA2373; Mon, 23 Mar 2020 13:38:11 +0000 (UTC)
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 23 Mar 2020 13:38:11 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 13:38:09 +0000
Received: from u6fc700a6f3c650.ant.amazon.com (10.95.138.2) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 23 Mar 2020 13:38:07 +0000
From: Norbert Manthey <nmanthey@amazon.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 14:36:57 +0100
Message-ID: <20200323133701.21728-1-nmanthey@amazon.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH XTF benchmark v1 0/4] XTF: add micro benchmarks
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Norbert Manthey <nmanthey@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBhbGwsCgpJIGFkZGVkIGEgYmVuY2htYXJrIGNhdGVnb3J5IHRvIFhURiwgYW5kIGFkZGVk
IGZ1bmN0aW9ucyB0byBtZWFzdXJlIHRpbWUgaW4gdGhlCmd1ZXN0LiBGaW5hbGx5LCBJIGFkZGVk
IGEgZmlyc3QgbWljcm8gYmVuY2htYXJrIHRoYXQgbWVhc3VyZXMgdGhlIHRpbWUgdG8gY2FsbCBh
CnNwZWNpZmllZCBoeXBlcmNhbGwsIGFuZCBwcmludCB0aGUgYXZlcmFnZSB0aW1lIHRoZSBoeXBl
cmNhbGwgdGFrZXMuCgpUaGUgYWRkZWQgY2F0ZWdvcnkgc2hvdWxkIGJlIHVzZWZ1bCB0byBpbXBs
ZW1lbnQgZnVydGhlciBtaWNybyBiZW5jaG1hcmtzLiBJCmFscmVhZHkgaW1wbGVtZW50ZWQgYSBm
ZXcgbW9yZSB0aGF0IEkgd2lsbCBwdWJsaXNoIG9uY2UgdGhlIGVudmlyb25tZW50IGlzCmFncmVl
ZCBvbi4KCkJlc3QsCk5vcmJlcnQKCk5vcmJlcnQgTWFudGhleSAoNCk6CiAgY2F0ZWdvcmllczog
YWRkIGJlbmNobWFyawogIHRpbWU6IGFkZCBzdHVicwogIHRpbWU6IHByb3ZpZGUgbWVhc3VyZW1l
bnQgdGVtcGxhdGUKICBwZXJmOiBtZWFzdXJlIE1NVUVYVF9NQVJLX1NVUEVSIHRlc3QKCiBidWls
ZC9jb21tb24ubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGJ1aWxk
L2ZpbGVzLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBjb21tb24v
dGltZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNzkgKysrKysrKysrKysr
KysrKysrCiBpbmNsdWRlL3h0Zi90aW1lLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ODEgKysrKysKIHRlc3RzL3BlcmYtUFYtTU1VRVhUX01BUktfU1VQRVItbm9vcC9NYWtlZmlsZSB8
ICAgOSArCiB0ZXN0cy9wZXJmLVBWLU1NVUVYVF9NQVJLX1NVUEVSLW5vb3AvbWFpbi5jICAgfCAg
ODAgKysrKysKIHh0Zi1ydW5uZXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMiArLQogNyBmaWxlcyBjaGFuZ2VkLCA0NTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb21tb24vdGltZS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS94dGYvdGltZS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvcGVyZi1QVi1NTVVF
WFRfTUFSS19TVVBFUi1ub29wL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvcGVy
Zi1QVi1NTVVFWFRfTUFSS19TVVBFUi1ub29wL21haW4uYwoKLS0gCjIuMTcuMQoKCgoKQW1hem9u
IERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVy
bGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vp
c3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0
OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
