Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94F0283CB1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 18:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3069.8878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPTZk-000098-HI; Mon, 05 Oct 2020 16:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3069.8878; Mon, 05 Oct 2020 16:43:00 +0000
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
	id 1kPTZk-00008j-Dr; Mon, 05 Oct 2020 16:43:00 +0000
Received: by outflank-mailman (input) for mailman id 3069;
 Mon, 05 Oct 2020 16:42:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xs+r=DM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kPTZi-00008e-OD
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:42:58 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e47bc10-e77f-46eb-a677-62658364958a;
 Mon, 05 Oct 2020 16:42:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d4so162051wmd.5
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 09:42:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id e19sm729967wme.2.2020.10.05.09.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 09:42:55 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xs+r=DM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kPTZi-00008e-OD
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:42:58 +0000
X-Inumbo-ID: 1e47bc10-e77f-46eb-a677-62658364958a
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1e47bc10-e77f-46eb-a677-62658364958a;
	Mon, 05 Oct 2020 16:42:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d4so162051wmd.5
        for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2020 09:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ljnafd1qplNYnzMsiXQsvGYfXaCWCpt32msVm8+CJD8=;
        b=EHN39ryyFEAwpdtL6eLPwNWU4N1F+4K24xU95AnNtewnumJoN5XbvWjUqDTOm2ALlM
         ckjNAm8il3Lcdw2ISTModTNJR9UjpIF3gErBwhXfGaVnWBrP2xkGUKblweeLTc3znR0a
         TZafNln49x6QP28KVMUyJggOpi4sUr1HOVcbI/thZbox/CIFygqlM72b7CICEVLfwKhA
         oBPfvvPRXxmIgBydwO0j1UgKu7zZ9tfBakDtBsoLVnB4yCQGl7YrlHJ3txXj8GlZughX
         HHzRQ7v6TPRoaX8IdrcAuAWqTBpwWMy2hu2JcEC0Fz0qtr1UuPPfRZ9lHxpvpp8JXBKr
         /59Q==
X-Gm-Message-State: AOAM533k+E0r7SzmTOnVp13fIcUPjZFT5jC0FX5y1Yolx/PPB+ZN2mFj
	BPHAJjMKF9D+ycizxy8wT4o=
X-Google-Smtp-Source: ABdhPJyjVHhlgVMyj8NzNdjpXSV2XD9X4IVUTXs12nMCY0bcaa++AWYyR4Wq55qLW6A46twup01fVw==
X-Received: by 2002:a1c:20ce:: with SMTP id g197mr290182wmg.72.1601916176135;
        Mon, 05 Oct 2020 09:42:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id e19sm729967wme.2.2020.10.05.09.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 09:42:55 -0700 (PDT)
Date: Mon, 5 Oct 2020 16:42:53 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools: use memcpy instead of strncpy in getBridge
Message-ID: <20201005164253.cse24pshvbpoehjw@liuwe-devbox-debian-v2>
References: <cover.1601913536.git.bertrand.marquis@arm.com>
 <3de58159c6fde0cdfa4d0f292fa55fdb931cb3aa.1601913536.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3de58159c6fde0cdfa4d0f292fa55fdb931cb3aa.1601913536.git.bertrand.marquis@arm.com>
User-Agent: NeoMutt/20180716

On Mon, Oct 05, 2020 at 05:02:48PM +0100, Bertrand Marquis wrote:
> Use memcpy in getBridge to prevent gcc warnings about truncated
> strings. We know that we might truncate it, so the gcc warning
> here is wrong.
> Revert previous change changing buffer sizes as bigger buffers
> are not needed.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Juergen, are you happy with this change? I have not followed closely the
discussion on #xendevel.

> ---
>  tools/libs/stat/xenstat_linux.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
> index d2ee6fda64..1db35c604c 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -78,7 +78,12 @@ static void getBridge(char *excludeName, char *result, size_t resultLen)
>  				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
>  
>  				if (access(tmp, F_OK) == 0) {
> -					strncpy(result, de->d_name, resultLen);
> +					/*
> +					 * Do not use strncpy to prevent compiler warning with
> +					 * gcc >= 10.0
> +					 * If de->d_name is longer then resultLen we truncate it
> +					 */
> +					memcpy(result, de->d_name, resultLen - 1);
>  					result[resultLen - 1] = 0;
>  				}
>  		}
> @@ -264,7 +269,7 @@ int xenstat_collect_networks(xenstat_node * node)
>  {
>  	/* Helper variables for parseNetDevLine() function defined above */
>  	int i;
> -	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[256] = { 0 }, devNoBridge[257] = { 0 };
> +	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[16] = { 0 }, devNoBridge[17] = { 0 };
>  	unsigned long long rxBytes, rxPackets, rxErrs, rxDrops, txBytes, txPackets, txErrs, txDrops;
>  
>  	struct priv_data *priv = get_priv_data(node->handle);
> -- 
> 2.17.1
> 

