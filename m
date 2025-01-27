Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75686A1CF54
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 01:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877382.1287533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcD0f-0006yZ-Py; Mon, 27 Jan 2025 00:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877382.1287533; Mon, 27 Jan 2025 00:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcD0f-0006x4-NE; Mon, 27 Jan 2025 00:29:49 +0000
Received: by outflank-mailman (input) for mailman id 877382;
 Mon, 27 Jan 2025 00:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8klh=UT=amazon.de=prvs=1155a3140=graf@srs-se1.protection.inumbo.net>)
 id 1tcD0d-0006ww-Lv
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 00:29:47 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdc7fa86-dc45-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 01:29:45 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 00:29:41 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:16822]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.6.79:2525] with
 esmtp (Farcaster)
 id cfa39458-8857-455d-858b-eff9b0664ce4; Mon, 27 Jan 2025 00:29:41 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 27 Jan 2025 00:29:41 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39; Mon, 27 Jan 2025
 00:29:33 +0000
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
X-Inumbo-ID: cdc7fa86-dc45-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1737937785; x=1769473785;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1CW7QrQuY535yIxYdxvZyKWa4nCyH6ZLrqRFGNx49Oc=;
  b=obhHzxUu1ArY1/U6JnUF90YSTjl0EEMiXwtaCsNxC5ydQ167KON2tIBh
   dA2GEZXRntLNA33lzaiOBxZjZjbbSfNQdqkHhtC12lRyHPa21pI2S4AgC
   BmwjXXrHUrUMcZ34sp5olw7C6wcT4J+77z/WP/wmvKLzn6qnc2tmyzT24
   w=;
X-IronPort-AV: E=Sophos;i="6.13,237,1732579200"; 
   d="scan'208";a="372062737"
X-Farcaster-Flow-ID: cfa39458-8857-455d-858b-eff9b0664ce4
Message-ID: <890f3e12-a511-40a0-a3c3-d7134b470a1f@amazon.com>
Date: Sun, 26 Jan 2025 16:29:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] hw/sysbus/platform-bus: Introduce
 TYPE_DYNAMIC_SYS_BUS_DEVICE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	<qemu-devel@nongnu.org>
CC: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>, Anthony PERARD
	<anthony@xenproject.org>, Gustavo Romero <gustavo.romero@linaro.org>, "Jason
 Wang" <jasowang@redhat.com>, <qemu-ppc@nongnu.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, <xen-devel@lists.xenproject.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Alex Williamson
	<alex.williamson@redhat.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20250125181343.59151-1-philmd@linaro.org>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)


On 25.01.25 10:13, Philippe Mathieu-Daudé wrote:
> Some SysBus devices can optionally be dynamically plugged onto
> the sysbus-platform-bus (then virtual guests are aware of
> mmio mapping and IRQs via device tree / ACPI rules).
>
> This series makes these devices explicit by having them implement
> the DYNAMIC_SYS_BUS_DEVICE class, which only sets 'user_creatable'
> flag to %true but makes the codebase a bit clearer (IMHO, at least
> now we can grep for DYNAMIC_SYS_BUS_DEVICE).


I love it. Thank you! This is clearly much more readable than the 
magical hint swizzling I did :).

Reviewed-by: Alexander Graf <graf@amazon.com>


Alex


