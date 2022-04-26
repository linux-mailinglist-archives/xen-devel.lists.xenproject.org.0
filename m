Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246A510062
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313944.531771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njM81-0007gQ-6z; Tue, 26 Apr 2022 14:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313944.531771; Tue, 26 Apr 2022 14:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njM81-0007dg-2r; Tue, 26 Apr 2022 14:25:21 +0000
Received: by outflank-mailman (input) for mailman id 313944;
 Tue, 26 Apr 2022 14:25:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2CTZ=VE=gmail.com=sagigrim@srs-se1.protection.inumbo.net>)
 id 1njM7y-0007dO-VY
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:25:18 +0000
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1e53f04-c56c-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 16:25:17 +0200 (CEST)
Received: by mail-wr1-f54.google.com with SMTP id v12so18906770wrv.10
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 07:25:17 -0700 (PDT)
Received: from [192.168.64.180] (bzq-219-42-90.isdn.bezeqint.net.
 [62.219.42.90]) by smtp.gmail.com with ESMTPSA id
 j39-20020a05600c1c2700b00393ee3deaf1sm5525786wms.9.2022.04.26.07.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 07:25:16 -0700 (PDT)
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
X-Inumbo-ID: b1e53f04-c56c-11ec-a405-831a346695d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=XQem0bzqYPnbs6HwBCdmcZg/pJT8ewyp1Xn3qGt3fjUnBD8NmYwAGDLvvM4EtcOA+z
         QqmYmbPI1Tx6L/TzyT67ONA/mOk498hT1CKZ8i1u46vloGLVllv2i3ctvCFr9TOQ8WKX
         0R8Tm95ycFmlU6Fj1O6jwno+8vNR2NlvM2QbTQwSOyPjQZRaOIpebK8ellnh6v6TjNts
         deRPPz9oqVdZR25iNqdPC/4b53jo2ZubGpcMaO1OPPrRdQemHsL+bTqn2UwGBWi1raPq
         Od9ARu/1A/WYAjGputqh2XGOSxmW4UetznNbe/hoMvirRMZ9c6pGMcg9yThDfoENhVUB
         Y8dA==
X-Gm-Message-State: AOAM533QIH2yp6H288Jl+iF0K8NTv64vTe6FwdiopW7OczDt3LledD3K
	5s1Dut3TqPB5LewzpbcfyWg=
X-Google-Smtp-Source: ABdhPJx+tGjrozc2v+hkDAQGkKaaKd6tvj25GGtU09S+2P3NV6/kZmjHHHaKsKLq0MduUfwGvhoEcw==
X-Received: by 2002:a05:6000:1a8d:b0:20a:ab7c:efb1 with SMTP id f13-20020a0560001a8d00b0020aab7cefb1mr18901071wry.716.1650983116938;
        Tue, 26 Apr 2022 07:25:16 -0700 (PDT)
Message-ID: <c658f5cc-7b9a-84ee-ac22-cefc03e3dbf2@grimberg.me>
Date: Tue, 26 Apr 2022 17:25:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/11] nvme: remove a spurious clear of discard_alignment
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Mike Snitzer <snitzer@kernel.org>,
 Song Liu <song@kernel.org>, Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 dm-devel@redhat.com
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-10-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20220418045314.360785-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

