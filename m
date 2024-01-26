Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285C683D46E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 08:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671866.1045380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTGkn-0004eb-97; Fri, 26 Jan 2024 07:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671866.1045380; Fri, 26 Jan 2024 07:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTGkn-0004c1-6O; Fri, 26 Jan 2024 07:35:57 +0000
Received: by outflank-mailman (input) for mailman id 671866;
 Fri, 26 Jan 2024 07:35:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QK5s=JE=gmail.com=morel.dav@srs-se1.protection.inumbo.net>)
 id 1rTGkl-0004bv-IS
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 07:35:55 +0000
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 894b1373-bc1d-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 08:35:54 +0100 (CET)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40eacb4bfa0so926355e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 23:35:54 -0800 (PST)
Received: from raton (lfbn-idf1-1-1403-15.w90-79.abo.wanadoo.fr. [90.79.94.15])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c155300b0040e541ddcb1sm1011930wmg.33.2024.01.25.23.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 23:35:52 -0800 (PST)
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
X-Inumbo-ID: 894b1373-bc1d-11ee-8a43-1f161083a0e0
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706254553; x=1706859353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlX/IquZyKvuHc90dtJQTcywuIx0rC9GleofrUB3ERE=;
        b=avp0OlObR5q3lDnzS0Xwh+AxGeYKkz3pZM9SQUXsojWM7wiErLOl79QZHWc8ohkf2r
         OiRn8OpviQWEagwwVRJjFRqod2luHM671Zu8hDI6le5vM6Ijtm6kNtCrfYaNDbGoMLRK
         r3+7YzOfHnWul+vbISHpensfKoJUSK/Znk+afY5HPF/cdsIObEDQZmXhKeR/iSq0QN6Y
         AFpocMCvczco4z4+DTSYxzdjcVV9tf8wVtlA0ot4p/EOQtRgvQ5404F1eaCyvP32Kme5
         doBYdd30oTx45aSiwmI3XO3o5w0hYuO0dBpWKTL5hV3Q/8TD0BjJoZ+ohcNzbDvSvOcU
         YeQA==
X-Gm-Message-State: AOJu0YwdDLENW7lzlydnSni1cGVN5YzS40rUlBXcuo0PlTKeW+quFDa7
	zUGkb1o0iA9EMboLCeW+v7AuXQOBpn4fbrt2j5ORomi9+KJR1jQD
X-Google-Smtp-Source: AGHT+IGsicAVDzancTWhHu3jwViqgfcfo6UCMJ21r5H9iBZUP9BtQXy9WkmoPBdwg0QU6wFnIv7vUw==
X-Received: by 2002:a05:600c:20d5:b0:40e:4694:38a6 with SMTP id y21-20020a05600c20d500b0040e469438a6mr542748wmm.157.1706254553208;
        Thu, 25 Jan 2024 23:35:53 -0800 (PST)
Date: Fri, 26 Jan 2024 08:35:45 +0100
From: David Morel <david.morel@vates.tech>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, xenia.ragiadakou@amd.com,
	andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: AMD EPYC VM to VM performance investigation
Message-ID: <ZbNg0VHjHM98pPgh@raton>
References: <ZZbSIH_pGjaQr5x-@raton>
 <alpine.DEB.2.22.394.2401041624500.1322202@ubuntu-linux-20-04-desktop>
 <ZZ5vkr0Qx0h_iO5D@raton>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZ5vkr0Qx0h_iO5D@raton>

On Wed, Jan 10, 2024 at 11:21:06AM, David Morel wrote:
> > I think it might be difficult to triage this if you are working on a
> > Xen/Linux version that is so different from upstream
> I ran some tests on a Xen 4.13.5 with a dom0 in 6.6.10, and on an XCP-ng on
> the same machine, the performances are similar, a few percent better on
> the recent Xen, but still pretty low for such a machine and similar to
> other EPYC we looked at.
I only recently went over my message and realized I typed the XCP-ng
version out of the habit... The test I was talking about was actually on
a Xen 4.17.3, so recent Xen and recent kernel. Sorry about that.

