Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGqyC7h+pmnhQQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 07:24:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B31E9970
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 07:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244558.1544008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxJAS-0005NG-Ey; Tue, 03 Mar 2026 06:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244558.1544008; Tue, 03 Mar 2026 06:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxJAS-0005Kk-7z; Tue, 03 Mar 2026 06:23:40 +0000
Received: by outflank-mailman (input) for mailman id 1244558;
 Tue, 03 Mar 2026 06:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uw6b=BD=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vxJAQ-0005Ke-DN
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 06:23:39 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 804bfee5-16c9-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 07:23:33 +0100 (CET)
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6234U97U3271727
 for <xen-devel@lists.xenproject.org>; Tue, 3 Mar 2026 06:23:31 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4cnrp1gjg9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 06:23:31 +0000 (GMT)
Received: from BN0PR04CA0129.namprd04.prod.outlook.com (2603:10b6:408:ed::14)
 by SJ2PR16MB6249.namprd16.prod.outlook.com (2603:10b6:a03:584::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Tue, 3 Mar
 2026 06:23:27 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::9) by BN0PR04CA0129.outlook.office365.com
 (2603:10b6:408:ed::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 06:23:11 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 06:23:26 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6234Rh771461801
 for <xen-devel@lists.xenproject.org>; Tue, 3 Mar 2026 01:23:24 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4cmk4uakj9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 01:23:24 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id xJA9vVhMbkQ6qxJAAvRcZW; Tue, 03 Mar 2026 06:23:23 +0000
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
X-Inumbo-ID: 804bfee5-16c9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=1LRWpccveiPINMTJncKdme8CBh1
	yL3XssSG6j2s783Q=; b=SEdZQOQsyKUVNdcPJiOONvdqqUSlSrnclbM0oJoX2VA
	6524D7+/Z0KrVLSki9XMas0TNigFwPlNygO5cHgkwa5hwGY3PFGs6Ce1EjbxNJ44
	kWmT+SZMoVzO2X3BC6DoPBqqoVPrUGw0t0zQdszozt7/UKkhyUcF9IODRvnNhQoH
	A4/dkI0NEzsS2AtfFkTEMfLnG/AAKqSTIu0/bXwBGWPfuvsZC6H85rJlhXlJPw9S
	3poE1BtCf2o1d6d/g2W48NYHsvp5xJ27c3W0sviorxrotT86T02afK35LT7/h21m
	S3/gfJ5PXTs367DLOBrg7b4FO073msfX4I4bHN2uABA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9r/3UZNnrjNbK1vbIhL2jOKK8ObjdWn0Y4IXI9ZbxPZygCEmo+6A4wt99JNUmf+JYTSwmBUuokSjhgz0mhWprV+i8uHbmPhQTHXF3wX0tbQ/8vsrZEyIxbrO0sMpESdZBWU8I+Z+QyJhNZoU8yRd3U0V4EjjchNvIHhRJxCw+hzApJxr3IFDMf4R5RkWtCqUyFWsOq5jT2gjWvAN+AX1e+Dv3ocgPYF0pGX/s/JlWmIwh8YnGqz4iGQyvlz3yHlN0lc4CojyLokMO9YlSD/yd8YRyDvs51jSJWNIG9TP4XsXDN+vXbWj+e0Ph8NKmwdMh67aXm26mPt+erZTPYzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LRWpccveiPINMTJncKdme8CBh1yL3XssSG6j2s783Q=;
 b=MHZ2rHg1I4GxHocSGd/Fa7sGxGM/u6WUicJ3D+L3g03PgJXAwtS+/OA/kREQNLv577bW/NjmrDAuv7B93MgjXdDyZAo8n8YXLdtOPybFyKMkie7BVJVwFMna6xebsyUnL2T2Hpa9wPPORAWj1PwLKKJXT3ktP0u69InZ9QTxCuQfjJX/fplXkjgqNoBeo5CG0iaFbvUWEBeQd9Cf10RkP/buTDadpyi2Ypa73nB9XMwjs/Q8aRSEa0dc8PRoq0DR7ee914dK9uVZYgwXBvyUn7EvHP+JOPg6reHIjVpeSP14Q6xuk6eCd4/8Zvc9tplHgEiym/hLw28fYOy0mtDrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LRWpccveiPINMTJncKdme8CBh1yL3XssSG6j2s783Q=;
 b=A1jAwvscdRgWqQRM7ycE4/sxAo9iDOTD0Z450YaVvi30hM4XRNUbePHS+r1O36ggAXbRwlDvrhIMeIbC7k0T6/BnUPBYBs6ujtjaFoe/vY7QivbJ82UUumRFu3v++udPKiDT94hMciiydvJl445JG2WL5o9KAfY/FfdJLDsyC/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=1LRWpccveiPINMTJncKdme8CBh1yL3XssSG6j2s783Q=; b=ozIEP8gCBNRS
	vSKtE878JtQM7SmOSoNzECeCSeAFlgC+Gb0BBTVBeuCjYgC23T4FxGqipzg2ail5
	v3ykUKZEfl5xxSudf4252d+RkPFRnsDSsPmbt2AQZjO//irb7VX1G2fJO7qYXxsy
	afk6jfe89TUeI5S9xPFKz3Fed1vuVv+Y/p59zW3VKc33FxIg2dJFyzn0zeZKbizD
	zY2h0IVWqZ8m9I4LK4QAikFL+vaAzJRtXfhoPU2B1J6y3t2wapkeECPrTuJl8Bu9
	JJkHwhXVgMGQJ+NYFrn6Inj8M9A1Aa2BmMoqYrhE07UOWLcrG9txVw8/IiYa1Swm
	LWn4Xw5PGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=1LRWpccveiPINMTJncKd
	me8CBh1yL3XssSG6j2s783Q=; b=Ifq0aaI0q3R4qrB9y5l32amdMI7GeftkzkBg
	In92+tXXd0okEc4RyTa6tMePQxAOvOY7oLAje8utCiO4EfBXRVpQyKbCU0bsD234
	UPbWY1dpASS3y3KTfs8IaDoLPnRXZ6n8oudGJaFtS37VxoQsWsUA7XrWWNNn2R8e
	+F1DWkZX4tLtTa9VbEcE34IE6UaYKySV2hFEnJ8WqitspeBITCP1bxzetuHYNO0k
	k8uSssMSseDWuwOrAv8DwgfJxIB+69LYiOYD8WMgFuj35Zv5T0RhfjFZ2J0dReSo
	tzg3IdcYFg4B7ezVJQhg7ibBFhtSR2sTrSc8NZw8W+uoooHeJw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: xJA9vVhMbkQ6qxJAAvRcZW
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Mon, 2 Mar 2026 22:23:21 -0800
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v5] xen/domain: introduce DOMID_ANY
Message-ID: <aaZ+WZq+qTYaW+Sh@kraken>
References: <20260205235126.3764953-1-dmukhin@ford.com>
 <aaWd2d8yzU-mQ6Ub@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWd2d8yzU-mQ6Ub@l14>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603030041
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SJ2PR16MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 9447569c-685f-40b8-57af-08de78ed60fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	X4l1qC6068PLzAYQIZCFaJqZrHrNE3pj/ACiUyJmHFqFWxCIBW/4l+H75TeStepUTOhe5vZBgtfXw77lyePEqLlr8t/li5N13T0YiflE28ZKuxSX35dvTxt8dL6Umy7GOaFZPi8bWwlgxPKpDVn3CvkRpGOpJKEbOU1vMjaZ+8HOrCV1MbWtS2kvYr1goM4/Oj+qWlOXnm68UemFGa45ZooUc0oc69ceFitc0rM51LtC+uzBSrrcoPR1lvhi0+LEAkWvkyh7nZzx0u9N6QBBPm843dEvQLdd5mcIo0tneDRmCOUssiW2alejcgY6CpQ3pM8A0ISxWJEusQtDtkl2LZ8Q5Pm1VUfAjCxa+H7C1rKlqUzA+2sZv08PZiR5hG6G3A/8YXHUrxxMqG1oS+5meEOcp9OzOgYytZ31iiXxyM2Ijoa8YEEsb26G2z8BPwC6EeimViOsKzfm26MBXUCH37LQK/6G5cvx1DBQC98m2r8BtjfCQ5MImmnoUBlxAzFaZZT12dqx4k7VgRiyAahIeiDt9qhEUOBpNF+Pdclqt5KN8VU3rkxW7w0WycgwffzQh6VSk6StLZGlhbYoY0HGTJiCoCusTrqZ4X18HlCi3Y44Uoue/dzn/j3KSeY8xhb8lroZD7POuown/5UausC/RevS+d5zbtMsspFKMQ8gettbfKtoNPJHK5nWvjbQn2JsiznKCkJZ/zlmSibQ18yuL4v8GSn0jrx56rl/ELtHAxsIcoWQlHBa44aGoVfcot9Dt+1mZsYfv4T9syLwWz7D6AeG4J/ntXEaNf5h/H5jNC+oD1WVWyL6Rk49vNin0VmKCfPq+wnjyxkbYUKASL/VWQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZVQNJxwZXIuu84crdOq/KWVJns9hJtH63bi42/87rysQCF9HKg985Bv7E2+3n8ap8/lvC15dEtJjPhuHxH9munT8Tl7GNh0rpHGSqavnLJFJ047PoAK8a7j86HIMniOHi6dsuUlBOV1yi6IkX4F7x7z7xYruWPekOMdXYV7T8AJk0mfRRUXt58UeEbxDFfj/J1trg/JWRVOD+8ejMmJ8jF62BrW39yst6fIzcgsHyGCCQQ2ukjB1PVrCaiF5VurOcdgfAoT9tD5TQty+ycrerzr6a6kudMbcSrmcW7RB9/52+APEegDRa+/nY6FHZqkl9E7HBOfIBE94BwyPWB+e99SJ6Q6xbsHWoY23hDY7caesN7CmyYyzLiEQnqQsZ4zAtlol8vGZl/vrIYTZfZRYs6x24G8l6w26eW/0eYPjv5Jog0FuHlOBRcWLp72p3JQW
X-Exchange-RoutingPolicyChecked:
	sZnk/ysg/8r1+1QgTSr9nZSYPLgFJLhKAWiBFHtNTeMWnWhXvxuurWFUVC4JcynwpjFlRh86pWFGFF7vZ3+A5sFgR3RwxD74NjYONhcA2fGspGHqBXg6/RSqUKWRoTRHrkFDMcahOSmlZOEC7KovcHsIOXnRu0HP+KBnQwB9LMF5nUTQIh2UTc7vX8BD0/vcAdyAciJlT72SAzCN9F+R290xiOvxQ1M1eU7jtUNazsXixAgcAB82NOCeFtDsPLqlgfowwHkeIvcWi9/8GQTJE2bg0Z91SbmFMhdf2USmJkpckQs/RsbgF0yxVKyoJz5+RI1qwqjRlV/IvwpMOFUVpg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jvajp++cMlKGw2ATDwk35zlrXl3ZKePFXiukraSevjhej6uHfvOsMq4RJ6+IZvjUpip/H2tK/yzsCvbWSyLvVvGRqJt5Yd/4YF1sBFGeGcRSyORaoEnN8vs/6EwiRLTxFuMPCTQGYJX6k+nMcy4epLny/R+QjbTvRlEqJFt5I1LTZIHSbLNjo+n2KtiWHf3KkI1qO0q4p5DxVfuLbknb9hdHfP1DO+wi2jsn7mXnJJEIknBCSPGHvBWdb6emBCxSIuEvnMKLOAalZ7WVKPXif/Aq18SxtvVnWzqJ+tLE83rWHUellDsv42TUYo8eJreSufbX69K40zu4RBQ5sklDBGattD1iF+1CheX76m5dGcbjEWJnAv5obSyp3/o6Icx9+RK3JOzTpeAz8zYeTl9AC3hnBXVJez38R02lhbSd5of04vP1s7tn1ZCiMq4TOxWPP8LV9ECOYsSRvKwVuRoPaJtKBEEnAsejfiL63in+GVibDqJ39YgLkoEhGKE8UMBVHFNxQBkzmTEAZSnEJwXNMKhd14WnEUnzto2RO6VtHIIiu0yT/iAZ9UclHxbebIxhRgzz3FlVUbZg0IqC9nvvzRK5WPRhIKuvm104PCLHy8JcossCtDCyyEWBOR/OeOxL
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 06:23:26.1824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9447569c-685f-40b8-57af-08de78ed60fb
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB6249
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0MiBTYWx0ZWRfX76OeBdO3cmm6
 NjsZAAkryQm9VdaA4KF3ALVd1wERrxGd241i76cmuwIZNjknlMxu//ihShWqrRirhPRR4837sQs
 RqVe9XoNopU+GmsOwGtF7q3/w8NQRB6g/ZVMnKeZQRJLPfKZVWwp8IAiGrkJorZ2mxftE/OkC/J
 6G7jiudAhaN8O0xk5bVDjfWa/GjzWzHwX1q3u6xCblm1XaVCapCOA0aEi/thY1wBQT67dsvcYPK
 vNRkrLgZNMrRtCT+NUrNOnPhhuGcbAEjm0XpdjTe7JTwwkcEqmCY5g4Qr8ALFbxI3cA+BwFn1A9
 6vKpBLD2hJoX0u2Y+3gBBkZFYi6Ob00Njdnivgt3GO8sy8yDGye6ikBWinskcgDlfemntd5spf9
 od4YbKgaHt+ZZdzWKAQHsyjtS84qA68WwuWOKlmYTsuN/cpmOHPEv4u85ZhsS46Nu2gGHhjalA0
 tlr0DX5VH9FfvnOhGWg==
X-Authority-Analysis: v=2.4 cv=abdsXBot c=1 sm=1 tr=0 ts=69a67e63 cx=c_pps
 a=FnNH6Hr+id3EzXqhVuY+iw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22
 a=cbNQJ9GKAAAA:8 a=CEWtYdiJhwX6ivxE-jwA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: BRqJ5tKpvk3Aeva-YQOv7dGD4uoi9XEu
X-Proofpoint-ORIG-GUID: BRqJ5tKpvk3Aeva-YQOv7dGD4uoi9XEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030042
X-Rspamd-Queue-Id: 627B31E9970
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:25:33PM +0000, Anthony PERARD wrote:
> On Thu, Feb 05, 2026 at 03:51:26PM -0800, dmukhin@ford.com wrote:
> > diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> > index bfc9149096a3..714e71441498 100644
> > --- a/tools/libs/light/libxl_create.c
> > +++ b/tools/libs/light/libxl_create.c
> > @@ -676,15 +676,14 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
> >                  if (ret < 0)
> >                      break;
> >  
> > -                v &= DOMID_MASK;
> > -                if (!libxl_domid_valid_guest(v))
> > -                    continue;
> > -
> > -                local_domid = v;
> > +                local_domid = v & DOMID_MASK;
> >              } else {
> >                  local_domid = info->domid; /* May not be valid */
> >              }
> >  
> > +            if (!libxl_domid_valid_guest(local_domid))
> > +                local_domid = DOMID_ANY;
> 
> Well, that make it possible to have DOMID_ANY selected when a "random"
> domid was asked for, and this value is more likely than any other domid.
> I don't think it's wise to change that. The domid generated in the
> random case was already valid, no need to check again.
> 
> Coud you move the new validity check into the case where domid isn't
> "random" or introduce a new case in the if/else chain ?
> (something like that for the second option: if (domid==random) elif
> (domid.is_valid) else (use domid))


Will do, thanks.

--
Denis

