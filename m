Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCE1F9B0E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:56:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqWp-0004RB-QO; Mon, 15 Jun 2020 14:56:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqWo-0004R2-Lf
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:56:02 +0000
X-Inumbo-ID: 53d7e2fc-af18-11ea-b807-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53d7e2fc-af18-11ea-b807-12813bfff9fa;
 Mon, 15 Jun 2020 14:56:01 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Xqf7bF+CWtoO8YKHLW7lzHaz7j/K5hPwpmyFfv429rgnyfOGYkUzKIYb3KeVbvjHC5ZOvJNUEi
 dmNZOkZF/6eYRhbGFJTYoiGXpo0eEcCqbh3avqIbNi6RIEkcf7ReKyqo50UgmRKK5zyu2EFrtZ
 Ef5/Ez7WuIhVdDAaiNVZ3+cPUVKXJOwEDunaW+zYBRGnS+acogryN8ZUy3RUAIkfNo6mkYHPrn
 l93wyKDFp408fylCfO4vltxhGGDz0qvepF8aMVCkpISrvSFZu8JRvITkQ23nKWnMwFwbmYkV7o
 M4Q=
X-SBRS: 2.7
X-MesageID: 20069424
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20069424"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35835.908263.151283@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:55:55 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/9] tools/libx[cl]: Plumb bool restore down into
 xc_cpuid_apply_policy()
In-Reply-To: <20200615141532.1927-6-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-6-andrew.cooper3@citrix.com>
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

Andrew Cooper writes ("[PATCH 5/9] tools/libx[cl]: Plumb bool restore down into xc_cpuid_apply_policy()"):
> In order to safely disable some features by default, without breaking
> migration from 4.13 or older, the CPUID logic needs to distinguish the two
> cases.
> 
> Plumb a restore boolean down from the two callers of libxl__cpuid_legacy() all
> the way down into xc_cpuid_apply_policy().
> 
> No functional change.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

