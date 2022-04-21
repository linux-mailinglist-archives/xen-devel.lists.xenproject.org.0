Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A1C50AC8B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 01:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310523.527414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhgbd-0003jj-3w; Thu, 21 Apr 2022 23:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310523.527414; Thu, 21 Apr 2022 23:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhgbd-0003hD-0z; Thu, 21 Apr 2022 23:53:01 +0000
Received: by outflank-mailman (input) for mailman id 310523;
 Thu, 21 Apr 2022 23:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhgbb-0003h7-Mx
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 23:52:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ba8723c-c1ce-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 01:52:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A2EDB829CB;
 Thu, 21 Apr 2022 23:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D055AC385A5;
 Thu, 21 Apr 2022 23:52:55 +0000 (UTC)
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
X-Inumbo-ID: 2ba8723c-c1ce-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650585176;
	bh=eykvC1d/EQJg4BjjlNBNB1jP5F6IGL/ShzWX84n1eO0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qh3U8RjECIFd4RfxAtj2sY4YEg0iZ3RZLQ3deuMYuxASbsBoGibkVtPjk+sGD5W4k
	 dN56YjsI+Voy26CqnE/f0p8IDkW8vCMPoRn9RJ1L8zsnwZRnlaYhg5bZN5sLhRevkl
	 znQ60oo4UuH19Il8BEq+YzcMpWtVVfHErAznHSRoWT0mYk6lmSK0okttfTSb3R/l/+
	 LuCfQcEut0gIWzQCrrCGa/DvHmtiVDcrXDfXn2DzI+7ZdRj1gyQJ49I6k1tWwraLyj
	 DSz7PEV9S9nZgFI6GPH+cTr5xc3SMtqx3WlHD4oGkf5HAoFxC9hrcficDWx4WQoet4
	 tUzuA784dhHgg==
Date: Thu, 21 Apr 2022 16:52:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Paran Lee <p4ranlee@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    austindh.kim@gmail.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/device_tree: silence ambiguous integer casting
 warning error
In-Reply-To: <20220419154619.GA3136@DESKTOP-NK4TH6S.localdomain>
Message-ID: <alpine.DEB.2.22.394.2204211638390.915916@ubuntu-linux-20-04-desktop>
References: <20220419154619.GA3136@DESKTOP-NK4TH6S.localdomain>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1793672686-1650584546=:915916"
Content-ID: <alpine.DEB.2.22.394.2204211642310.915916@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1793672686-1650584546=:915916
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204211642311.915916@ubuntu-linux-20-04-desktop>

On Wed, 20 Apr 2022, Paran Lee wrote:
> GCC with "-g -Wall -Wextra" option throws warning message as below:
> 
> error: comparison of integer expressions of different signedness:
>  ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
> 
> Silence the warning by correcting the integer type.
> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>

Thanks for the patch, this is a good improvement.



> ---
>  xen/common/device_tree.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 4aae281e89..402e465c7a 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -79,7 +79,7 @@ struct dt_bus
>      const char *addresses;
>      bool_t (*match)(const struct dt_device_node *node);
>      void (*count_cells)(const struct dt_device_node *child,
> -                        int *addrc, int *sizec);
> +                        unsigned int *addrc, unsigned int *sizec);
>      u64 (*map)(__be32 *addr, const __be32 *range, int na, int ns, int pna);
>      int (*translate)(__be32 *addr, u64 offset, int na);
>      unsigned int (*get_flags)(const __be32 *addr);
> @@ -569,7 +569,7 @@ static bool_t dt_bus_default_match(const struct dt_device_node *node)
>  }
>  
>  static void dt_bus_default_count_cells(const struct dt_device_node *dev,
> -                                int *addrc, int *sizec)
> +                                       unsigned int *addrc, unsigned int *sizec)
>  {
>      if ( addrc )
>          *addrc = dt_n_addr_cells(dev);
> @@ -649,7 +649,7 @@ static bool_t dt_bus_pci_match(const struct dt_device_node *np)
>  }
>  
>  static void dt_bus_pci_count_cells(const struct dt_device_node *np,
> -				   int *addrc, int *sizec)
> +				   unsigned int *addrc, unsigned int *sizec)
>  {
>      if (addrc)
>          *addrc = 3;

Although I don't necessarily mind these two changes to
dt_bus_default_count_cells and dt_bus_pci_count_cells as they are
improvements, I don't see how they are related to the "comparison of
integer expressions of different signedness" problem.

I definitely see the comparison between "i" and "imaplen" below for
instance but where is the problematic integers comparison in the case of
"na" and "ns"?

It would help to post the GCC output that you are getting with all the
warnings for this file.


> @@ -737,7 +737,7 @@ static const struct dt_bus dt_busses[] =
>  
>  static const struct dt_bus *dt_match_bus(const struct dt_device_node *np)
>  {
> -    int i;
> +    long unsigned int i;

Just write is as "unsigned long" for uniformity with the rest of the
code


>      for ( i = 0; i < ARRAY_SIZE(dt_busses); i++ )
>          if ( !dt_busses[i].match || dt_busses[i].match(np) )
> @@ -754,7 +754,8 @@ static const __be32 *dt_get_address(const struct dt_device_node *dev,
>      u32 psize;
>      const struct dt_device_node *parent;
>      const struct dt_bus *bus;
> -    int onesize, i, na, ns;
> +    unsigned int i;
> +    unsigned int onesize, na, ns;
>  
>      /* Get parent & match bus type */
>      parent = dt_get_parent(dev);
> @@ -797,8 +798,7 @@ static int dt_translate_one(const struct dt_device_node *parent,
>                              int pna, const char *rprop)
>  {
>      const __be32 *ranges;
> -    unsigned int rlen;
> -    int rone;
> +    unsigned int rlen, rone;
>      u64 offset = DT_BAD_ADDR;
>  
>      ranges = dt_get_property(parent, rprop, &rlen);
> @@ -857,7 +857,7 @@ static u64 __dt_translate_address(const struct dt_device_node *dev,
>      const struct dt_device_node *parent = NULL;
>      const struct dt_bus *bus, *pbus;
>      __be32 addr[DT_MAX_ADDR_CELLS];
> -    int na, ns, pna, pns;
> +    unsigned int na, ns, pna, pns;
>      u64 result = DT_BAD_ADDR;
>  
>      dt_dprintk("DT: ** translation for device %s **\n", dev->full_name);


In this function na and ns get printed a few times. We should convert
%d to %u.


Also, if we are going to change na and ns to unsigned int, then I think
we should also do it in dt_read_number and dt_translate_one. Not
necessarily in this patch though.


> @@ -966,8 +966,7 @@ int dt_for_each_range(const struct dt_device_node *dev,
>      const struct dt_bus *bus, *pbus;
>      const __be32 *ranges;
>      __be32 addr[DT_MAX_ADDR_CELLS];
> -    unsigned int rlen;
> -    int na, ns, pna, pns, rone;
> +    unsigned int rlen, na, ns, pna, pns, rone;
>  
>      bus = dt_match_bus(dev);
>      if ( !bus )
> @@ -1134,7 +1133,7 @@ unsigned int dt_number_of_address(const struct dt_device_node *dev)
>      u32 psize;
>      const struct dt_device_node *parent;
>      const struct dt_bus *bus;
> -    int onesize, na, ns;
> +    unsigned int onesize, na, ns;
>  
>      /* Get parent & match bus type */
>      parent = dt_get_parent(dev);
> @@ -1169,8 +1168,8 @@ int dt_for_each_irq_map(const struct dt_device_node *dev,
>      const struct dt_device_node *ipar, *tnode, *old = NULL;
>      const __be32 *tmp, *imap;
>      u32 intsize = 1, addrsize, pintsize = 0, paddrsize = 0;
> -    u32 imaplen;
> -    int i, ret;
> +    u32 i, imaplen;
> +    int ret;
>  
>      struct dt_raw_irq dt_raw_irq;
>      struct dt_irq dt_irq;
> @@ -1354,8 +1353,8 @@ static int dt_irq_map_raw(const struct dt_device_node *parent,
>      const struct dt_device_node *ipar, *tnode, *old = NULL, *newpar = NULL;
>      const __be32 *tmp, *imap, *imask;
>      u32 intsize = 1, addrsize, newintsize = 0, newaddrsize = 0;
> -    u32 imaplen;
> -    int match, i;
> +    u32 i, imaplen;
> +    int match;
>  
>      dt_dprintk("dt_irq_map_raw: par=%s,intspec=[0x%08x 0x%08x...],ointsize=%d\n",
>                 parent->full_name, be32_to_cpup(intspec),
> @@ -1737,7 +1736,7 @@ static int __dt_parse_phandle_with_args(const struct dt_device_node *np,
>  
>              if ( out_args )
>              {
> -                int i;
> +                u32 i;
>  
>                  WARN_ON(count > MAX_PHANDLE_ARGS);
>                  if (count > MAX_PHANDLE_ARGS)

These changes are great, thanks! I wouldn't mind a patch that only
changes "i" in __dt_parse_phandle_with_args, dt_irq_map_raw,
dt_for_each_irq_map, dt_match_bus. Those changes are straightforward.
--8323329-1793672686-1650584546=:915916--

