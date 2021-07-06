Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B8C3BE1B4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 06:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151436.280539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ykL-0002qL-A7; Wed, 07 Jul 2021 04:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151436.280539; Wed, 07 Jul 2021 04:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0ykL-0002oL-5D; Wed, 07 Jul 2021 04:01:13 +0000
Received: by outflank-mailman (input) for mailman id 151436;
 Tue, 06 Jul 2021 15:07:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5ll=L6=gmail.com=yehezkelshb@srs-us1.protection.inumbo.net>)
 id 1m0mfC-0002Qn-15
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:07:06 +0000
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4ae140e-274b-4faf-a4c7-98f60c616b85;
 Tue, 06 Jul 2021 15:07:05 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gn32so34727474ejc.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 08:07:05 -0700 (PDT)
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
X-Inumbo-ID: c4ae140e-274b-4faf-a4c7-98f60c616b85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+9dsgPbS//aUCZUFixPgGcG7qxsG2EJ3dbyOzFDh8TA=;
        b=SBHfWn821HxdveyktStHQrYDe4MbFpbgRsAdNfnT39UeMrTpAkqi5Mw9J7eZv7cX8o
         4IiMGVVUkNi11aAd4XiuIPLnSf4etnUsfgOrP0HPkyuBpadE2fbx2e+Mv3rlJzIHAso+
         o7XaFo1UlSb/NBSAjQV11bNqf2gionJphJcRl4YCGJk45hXp5V+Gpo6AbrJv2xqP31dM
         +oUmVZwHbjtRk+sinfDNsF+kPOGLbKlYnyzpn0vB+NsB4Whl5CCwUy8NwaOykBdFTFHG
         XhUidv7/qS7jG1fnPfvqgohVjfRj0vLF0MFd7Vbksyj/BKvpyZ1bN9xNMq5MG35cMCap
         n6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+9dsgPbS//aUCZUFixPgGcG7qxsG2EJ3dbyOzFDh8TA=;
        b=lVWjueOBiFosBz6qtBkqyTJapUkZDp1oXgOWu/DbgPuc9cC/Me7nx+CPMsjJCLTFg7
         bLlmXmCHcD2RKOPli077+tq8ID2+4BnA4jAEJJufqA3NpcDfjfDJomwcVWBuY3oZMpQ3
         5vcCA8WQrrcGoR3CbJdfqBLFeWmyYcPRauKh0Z+D8I1rkU6BD/UMJRhKwpExj1VinyR4
         x5PBjKGWHgrcLQG9z3gfbrvGxGkgTv0gR44iwrPBltG0I37uxizCftwVvrPgVttAM+UQ
         RxaP4bOr7kmSM5JFPL/jJlYZb1JhwU5CJyzlQDpqQpKlCjxtOnRpwQ+JV6+2zhPZF9cF
         mHHg==
X-Gm-Message-State: AOAM530mSy70mms94VVNwNTOw4GR7m5dBATkjfH4WYqpOeQEW5b0vNFd
	eMjc3sI190mV1nHBTYK6o5B6KsNDFqHbSG81Hm0=
X-Google-Smtp-Source: ABdhPJyx2s89fjP7kWr4sVrlETefy/K9QI98mSZLW/XMLqqA4vHIWAGZQnqqZ+CiP6xjmA9K+asUF6gnTpo1w9tsizc=
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr19151547ejc.384.1625584024338;
 Tue, 06 Jul 2021 08:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Yehezkel Bernat <yehezkelshb@gmail.com>
Date: Tue, 6 Jul 2021 18:06:47 +0300
Message-ID: <CA+CmpXu5-NCvfuOc8fso2a9bmi0Dacmd=+u=XB-Wd7X=WgOTBA@mail.gmail.com>
Subject: Re: [PATCH] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de, 
	LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, 
	William Breathitt Gray <vilhelm.gray@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Ben Widawsky <ben.widawsky@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>, 
	Stefan Richter <stefanr@s5r6.in-berlin.de>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>, 
	Moritz Fischer <mdf@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Samuel Iglesias Gonsalvez <siglesias@igalia.com>, Jens Taprogge <jens.taprogge@taprogge.org>, 
	Johannes Thumshirn <morbidrsa@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee.jones@linaro.org>, 
	Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jon Mason <jdmason@kudzu.us>, 
	Allen Hubbe <allenbh@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mark Gross <mgross@linux.intel.com>, Matt Porter <mporter@kernel.crashing.org>, 
	Alexandre Bounine <alex.bou9@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Thorsten Scherer <t.scherer@eckelmann.de>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <agross@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Buesch <m@bues.ch>, 
	Sven Van Asbroeck <TheSven73@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Kirti Wankhede <kwankhede@nvidia.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Cornelia Huck <cohuck@redhat.com>, Martyn Welch <martyn@welchs.me.uk>, 
	Manohar Vanga <manohar.vanga@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Marc Zyngier <maz@kernel.org>, Tyrel Datwyler <tyreld@linux.ibm.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Samuel Holland <samuel@sholland.org>, 
	Qinglang Miao <miaoqinglang@huawei.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Joey Pabalan <jpabalanb@gmail.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Frank Li <lznuaa@gmail.com>, 
	Mike Christie <michael.christie@oracle.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	Hannes Reinecke <hare@suse.de>, David Woodhouse <dwmw@amazon.co.uk>, SeongJae Park <sjpark@amazon.de>, 
	Julien Grall <jgrall@amazon.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev, dmaengine@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, 
	industrypack-devel@lists.sourceforge.net, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-ntb@googlegroups.com, 
	Linux PCI <linux-pci@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, 
	greybus-dev@lists.linaro.org, target-devel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 6, 2021 at 12:50 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
>
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
>
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

>
>  drivers/thunderbolt/domain.c              | 4 +---

For Thunderbolt:

Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>

