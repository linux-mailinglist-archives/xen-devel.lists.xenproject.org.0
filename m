Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1927D3B0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 18:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304.833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNIX5-0007zW-P0; Tue, 29 Sep 2020 16:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304.833; Tue, 29 Sep 2020 16:31:15 +0000
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
	id 1kNIX5-0007z7-L6; Tue, 29 Sep 2020 16:31:15 +0000
Received: by outflank-mailman (input) for mailman id 304;
 Tue, 29 Sep 2020 16:31:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNIX3-0007yz-Tl
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 16:31:14 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f79627b9-dd04-4e88-8a98-40a5cdbe5121;
 Tue, 29 Sep 2020 16:31:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y15so5493556wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 09:31:12 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id h186sm6176794wmf.24.2020.09.29.09.31.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 09:31:11 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNIX3-0007yz-Tl
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 16:31:14 +0000
X-Inumbo-ID: f79627b9-dd04-4e88-8a98-40a5cdbe5121
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f79627b9-dd04-4e88-8a98-40a5cdbe5121;
	Tue, 29 Sep 2020 16:31:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y15so5493556wmi.0
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=NqcMZ1Qw+t0dZuRTDMD0W1KWCugzT7/qiUo3EdVh740=;
        b=JUxcafBO+9oovu4n3mfgqjoFgrN6oGBZ26zsUQhLJm7SrY9vBgPwybNbejSY8vrFX0
         gzhWeTh+JbDRhDFaQSb3EVu0mtf2Mx7KXGKMs6QEdVAWHQDP2U8wLxv12MtYv6mQaSME
         bmMvMMWheO3xzg/6RFRHogVzdHYlJBv/ZJrqVX09lah16rQw8kKuz1jS1aiAT3kfEF3y
         OCQLhy/YOlcBtECmEz0d0F91sb9vzoTYr2hPaKZtEkENZHDopv/saL+Z4eMpFjl8sy13
         R6VflcMyIE2mc616IC6LJLYXIP/G2ZX5jTRK09VoEZb0MrC2rz/dRMOwG+e6B9lOGVk8
         tajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=NqcMZ1Qw+t0dZuRTDMD0W1KWCugzT7/qiUo3EdVh740=;
        b=AmwNKTcshl68OGGlLU0yaVIzgBgMqt8qehCUJPg3tMfXE0GAXAlJ22IVqWwKRcuPcM
         KrUQlX76c+PUfp35QlNffJp3nvE96LClR+mYtzZ4sARdiZHZSs+ot3vIUiXG4pUmnCW6
         82YvXmmq29I9MsM9FtmxUUJP7hVv3ofKXJLpEgk7aGgIW/ghdqdkxZwF5+x+in8qtWcE
         oUhGiZcbIu3vzKeRVBr64bdrV1jj4+TppBduDV/BrTM9nh6DNDQhTp8uMtDLAEH0hM24
         E7XhybRgB/uq+wXufGsct082Ct+zH0T8DwfDbRJrtRBBU3JXGZScegEcYUln77u770F+
         ZV+A==
X-Gm-Message-State: AOAM533wxCkjc5XFRbSR74VgYvfar0ab8t+q1oafFN6DfYTi8br2IqyR
	gPqnxQRzfwX1EOLqrQHwRho=
X-Google-Smtp-Source: ABdhPJxvxbpVjZPs+e1ELeKZAJSXgK6ZuwiWbhI7rJnkAggIV+6YdFMncgWG7AWGGU5NsqLLT1aTqA==
X-Received: by 2002:a1c:cc0a:: with SMTP id h10mr5172486wmb.80.1601397072101;
        Tue, 29 Sep 2020 09:31:12 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
        by smtp.gmail.com with ESMTPSA id h186sm6176794wmf.24.2020.09.29.09.31.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 09:31:11 -0700 (PDT)
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
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
In-Reply-To: <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
Subject: RE: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
Date: Tue, 29 Sep 2020 17:31:09 +0100
Message-ID: <002301d6967d$f0fc18e0$d2f44aa0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgH3Y/QXqTf5K2A=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 11:58
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
> 
> evtchn_fifo_set_pending() (invoked with the per-channel lock held) has
> two uses of the channel's priority field.

AFAICT it is invoked with only the sending end's lock held...

> The field gets updated by
> evtchn_fifo_set_priority() with only the per-domain event_lock held,
> i.e. the two reads may observe two different values. While the 2nd use
> could - afaict - in principle be replaced by q->priority, I think
> evtchn_set_priority() should acquire the per-channel lock in any event.
> 

... so how is this going to help?

  Paul

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1132,7 +1132,9 @@ static long evtchn_set_priority(const st
>  {
>      struct domain *d = current->domain;
>      unsigned int port = set_priority->port;
> +    struct evtchn *chn;
>      long ret;
> +    unsigned long flags;
> 
>      spin_lock(&d->event_lock);
> 
> @@ -1142,8 +1144,10 @@ static long evtchn_set_priority(const st
>          return -EINVAL;
>      }
> 
> -    ret = evtchn_port_set_priority(d, evtchn_from_port(d, port),
> -                                   set_priority->priority);
> +    chn = evtchn_from_port(d, port);
> +    spin_lock_irqsave(&chn->lock, flags);
> +    ret = evtchn_port_set_priority(d, chn, set_priority->priority);
> +    spin_unlock_irqrestore(&chn->lock, flags);
> 
>      spin_unlock(&d->event_lock);
> 
> 



