Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B236C900
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 17:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118671.224886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQ6v-0005bZ-IX; Tue, 27 Apr 2021 15:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118671.224886; Tue, 27 Apr 2021 15:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQ6v-0005bA-Fb; Tue, 27 Apr 2021 15:58:53 +0000
Received: by outflank-mailman (input) for mailman id 118671;
 Tue, 27 Apr 2021 15:58:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbQ6u-0005b5-T3
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 15:58:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a881996d-2d9f-49a6-8040-37eaef588b29;
 Tue, 27 Apr 2021 15:58:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30318B1FA;
 Tue, 27 Apr 2021 15:58:51 +0000 (UTC)
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
X-Inumbo-ID: a881996d-2d9f-49a6-8040-37eaef588b29
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619539131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fq0bu51wYO3X1ZxQDlRmzgRTn2eHOZIMOHsbxgkpLEo=;
	b=dAKg23OnU3UOFfHgcefxDtzmpPp1LbvoCpHw5D/f4i3gEfLWcPGgbgMQhUDiSFudvtpbJ+
	vZj+US3NRrQkpQP5mr6qpftUhUd2Mf1AgnCKV1f+42zP4ZgTHvGSEek48LpTUJ3a3Aw9F1
	SflGpVl6nDzRumOraoSEeJuWiNWG7N0=
Subject: Re: [PATCH v3 1/3] xen/iommu: Move iommu_update_ire_from_msi(..) to
 xen/iommu.h
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1619453100.git.rahul.singh@arm.com>
 <30f0c8057969f9777f11352b9b7ca1e4a7a730e8.1619453100.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf6efea8-5f2a-6d05-2eb9-59ad02ae1e58@suse.com>
Date: Tue, 27 Apr 2021 17:58:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <30f0c8057969f9777f11352b9b7ca1e4a7a730e8.1619453100.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 18:21, Rahul Singh wrote:
> Move iommu_update_ire_from_msi(..) from passthrough/pci.c to
> xen/iommu.h and wrap it under CONFIG_X86 as it is referenced in x86
> code only to avoid compilation error for other architecture when
> HAS_PCI is enabled.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


