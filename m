Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE04470605
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 17:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244048.422203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mviy6-0000XG-0f; Fri, 10 Dec 2021 16:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244048.422203; Fri, 10 Dec 2021 16:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mviy5-0000Uo-Sh; Fri, 10 Dec 2021 16:41:57 +0000
Received: by outflank-mailman (input) for mailman id 244048;
 Fri, 10 Dec 2021 16:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VqPJ=Q3=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1mviy4-0008Lx-Bb
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 16:41:56 +0000
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15600709-59d8-11ec-a74f-db008197e53d;
 Fri, 10 Dec 2021 17:41:55 +0100 (CET)
Received: by mail-oi1-f178.google.com with SMTP id bf8so13975674oib.6
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 08:41:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m12sm600169ots.59.2021.12.10.08.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 08:41:53 -0800 (PST)
Received: (nullmailer pid 1495271 invoked by uid 1000);
 Fri, 10 Dec 2021 16:41:52 -0000
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
X-Inumbo-ID: 15600709-59d8-11ec-a74f-db008197e53d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mzRHekSe+1ItE0g/B1/sdKOqQcFEHI9ComSVVLd1nlI=;
        b=1gzLHr29PTb3bSMTgJIv844ttwEeUPxBfwV9eoJBSp+s/Gt5H75gepD5Oz5cZV1h7M
         f18uvlEgh1SdWT4LKZyhDzw/MQSkYp/kxPKHjvaTvURE+k//wGk5yX2cOQhhqcCXKE9K
         pJlSSOPa1NY94jtsUTHrpofBwXd6aTg5H14rZ9NOvZ8/S7HIQFuRJdFhfuyNIk2033bq
         KHYEj79mkwsRDnNgWIn/9pt5yxJaxRAR+5P7OKKEuoRoLsiShuN/1KHRws0HV0/Ub4IM
         ENF6ZDv9PnwKLLko63etQ9EdsXcN7LWF6nzimRqytDwbnZMVwC7pXmVSeCP8j783g4y6
         /m5A==
X-Gm-Message-State: AOAM533UlerP7w7Mwt5we2j5lRljHkvaJUshRvEmSircnlrgFdyKlPKU
	fWMu9uiw178ujTHnIi8NQA==
X-Google-Smtp-Source: ABdhPJwRv+kMCf78RcI/EgKRH+ISPL3AxEehRdB9Ai5HD06TXa1RnLKZV2R7Cgi/ZzR5zEXSnPJELw==
X-Received: by 2002:a05:6808:649:: with SMTP id z9mr12919308oih.125.1639154514388;
        Fri, 10 Dec 2021 08:41:54 -0800 (PST)
Date: Fri, 10 Dec 2021 10:41:52 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: devicetree@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Rob Herring <robh+dt@kernel.org>, xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 6/6] dt-bindings: xen: Clarify "reg" purpose
Message-ID: <YbODUP7jnSWffumD@robh.at.kernel.org>
References: <35ee3534-9e24-5a11-0bf1-a5dd0b640186@gmail.com>
 <1639136201-27530-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639136201-27530-1-git-send-email-olekstysh@gmail.com>

On Fri, 10 Dec 2021 13:36:41 +0200, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Xen on Arm has gained new support recently to calculate and report
> extended regions (unused address space) safe to use for external
> mappings. These regions are reported via "reg" property under
> "hypervisor" node in the guest device-tree. As region 0 is reserved
> for grant table space (always present), the indexes for extended
> regions are 1...N.
> 
> No device-tree bindings update is needed (except clarifying the text)
> as guest infers the presence of extended regions from the number
> of regions in "reg" property.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes V2 -> V3:
>    - new patch
> 
> Changes V3 -> V4:
>    - add Stefano's R-b and Rob's A-b
>    - remove sentence about ACPI for "reg" and "interrupts"
>      properties
> 
> Changes V4 -> V4.1
>    - bring the mentioning of ACPI back which, as was pointed out by Julien,
>      fits in the context:
>      https://lore.kernel.org/xen-devel/9602b019-6c20-cdc7-23f3-9e4f8fd720f6@xen.org/T/#t
>      so technically restore V3 state
>    - remove Stefano's R-b and Rob's A-b as I am not 100% sure they are
>      happy with that
> ---
>  Documentation/devicetree/bindings/arm/xen.txt | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

