Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE527E3EA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:38:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.490.1569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXcn-0004Yx-2D; Wed, 30 Sep 2020 08:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490.1569; Wed, 30 Sep 2020 08:38:09 +0000
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
	id 1kNXcm-0004YW-V2; Wed, 30 Sep 2020 08:38:08 +0000
Received: by outflank-mailman (input) for mailman id 490;
 Wed, 30 Sep 2020 08:38:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNXck-0004YO-TU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:38:06 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a37d56db-1f22-44a7-beaa-9e59eb985c00;
 Wed, 30 Sep 2020 08:38:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id s13so755774wmh.4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:38:05 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id o4sm1668903wru.55.2020.09.30.01.38.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 01:38:04 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNXck-0004YO-TU
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:38:06 +0000
X-Inumbo-ID: a37d56db-1f22-44a7-beaa-9e59eb985c00
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a37d56db-1f22-44a7-beaa-9e59eb985c00;
	Wed, 30 Sep 2020 08:38:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id s13so755774wmh.4
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=8zgyNxC9bCWcYFeLXMwfVk81Q2ucwjIx5m9A4HBqwxY=;
        b=GkQ3vFgy/okJDNYzR8DnsPNFmQ30LFkMNpiPVG8h0m1JqgqqH+TVcS0J2N1+Ko1SKX
         db2vRX5f6xSqUAiikEyMeAdJPOFTtTZP+Bo54LVnfCgUGgRwDCapUGaYWnbJOyyb4UM9
         pRKnLyBeBhMVfthOYwGAetLsYnYRB1pnohRnvEJms2jcCVAQToXc7W82c754GdS9+w6f
         w1Zil/rqawres68UY3HIAhh1excrPvzrHRJ4sspT0bfu9mK8Qf+ayu1egAtQuqZic1ox
         9RJFx9xMCNMPpfn83aqL7bhMa37YqvWHr2/VgasWE6uSPuN554r5bRs+zs9o9V8ZV9Pf
         L/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=8zgyNxC9bCWcYFeLXMwfVk81Q2ucwjIx5m9A4HBqwxY=;
        b=B1SLfhppJAGFBIeNMMfmF/OiLFr/vYnz1AWMhmdo6qxRJk2f6EQhyBOIyGqAoMMESp
         4aUYN3gJo2mdNXGrH7UR2XU1JUKC2AIlYlzxTUo3v8gN6RGMgjjiZADy18Z9lTx39ZZU
         qxfaIUX3xVRVAXmOD+Fqhia5JDujcJgt1FQ362BMZGndQp67Gsb45eZZIn4QdKAmEDXM
         PB3MgUxHPkqAC3FYst08CLmy2qe0IcP8tIZJ9h/Toq75l46TmwP+MRifK5Oylh7eocNJ
         /fSFdiDHEhJLzC/ofTFHkh/OFpId/j8uwaJgS+gOQv4Hr3ZsjcPbIdSYJgfvz8ZFYrFq
         Olnw==
X-Gm-Message-State: AOAM532DsXh+LPohvsQt4CFe9EFsFSDGVUsUJsP3c1vjow9K6UgH2o+o
	sBR9aMT/BJxmUnmG4adetsY=
X-Google-Smtp-Source: ABdhPJx62Pfd+08VcmbwlRC2ewSCaTiiaQUiLqhhWbkFTyuCGKrYldbj0ZmmhHffhHrfVbk5kkNhsA==
X-Received: by 2002:a1c:9d82:: with SMTP id g124mr433465wme.4.1601455084971;
        Wed, 30 Sep 2020 01:38:04 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id o4sm1668903wru.55.2020.09.30.01.38.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 01:38:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <ff4c9cc4-c642-2f51-da36-c9883ab65e61@suse.com> <004501d696fc$37c969c0$a75c3d40$@xen.org> <2514b083-8f70-3898-eedb-88419c6f1d63@suse.com>
In-Reply-To: <2514b083-8f70-3898-eedb-88419c6f1d63@suse.com>
Subject: RE: [PATCH 10/12] evtchn/fifo: use stable fields when recording "last queue" information
Date: Wed, 30 Sep 2020 09:38:03 +0100
Message-ID: <006201d69705$038d9790$0aa8c6b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgLG8CiyAeDVmyICds5PAqkP1a2w

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 30 September 2020 09:35
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap'
> <George.Dunlap@eu.citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Julien Grall' <julien@xen.org>;
> 'Wei Liu' <wl@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>
> Subject: Re: [PATCH 10/12] evtchn/fifo: use stable fields when recording "last queue" information
> 
> On 30.09.2020 09:35, Paul Durrant wrote:
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> >> Sent: 28 September 2020 12:02
> >>
> >> Both evtchn->priority and evtchn->notify_vcpu_id could, prior to recent
> >> locking adjustments, change behind the back of
> >> evtchn_fifo_set_pending(). Neither the queue's priority nor the vCPU's
> >> vcpu_id fields have similar properties, so they seem better suited for
> >> the purpose. In particular they reflect the respective evtchn fields'
> >> values at the time they were used to determine queue and vCPU.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > I think these changes make the code clearer anyway.
> >
> > Reviewed-by: Paul Durrant <paul@xen.org>
> 
> Thanks. With the change of description in the earlier patch, and with
> this one possibly going in ahead of it, I'll massage the description
> here somewhat, I guess.
> 

That's fine.

  Paul


