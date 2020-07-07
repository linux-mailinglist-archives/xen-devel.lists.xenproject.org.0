Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782C216780
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 09:31:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsi3L-00043y-DK; Tue, 07 Jul 2020 07:30:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ow9A=AS=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jsi3K-0003NW-9k
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 07:30:06 +0000
X-Inumbo-ID: aa5d927c-c023-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa5d927c-c023-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Reply-To:Message-Id:Date:Subject:To:From:Sender:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uQa8o5nnzDBqujXVcC9m3ummV9P5idnqgq0tOBtVJTg=; b=tvV1+5gy5/dKtW1Xqh8Eh7ksGo
 6dFT0UIknz0l7iidUo2HYTkiVea8KvDcM1QtY1ssTiRAE3jj/LVQuvCcF4hJSXZ0iLsZECsra+CRv
 Ss3O9jQMPWGlmJ8ik8eNkWynKBxZyCneVW6gK7DZcWe313qTh+QKv0Zm/ns/DIORUMGI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jsi3E-00059h-6k; Tue, 07 Jul 2020 07:30:00 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=CBG-R90WXYV0.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jsi3D-0001hR-RF; Tue, 07 Jul 2020 07:30:00 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org,
 xen-announce@lists.xenproject.org
Subject: Xen 4.14 RC5
Date: Tue,  7 Jul 2020 08:29:58 +0100
Message-Id: <20200707072958.1035-1-paul@xen.org>
X-Mailer: git-send-email 2.17.1
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
Reply-To: xen-devel@lists.xenproject.org, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

Xen 4.14 RC5 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.14.0-rc5

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.14.0-rc5/xen-4.14.0-rc5.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.14.0-rc5/xen-4.14.0-rc5.tar.gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me (paul@xen.org).

As a reminder, there will be a Xen Test Day. Please see the test day schedule at
https://wiki.xenproject.org/wiki/Xen_Project_Test_Days and test instructions at
https://wiki.xenproject.org/wiki/Xen_4.14_RC_test_instructions.

  Paul Durrant


