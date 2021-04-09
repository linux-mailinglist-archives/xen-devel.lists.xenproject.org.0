Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE1359727
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 10:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107676.205795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUmAP-0006dG-Jb; Fri, 09 Apr 2021 08:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107676.205795; Fri, 09 Apr 2021 08:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUmAP-0006cv-GY; Fri, 09 Apr 2021 08:07:01 +0000
Received: by outflank-mailman (input) for mailman id 107676;
 Fri, 09 Apr 2021 08:07:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rPLO=JG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUmAO-0006cq-HO
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 08:07:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c285d491-45c1-43e5-838f-a907ae4bf884;
 Fri, 09 Apr 2021 08:06:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0963CAEFE;
 Fri,  9 Apr 2021 08:06:59 +0000 (UTC)
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
X-Inumbo-ID: c285d491-45c1-43e5-838f-a907ae4bf884
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617955619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwLkDWfkK+78jVJil/qNAZxaxPts92drm/pMR65G5EM=;
	b=uyplb3X+6kvBXqDonhvv4J8eG7PwR5z5wSokch9XaPET1BwUI/lJb6L1v9qslwlr4X9dH5
	8SSvbe3wHvepcC61/0P7rhg/RJ2rwWuQZETcWMczEMZ4A8dGoOc11W0BG8NdIspzKE8dW+
	qqpKxw3O3lzptKuU+PFSIis3d0TpCVU=
Subject: Ping: [PATCH 0/2] x86: is_pv*domain() adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
Message-ID: <efe31dc7-180d-9b7f-9a80-26a9f090803d@suse.com>
Date: Fri, 9 Apr 2021 10:06:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.11.2020 17:51, Jan Beulich wrote:
> 1: correct is_pv_domain() when !CONFIG_PV
> 2: use is_pv_64bit_domain() to avoid double evaluate_nospec()

Ping?

Thanks, Jan

