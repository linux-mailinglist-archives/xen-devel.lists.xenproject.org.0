Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6B1846C2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:23:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCjI4-0004a0-AS; Fri, 13 Mar 2020 12:19:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/r42=46=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jCjI3-0004Zq-Ab
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:19:47 +0000
X-Inumbo-ID: ec7436a2-6524-11ea-b2da-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec7436a2-6524-11ea-b2da-12813bfff9fa;
 Fri, 13 Mar 2020 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UKz+C9YKZZg5ssOmQ+znK0d75+K4aFlU6zx5FOxT2TY=; b=TQtblfbexjpLyQqly1XXpt7ALc
 HjNbGb/KAZzT4xgZ1yJSUEq5aEHUUTPx8MJMHItIcWDobPVlxrtt9FIUY2hncl1JRscKuv8fPM0AF
 L8B/Wm7EyeX4Kl0loX3Bug4ms4+S6oDoFHxPEfh7YeRr5mXkiKklygnIWkR8tFPDf8vU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jCjI0-0003gT-N0; Fri, 13 Mar 2020 12:19:44 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jCjI0-0005yq-Dm; Fri, 13 Mar 2020 12:19:44 +0000
From: paul@xen.org
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 12:19:40 +0000
Message-Id: <20200313121942.1213-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] PV driver compatibility fixes
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
Cc: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpQYXVsIER1cnJhbnQgKDIpOgogIGxp
YnhsOiBjcmVhdGUgZG9tYWluICdlcnJvcicgbm9kZSBpbiB4ZW5zdG9yZQogIGxpYnhsOiBtYWtl
IGNyZWF0aW9uIG9mIHhlbnN0b3JlICdzdXNwZW5kIGV2ZW50IGNoYW5uZWwnIG5vZGUKICAgIG9w
dGlvbmFsLi4uCgogZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAgICB8ICA3ICsrKysrKysK
IGRvY3MvbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MgfCAxMiArKysrKysrKystLS0KIHRvb2xz
L2xpYnhsL2xpYnhsLmggICAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrLQogdG9vbHMvbGli
eGwvbGlieGxfY3JlYXRlLmMgICAgICB8IDE3ICsrKysrKysrKysrKystLS0tCiB0b29scy9saWJ4
bC9saWJ4bF90eXBlcy5pZGwgICAgIHwgIDEgKwogdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAg
ICAgICB8ICAzICsrKwogNiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
