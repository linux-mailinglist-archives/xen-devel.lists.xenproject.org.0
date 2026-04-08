Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLorOR/Q1WkC+QcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 05:48:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7403B6A48
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 05:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275385.1561227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAJtQ-0001e5-1S; Wed, 08 Apr 2026 03:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275385.1561227; Wed, 08 Apr 2026 03:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAJtP-0001bp-Uy; Wed, 08 Apr 2026 03:47:51 +0000
Received: by outflank-mailman (input) for mailman id 1275385;
 Wed, 08 Apr 2026 03:47:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 1wAJtO-0001bT-Ew
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 03:47:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAJtL-00Ds6S-TK
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 05:47:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69d5cf98-e002-0a2a0a5209dd-0a2a4506abce-32
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:47:47 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <vijayanand.jitta@oss.qualcomm.com>)
 id 69d5cfe2-0df0-0a2a45060019-cddcb48368da-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:47:47 +0200
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 637J6Znx071718
 for <xen-devel@lists.xenproject.org>; Wed, 8 Apr 2026 03:47:45 GMT
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sx9b7y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 03:47:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2b24a00d12cso63228735ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 20:47:45 -0700 (PDT)
Received: from [10.219.57.109] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b27478b64csm194156625ad.30.2026.04.07.20.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 20:47:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5GqDnKn52rUOOKe43UhTsLV1PBh6CrPSK05M/M7TzU=; b=DquyzA2Vf1Yevkcc
	ZrdAzF3JRX7sEPuqvNjEnuv1kpB8b+YREurAOYRZx5WAt/g2Js1VA6rI27HSqMXo
	UMCb/9cM5rt1ZYjcsuvGWl2bfqRYXkdb/uVuBsVv3S9WknVIqfKnJh6lfLpIHCJg
	9IUQE2nY6cFF2ypn1jieQjuymNiOogMutndGk2dlGUlGS9lKWQbZFXA6LWU8q1dZ
	JiZzeXWLO5CBHRwd4dylqnu+RedxsoYjO2jX/EAPejAgrwafivbwjW3SC6L+Fp8O
	3xC1heXYvzX0c/k2zPTwagU3QWjOOJOVusysRZvZevb+NHOwl9fcbbA3SAZY8wti
	/0h3NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775620064; x=1776224864; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5GqDnKn52rUOOKe43UhTsLV1PBh6CrPSK05M/M7TzU=;
        b=QZ0eBr8abBkTdnY0mIl2Cq5/cQEjyyFwj3l1Q1k7jq4NtYlyhDyr+acvo/h3+Zjxsc
         VCTbe5JQ1oTGitIGSQRGPm0b4axQB3WaiOtMJIpTOTgsOpzSrXEpYDA1NYWKmam0qdjz
         rbcaXsm/Z9W/flAPq2SfENkq2Qopz8+xIdkHWDMw1xfoMqIQ2o3W+FjMasS3OT62E7/L
         h564kDcfND5t7cVGWVvd2Nq9iNwOEUuWham1PiU4yE6ZAaZjglIvkj939D6c3Ey1M8bs
         B2n2Dwqkto6csY+0RWMSuZTIcmIvbFj0bXkCe2ttBOwESNdlNVKq8yI1OPtAuzbE5xU3
         9RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775620064; x=1776224864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5GqDnKn52rUOOKe43UhTsLV1PBh6CrPSK05M/M7TzU=;
        b=PdmRfXZPnKlJ1Aq5ZJmxQu3gNUMpFk+mIjazuunZsm/nCnxROnoyE1HKFaLZIG+do7
         V08yAYrd8OSMEeIwDvW1L0tcnY13bNCDOGYgla/PEuBjT8w01MRYV3+QFUyPAmB4eMPN
         eEVysVH043BxlkM1fGK+7Qhi6QpSBvw9SGoKYU+ysecHn7aDf3PWvWzS85hzmTc7Rkc4
         FBqn00RAwOmfflJv0IiQzMBJcqEWheoJKQZJtGgXvEbvQZBMCCUcfrkEScMus76z0jpO
         FR4WUvt7ZIKET4mR6anRVZYvmUEYkD8fEl8u9bA1MVgzQbrWKIiRkDNAduZkfuCrHrPR
         EBwg==
X-Forwarded-Encrypted: i=1; AJvYcCW7wZXj1a3h656Frybv7kYP4hD2cpIT5Lf7pekLdDQv/JP8RlZs7d0Wrt8BQCUNVh50RJK/a36SmIw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4KAby6SHq+oBR1ZoR0UjyNBeQtYPUSL708qf8wHt1qp1gSv/V
	OLClPlbjOUTrvxeIHhe5Xqbna1tLfN0iNyl/8ukgQ5eZs7vgPWMCZAL49D7Dg4o5eZredGjhOs2
	mShMpW3z+uoOpcsNu8Yj3X70c6Ma7prqkhDPRbDBo3ol6sykcSgX6C3FOsb2Vv0B2WhHqaA==
X-Gm-Gg: AeBDieulgK7MdGztW91PbybPxRnI1pFBmmpkGX4BJ7SCat6/iOmGfXcWSpdSd47y1JE
	fx5TFYnXR2zG5lD3xvFkTg78yI9ZcTC6Yoi1m40PbHWMC72DmrPUKRIYmEziJa3Abw92WhrGjy9
	amAeGuUhBOT0P3HHxm1o+AwFVtRcPMj6jd9x0xlmg29AOgQml9czl8NSXCRatT4CuTxoxMTpfBx
	gVOGmUQl6Cfk3oxzbB4nq3qQ006iI0p05vQ9IMlOYxdii6CknkZTZ6095ND3GcaP+edaxHI0wfa
	B6BOMwt9RW6FT6MuOMAmrLKFo4V3MLJbt9kz9dfetBqAmSYwua9enHCmS/n1bvauIL2u+UXEwi3
	g6HH8QtQR5lsr2RJvD5uOBbNcLycxQdSRYfkvVfH0yGKXVYRva/EWEl3f
X-Received: by 2002:a17:903:2ec7:b0:2b2:454f:b951 with SMTP id d9443c01a7336-2b28176a3cemr203121675ad.29.1775620064290;
        Tue, 07 Apr 2026 20:47:44 -0700 (PDT)
X-Received: by 2002:a17:903:2ec7:b0:2b2:454f:b951 with SMTP id d9443c01a7336-2b28176a3cemr203121315ad.29.1775620063681;
        Tue, 07 Apr 2026 20:47:43 -0700 (PDT)
Message-ID: <92ee00a9-0094-4481-9156-709b94ba3b82@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 09:16:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/3] of: Respect #{iommu,msi}-cells in maps
To: Nipun Gupta <nipun.gupta@amd.com>,
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
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com>
 <20260331-parse_iommu_cells-v12-3-decfd305eea9@oss.qualcomm.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260331-parse_iommu_cells-v12-3-decfd305eea9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d5cfe1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=OsyBWCJeBE2wmg0BnjgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: U8d-0kMs7f8J6_CcJR3QfzqrrMY0MBgb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAzMSBTYWx0ZWRfX1IwYNaWQUeib
 aTFZNA0JEu4boU+zo2DdRFlGoIACV9Xlm8xA0QIe29DPrQ+mRsRwi+XLXMXo/j7rPWlKBL52/g0
 Gokk5gDVIkzy2f1Ci/R/YZ0mq3swjh/2oflafswhUTwyFQrC8Tbqno75kfmatdSzWsQWrNkYPJi
 lOYuXso3SyM5fZDbyuOP465odbUPq4DI+e+2Ucnlvgo4LYj1XBDySqCIChV4Jk5kuqh94HIqQg1
 QUSI9Z0Zg6TNWbHS1Nysytx/1BDSe4qb9DCC/stlwFtBwo8DhYE1Mbr22B/kJP69IkWGgxqgn1i
 uvMCKjm0O4kjbQHn5HDaez4vvEtQKwwR97WZDITuul9ZkOzJSAmPi5Rp/zOkZRvkBx12SGqj4o3
 NaBtgtIqDEK4osMzNWaIO4XPat7rPhGT2K+Yy7mwNUEQzwzxvHa5GvNzjyJlDYrJ/YHi4mrP9iq
 HnP/jTbjphKtEcMdbHA==
X-Proofpoint-GUID: U8d-0kMs7f8J6_CcJR3QfzqrrMY0MBgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_01,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080031
X-purgate-ID: tlsNG-16d1c6/1775620067-AE12E3D8-58714942/0/0
X-purgate-type: clean
X-purgate-size: 12730
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qualcomm.com,m:cono
 r@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 2D7403B6A48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 7:34 PM, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properties has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use in being able to map at least single
> input IDs to multi-cell output specifiers (and properly support 0-cell
> outputs as well), add support for properly parsing and using the target
> nodes' #cells values, albeit with the unfortunate complication of still
> having to work around expectations of the old behaviour too.
> 
> Since there are multi-cell output specifiers, the callers of of_map_id()
> may need to get the exact cell output value for further processing.
> Update of_map_id() to set args_count in the output to reflect the actual
> number of output specifier cells.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/of/base.c  | 155 ++++++++++++++++++++++++++++++++++++++++-------------
>  include/linux/of.h |   6 ++-
>  2 files changed, 123 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b3d002015192..7b22e2484e1c 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2096,18 +2096,48 @@ int of_find_last_cache_level(unsigned int cpu)
>  	return cache_level;
>  }
>  
> +/*
> + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
> + * specifying only 1 cell. Fortunately they all consist of value '1'
> + * as the 2nd cell entry with the same target, so check for that pattern.
> + *
> + * Example:
> + *	IOMMU node:
> + *		#iommu-cells = <2>;
> + *
> + *	Device node:
> + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
> + *			    <0x0100 &smmu 0x0100 0x1>;
> + */
> +static bool of_check_bad_map(const __be32 *map, int len)
> +{
> +	__be32 phandle = map[1];
> +
> +	if (len % 4)
> +		return false;
> +	for (int i = 0; i < len; i += 4) {
> +		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
> +			return false;
> +	}
> +	return true;
> +}
> +
>  /**
>   * of_map_id - Translate an ID through a downstream mapping.
>   * @np: root complex device node.
>   * @id: device ID to map.
>   * @map_name: property name of the map to use.
> + * @cells_name: property name of target specifier cells.
>   * @map_mask_name: optional property name of the mask to use.
>   * @filter_np: optional device node to filter matches by, or NULL to match any.
>   *	If non-NULL, only map entries targeting this node will be matched.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] will contain the translated ID. If a map entry was
> - *	matched, @arg->np will be set to the target node with a reference
> - *	held that the caller must release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	as defined by @cells_name in the target node, and
> + *	@arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np will be set
> + *	to the target node with a reference held that the caller must release
> + *	with of_node_put().
>   *
>   * Given a device ID, look up the appropriate implementation-defined
>   * platform ID and/or the target device which receives transactions on that
> @@ -2116,17 +2146,19 @@ int of_find_last_cache_level(unsigned int cpu)
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> +	       const char *map_name, const char *cells_name,
> +	       const char *map_mask_name,
>  	       const struct device_node *filter_np, struct of_phandle_args *arg)
>  {
>  	u32 map_mask, masked_id;
> -	int map_len;
> +	int map_bytes, map_len, offset = 0;
> +	bool bad_map = false;
>  	const __be32 *map = NULL;
>  
>  	if (!np || !map_name || !arg)
>  		return -EINVAL;
>  
> -	map = of_get_property(np, map_name, &map_len);
> +	map = of_get_property(np, map_name, &map_bytes);
>  	if (!map) {
>  		if (filter_np)
>  			return -ENODEV;
> @@ -2136,11 +2168,9 @@ int of_map_id(const struct device_node *np, u32 id,
>  		return 0;
>  	}
>  
> -	if (!map_len || map_len % (4 * sizeof(*map))) {
> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
> -			map_name, map_len);
> -		return -EINVAL;
> -	}
> +	if (map_bytes % sizeof(*map))
> +		goto err_map_len;
> +	map_len = map_bytes / sizeof(*map);
>  
>  	/* The default is to select all bits. */
>  	map_mask = 0xffffffff;
> @@ -2153,39 +2183,82 @@ int of_map_id(const struct device_node *np, u32 id,
>  		of_property_read_u32(np, map_mask_name, &map_mask);
>  
>  	masked_id = map_mask & id;
> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
> +
> +	while (offset < map_len) {
>  		struct device_node *phandle_node;
> -		u32 id_base = be32_to_cpup(map + 0);
> -		u32 phandle = be32_to_cpup(map + 1);
> -		u32 out_base = be32_to_cpup(map + 2);
> -		u32 id_len = be32_to_cpup(map + 3);
> +		u32 id_base, phandle, id_len, id_off, cells = 0;
> +		const __be32 *out_base;
> +
> +		if (map_len - offset < 2)
> +			goto err_map_len;
> +
> +		id_base = be32_to_cpup(map + offset);
>  
>  		if (id_base & ~map_mask) {
> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
> -				np, map_name, map_name,
> -				map_mask, id_base);
> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
> +			       np, map_name, map_mask_name, map_mask, id_base);
>  			return -EFAULT;
>  		}
>  
> -		if (masked_id < id_base || masked_id >= id_base + id_len)
> -			continue;
> -
> +		phandle = be32_to_cpup(map + offset + 1);
>  		phandle_node = of_find_node_by_phandle(phandle);
>  		if (!phandle_node)
>  			return -ENODEV;
>  
> +		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
> +			of_node_put(phandle_node);
> +			return -EINVAL;
> +		}
> +
> +		if (map_len - offset < 3 + cells) {
> +			of_node_put(phandle_node);
> +			goto err_map_len;
> +		}
> +
> +		if (offset == 0 && cells == 2) {
> +			bad_map = of_check_bad_map(map, map_len);
> +			if (bad_map) {
> +				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
> +					     np, map_name, cells_name);
> +				cells = 1;
> +			}
> +		}
> +
> +		out_base = map + offset + 2;
> +		offset += 3 + cells;
> +
> +		id_len = be32_to_cpup(map + offset - 1);
> +		if (id_len > 1 && cells > 1) {
> +			/*
> +			 * With 1 output cell we reasonably assume its value
> +			 * has a linear relationship to the input; with more,
> +			 * we'd need help from the provider to know what to do.
> +			 */
> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
> +			       np, map_name, id_len, cells);
> +			of_node_put(phandle_node);
> +			return -EINVAL;
> +		}
> +		id_off = masked_id - id_base;
> +		if (masked_id < id_base || id_off >= id_len) {
> +			of_node_put(phandle_node);
> +			continue;
> +		}
> +
>  		if (filter_np && filter_np != phandle_node) {
>  			of_node_put(phandle_node);
>  			continue;
>  		}
>  
>  		arg->np = phandle_node;
> -		arg->args[0] = masked_id - id_base + out_base;
> -		arg->args_count = 1;
> +		for (int i = 0; i < cells; i++)
> +			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
> +		arg->args_count = cells;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> -			np, map_name, map_mask, id_base, out_base,
> -			id_len, id, masked_id - id_base + out_base);
> +			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
> +			id_len, id, id_off + be32_to_cpup(out_base));
>  		return 0;
>  	}
>  
> @@ -2196,6 +2269,10 @@ int of_map_id(const struct device_node *np, u32 id,
>  	arg->args[0] = id;
>  	arg->args_count = 1;
>  	return 0;
> +
> +err_map_len:
> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> +	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);
>  
> @@ -2205,18 +2282,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
>   * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
>   *      stream/device ID) used as the lookup key in the iommu-map table.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] contains the translated ID. If a map entry was matched,
> - *	@arg->np holds a reference to the target node that the caller must
> - *	release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np holds a
> + *	reference to the target node that the caller must release with
> + *	of_node_put().
>   *
> - * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
> + * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
> + * and "iommu-map-mask".
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_iommu_id(const struct device_node *np, u32 id,
>  		    struct of_phandle_args *arg)
>  {
> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
> +	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
>  }
>  EXPORT_SYMBOL_GPL(of_map_iommu_id);
>  
> @@ -2229,17 +2309,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
>   *	to match any. If non-NULL, only map entries targeting this node will
>   *	be matched.
>   * @arg: pointer to a &struct of_phandle_args for the result. On success,
> - *	@arg->args[0] contains the translated ID. If a map entry was matched,
> - *	@arg->np holds a reference to the target node that the caller must
> - *	release with of_node_put().
> + *	@arg->args_count will be set to the number of output specifier cells
> + *	and @arg->args[0..args_count-1] will contain the translated output
> + *	specifier values. If a map entry was matched, @arg->np holds a
> + *	reference to the target node that the caller must release with
> + *	of_node_put().
>   *
> - * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
> + * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
> + * and "msi-map-mask".
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
>  int of_map_msi_id(const struct device_node *np, u32 id,
>  		  const struct device_node *filter_np, struct of_phandle_args *arg)
>  {
> -	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
> +	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
>  }
>  EXPORT_SYMBOL_GPL(of_map_msi_id);
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 8548cd9eb4f1..51ac8539f2c3 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -462,7 +462,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
>  bool of_console_check(const struct device_node *dn, char *name, int index);
>  
>  int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> +	       const char *map_name, const char *cells_name,
> +	       const char *map_mask_name,
>  	       const struct device_node *filter_np, struct of_phandle_args *arg);
>  
>  int of_map_iommu_id(const struct device_node *np, u32 id,
> @@ -934,7 +935,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>  }
>  
>  static inline int of_map_id(const struct device_node *np, u32 id,
> -			     const char *map_name, const char *map_mask_name,
> +			     const char *map_name, const char *cells_name,
> +			     const char *map_mask_name,
>  			     const struct device_node *filter_np,
>  			     struct of_phandle_args *arg)
>  {
> 

Gentle ping.

Thanks,
Vijay

