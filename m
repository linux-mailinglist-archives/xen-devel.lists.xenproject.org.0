Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F752EFBE7
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 00:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63937.113337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1dI-0007SW-R8; Fri, 08 Jan 2021 23:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63937.113337; Fri, 08 Jan 2021 23:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1dI-0007S7-NZ; Fri, 08 Jan 2021 23:57:28 +0000
Received: by outflank-mailman (input) for mailman id 63937;
 Fri, 08 Jan 2021 23:57:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkaL=GL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky1dH-0007S0-EA
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 23:57:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c9aa76f-b7cc-4bef-b71c-d29ef94502a1;
 Fri, 08 Jan 2021 23:57:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7860423998;
 Fri,  8 Jan 2021 23:57:25 +0000 (UTC)
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
X-Inumbo-ID: 9c9aa76f-b7cc-4bef-b71c-d29ef94502a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610150245;
	bh=0qt9XGDd6KoFo/KtDd0N/hHWQnNWLl2zkglQQC921sg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OjnhyyWk7DUB5zmbwVwlmBC5CqHUFatJAHJ+VQnePv9stvl4+pCspKuQ8Qny1LcNe
	 mESs3at21uBOoLvJYWtT19lzII5H3DwCJfQyt69W0DWGAiLZxgGlnvyDSrfHo4ZKgz
	 AQOSDWOefuFZNftBgGxV7+O6xZAljro69y471qby+T91V9b6HfhJxb1ZIKxurh75+p
	 GzIsnCuX5E790mFUx7V2upj7We4LfSRx/v7Ui5OtDf98IrY44eq86nbROl6C4ITgGG
	 Pj5FKKAYffMrybFNgjC+wd/cCDX1vfCvOTstojUTOWVo1ema2FTTWVSYr+sRUF+X/z
	 ciBwQIRtkuynA==
Date: Fri, 8 Jan 2021 15:57:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v4 06/11] xen/device-tree: Add dt_property_match_string
 helper
In-Reply-To: <0df414d5496574269c58415f7bff8f069efce94d.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081557150.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <0df414d5496574269c58415f7bff8f069efce94d.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> Import the Linux helper of_property_match_string. This function searches
> a string list property and returns the index of a specific string value.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V3:
>  - This patch is introduce in this verison.
> Changes in V4: Rebase
> ---
>  xen/common/device_tree.c      | 27 +++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h | 12 ++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index e107c6f89f..18825e333e 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -208,6 +208,33 @@ int dt_property_read_string(const struct dt_device_node *np,
>      return 0;
>  }
>  
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string)
> +{
> +    const struct dt_property *dtprop = dt_find_property(np, propname, NULL);
> +    size_t l;
> +    int i;
> +    const char *p, *end;
> +
> +    if ( !dtprop )
> +        return -EINVAL;
> +    if ( !dtprop->value )
> +        return -ENODATA;
> +
> +    p = dtprop->value;
> +    end = p + dtprop->length;
> +
> +    for ( i = 0; p < end; i++, p += l )
> +    {
> +        l = strnlen(p, end - p) + 1;
> +        if ( p + l > end )
> +            return -EILSEQ;
> +        if ( strcmp(string, p) == 0 )
> +            return i; /* Found it; return index */
> +    }
> +    return -ENODATA;
> +}
> +
>  bool_t dt_device_is_compatible(const struct dt_device_node *device,
>                                 const char *compat)
>  {
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index f2ad22b79c..b02696be94 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -400,6 +400,18 @@ static inline bool_t dt_property_read_bool(const struct dt_device_node *np,
>  int dt_property_read_string(const struct dt_device_node *np,
>                              const char *propname, const char **out_string);
>  
> +/**
> + * dt_property_match_string() - Find string in a list and return index
> + * @np: pointer to node containing string list property
> + * @propname: string list property name
> + * @string: pointer to string to search for in string list
> + *
> + * This function searches a string list property and returns the index
> + * of a specific string value.
> + */
> +int dt_property_match_string(const struct dt_device_node *np,
> +                             const char *propname, const char *string);
> +
>  /**
>   * Checks if the given "compat" string matches one of the strings in
>   * the device's "compatible" property
> -- 
> 2.17.1
> 

