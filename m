Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGnCLgK0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B65481A7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208728.1520877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9nr-0007sp-Ja; Tue, 20 Jan 2026 11:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208728.1520877; Tue, 20 Jan 2026 11:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi9nr-0007ps-H0; Tue, 20 Jan 2026 11:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1208728;
 Tue, 20 Jan 2026 11:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfLJ=7Z=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vi9np-0007pm-PX
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 11:21:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302d7697-f5f2-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 12:21:39 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A74024EE3C04;
 Tue, 20 Jan 2026 12:21:37 +0100 (CET)
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
X-Inumbo-ID: 302d7697-f5f2-11f0-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1768908098;
	b=oqzgLYU0qhAebk7XvtzYWH2znU8wWloyLNLFHj32kik98Ojq2ITLXz9MjmV5MD8yH6EI
	 Hxtt+uQ04NpajGL3JP1psyK+HrOXbqA+M5NlLlRGwY6vptTp1nPxswYwmSneYK9MijSf8
	 bsq2vXiqll/jbK7i2U//L0ml1KyKWya4oXUrEut6CrEY6cOGtUcxVODRCz3AqtbTJoq3l
	 0oqJAiDRcWo7V5su3oS9Uv/c3F2AofI8wAceMa8Ek2YJ6vtRVV8YPeXIMYWo6fbJV6tCq
	 YjWCPzQncaIKhofiQ3QhV+oL4qxmtvfyR6RczKjZxI6pyyIZM9JBW0jTJtlraxbzaPKYb
	 tYcTWknHsc0K0IQK5Np8J23LyYFIFs5uHy7lAdVIOznGt68+VHZXRhnJRllW92O89a2RX
	 8IuSx2oPaPFcaGyDqIIxVmP35V2qh3zEiAckJ+JS0iYxtC26yNgGL5vFbIweAolMtnK1g
	 Dy0ww1uD/hHTXdPSlxpbYBm9FaCOn4IewHjfx3V85OmV05y/51VBxX0rdhriwg/vnPIbI
	 FB7ZxmBdovsENB4dd3PqGoybq+8xmdH1Y9kEVWnrAUM418H1L6jNcIhWpygl0j8CkTRtr
	 d+vUFycuJXaXRwsPoRMLO+2fHTgMyzAbw3lWL1aFXm254eBXrl5rg8cQIW67fT0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1768908098;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=H0YnrsgOshk3GY8BSYgaoYQiHC3IDKziNnSvODu6Q+E=;
	b=dH6OhsZOjH8p8CvCf4nuZiRYC2ueMtZ8w/Xu3GBPraTD0SmCspkr/pT1mIAdL8YGu8Q7
	 BpYU5L1FXmu9E9qvbt3JxXfHUgo2P1IipVkGPRvijlr4ILfbf5WlRJKK8N7IdnWcBWk/O
	 vp/DN4WtRUF3jvJt9ofuWbTgf/WtwW3cVlhDVr8gKuj/81s8J553NimyxNj0bDvXP8P18
	 y6rUxUw3Min5dAY/uYZf4GrMKgP1GChp0WsCk4cbYWwPcy0WIAd2m6kIs13ZDoRNI1Uwi
	 nKqez0Ui3R/99HoH6/AsNQmNabC3rEn0375mrqOh7zJGn2DF9ZmXrxeMpB44HEYX6v5yJ
	 GvCQUxnYS5ezFbIN13vtGv7/3GmDsHWP8GUQZKdq+c/RBw9GzPvkFBooCawG16/wfu0o+
	 l1vwUg7CUGGr/ShJhjPkn1m7cK/FJmSFm0DCy5knAdIl8Wviq5u1wZgT2Uk2+j9R38Fz1
	 1tKhIfMFiyPffhLI+vYnX6pfE4aoN6VOoEHc1DilL3q8RxgXTKA4SqU/Pfs1zSKvv38Vh
	 PTrp9hgMTw5HJF4BSxrhuUbeJAFbFw1/cyVpUxFftsPgfLtJirTTw7ntw4izhzjjmW0tq
	 dReAkdVZOicdL5zLZSzCqxv3NULOtFHEeabFNdiZe4S/3zov7mQXBpzs/XQagWw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 20 Jan 2026 12:21:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
In-Reply-To: <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
Message-ID: <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: B3B65481A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-01-20 10:38, Alejandro Vallejo wrote:
> It's clean.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  docs/misra/exclude-list.json | 4 ----
>  1 file changed, 4 deletions(-)
> 

Hi. Do you have a link to a pipeline?

> diff --git a/docs/misra/exclude-list.json 
> b/docs/misra/exclude-list.json
> index 388397dd3b..273e24db4a 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -121,10 +121,6 @@
>              "rel_path": "common/bunzip2.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
> -        {
> -            "rel_path": "common/earlycpio.c",
> -            "comment": "Imported from Linux, ignore for now"
> -        },
>          {
>              "rel_path": "common/gzip/*",
>              "comment": "Imported from Linux, ignore for now"

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

