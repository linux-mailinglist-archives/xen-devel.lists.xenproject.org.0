Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A4345DDB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 13:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100660.191909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOftJ-0006dK-31; Tue, 23 Mar 2021 12:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100660.191909; Tue, 23 Mar 2021 12:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOftI-0006cz-Vr; Tue, 23 Mar 2021 12:12:08 +0000
Received: by outflank-mailman (input) for mailman id 100660;
 Tue, 23 Mar 2021 12:12:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOftH-0006cu-PS
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 12:12:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52c282a9-2b73-4014-a649-eb41bc3f151f;
 Tue, 23 Mar 2021 12:12:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E50D8AD38;
 Tue, 23 Mar 2021 12:12:05 +0000 (UTC)
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
X-Inumbo-ID: 52c282a9-2b73-4014-a649-eb41bc3f151f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616501526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6sAk9L+unwYPCmq2tpocdoCNLF3iGdlVElDJ2Qr52Ws=;
	b=aL7a4Hg2WsJ01hrwGBZC3jLqngduKrN7NcArTVYj/sIgq0Ve5H/9OIlUROkAMPKPMIHVNC
	4aul/VvvJGYdxGamV4O2BwQ0+2uqNReHZSCtuuqRBo9Wsq96PW04rSbUD3LPYZSpG10mM+
	fU7mpCqn78po1wfTfOf9rWoF/EUe8Co=
Subject: Re: [PATCH] hvm/mtrr: remove unnecessary is_hvm_domain check
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210323112900.40723-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2654c931-9947-95b4-f01d-4af6b015467e@suse.com>
Date: Tue, 23 Mar 2021 13:12:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323112900.40723-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.03.2021 12:29, Roger Pau Monne wrote:
> epte_get_entry_emt will only be called for HVM domains, so the
> is_hvm_domain check is unnecessary. It's a remnant of PVHv1.
> 
> Shouldn't result in any functional change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

