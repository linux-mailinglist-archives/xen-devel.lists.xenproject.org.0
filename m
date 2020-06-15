Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8F1F9B0C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:55:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqWF-0004LH-Gw; Mon, 15 Jun 2020 14:55:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqWE-0004Kw-5Q
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:55:26 +0000
X-Inumbo-ID: 3e9ead6c-af18-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e9ead6c-af18-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 14:55:25 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HFy1OS1RADCTFU66zfY/qVHvrHsV0QNMK57k/2l5CNXEuONzqAyJlk4i0Xk0GqyiPgIMRK2y/c
 YCQZGstmayEvCPRxycynCyHx23PCQAf1GCe6+NfNPxTHR+FqMyND7czeAOdHecqGFyBCphi860
 a0ochkHuMoxwZ0MWbDT3cTo6NT8LAnrY4QUX/zLay/oR9j7PXvkC92XrDyYu1ih+yWBUfnp1Wq
 ZyfvVHII5R8ATv8if/S8oiaD37R02tLrz8fL6XiAD0jeC0bz+nedGXpxH33xYY2ug7D3y/qo2I
 mSg=
X-SBRS: 2.7
X-MesageID: 20415087
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20415087"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35800.851518.548162@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:55:20 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] tools/libx[cl]: Merge xc_cpuid_set() into
 xc_cpuid_apply_policy()
In-Reply-To: <20200615141532.1927-5-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-5-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH 4/9] tools/libx[cl]: Merge xc_cpuid_set() into xc_cpuid_apply_policy()"):
> This reduces the number of CPUID handling entry-points to just one.
> 
> No functional change.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

