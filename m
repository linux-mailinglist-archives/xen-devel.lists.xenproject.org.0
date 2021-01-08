Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC472EF50B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63662.113004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtw0-00070O-KE; Fri, 08 Jan 2021 15:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63662.113004; Fri, 08 Jan 2021 15:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtw0-0006zx-H8; Fri, 08 Jan 2021 15:44:16 +0000
Received: by outflank-mailman (input) for mailman id 63662;
 Fri, 08 Jan 2021 15:44:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxtvz-0006zq-EF
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:44:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53b008cc-8cac-4067-aca7-c27f253d7c7a;
 Fri, 08 Jan 2021 15:44:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5C98AD57;
 Fri,  8 Jan 2021 15:44:13 +0000 (UTC)
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
X-Inumbo-ID: 53b008cc-8cac-4067-aca7-c27f253d7c7a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610120653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8g+tj2JtPNoQ7CZyT+IytW0ZOERM6Tlml//M6BbTNvE=;
	b=PRT8esFdhtDIlovpEpYvoFK9uiYQWyHdp8I4FjPsi1+MGrrefLZtYYErDi2HiRE7+YmxHS
	fjNEPY6YBtilqXO8/5qCoefmglQOad3QZQC4nsms1IHZ3iwRY/Fe1/ry3DNzC6zwJ7e+I4
	0gw2aSZnqaA/d8UURFIotT/uRhxhblo=
Subject: Re: [PATCH RFC 0/3] xen: add hypfs per-domain abi-features
To: Juergen Gross <jgross@suse.com>
Cc: paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209161618.309-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2423a745-b5f3-a1e6-bd26-81193c289b23@suse.com>
Date: Fri, 8 Jan 2021 16:44:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201209161618.309-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 17:16, Juergen Gross wrote:
> This small series is meant as an example how to add further dynamical
> directories to hypfs. It can be used to replace Paul's current approach
> to specify ABI-features via domain create flags and replace those by
> hypfs nodes.

Actually, before I look at further of the patches here: I seem
to vaguely recall agreement was reached to stick to Paul's
approach for the time being? Or am I misremembering?

Jan

