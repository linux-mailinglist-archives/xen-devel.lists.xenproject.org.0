Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAED43447B9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 15:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100252.190915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLqZ-0000em-Ol; Mon, 22 Mar 2021 14:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100252.190915; Mon, 22 Mar 2021 14:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLqZ-0000eN-LV; Mon, 22 Mar 2021 14:47:59 +0000
Received: by outflank-mailman (input) for mailman id 100252;
 Mon, 22 Mar 2021 14:47:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOLqY-0000eI-8F
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:47:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a287f36-3800-4acd-a284-7f67d9bfecd5;
 Mon, 22 Mar 2021 14:47:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D0A3ACA8;
 Mon, 22 Mar 2021 14:47:56 +0000 (UTC)
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
X-Inumbo-ID: 8a287f36-3800-4acd-a284-7f67d9bfecd5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616424476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nq5tWpmWSEJC7niqzN3YI0POON8gQ/7JH/TmS0++xJA=;
	b=C5QiO6cnOFy9lZc9FKtDTwCogp3q8kuGl92YM9/5k3hcMlPhHRlbq/1gCm2BIIWX3piiXz
	isYknDz5OCci+1JNejF/HttMVkz7dpBaqBoI5xTMcfMHfuOOcMyZsVGgU7JgmDnZDjhYBh
	VmX+rbRFTERgWBfon+QCqnkK1e55ygM=
Subject: Re: [XEN PATCH for-4.15] libxl: Replace deprecated QMP command by
 "query-cpus-fast"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210322141744.522041-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03346623-23bb-78d6-b7f4-fa41ac88e782@suse.com>
Date: Mon, 22 Mar 2021 15:47:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322141744.522041-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.03.2021 15:17, Anthony PERARD wrote:
> We use the deprecated QMP command "query-cpus" which will be remove in
> the upcoming QEMU 6.0 release. There's a replacement which is
> "query-cpus-fast", and have been available since QEMU 2.12 (April
> 2018).

IOW the tool stack then isn't going to work anymore on a system with
a distro provided qemu just around 3 years old?

Jan

