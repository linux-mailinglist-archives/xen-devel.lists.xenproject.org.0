Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7665D106E5
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:20:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmGz-000220-AY; Wed, 01 May 2019 10:15:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmGx-00021v-Rw
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:15:31 +0000
X-Inumbo-ID: 09ba4aa0-6bfa-11e9-abe1-c7b3e26c1112
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09ba4aa0-6bfa-11e9-abe1-c7b3e26c1112;
 Wed, 01 May 2019 10:15:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84836084"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:15:21 +0100
Message-ID: <20190501101521.20140-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] Revert "arm64: tolerate host allocation
 failures"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugbm93IGhhdmUgNCB3b3JraW5nIGFybTY0IGJveGVzIGFuZCB0aGlzIGlzIHF1aXRlIGFtcGxl
IGZvciBvdXIKY3VycmVudCB0ZXN0IG1hdHJpeC4gIFdlIGhhdmUgdHdvIGtpbmRzIG9mIGJveCwg
dG9vLiAgU28sIGdyZWF0LgoKVGhpcyByZXZlcnRzIGNvbW1pdCAwNzA1YmVkOWUyMGVhNDM3NWU3
YWM5ZjgxMDllZjk1NWViYzZmZTljLgoKQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+ClNp
Z25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0K
IGFsbG93LmFsbCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FsbG93LmFsbCBiL2FsbG93LmFsbAppbmRleCA4OTRiNjllYS4uN2EzNGE4MDkgMTAw
NjQ0Ci0tLSBhL2FsbG93LmFsbAorKysgYi9hbGxvdy5hbGwKQEAgLTMsNSArMywzIEBAIGJ1aWxk
LUBAICAgICAgICAgICAgICAgICAgICAgICAgbG9ncy1jYXB0dXJlQEAKIHRlc3QtQEAtcGNpcHRA
QAogdGVzdC1AQC1xZW11dS1AQAkJZ3Vlc3QtbG9jYWxtaWdyYXRlCiB0ZXN0LUBALXdpbjctQEAJ
CQlndWVzdC1zdG9wCi1AQC1hcm02NAkJCWhvc3RzLWFsbG9jYXRlCi1AQC1hcm02NC1AQAkJCWhv
c3RzLWFsbG9jYXRlCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
