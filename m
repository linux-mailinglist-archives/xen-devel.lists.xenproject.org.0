Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520828B502
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 14:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5938.15451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxJ9-00043s-3y; Mon, 12 Oct 2020 12:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5938.15451; Mon, 12 Oct 2020 12:52:07 +0000
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
	id 1kRxJ9-00043S-0M; Mon, 12 Oct 2020 12:52:07 +0000
Received: by outflank-mailman (input) for mailman id 5938;
 Mon, 12 Oct 2020 12:52:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K42p=DT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kRxJ7-00043N-3J
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:52:05 +0000
Received: from mail-ej1-x62a.google.com (unknown [2a00:1450:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04790500-fd75-4937-87e8-59a2558da542;
 Mon, 12 Oct 2020 12:52:04 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id c22so23048963ejx.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:52:04 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id me12sm10516645ejb.108.2020.10.12.05.52.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Oct 2020 05:52:02 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=K42p=DT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kRxJ7-00043N-3J
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:52:05 +0000
X-Inumbo-ID: 04790500-fd75-4937-87e8-59a2558da542
Received: from mail-ej1-x62a.google.com (unknown [2a00:1450:4864:20::62a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 04790500-fd75-4937-87e8-59a2558da542;
	Mon, 12 Oct 2020 12:52:04 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id c22so23048963ejx.0
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=cGxZviZhW7O5jqtJ0bZv9cnvWltQUpe03KlUpuYC5Pk=;
        b=J6jW6p6hzHWOhTn5sd21PaYyZX8b8qC4clssFgX3c8w+3Lr4ULTcCq+fH6ZnydnPTR
         OoSjfTZrwz3B1f4IDFsUz73av/D7osQPM0ZIkmn96OrJq4fLJSYWE1VSsiXOZcSRqNLm
         c2Vw6gT9JIYUAtGl59LtZabKjNZO15dQrFsZfharwkYrOtpb76ojXJWmaCpBdJPZbX/+
         OVcaZVufm6GyvZAo/7aWEXuYcTxuKYo65DdzKK4erP5VJ4U5yJs7nAktT/qd0EG8d7fl
         EVU+AJicMA75lA/1Plu8+tyuGNmK9kx9EOzlzjakE1oUus+88px2HgdvFRLVc5tcdX+j
         8kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=cGxZviZhW7O5jqtJ0bZv9cnvWltQUpe03KlUpuYC5Pk=;
        b=e9/ENTqt37GPLNpzBo33IyimYZVxKcGqiW4Yi2KBKeQ77QM+YLBr40dQ5sFC015vwF
         Yw85UnLQ8DSbbkAEeTUSgD1ujWsJb82B55QHRzlFu3X1Q3FW2lAokm4PxowR4XWMJ0XG
         JT7YjmPuGgJSPeyaP6Zsbm+MGe+ShUlnAhnSvBmHrNestCTAoMsEBtp47rbegfkXkSDL
         mLsI0J4hEk088IL4GKrFOpZJcNdpapTQRTYyDD8MLBVx1ixbGulXBAW7vnwmRADBEMWi
         XeZme1KWSflhvgqPvKv48R07GSSZLPJomhN1jEe/QDpVCB7qgdrwv1n0PTEnbeYwIMeq
         2qtw==
X-Gm-Message-State: AOAM532ZkBIKtJDm19zLYhYTyL7cskZCn49XIIEgtmxKqYX5I3/MJ7QA
	zt4ApspPZ062fXaY+/Dn5ic=
X-Google-Smtp-Source: ABdhPJwHAfJ1KA6vSf28jqCsNyskhp8zKVGrZmW9gROZziTmMM1V5o3vcaVB+aiilEPExBKNmWJZlw==
X-Received: by 2002:a17:906:39ce:: with SMTP id i14mr29164990eje.170.1602507123287;
        Mon, 12 Oct 2020 05:52:03 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id me12sm10516645ejb.108.2020.10.12.05.52.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2020 05:52:02 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: "'Peter Maydell'" <peter.maydell@linaro.org>,
	<qemu-ppc@nongnu.org>,
	<qemu-trivial@nongnu.org>,
	"'Aurelien Jarno'" <aurelien@aurel32.net>,
	<qemu-arm@nongnu.org>,
	=?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
	"'Michael S. Tsirkin'" <mst@redhat.com>,
	"'Eduardo Habkost'" <ehabkost@redhat.com>,
	"'Jiaxun Yang'" <jiaxun.yang@flygoat.com>,
	"'Yoshinori Sato'" <ysato@users.sourceforge.jp>,
	=?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
	"'David Gibson'" <david@gibson.dropbear.id.au>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Helge Deller'" <deller@gmx.de>,
	"'Anthony Perard'" <anthony.perard@citrix.com>,
	"'Richard Henderson'" <rth@twiddle.net>,
	"'Aleksandar Markovic'" <aleksandar.qemu.devel@gmail.com>,
	<xen-devel@lists.xenproject.org>,
	"'Aleksandar Rikalo'" <aleksandar.rikalo@syrmia.com>,
	"'Marcel Apfelbaum'" <marcel.apfelbaum@gmail.com>,
	"'Mark Cave-Ayland'" <mark.cave-ayland@ilande.co.uk>,
	"'Paolo Bonzini'" <pbonzini@redhat.com>,
	"'Huacai Chen'" <chenhc@lemote.com>
References: <20201012124506.3406909-1-philmd@redhat.com> <20201012124506.3406909-5-philmd@redhat.com>
In-Reply-To: <20201012124506.3406909-5-philmd@redhat.com>
Subject: RE: [PATCH 4/5] hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 13:52:00 +0100
Message-ID: <001301d6a096$7b3a3880$71aea980$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIn0Xs2eWz4EZNtdpBYSFizYKd7hAIdwBpFqOCb0bA=

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 12 October 2020 13:45
> To: qemu-devel@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>; qemu-ppc@nongnu.org; =
qemu-trivial@nongnu.org; Paul
> Durrant <paul@xen.org>; Aurelien Jarno <aurelien@aurel32.net>; =
qemu-arm@nongnu.org; Philippe Mathieu-
> Daud=C3=A9 <f4bug@amsat.org>; Michael S. Tsirkin <mst@redhat.com>; =
Eduardo Habkost <ehabkost@redhat.com>;
> Jiaxun Yang <jiaxun.yang@flygoat.com>; Yoshinori Sato =
<ysato@users.sourceforge.jp>; C=C3=A9dric Le Goater
> <clg@kaod.org>; David Gibson <david@gibson.dropbear.id.au>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Helge Deller <deller@gmx.de>; Anthony Perard =
<anthony.perard@citrix.com>;
> Richard Henderson <rth@twiddle.net>; Aleksandar Markovic =
<aleksandar.qemu.devel@gmail.com>; xen-
> devel@lists.xenproject.org; Aleksandar Rikalo =
<aleksandar.rikalo@syrmia.com>; Marcel Apfelbaum
> <marcel.apfelbaum@gmail.com>; Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk>; Paolo Bonzini
> <pbonzini@redhat.com>; Huacai Chen <chenhc@lemote.com>
> Subject: [PATCH 4/5] hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
>=20
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> We already have a generic PCI_SLOT() macro in "hw/pci/pci.h"
> to extract the PCI slot identifier, use it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

xen-hvm change...

Acked-by: Paul Durrant <paul@xen.org>


