Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22633729A2
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 13:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122131.230344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtRF-0006fA-S8; Tue, 04 May 2021 11:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122131.230344; Tue, 04 May 2021 11:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtRF-0006el-PH; Tue, 04 May 2021 11:42:05 +0000
Received: by outflank-mailman (input) for mailman id 122131;
 Tue, 04 May 2021 11:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldtRE-0006ef-Rq
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:42:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3d4f0c5-8710-481e-8ead-3e43278b0aa9;
 Tue, 04 May 2021 11:42:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FE62B1AB;
 Tue,  4 May 2021 11:42:03 +0000 (UTC)
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
X-Inumbo-ID: a3d4f0c5-8710-481e-8ead-3e43278b0aa9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620128523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ryllCNiCw7GWCpYLyQrlqnMw2lLfBO5O1ojPixYPNT4=;
	b=mixHJGkXH6MOVUps68qhyJZA+GZeuTjSYQkaArdXiNll0b9Zhmny1yn8hsHCK34NHQ8AN3
	VGwh2uEJTAg3bXpPU+62Jzwne5UdCH7o8c01+zFNbqKYFgtacTiSGtKGkNCbmBs5btqOEk
	MGzb5YZkj65asSnlaBgkt8HLHnWP+iU=
Subject: Re: [PATCH v4 09/12] x86/irq: remove unused parameter from
 hvm_isa_irq_assert
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-10-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <31aac991-530e-5c4c-2f2c-c66a6f2e92c4@suse.com>
Date: Tue, 4 May 2021 13:42:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420140723.65321-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 16:07, Roger Pau Monne wrote:
> There are no callers anymore passing a get_vector function pointer to
> hvm_isa_irq_assert, so drop the parameter.
> 
> No functional change expected.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

