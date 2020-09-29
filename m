Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E230127D2EC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.286.761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHie-0001vl-At; Tue, 29 Sep 2020 15:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286.761; Tue, 29 Sep 2020 15:39:08 +0000
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
	id 1kNHie-0001vM-7e; Tue, 29 Sep 2020 15:39:08 +0000
Received: by outflank-mailman (input) for mailman id 286;
 Tue, 29 Sep 2020 15:39:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNHic-0001vF-9s
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:39:06 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e432dde8-8cdc-44df-8623-9fd1b18c2fa3;
 Tue, 29 Sep 2020 15:39:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z4so5953783wrr.4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 08:39:05 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id h17sm6939300wro.27.2020.09.29.08.39.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 08:39:04 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNHic-0001vF-9s
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:39:06 +0000
X-Inumbo-ID: e432dde8-8cdc-44df-8623-9fd1b18c2fa3
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e432dde8-8cdc-44df-8623-9fd1b18c2fa3;
	Tue, 29 Sep 2020 15:39:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z4so5953783wrr.4
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=x23F79DTOTS9yhFANy0A3w5uo1aOZv2Tizn+Ye4IFhY=;
        b=uJZw7EzpPH1eKEvFWAo2pIs4bnwXPkQ6BiXxSuuuVq4+pRKaCSZofpkpF3b4U7n+v1
         lkZA+NV7A6alGx3W+1U6DjhhPdBz03r0LSh+EHt8Nn2qXEmZqfnQloo2MYqRrtDoCYv8
         b6Jr5xSZYZaVU+Le4oItQTrubnVFTBNwNTZ/pdM+fDvXcBRjgF2I3a1SYcF5VKlQJUL2
         bx5hwp5zS15IoFYC08saftYB388bUTWVp6WxlK5pOTPA94cukXO6zpGEW4gfdOJauMkS
         0WMIj62e066LjaE0DyBO8x6t3k7Q+Z6rs74SRwWVkcyIlAV0eOWSOZxxfWaeZfS1V1wp
         jQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=x23F79DTOTS9yhFANy0A3w5uo1aOZv2Tizn+Ye4IFhY=;
        b=bb/C9gEUDyexSNAg+D7guSfAtBWsgXwXKf5E6JcR7fbjrcI2sgvUeZHqngEsJwjmS+
         hsF4Wy50pAAbiB3EBpr/k6DvECbLvcJn4wMjXs9fh+ba0PHPmvOBgEeaOAKrWCFyi+sb
         vHMUPbBTDRMtAeFBF3qBUoYOSUcumL3O0P1IV+ZlGULT5j/judgiDOIjGqIAC0fZsj89
         u3JCOPHxdWZ6H476jsaCqzgMFBntCkYCrfXAQZsIXGkNJeDbJZD2s2l8KceCy8KkPJrj
         RS8V7E62ZUN39wDmxdm8sa5oJf2/DI1ufjYwRKefO+fRP3D+JOV7v2emMlhNnrzYKf+n
         oMtg==
X-Gm-Message-State: AOAM531Cehjzl/n568r+gsd1qRKHZ3edXD3oYenDoO1KW6sTHFJfiz+X
	AEf+eXNGw53MDPdZ/ppe2Cw=
X-Google-Smtp-Source: ABdhPJyn4fnivZcdFTRHMuDGXORWRohyn03N0zD8NDurehKqXTlHL6ZOF+/tM2TMbK4xB1Ky+WQYSw==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr5021338wru.30.1601393944793;
        Tue, 29 Sep 2020 08:39:04 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
        by smtp.gmail.com with ESMTPSA id h17sm6939300wro.27.2020.09.29.08.39.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 08:39:04 -0700 (PDT)
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
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <e7331fa6-e557-4319-6137-2c2525f78822@suse.com>
In-Reply-To: <e7331fa6-e557-4319-6137-2c2525f78822@suse.com>
Subject: RE: [PATCH 01/12] evtchn: refuse EVTCHNOP_status for Xen-bound event channels
Date: Tue, 29 Sep 2020 16:39:03 +0100
Message-ID: <001e01d69676$a91ff700$fb5fe500$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgIMxSdDqTdHBAA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 11:56
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 01/12] evtchn: refuse EVTCHNOP_status for Xen-bound event channels
> 
> Callers have no business knowing the state of the Xen end of an event
> channel.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Reviewed-by: Paul Durrant <Paul@xen.org>

> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -933,6 +933,11 @@ int evtchn_status(evtchn_status_t *statu
>      }
> 
>      chn = evtchn_from_port(d, port);
> +    if ( consumer_is_xen(chn) )
> +    {
> +        rc = -EACCES;
> +        goto out;
> +    }
> 
>      rc = xsm_evtchn_status(XSM_TARGET, d, chn);
>      if ( rc )
> 



