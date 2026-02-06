Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA4xL4pJhWkN/QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:53:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4906F9175
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222699.1530467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voB1q-0007Ds-Bp; Fri, 06 Feb 2026 01:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222699.1530467; Fri, 06 Feb 2026 01:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voB1q-0007C3-8d; Fri, 06 Feb 2026 01:53:02 +0000
Received: by outflank-mailman (input) for mailman id 1222699;
 Fri, 06 Feb 2026 01:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voB1o-0007Bv-VD
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 01:53:01 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d1893d3-02fe-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 02:52:54 +0100 (CET)
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6161PiHW003756
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 01:52:53 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010029.outbound.protection.outlook.com
 [40.93.198.29])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c1vf7k56p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 01:52:53 +0000 (GMT)
Received: from BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) by LV3PR16MB6719.namprd16.prod.outlook.com
 (2603:10b6:408:279::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 01:52:50 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::58) by BL0PR1501CA0029.outlook.office365.com
 (2603:10b6:207:17::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 01:52:53 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 01:52:50 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 615MGW2w1844453
 for <xen-devel@lists.xenproject.org>; Thu, 5 Feb 2026 20:52:49 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c218c5kyk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 20:52:49 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id oB1bvlIiVP7uEoB1cv2H7c; Fri, 06 Feb 2026 01:52:49 +0000
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
X-Inumbo-ID: 8d1893d3-02fe-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=GFGYOdl8QcukzBk9v4iKbvwzVW5
	OV4QMdJBYJu7/rRA=; b=VaxbyexSpAbxO7q+JKxvR+5YCed01WUnPQYgsmN3/G+
	2MUfTTDlDwN5qrcyz/fcvIC7UeSzvS6mTTbHq3z6uR1AQ/OsTpapWS4Kxs/T+7/9
	gt66UiHGjAxCnRH6eZ5Ug/cQ+I/YsuYbT3EB949tx76nQImhDVskw+RNZdSNTM5g
	VuKgyclCxUQvTvA8926nM+UDaZdVh3M4Xz9PRQrpCd1Qkmzt2gUzog5TRnlXOE4c
	cH7E1giujfMueqfuUstg8osXr91bSRtuLZtEWorsNQwGpO1eaAYZbUHVJotPnoc+
	rNwQmpBhKF8ULS9rAuCEqj1dunakviO4nbA5e5viLSw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1K+e6Xtk395KtgTGYRJcNrIUEVH7boT8+VLc/UL5iyDXp2LDfxGIq7E/le2WJhp6r+ms0xFbbFBdlOG9NMDj4oqfwuRHL/XHQp9dUo/OZncLdrmOsEn+yFl9swY+0oEBsaZ2TaOgWfiqVYoqFRZ5Re4177pl+JjwmItInIjGI/j6wnYt8RQhjf1SI6MQ8uwV78FX5J/4O82ukmKVct25ixANCVelUdL21wkgRwnyxrqxSg7e2fyr5p9Xbcc8KZA8RB9UcAAuycsbs3QYUsBFgNoJv863YAfL5xhWTOgWTMOUXraN8leAzD9tsCz6WAbndq4yuQR0p7I48tueqiVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFGYOdl8QcukzBk9v4iKbvwzVW5OV4QMdJBYJu7/rRA=;
 b=bqOA9+03PyMbnpiL0jqNbGa0shFEolnp1bd1GjoMq7isp1jQ/3wR16ATbjjANF/5ZOa6Q+wMju8rR/iWQyDUsrsP3krx+S+Fm/ejssh1TglrESB3KhsA8TEGljmT0eneIYKFIjF0Yh1vbS9/UKmd75vHYNKxoLVP7Lj/mSXGRcujVDXM3WKXa9kK00gQb9GpNXP3SJw1qKZagnp1/QpT00zsy7C/DrZdUD5RZdtc08KJ5IoXvzZ5SPaq65YDx69ZznGNFYrgJHhr7Wvsw2o2vIQokw4dhEELiNEsiIZpT/KWDUNAB07bQMO2nUvPvJo9LNpibHbT8fyNftjRFCXjRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFGYOdl8QcukzBk9v4iKbvwzVW5OV4QMdJBYJu7/rRA=;
 b=D6UQPfyWOuCgfafysCIKRs/bh/MLYbYY5aUaA/M3GRylqwoOFOjsymYK12jJsvUNaZE9+tQZtpNsLKfVUzj/YxjMfU2SrZAujj8wFFKXJh9bF+CgApYfgEPEUEAmcKpxpMr/qP8kFx8n/74WX/rEYWOzP2GvCwAAER01tkQ5nFs=
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
	 bh=GFGYOdl8QcukzBk9v4iKbvwzVW5OV4QMdJBYJu7/rRA=; b=iT6+FiA0GTwI
	wPp/OIRE9hx4f6ji7bwxLfz1W/4u0PIpoqbQ3MY5lJ+1emwmPa/DuLcOqWl7cPE3
	+x2mPkVttu63zvP4BiExr5K/YaDDdftRvUCSfjnvfVRzfOc/aodFn+v3l51EFwBC
	E11ubwtm9h9z7KaCVy0UQAwbCWAHjZnn0uRDBFR0pgSDr9jeCLQtb3Iw0gR8O2pD
	IGX3/U5XhFercAVd3K/1bcyige+bwu2VOurgSLT7nsOEAEna3lEyxQB7EviWqRV0
	dGxM7lbipc+22E7qT0/SJG2hnjQjigpsz44Eb6cgdzlVIJGuh6Ecc7BtQxLIalYs
	fZacQp3KIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=GFGYOdl8QcukzBk9v4iK
	bvwzVW5OV4QMdJBYJu7/rRA=; b=GnD6FImaZ8x/F/cZOrcoMD+06oACJGuMdtaX
	Jd4F45QEew2fkDTW46yrQQbvWu+3sIAdG6sjc56ydrPIMngHXIQGGFpb6sfAHTaH
	pI/h6Y7fBdbaJYxP+LO4QCpNCg7lg6+M2qwo9dtl4Fa8LL+1Gl4aNLjaL4i1b7Mc
	pTjhwqhmmP9r/YFbwjmzA6YZuyXKwHQTq72DGoo4w+LnznjUZ7IkfjCIBwINFcDw
	snijhjBpOrJ2SqXdaP72yFQLWl7bfTV3wPisGPzLz0n2acxOyynTFQY5odkxQ5Pw
	WSdR09hzTWbO0IEeBshYjqjeAfQKxVtorbj/xue6g+zoloVhPQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oB1bvlIiVP7uEoB1cv2H7c
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Feb 2026 17:52:47 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com, Jason Andryuk <jason.andryuk@amd.com>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 2/6] xen/console: make console buffer size configurable
Message-ID: <aYVJb2b0JlZn61B5@kraken>
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-3-dmukhin@ford.com>
 <09462166-a3c5-4527-840a-cd77499dc588@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09462166-a3c5-4527-840a-cd77499dc588@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_01,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060013
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|LV3PR16MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: ec22bc81-8b41-4c53-3699-08de65226f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cwCcPFvf4VKAXIjYWwbTQG32KvMVpc5Q7Crc/Fr4/P2sYAIQgd8q876wYZpM?=
 =?us-ascii?Q?mPFa230SUi4pd80Ux8MVT9VNQwXsHhd4cMRjs/jd/vsc1KN9hVScbf2Qrckv?=
 =?us-ascii?Q?5JiuC2rQZTqwnSXqz5n3eu+jM5hV2PQDTsqfUyjIfmBvKG19FI5RvqilICps?=
 =?us-ascii?Q?2p8IZSXO7DXzgsif+C0pljFl7kPxGy+ERjjmtxU2UoSZJMHNwbtajatrGZUm?=
 =?us-ascii?Q?Tk40R16dUlCQXe4SOrU0LjQmIiTrxmtncrzi/R8kTzgGoQsZULMpKkcvuowG?=
 =?us-ascii?Q?ozsd1TuSmld2C09rQsjeHWDjuml2bbE9T7OKp0Ltzy+ndvo2dSxcoNh9egVT?=
 =?us-ascii?Q?R0p4T8LS6w+lioyWlt9eEhpE69ob60sF0zfV6fP4cfTYpSXJ6NoWHOtKBGZv?=
 =?us-ascii?Q?PHDtzEcvthFwdh8FFWn+oqxaDlJm3qdGB5VHujonL1qsKWJx/Ucohh8+b8mw?=
 =?us-ascii?Q?zH4jE2numN3u8JOtDhXaEbo1CTCMK32EIUA1aFEhdKPU+0kH/Q14v/PP3VrR?=
 =?us-ascii?Q?5y/aVxKAEyyaR5BvHyjAC3OzhsCI20BLcgflBkay9p/dd8fwIO2qyM6i0tHK?=
 =?us-ascii?Q?S42lEVkxFWhfoIV0sYx72NzkikwO8DPPXNwaE5CbqGNapUiD0/u02uLpBrr8?=
 =?us-ascii?Q?IjrROSmIoy0mi2xw7MWoOz3nTNfMpjHm8paj7WO27vICk/nPX1p3b160eDV0?=
 =?us-ascii?Q?gTavgzpbX4of6MWATpEWkvFYEfZZe+HWvgJcRJalvOYchCVMukMHlA9oFePd?=
 =?us-ascii?Q?3Z6zipRVhhdkbevSfpzsqXtgsytVkX/f2Ppq1WGnZ4q+G6GkqK/z/xFTI1nb?=
 =?us-ascii?Q?rdLExQA+F4O7qVhdUiZdWwMjgKMDtEFVJlhSJkWzemxZl1URXoKABym4/h93?=
 =?us-ascii?Q?xBZ5mNMZHkeEmwI/1aXlGFqgRz8rdfPN7EoKiM45ITsJy7OJE+Hov7FK4UOC?=
 =?us-ascii?Q?dxbuEOPmbcehbXYKy4J/m0LJ3+KdiKfCEDe2eePQ23iVF1WWAdOX6GK0FsKc?=
 =?us-ascii?Q?eP9g8Z2m34cEuHiVl/McaTXMEff3jfCuIQndRpJd71kEhjvFnG1P3gKWaFr1?=
 =?us-ascii?Q?/pBXDGvi6COEvU3EplqJbtKom4xk2UF+xCpybz1+pwAFeVKWaI4iCLGPicNm?=
 =?us-ascii?Q?fS1iAPRbRboBP741pM8L18o52R/AnLZ6sSYMBWDvYpaJZQpHtChpkVycdgyo?=
 =?us-ascii?Q?vHcdvXf4kGCugDe4xcJeXt1qzHWZfxxVGBQiNYz8zcrpYbV/N7a/Nvt7tRw6?=
 =?us-ascii?Q?B/XPBCk8uEPc+2GNKWAjBD1HwZL7/L5AECBdBJBA9Mn8pDXfyuEXMSMHgc6u?=
 =?us-ascii?Q?j/uPybVOc3XFIzpXr1o1DusUQ6zoFoU3Nl8QrFu1tnBTQYCXiLSEiwJvwF8l?=
 =?us-ascii?Q?GKznuXs6g7Xus0mEsYLdTT3YXoEHawRDVYm5lRNxFS6KVfwC06TkvtY4scFQ?=
 =?us-ascii?Q?GvDTLICb/PCXCTxwydHcoHRWoG1thH/SsIeutTMwhZJ4M7/oPSk/yApUaWCN?=
 =?us-ascii?Q?8u2O+LnRsMYHK1iGwuJhZEU1zdEg9ffyoc5N/quoxqUZkrbM22meI8v/tIlD?=
 =?us-ascii?Q?QQ/m0OKD7n9Iw2cvdghJYF9w5Ic822b9h4nzEhsSgCBw0MXiwKb4ndMXnLAm?=
 =?us-ascii?Q?SpI7/QPx0PfPlOPfUq6uvzKfMBKc3F+Sf+ZdEbWzetFQBit0HtD356z5tp+E?=
 =?us-ascii?Q?Mt2FtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t27czbKym5yopTT9b/q9Bn5/FesqAOS/2Fhy66G7YSAPBzQk1iLnoWoPIl5CSJ5Setrb+0+JC7PNQE90V/ym+kq19t3U39zbhPFlrDFCINiL+gEJfwjt5sILV4FYiAfrCiK4iMYo1amBImpeSnh/PDSiiuCZ39xu4uuSK5JCOyalxuq88WeLe9oo0jAZTvXtO+GC4NO8/NNkDjZzIu1OpA9wIvODUKTo1Y5PHYp3RaHtxOWfWY1tFJDzu7L3nIvIIYqmKqRfzX+NDjy0QdMAvqN23sf4P+v2HnIbVkfGUIzUM2FfkbDKmo6agEgigL7YFMddnyVhSxLFLBi04ebfe65wcbdf8ZVK+0xKNLDAOU0W9cQ4ZhTP4CM2eY7tc2PQjNpJvcQK26BYjuiivdMYII2S2CEemH9Hwb5Nhi0/zM5LruIenFlBvCBT1HI08QYU
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YftOgfkJcQRnXQterVhK0BmEJMxco0mktso9F2znhU/empTR4U7UBTGppRvlKZ55eWboNUAJQ4NP3inUIC47m89P077vR+THMTWULzAwd84i3iEAX1BoYbhfNecgok5IpeSLAB14GbStukVFQeVecMhAuBpJyCrEin/NykzqT5r0Kls7PKlZbILnQeeFKePal4BLJVaW6hYz2biF9XFW8xiCs0Ww3sJkM9PA1MOGKG+YJ+YMIgOows4bX9eNjqE+Y3Zf/TZrjKK1BSja3pW1fxWlW6UYBnh5fNiwFnnYLmJJ6cks5TRLkGizR5ZCLXs51cPzW+rDB80jogVftvT8Dia78U+liBTAqaEKf518Md0s9MF19avC9iE+Xb+QYVdpGo5Kl38zrlT7BKJ5+T9WZyoo0UhDDVamMkd8+AkN8BbCqpdr6ivRhIWqktunVdlGoFa+c6PbpYgMTCNo2uEbXcGrXmPx9adEG2FgVfCuF9M2dhNN1YOZufYhx2ulJ8KncMsBPtuCVxwqtTCyMfZn2quenut5yH0YLZBzrzmpeSd8Dw0LzBqKBvrtA/+oVbOvPHEMotXb/uu7xbVCx1JR3oP6lYMFr+OaCFgJmbBP+hT5UPOCnJPjCtv48Vm1QU/v
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:52:50.1406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec22bc81-8b41-4c53-3699-08de65226f38
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6719
X-Proofpoint-GUID: _zKmLNFILZoqlywjWgsUSysAukp_vYbb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAxMyBTYWx0ZWRfX6e7ICAZ5h/P/ UoWIEsuP4nVv724bEyY6zO03DEDKP06ePFqSPLNorcOgisWLOKBNc03lSddg58NFb/oVKtcmdYa 4guN5AVcBYgCQL1mBIEnXVcDbmDmbWUp5hlAzQXyKzCIXO5N2Hp0gv0SiFZv5aRK96DwvaprLyn
 1GMZJ5MP2NnCoNop613XnipDq/tX4NGDawuEObDY5mGLCqsPop8g4B8XgJtcAEkGrFuNJTue5tM S+3aE1TWS2XhXZS+/CAzBv5zNiVWLtfvY9EK1SNp9Z4HS+FBBISDx6AewPqEYk9NeI7Ho9QjubK oTPBnA9eSTMqVIv7QTm4U/jIUBWorWFD8GMfMFJkALfc6xDon9WAXExkTw+sLDa35NndPMt3eXa
 VyZuR+6QDM4+sPYCNcnJLlya5L3AfBS5S/0/M79MfqZnIP5P4g6El+UKQGmmc1ns2HRH/RdTAwg PL82CGQyq18n8AkIhKg==
X-Proofpoint-ORIG-GUID: _zKmLNFILZoqlywjWgsUSysAukp_vYbb
X-Authority-Analysis: v=2.4 cv=Ffk6BZ+6 c=1 sm=1 tr=0 ts=69854975 cx=c_pps a=KMP5/9L46olBb+slh8+hsQ==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=mLnsDVdbAAAA:8 a=2jrG0t4_TvpmvPL-U7oA:9 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602060013
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[saarlouis.ford.com:dkim,xen.org:email,ford.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: C4906F9175
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 09:43:31AM +0100, Jan Beulich wrote:
> On 05.02.2026 02:36, dmukhin@xen.org wrote:
> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -95,6 +95,30 @@ config SERIAL_TX_BUFSIZE
> >  
> >  	  Default value is 32768 (32KiB).
> >  
> > +config CONRING_SHIFT
> > +	int "Console ring buffer size (power of 2)"
> > +	range 14 27
> > +	default 15
> > +	help
> > +	  Select the boot console ring buffer size as a power of 2.
> > +	  Run-time console ring buffer size is the same as the boot console ring
> > +	  buffer size, unless overridden via 'conring_size=' boot parameter.
> > +
> > +	    27 => 128 MiB
> > +	    26 =>  64 MiB
> > +	    25 =>  32 MiB
> > +	    24 =>  16 MiB
> > +	    23 =>   8 MiB
> > +	    22 =>   4 MiB
> > +	    21 =>   2 MiB
> > +	    20 =>   1 MiB
> > +	    19 => 512 KiB
> > +	    18 => 256 KiB
> > +	    17 => 128 KiB
> > +	    16 =>  64 KiB
> > +	    15 =>  32 KiB (default)
> > +	    14 =>  16 KiB
> 
> As I think I had indicated before - imo an exhaustive table goes too far here.
> E.g.
> 
> 	    27 => 128 MiB
> 	    26 =>  64 MiB
> 	    ...
> 	    15 =>  32 KiB (default)
> 	    14 =>  16 KiB
> 
> would do (if such is needed / wanted at all).

OK, will adjust as suggested.
Thanks!

> 
> Jan

