Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFB62B04CF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 13:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25754.53724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdBUy-0007KI-He; Thu, 12 Nov 2020 12:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25754.53724; Thu, 12 Nov 2020 12:14:44 +0000
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
	id 1kdBUy-0007Jt-EE; Thu, 12 Nov 2020 12:14:44 +0000
Received: by outflank-mailman (input) for mailman id 25754;
 Thu, 12 Nov 2020 12:14:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCk2=ES=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kdBUx-0007Jo-IM
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:14:43 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1db68c24-a6eb-4e17-9281-ceddc30c2aac;
 Thu, 12 Nov 2020 12:14:42 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id c16so5307332wmd.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2020 04:14:42 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id p12sm6503968wrw.28.2020.11.12.04.14.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 04:14:41 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PCk2=ES=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kdBUx-0007Jo-IM
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:14:43 +0000
X-Inumbo-ID: 1db68c24-a6eb-4e17-9281-ceddc30c2aac
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1db68c24-a6eb-4e17-9281-ceddc30c2aac;
	Thu, 12 Nov 2020 12:14:42 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id c16so5307332wmd.2
        for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2020 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=8gKvgTUq7aERno8X4hu3TUb6HJz/We0kzcdYXJnLv4A=;
        b=MPlm1XobuUv47pgRn5B5nADpNNRWf+wZKcZQfb0VZmnFa05L9xB7SLVqCC3s7uqHd8
         8GZlmafSIiH0/wX7MmTgl2rsRfVSTKgqLBNnTJKF17kxyVCObmdRSTpr8qcsm+c7lwu2
         uw/3iMI1uxrTasOo+tj50PypYKrmGo+PSbzykCAoFtZcFgNX+mNk/j66zkcwkEWagSCI
         fxYrx2hYu/+u0GER7XQdEJ0tQyziYMsq++7aNUA69k/yt/f78Dv7Jb60+Ti42/4O9Xmo
         IHYv2jU47M+x1u1i2ZOywiqeUGO6ZJLOJ/qBinnGgPthlk299Rl9pklVXJ8/i1Gv36lQ
         y/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=8gKvgTUq7aERno8X4hu3TUb6HJz/We0kzcdYXJnLv4A=;
        b=tufPTovLlCDtW015gkgfnVyj6l/o5t9slWGYIDR5Dpcveqze/AGdJ8kcM/NJa+qvfd
         dDGoxZEebsUYsFOhRS3p0QsAujuokbSGi9XZxhq8iXLcwxZpRVF7TNk9Oa17CcidtXZB
         QKBNc9gTkz2yjDvRSJsIjRpu+vLZ61pl3C3qXecpNzsezpYP+7Fb4HibII0ldT+zOg72
         N6Q5DhSvS1k8+ui6O4lGdCS8ZRiMiA0lDNlpEr7V1Dk0Kpam/Bdlbixe+hG0TsTd0+es
         gVje0oN9iQ7sE4kDGL+As/nbXMQ38k8TRiJRSJ8nwl75tsnuRvg7AzpR1/r7qAIzRm1e
         0x5w==
X-Gm-Message-State: AOAM5322TalKMW2o/qu0qKn0/VKPUQPC4jKh/zYobiLmv7KKlqNdEQXP
	7NxXBEfcV/ZN3eGmoFY9t9U=
X-Google-Smtp-Source: ABdhPJyLBbTgVW3PpMXhd7hyZvYTE6/gltc8GRmoaUR0t1uErm+ORstyVH5rxKM3yPH0j5GG7h512A==
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr9141560wmf.47.1605183281976;
        Thu, 12 Nov 2020 04:14:41 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
        by smtp.gmail.com with ESMTPSA id p12sm6503968wrw.28.2020.11.12.04.14.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2020 04:14:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Oleksandr Tyshchenko'" <olekstysh@gmail.com>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Julien Grall'" <julien.grall@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-13-git-send-email-olekstysh@gmail.com> <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
In-Reply-To: <e3064b77-71c3-9d8d-2324-6839895101f4@suse.com>
Subject: RE: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved function names
Date: Thu, 12 Nov 2020 12:14:40 -0000
Message-ID: <004801d6b8ed$6620e4c0$3262ae40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAHGHN6+A53Zm3aqcWt+kA==
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 12 November 2020 11:45
> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant =
<paul@xen.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; =
George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Julien =
Grall <julien@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Jun Nakajima =
<jun.nakajima@intel.com>; Kevin Tian
> <kevin.tian@intel.com>; Julien Grall <julien.grall@arm.com>; =
xen-devel@lists.xenproject.org
> Subject: Re: [PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from =
involved function names
>=20
> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > This patch removes "hvm" prefixes and infixes from IOREQ
> > related function names in the common code.
>=20
> AT least some of the functions touched here would be nice to be
> moved to a more consistent new naming scheme right away, to
> avoid having to touch all the same places again. I guess ioreq
> server functions would be nice to all start with ioreq_server_
> and ioreq functions to all start with ioreq_. E.g. ioreq_send()
> and ioreq_server_select().
>=20
> Paul, thoughts?
>=20

Yes, that sounds like a good idea. Obviously the code has grown a little =
organically so some naming cleanup is welcome.

  Paul

> Jan


