Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE722C9AA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:02:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz08q-0005G5-Bs; Fri, 24 Jul 2020 16:01:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yL+a=BD=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jz08p-0005FZ-CT
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:01:47 +0000
X-Inumbo-ID: f5fea95e-cdc6-11ea-a425-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5fea95e-cdc6-11ea-a425-12813bfff9fa;
 Fri, 24 Jul 2020 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Reply-To:Message-Id:Date:Subject:To:From:Sender:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ogZM8im0PZvP/3uvGK3JZM+THCjPOOJBt/a9OxuGozA=; b=tyTtdn8czpvLvCjKwcGfOxzmdD
 toJMPxtzfRirgIXANsEagw43ef26JzgPmM0+3y6QWe6+t/0HfqD2zGTSTblwWt/dyNYAjKvwRPibI
 NIHPHNAWd0N9BNw33BztOKU1vtwH6EUqoFL5gRbbSstZOp77gMLDf93Yd9D84INQYR4U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz08i-00046f-58; Fri, 24 Jul 2020 16:01:40 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=CBG-R90WXYV0.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz08h-0003kp-Su; Fri, 24 Jul 2020 16:01:40 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org,
 xen-announce@lists.xenproject.org
Subject: [ANNOUNCEMENT] Xen 4.14 is released
Date: Fri, 24 Jul 2020 17:01:38 +0100
Message-Id: <20200724160138.129-1-paul@xen.org>
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

Dear community members,

I'm pleased to announce that Xen 4.14.0 is released.

Please find the tarball and its signature at:

  https://downloads.xenproject.org/release/xen/4.14.0

Git checkout and build instructions can be found at:

  https://wiki.xenproject.org/wiki/Xen_Project_4.14_Release_Notes#Build_Requirements

Release notes can be found at:

  https://wiki.xenproject.org/wiki/Xen_Project_4.14_Release_Notes

A summary for 4.14 release documents can be found at:

  https://wiki.xenproject.org/wiki/Category:Xen_4.14

Technical blog post for 4.14 can be found at:

  https://xenproject.org/2020/07/24/xen-project-hypervisor-version-4-14-brings-added-security-and-performance

Thanks everyone who contributed to this release. This release would
not have happened without all the awesome contributions from the Xen
community around the globe.

Regards,

Paul Durrant (on behalf of the Xen Project Hypervisor team)


