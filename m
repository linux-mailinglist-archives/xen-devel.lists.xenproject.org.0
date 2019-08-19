Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5694BFA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 19:46:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlh1-0007dJ-TM; Mon, 19 Aug 2019 17:43:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzlh0-0007cO-Cv
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 17:43:42 +0000
X-Inumbo-ID: e23a9da8-c2a8-11e9-8bf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e23a9da8-c2a8-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 17:43:42 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4435622CED;
 Mon, 19 Aug 2019 17:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566236621;
 bh=kZnHStPsKAt1cHn/u26Aj3ltEYDMRWNPwauPalpQ5kM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sSs5Sy4LefyQIiQydCwmsj8KGl69iWVVhog0UAEWUlFLfj6OMIQ4515IA0Mn2hQ25
 FBSAMyKLlxvlaHUYE2z2KqdtpcLc8uAJPomOkog0AoYAofKUSjSP8UAa2Wju1M8Twh
 r6urL+mofGGlIvslTSjlC9VvK7RLaBM/DeGC88hA=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 10:43:34 -0700
Message-Id: <20190819174338.10466-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v7 4/8] xen/arm: fix indentation in
 early_print_info
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vc0B4aWxpbnguY29tPgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIHwgMTUgKysrKysrKy0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5j
CmluZGV4IDBhMDE5NjNiMGUuLmViM2RjMTNiMDYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9i
b290ZmR0LmMKKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwpAQCAtMzU4LDE1ICszNTgsMTUg
QEAgc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm8odm9pZCkKIAogICAgIGZvciAo
IGkgPSAwOyBpIDwgbWktPm5yX2JhbmtzOyBpKysgKQogICAgICAgICBwcmludGsoIlJBTTogJSJQ
UklwYWRkciIgLSAlIlBSSXBhZGRyIlxuIiwKLSAgICAgICAgICAgICAgICAgICAgIG1pLT5iYW5r
W2ldLnN0YXJ0LAotICAgICAgICAgICAgICAgICAgICAgbWktPmJhbmtbaV0uc3RhcnQgKyBtaS0+
YmFua1tpXS5zaXplIC0gMSk7CisgICAgICAgICAgICAgICAgbWktPmJhbmtbaV0uc3RhcnQsCisg
ICAgICAgICAgICAgICAgbWktPmJhbmtbaV0uc3RhcnQgKyBtaS0+YmFua1tpXS5zaXplIC0gMSk7
CiAgICAgcHJpbnRrKCJcbiIpOwogICAgIGZvciAoIGkgPSAwIDsgaSA8IG1vZHMtPm5yX21vZHM7
IGkrKyApCiAgICAgICAgIHByaW50aygiTU9EVUxFWyVkXTogJSJQUklwYWRkciIgLSAlIlBSSXBh
ZGRyIiAlLTEyc1xuIiwKLSAgICAgICAgICAgICAgICAgICAgIGksCi0gICAgICAgICAgICAgICAg
ICAgICBtb2RzLT5tb2R1bGVbaV0uc3RhcnQsCi0gICAgICAgICAgICAgICAgICAgICBtb2RzLT5t
b2R1bGVbaV0uc3RhcnQgKyBtb2RzLT5tb2R1bGVbaV0uc2l6ZSwKLSAgICAgICAgICAgICAgICAg
ICAgIGJvb3RfbW9kdWxlX2tpbmRfYXNfc3RyaW5nKG1vZHMtPm1vZHVsZVtpXS5raW5kKSk7Cisg
ICAgICAgICAgICAgICAgaSwKKyAgICAgICAgICAgICAgICBtb2RzLT5tb2R1bGVbaV0uc3RhcnQs
CisgICAgICAgICAgICAgICAgbW9kcy0+bW9kdWxlW2ldLnN0YXJ0ICsgbW9kcy0+bW9kdWxlW2ld
LnNpemUsCisgICAgICAgICAgICAgICAgYm9vdF9tb2R1bGVfa2luZF9hc19zdHJpbmcobW9kcy0+
bW9kdWxlW2ldLmtpbmQpKTsKIAogICAgIG5yX3JzdmQgPSBmZHRfbnVtX21lbV9yc3YoZGV2aWNl
X3RyZWVfZmxhdHRlbmVkKTsKICAgICBmb3IgKCBpID0gMDsgaSA8IG5yX3JzdmQ7IGkrKyApCkBA
IC0zNzYsOCArMzc2LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm8odm9p
ZCkKICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICAvKiBmZHRfZ2V0X21lbV9yc3YgcmV0
dXJucyBsZW5ndGggKi8KICAgICAgICAgZSArPSBzOwotICAgICAgICBwcmludGsoIiBSRVNWRFsl
ZF06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCi0gICAgICAgICAgICAgICAgICAgICBp
LCBzLCBlKTsKKyAgICAgICAgcHJpbnRrKCIgUkVTVkRbJWRdOiAlIlBSSXBhZGRyIiAtICUiUFJJ
cGFkZHIiXG4iLCBpLCBzLCBlKTsKICAgICB9CiAgICAgcHJpbnRrKCJcbiIpOwogICAgIGZvciAo
IGkgPSAwIDsgaSA8IGNtZHMtPm5yX21vZHM7IGkrKyApCi0tIAoyLjE3LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
