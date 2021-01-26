Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03226304406
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75321.135585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RaT-0007tL-PS; Tue, 26 Jan 2021 16:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75321.135585; Tue, 26 Jan 2021 16:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RaT-0007sw-LZ; Tue, 26 Jan 2021 16:53:05 +0000
Received: by outflank-mailman (input) for mailman id 75321;
 Tue, 26 Jan 2021 16:53:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4RaS-0007sa-AZ
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:53:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 216ec06f-fa84-47cd-9996-cd9df3283305;
 Tue, 26 Jan 2021 16:53:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 471FEAB92;
 Tue, 26 Jan 2021 16:53:02 +0000 (UTC)
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
X-Inumbo-ID: 216ec06f-fa84-47cd-9996-cd9df3283305
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611679982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DgsJT+7V3pj3BYnapeyutsSDOWz+r4CFOjUA9YJ4QWE=;
	b=KUZ6xn09/iV4A9tLIBLX8NCSNXCnxa8iVkChIWixqxIz2s4HqZ3mdjXWEcW+h/HaMh9qAK
	D3UPFhFp3WubroQz22nMJ/t5YPMYIAmX/76Ida4q0ev/7V1BTfNZGRN93sCQJzKonqkv1a
	ePnpV+ETm7iKpFfmFrEDFCfj7Bv5vEc=
Subject: Re: [PATCH v3 4/6] x86/vpic: don't trigger unmask event until end of
 init
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <20210126134521.25784-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c93415a-07e7-796b-d32a-3735fdc9e66d@suse.com>
Date: Tue, 26 Jan 2021 17:53:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126134521.25784-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 14:45, Roger Pau Monne wrote:
> Wait until the end of the init sequence to trigger the unmask event.
> Note that it will be unconditionally triggered, but that's harmless if
> not unmask actually happened.
> 
> While there change the variable type to bool.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

