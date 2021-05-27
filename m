Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8701392EDF
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133268.248473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFft-0004Ex-Fb; Thu, 27 May 2021 13:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133268.248473; Thu, 27 May 2021 13:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFft-0004Br-AV; Thu, 27 May 2021 13:03:45 +0000
Received: by outflank-mailman (input) for mailman id 133268;
 Thu, 27 May 2021 13:03:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmFdB-0008B4-8w
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:00:57 +0000
Received: from mail-qv1-xf29.google.com (unknown [2607:f8b0:4864:20::f29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64418cba-e69e-4154-a1a2-66151aaf7c83;
 Thu, 27 May 2021 13:00:31 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id a7so3810qvf.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 06:00:31 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179])
 by smtp.gmail.com with ESMTPSA id x18sm1272488qkx.118.2021.05.27.06.00.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:00:30 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id s12so108292qta.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 06:00:30 -0700 (PDT)
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
X-Inumbo-ID: 64418cba-e69e-4154-a1a2-66151aaf7c83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgPMjyY5jAkXYAxU2M6Xs7JOfdHxgDuWupSEgAOvuBU=;
        b=HyAvfwEBrieOghAofexhSawgJJukm2YnQ2fAt2CFdEKEbDS1O9qhSu7HLdewyRfCVz
         gEA6t08wyk35Bk0UPING6Rrv8blJD9d3z2B2GuwI2wJTrYZe4msm0UUHcQ98yGMgAfAw
         jsaa2ecYO9Gel1C3uwINW+EKRzQM0HGE52Gr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgPMjyY5jAkXYAxU2M6Xs7JOfdHxgDuWupSEgAOvuBU=;
        b=s3Mzxwgtxtg/H3ih7I04JsAwh06JL2U/t4VLtMkPJJ7akvR9/yMAg5vmlLeh4uHnQT
         yNIkcw5OxqDvb2UefBtFbODVRg5D39OwJLCJgPjn0dfH+VDmylIIgm+KLsl+URHmUutg
         QUQrt+Hi7VAp57AIIJ4IkFB+vBFpw+tQlWKPoyky5zUGRDsyPylQQvIiOfNcumTzxSeQ
         nicxeoQMExSGFX9dEDEia18fMVZByTbRtLwrXhkOxr+oxzFz2J+WzsU1prkBD/1k170H
         mu0sbefGBecbeROzjMy1b+dHlDuEzsEZP9gWJKlXTIpdxC2EOQ5Q7oXx+47eM6Sk2EpJ
         Lydg==
X-Gm-Message-State: AOAM532Bivw01+VUQjgdMNKQKpNO5AbnpDUDtoexcQolfcd68v1vyX15
	CkOPjoKe81aumj9HDKUkMRttfUxCAkbPfw==
X-Google-Smtp-Source: ABdhPJwfmBtSnmT66s8oSVxbl0kteAwOB5krJM5yJKY38FIq21juIdo6PVBTWgfVFxZK0uJ/eIVb9g==
X-Received: by 2002:a0c:d784:: with SMTP id z4mr2319584qvi.27.1622120430641;
        Thu, 27 May 2021 06:00:30 -0700 (PDT)
X-Received: by 2002:a02:a505:: with SMTP id e5mr3414377jam.10.1622120419476;
 Thu, 27 May 2021 06:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
In-Reply-To: <20210518064215.2856977-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 27 May 2021 21:00:07 +0800
X-Gmail-Original-Message-ID: <CALiNf2-dUFSCOz4=jmEm8ZcX+zQXKzo6yPg31iLLLG3FAr+g1w@mail.gmail.com>
Message-ID: <CALiNf2-dUFSCOz4=jmEm8ZcX+zQXKzo6yPg31iLLLG3FAr+g1w@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] Restricted DMA
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com, 
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk, 
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
	Jianxiong Gao <jxgao@google.com>, joonas.lahtinen@linux.intel.com, 
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matthew.auld@intel.com, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

v8 here: https://lore.kernel.org/patchwork/cover/1437112/

