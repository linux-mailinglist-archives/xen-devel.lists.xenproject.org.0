Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LWaINymsmnwOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:43:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4440271321
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252188.1548969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eRf-0007JB-6x; Thu, 12 Mar 2026 11:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252188.1548969; Thu, 12 Mar 2026 11:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eRf-0007Gi-2u; Thu, 12 Mar 2026 11:43:15 +0000
Received: by outflank-mailman (input) for mailman id 1252188;
 Thu, 12 Mar 2026 11:43:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DV6w=BM=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1w0eRe-0005w8-0b
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:43:14 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4775f66-1e08-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 12:43:10 +0100 (CET)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62CA6NhZ263417
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 11:43:09 GMT
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yhwx4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 11:43:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2aec6c572fbso9994535ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:43:08 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae25cd67sm56194955ad.38.2026.03.12.04.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:43:06 -0700 (PDT)
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
X-Inumbo-ID: a4775f66-1e08-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVihyfEVv9KoFRyaGUgwYSBE5ZXMKxbsi+xWvdEgydE=; b=cuIgsaPDCpjPQizt
	0NHBv5jjn/jXISGW57UxIf1k5Xu0iyORYIMcUYWeJlBRrGKhgI9pL4FmIBwf5DVl
	3tt9dW7MlCfSbQewK2BKinwVtG7lWXhVA5ZFrESWS8JhlhPNGtLeQxoiYWsgRfhF
	sPdiL7e/lWx9qs/2aCRoDvzK8fz15IG3gIlIPdt/kFsccxqEy5hNrJWWjZ8GrNnm
	bNdsjFPw8GqmLOyQxZllHdvttI3qeaEYgEurG3+f/2l7q8Csv+y8bwlOn3soN2cb
	E2ycM89HWorASgLc2zbrjNBGYojkHubOksbBAUykTaErSiimLefagq23R/1Z3AU5
	H63GgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315788; x=1773920588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pVihyfEVv9KoFRyaGUgwYSBE5ZXMKxbsi+xWvdEgydE=;
        b=dADu37eQmA4XiAAHzEYDn1fdFWZH1QlKlVqVQF3U1okMAzrQOGhL9+8TAQpBkZrMm6
         3E/ktiCPOjbIMy7wxXSwOojAut+BCGAekdz0gFb+PHO6v3AnW8CX8oZd18fBO3Hxm2ZV
         BjCiosWe39if1zfXREv5AzLhhcNCYz6y1nrjm3AKQ2aKWrYB/64+6IOxUr2Yyh7yJDho
         GSUzVy/LXjun7LaSc1LdSerYpmm6B1FCOu3VJKY85I26i+jwtkMbpb9q3srXJDLkggDP
         aW73Y7+4agow/B3wrkhkPSClbiEGDQcaYZPDcCbIK0PY7Yd61ga2XEGxeUKjVC2KNGxI
         07NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315788; x=1773920588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVihyfEVv9KoFRyaGUgwYSBE5ZXMKxbsi+xWvdEgydE=;
        b=qDiqMbxyP2mE47j7FzZ/fX0zEmPQNOjatH0LjadPIZIwA2O8+1Mguu/rW7GOe6/Sd6
         i2qubFD4SGIW/H8ORuSPj4k8nM7jT92vbgZDUpmiAUA5u+CKpYWHch0xzHpTBC18Fpix
         ojBS0aJ6Vml+KsH6JzfONjB2zdIPFL0oAuuBpiNfWviBu5M5VgrG2OdwPkvSioBAs3if
         nnIu9svO7TMsm9SwAA0T+A/xMhiMZBt7lQy5TAtZOlvZYD9NvmZB37296RXc5qYd6Wla
         5NOJFbXj+ty8muyQ7dketYulcyBTr4rDib6JM47iF4NommH3lHwNN8JuQ0LXKCyDd/fP
         l4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCViN0xwGxQMX9w6vh62kYFB02qCwan93szFcXtpjUx0RKfJhGwjLtxFFpIcxZJS2gqeouifoYj/oqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL2AC0Pg5tb+CO4oh3B4i7MtXQlpyKGujbUgiZ614uvQfYuZ5H
	oJvFPe4j4bkUo3J8n4PVBYkB030aLsNfVLjhqz7RjivZKnF3HFQlPhY5H9kY2qI+v0FWmDLKaQu
	xo8xAAQfs5z2yBugilvULEwkF0JkUJM7Kn7SZrYQiMd2jWuy3g8TBloekOsBs/ttTn86Xyw==
X-Gm-Gg: ATEYQzxhKolEwbjsjIi6Qcuayllerl1SYrdY8iX7oqaNgRx5gq4En4sXAhvGzN+YB2U
	fuk1pPNX+9wLa7PwCjr9en6vLUb5GwdQfNCIIFVC+Yvn7mtFD7sxRDSL4xtE8FLhAhsK+indiyK
	o+/50lh37CbR9e5hbOk6FLfBleavif2kOmPdzeZQTZtuFCk//SpmeI2+/J4m4tquJYmrEuMY899
	KSL1QpSqdZRKe+J2vRpCf/y+CZzSoksdZHTDWxKDwNSAm3mrR/L1KLdYeyAcvdR83rxqcC8qPCf
	3enf82dzBNMPywd+l5lRz62HqEE5vQeIp7noKx9f7u5biAXvZf+HQHn9SOUBWMcwHUVRKPzEe+u
	TVmWsAu2kpUUKpPWI9YrcagupbJyw2nA4jgzcVwZ5Ea4SdmuA5AgBXXCaFg==
X-Received: by 2002:a17:902:db11:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2aeae7b4ecdmr63852325ad.19.1773315787492;
        Thu, 12 Mar 2026 04:43:07 -0700 (PDT)
X-Received: by 2002:a17:902:db11:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2aeae7b4ecdmr63851865ad.19.1773315786884;
        Thu, 12 Mar 2026 04:43:06 -0700 (PDT)
Message-ID: <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:12:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into a
 struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
 <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfX6F2LkwikaEY6
 t6/q4LP7KFfKk7nrfPpzSEH3bgmjnZG1XDT35w7ewB2FocHWBQIZaH7PcEOGDJ98hDNslc/rrXU
 RatPVu47GIqlo74PpDAr66I39D/4m6h46B3lkST+6MTbG196i41p8YRnSDH9LkneUqFbobfXAE1
 iZiPfWe6mj8f2mc2Iu3ky3NQYRTmcCsLKFpt0JdUjL6WOhZbSXmfOJQ0a71VNxJTIuBpqUyNtqn
 0Twhmj+d+qltlgu3nMVvEvjP7nF4HCGrGrwyLqluHP+Yo3RiN1DTWAKB9Wcn/UleB5pX32K7uJ9
 cXbK0F5W/W3trSAAPicV5wOgTL150aDgokfY3dCBI02CQ6MUqccMVCZCt4E9q/NUrvnpvw7wkAa
 eNwH7XInRyTK5uggGnXxwG73Jt5hwCg/qE06oyE00P2UjyG3Bsez4FgisFixRTI9ypLDfgmOjeJ
 8kUqF+z3c4rtEQCnlNA==
X-Proofpoint-ORIG-GUID: 91JdKXeDZtGMTAdy0YFNfrEJFjvdLEtz
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2a6cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tICBgMK4MGcbsJ-UzjAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 91JdKXeDZtGMTAdy0YFNfrEJFjvdLEtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120092
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D4440271321
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/10/2026 2:53 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> Change of_map_id() to take a pointer to struct of_phandle_args
>> instead of passing target device node and translated IDs separately.
>> Update all callers accordingly.
>>
>> Subsequent patch will make use of the args_count field in
>> struct of_phandle_args.
>>
>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/cdx/cdx_msi.c                    |  5 ++-
>>  drivers/iommu/of_iommu.c                 |  2 +-
>>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
>>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
>>  drivers/of/irq.c                         |  8 +++-
>>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
>>  drivers/pci/controller/pcie-apple.c      |  5 ++-
>>  drivers/xen/grant-dma-ops.c              |  4 +-
>>  include/linux/of.h                       | 12 +++---
>>  9 files changed, 76 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
>> index 63b3544ec997..03232b5ffbca 100644
>> --- a/drivers/cdx/cdx_msi.c
>> +++ b/drivers/cdx/cdx_msi.c
>> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>>  			   struct device *dev,
>>  			   int nvec, msi_alloc_info_t *info)
>>  {
>> +	struct of_phandle_args msi_spec = { .np = NULL };
> 
> Why do you need to set it? Parse functions ignore passed args, don't
> they?
> 

The parse function does check arg->np on input — if it is non-NULL,
it is used to match only entries targeting that specific node.

Also, there is this existing path in drivers/pci/msi/irqdomain.c which
pre-sets the node and passes it as input to of_msi_xlate(), so the node
pointer is not ignored by the parse code:

u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
{
        struct device_node *of_node;
        u32 rid = pci_dev_id(pdev);

        pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);

        of_node = irq_domain_get_of_node(domain);
        rid = of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
                        iort_msi_map_id(&pdev->dev, rid);

        return rid;
}

>>  	struct cdx_device *cdx_dev = to_cdx_device(dev);
>>  	struct device *parent = cdx_dev->cdx->dev;
>>  	struct msi_domain_info *msi_info;
>> @@ -128,11 +129,13 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
>>  	int ret;
>>  
>>  	/* Retrieve device ID from requestor ID using parent device */
>> -	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
>> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, &msi_spec);
>>  	if (ret) {
>>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
>>  		return ret;
>>  	}
>> +	of_node_put(msi_spec.np);
>> +	dev_id = msi_spec.args[0];
>>  
>>  #ifdef GENERIC_MSI_DOMAIN_OPS
>>  	/* Set the device Id to be passed to the GIC-ITS */
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index a511ecf21fcd..d255d0f58e8c 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -48,7 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
>>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> 
> .args_count = 1 should be set by of_map_iommu_id now (and dropped here).
> 

Sure, will move it.

>>  	int err;
>>  
>> -	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
>> +	err = of_map_iommu_id(master_np, *id, &iommu_spec);
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
>> index b63343a227a9..729fa2f9f758 100644
>> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
>> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
>> @@ -152,6 +152,8 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
>>  static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u32 *dev_id,
>>  				phys_addr_t *pa)
>>  {
>> +	struct device_node *msi_ctrl __free(device_node) = NULL;
>> +	struct of_phandle_args msi_spec = { .np = NULL };
>>  	struct of_phandle_iterator it;
>>  	int ret;
>>  
>> @@ -178,9 +180,12 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
>>  		}
>>  	}
>>  
>> -	struct device_node *msi_ctrl __free(device_node) = NULL;
>> -
>> -	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
>> +	ret = of_map_msi_id(dev->of_node, dev->id, &msi_spec);
>> +	if (!ret) {
>> +		msi_ctrl = msi_spec.np;
>> +		*dev_id = msi_spec.args[0];
>> +	}
>> +	return ret;
>>  }
>>  
>>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 959305a84748..b6e07c5fe715 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -2102,36 +2102,37 @@ int of_find_last_cache_level(unsigned int cpu)
>>   * @id: device ID to map.
>>   * @map_name: property name of the map to use.
>>   * @map_mask_name: optional property name of the mask to use.
>> - * @target: optional pointer to a target device node.
>> - * @id_out: optional pointer to receive the translated ID.
>> + * @arg: pointer to a &struct of_phandle_args. On input, @arg->np may be
>> + *	set to a target device node to match, or NULL to match any. On
>> + *	success, @arg->np will be set to the matched target node (with a
>> + *	reference held) and @arg->args[0] will contain the translated ID.
> 
> Is this part being actually used (and useful)?
> 

Please refer the above comment. I see there is existing path in
drivers/pci/msi/irqdomain.c which sets np.

Thanks,
Vijay

>>   *
>>   * Given a device ID, look up the appropriate implementation-defined
>>   * platform ID and/or the target device which receives transactions on that
>> - * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
>> - * @id_out may be NULL if only the other is required. If @target points to
>> - * a non-NULL device node pointer, only entries targeting that node will be
>> - * matched; if it points to a NULL value, it will receive the device node of
>> - * the first matching target phandle, with a reference held.
>> + * ID, as per the "iommu-map" and "msi-map" bindings. If @arg->np points to
>> + * a non-NULL device node, only entries targeting that node will be matched;
>> + * if it is NULL, it will receive the device node of the first matching
>> + * target phandle, with a reference held.
>>   *
>>   * Return: 0 on success or a standard error code on failure.
>>   */
>>  int of_map_id(const struct device_node *np, u32 id,
>>  	       const char *map_name, const char *map_mask_name,
>> -	       struct device_node **target, u32 *id_out)
>> +	       struct of_phandle_args *arg)
>>  {
>>  	u32 map_mask, masked_id;
>>  	int map_len;
>>  	const __be32 *map = NULL;
>>  
>> -	if (!np || !map_name || (!target && !id_out))
>> +	if (!np || !map_name || !arg)
>>  		return -EINVAL;
>>  
>>  	map = of_get_property(np, map_name, &map_len);
>>  	if (!map) {
>> -		if (target)
>> +		if (arg->np)
>>  			return -ENODEV;
>>  		/* Otherwise, no map implies no translation */
>> -		*id_out = id;
>> +		arg->args[0] = id;
>>  		return 0;
>>  	}
>>  
>> @@ -2173,18 +2174,15 @@ int of_map_id(const struct device_node *np, u32 id,
>>  		if (!phandle_node)
>>  			return -ENODEV;
>>  
>> -		if (target) {
>> -			if (*target)
>> -				of_node_put(phandle_node);
>> -			else
>> -				*target = phandle_node;
>> +		if (arg->np)
>> +			of_node_put(phandle_node);
>> +		else
>> +			arg->np = phandle_node;
>>  
>> -			if (*target != phandle_node)
>> -				continue;
>> -		}
>> +		if (arg->np != phandle_node)
>> +			continue;
>>  
>> -		if (id_out)
>> -			*id_out = masked_id - id_base + out_base;
>> +		arg->args[0] = masked_id - id_base + out_base;
>>  
>>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>>  			np, map_name, map_mask, id_base, out_base,
> 


