Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5D9187D4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749360.1157429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVnM-0001PV-JP; Wed, 26 Jun 2024 16:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749360.1157429; Wed, 26 Jun 2024 16:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVnM-0001Mh-Ft; Wed, 26 Jun 2024 16:46:56 +0000
Received: by outflank-mailman (input) for mailman id 749360;
 Wed, 26 Jun 2024 16:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QuO/=N4=quicinc.com=quic_jjohnson@srs-se1.protection.inumbo.net>)
 id 1sMVnK-0001Mb-Ks
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:46:54 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af38776b-33db-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 18:46:51 +0200 (CEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfTKB003830;
 Wed, 26 Jun 2024 16:46:43 GMT
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaf2kdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 16:46:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QGkfWO017986
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 16:46:41 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 09:46:41 -0700
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
X-Inumbo-ID: af38776b-33db-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJIU8nuIR3yUT+2mBo6yrGaIcXHwca09t9+g53UevcU=; b=N/Eeag+b1CpDisWr
	lZ/H/0ZKqf3iatNUBdeVEsaYvM29UTTNl3OKmhx0LNVg6BlJHn+OO/tUdHQbtxPd
	Tp3HWvI0rllXdb3TVEIs4QUwfvgr4au3aQNGVJnpgifoV2wh5wVWs7FHSWq8e1HT
	8VQ89SXROr9wa3Uv0gmsuvtazCmP/t1vBKAtxIbliDlOF0pIE51pYcQ6RO+cSPio
	VGAAEFmKUzKbkK1QRpmVkPD8szB7Z3nJzRBN8hqVQh/zhKzvfCz9j26Assw+/NEl
	t00i6Ws2/ao1PMa7FlwBia25rduEg1yk/oND1b4lGL4EYjaEItLXUniuHlwVTVAU
	8OsUXQ==
Message-ID: <2ecfd10e-c8f2-458c-bf07-e4472d22bcfe@quicinc.com>
Date: Wed, 26 Jun 2024 09:46:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240611-md-drivers-xen-v1-1-1eb677364ca6@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240611-md-drivers-xen-v1-1-1eb677364ca6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: M3EHqaZykX8v0ytdD0PLIUxzzkFGah7n
X-Proofpoint-GUID: M3EHqaZykX8v0ytdD0PLIUxzzkFGah7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_08,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260123

On 6/11/2024 4:54 PM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-pciback/xen-pciback.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-evtchn.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xen-privcmd.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> Corrections to these descriptions are welcomed. I'm not an expert in
> this code so in most cases I've taken these descriptions directly from
> code comments, Kconfig descriptions, or git logs.  History has shown
> that in some cases these are originally wrong due to cut-n-paste
> errors, and in other cases the drivers have evolved such that the
> original information is no longer accurate.
> ---
>  drivers/xen/evtchn.c               | 1 +
>  drivers/xen/privcmd-buf.c          | 1 +
>  drivers/xen/privcmd.c              | 1 +
>  drivers/xen/xen-pciback/pci_stub.c | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
> index f6a2216c2c87..9b7fcc7dbb38 100644
> --- a/drivers/xen/evtchn.c
> +++ b/drivers/xen/evtchn.c
> @@ -729,4 +729,5 @@ static void __exit evtchn_cleanup(void)
>  module_init(evtchn_init);
>  module_exit(evtchn_cleanup);
>  
> +MODULE_DESCRIPTION("Xen /dev/xen/evtchn device driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/xen/privcmd-buf.c b/drivers/xen/privcmd-buf.c
> index 2fa10ca5be14..0f0dad427d7e 100644
> --- a/drivers/xen/privcmd-buf.c
> +++ b/drivers/xen/privcmd-buf.c
> @@ -19,6 +19,7 @@
>  
>  #include "privcmd.h"
>  
> +MODULE_DESCRIPTION("Xen Mmap of hypercall buffers");
>  MODULE_LICENSE("GPL");
>  
>  struct privcmd_buf_private {
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 67dfa4778864..b9b784633c01 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -48,6 +48,7 @@
>  
>  #include "privcmd.h"
>  
> +MODULE_DESCRIPTION("Xen hypercall passthrough driver");
>  MODULE_LICENSE("GPL");
>  
>  #define PRIV_VMA_LOCKED ((void *)1)
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index e34b623e4b41..4faebbb84999 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -1708,5 +1708,6 @@ static void __exit xen_pcibk_cleanup(void)
>  module_init(xen_pcibk_init);
>  module_exit(xen_pcibk_cleanup);
>  
> +MODULE_DESCRIPTION("Xen PCI-device stub driver");
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_ALIAS("xen-backend:pci");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-xen-522fc8e7ef08
> 

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff

