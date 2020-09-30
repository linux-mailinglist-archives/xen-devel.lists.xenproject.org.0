Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C328927E2B3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 09:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.455.1421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNWdp-0005yH-Ie; Wed, 30 Sep 2020 07:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455.1421; Wed, 30 Sep 2020 07:35:09 +0000
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
	id 1kNWdp-0005xs-FW; Wed, 30 Sep 2020 07:35:09 +0000
Received: by outflank-mailman (input) for mailman id 455;
 Wed, 30 Sep 2020 07:35:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNWdo-0005xn-Lb
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:35:08 +0000
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a6a4086-27fc-4106-9d29-398e1407fa3f;
 Wed, 30 Sep 2020 07:35:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k18so586233wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 00:35:07 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id f16sm1347270wrp.47.2020.09.30.00.35.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 00:35:06 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNWdo-0005xn-Lb
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:35:08 +0000
X-Inumbo-ID: 1a6a4086-27fc-4106-9d29-398e1407fa3f
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1a6a4086-27fc-4106-9d29-398e1407fa3f;
	Wed, 30 Sep 2020 07:35:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k18so586233wmj.5
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=3ywFpwHJMPTKBX9+Vp1+Xj+rLy00yMFcoHjmCv7p+KY=;
        b=CxKiaB42DQ0L26qtwa7PWxKfoxYBnvS2MxXMRTP7TflQY/CJ8D7lEJ9fwzsurgUG0P
         CDgPqAqKPwthQQrg4wT1kiSy448LUQdNADbFR/+xIH0S0VvufY4QBHmXq7fWMtjsUKfa
         e/oXsySRSbWJbTo95h+A3luOYQhRYy6QJa08DN7LnMWYGqOYtt0BR2JMRYN8WAd896Wj
         5oxzf1yKmIWbSVIKTmwo0c+W7KvL2DJgT2hf6N1cN8f/QmPTi/75V+RGX1tPPv2OtRCH
         3JF3ZyV0dmnkP9e8DuXb5STsFjWd+SIaZhV0/yjsYRIK4haJjBbNRmLvhS7mBMyA5bXI
         QvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=3ywFpwHJMPTKBX9+Vp1+Xj+rLy00yMFcoHjmCv7p+KY=;
        b=nhmHawUYiyfeKgTJUfUdoPsxkJRtkH9TdNt+LTEDRmcTEc6+xMDfQcH4DBLoGSu3VJ
         eGn2kGx4PeS7+ez8Nv633isjCysR+6gdNpqo5+I93qy7fKh3UJAmmomZqZCV0EpBlOBa
         DpMkrecjpMpWNYn88F/MOOcgqEdM/TSjjZS94G+fVSVogESK86z1p8Av2zmfk2hsM89e
         D/e4s9VXrCbloFKgcGbDgbr/rALI5v5ZfZpFmO2IvnJzJNxZhms3mgt5AkwuXKwSDSzC
         CEXo7d461dKGW10FdkeOlJnI0Qa/1j045rf8yBTMFcbY7+77WEM/BU9NqWOnvtGSfgw5
         wD1Q==
X-Gm-Message-State: AOAM531yCXltHC7ADOsNCF5pbftK3AuByY/amuNl84OYu6gbDDxvPBSY
	Q/Mn0CqGJjUhjJvKvDGzKsc=
X-Google-Smtp-Source: ABdhPJwczDwlpMMdkZgCacEaxWYXFvEDdD8Ipe/QVJq5kYCeKCfMmAxLOIXxizlHRBVCu7A1y+ZXOg==
X-Received: by 2002:a1c:2cc4:: with SMTP id s187mr1488091wms.30.1601451307119;
        Wed, 30 Sep 2020 00:35:07 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id f16sm1347270wrp.47.2020.09.30.00.35.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 00:35:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <ff4c9cc4-c642-2f51-da36-c9883ab65e61@suse.com>
In-Reply-To: <ff4c9cc4-c642-2f51-da36-c9883ab65e61@suse.com>
Subject: RE: [PATCH 10/12] evtchn/fifo: use stable fields when recording "last queue" information
Date: Wed, 30 Sep 2020 08:35:05 +0100
Message-ID: <004501d696fc$37c969c0$a75c3d40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgLG8CiyqTGQdtA=



> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 12:02
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 10/12] evtchn/fifo: use stable fields when recording "last queue" information
> 
> Both evtchn->priority and evtchn->notify_vcpu_id could, prior to recent
> locking adjustments, change behind the back of
> evtchn_fifo_set_pending(). Neither the queue's priority nor the vCPU's
> vcpu_id fields have similar properties, so they seem better suited for
> the purpose. In particular they reflect the respective evtchn fields'
> values at the time they were used to determine queue and vCPU.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

I think these changes make the code clearer anyway.

Reviewed-by: Paul Durrant <paul@xen.org>

> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -246,8 +246,8 @@ static void evtchn_fifo_set_pending(stru
>          /* Moved to a different queue? */
>          if ( old_q != q )
>          {
> -            evtchn->last_vcpu_id = evtchn->notify_vcpu_id;
> -            evtchn->last_priority = evtchn->priority;
> +            evtchn->last_vcpu_id = v->vcpu_id;
> +            evtchn->last_priority = q->priority;
> 
>              spin_unlock_irqrestore(&old_q->lock, flags);
>              spin_lock_irqsave(&q->lock, flags);
> 



