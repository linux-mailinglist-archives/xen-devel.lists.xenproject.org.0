Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEp6B5WRjmlADAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:51:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708461327A7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230086.1535674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjGA-0007R7-81; Fri, 13 Feb 2026 02:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230086.1535674; Fri, 13 Feb 2026 02:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjGA-0007PV-4v; Fri, 13 Feb 2026 02:50:22 +0000
Received: by outflank-mailman (input) for mailman id 1230086;
 Fri, 13 Feb 2026 02:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gzd=AR=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqjG9-0006yU-5U
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 02:50:21 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb2b3b1b-0886-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 03:50:19 +0100 (CET)
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CNHjn81146939
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:18 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c9rd8s08m-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:17 +0000 (GMT)
Received: from SJ0PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:33f::32)
 by IA3PR16MB6656.namprd16.prod.outlook.com (2603:10b6:208:524::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 02:50:14 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::89) by SJ0PR05CA0057.outlook.office365.com
 (2603:10b6:a03:33f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Fri,
 13 Feb 2026 02:50:08 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Fri, 13 Feb 2026 02:50:13 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61D2GRns2516936
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:11 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c6mq5denw-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:11 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id qjFxvwTiNP7uEqjFyvDLMl; Fri, 13 Feb 2026 02:50:10 +0000
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
X-Inumbo-ID: bb2b3b1b-0886-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=cr3
	4swkzcPcEXFdzaCMCfFmOvkyK/MxDYdRkiiZHB64=; b=FlvdE6UGhioOJdsYC5R
	qYz3qWLavepjydteh72FAwKrSKY1yueBi9Z5roB7VU4RewBpj4xgt9fwAL+ZBty3
	cfJ84piWZMP2EU+4PMG7McEJhAmlZIMMBTGUFlSUKo8nHz1+LeQPAVst2dBMGnkD
	AnMh1hfjoHd9RSzKdMhffvGWVUpjtZ6f5/Cf4FLM+d4U28Xr8s0agtvjk+51b5oz
	5cSp2iBH6uCtC5mcFESVLZxz083i1SyDWsn8K+2bt6MmC31K4qRlrvQqevYNvEzn
	LiPc12oTu5p9nRWLD5Z7NciDWnaEjXHWXqhHmXNtiI5jdRSHxCDTzB5qsRMeWUgE
	qUA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcJvPb7UUCQyQxCSk4Fshr7AZB1UJC6TIfZzFGuCOSTZinuthgVLtI5HRPU9ImG2uzQegKpQ8O9QbTHNLX5FWqXAmUNDiSSIanSPJBP0fgnhHEzMIF5QnQ8B1poDILsX7is2EEqH9Bk4FNWWXH7Mjc+QeayVUhOXLWwBRX0h26rGPx1cYxJD9PU1tgoMF0dJcMkSweISAO1gn38Ul/PiE590AsRdRTr4NAanYrQJYxa0S3mxHeJtmCGIhUwga2M6ro/xXUJpmJJJu4EXRz7APgPfTVTZWR59OSadI1LJzRV+iHcYDObmV8TEZPcal93UyH0ce7bMrigKsIQAHVWN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr34swkzcPcEXFdzaCMCfFmOvkyK/MxDYdRkiiZHB64=;
 b=f2jaJfKT5WkIOCJqGY12u8c+7tOnSLnz9Xm6wBMwoHu+qhBdJDEAaZ5cMvi0a+uYVGr9qii7tQX5qKDrkqZmPpLDnE3MkYckQUBP3xy8phe24FY4xSXczP/DwqPZn1BlASMDN6F2AEhxtpB8lB9GVnGdyAnd9BbF6CKR+sYY2P+OZjKTe64Bb9FbbT8IofONgdSMSCnAL2R8T/VtyYLILC6ba8oYAr7d76lQtRU/G995+CXWrIV2mF7+GvCNDoTVSYBO2oH2rUupv4RzVGAqYyEIsZM4MJi+pbkUSVVOxWuOx1YY6DfUEy8/U27OMLprLyV0YrRqPaJf2F3djXrurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr34swkzcPcEXFdzaCMCfFmOvkyK/MxDYdRkiiZHB64=;
 b=RaR/4P2GLekKtdZdhWyexYY8MU31OcnNUveix9B7oRCpp9FZC68hxnGFDUUczfa9U3kDAg6kji8GMwZK5Wo+P1doCpsu2Wzr0TKeWKm/ndNP51XfuJb/WK7eS4DMPlLjVCuelD2/2qKNkRNvmSlshLOZk2JXt/dx4dcuEmUTGJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=cr34swkzcPcEXFdzaCMCfFmOvkyK/MxDYdRkiiZHB64=; b=
	VdWnfmQ4o6RzDBLEdttxsZqdnIfF7GQMqLhdlbAbOnJYOU7XDsRzCERMm3Rh1zVx
	o+6vCq8ToVu1Ab5r6glu8QJ1xAYlO+qA6ejG/ZbGS7BdT2Xj1tdzy7XjL+M8pXEf
	ECZHBn6K45ykRGc3ojy10mKyxYIvKBTTgUtniQbytwrLJQHJdIUFQV5poc13ltTB
	+npniI4b3j7Yb0zr50uTWki7lC2IpUivHiXgVC5Gi4wOKCOJPW6cZP9F32x+5noz
	zeRQzgpfZAvmYIlNNW6UQRO5gT23e0u52YOW5ukSTkCJKlB0nNvHzetsWyId6/mY
	zpuBT24D0GULCymydOkHOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=cr34swk
	zcPcEXFdzaCMCfFmOvkyK/MxDYdRkiiZHB64=; b=XtURWT2GNgxrdbQ+WjQuVyI
	1jD/QYRIowwtD0qTdS2Pn9Lrk99nmgOTsr5iUSTcGthRWklYlubTJqU3CshAGD2Z
	/9MJ3pvI3OzVPfC9DYrr8vhcT9X91vt0afSnNfS+3BmACgisU3VrW/oX1yAuHOmP
	ObYDaneOW0X+sziXryxmAbSih3R8TfHsiOGZ1x3uoj4pAvE79GODEDFotHB9jl8i
	FT7jmWVSmADtJtk3lwBAxgSJwlwZnJ+RHt69q1yaOGD70LOX41+YZ/tDTADj21NX
	WJAjQDQHjyov7OmCZFwl8+ZDeBq2NU0HwjllKulC7cBiouj2ueheaW3RtwNQmvA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qjFxvwTiNP7uEqjFyvDLMl
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 4/5] tests: use unit test fragment in vPCI test
Date: Thu, 12 Feb 2026 18:49:51 -0800
Message-ID: <20260213024952.3270112-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213024952.3270112-1-dmukhin@ford.com>
References: <20260213024952.3270112-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130019
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|IA3PR16MB6656:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 125db805-8d80-423a-ea48-08de6aaa9c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0a+tlNDUQLoUg7FE92BcMziy2vV/peSDJQGXjHkQbiLYqZcs6qJysa0TeM4O?=
 =?us-ascii?Q?AigjAuhf7P1zsA1yMsbCruQmZTTOPlLEnn80EmheCi0BBzodvRw12+u12VCG?=
 =?us-ascii?Q?BrYlIEGminkpHn2rvFISSiz0RaNaj5tVI1sAXuhHz87eR4m3QPyleSfMLCqv?=
 =?us-ascii?Q?X9tYO39tj+c9hbboFwCbtgriIl0Cp2F6o5njTq09kB1rQwvTI/7pJPD1DQ+v?=
 =?us-ascii?Q?8UH/TFZP3NkrIul4YlR6dkXY6vdDh2BwiD3hObjjdvfK7ikt8mfFB2NJH3gE?=
 =?us-ascii?Q?XnsQAoaIZ+Y6v9p9oINd6kowY1tFVHgI+D4euZI6Fa14QNUDB6KAiFPsMP/n?=
 =?us-ascii?Q?TbMp77wOl0vxRdNZD0x4d/yvwZmNTb/1aUaVOfvr5kS8pJssNExa5pdOwu2x?=
 =?us-ascii?Q?TlWuZx2r/btpNwBhW7gOMAeF7ohXtyIhqGLZyJOWdNd25Tw/Zbl2Y9+9cjfT?=
 =?us-ascii?Q?dhHLuSWnzJgiHDOpBgnTVaTr53EyyLmoVab/gbzoD3nDQpUVuaV8RxfdwbwQ?=
 =?us-ascii?Q?zG08Xs+7r0znTYXbAV9zfsHx7G7wmiRJx/MrBuqfQMhQ1Rhg5TKsrEAGbgw/?=
 =?us-ascii?Q?ssMXs1bgF8sY/DK3VNq5OIIQpEYXOgEKn9MfLPuSANqSNbpRy5UpLQCVO2HN?=
 =?us-ascii?Q?yjzJNq+2z9K89t36+gYA3EhcZo2J6eUxlP0pCTNc/Wvz6EZnba6ZnETqE0yP?=
 =?us-ascii?Q?rdHazsYeTP/z0vo05ctuBEoJBc6DeDjtOCeeYVPmAnlBut9lmK6YMJgPld1b?=
 =?us-ascii?Q?XKfxreYXDoGjbnbKOQpL84rE3cniMr45uitJUdRH+M7AgWTwD+Kpf7oxJC/4?=
 =?us-ascii?Q?+Pe+Sg/eQYRul9QdxEKMn4PghZarLGYYPqEm6rM0+C5XHNBOkmm2Qqt4qH5B?=
 =?us-ascii?Q?RNDlehRN8eAtQDvtRU0N8GJhaYTXS9nsFeAWvKYOl6Hfqt0TZFqgImo7z3yj?=
 =?us-ascii?Q?wyt216b4+EjEaKk/H11biMhb/J5j4fDUFWSDitvArcZblw7H0GifRF6AWbOF?=
 =?us-ascii?Q?n3ptYgQSMGxq+MUateKLl8r2jz8/Uao1lksUtumQdE+5gNOLmvD5H7LR3Qlj?=
 =?us-ascii?Q?DVPcMiFw/kbOymeBEPyiu0eZoRXhffTi8OTiFkqG8xqmDUhYlQdIkrkEXrAB?=
 =?us-ascii?Q?zHX0aa3f8tFQ72/D2BQFnBHuBUzMSMsQeOOPDD9zR7iEzX0OeatawXOTKM5g?=
 =?us-ascii?Q?wxvqk9r8hSKIDP9owVvhFoktaQqzPB++faKoTbCaGzZOs9aDkjyqazTYL+Vb?=
 =?us-ascii?Q?9SQ8VkBNYFFsgxMj6axcNArUVj9H0aIoA+s6A3ncPT1xNy73w5jsUlXgPG32?=
 =?us-ascii?Q?/X/ktvA8sKn9xQ++IrKSs3pOAksgimKCyIkZyOCtiPxHd0CQfaznvg627p7u?=
 =?us-ascii?Q?UlEHm3n7mniMgqUFT+sI+oSIIBUkcs9hYut67t219CXvx4FdlOuoc2qehP6D?=
 =?us-ascii?Q?KvUjlp4O+tCqBrHAI5CIcpKlvF4N3sZkEkCA8J1yQ8KvVPduh9D0zrvrVPzf?=
 =?us-ascii?Q?Almdsrp/O757UuYShdzJBsMry1rWEnoZ7neB+lVokr+zRwHWBaS7nVXNRkEe?=
 =?us-ascii?Q?DeWTDPXatWHJkJ+vIZInffKZoL+d3Fl42c72NeU1KxATKquKjvMbdskhbt45?=
 =?us-ascii?Q?SADN/1hNmkpWJ86je6f7RxOBTZJWm7kfFF8tj6T4lIC30Gt9zHCzEH860evP?=
 =?us-ascii?Q?KwmMCQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SpTvt+w5NOsdoxKHglmCCbhmi2yjBXzYYjuJiKRBfye96a1EYnYmV/9joUw8l532cIbYdV/XJo8vd1rnc/TVmckZyjbNB/MExedUmpvDPlcyW5P6lqLXAY3wDDyprEaFmUE6fnot3ScZ8vClbgG0FYoPJAOqCpmAbyhSCR2luEr6J/kloopZoi5ZLuWP/a2Qih0RbZDKpY/i406gEUWjZNUXqtNF0eJiIJ4Zv3UKCof2auTiiOOEynTQ7TqK4Gbz15NhHOCWVN1XX4tM7s1d1xDdNCEv20yM7m8XQltuF5s/7m54u4RLW8NgMgb5GP5fHZbHfGbpK2Z1A6Pkrns3w5ifkCWJz+YghjePQIIR8virAQLeY6kr6df65yCoZyBUqfoXTIvH4mCfy+IL1aDrnquxLzdpePSHtPU4TG18ugwp0bkXmiR8C/hfKjSRInfp
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	emsIhVwOUrAPl3hoX33MC1qa2SABx7k8tYCDWPX3UaEZDM0C5RfTxtVHZuVyJHzG60zJf+VngE4MVTp95CM3i2ogKVaQmHz+KPY8Ywf3NsYg6VN8C86og1Q7XxeBg058yFiT8SfYpp9lQQJ53H39XSIZRNsmZzcNWNIEsHJ0Z7Yms1qwG9tgy+0oxljF4ZrABcbIVs4eY3EML91hCHIZQEbU3uL+U/qgA+ZDaOLWB8Vz34FwBsIjzNqyhmLpVsr+z1GjqjZwH4Plxea7lqBQAkuhmGMoEpYFY1FxHqrhL9ldYvAW1bLfTczQLxuoYo8XrUFr4ydR/TrpzJFzXgPjio8333Ke+qKW1jqSW6f0+ygD3KpOkcoWYIemr5RhcwjZmSlz6bKAJITihqpASBD+/1eaiayE+exVI75iEnAA0ZgaGRYmBcc6CzEjpHpArwcdrvrn1M4dnlRSne10O62CAiCAubpGQj3UYKNBWmJj0vQH1/wkpwJxe1GfKgbeVHkJvK5SPxWR0gEHN5FDV9hsmd/EB+D1pP8CGk9ku6yAXPGCJKGW74Yf7vG8D0IlIQVlWupAep6/DjERCrSz1WY8rZ8iz2NU0mziFmHJSc0Bi38e9JRi3drOFDKodnCb/Y6ts54BQ7RsPt+FLXJY81LVTw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 02:50:13.3035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 125db805-8d80-423a-ea48-08de6aaa9c69
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR16MB6656
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAxOSBTYWx0ZWRfX51gKSNGCgWoe
 TLrEDXWzNhrCJxiplWj0J2HbKuxSGab1CpqHkMBdDHdWLwFDiH6wwHuke9lrG4X8LjyP+zNKMB4
 m14JDDmhMn4RbpQ4H3y+EndzKrneZCbB0pufGm5lfU6X0MFS40qpZOYACZbjDxDGg7Y/ydcJfah
 UDG6I0aciWCTFVEwflIulNGrBYvECAj4sr8kSEPt0fVj3keetZnKe5W/GJUo6MOLv+Wy4aRpvWW
 DAPFVFD3+xqFylPZafvsbj6ozsYT2+OGMK3SyHSd/ZD9OyvGgwbdG0VFaP0CUmQadLxI7gVUhXc
 s0tyu5cCyLqrv3uzebJQUOIUDdxbza0ndOKKGNUhqZtq7tWdq0pP1cX5uzfgpqYcvX4OZ2U+Ti4
 GuPXbe7Tp2Q5UggQmZsv7h+c0l1ZGNi2GpcUzbO2hS5cYZav93nkIDdZQZYjoD1XALFXz8EknKO
 AN16LUaitmuOOCXz8zA==
X-Proofpoint-GUID: hVYd24ooeBcXJfvepN7LdCS0vGs8Zsno
X-Authority-Analysis: v=2.4 cv=SZ/6t/Ru c=1 sm=1 tr=0 ts=698e9169 cx=c_pps
 a=KbXMGX1SJVu0lhZGOc8PIA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8
 a=iIiM3PgN9BBgacVs8QQA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-ORIG-GUID: hVYd24ooeBcXJfvepN7LdCS0vGs8Zsno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 708461327A7
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Use the new make fragment to generate test harness code for the vPCI unit
test.

Add new prepare-harness target to tests/Rules.mk as an optional step for
setting up mocked environment for building a test.

Add ability to override the test harness header file.

Fix hypervisor headers used to compile vpci.c against host environment
where necessary.

Fixup emul.h by adding missing mocks to account for new unit test infra.

Update .gitignore to exclude generated test build-time dependencies.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- moved hypervisor headers changes to a separate patch
---
 tools/tests/Rules.mk        |  8 ++++--
 tools/tests/vpci/.gitignore |  2 ++
 tools/tests/vpci/Makefile   | 52 ++++++++++++-------------------------
 tools/tests/vpci/emul.h     | 50 +++++++++++++----------------------
 tools/tests/vpci/main.c     |  2 --
 5 files changed, 42 insertions(+), 72 deletions(-)
 create mode 100644 tools/tests/vpci/.gitignore

diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
index 8c4881e35da1..e8a9e82320cf 100644
--- a/tools/tests/Rules.mk
+++ b/tools/tests/Rules.mk
@@ -10,13 +10,16 @@ $(shell sed -n \
     's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
 endef
 
+.PHONY: prepare-harness
+prepare-harness:
+
 # Generate mock environment by replicating header file hierarchy;
 # each mock header file will point to a harness header.
 #
 # $1 Hypervisor header.
 # $2 Test harness header.
 define emit-harness-nested-rule
-$(1): $(2)
+$(1): prepare-harness $(2)
 	set -e; \
 	mkdir -p $$(@D); \
 	[ -e $$@ ] || ln -s $(2) $$@
@@ -44,10 +47,11 @@ endef
 #
 # $1 Hypervisor filename.
 # $2 Hypervisor source path.
+# $3 Harness header filename (optional).
 define vpath-with-harness-deps
 vpath $(1) $(2)
 $(call emit-harness-deps,$(addprefix $(2),$(1)),\
-                         $(CURDIR)/harness.h)
+                         $(strip $(or $(3),$(CURDIR)/harness.h)))
 endef
 
 .PHONY: all
diff --git a/tools/tests/vpci/.gitignore b/tools/tests/vpci/.gitignore
new file mode 100644
index 000000000000..d66c2cd56be6
--- /dev/null
+++ b/tools/tests/vpci/.gitignore
@@ -0,0 +1,2 @@
+/generated
+test-vpci
diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 97359ff67f86..a885ce41b73e 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -1,43 +1,23 @@
-XEN_ROOT=$(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Unit tests for vPCI.
+#
 
-TARGET := test_vpci
+TESTS := test-vpci
 
-.PHONY: all
-all: $(TARGET)
+XEN_ROOT = $(CURDIR)/../../..
+CFLAGS += -DCONFIG_HAS_VPCI
 
-.PHONY: run
-run: $(TARGET)
-ifeq ($(CC),$(HOSTCC))
-	./$(TARGET)
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
+include $(XEN_ROOT)/tools/tests/Rules.mk
 
-$(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
+# Do not mock xen/vpci.h header for the test
+prepare-harness:
+	set -e; mkdir -p $(CURDIR)/generated/xen; \
+	ln -sf $(XEN_ROOT)/xen/include/xen/vpci.h $(CURDIR)/generated/xen
 
-.PHONY: clean
-clean:
-	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
+CFLAGS += -I $(XEN_ROOT)/xen/include/
 
-.PHONY: distclean
-distclean: clean
+$(eval $(call vpath-with-harness-deps,vpci.c,$(XEN_ROOT)/xen/drivers/vpci/,$(CURDIR)/emul.h))
 
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
-
-vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
-	# Remove includes and add the test harness header
-	sed -e '/#include/d' -e '1s/^/#include "emul.h"/' <$< >$@
-
-list.h: $(XEN_ROOT)/xen/include/xen/list.h
-vpci.h: $(XEN_ROOT)/xen/include/xen/vpci.h
-list.h vpci.h:
-	sed -e '/#include/d' <$< >$@
+test-vpci: vpci.o main.o
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index dd048cffbf9d..979e86e2692e 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -34,8 +34,16 @@
 #define ASSERT(x) assert(x)
 #define __must_check __attribute__((__warn_unused_result__))
 #define cf_check
+#define always_inline inline
 
-#include "list.h"
+typedef int64_t s_time_t;
+typedef uint8_t nodeid_t;
+typedef uint8_t u8;
+typedef uint16_t u16;
+typedef uint32_t u32;
+typedef uint64_t u64;
+
+#include <xen/list.h>
 
 typedef bool rwlock_t;
 
@@ -43,10 +51,6 @@ struct domain {
     rwlock_t pci_lock;
 };
 
-struct pci_dev {
-    struct vpci *vpci;
-};
-
 struct vcpu
 {
     struct domain *domain;
@@ -57,35 +61,17 @@ extern const struct pci_dev test_pdev;
 
 typedef bool spinlock_t;
 #define spin_lock_init(l) (*(l) = false)
-#define spin_lock(l) (*(l) = true)
-#define spin_unlock(l) (*(l) = false)
-#define read_lock(l) (*(l) = true)
-#define read_unlock(l) (*(l) = false)
-#define write_lock(l) (*(l) = true)
-#define write_unlock(l) (*(l) = false)
+#define spin_lock(l) (assert(!*(l)), *(l) = true)
+#define spin_unlock(l) (assert(*(l)), *(l) = false)
+#define read_lock(l) (assert(!*(l)), *(l) = true)
+#define read_unlock(l) (assert(*(l)), *(l) = false)
+#define write_lock(l) (assert(!*(l)), *(l) = true)
+#define write_unlock(l) (assert(*(l)), *(l) = false)
 
-typedef union {
-    uint32_t sbdf;
-    struct {
-        union {
-            uint16_t bdf;
-            struct {
-                union {
-                    struct {
-                        uint8_t func : 3,
-                                dev  : 5;
-                    };
-                    uint8_t     extfunc;
-                };
-                uint8_t         bus;
-            };
-        };
-        uint16_t                seg;
-    };
-} pci_sbdf_t;
+#define lock_evaluate_nospec(l) (l)
+#define block_lock_speculation()
 
-#define CONFIG_HAS_VPCI
-#include "vpci.h"
+#include <xen/vpci.h>
 
 #define __hwdom_init
 
diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index 2ef8d4e03f1d..3753417e866d 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -189,8 +189,6 @@ main(int argc, char **argv)
     uint32_t r24 = 0;
     uint8_t r28, r30;
     struct mask_data r32;
-    unsigned int i;
-    int rc;
 
     INIT_LIST_HEAD(&vpci.handlers);
     spin_lock_init(&vpci.lock);
-- 
2.52.0


