Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057AE27EB28
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 16:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782.2595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdIY-000365-BY; Wed, 30 Sep 2020 14:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782.2595; Wed, 30 Sep 2020 14:41:38 +0000
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
	id 1kNdIY-00035g-7y; Wed, 30 Sep 2020 14:41:38 +0000
Received: by outflank-mailman (input) for mailman id 782;
 Wed, 30 Sep 2020 14:41:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdIW-00035b-IJ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:41:36 +0000
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11201df3-fa8c-4567-92d8-0a4a7f88014c;
 Wed, 30 Sep 2020 14:41:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g4so2113631wrs.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:41:35 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t15sm3315781wrp.20.2020.09.30.07.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:41:33 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdIW-00035b-IJ
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:41:36 +0000
X-Inumbo-ID: 11201df3-fa8c-4567-92d8-0a4a7f88014c
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 11201df3-fa8c-4567-92d8-0a4a7f88014c;
	Wed, 30 Sep 2020 14:41:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g4so2113631wrs.5
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7p9VHV7RQtMrXoCmSBxA0z5Bivi1+A3qTqKIuDDl8AM=;
        b=VGpm0Dot60j93odn2iqpNKhYEcnCfXo0IUIJVlnLtEtVyR+OY1KrbbcQTxTGEJpjY4
         3D6MOBsZaD3OVpjCQ6NZAa3cgE85wCx42MRtvg6w3KthFFCCluC7UuLU3yMwqLiA+sY2
         qx3WPW0UTETAcEdjXynjHdnzyrTEB3cxeaSCeGDAWgR5MKlUXAt4FeKHmkfsU5a9HZbH
         28ZdH0EXW8tdUKcOmE58sa53QrF79vtVM9msRdJzzgDDJA7KfzdpY0tj4Pkl861S/viK
         HOuJ5QswEF7NLe8W9PwcsnsUO6tiNVYrn14K2exgVPOyi4Wc7PoLJm2T7bDCpty480q3
         MxOA==
X-Gm-Message-State: AOAM531qjOccTBLQwcHTVZbBQIcg6xbs1Rj2KBr1OWf+cYJGjyCRB70I
	AzS332IUXuRJbupz77TxPmc=
X-Google-Smtp-Source: ABdhPJw6NpVT1MTxSpgRoYCB3eywP1o6Iz+2hhd+4GQpfCVyzukcaO6Ozj2OQJa3z8psxt1HGnqGaQ==
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr3813102wrn.394.1601476895074;
        Wed, 30 Sep 2020 07:41:35 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id t15sm3315781wrp.20.2020.09.30.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:41:33 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:41:32 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v9 5/8] docs / tools: specific migration v4 to include
 DOMAIN_CONTEXT
Message-ID: <20200930144132.pcr5twas3pnhri6o@liuwe-devbox-debian-v2>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-6-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924131030.1876-6-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 02:10:27PM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> A new 'domain context' framework was recently introduced to facilitate
> transfer of state for both PV and HVM guests. Hence this patch mandates the
> presence of a new DOMAIN_CONTEXT record in version 4 of the libxc migration
> stream.
> This record will incorprate the content of the domain's 'shared_info' page
> and the TSC informaiton so the SHARED_INFO and TSC_INFO records are deprecated.
> It is intended that, in future, this record will contain state currently
> present in the HVM_CONTEXT record. However, for compatibility with earlier
> migration streams, the version 4 stream format continues to specify an
> HVM_CONTEXT record and XEN_DOMCTL_sethvmcontext will continue to accept all
> content of that record that may be present in a version 3 stream.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

I would like Andrew to give an explicit ack on this patch.

