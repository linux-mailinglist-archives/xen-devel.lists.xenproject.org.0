Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24819CFE43
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 11:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838750.1254728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCGEB-0006wr-Bp; Sat, 16 Nov 2024 10:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838750.1254728; Sat, 16 Nov 2024 10:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCGEB-0006tM-8k; Sat, 16 Nov 2024 10:40:31 +0000
Received: by outflank-mailman (input) for mailman id 838750;
 Sat, 16 Nov 2024 10:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QYYW=SL=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1tCGEA-0006m5-1T
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 10:40:30 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30656a1c-a407-11ef-99a3-01e77a169b0f;
 Sat, 16 Nov 2024 11:40:25 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43193678216so23228235e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 16 Nov 2024 02:40:25 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da2800absm87243245e9.25.2024.11.16.02.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2024 02:40:24 -0800 (PST)
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
X-Inumbo-ID: 30656a1c-a407-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMwNjU2YTFjLWE0MDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNzUzNjI1Ljc4MzM0Miwic2VuZGVyIjoiZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731753625; x=1732358425; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSXFKM+ARjNBrckMO4jvpnEJoLVPjxN4kzAqYuwUUFc=;
        b=dP5RlQNnegl7VWiqHvJp4HnzNRMqCD5U+kpJP+VxqMEfXCXCtCElUHV7ihDgLmbNqh
         N8muxpfqM3DKNzS7R8pLzJ3/J2isy555hgKELwqfd+phdAG+Bmde3B0lucoSRwQa1Hm9
         W85Ye+WIBuIx52IGjMSeyH5HfW6+sPf0uzcQguIMpfJBURLixLpDqEWKDdaW1anPbNFE
         C5RKIncXFLlbIhSo2T6KDsZhRtcmstEWYLjea1w2q2fiISDVZPqMK7JrSACOBRZ9TNy+
         s7pho36YV7Vmzf56qLceFdzj+yOPfCE6O440jlgE6xAQerQmVtuJT5Q8CxtqX4+H93zk
         8QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731753625; x=1732358425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSXFKM+ARjNBrckMO4jvpnEJoLVPjxN4kzAqYuwUUFc=;
        b=vJo7zbwWuXc5dCtWhGxYM20Sv1FcEde/5rnEid6bsZrs1olmQg1q5Oqv4m4pCwgFEd
         c5cry+S3gmVPY/41KOsNnXQxJFu35+9aPKRdIJkMDLGf7IPWLhpWr1h2ediB4Uz5kayG
         oEagjBWb4LD48fSew4/B4l5OIGJIfNXEao9UBXgFPwo2x3NeiK61z5BSja025mR9ttiE
         wP1ctVfUgg10ACcYfOMip1QhJJeb3emcvF00x/I50U/YKQUguYMByBpVdO4boCfma525
         +PuH/LxZPkceHHVtw+EjimirydF6zUEarb4wSmvNa0BO/b5HQ2OeWY93LfKsnXyrjJ8g
         1AYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0iLQpTLLupshEMfR7F70ldwPmzwxteQFLwfn4SoJe55TAwGGLnlCHYdpy22TWimxOTpGoeGxKk+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQGPmkZpNlXX3BYA2jM39FcOrvcAIbOrgZNrdrniyCjO6sUw0S
	j211KuXxV2PgbmoI4VPR+wiGZT254I00ru3hCw5AxGeaCoq54FB3HS/JP+8tj/A=
X-Google-Smtp-Source: AGHT+IH8fBA+4s5F3P6X/kjn5LT5A4plOne9CKmDoZ8QUK+uLzjM3K0QAglApJbsapoZYtb9Ft2RHQ==
X-Received: by 2002:a05:600c:1d1c:b0:431:4e82:ffa6 with SMTP id 5b1f17b1804b1-432df78c5b5mr46184285e9.24.1731753625076;
        Sat, 16 Nov 2024 02:40:25 -0800 (PST)
Date: Sat, 16 Nov 2024 13:40:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Louis Peens <louis.peens@corigine.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
	oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 05/21] powerpc/papr_scm: Convert timeouts to
 secs_to_jiffies()
Message-ID: <e4872a15-ff3d-4619-9b03-c7f0b6230934@stanley.mountain>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-5-911fb7595e79@linux.microsoft.com>
 <b6a059d8-7b23-455d-9ecd-eb3cdddd22a2@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6a059d8-7b23-455d-9ecd-eb3cdddd22a2@csgroup.eu>

On Sat, Nov 16, 2024 at 11:06:55AM +0100, Christophe Leroy wrote:
> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> > index 9e297f88adc5d97d4dc7b267b0bfebd58e5cf193..9e8086ec66e0f0e555ac27933854c06cfcf91a04 100644
> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> > @@ -543,7 +543,7 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
> > 
> >          /* Jiffies offset for which the health data is assumed to be same */
> >          cache_timeout = p->lasthealth_jiffies +
> > -               msecs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL * 1000);
> > +               secs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL);
> 
> Wouldn't it now fit on a single line ?
> 

Some maintainers still prefer to put a line break at 80 characters.  It's kind
of a nightmare for an automated script like this to figure out everyone's
preferences.  In this particular file, there are some lines which go over 80
characters so sure.  Earlier in the patchset one of these introduced a line
break that wasn't there before so I think maybe Coccinelle is applying the 80
character line break rule?

There are sometimes where the 80 character rule really hurts readability, but
here it doesn't make any difference.

regards,
dan carpenter


