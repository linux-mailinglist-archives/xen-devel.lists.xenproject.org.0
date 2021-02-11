Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4537318F85
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 17:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83985.157331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAEY8-00061c-H9; Thu, 11 Feb 2021 16:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83985.157331; Thu, 11 Feb 2021 16:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAEY8-00061D-E4; Thu, 11 Feb 2021 16:10:36 +0000
Received: by outflank-mailman (input) for mailman id 83985;
 Thu, 11 Feb 2021 16:10:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRkU=HN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lAEY7-000618-Hg
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 16:10:35 +0000
Received: from mail-wr1-f46.google.com (unknown [209.85.221.46])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a806218-d925-4699-a8f3-e19cf9da2446;
 Thu, 11 Feb 2021 16:10:34 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b3so4720579wrj.5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 08:10:34 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k11sm5579507wrl.84.2021.02.11.08.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 08:10:33 -0800 (PST)
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
X-Inumbo-ID: 8a806218-d925-4699-a8f3-e19cf9da2446
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mjp+FbTudtDuZRrF+iiuCYGoLoRBGrOcp7Kk0gXLkHw=;
        b=Y4Y4nuywcsavcEalPpCnMnwVV24eNEAP1N0FaMEfgi9ra482Yu2AjaFUrGFomCxvJX
         IIBPxYlxRydNT3gKkxMLlBRDJHbczaF1aExXL0kEghmdKG5/Cv3BbjItHKqDYqvq2GPd
         M+4N8qZZl5ZugWSnXKRRmpiZFMAUGWKLmXgHVFqRoTDivNV1zYmtfg2fW1aMGNghRaa/
         z418mnMd0SwgZUEfVxgH7/hUAEvxLeS7DKcqtyTZ+KveOUtgj983TF0Ew0eZO/Eqpl7a
         3iCPA81ZhPMmnFXFN02Ky9DBNpWYz5smPKLOJTYHaf/6vuWpAo53uG9SlZB47HTwqHCZ
         MKZw==
X-Gm-Message-State: AOAM532Oqn6/RGj+nYB8Zg+JPpWrJuZcGehHW9MvPKRqtsOomAMCBtpn
	PqG0P2Qafrz0UBnRbjGxnsA=
X-Google-Smtp-Source: ABdhPJwRsRCdBtlpBHCmkuPtejn7y7ewLste/8QOFWlE2YWuCSZ+3yNtAPGyGALF8OLmPiHmGmf28w==
X-Received: by 2002:adf:f905:: with SMTP id b5mr6230692wrr.129.1613059833770;
        Thu, 11 Feb 2021 08:10:33 -0800 (PST)
Date: Thu, 11 Feb 2021 16:10:31 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.15] tools/libxl: Document where the magic MAC
 numbers come from
Message-ID: <20210211161031.2anpirmszn7nwzip@liuwe-devbox-debian-v2>
References: <20210210135335.29180-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210135335.29180-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Feb 10, 2021 at 01:53:35PM +0000, Andrew Cooper wrote:
> Matches the comment in the xl-network-configuration manpage.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

