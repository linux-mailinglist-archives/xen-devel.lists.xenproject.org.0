Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643527877B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 14:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLn5O-0000T4-F6; Fri, 25 Sep 2020 12:44:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLn5N-0000Sz-Dw
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 12:44:25 +0000
X-Inumbo-ID: 225f4584-f35c-464f-bbb8-e0624e652ee5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 225f4584-f35c-464f-bbb8-e0624e652ee5;
 Fri, 25 Sep 2020 12:44:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601037863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rm95zKBzpY5gP+eopk0hfiTDsGbCaLcobTCs17pQiC4=;
 b=XvFBWYOMdyVzYUT9qqPdq7VdA9cMQH267FfuDnbGNteLtTwFTq9mTpiyJoZ6xY1I39HLHv
 MY2OWk5oZmgSZpAkQfpX7bOYHDeOd8y2IMWPzO3MpHKXkx7NLf+r+z8Vt6p/CwuUF6s0iE
 yNkjwJkV0PSsG8FLDTdIyh7gGFejkJI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C293FAD0F;
 Fri, 25 Sep 2020 12:44:23 +0000 (UTC)
Subject: Re: [PATCH v9 6/8] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ccae172-fda0-6bbe-87c6-2e3a7b26fe81@suse.com>
Date: Fri, 25 Sep 2020 14:44:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-7-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.09.2020 15:10, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and update xen-domctx to dump some information describing the record.
> 
> NOTE: Processing of the content during restore is currently limited to
>       PV domains, and matches processing of the PV-only SHARED_INFO record
>       done by libxc. All content is, however, saved such that restore
>       processing can be modified in future without requiring a new record
>       format.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

