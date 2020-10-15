Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C428EE59
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 10:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7140.18719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSySv-00012e-2E; Thu, 15 Oct 2020 08:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7140.18719; Thu, 15 Oct 2020 08:18:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSySu-00012F-VP; Thu, 15 Oct 2020 08:18:24 +0000
Received: by outflank-mailman (input) for mailman id 7140;
 Thu, 15 Oct 2020 08:18:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSySt-00012A-FF
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:18:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4467d654-5ee6-44f5-ba0c-fde5a041c826;
 Thu, 15 Oct 2020 08:18:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A398FAD43;
 Thu, 15 Oct 2020 08:18:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MKI8=DW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSySt-00012A-FF
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 08:18:23 +0000
X-Inumbo-ID: 4467d654-5ee6-44f5-ba0c-fde5a041c826
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4467d654-5ee6-44f5-ba0c-fde5a041c826;
	Thu, 15 Oct 2020 08:18:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602749900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pU93GxhBmH+PsnE7XhOnXvQoX0U937gY/Q4LvdZJRHQ=;
	b=rXYlq+MiDnQIgjWTJL4X2DVYa9dnN4ynOITrTWzCGQYMTiA90yszuf9iyqYDG3IZB6AoN0
	cs1eJl5ZvwTNRyQcpj5TBbI0hZTtNAOj7N/XVGuJHdPFqh+oPkscZxOvIE7Jl39GuD6/kD
	Nrj12orInxQMc4S6//QY40bymSYqQL4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A398FAD43;
	Thu, 15 Oct 2020 08:18:20 +0000 (UTC)
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
To: Dylanger Daly <dylangerdaly@protonmail.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72589937-a918-96c8-4589-6d30efaead9a@suse.com>
Date: Thu, 15 Oct 2020 10:18:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 02:38, Dylanger Daly wrote:
> I'm currently using Xen 4.14 (Qubes 4.1 OS) on a Ryzen 7 4750U PRO, by default I'll experience softlocks where the mouse for example will jolt from time to time, in this state it's not usable.

From what you say below I imply this is in Dom0?

> Adding `dom0_max_vcpus=1 dom0_vcpus_pin` to Xen's CMDLINE results in no more jolting however performance isn't what it should be on an 8 core CPU, softlocks are still a problem within domU's, any sort of UI animation for example.
> 
> Reverting [this commit (8e2aa76dc1670e82eaa15683353853bc66bf54fc)](https://github.com/xen-project/xen/commit/8e2aa76dc1670e82eaa15683353853bc66bf54fc) results in even worse performance with or without the above changes to CMDLINE, and it's not usable at all.

You saying this surely has a reason, but making the connection would
help. I don't consider it surprising that a revert of an improvement
makes things worse. You having bothered to find a certain code change
also makes me suspect you've experimented with other scheduler
related settings - if so, please share all data you've got. (FAOD -
with the information provided I have no idea what to suggest, sorry.)

Jan

