Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F265348AD6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 08:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101281.193603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKrn-0006Bj-Rb; Thu, 25 Mar 2021 07:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101281.193603; Thu, 25 Mar 2021 07:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPKrn-0006BK-OD; Thu, 25 Mar 2021 07:57:19 +0000
Received: by outflank-mailman (input) for mailman id 101281;
 Thu, 25 Mar 2021 07:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zQ/e=IX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPKrm-0006BF-7m
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 07:57:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f82e1fd-1770-468c-9d59-019af01bddee;
 Thu, 25 Mar 2021 07:57:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E0ACAA55;
 Thu, 25 Mar 2021 07:57:16 +0000 (UTC)
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
X-Inumbo-ID: 8f82e1fd-1770-468c-9d59-019af01bddee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616659036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qqvuab5upILA1d/7jqjZKuvgtOPJL2VBrpR9GKTWEIY=;
	b=V/bmPFZjpoAgzD5m+0B3S+7b11pNpjfTiUFfFKJUfpPAKyZ6Et5sY/FtVR6a+vTq8Py7Yz
	mIsSSMtUj31KJVj33hx0kPJ3YMfBVLv8sqgHTScfQQY0wgWKqnobe1lh1PRgs+C9rH08S8
	cwKjTLu6dK9WE3fXlTRzz+LR4feBIzM=
Subject: Re: [PATCH 5/6] CHANGELOG.md: Add entries for emulation
To: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-5-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33f78891-c894-b41a-a1a3-82aac1f57b8d@suse.com>
Date: Thu, 25 Mar 2021 08:57:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324164407.302062-5-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.03.2021 17:44, George Dunlap wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Named PCI devices for xl/libxl
>   - Support for zstd-compressed dom0 kernels
>   - Library improvements from NetBSD ports upstreamed
> + - x86_emulate: Support AVX-VNNI instructions
> + - x86_emulate: Expanded testing for several instruction classes

TBH both seem too minor to me to be mentioned here. If I was to pick
just one, I'd keep the former and drop the latter.

Jan

