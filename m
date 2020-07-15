Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D972211C9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:59:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvjog-0007io-FU; Wed, 15 Jul 2020 15:59:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=COeM=A2=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jvjof-0007iB-EY
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:59:29 +0000
X-Inumbo-ID: 26c6066e-c6b4-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26c6066e-c6b4-11ea-8496-bc764e2007e4;
 Wed, 15 Jul 2020 15:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Reply-To:Message-Id:Date:Subject:To:From:Sender:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f3yeW6sSSoYP7f3EUuNv6OxXPwLcAHQm+R6d13VyfOk=; b=5mfnarL1bmdj/Run/5T+UjZKHo
 /MXYkYfu3cEAfgFzFCIJhC5lfJR7R5QAyi8ZQTvSzBXLu3cfzeTwC6uSA8NoK++K17B1siA4suQiw
 72M8kX81JnLJBGMdBH20cMufksgLif2CJ7NQXooM2+E8wRM6ge/fYn4gFlkRjRT6C8rU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jvjoZ-00013U-Ce; Wed, 15 Jul 2020 15:59:23 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=CBG-R90WXYV0.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jvjoZ-0001SJ-1N; Wed, 15 Jul 2020 15:59:23 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org,
 xen-announce@lists.xenproject.org
Subject: Xen 4.14 RC6
Date: Wed, 15 Jul 2020 16:59:21 +0100
Message-Id: <20200715155921.5543-1-paul@xen.org>
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

Xen 4.14 RC6 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.14.0-rc6

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.14.0-rc6/xen-4.14.0-rc6.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.14.0-rc6/xen-4.14.0-rc6.tar.gz.sig

This RC is built from the new stable-4.14 branch, with CONFIG_DEBUG=n. Please
test as this intended to be the final RC before release. As always, please send
bug reports and test reports to xen-devel@lists.xenproject.org. When sending
bug reports, please CC relevant maintainers and me (paul@xen.org).

  Paul Durrant


