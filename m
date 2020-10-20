Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9DE29396F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 12:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9088.24444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUpIO-0000Bh-5Q; Tue, 20 Oct 2020 10:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9088.24444; Tue, 20 Oct 2020 10:55:12 +0000
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
	id 1kUpIO-0000B9-29; Tue, 20 Oct 2020 10:55:12 +0000
Received: by outflank-mailman (input) for mailman id 9088;
 Tue, 20 Oct 2020 10:55:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUpIM-0000B3-OH
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:55:10 +0000
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 438461d1-4f92-448c-a00a-471d55fdc3d0;
 Tue, 20 Oct 2020 10:55:10 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id x1so1361205eds.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 03:55:09 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id w22sm2043189edu.15.2020.10.20.03.55.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 03:55:08 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUpIM-0000B3-OH
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:55:10 +0000
X-Inumbo-ID: 438461d1-4f92-448c-a00a-471d55fdc3d0
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 438461d1-4f92-448c-a00a-471d55fdc3d0;
	Tue, 20 Oct 2020 10:55:10 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id x1so1361205eds.1
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=QDpxbzaKWhiOUrC0mixBdsCIdgIRhodTiFBVVSGm43Q=;
        b=L0PsJD1IcUwlXwLsX/7U9jFdlOMQ6sPFWxkEi2Tu+gSVmMZ1cCy/Bl4AzHOtFgyaHA
         WlWCpVUWq3WdD2TMMYUVGyuw5RvoS4w54nZNoPkVjMSw/uTk487BLpDfqKF7ON0NDtfA
         sGebQA7n8Kz9RCBzp5tDTZfa7QchG2MTdDM8bGo/HUcZVm7QS747ag6VjlyQvDKLHGnb
         AivRtgx9IAJXHj4x+DMq5nNkor3vnql9O/71bx3InPOnv6BD9MuxALTCVmsHPq4skowF
         cWMORZQQ1Tmy6T1n30BZVeCffCgr/+qbBKnekN+TydX/jJQ1jKJ6LhUMCqRUgK1gO61e
         iaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=QDpxbzaKWhiOUrC0mixBdsCIdgIRhodTiFBVVSGm43Q=;
        b=soex0GDsOMb/T0Jan+W6qDmArxUCtQQyVetyib9d/0y5ahE80htS3Fhq+Tgns8L7B6
         VOgPAKZjs76Fm/7Qrvf+ZBq6Zf4qQtBuyWY/UtdF534oJ9R78gHeeH+VaUPn+JGOVA5T
         JeCPgdy2kF6vnSH7WV7cGqPFa1FmjFjgs+RH6AMLwTanpn9f7IhIxpkE5d/8zV1OxnY5
         eMrRnDFgKuJXW+cUlZMNCgkCBaaTmATgo+MMSuf8SfYTIfBtcd6EOWvF6THBn0xUVEUU
         Ez0THLYOviUc4H80ywS4GSweTRR3RD/8/joRTaZ5NI8fyVjrJpwcW1C0mPKOZg6erSSp
         W6/Q==
X-Gm-Message-State: AOAM531u4jCAhj16nh9RO7BGUqaO0YrZ9sS+kmrYnfbMArMkEVq2hRNu
	AldDBgddpFtYFQ3zbRTxqmY=
X-Google-Smtp-Source: ABdhPJxSxTpqy/Es07re/7wJNHCZ7KAS/02YaDdE7x4y/1z3o2CSFcX81IYlYZGZ3+oJ+MiuhfhEUQ==
X-Received: by 2002:a50:d751:: with SMTP id i17mr2128076edj.337.1603191309187;
        Tue, 20 Oct 2020 03:55:09 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
        by smtp.gmail.com with ESMTPSA id w22sm2043189edu.15.2020.10.20.03.55.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 03:55:08 -0700 (PDT)
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
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-12-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-12-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V2 11/23] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
Date: Tue, 20 Oct 2020 11:55:07 +0100
Message-ID: <004f01d6a6cf$79d0daa0$6d728fe0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAEW73X1qm+YG6A=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 15 October 2020 17:44
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Stefano =
Stabellini <sstabellini@kernel.org>; Jun
> Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; =
Julien Grall
> <julien.grall@arm.com>
> Subject: [PATCH V2 11/23] xen/ioreq: Move x86's io_completion/io_req =
fields to struct vcpu
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The IOREQ is a common feature now and these fields will be used
> on Arm as is. Move them to common struct vcpu as a part of new
> struct vcpu_io. Also move enum hvm_io_completion to xen/sched.h
> and remove "hvm" prefixes.
>=20
> This patch completely removes layering violation in the common code.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> ***
> I was thinking that it may be better to place these two fields
> into struct vcpu directly (without intermediate "io" struct).
> I think, this way the code which operates with these fields
> would become cleaner. Another possible option would be either
> to rename "io" struct (I failed to think of a better name) or
> to drop(replace?) duplicating "io" prefixes from these fields.

Just drop the 'io_' prefix from the field names.

  Paul


