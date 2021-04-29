Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A436E7CD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119815.226518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2pt-0003K6-1s; Thu, 29 Apr 2021 09:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119815.226518; Thu, 29 Apr 2021 09:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2ps-0003Jh-Ul; Thu, 29 Apr 2021 09:19:52 +0000
Received: by outflank-mailman (input) for mailman id 119815;
 Thu, 29 Apr 2021 09:19:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc2pr-0003Jb-H3
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:19:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 900f8a68-65dd-4694-b1e9-e663f11312a7;
 Thu, 29 Apr 2021 09:19:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 231FFAFDC;
 Thu, 29 Apr 2021 09:19:50 +0000 (UTC)
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
X-Inumbo-ID: 900f8a68-65dd-4694-b1e9-e663f11312a7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619687990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G31M1ct4Lsq5HdFATXqrZXz44D7Ks0DUB+Hxh1cG+zI=;
	b=hfQUvud/Ja9sTtS+EKaiuC0D4nV6k0RqvRtH/T9urT/A5Hs1RnAP2eePo4TyPoBt5PYsgl
	0U8tGXfUF43NAhW47ykfcgz118ZYqvY0DacdQEKzeOgP+ogxR0yvqOFyABzCNO9bYgMnzx
	i8NAVRpHXkytwDIgdjj2zHm5hj6DZmo=
Subject: Ping: [PATCH v4 0/3] zstd decompression fallout / consolidation
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
Message-ID: <dbaf9f53-9e11-ef5d-e609-f327895f4015@suse.com>
Date: Thu, 29 Apr 2021 11:19:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 12:20, Jan Beulich wrote:
> 1: unzstd: replace INIT{,DATA} and STATIC
> 2: xen/decompress: drop STATIC and INIT
> 3: unzstd: make helper symbols static

Anyone?

Thanks, Jan

