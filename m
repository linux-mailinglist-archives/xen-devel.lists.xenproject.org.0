Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FD81F9422
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 12:00:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkltf-0001e3-SU; Mon, 15 Jun 2020 09:59:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jklte-0001dw-28
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 09:59:18 +0000
X-Inumbo-ID: df91b702-aeee-11ea-b7ed-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df91b702-aeee-11ea-b7ed-12813bfff9fa;
 Mon, 15 Jun 2020 09:59:17 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vcNWnx5yGh4hTkgXvYf/KIE4FiLddVEm/qddxeyhj1FbD+GPzmGUwI/oNcY6T7jFzNERtQNFC5
 o8GZ5pHnG2j3qMgnkfJpVl1CcC6bDAA3OMgJhdEKY0xpvzvvkZ+2zKz1OgPjQTx7nNXavjSYlt
 /4t6Z8Dnp4hcI2vnpYgKXWTmWrVUkPShcjquUzjOu9Qe3wVu65WfoWqeA44FbtAyObPY7zJf93
 x1mdBCYDA0mkw8cwQeRZRQ0PwVQWp2SyHspu4vdHFMwGpoGobUiWDEoR2z8hoRVWhHkBjlkhQC
 1YM=
X-SBRS: 2.7
X-MesageID: 20040644
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20040644"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.18033.208180.895089@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 10:59:13 +0100
To: Paul Durrant <xadimgnik@gmail.com>
Subject: Re: [xen-unstable test] 151073: regressions - FAIL
In-Reply-To: <osstest-151073-mainreport@xen.org>
References: <osstest-151073-mainreport@xen.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

osstest service owner writes ("[xen-unstable test] 151073: regressions - FAIL"):
> flight 151073 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/151073/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 151051

FTR, following discussion with Paul on irc, I force pushed this.

> version targeted for testing:
>  xen                  b91825f628c9a62cf2a3a0d972ea81484a8b7fce

Ian.

10:35 <Diziet> The only rewgression is a failure to boot freebsd on a
uefi box. Which is expected.  Not sure why the baseline didn't fail.

10:36 <Diziet> Probably it ran on a differnet host for some reason
(presumably all the failing uefi hosts were too busy...)

