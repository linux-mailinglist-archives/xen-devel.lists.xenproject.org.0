Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99D42A7D5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207351.363163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJKR-0001Kc-Jb; Tue, 12 Oct 2021 15:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207351.363163; Tue, 12 Oct 2021 15:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJKR-0001IJ-ES; Tue, 12 Oct 2021 15:04:31 +0000
Received: by outflank-mailman (input) for mailman id 207351;
 Tue, 12 Oct 2021 15:04:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tock=PA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1maJKQ-0001Hx-IT
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:04:30 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b23ae07f-2b6d-11ec-8135-12813bfff9fa;
 Tue, 12 Oct 2021 15:04:29 +0000 (UTC)
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
X-Inumbo-ID: b23ae07f-2b6d-11ec-8135-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634051069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AhaWvrsNw4MxXGdVWPcK2ihNuq8/77IISBWZXWc5DLY=;
  b=c3x8IntEPlPSe+3McbZfMf1ipPS34FYJ1TGkLX5w8U4GUOAncwmHutFP
   f6jtskuzA7Q0nW60X2w3B8KGb7htkXEjnsesztnpEClyLFr7yrl34nf2M
   SE2dIowKMWJd2khRoCy2pqTJKZFIaNdQd+VP5XD3csZOmXvxBjJr66Zx6
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OuRgQDMzgJy/ub8hNyUZm9KJCEgKY1w+oyVWRSbbZlDqB093nVL0c4WxP77HRnTXHZRJQtlHiI
 B1Nj9uVb2+HYmkuxFLaOy1nxZ5h1t+mqbFpYrClRUvNX1ylqNMqdxES3pIHl9LOzLe7ey3392L
 A3ujECqNFn4c5J9bcLoo2um0uTTv/DmsULNzvClq8G9cfd8jr+7Y7lnYy/OXVtsStrnnsrbwVn
 cmfA/L9G2c9Pgj1HupIwgCxPE5bXUrHqVcVTet4PIuUyGlpPLL9EuafwY+Sp+YHp6lGr7GQMgR
 HqWp+0awIdsQMexm10DblFrL
X-SBRS: 5.1
X-MesageID: 55395209
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:26jMqqykVN5aGP9BwUl6t+fSwSrEfRIJ4+MujC+fZmUNrF6WrkVRx
 jcaWWmDMq2IZzT2fN92O4my80IFvp/Vz4BgTgdv+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dj2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/9x8
 dJcqsShdV0SB6mVktUNTCtBTj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY250VTKuEP
 5txhTxHXAT/fhZCZnAsUY8QsKSGpkanWhNkkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE8H7+GQoyL8GExHyO9XfEru7QnwvrVYQKDrq6+/V2xlqJyQQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEArTgdGecN+pfNsfgUuj
 1W4j8zbHGFw5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEY49SP/dYsndXGiqm
 WjT/XdWa6A71JZTj82GEUb7byVAT3QjZjU+4RnLRSqb5wd9aZ/Ni2eAuAWDs6gowGp0SDC8U
 Jk4dyq2sL5m4XKlznXlrAAx8FeBvajt3Nr02w8HInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSXxNv4oPNLhVZp3kcAM8OgJsNiOMLKihbArJWe6ENxGPxbMjwgBbmB9+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbaelA4Rzp7V6OIqV7jEqQ895loei7z1
 inVcidlJJDX3CKXQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:ThauEqv/RJPa+3J86J8r55ah7skDdNV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVcqKRUdcL+7VJVoLUmyyXcx2/h2AV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyIMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.85,367,1624334400"; 
   d="scan'208";a="55395209"
Date: Tue, 12 Oct 2021 16:02:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] libxl: CODING_STYLE: Explicitly deprecate #ifdef
Message-ID: <YWWjnAhkMGbct5Ii@perard>
References: <20211012145226.6065-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211012145226.6065-1-iwj@xenproject.org>

On Tue, Oct 12, 2021 at 03:52:26PM +0100, Ian Jackson wrote:
> We don't use ifdefs in the main code.  Actually document this.
> 
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> ---
>  tools/libs/light/CODING_STYLE | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/libs/light/CODING_STYLE b/tools/libs/light/CODING_STYLE
> index 3d572f6925..c2342c9d3b 100644
> --- a/tools/libs/light/CODING_STYLE
> +++ b/tools/libs/light/CODING_STYLE
> @@ -121,6 +121,16 @@ permitted exceptions to the usual libxl code formatting rules.
>  
>  
>  
> +ARCHITECTURE-SPECIFIC CODE, CONDITIONAL COMPILATION
> +---------------------------------------------------
> +
> +Architecture-specific code should be isolated in libxl_<arch>.c,
> +with a function call interface, whereever possible.

s/whereever/wherever/ ?

> +
> +#ifdefs should be avoided, and in any case not interspersed through
> +the primary functional code.
> +
> +
>  IDEMPOTENT DATA STRUCTURE CONSTRUCTION/DESTRUCTION
>  --------------------------------------------------
>  

Sounds good,

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

