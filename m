Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4712FEF66
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72226.129889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cCs-0000ru-5X; Thu, 21 Jan 2021 15:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72226.129889; Thu, 21 Jan 2021 15:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cCs-0000rV-2G; Thu, 21 Jan 2021 15:49:10 +0000
Received: by outflank-mailman (input) for mailman id 72226;
 Thu, 21 Jan 2021 15:49:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2cCq-0000rP-F5
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:49:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05cf9d90-e63a-42e6-a4a4-9f22c41e259e;
 Thu, 21 Jan 2021 15:49:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1941ABD6;
 Thu, 21 Jan 2021 15:49:03 +0000 (UTC)
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
X-Inumbo-ID: 05cf9d90-e63a-42e6-a4a4-9f22c41e259e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611244143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D7UNC92aM+czGSitfA8n8JFCCIBY7BDPRclVWcs+0kY=;
	b=JVt1H0gMfh9TSMtexQLm1xoZe306GJbtt0kDJr3PqbsQvmN7ixKek63XStRd8lMNO/Gm5n
	LLfj7ezvK5C8TnPq3+8xiCTwz5JoxfsgO/TyYHVkQN7dB8pdwYAZHLD1mjAsX3sUbUAA8U
	J4Md1TgYYdB0+C55amE5ooFy7MM8PkE=
Subject: Re: [PATCH v4 2/5] xen/hypfs: add support for id-based dynamic
 directories
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210118115516.11001-1-jgross@suse.com>
 <20210118115516.11001-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79e91b08-b15e-2135-de8f-91227b8133e5@suse.com>
Date: Thu, 21 Jan 2021 16:49:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118115516.11001-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 12:55, Juergen Gross wrote:
> Add some helpers to hypfs.c to support dynamic directories with a
> numerical id as name.
> 
> The dynamic directory is based on a template specified by the user
> allowing to use specific access functions and having a predefined
> set of entries in the directory.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

