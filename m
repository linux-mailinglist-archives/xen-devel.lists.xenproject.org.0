Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF84332969
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95545.180432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdp2-00057l-HT; Tue, 09 Mar 2021 14:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95545.180432; Tue, 09 Mar 2021 14:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdp2-00057M-E4; Tue, 09 Mar 2021 14:58:56 +0000
Received: by outflank-mailman (input) for mailman id 95545;
 Tue, 09 Mar 2021 14:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJdp0-00057G-JJ
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:58:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5356a53c-62c6-4357-bb0b-35fc53956033;
 Tue, 09 Mar 2021 14:58:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3FAFAE15;
 Tue,  9 Mar 2021 14:58:52 +0000 (UTC)
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
X-Inumbo-ID: 5356a53c-62c6-4357-bb0b-35fc53956033
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615301933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lfhhIzImDqYA/7WwpMPxJdDHEF0E/U9J6dZH7AhaUkU=;
	b=nemnOyPK/lZ3IEnSLUP0QlH9W+9fzz8urXWdBPjbobxyPguBWBreRUNleD/GPv1kZev95y
	GXtt3G5/o7IYI5K5skvMmxgujTx9BFo8o2kmyBwVsiZoaBpQmIHr3znD6415Ni/Wm3JLyf
	WGiBdbtCLINcPz1yB8BZmmzsRBTAbno=
Subject: Re: [PATCH 4.15 3/3] CHANGELOG.md: Glean some information from
 SUPPORT.md
To: Ian Jackson <iwj@xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210309145002.30359-1-iwj@xenproject.org>
 <20210309145002.30359-4-iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bee311cf-6def-2a3f-b999-1f5f9348cb59@suse.com>
Date: Tue, 9 Mar 2021 15:58:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309145002.30359-4-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.03.2021 15:50, Ian Jackson wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,6 +6,16 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
>  ## [Unreleased](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog)
>  
> +## Added / support upgraded
> + - Linux device model stubdomains (Tech Preview)
> + - Xen PV display protocol "backend allocation" mode (Experimental)

This was a downgrade iirc (by XSA-363).

> + - ARM IOREQ servers (device emulation etc.) (Tech Preview)
> + - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
> + - ARM SMMUv3 (Tech Preview)
> +
> +## Removed / support downgraded
> + - qemu-xen-traditional as host process device model, now "No security support, not recommended".  (Use as stub domain device model is still supported - see SUPPORT.md.)

Nit: This line looks overly long.

Jan

