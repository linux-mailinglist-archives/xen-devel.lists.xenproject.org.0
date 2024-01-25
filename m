Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED93083CB87
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671740.1045254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4mT-0000An-0h; Thu, 25 Jan 2024 18:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671740.1045254; Thu, 25 Jan 2024 18:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4mS-00008F-U3; Thu, 25 Jan 2024 18:48:52 +0000
Received: by outflank-mailman (input) for mailman id 671740;
 Thu, 25 Jan 2024 18:48:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rT4mR-000071-Bl
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:48:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4mQ-0002Y9-R1; Thu, 25 Jan 2024 18:48:50 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.5.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4mQ-0008VC-LL; Thu, 25 Jan 2024 18:48:50 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=j5feY0RnNWk7OxAy2CMwwYpZbICSab+r2OzITnqkZ2U=; b=WA4a84ZDUwOEfSUOifzUfkidKB
	cvmiT86yCtt1HLaBgB4rUvejCq8vyzg2p4yA47N0XPIdgpYlVLX9I7WPGduY0qKjTGLFOTpb3El2Y
	F/WU3DtjQwtgCRBwN+7XYBQokYD3ZQFsF3kY5pPKW4senc//XC5H8E91+uDn9nSuNp0w=;
Message-ID: <bcf4ef42-9528-43f3-bee0-a9523c13172a@xen.org>
Date: Thu, 25 Jan 2024 18:48:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/33] tools/xenstored: move systemd handling to
 posix.c
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-24-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-24-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> Move systemd handling to a new late_init() function in posix.c.
> 
> This prepares a future removal of the NO_SOCKETS macro.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

