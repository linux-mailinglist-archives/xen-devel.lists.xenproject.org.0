Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78322FED5C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72132.129588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bHE-000155-0W; Thu, 21 Jan 2021 14:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72132.129588; Thu, 21 Jan 2021 14:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bHD-00014i-Tj; Thu, 21 Jan 2021 14:49:35 +0000
Received: by outflank-mailman (input) for mailman id 72132;
 Thu, 21 Jan 2021 14:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bHC-00014d-Ct
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 14:49:34 +0000
Received: from mail-wm1-f54.google.com (unknown [209.85.128.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2bb4424-817d-4507-8774-1a791d8a0c1b;
 Thu, 21 Jan 2021 14:49:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c127so1757705wmf.5
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 06:49:33 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h9sm8800283wre.24.2021.01.21.06.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 06:49:31 -0800 (PST)
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
X-Inumbo-ID: c2bb4424-817d-4507-8774-1a791d8a0c1b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FmJ0WPRMZJbLxHc9l40fqax1JBXSB0MFf6Tbrw03hJc=;
        b=V6QvHBmGI4Nb9TH38j9ugnBlMaZDZ6WCtWU2o94Gydo+2lkc4o2b9usXHKYHNB33KQ
         EpUfdjP7o0RsoEofxYA9AGvL4G6x4dlDnRNeeRTWyaro2X/r01TJZs8IwJfPZzijFwy8
         RDK0T1QbgD29fEO834KaKwXlkhJMNZfRHNoUU0/J3tSqphf7zoiHgjYJmem8EMU2s8bG
         2TQXKzxznK0JNliw19wk5sRmqqwecF+u0yZOZjvPmkxiyW3T7lq2aSY9cMbPJAW8YaaT
         7Febe6DjZKGo+wAItKPvI9C4eB+q74UpdW5k9u1Fdubp7OLXlV6MYt5kz5DDiB5TDSDr
         UHCQ==
X-Gm-Message-State: AOAM533t3drif69RSUFtOem8ylnIdYiSJhOZsuodv0Dyd0qGS7aCjH+h
	wz+nTMCHXD2PULBAAZXw1wU=
X-Google-Smtp-Source: ABdhPJz0pyKfrDMAKAuepnv6dvl+z7NppZkocEij2By1E7G3Y5PfJv6ifHJBtYTnK7QmO5eTxIFIlg==
X-Received: by 2002:a05:600c:4148:: with SMTP id h8mr9357126wmm.137.1611240572376;
        Thu, 21 Jan 2021 06:49:32 -0800 (PST)
Date: Thu, 21 Jan 2021 14:49:30 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 5/7] xl: support naming of assignable devices
Message-ID: <20210121144930.oer3plenup7wbtbf@liuwe-devbox-debian-v2>
References: <20210105174642.2754-1-paul@xen.org>
 <20210105174642.2754-6-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105174642.2754-6-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Jan 05, 2021 at 05:46:40PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> With this patch applied 'xl pci-assignable-add' will take an optional '--name'
> parameter, 'xl pci-assignable-remove' can be passed either a BDF or a name and
> 'xl pci-assignable-list' will take a optional '--show-names' flag which
> determines whether names are displayed in its output.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

