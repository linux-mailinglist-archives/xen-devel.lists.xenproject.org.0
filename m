Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3016B9859
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:53:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509698.785972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc61u-00050a-2K; Tue, 14 Mar 2023 14:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509698.785972; Tue, 14 Mar 2023 14:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc61t-0004xW-VH; Tue, 14 Mar 2023 14:53:33 +0000
Received: by outflank-mailman (input) for mailman id 509698;
 Tue, 14 Mar 2023 14:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxk=7G=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pc61r-0004xO-Pu
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:53:31 +0000
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb319b85-c277-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:53:29 +0100 (CET)
Received: from [92.76.123.191] ([92.76.123.191]) by web-mail.web.de
 (3c-app-webde-bap40.server.lan [172.19.172.40]) (via HTTP); Tue, 14 Mar
 2023 15:53:28 +0100
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
X-Inumbo-ID: fb319b85-c277-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678805608; i=tachyon_gun@web.de;
	bh=pqmhxqcB7OZSgu9FFiPp1jafnwlDTsMLG0t9qu28748=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PQKJz8UYFBz/BpIIQSi6BZlVEJyxYc+2RqF79D2FrlbylnH9KQJfZK8Taf3rjHN2A
	 sFEaiYB8zV94OANNNB3iJswnBUFglsWSz7z3A6bBbsiWEIcpwtENm8RDHqJJqjxnGg
	 Ubhi6rPvWmRHJJ4SVVoTZ9ScnhyllTqfEFdKkaSiDNlWIHRcEpmH3bqg4se8t5PSqP
	 EjACecci8QNM023UhuK3G7CBY6Ht/nuIL3cIjHWsH0ofue6wI4vwVroCoXc9jPpKJB
	 lz0NNzwtpbVJSmJABOT8GUWVgBaE1LXW3+dUVb9Q72uXc8qCgGs+etRd6jT979oohx
	 VFpFOto0NITNw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
From: Denis <tachyon_gun@web.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Aw: Re:  Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression
 from Xen 4.0.1
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Mar 2023 15:53:28 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Vs80Fy7JB1bBrIDcH4Cz49P9w2JTS59M/0QbqDP1g0vu2Bkpj5RUzzRTft9F8MnQEIuNG
 xvJn3NEEmTUnDrTTrmhMfwP7DjW09wztkxNQyCujokVuIlADu/7zU1eXOIrrsNmIyIhEzYdvRB1s
 WEqjFqIDFrXcjErFHfXzq0zCy/OQrUfUMt+I5rPbxoX2tdx4eN/peULJp5nPZ6DjxLIhyYpDm/Zh
 xWBtEfLAQRLSlr/5YlHTIkKBOAuoVD8hXBujoSea/OyW2bBpRbgpDDSA5rAY0VLP0NAymGvAOLCY
 QI=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GElQYo71mU4=;xi03gbwVrClbNe0DVWHVvBzPY7x
 3+aMyl5f+3jqgJivpznjmUgntj5AE+Xc563qgdgjb7iA3laMzxTYONpv0e06uN2TvZk0bZa0J
 rguaCqiB127ozM9llZ1VwbUOUr/E81ZWMyW0D9z1aQlp3FaUsQMJjiLAFsZfo9eGy+Z1CLjxw
 nBSjd9Z1bG7go1fwCTlKak1IRNd+GvYZ4ZIyPQwDt9V+sIFkRBvq+xw6XNRllrJn1acys4YCy
 10Aug+FjBjmCcCmHlCe4ZnResZ8SdxLzrkEB1oN73KLPRYAn0VnM6xe0wwyV0L5thliHV+j7E
 5FChnpiznZ4Gv7YSKd7Vy0GPlHAL4mrXE5kjVZm14Ov9ZNUCRZpNfY0bJgfgOB3ZbJffymouP
 wHQIjPptZbzIaUxbwXI6E80/UYeeLYOIgFncXm9SRRo/eCh68BFcqAD5DS2OhQuki5RLCI89G
 bcEKrzSrSTpdB+FsMtRahyDk69jKM4F9xGBlAWf6B411gm2E08JG3HuHtHIrsqIgtyDi42Jhf
 LQkFA7yXnYEP+jwqBbGd2ptOa0xjeiqsXYISQMftsM7vBhgHIk8P24/IV/II16o0uYA8tkMsp
 d3885mcCzyXOnIxbqr8ItI2HiNWfnQ0WZVguydokiOZ6mu+66DZnc+hxrbqJEZ/kWlc9zWljK
 lHqPGoivOGUHa4dW+10VqIYAuHg2wMMaB44aqjoV20/q4y3r0r6mS/JBMc18q+MCvVhH0pREJ
 Z1W74HN37mVF03rUGCe2NQWeHVzTt9IDuqCV7z7r4AmZgkOO28MLhZZs/qifrhUCXA8ix3FfG
 /oPRRtfjzPutCH2YE2Np4bMQ==
Content-Transfer-Encoding: quoted-printable

On 14.03.2023 07:37; Jan Beulich wrote:
> On 14.03.2023 02:15, Denis wrote:
> > On 13.03.2023 10:36, Jan wrote
> >> On 10.03.2023 21:50, Denis wrote:
> >>> Should I test something else?
> >>
> >> ... there was no request for any further testing here, for the moment=
.
> >
> > ah...sorry, going by "Would be nice to have this confirmed forthe syst=
em
> > in question, i.e. without Xen underneath Linux" I thought I could test
> > something which might help shed some light on all of this.
>
> Well, yes, that Linux-without-Xen test would still be useful to have
> results from. I didn't account for this in my earlier reply because
> I had asked for it before already, and I did take "something else"
> for meaning anything that might have turned up as useful from the new
> data you had provided.

What tests could I do or what info should I provide to help?


Denis


