Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3143958C0
	for <lists+xen-devel@lfdr.de>; Mon, 31 May 2021 12:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134506.250213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lneqg-0006hy-Ar; Mon, 31 May 2021 10:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134506.250213; Mon, 31 May 2021 10:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lneqg-0006fh-7D; Mon, 31 May 2021 10:08:42 +0000
Received: by outflank-mailman (input) for mailman id 134506;
 Mon, 31 May 2021 10:08:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66J8=K2=linux.intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1lneqe-0006fb-Vz
 for xen-devel@lists.xenproject.org; Mon, 31 May 2021 10:08:41 +0000
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52bfeb64-71de-4edd-a6a9-559eecf96ec9;
 Mon, 31 May 2021 10:08:39 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 03:08:38 -0700
Received: from aagrawa3-mobl.ger.corp.intel.com ([10.252.54.84])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 03:08:36 -0700
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
X-Inumbo-ID: 52bfeb64-71de-4edd-a6a9-559eecf96ec9
IronPort-SDR: cd4EUfr5fNdshyEuriAtjJXv/qJu0xQZBF7441QtMunJYoA+aawAJOQ2wxtcyij9uNVWvFhsgd
 m9hrKXy525+A==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="264524367"
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; 
   d="scan'208";a="264524367"
IronPort-SDR: iQKKQqF+4cJqCigL/1uv8fc9RZGMx2Ws9bsQ6Ks7DRaDMih2zxMmBLdLuzXteoPyG9eYqt3516
 SavWstDbdyhQ==
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; 
   d="scan'208";a="635118865"
Message-ID: <bfd679ad4bfcdad6990887e6e85b4767c013ef4d.camel@linux.intel.com>
Subject: Re: [PATCH] x86/tboot: include all valid frame table entries in S3
 integrity check
From: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
	Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Mon, 31 May 2021 12:08:33 +0200
In-Reply-To: <e878fd86-2d82-ce3c-1dc4-d3a07025f1d4@suse.com>
References: <e878fd86-2d82-ce3c-1dc4-d3a07025f1d4@suse.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-05-19 at 17:48 +0200, Jan Beulich wrote:
> The difference of two pdx_to_page() return values is a number of pages,
> not the number of bytes covered by the corresponding frame table entries.
> 
> Fixes: 3cb68d2b59ab ("tboot: fix S3 issue for Intel Trusted Execution Technology.")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>



