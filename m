Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0650325FAE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90162.170613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZA6-0000k0-DJ; Fri, 26 Feb 2021 09:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90162.170613; Fri, 26 Feb 2021 09:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZA6-0000jb-A6; Fri, 26 Feb 2021 09:11:50 +0000
Received: by outflank-mailman (input) for mailman id 90162;
 Fri, 26 Feb 2021 09:11:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFZA5-0000jV-Mb
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:11:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 231b572b-398b-499d-9d77-8b41612e0d34;
 Fri, 26 Feb 2021 09:11:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AA45AC6E;
 Fri, 26 Feb 2021 09:11:48 +0000 (UTC)
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
X-Inumbo-ID: 231b572b-398b-499d-9d77-8b41612e0d34
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614330708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9diGcGB9KTOnhLCoAIJmaDokTyMSGo3fC8+l0NpU2g=;
	b=nPHt8qeUBAIOToW1sXRabAiikIzwVcMPVYiQFeJYbbSl0/qXXqwzqBLxzynn80mSPjJ3gD
	9q7dPrKX6HUIlCrRupIZWIRW/KRv7yI/+iQ7Lb80QUE1hB0zvX29H/dRl2Oez7HhZef4He
	s8umkbIKrcZrST2aCA/B4Ct/6wPRSs4=
Subject: Re: [PATCH for-4.15 1/3] hvmloader: do not include inttypes.h
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210226085908.21254-1-roger.pau@citrix.com>
 <20210226085908.21254-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <677a4654-950a-1419-849e-483dc9f19ea5@suse.com>
Date: Fri, 26 Feb 2021 10:11:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226085908.21254-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.02.2021 09:59, Roger Pau Monne wrote:
> elfstructs.h doesn't require anything from inttypes.h: it's more
> appropriate to include stdint.h instead which contains the type
> declarations required for the ELF types.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Let's go with Andrew's slightly larger change here.

Jan

