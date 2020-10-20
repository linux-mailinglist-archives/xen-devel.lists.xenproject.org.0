Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A985293652
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 10:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8958.24118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUmYt-0007Jk-K8; Tue, 20 Oct 2020 08:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8958.24118; Tue, 20 Oct 2020 08:00:03 +0000
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
	id 1kUmYt-0007IY-GM; Tue, 20 Oct 2020 08:00:03 +0000
Received: by outflank-mailman (input) for mailman id 8958;
 Tue, 20 Oct 2020 08:00:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUmYs-00072o-E0
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 08:00:02 +0000
Received: from mail-ej1-x633.google.com (unknown [2a00:1450:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b8c3803-4e72-47aa-b4f6-b5bc93dc2fb0;
 Tue, 20 Oct 2020 08:00:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id md26so1282852ejb.10
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 01:00:01 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id v1sm1400374eds.47.2020.10.20.00.59.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 01:00:00 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUmYs-00072o-E0
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 08:00:02 +0000
X-Inumbo-ID: 2b8c3803-4e72-47aa-b4f6-b5bc93dc2fb0
Received: from mail-ej1-x633.google.com (unknown [2a00:1450:4864:20::633])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2b8c3803-4e72-47aa-b4f6-b5bc93dc2fb0;
	Tue, 20 Oct 2020 08:00:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id md26so1282852ejb.10
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 01:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=7a66diox9vHPT1Z9E79vY+WL73WqD7Lj+skCoPAkZNM=;
        b=VSa2OTKJ73WWkWHTo1NYNSda5Mi/f1t93CZjLPkE5OyWIjQ+VXTKH2o5DwAFEtOHD1
         gpTXGUI5FZ7XFmBRZGXZJznGBGsk5aYxaCgxmnDOeAr5ofTozpTZE0NRWs0rvL6om08+
         etWQ3/RxC7XgtnBS/IzgTdD0Spp+F0eInNPD8oIfjEEHeqxBVxROE3ZUEDCSdyg1Di/Q
         0Ts4Qgxalud/vVVRXpmMMpBVBpF33Iz/kfxli15k8KqMlafc7lxamoO7YzoUZY6T4KDK
         VkwazBs3k/sHAIkPkciaUY2sBGHA8gJrjIfFepYZemZfGz+UigEMFARKPBs2BkelAqJM
         yqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=7a66diox9vHPT1Z9E79vY+WL73WqD7Lj+skCoPAkZNM=;
        b=esBv7QhTVbPjhFCUthR97GiCybGD7yqElWzQ4OTnI7zbUb/ltuHzQw+yrpRVkrExQM
         XeWihEfkmg3QkVT4/LI2Y7eG9uuyaDd8gyJo7wInMj4+AbXOgmBMe8PTCMn/oy8KzNND
         f5MYbthHtemHSpoR2YCXyM3kcbfYbAbagyKkFGQY96TeYWlFxRmfYPy/yS/QJpi8VX++
         CPzywVXCTFjN6cLeAZYhuOi995bvjtLTSrbV+GV0ghrafO1xNor+w8putSarf59N9fPn
         CAfwDlMkqlHbl5OHf7/JRGKG6c+gXrXfiXQxAyIT/pjhE/c2knx2/cunGhzDu979ec9O
         OeCA==
X-Gm-Message-State: AOAM531mzER6Z4X/3/Wi/TCbyBCeFtEVGxP23XTgfZK7zEk9xITMxkWN
	EhE9NMyZeE2xVZKSJvyYXvg=
X-Google-Smtp-Source: ABdhPJy1yG1mAAOmS5ajJQR1wC7D0H0FoOdKcIJHfPs6q/UvZbl+3BMujicBk7QAdJJG17h+YnnzMA==
X-Received: by 2002:a17:907:40bb:: with SMTP id nu19mr1786359ejb.246.1603180800820;
        Tue, 20 Oct 2020 01:00:00 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
        by smtp.gmail.com with ESMTPSA id v1sm1400374eds.47.2020.10.20.00.59.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 01:00:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-4-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-4-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V2 03/23] xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
Date: Tue, 20 Oct 2020 08:59:58 +0100
Message-ID: <004101d6a6b7$02452440$06cf6cc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAH+e+xpqmgq2XA=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 15 October 2020 17:44
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V2 03/23] xen/ioreq: Make x86's =
hvm_ioreq_needs_completion() common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The IOREQ is a common feature now and this helper will be used
> on Arm as is. Move it to xen/ioreq.h and remove "hvm" prefix.
>=20
> Although PIO handling on Arm is not introduced with the current series
> (it will be implemented when we add support for vPCI), technically
> the PIOs exist on Arm (however they are accessed the same way as MMIO)
> and it would be better not to diverge now.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>

Reviewed-by: Paul Durrant <paul@xen.org>


