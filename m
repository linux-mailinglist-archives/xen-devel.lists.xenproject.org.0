Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFE+Ls2msmnwOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:43:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712002712F4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252183.1548960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eRR-0006tl-Ud; Thu, 12 Mar 2026 11:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252183.1548960; Thu, 12 Mar 2026 11:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0eRR-0006qK-Rb; Thu, 12 Mar 2026 11:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1252183;
 Thu, 12 Mar 2026 11:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DV6w=BM=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1w0eRQ-0005h8-81
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:43:00 +0000
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d706301-1e08-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:42:58 +0100 (CET)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62C9EfQ64025739
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 11:42:57 GMT
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50sws4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 11:42:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2aec784479cso5175845ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 04:42:56 -0700 (PDT)
Received: from [192.168.1.10] ([38.254.186.229])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae25cd67sm56194955ad.38.2026.03.12.04.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 04:42:55 -0700 (PDT)
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
X-Inumbo-ID: 9d706301-1e08-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=; b=HmaP0o5E8kDigSFa
	alJVniCiNF7DjBpO3slqiNJ3tC/PYMDuDwHYrqAZ6m3faf3xBUSqMLfpUEiT0ME7
	uWWAeSVIZ60cNAHJhwuo6Vb8dOptnxFIZD2ZPlI6SJHGh0bEalGe5AilAQjBoaDU
	QZVlr/4PFlZA2kIerIpl0o8Gs05Rqi4LvYe2xoN8EAgrInA5+6ymKHj2jVoDFZlX
	twDN9GpYJxK9TErk0jdzr2qqWM7kBKQCbwArOlfCHOrYnIloY9u/so8cENTOFlPK
	42iYYDiTfRSrfY3aZO54lNm32900MmfmU17DmtlRZIiqhD4bfqXTlQnqegCK9Mod
	59ZCww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773315776; x=1773920576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=;
        b=iSHbZYUbXYH/msHyTMZDMSJ5dYZF62LDRNRJ6QX9yS60Pd1dmBZtOgA0O2VOt1IhAc
         kQ32+BpW1cncsWj+SIqbdHaWrJE3tcP1IcjCkiRRM/IOXwGyM4dAfzlmjS4BthN6H5MI
         hqAVk/AuVn2z3fnMEDuXW3h5yYqiT+tQ1e0yPE/F4I9QEii/jLI09CiQ0AKVvi/rpT9W
         mky5unpUqEgmDhBAhSC3U6mHyBOuQ6EVMuMYyjFkag3UhSLAqYK+ry2kxLcWE9JtoIEx
         DXpuQL9pDy3+yLwVLMkcTRAKlJ+3LLCTRmKVyBY5Kli3mhrZOBlPFJZxKAYEhe5sNWsg
         NhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315776; x=1773920576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9ejYWHNwRhjPiGAgnplcOS8lPIHbm/6D31/N+auTSw=;
        b=nUV98jLJPX/5o0WYDUjbW2k/ElUb5NGPsGMlI0UT0n1aHNxs/9Y+JEyxs1AnShV2PW
         GXsW/zz2qJAzfTVG1Jq3iLK0faMxpkwBimo0Fx/00NiA7oavfVXpw5aHKLnuIULDT+kz
         Ziywyei5egdrbmq+A/EU6zKyaC2dG2E1oG0fpTqufqgEL79Udrn+T18Y4D6VNFIh4izG
         LLSzChnuNqly4d+Wg+Q5DNtMKx3JpvfE0l5BXrgc7iqYlmu2xMDzenOT8ExNAeBz0BMf
         7QbQKs7rS8ua69Pi2L+1keyUv9NJ1vlF/6QQ3gmPhlCrusdGvzueu8Lue6j0Dyl7FLJE
         dxVw==
X-Forwarded-Encrypted: i=1; AJvYcCX8gLK9jXe47lgnU75Y0fOn6W++RLdtdafg/N/u9FlSSLuZSNSKlq2/5tjcTpb4men+oulM+MnEEng=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4ZPKmSMsQefT9NhFTBrNOF6JXmko1Ci1ApFmeHGg2BpL0LAaR
	5C9LHLPBYEn0txQCHdXTsb0vWqs+KUmCpk34FDy1hyrrrGpHz8hx1l57HJj8CKzq4WTvENek/K8
	jroZm6+JDF2inXSJwUUUjm0b/iw/UCuxKROf0Fjfs0WV4GAjZdQQpDpPqaHkQlOEGt8oU8Q==
X-Gm-Gg: ATEYQzxlhZzy4gsn1mhlZ6obx7XbGsH7QmRNAMf3yruB3Kj9j+5CBnCeMaQQPx00+1M
	FGqISmrww+y0brs/UaB0Rc3hHBGc1j4H/2LdW29yNW8ppezBJX5somiQjxbueAafcLF9kVHyB5x
	1bg0H5NkRK5BSsRTCITqoa83lzyR+UebazobH6FWB9g7O5/o5RutSm2/vqGUxJGEV6wdxSU/JkJ
	ooiU/BCpORqO6n3zzyR7ZpVrROO9rbyIHe4b9OIjOl/s2Q+iPWmYugNzn20rRAQMQBy747TdXag
	yZ0JxunL+0losdYGHz5J+YW3T54jvPpbTaRwsbz78n6mXJLzP/DvI7d7CqDZH6UsZl45Fc8Tzgv
	JhYrC+34aR6S0bmDNQxpbsRtAf2ZLsp3V6GCaMzoj5aDNhjxjfuxP9+QCKg==
X-Received: by 2002:a17:902:db06:b0:2ae:3fb2:ec9a with SMTP id d9443c01a7336-2aeae7ad446mr64958905ad.16.1773315776355;
        Thu, 12 Mar 2026 04:42:56 -0700 (PDT)
X-Received: by 2002:a17:902:db06:b0:2ae:3fb2:ec9a with SMTP id d9443c01a7336-2aeae7ad446mr64958285ad.16.1773315775895;
        Thu, 12 Mar 2026 04:42:55 -0700 (PDT)
Message-ID: <04eabe08-f339-4d9c-8b61-184241d192a4@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:12:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] of: Respect #{iommu,msi}-cells in maps
To: Bjorn Helgaas <helgaas@kernel.org>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
References: <20260309210849.GA591344@bhelgaas>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260309210849.GA591344@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -jTU0FV6wIePD5MNaxJL77M5TIEtPsZC
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2a6c1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=FuYIH7Xx0xzBSkYrynBYgw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=2oAOsZZM3GA0Nya8fkwA:9 a=QEXdDO2ut3YA:10 a=d1F_yjlUjjEA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: -jTU0FV6wIePD5MNaxJL77M5TIEtPsZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5MiBTYWx0ZWRfX/5lnslTB10gF
 jr9cUxVVFPhev1rgechAxxUkDQFwwlfffG3J+vEmhVZuu1Uws3tlKDZYTchRJ4r7/bf5xnvPHn8
 l5BjPinxVIyFuxH++8Oq5MeN0/Ff7YzhlLiCGF+fslq31rBza1Twl/fUpl3xte8C2Vk55z4o30f
 bvd2OW1PfDIGwvpafLzsK6JgLWwiykqb1i1lTt/YBF63shAPYQGS78flEZ8RzSxVtJprNNnmpa1
 IFot+2Q2yyUKxxJL+SajUIkoF0LezDKQz8/SfBwMOkA+1DGVAfwSKwJvFTVB3wG3MW9XraVl1ID
 EUb5lixAMsbtLTLmc+ZFUCszmYVmCVE5yuhdtQNKWXYYaV+Uh3r2FuDnoDUZ56EtGewf50jGo25
 e1vE8SBggQ8bq1Axe9tto/3zyrNO2bSi5pvVXS9IN7M1nWRwDcW3Pk+BfBWl9gbkHs66+HduwYJ
 rk72HbZ2q/I/k2eBhFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120092
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@os
 s.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 712002712F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/10/2026 2:38 AM, Bjorn Helgaas wrote:
> On Mon, Mar 09, 2026 at 01:03:39AM +0530, Vijayanand Jitta wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> So far our parsing of {iommu,msi}-map properites has always blindly
> 
> s/properites/properties/

sure , will update.

Thanks,
Vijay

