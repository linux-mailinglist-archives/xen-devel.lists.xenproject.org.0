Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4248C7EB825
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 22:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633264.987913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30ax-0000N6-QU; Tue, 14 Nov 2023 21:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633264.987913; Tue, 14 Nov 2023 21:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30ax-0000Kn-Nq; Tue, 14 Nov 2023 21:05:15 +0000
Received: by outflank-mailman (input) for mailman id 633264;
 Tue, 14 Nov 2023 21:05:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r30aw-0000Kh-Hh
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 21:05:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30av-0007fB-TJ; Tue, 14 Nov 2023 21:05:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30av-0004s6-Nm; Tue, 14 Nov 2023 21:05:13 +0000
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
	bh=uSvPvpqcoYsuuaB/SvdvD6llkCzl2hDrjdO6Gl2Wgkc=; b=gS+/c3Lc3WjwmImd1RnexMGFmn
	0XtixYqg0eeGxyjljDKJTlO10bcwzWI/jWKhLBs24ItKdcNLuriScwlNE9qx7MLc13KjiyIQeuJ4l
	wjOinSjHJ1CSuvw4ekS/jlfM85pR6ApY+d5ATsUzmFjor6RN16U20StUhWVu3XcCSLXs=;
Message-ID: <46732b8c-49bf-456e-9a4d-e7b0b0012936@xen.org>
Date: Tue, 14 Nov 2023 21:05:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] tools/xenstored: remove the "-P" command line option
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231113124309.10862-1-jgross@suse.com>
 <20231113124309.10862-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231113124309.10862-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/11/2023 12:43, Juergen Gross wrote:
> The "-P" command line option just results in printing the PID of the
> xenstored daemon to stdout before stdout is being closed. The same
> information can be retrieved from the PID file via the "-F" option.

I looked at the git history to figure out whether -P was added before 
-F. But it looks like they were added together. It is not entirely clear 
to me the author thought the both options were necessary.

Anyway, I agree this is a bit redundant.

> 
> Remove the redundant "-P" option.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

