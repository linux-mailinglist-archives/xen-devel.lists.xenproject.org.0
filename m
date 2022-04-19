Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC9506D5C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 15:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308137.523697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngnla-0007gB-Pt; Tue, 19 Apr 2022 13:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308137.523697; Tue, 19 Apr 2022 13:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngnla-0007da-Mx; Tue, 19 Apr 2022 13:19:38 +0000
Received: by outflank-mailman (input) for mailman id 308137;
 Tue, 19 Apr 2022 13:19:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQ6T=U5=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1ngnlY-0007dU-Tm
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 13:19:36 +0000
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ad5e2d4-bfe3-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 15:19:35 +0200 (CEST)
Received: by mail-ot1-f53.google.com with SMTP id
 c11-20020a9d684b000000b00603307cef05so8353759oto.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 06:19:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o64-20020acad743000000b002ef3b249b9esm5002838oig.58.2022.04.19.06.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 06:19:33 -0700 (PDT)
Received: (nullmailer pid 2323034 invoked by uid 1000);
 Tue, 19 Apr 2022 13:19:32 -0000
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
X-Inumbo-ID: 5ad5e2d4-bfe3-11ec-a405-831a346695d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hYORCeWbeix4J5CxHYndk8/zWspzxFUk4CcUI2nGMhg=;
        b=abj5N4EnP0wOp+NqFxi9fDdBNpIUr1fjwVia3NUiRXUJqkT/kIJy6ouoejcGqtcKXB
         HIFgKP9V5jpMEbuUE34v8OS8n+BhdSSin10GaPiQPpQ5SXgAoZNFr7tZqZXSbZj17BlD
         hISu3pE++t11VUXkM1j+dvHFE2M9U0QcrScUTIJbzqJV0uVSIYrcrb1+LffmSHtHINV2
         vx6aRf8YkyT9KLTqvajRwpm3xiuD2dBqmxd//qnbc8MEDEmGZ1oUd3da+bVplxjOqkaU
         zOo4yEDUkmvhyaUiPt7ZPtBBY3M0RNjdy7HwqWJw+68eJiV7td2HlL704S+T6uFArmBK
         nfKw==
X-Gm-Message-State: AOAM532TkRDi0f3KCpUqMUTdbk/tFqh7Zaafj9jSnJajc6cLadCoTvyj
	18mJB5L1Zt/C0wWveT9Lww==
X-Google-Smtp-Source: ABdhPJz95PNkSHrePsY47MQUDBbqQF6249VaMMsqV2Yk41XDjy6ZzbVnMxC2DSC071gfjYWvuQ90cA==
X-Received: by 2002:a9d:12a9:0:b0:603:d1cc:68eb with SMTP id g38-20020a9d12a9000000b00603d1cc68ebmr5741572otg.326.1650374373912;
        Tue, 19 Apr 2022 06:19:33 -0700 (PDT)
Date: Tue, 19 Apr 2022 08:19:32 -0500
From: Rob Herring <robh@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: devicetree@vger.kernel.org, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>, robh+dt@kernel.org, julien@xen.org, frowand.list@gmail.com
Subject: Re: [PATCH v2] of: of_property_read_string return -ENODATA when
 !length
Message-ID: <Yl625EnFl0/MChux@robh.at.kernel.org>
References: <20220416003028.1315268-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220416003028.1315268-1-sstabellini@kernel.org>

On Fri, 15 Apr 2022 17:30:28 -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> When the length of the string is zero of_property_read_string should
> return -ENODATA according to the description of the function.
> 
> However, of_property_read_string doesn't check prop->length. If
> prop->length is zero, return -ENODATA.
> 
> Without this patch the following command in u-boot:
> 
> fdt set /chosen/node property-name
> 
> results in of_property_read_string returning -EILSEQ when attempting to
> read property-name. With this patch, it returns -ENODATA as expected.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v2:
> - use prop instead pp
> - drop value check
> - update function header documentation
> ---
>  drivers/of/property.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Applied, thanks!

