Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A9360893
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 13:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111061.212290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0Vv-0006pW-5B; Thu, 15 Apr 2021 11:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111061.212290; Thu, 15 Apr 2021 11:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX0Vv-0006pA-2E; Thu, 15 Apr 2021 11:50:27 +0000
Received: by outflank-mailman (input) for mailman id 111061;
 Thu, 15 Apr 2021 11:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX0Vt-0006p5-GP
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:50:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06ce98a9-32db-4bd0-af27-1988426c7628;
 Thu, 15 Apr 2021 11:50:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4492AE20;
 Thu, 15 Apr 2021 11:50:23 +0000 (UTC)
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
X-Inumbo-ID: 06ce98a9-32db-4bd0-af27-1988426c7628
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618487423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Lv3VaxOeFc4OKtSDkCOchgWnDe16hKDL40OiHVUNIg=;
	b=LAY/wsSH4FiUPzQ4Mo1fg3OH+kix7CZ1pdeZ+XavvdS8VgnCFeGlBQ5AtVjZMECucbq/30
	cX5cknpzarTdVzYWv0PuAH5s1Ux6CJobfxJUorvysYuFE/HqGjCFIGXT9Mq/VsQc0xTbd5
	DXuG82hEy88YIbSmQVWf74O9ooFpq74=
Subject: Re: [PATCH v5 1/2] x86/vtx: add LBR_SELECT to the list of LBR MSRs
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Cc: jun.nakajima@intel.com, kevin.tian@intel.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org
References: <1618481062-16094-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5df57ae-1349-7d56-4431-91addcedd91a@suse.com>
Date: Thu, 15 Apr 2021 13:50:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618481062-16094-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 12:04, Igor Druzhinin wrote:
> This MSR exists since Nehalem / Silvermont and is actively used by Linux,
> for instance, to improve sampling efficiency.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

