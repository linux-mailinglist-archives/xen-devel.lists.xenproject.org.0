Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54974BD8E7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275957.471957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5XL-0000AS-VB; Mon, 21 Feb 2022 10:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275957.471957; Mon, 21 Feb 2022 10:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5XL-00008Q-Rs; Mon, 21 Feb 2022 10:03:19 +0000
Received: by outflank-mailman (input) for mailman id 275957;
 Mon, 21 Feb 2022 10:03:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nM5XJ-00008I-Vo
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:03:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bb96691-92fd-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 11:03:16 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7bb96691-92fd-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645437796;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=59Dpd1kU+lI30ewhyNN1BiYvjzWb2962wpSkkcHXHNc=;
  b=OlYYmi9ljC2bBZjicka7xRVndZ3XYEjL2pgqsKu4HZD7h5wLgWF3D0CI
   s+QCTy3QnkMcJp5tZUKiZv3O6h9Lwuo/iX8cXr9Y/WoLnzoOZyoRtTxG+
   c/mG4mDFnoKOfGR1TapeLbki7IAGwcQUCa0na1YpTwHLjEmsSFQM5aFYP
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64073850
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/I0hzK5KT+R2Tu31kBTPHgxRtGjHchMFZxGqfqrLsTDasY5as4F+v
 jEcWmvTb6mJM2Lwct9/Pouzo0wOsZOByINiGwQ/r389Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLjWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS2cT0OMqzCw9hGaANIAn0iPPRv3bD+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RFMWU0PEmYC/FJEgY5JsM/l6SQvSTyfzcCr2yFopEM0XeGmWSd15CyaYGIK7RmX/59jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfIBU7dYz3gfVnDZKTkRLCx3r+pFVl3JSRfpZE
 3Yz9isg9pRpz1a7X4WhXkSRhXG960t0t8VrL8U27wSEy6zx6gmfB3QZQjMpVOHKpPPaVhRxi
 AbXwoqB6ShH9eTMFCnDruv8QSaaZHBNRVLucxPoWufsDzPLhIgoxizCQd94eEJepo2kQGqgq
 9xmQcVXulnysSLp//jhlbwkq2j1znQscuLSzl+KNl9JFisjOOaYi3WAsDA3F8poIoeDVUWmt
 3MZgcWY5+1mJcjTyHHWELlcQeD0vaft3NjgbblHRcRJythQ0yT7IdA4DM9Wfy+FzfroiRe2O
 RSO6Gu9FbdYPWewbL8fXm5CI59C8EQULvy8Dqq8RoMXOvBZLVbblAkzNR/49z28yyAEzPBgU
 ap3hO7xVB72/4w8l2HoLwrcuJd2rh0DKZT7H86jlE3/ieLEDJNXIJ9cWGazgikCxPvsiG3oH
 xx3baNmFz03vDXCXxTq
IronPort-HdrOrdr: A9a23:0L4eAaEoo0ruCPmxpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="64073850"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] Misc coverity fixes and tweaks
Date: Mon, 21 Feb 2022 10:02:51 +0000
Message-ID: <20220221100254.13661-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (3):
  tests/resource: Initialise gnttab before
    xenforeignmemory_map_resource()
  xen: Rename asprintf() to xasprintf()
  CI: Coverity tweaks

 .github/workflows/coverity.yml       | 14 ++++++++------
 tools/tests/resource/test-resource.c |  2 +-
 xen/common/ioreq.c                   | 16 ++++++++++------
 xen/common/vsprintf.c                | 11 ++++++-----
 xen/include/xen/lib.h                |  4 ++--
 5 files changed, 27 insertions(+), 20 deletions(-)

-- 
2.11.0


