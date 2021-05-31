Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C646439589A
	for <lists+xen-devel@lfdr.de>; Mon, 31 May 2021 12:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134497.250202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnehZ-0005As-CS; Mon, 31 May 2021 09:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134497.250202; Mon, 31 May 2021 09:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnehZ-00058W-9R; Mon, 31 May 2021 09:59:17 +0000
Received: by outflank-mailman (input) for mailman id 134497;
 Mon, 31 May 2021 09:59:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66J8=K2=linux.intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1lnehY-00058Q-DU
 for xen-devel@lists.xenproject.org; Mon, 31 May 2021 09:59:16 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 388a28c4-8426-43a3-b6e5-e69daeb303ee;
 Mon, 31 May 2021 09:59:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 02:59:13 -0700
Received: from aagrawa3-mobl.ger.corp.intel.com ([10.252.54.84])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 02:59:11 -0700
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
X-Inumbo-ID: 388a28c4-8426-43a3-b6e5-e69daeb303ee
IronPort-SDR: bpjS/XG5xE+WJww/JwIWLtusDSw734BZY39I5z6NFdWwxaK9GnX7yHGAYizJOGjjHrHAtphKUw
 rrFxSfN/SBzQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="267213160"
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; 
   d="scan'208";a="267213160"
IronPort-SDR: 1S3jLxaYzrnNm1Xrk7ZRx7yrzCFd3o9GwY2zvfbBUHJsdCSYU2mRvPVE69B1guHHNM7pomJMKP
 VlCgRzNWqagg==
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; 
   d="scan'208";a="478856957"
Message-ID: <c20ea146c3f9bd201f3b7275f185d2da10bac614.camel@linux.intel.com>
Subject: Re: [PATCH] x86/tboot: adjust UUID check
From: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
	Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Mon, 31 May 2021 11:59:02 +0200
In-Reply-To: <422e39c9-0cba-0944-b813-dfe2578ad719@suse.com>
References: <422e39c9-0cba-0944-b813-dfe2578ad719@suse.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-05-19 at 17:49 +0200, Jan Beulich wrote:
> Replace a bogus cast, move the static variable into the only function
> using it, and add __initconst. While there, also remove a pointless NULL
> check.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>


