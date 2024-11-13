Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E09C76D9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 16:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835827.1251685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFEZ-0001vg-DO; Wed, 13 Nov 2024 15:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835827.1251685; Wed, 13 Nov 2024 15:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFEZ-0001ti-Ae; Wed, 13 Nov 2024 15:24:43 +0000
Received: by outflank-mailman (input) for mailman id 835827;
 Wed, 13 Nov 2024 15:24:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l7vR=SI=intel.com=dave.jiang@srs-se1.protection.inumbo.net>)
 id 1tBFEX-0001ta-Ky
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 15:24:41 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63188b79-a1d3-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 16:24:36 +0100 (CET)
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:24:33 -0800
Received: from spandruv-desk1.amr.corp.intel.com (HELO [10.125.111.237])
 ([10.125.111.237])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:24:28 -0800
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
X-Inumbo-ID: 63188b79-a1d3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5Mi4xOTguMTYzLjExIiwiaGVsbyI6Im1nYW1haWwuaW50ZWwuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYzMTg4Yjc5LWExZDMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTExNDc2LjczNjExMywic2VuZGVyIjoiZGF2ZS5qaWFuZ0BpbnRlbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731511476; x=1763047476;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/Qs+Z4ETO6HBDD0/r4vq50xWIIZZXaOFQHJesHfkTbA=;
  b=lez+1czYEh4IsGdAKFu4AqBLb6GlTOsWzsnghDShYc61+vTh66hFndZO
   f7A3LZsLZ9tstTtI6gz5kDtDCHoCpZv/e75BYPymhfWCkCgOrWELAa8LN
   y0gls4BaNLwPtofitzjj0xx+2CKAX7j5EWRuv4FzExw8tDyAI0Bt6vQ61
   egkqXlBZ8Z6EJTxbPOgC4u2wzC/aNBQ8+VTJkJW9xH7MHoni9JfNPTOEx
   UTxO2RLuwVSVugWSwYR2m2PKSeVsvOuF/OGC7joTNZjMbtNHVo4LrE7P/
   qfaNn+qJmHs6F12usZGQk1vrjFm45vOOH0WsOFCdvKhKP2tBRDG+mky3k
   w==;
X-CSE-ConnectionGUID: DHbbedNLQlejMxVqEgeWNg==
X-CSE-MsgGUID: erdx9nabQ+G1q3+RNyY69w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42038090"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="42038090"
X-CSE-ConnectionGUID: Eu78RBWmRsK0vvilN+bwhQ==
X-CSE-MsgGUID: u7LspSQgTTqwqS7xt+wrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="111214069"
Message-ID: <decf5296-1c9b-49ab-8556-55a199e214ed@intel.com>
Date: Wed, 13 Nov 2024 08:24:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] net/ntb: Use never-managed version of pci_intx()
To: Philipp Stanner <pstanner@redhat.com>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov
 <oakad@yahoo.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Igor Mitsyanko <imitsyanko@quantenna.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>,
 Ricky Wu <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Breno Leitao <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mostafa Saleh <smostafa@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>,
 Kunwu Chan <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Eric Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20241113124158.22863-2-pstanner@redhat.com>
 <20241113124158.22863-6-pstanner@redhat.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20241113124158.22863-6-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/24 5:41 AM, Philipp Stanner wrote:
> pci_intx() is a hybrid function which can sometimes be managed through
> devres. To remove this hybrid nature from pci_intx(), it is necessary to
> port users to either an always-managed or a never-managed version.
> 
> hw/amd and how/intel enable their PCI-Device with pci_enable_device().
> Thus, they need the never-managed version.
> 
> Replace pci_intx() with pci_intx_unmanaged().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com> #for ntb_hw_amd.c

Acked-by: Dave Jiang <dave.jiang@intel.com> # for ntb_hw_gen1.c
> ---
>  drivers/ntb/hw/amd/ntb_hw_amd.c    | 4 ++--
>  drivers/ntb/hw/intel/ntb_hw_gen1.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
> index d687e8c2cc78..b146f170e839 100644
> --- a/drivers/ntb/hw/amd/ntb_hw_amd.c
> +++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
> @@ -791,7 +791,7 @@ static int ndev_init_isr(struct amd_ntb_dev *ndev,
>  err_msi_enable:
>  
>  	/* Try to set up intx irq */
> -	pci_intx(pdev, 1);
> +	pci_intx_unmanaged(pdev, 1);
>  
>  	rc = request_irq(pdev->irq, ndev_irq_isr, IRQF_SHARED,
>  			 "ndev_irq_isr", ndev);
> @@ -831,7 +831,7 @@ static void ndev_deinit_isr(struct amd_ntb_dev *ndev)
>  		if (pci_dev_msi_enabled(pdev))
>  			pci_disable_msi(pdev);
>  		else
> -			pci_intx(pdev, 0);
> +			pci_intx_unmanaged(pdev, 0);
>  	}
>  }
>  
> diff --git a/drivers/ntb/hw/intel/ntb_hw_gen1.c b/drivers/ntb/hw/intel/ntb_hw_gen1.c
> index 079b8cd79785..9ad9d7fe227e 100644
> --- a/drivers/ntb/hw/intel/ntb_hw_gen1.c
> +++ b/drivers/ntb/hw/intel/ntb_hw_gen1.c
> @@ -445,7 +445,7 @@ int ndev_init_isr(struct intel_ntb_dev *ndev,
>  
>  	/* Try to set up intx irq */
>  
> -	pci_intx(pdev, 1);
> +	pci_intx_unmanaged(pdev, 1);
>  
>  	rc = request_irq(pdev->irq, ndev_irq_isr, IRQF_SHARED,
>  			 "ndev_irq_isr", ndev);


