Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4A392B18
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 11:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132955.247934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmCcg-0004o0-J2; Thu, 27 May 2021 09:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132955.247934; Thu, 27 May 2021 09:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmCcg-0004m6-Fb; Thu, 27 May 2021 09:48:14 +0000
Received: by outflank-mailman (input) for mailman id 132955;
 Thu, 27 May 2021 09:48:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmCce-0004m0-JZ
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 09:48:12 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f656b06c-e4f9-42b8-b98d-8674a95abfa7;
 Thu, 27 May 2021 09:48:12 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 301211FD2A;
 Thu, 27 May 2021 09:48:11 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 0C2C111A98;
 Thu, 27 May 2021 09:48:11 +0000 (UTC)
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
X-Inumbo-ID: f656b06c-e4f9-42b8-b98d-8674a95abfa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622108891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3RBQZA7XATzEM1PM6aRkX9Xckj5rXUyPGUuRjETGGs=;
	b=a0pXL2zqqGjBmoc8IFxIIk8NPK1rC9MiQzIXjDsRjA+DkTQy5QVSGUKaKUnPv4mhAYdS/Q
	EfgY/CPy+4+c1mediCsfkxgJSn/A9kuCAmBkpS+sMJDBddaWzZRrWZsq6b9E7JXb+GFkdS
	5UK9WX5m8IGJMLAusdHzWIl2QEj2aUI=
Subject: Re: [PATCH 13/13] CHANGELOG: Add Intel HWP entry
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-14-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cae56f66-97e0-7fb1-df82-46daaf6b4538@suse.com>
Date: Thu, 27 May 2021 11:48:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-14-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -5,6 +5,8 @@ Notable changes to Xen will be documented in this file.
>  The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
>  ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +### Added / support upgraded
> + - Intel Hardware P-States (HWP) cpufreq driver

Please add a blank line between the ## and ### lines, to match what's
already there for earlier versions.

Jan

