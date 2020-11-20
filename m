Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D7B2BAECE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 16:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32360.63389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8Gg-0000D4-AZ; Fri, 20 Nov 2020 15:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32360.63389; Fri, 20 Nov 2020 15:24:10 +0000
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
	id 1kg8Gg-0000Cf-7c; Fri, 20 Nov 2020 15:24:10 +0000
Received: by outflank-mailman (input) for mailman id 32360;
 Fri, 20 Nov 2020 15:24:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50fm=E2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kg8Ge-0000Ca-FF
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:24:08 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5cdac81-4685-430d-93f7-b3a546f37dce;
 Fri, 20 Nov 2020 15:24:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 23so10391566wrc.8
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2020 07:24:07 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id h15sm5484176wrw.15.2020.11.20.07.24.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:24:06 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=50fm=E2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kg8Ge-0000Ca-FF
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:24:08 +0000
X-Inumbo-ID: e5cdac81-4685-430d-93f7-b3a546f37dce
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e5cdac81-4685-430d-93f7-b3a546f37dce;
	Fri, 20 Nov 2020 15:24:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id 23so10391566wrc.8
        for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2020 07:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=XAQmQ3Q7smbXJ1DTvhlKedyyiFZtmtXTAwVefAdZfSE=;
        b=dzFzOzxqKI6twcvA7aLBc+OkJ1SgayREYuGqMV5/Ygn0f8omdmzMtR4IltXySM2lYu
         Lqwc057CAjGV074bv1dylaH+rbc3XkyQnvE4RnQFH5M5s2UiraHLWNARkSqD68XF5tV9
         4SljL2d3GofHNEnyQnNuUMF1DrhE+bnAaE/6a4MVBCY6zSzjVWPHcbiT0ESvsyXtrUOs
         h4Ed0FA8Ws0RJ/r73K86NJ+ngSmDnwS8oM3tKDMrOEO8ue0jYYJigcXZXcpKd1VHFWVf
         8bsCYqTxhgJHctD82Gwy0yK1U0z9rrd1GCckudgcBpPPQ3SEtj9O7mbnaieyF6Wxm4Xj
         w1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=XAQmQ3Q7smbXJ1DTvhlKedyyiFZtmtXTAwVefAdZfSE=;
        b=rXQneD3qgn1iIxC2orj+hlkLh1XQf/2oZ44aDoOkMrq1mL8nelfh1oBtOkv2P0lAVW
         lUoxwN0cv6devYWI8Xvcj0PQxRu/YV06ncKFsOr4v5oBnpQumRGWxZrGGPK5Q+oeNsHq
         8MQ2Zms+K40PHStlCPYhHa1rb3ltf+U/QQ9C78rYSksQGKDfJEGwJtFCElyAF9dSeqFs
         hTzBtKeWkx32mixEnCUwx8Onhq1hEVM+ddHgmSz9N9rQ5Dutr8i+Gtlop9wBKRqO9woZ
         59fA3pRblMfT5xSO0qgUOIVxua3WaMgouTY6wXhSf0GpGrg8vSgND1r2J50fbzO7mENP
         Mzzg==
X-Gm-Message-State: AOAM531/99Fq3EP1y3cjYY8CcDUIh4tUt2BH5DxTIlpFXvdRBwLrdJm8
	7OnNSL3+TQT682Je8RqaduI=
X-Google-Smtp-Source: ABdhPJyojglFDa60Ra+LaMqcK5ghmkUxPz4JsGD4kAZt8AwwEF6KWynm9KOwj8SYIFwMlM4Bwj4QRQ==
X-Received: by 2002:adf:f3c4:: with SMTP id g4mr16988826wrp.399.1605885846829;
        Fri, 20 Nov 2020 07:24:06 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id h15sm5484176wrw.15.2020.11.20.07.24.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2020 07:24:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20201120094900.1489-1-paul@xen.org> <20201120094900.1489-8-paul@xen.org> <8ea259ed-0ebb-f0fb-9be1-cd0271a25bd4@suse.com>
In-Reply-To: <8ea259ed-0ebb-f0fb-9be1-cd0271a25bd4@suse.com>
Subject: RE: [PATCH v2 07/12] xen/include: import sizeof_field() macro from Linux stddef.h
Date: Fri, 20 Nov 2020 15:24:05 -0000
Message-ID: <010201d6bf51$2f6bf9f0$8e43edd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH2MKAKjLdIZTWPg9fOgT90SKBicQJG9BIUAuuzCmapaKsU8A==

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 20 November 2020 15:16
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH v2 07/12] xen/include: import sizeof_field() macro from Linux stddef.h
> 
> On 20.11.2020 10:48, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Co-locate it with the definition of offsetof() (since this is also in stddef.h
> > in the Linux kernel source). This macro will be needed in a subsequent patch.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> You don't fancy replacing in the tree what is now effectively
> open-coding this construct, I guess? I'll try to remember to
> do so once this has gone in...
> 

I'll see what I can find after this series is in, unless you get there first :-)

  Paul


