Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B1D1C70A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 12:32:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQUhk-0004aL-Ro; Tue, 14 May 2019 10:30:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQUhj-0004aG-4b
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:30:39 +0000
X-Inumbo-ID: 4ddb4ba6-7633-11e9-a1d9-03ab010e90f5
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ddb4ba6-7633-11e9-a1d9-03ab010e90f5;
 Tue, 14 May 2019 10:30:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="85431507"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 14 May 2019 11:30:30 +0100
Message-ID: <20190514103030.8393-3-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514103030.8393-1-wei.liu2@citrix.com>
References: <20190514103030.8393-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] Drop blktap2
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCmdpdCBybSBibGt0YXAyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
