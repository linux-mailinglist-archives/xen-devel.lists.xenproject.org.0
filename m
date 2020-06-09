Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F501F3B50
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 15:02:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jidte-0006Jk-KK; Tue, 09 Jun 2020 13:02:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ij5=7W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jidte-0006JM-80
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 13:02:30 +0000
X-Inumbo-ID: 7850d934-aa51-11ea-b31d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7850d934-aa51-11ea-b31d-12813bfff9fa;
 Tue, 09 Jun 2020 13:02:28 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QMnnjO82Sgz+YGGsqW1/Z9FNwjoMnnb9o8mOC1EawNIvUt1mHmJkfSqrO05GwrBz6P+Ly9rlZj
 eNgm7iKtczApjreXoDbClsqccK0MKfRm36ilkRCxlmHzlEcsG6QJ//0R4699rA2gSBcD9/7sNh
 ppjekLES7VLsabBNvsyHVOipUPA+8sqlaqBD2h9BmjG5Onqu/7bgB7W0a0MAGND09vWhAcVr3g
 3BKP9+5D/6ZK+4VzXe+GZO0K8jn9AcgD+gfydN4nAuJobaybMtY9XC9eA9aKPqL2NVZOEdgdcY
 isw=
X-SBRS: 2.7
X-MesageID: 19919981
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,492,1583211600"; d="scan'208";a="19919981"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24287.34907.515781.156617@mariner.uk.xensource.com>
Date: Tue, 9 Jun 2020 14:02:19 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [xen-unstable test] 150928: regressions - FAIL
In-Reply-To: <osstest-150928-mainreport@xen.org>
References: <osstest-150928-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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

osstest service owner writes ("[xen-unstable test] 150928: regressions - FAIL"):
> flight 150928 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/150928/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64-prev              6 xen-build                fail REGR. vs. 150918

This seems to have been a transient network failure between the test
colo and xenbits.

Ian.

