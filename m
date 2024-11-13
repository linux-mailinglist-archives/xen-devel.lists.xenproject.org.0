Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB509C6782
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 04:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835029.1250853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB3bs-0004eL-NN; Wed, 13 Nov 2024 03:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835029.1250853; Wed, 13 Nov 2024 03:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB3bs-0004cm-Jv; Wed, 13 Nov 2024 03:00:00 +0000
Received: by outflank-mailman (input) for mailman id 835029;
 Wed, 13 Nov 2024 03:00:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tB3bs-0004XF-0Y
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 03:00:00 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cb3bb11-a16b-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 03:59:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D8F9A41D4C;
 Wed, 13 Nov 2024 02:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A519C4CED6;
 Wed, 13 Nov 2024 02:59:53 +0000 (UTC)
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
X-Inumbo-ID: 5cb3bb11-a16b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjVjYjNiYjExLWExNmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDY2Nzk2LjgzMDg1NSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731466795;
	bh=Vcotr9kZdaFf2oJR6OM8t1tUgvtOPVAdDEw0Ijrao9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pMNM9e0d7goliKWJC9HJvbjwBaBSSWpYJnkC/tvTPaXeIgJuSVSsZFzhbztkNVN86
	 HuTtzinCiaZhLcmXlMB/RaqXFcC2z6TW7T5cytyj0RylEl5L6YJDvBdEm6G9NHPcUP
	 NZSJcpFeHx8nZShGFAVCzV1f856zbZ00cYQo5pb4+CFVEhlPtcZ5YZm/FK0NAa89aG
	 Ew3gj6/11Ao3nVT3El/Mt9+dpADdpF1ANeAw2f/gqHgbXc0WUWq9nyvwk50adJYC7Z
	 wqAlFvSksIehShTEroRtGI6RvXKo40kKGTjKocgivYQc6r1Y18w/96DQ8vm6uurBfK
	 8T5X8puT381QA==
Date: Tue, 12 Nov 2024 18:59:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] x86/e820: Fix parameter names of
 reserve_e820_ram()/e820_change_range_type()
In-Reply-To: <20241112213327.1474541-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411121859460.222505@ubuntu-linux-20-04-desktop>
References: <20241112213327.1474541-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1095287594-1731466795=:222505"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1095287594-1731466795=:222505
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 12 Nov 2024, Andrew Cooper wrote:
> The work to address Rule 5.3 introduced violations of Rule 8.3 by failing to
> rename the parameters in the declaration.
> 
> Fixes: b5fd405aa381 ("x86/e820 address violations of MISRA C:2012 Rule 5.3")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> ---
>  xen/arch/x86/include/asm/e820.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
> index af90085d65d1..8e7644f8870b 100644
> --- a/xen/arch/x86/include/asm/e820.h
> +++ b/xen/arch/x86/include/asm/e820.h
> @@ -25,9 +25,9 @@ struct e820map {
>  
>  extern int sanitize_e820_map(struct e820entry *biosmap, unsigned int *pnr_map);
>  extern int e820_all_mapped(u64 start, u64 end, unsigned type);
> -extern int reserve_e820_ram(struct e820map *e820, uint64_t s, uint64_t e);
> +extern int reserve_e820_ram(struct e820map *map, uint64_t s, uint64_t e);
>  extern int e820_change_range_type(
> -    struct e820map *e820, uint64_t s, uint64_t e,
> +    struct e820map *map, uint64_t s, uint64_t e,
>      uint32_t orig_type, uint32_t new_type);
>  extern int e820_add_range(uint64_t s, uint64_t e, uint32_t type);
>  extern unsigned long init_e820(const char *str, struct e820map *raw);
> 
> base-commit: 38febce5b35a7a4391906499b2046f01ec0129ca
> -- 
> 2.39.5
> 
--8323329-1095287594-1731466795=:222505--

