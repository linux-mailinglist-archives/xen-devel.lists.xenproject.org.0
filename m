Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C0724FE93
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 15:10:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kACF7-0000wW-TD; Mon, 24 Aug 2020 13:10:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61pB=CC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kACF6-0000wR-Eg
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 13:10:32 +0000
X-Inumbo-ID: c790d20e-7ca6-4129-aeb1-712b7abf2865
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c790d20e-7ca6-4129-aeb1-712b7abf2865;
 Mon, 24 Aug 2020 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598274632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1pc9GOo8hR3vvRCdyz8oMRCM43cgO2v21Kk84SVmGy0=;
 b=ieYP+hs4IBikax15dMMLe43eHNpPpyQ00oK9luSVED3xoFHsZDHTfYDT
 uY9K7VksYKMMKdOmXYMnHBEDA39bJRGB5LhxFLP+h1hYuAoXLzSRe2dZl
 FKyf/kC3pv7JYBkBNFGY+GXVP0iqOdY5FqXqqksBijafDhP4oYnAfxKmE U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dYyl+6QN4k7KEHi9rYemjB4uqkOy+XssMljcSn07l5RoGDkNp1kj9kHGY15e+qNjnIMqUofB0h
 wy1Ia/s4AOLVqiDaTTsvYyd8cpT+MaZxmnDJ6gryYV8ndNVy0M8PRPS0yYYQYAE+yCuguD5nE0
 I2i2cJw1E08yJVWyTycw9rvgFxBzhQeau6qFZmzd68CdDY7Y44SYCxqYcwowhEcW8fJoDbdaBo
 UARAuMUM7geaYFWUDwtR/lWIMVPhLLS8c1ZfKqOl2IgzH3Ma1ePT7eFD/csyWbDrdH+1GhA21+
 TE8=
X-SBRS: 2.7
X-MesageID: 25159129
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,348,1592884800"; d="scan'208";a="25159129"
Date: Mon, 24 Aug 2020 15:06:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] MAINTAINERS: Add Roger Pau Monne as x86 maintainer
Message-ID: <20200824130654.GC1587@Air-de-Roger>
References: <20200821143201.831774-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200821143201.831774-1-george.dunlap@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On Fri, Aug 21, 2020 at 03:32:01PM +0100, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

