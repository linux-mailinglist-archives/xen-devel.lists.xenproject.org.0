Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66DC27EBFB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805.2707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdks-0006ek-0J; Wed, 30 Sep 2020 15:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805.2707; Wed, 30 Sep 2020 15:10:53 +0000
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
	id 1kNdkr-0006eL-TG; Wed, 30 Sep 2020 15:10:53 +0000
Received: by outflank-mailman (input) for mailman id 805;
 Wed, 30 Sep 2020 15:10:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdkp-0006eG-SD
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:10:51 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91e21081-749d-461e-96a7-b35f619e12ad;
 Wed, 30 Sep 2020 15:10:50 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s13so2083349wmh.4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:10:50 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c14sm3431002wrv.12.2020.09.30.08.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:10:49 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdkp-0006eG-SD
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:10:51 +0000
X-Inumbo-ID: 91e21081-749d-461e-96a7-b35f619e12ad
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 91e21081-749d-461e-96a7-b35f619e12ad;
	Wed, 30 Sep 2020 15:10:50 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s13so2083349wmh.4
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rfg3/AYJ8+XtVv5Ik3Z7ddzB2INQo5kWBkBjXqHmDJ8=;
        b=jgU3QOEwNmw7sL006TQ6D5IWL1DxqiJ3FqXtVDINuLMstLaTKla/kXlHNjaLVOoOpx
         vhoHUoTesszlz5D1zIHdbc5AKNwLHEuALc42SaWbjqhMKhglZ7a1SWoXLUj1uIMYkVIZ
         q4RGqq5Cq9V7UqwsGL+DWdxtIMgwg5enpDt7Xh4pqase96F6qfuqfP7Kufok8J1kXzMw
         RYe9KICkP9/imFnrYO7e2Uic48YLv+pRncXcaBgF4i9oe/cKu2xybULcNQ369YACDF0+
         e22PKp2atbmTghRUixgsSCaietJinJDeVplj0oiJYIZxCnUQD0UhJmgoA8zPzcvKbOjj
         zFXA==
X-Gm-Message-State: AOAM532wA3zdeuCx2txPmuY27wsnmWqL4UtnZ/XxAFJR4guRCeQiHQaS
	9yKhLoeoTDQL/Xok/A2m574=
X-Google-Smtp-Source: ABdhPJx8vOC+RsqmVLku26EUpZPqZ2rCUkfruQ1e12imlHKDCo0Vyd43ljU+xc6QgK5QEIoL1Uvjxw==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr3437487wmk.167.1601478650164;
        Wed, 30 Sep 2020 08:10:50 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id c14sm3431002wrv.12.2020.09.30.08.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:10:49 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:10:48 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] libxc/bitops: increase potential size of bitmaps
Message-ID: <20200930151048.z2tct4wljb67qfdc@liuwe-devbox-debian-v2>
References: <20200924180843.30452-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924180843.30452-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 08:08:43PM +0200, Olaf Hering wrote:
> If the bitmap is used to represent domU pages, the amount of memory is
> limited to 8TB due to the 32bit value. Adjust the code to use 64bit
> values as input. All callers already use some form of 64bit as input,
> so no further adjustment is required.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

