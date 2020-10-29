Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5283F29F37A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:41:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14542.35919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBvF-0008EN-T1; Thu, 29 Oct 2020 17:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14542.35919; Thu, 29 Oct 2020 17:41:13 +0000
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
	id 1kYBvF-0008Dr-PQ; Thu, 29 Oct 2020 17:41:13 +0000
Received: by outflank-mailman (input) for mailman id 14542;
 Thu, 29 Oct 2020 17:41:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kYBvF-0008CJ-37
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:41:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aa08b42-43ad-4a44-8b0a-41b9318e4dc6;
 Thu, 29 Oct 2020 17:41:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kYBvF-0008CJ-37
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:41:13 +0000
X-Inumbo-ID: 8aa08b42-43ad-4a44-8b0a-41b9318e4dc6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8aa08b42-43ad-4a44-8b0a-41b9318e4dc6;
	Thu, 29 Oct 2020 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603993270;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XELrZl0g2ovrQi4NpNOv5cCb24Wat3i5Csq+gJWLytE=;
  b=eBNnR/rxmgR4VgBKK1PO7P9ORvhbzko0t11rfKR2VNHhwTCCW2aSFkS/
   6U7gGLYVN0l0hc2dxYFuwBYWiLqN0wbXjl+PGWoZVvwf/oNevUju+0Cex
   mOC2ARB1XsJdgbFhXLmL1Grn5ozP0lc8qWimbhMlzCGNDqXJWKI0qZ3Mr
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TCsNK4BtfXYqtUMksYkQy4XF6iMzm/s384ySHhqZjFsbHl7HLF926UjH3GQ1qkRtnkEuT09pVn
 eBqIpXCc8h2FlYVTlZLKW3Wrcljk4+GmiFlNlcAiT+xclF+2hil/D/thliFCrNPUfPnlEFg8xj
 9ZoOIUuzVXM9PXr6t7wA86EmXJCqLT6bZe/Chz0SDjKgHT/FIIvaKFdAAHwyDBVgAD2cBOqrqN
 56AeT6FZlwU3WgQBFCtTFeIETK21kZpZECLvk23NX+TI75wLChaMu5TmRh6njotGZmjCHNw1y8
 YIU=
X-SBRS: None
X-MesageID: 30093419
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,430,1596513600"; 
   d="scan'208";a="30093419"
Subject: Re: [PATCH 2/2] x86: PV shim doesn't need GRANT_TABLE
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <94c18ebf-632d-8a2c-220c-c31d6e37eb55@suse.com>
 <17fb04fb-99b6-7e20-0583-421ebb666ddc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <28c10a7b-a55a-faea-e4bc-e9e007c1140e@citrix.com>
Date: Thu, 29 Oct 2020 17:40:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17fb04fb-99b6-7e20-0583-421ebb666ddc@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 29/10/2020 17:10, Jan Beulich wrote:
> The only reference into the code controlled by this option is from the
> hypercall table, and that hypercall table entry gets overwritten.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

