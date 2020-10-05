Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF02833D3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 12:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2960.8492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPNRC-00038C-Sq; Mon, 05 Oct 2020 10:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2960.8492; Mon, 05 Oct 2020 10:09:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPNRC-00037n-PE; Mon, 05 Oct 2020 10:09:46 +0000
Received: by outflank-mailman (input) for mailman id 2960;
 Mon, 05 Oct 2020 10:09:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kPNRB-00037i-SZ
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 10:09:45 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1ddb8a0-49d7-4907-9b45-430806a4c379;
 Mon, 05 Oct 2020 10:09:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kPNRB-00037i-SZ
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 10:09:45 +0000
X-Inumbo-ID: c1ddb8a0-49d7-4907-9b45-430806a4c379
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1ddb8a0-49d7-4907-9b45-430806a4c379;
	Mon, 05 Oct 2020 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601892584;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xn+yCWqOaWmfb7lGyLHM6t1kDXl3/GdpIcNrTkE8tis=;
  b=czBGgHpdFtIXgjjEdc2tuGjYHv8T9Ex4iL9F/2cIma2gQOYpTHHS/eBS
   BBzxNXR2rbqxNjYf6Xa/7CI1SXjDmQlbIzBv7iVFilebdLCBBXccl6KLE
   6U6HZL7iwvtr4bC3ykVjxc5RIKM8HXBtCFcU/Ge3kIMICiMWIdWsbpxSk
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /TQGNUQqoVGTchSB1wd/QHwKVDwPMX9HWKf3eVLaCMyme3kogTA/8zrHAnrufth5NSoD4YBkqk
 AUnaQTP4iI0E6/fkFA2aAkLe6s7mk/u+Rk2WH7PPtY7hhxZj0tr/K+P6Mer8kXGRpBtGUAlvjD
 aOfAYb2NRPK/PBRrp97RacEKn8LG1b639ayFhYltUvqrixzAPAZbAFMs/2aCdr/GaR4B4/f3kP
 Sp275leuXM+2NIADz4UEb+irowM+1wuXw5cCHXbyw+pCYNFqeRnXUSAVpH/LKZD5oHGtwcSZfQ
 +9c=
X-SBRS: None
X-MesageID: 28250931
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="28250931"
Subject: Re: [PATCH v9 5/8] docs / tools: specific migration v4 to include
 DOMAIN_CONTEXT
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-6-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <30a67387-37d4-4408-6747-5fc1b193acc7@citrix.com>
Date: Mon, 5 Oct 2020 11:09:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-6-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 24/09/2020 14:10, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> A new 'domain context' framework was recently introduced to facilitate
> transfer of state for both PV and HVM guests. Hence this patch mandates the
> presence of a new DOMAIN_CONTEXT record in version 4 of the libxc migration
> stream.
> This record will incorprate the content of the domain's 'shared_info' page
> and the TSC informaiton so the SHARED_INFO and TSC_INFO records are deprecated.
> It is intended that, in future, this record will contain state currently
> present in the HVM_CONTEXT record. However, for compatibility with earlier
> migration streams, the version 4 stream format continues to specify an
> HVM_CONTEXT record and XEN_DOMCTL_sethvmcontext will continue to accept all
> content of that record that may be present in a version 3 stream.
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

What's the plan for the remainder of the work?  We don't want to burn
multiple version numbers for each bit of incremental work.

One option might be to specify the full extent of the work, and use an
environment variable to alter the behaviour of the sending side, while
it is still work-in-progress.

~Andrew

