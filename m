Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5E277A0A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 22:15:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLXe0-0004NY-8O; Thu, 24 Sep 2020 20:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/PoZ=DB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kLXdz-0004NT-1R
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 20:15:07 +0000
X-Inumbo-ID: 269f09e2-8803-47ec-8574-8246e8fdcfff
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 269f09e2-8803-47ec-8574-8246e8fdcfff;
 Thu, 24 Sep 2020 20:15:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99AB523899;
 Thu, 24 Sep 2020 20:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600978505;
 bh=GL0o+Hq8zEUlc5xHbtFfonbx0HfetyY+oUGSYTlErS8=;
 h=Date:From:To:cc:Subject:From;
 b=g0L7kQKDrIwBuVvF28i4qXq8Qi8cTT+yAWfJy1kYrRAObEuxLXQ/+TVqpQjynT46L
 EQEORPRN+ORYb3Hf4CxS1htbe2e7PhcKe6xWSOetoss2WDxhH++vCV8LAdEHQitmSE
 hJWJu2P4ZnuUKPg5cPHkOnl1rQGR8pkVwB0d1yyQ=
Date: Thu, 24 Sep 2020 13:15:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: committers@xenproject.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
 George.Dunlap@citrix.com
Subject: default branch name: github to replace "master" with "main"
Message-ID: <alpine.DEB.2.21.2009241311460.1495@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

We have our answer in regards to getting away from "master" as default
branch name. GitHub will default to "main" from Oct 1.

https://github.com/github/renaming
https://www.zdnet.com/article/github-to-replace-master-with-main-starting-next-month/

Cheers,

Stefano

