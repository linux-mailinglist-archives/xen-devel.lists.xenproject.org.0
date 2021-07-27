Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32ED3D71A2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 10:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161092.295788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8IrP-00012v-V2; Tue, 27 Jul 2021 08:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161092.295788; Tue, 27 Jul 2021 08:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8IrP-00010j-Rl; Tue, 27 Jul 2021 08:54:47 +0000
Received: by outflank-mailman (input) for mailman id 161092;
 Tue, 27 Jul 2021 08:54:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m8IrP-00010d-0w
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 08:54:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8IrK-00021Q-1Y; Tue, 27 Jul 2021 08:54:42 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8IrJ-0005ey-Q9; Tue, 27 Jul 2021 08:54:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=eywEcllzg8j9Hfe3EcYDV2wNQxA1ZsKolNcV6bImFpg=; b=iYF3sQ1jRYZo8BOsHPNtA5C28T
	GEPh69ukTGTWwhGyg4Xz5/jSolmc2XSXK7CFIvGQ30P3JT/9eGP68EoIhVLBrGJaS95mYBHOJsHGp
	mqqm1qcHsLUbqYeXR70fhwEEp6L2oif3RR07NCRdMGYQ85s2iMhv+85pwX3eAiO3kefw=;
Subject: Re: [XEN PATCH v2] tools/xl: Add stubdomain_cmdline option to xl.cfg
To: Scott Davis <scottwd@gmail.com>, xen-devel@lists.xenproject.org
Cc: Scott Davis <scott.davis@starlab.io>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>
From: Julien Grall <julien@xen.org>
Message-ID: <198774b3-f688-376a-7fed-256662f6adba@xen.org>
Date: Tue, 27 Jul 2021 09:54:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Scott,

On 22/07/2021 17:54, Scott Davis wrote:
> This adds an option to the xl domain configuration file syntax for specifying
> a kernel command line for device-model stubdomains. It is intended for use with
> Linux-based stubdomains.
> 
> Signed-off-by: Scott Davis <scott.davis@starlab.io>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

