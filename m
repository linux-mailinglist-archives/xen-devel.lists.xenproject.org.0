Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561916090B2
	for <lists+xen-devel@lfdr.de>; Sun, 23 Oct 2022 03:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428526.678710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omPm4-0005L3-Hd; Sun, 23 Oct 2022 01:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428526.678710; Sun, 23 Oct 2022 01:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omPm4-0005Hu-DO; Sun, 23 Oct 2022 01:27:36 +0000
Received: by outflank-mailman (input) for mailman id 428526;
 Sun, 23 Oct 2022 01:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FW87=2Y=gmail.com=bart.vanassche@srs-se1.protection.inumbo.net>)
 id 1omPm3-0005Ho-Me
 for xen-devel@lists.xenproject.org; Sun, 23 Oct 2022 01:27:35 +0000
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddff8fe1-5271-11ed-91b5-6bf2151ebd3b;
 Sun, 23 Oct 2022 03:27:33 +0200 (CEST)
Received: by mail-pl1-f178.google.com with SMTP id u6so5590683plq.12
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 18:27:33 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
 by smtp.gmail.com with ESMTPSA id
 ij19-20020a170902ab5300b0017f7628cbddsm17072020plb.30.2022.10.22.18.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 18:27:31 -0700 (PDT)
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
X-Inumbo-ID: ddff8fe1-5271-11ed-91b5-6bf2151ebd3b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxn8/fWqKk5uwYUJmeV2YNZEprvktpSj+qw+5kOjvoM=;
        b=v5F7p1TeJG0xXKZwebXyF2QOv1FQ/eT2ISG6/88HDpp+8nPjG7kb9dMIN5p/nFBqMB
         4b6/6jvylelSsPNJV+X0NpKmDgc0XJIf6lYIfhpb+/fxD8IT2o8iReyAvOirmsMBLPK8
         V+tMARN3Ja0RukSvWybj0st8nbB4WfkFyWPgLwuqWdZ0g2nklawAXdo7PyhRbB7pBCiZ
         gFmL51ckQU++uuzx3vqkDvqufmR01xGNTNWkqszDc59l0sH00igZuv8o0xhyylHasSuS
         WnUPB1onYyOvHXqoyyYIF0HHLFxAOT2p01xXtjcpKQjn7WqjPzvWbqsHJEdLH1nWPBSp
         KXXw==
X-Gm-Message-State: ACrzQf3H2C1LX/FnDluPIbPXFerYp2IsRfJrcvb5OIxsQJmME9KMYGw6
	JG9M9O/zOF9d0EwcSRdpBaQ=
X-Google-Smtp-Source: AMsMyM6MSB9NjdfgmovwHqQUK96cfTfpitw7tk0jtz+QWDu6K7xgPFAtY6xG/ZCfPr6Q6f+esTP33g==
X-Received: by 2002:a17:902:8544:b0:183:baae:cf8d with SMTP id d4-20020a170902854400b00183baaecf8dmr27148429plo.96.1666488451973;
        Sat, 22 Oct 2022 18:27:31 -0700 (PDT)
Message-ID: <85ad4508-b979-c792-e92b-01bc16260dec@acm.org>
Date: Sat, 22 Oct 2022 18:27:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: Report in downstream Debian: mpt3sas broken with xen dom0 with
 update to 5.10.149 in 5.10.y.
To: Salvatore Bonaccorso <carnil@debian.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, sathya.prakash@broadcom.com,
 sreekanth.reddy@broadcom.com, suganath-prabu.subramani@broadcom.com,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 MPT-FusionLinux.pdl@broadcom.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, adi@kriegisch.at,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu S <suganath-prabu.subramani@broadcom.com>
References: <Y1JkuKTjVYrOWbvm@eldamar.lan>
Content-Language: en-US
In-Reply-To: <Y1JkuKTjVYrOWbvm@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/22 02:22, Salvatore Bonaccorso wrote:
> We got the following report in Debian after an update from 5.10.140 to
> the current 5.10.149. Full quoting below (from
> https://bugs.debian.org/1022126). Does this ring some bell about known
> regressions?

Only three mpt3sas changes are new in v5.10.149 compared to v5.10.140:
$ git log --format=oneline v5.10.140..v5.10.149
2b9aba0c5d58e141e32bb1bb4c7cd91d19f075b8 scsi: mpt3sas: Fix return value check of dma_get_required_mask()
e7fafef9830c4a01e60f76e3860a9bef0262378d scsi: mpt3sas: Force PCIe scatterlist allocations to be within same 4 GB region
ea10a652ad2ae2cf3eced6f632a5c98f26727057 scsi: mpt3sas: Fix use-after-free warning

Sreekanth and Suganath, can you help with bisecting this issue? For the
full report, see also https://lore.kernel.org/linux-scsi/Y1JkuKTjVYrOWbvm@eldamar.lan/.

Thanks,

Bart.

