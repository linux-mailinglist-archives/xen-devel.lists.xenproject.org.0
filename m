Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5918363377A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 09:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447027.702890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxOya-0005Eg-HR; Tue, 22 Nov 2022 08:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447027.702890; Tue, 22 Nov 2022 08:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxOya-0005C0-DF; Tue, 22 Nov 2022 08:49:56 +0000
Received: by outflank-mailman (input) for mailman id 447027;
 Tue, 22 Nov 2022 08:49:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxOyY-0005Bu-Va
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 08:49:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxOyY-0008NE-RF; Tue, 22 Nov 2022 08:49:54 +0000
Received: from [15.248.2.8] (helo=[10.0.25.11])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxOyY-0004EN-JB; Tue, 22 Nov 2022 08:49:54 +0000
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
	bh=3i8A1aBCbmGOrESZEj5Q7r4ODp5BGjHK4a0BMzIHuvw=; b=vTYIQvdyyiUa5l+2q+sgPivY6o
	9Sr7KmIEal1amC8iZKhbCzKFDSGki+LOyojhkUBFH69tBgVNJ6XDad4TLSE2XaMgQynWdT97VV1SP
	4kPNeFXOREJRbHh9GUiEjQQdTyFLUwX2ZnLtYpAF2TEkBVJ+1grzPpR8YPI3VD3arkBY=;
Message-ID: <22626b14-8047-8fbe-0668-5caeff304640@xen.org>
Date: Tue, 22 Nov 2022 08:49:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] Changelog: Add __ro_after_init and CET
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220309123936.16991-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 09/03/2022 12:39, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>   CHANGELOG.md | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 83d85fad5bbc..577517383ec9 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,6 +6,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>   ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
> +### Added
> + - __ro_after_init support on x86, for marking data as immutable after boot.

This is also supported by Arm (see commit ace403022358 "xen/arm: Support 
properly __ro_after_init on Arm").

Cheers,

> + - Support for Xen using x86 Control Flow Enforcement technology for its own
> +   protection.  Both Shadow Stacks (ROP protection) and Indirect Branch
> +   Tracking (COP/JOP protection).
> +
>   ### Removed / support downgraded
>    - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
>   

-- 
Julien Grall

