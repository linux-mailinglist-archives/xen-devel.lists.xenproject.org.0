Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE2160B426
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 19:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429292.680225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on1Ho-0003SA-7p; Mon, 24 Oct 2022 17:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429292.680225; Mon, 24 Oct 2022 17:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on1Ho-0003PN-4h; Mon, 24 Oct 2022 17:30:52 +0000
Received: by outflank-mailman (input) for mailman id 429292;
 Mon, 24 Oct 2022 17:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDLv=2Z=bombadil.srs.infradead.org=BATV+126e47513ec1fd56a858+7001+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1on1Hm-0003PH-1z
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 17:30:50 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99233b8c-53c1-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 19:30:49 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1on1Hd-002Ta1-SO; Mon, 24 Oct 2022 17:30:41 +0000
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
X-Inumbo-ID: 99233b8c-53c1-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R2CozcFHwiChhVIqs9e1K7KGsaZbKqtzxGeJtPv9o4I=; b=kIseVJ2df1bajoZTbCM6NTSzk3
	aAMcxXbtdOSJSoQJcJ5AwEtJfcHjIKlO54CzW1473JnXWY+4pbRjbCnbhZkHDnFMSYQI16SHsQ0Un
	C5HUIGuZI3Vj+yi1EJ73edNhXPpC7mWC/77d38X96cylJ45BjMRtPVupLNQ3MekhFWX1tMFRA/mik
	PidTxoEXuf4sxtY10c52U0iGpLcR889au95SDPugZ9kZ9aGB1BmsNG/p1Y3hezN49AE1g7PlzKIz6
	fBFxfL+yAc8Z7lM8uL8Nrf82mLnCBBDMeXHT7NPasxJeFoithuIP6hPw4h5SOmwzH9LS46qQFYM9e
	zw2/RcCw==;
Date: Mon, 24 Oct 2022 10:30:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Salvatore Bonaccorso <carnil@debian.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	sathya.prakash@broadcom.com, suganath-prabu.subramani@broadcom.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	adi@kriegisch.at
Subject: Re: Report in downstream Debian: mpt3sas broken with xen dom0 with
 update to 5.10.149 in 5.10.y.
Message-ID: <Y1bLwUkCgElIBNdU@infradead.org>
References: <Y1JkuKTjVYrOWbvm@eldamar.lan>
 <85ad4508-b979-c792-e92b-01bc16260dec@acm.org>
 <CAK=zhgr=MYn=-mrz3gKUFoXG_+EQ796bHEWSdK88o1Aqamby7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK=zhgr=MYn=-mrz3gKUFoXG_+EQ796bHEWSdK88o1Aqamby7g@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Oct 24, 2022 at 05:26:44PM +0530, Sreekanth Reddy wrote:
> This issue is getting observed after having the below patch changes,
> 2b9aba0c5d58e141e32bb1bb4c7cd91d19f075b8 scsi: mpt3sas: Fix return
> value check of dma_get_required_mask()

Looking at this commit it seems odd.  dma_get_required_mask() should
only be used as an optimization for hardware that actually benefits
from a lower DMA Mask.  That means either classic PCI that requires
DAC cycles, or firmware architectures like aic7xxx that do need
additional overhead.  I don't think either is the case for mpt3sas,
so I think (in addition to fixing up the Xen required mask), mpt3sas
should do something like:

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
index 4e981ccaac4163..295942a8989780 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -2992,8 +2992,7 @@ _base_config_dma_addressing(struct MPT3SAS_ADAPTER *ioc, struct pci_dev *pdev)
 	struct sysinfo s;
 	u64 coherent_dma_mask, dma_mask;
 
-	if (ioc->is_mcpu_endpoint || sizeof(dma_addr_t) == 4 ||
-	    dma_get_required_mask(&pdev->dev) <= DMA_BIT_MASK(32)) {
+	if (ioc->is_mcpu_endpoint) {
 		ioc->dma_mask = 32;
 		coherent_dma_mask = dma_mask = DMA_BIT_MASK(32);
 	/* Set 63 bit DMA mask for all SAS3 and SAS35 controllers */

