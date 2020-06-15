Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6604B1F9B14
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:56:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqXH-0004Ws-Fj; Mon, 15 Jun 2020 14:56:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zglu=74=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jkqXG-0004Ud-Ih
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:56:30 +0000
X-Inumbo-ID: 5ebfdee0-af18-11ea-b807-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ebfdee0-af18-11ea-b807-12813bfff9fa;
 Mon, 15 Jun 2020 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Reply-To:Message-Id:Date:Subject:To:From:Sender:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dv/wHwxCaJTEGpCKu6iwv+PQf4ogcSKnHpLXGmCAhjk=; b=5pwfAO7U9E4Txh/zWFehuHw0PR
 Y6gX2AiQHmCmLS31Sk0jl84lD+fu12NxavaorDN0PetREYrcwt9fC2RPQJSpxhcnTrSGmAurHm4++
 o6VPpoGai85UXowRcjxP22ny4kwpvwtgmfHgr9ZD3nXGdey6HQ0cRScId2eA+X5g+204=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jkqX5-0002hE-49; Mon, 15 Jun 2020 14:56:19 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=CBG-R90WXYV0.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jkqX4-00086Z-R4; Mon, 15 Jun 2020 14:56:19 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org,
 xen-announce@lists.xenproject.org
Subject: Xen 4.14 RC2
Date: Mon, 15 Jun 2020 15:56:17 +0100
Message-Id: <20200615145617.6761-1-paul@xen.org>
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

Xen 4.14 RC2 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.14.0-rc2

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.14.0-rc2/xen-4.14.0-rc2.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.14.0-rc2/xen-4.14.0-rc2.tar.gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me (paul@xen.org).

As a reminder, there will be a Xen Test Day. Please see the test day schedule at
https://wiki.xenproject.org/wiki/Xen_Project_Test_Days and test instructions at
https://wiki.xenproject.org/wiki/Xen_4.14_RC_test_instructions.

  Paul Durrant


