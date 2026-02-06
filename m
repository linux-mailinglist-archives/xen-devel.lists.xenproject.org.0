Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAG0CjVIhWkN/QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:47:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A461F9048
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222679.1530447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voAwI-00052j-Go; Fri, 06 Feb 2026 01:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222679.1530447; Fri, 06 Feb 2026 01:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voAwI-00050K-DP; Fri, 06 Feb 2026 01:47:18 +0000
Received: by outflank-mailman (input) for mailman id 1222679;
 Fri, 06 Feb 2026 01:47:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voAwH-00050E-Fw
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 01:47:17 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3526ef1-02fd-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 02:47:16 +0100 (CET)
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6161ONER003688
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 01:47:14 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c1vf7k4f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 01:47:14 +0000 (GMT)
Received: from BL1PR13CA0093.namprd13.prod.outlook.com (2603:10b6:208:2b9::8)
 by BN0PR16MB4382.namprd16.prod.outlook.com (2603:10b6:408:162::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 01:47:09 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::65) by BL1PR13CA0093.outlook.office365.com
 (2603:10b6:208:2b9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 01:47:10 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 01:47:08 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 615Nnige1197779
 for <xen-devel@lists.xenproject.org>; Thu, 5 Feb 2026 20:47:07 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c21ngwhf9-46
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 20:47:06 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id oAw3vhYKmkQ6qoAw4vHfU9; Fri, 06 Feb 2026 01:47:06 +0000
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
X-Inumbo-ID: c3526ef1-02fd-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=4xse/WhVvbHwCu4OtjXNed2d6MA
	IynAObHok+8iB7pk=; b=vbmVj9lbKcRF7Pf19ATGrcEuWw4oIiCMIb5T8xA3WIS
	w4N0eLCn2/nff59I8srJHd0m35oEELgY7zoDho7IbaFEhaaeWVk/zhRDfsoMFIuG
	pxRYsm7r2lRePwWvJ0NPkyFNk2lflmtnsRKaxuUxYQbRXpmUkGT3ERzaDRTmogB3
	7wY9A8bAf4PawC+5jpSiERnuvWgsSLSPtkxXnS4bhdlTkY7ZOoPBix/wR8gaFCYc
	thLWcozBGkRaHvpMo9E3hjymIyUaxHbUMV9l0tXWTxkvR/g47tonZF+Jr8WEyuZk
	nQH5FFkCfS1xo741gbLj/G4JoJKQIwhCMnfaikDjLJA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPo894kfcd9ChbaqfeTI1KCJcsGankIBgJRdsvtzsbwtqwKIelN0GYEbQj0fmn26FCzmk7JpAaipPNA/bwtRZprqhy9/XzhqKfUlgHa5wYNmPBxHvOhK1GDiF/RMVLkTcuEIbeU3FnfVIYjiJqJLeP7cDrakhIOmQTUrj5B2op7haHWZDQovJEwiQo5uLxFoMJOTOIWyO+vFOR2087V/enHnp6X96hHo/+DdU5DwpNtnwOt4ec1nwajVU8TSAd5vUdUxIC06j8nw0dYYP6iN9TeAuiLuuLSfCYHf9KbnAW94GGa3jrjUPhHt0I7sG4GdWcvNvCC6eKY4nZEHE94I0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xse/WhVvbHwCu4OtjXNed2d6MAIynAObHok+8iB7pk=;
 b=C73qhxksH8RuVD+D36dY4REpxxJuUuMmKGqekPM6OSmKNeLT1/+WkdrIj3BKq+Xnwkm4/Kp1ZrkQHGeW+9FmrZbtM+G7YGvokzFCT0E4UiRLBYsWCkRTryUlqcXtZQ5y9oDwdfOuzdGSYMREJaZY1ox0DVuZO6ycm5yjoEJe/hBsFRQ8jrXrOe9DLbe0QxzRqB8qacj4fULqOMVu5ryS7qpZS4V6hyyb3P9IWopy5gCafT7+ylVpOfIorhaG8LYLOI1twVna/4ViHIBSO/oIiN+FgX1WSPl+zbFbGwdEkbtyOCoemE4i6KiM0A4N88oJOtRSGF2B7a76cWgpB3V1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xse/WhVvbHwCu4OtjXNed2d6MAIynAObHok+8iB7pk=;
 b=RzxvkFHdYPwSRkVHu1OHZUPt0T8ESBTE0FVwI96xUDHrONg29Rhn9kegFPa3LBD7M0vqTbUlQatgcHc2eVnAXFE+L1AjcS0VxfRTA/Nn23bqm3HED32x/SWqHNNZTUimrd7yuXfs2Ht1pnMFgfemHGnp9aHOt9zlap7GMUxrBq4=
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
	 bh=4xse/WhVvbHwCu4OtjXNed2d6MAIynAObHok+8iB7pk=; b=fa5NgOvQiXCR
	ynIamat+WCb6hqgVFNlqHkSLMjYBeD8b1KNHy8vluaygO7U0rqga4hu+wHSiyiau
	7lX4F2jeROqIx2QGm6RpiT9UQeNbuGxT6MJyxkkFm1gUhTQPXYabDRnIiRT2eBAM
	h/pX8xOztfR658a05kq+oUNJdVMIoBqunta7Q2/bfYon5oHw3BhBrZv+hurDoYax
	sB/US1QKW76eUduvRDYqSVXfqmd3b/EC/HbQ6ESNdyI8o4/WgXeBT3z1AxiVGuQm
	YRZibk0/Zg1EO1cgqgP2TvnCvV/+jykhGkpRpuCUNjr10x0lReLVny5SzQd/HdDj
	sw1tjCrCqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=4xse/WhVvbHwCu4OtjXN
	ed2d6MAIynAObHok+8iB7pk=; b=TJHNLWMWu0zmcAAbDrzC6a4cmMJnaY/Q8cuW
	mQEBiyn0kYGyRK4eVayp9IEyRg5sj40nrnFpvGydWCDd/A7A0GStxjFENaK6z8J3
	1vsRh11P8ZFy6/eP81j6HJDCm38d7R8JTe2760ssc+9UnwrIvU4yrTZpZBRy6gr+
	XY/OB7UztzvUqbW6z1Q78nGRPgtjyLG2b/LqZpun/gpQNOFWRIAJT1p0Q2johHhq
	VLVKp99dTeiYzqfCvmGMJ2eaRtTVQIoP24sjfBfvPdd6Zrf5FVgjIs3cixezlG0T
	/s/DkV1FG9kEKDl+4KO43y+ThcEtCkhYjYWmrnTfdpm85genDQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oAw3vhYKmkQ6qoAw4vHfU9
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Feb 2026 17:47:03 -0800
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
        anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v2 4/4] tests: use unit test fragment in vPCI test
Message-ID: <aYVIF1mcNgElm0E3@kraken>
References: <20260111041145.553673-1-dmukhin@ford.com>
 <20260111041145.553673-5-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2601231718380.7192@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2601231718380.7192@ubuntu-linux-20-04-desktop>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060012
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|BN0PR16MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: e6614809-af2f-44bd-4dda-08de6521a38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vknYQuRoN+4XZEgf8bhfWDWYtJYWwr9YeN+jCfVgawZypChmluFDFLvPS77o?=
 =?us-ascii?Q?A+2BAz/tXWx3r+t0I3c+BzcTOglKPM1vioUP5Bmx8gLhGKmRYOTOjGR28h91?=
 =?us-ascii?Q?RI0pQe+g0ZLYWzggCoGSZzAGRe3wrrpTzm8ewnb2IFbjWLV+02bdwZNHPbyH?=
 =?us-ascii?Q?eHkWqvGQgY2l7uUoefioQ/RPEJzkxw2b8RdOKX9zGIbIiDOeJlBmh1m/4jPo?=
 =?us-ascii?Q?025/b2UL66sEMIVSmPqhafZNAKLNyhx9QPQ1nt2mY0+H9B7aiVJqepd3WbIF?=
 =?us-ascii?Q?eCdOnZcdt14tZA64jikjUPDNxuW0XmjtS9368WyEdYh5gnjx2HKG5qpntAig?=
 =?us-ascii?Q?/iDquHyHvWDQkOSrI14ZFarB39cd7iR4U9kCKOOIXIwEMmdQKpocuPVNS2yr?=
 =?us-ascii?Q?p3UDK/0Yi86XxIkB204OQvwr8PwNVr7Al1AE2Ttey1yB576HP/QCYB5WnXJD?=
 =?us-ascii?Q?m0Drf/I8u5rMdam9/dDXYeOekRWbrHSZ7x2TOzVFzCceSpa1lmy7HxGjtIFn?=
 =?us-ascii?Q?OKOlFgo8ix7a1AYR4BIN7VeJW06FQ963RH93i0z9qmloEBBVKp8vfi/RpsF0?=
 =?us-ascii?Q?7vAKT0shCMkDE/cT8W62m0GVd9joqdJrtSO/m1lLroau4v3aGrUy4ANJW1BW?=
 =?us-ascii?Q?Z/zRt2hYugC/ihCFPGxGiFZwuwkzUmaxbf341mmua7oTcgXNuadD/Kykx/be?=
 =?us-ascii?Q?rE2pY1lu4SCt6rQWHeSBww66nJ96AAFMevLNMmL8mMz7znU3djQpJtHwyLPv?=
 =?us-ascii?Q?S1uH87kSZVi/VF7Go5/7dWatt2rLrMYhaNVsrg99ipjhAxuJ3gG6+fhAeInf?=
 =?us-ascii?Q?7GZsMvlKf7caoZGxc/0mi6y7H+ToArQG1cF7Rimu2VifW7sItOj98KmEtZi5?=
 =?us-ascii?Q?ITPeukH9rZWrYASHyd+n1QJxh8OZl9nwUmbUPyP/M5uz6dvsnyG+gkZe8BMR?=
 =?us-ascii?Q?rL8U22FYwAK2slPwsz9NEW+ZqLl6+JaTff/aNXSMOma0xE6P4VhQbwOXKOxE?=
 =?us-ascii?Q?TxBr/+cLBJTml32eWf+KBNM1RTTgvgWFFxaydOK1aZEDMlWm2gG5A0YtgpBr?=
 =?us-ascii?Q?541emZDlG7CfkKqFLozj3E8SGKYHMOiuejm6OBAPW33N3Zav0qIXjkwesmpU?=
 =?us-ascii?Q?dEASBqEK1xzQHGbWxTt/vKZmLHuLDnWdyfnH3KUd1UX3EAFMOYfqFSk/a+Tg?=
 =?us-ascii?Q?us0brUW+48vvUZ+nGV4yvmubPC5Iap85o4qPe7IU7SJNZVcC6HxKN2jWzXa2?=
 =?us-ascii?Q?egBUoG1isCQuRsxmtUGgWwjQItz9nNQ8rcCiLthl7YqkAXk/pcjFgxpLSc4b?=
 =?us-ascii?Q?ldyH+zZ7D7enGfiWlAHGYJ06tfQZH4YK51JySVusEx6I70ckswttWlatzG/u?=
 =?us-ascii?Q?tnudCWRwDtmBG6kAIigLy/2pt8yF9iu0V5FOcx/yZaQRJHM8alkkF7m597ie?=
 =?us-ascii?Q?ZZRIC25f8WjsjBQfKCEGqQ0S2dr11UCoV7Nes+ada9TbP0LOnJ9yjsain8EY?=
 =?us-ascii?Q?DyphjhMru2Lo1ArWUxj3tVggkqzWkseGGMein525qx6UZUbzebIqYuNI6GTB?=
 =?us-ascii?Q?lgb3y7pLEBWj1NjAWeIXxJLYpCymRzhnJA3exD0GOiY9spJcPLmMG/tfIAs0?=
 =?us-ascii?Q?EqC93UDowcOhVCQ3OaS4XHRIUPWVqLg1BtLm++1/ITnydJie1nMukvmXEi6g?=
 =?us-ascii?Q?oxUdiA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gq398ag/304EYaFfdqsThP5/HS81H2uP7ou+FYOt+mIQpN12yaS5xZrdCmXhOFNbY9H/Yn9qZoi20wQkXPNFwmAcvmRX6LvXNJfCm3QbzL//ZyoWx8FVbdHy+37mp06XA6XRKMtqq6PBzEzrhGbH1JLxoGuSvZVVV9GZnGBWau2opWd050GAlZ08odadCyDThZRoYvVneuWMRy1L8zdkIEER6N4KBhLtGkEwOmLWts6/CLLm4DZpv/JN0ZtmrbazqD61h+A0hJKxjP6olDfAEd5VxT4Y/wfRo/PW094jRr0+4tmvIPuiwXp/ykOtYsC9Yd1Dg/38Jp1fJgxj1s1O4IcYJxANEKzJgGXMuM4eijJGArOzLarMp6VddaHyz6+/AjZhYk0g3w6xTtdIuwXBeHzD8Xkg3tZK26gBcLzAmK7qAXF5kA9pKFWXZRvvz9Hn
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6qcR5LVRnXKuN+WtfnCpSQAbhvXfGHxs2taXuNcHt934Iex3Ts0pHW2azFIqBbOwFHUFaKaktJnvpM4bdPxqsoe7sSSxf0RA3DjjOliWHH25vm9z3CJaG8q7IsEMuwGuK58elCR3Nd1Eq0E2YHU6+e+LYbKDpXHBDST0owzg3bTwlw39IUMnMT6h4winCSMmJKE9aDZNeIXbmUqW3e3lbsI/9Dqbs4cvcHUNbzClBnZXCOCXxipT+QJSUCqIPKBXRyT31gTFsZZISSE2bm0+uuGRkzG28Qdi6gJ9xVg8Wj8vLCqJPJyU3lL63yEmGH8mtH9pX4rG+pzvmSIy9Ozn5RqfMA+8k/8AnaatMSXZUCHv9KJnL//LR7bgunj/wgVqkycjDCvG+AKaFC4rAeYPHWSZNG6AB93MPysQbSZkwPc8CqNG3kyZnnJCbd677rWJh4OP2vjhtSbJLS0ws2eMZJ9r4AL1b8HbTpM7Yvcle0OqNvZg21DgI2UxoK4h1b2CRj2FThID8C731DHyIrsW8CeuSpwcBP2/EJvc5JY0G2I2S8hP16RuWh96UgsKgTMSsKbfJLKL8NWlnQPHry7h6aWImx7Gtx5Sw0FXe61V1JjMZESp1sOwujW2lp2uAT8r
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:47:08.4591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6614809-af2f-44bd-4dda-08de6521a38f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR16MB4382
X-Proofpoint-GUID: wq4EQBbEVO_uNOTRCAJIITM8VWjQe39A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAxMSBTYWx0ZWRfX7VSgKJGWOftm iU2PVe/Wv2FqdePto+vP1fWSLtYjYO4I1SnYcLGyUKAjPGUjqL3aZ3Ajwo7165hh8eq+gTYMGd6 bxxVIIOT4wlGvue5e2N7aH9tcLUReEDKL7iJAY6I3fBdtfv6kMyLU5DK5yD58fk9+G3UbFxJ9F0
 ZoFWtk+qS1ewPtbYSP9yTK9OlNFjNmns1EoUtJrjMMZtZU1jr4Y62UBbz7ZDJg6gY5WrjRULFDj 0f4+zWfOCNFU7o7uDLPT1AhgHI3kz9TQnSd2K6dzv6Gkk+ryiIfUTQS3M78VlSL5FNLiHY5IwiY W74jrcEdflIuR4oQsEvTfOGLhQUdrmOVyfhkAyk2m4mCClRP3Ja3h3glRoIh3OPOivYt6smp7Az
 eZoLgUuvKvXQYcrXVCS34+QnMH3AW046uvwVHfa8ai6U9qrv0a2cuvC6KcNE8YHGr7IRDr0KUVQ UhhiRqDfV0rbqJvqTEw==
X-Proofpoint-ORIG-GUID: wq4EQBbEVO_uNOTRCAJIITM8VWjQe39A
X-Authority-Analysis: v=2.4 cv=Ffk6BZ+6 c=1 sm=1 tr=0 ts=69854822 cx=c_pps a=7APEvFnVlBjFtWv3F9ubqA==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=kDw80TMy2X5veftrcYMA:9 a=CjuIK1q_8ugA:10 a=DqJYxgmhk6moR-_7_KoZ:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602060011
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:dkim,saarlouis.ford.com:dkim,xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 2A461F9048
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:25:18PM -0800, Stefano Stabellini wrote:
> On Sat, 10 Jan 2026, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Use the new make fragment to generate test harness code for
> > the vPCI unit test.
> > 
> > Add new prepare-harness target to tests/Rules.mk as an optional step for
> > setting up mocked environment for building a test.
> > 
> > Fix hypervisor headers used to compile vpci.c against host environment
> > where necessary.
> > 
> > Fixup emul.h by adding missing mocks to account for new unit test infra.
> > 
> > Update .gitignore to exclude generated test build-time dependencies.
> > 
> > Not a functional change.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
> > - new patch
> > ---
> >  tools/tests/Rules.mk        |  5 +++-
> >  tools/tests/vpci/.gitignore |  2 ++
> >  tools/tests/vpci/Makefile   | 52 ++++++++++++-------------------------
> >  tools/tests/vpci/emul.h     | 50 +++++++++++++----------------------
> >  tools/tests/vpci/main.c     |  2 --
> >  xen/include/xen/irq.h       |  2 ++
> >  xen/include/xen/list.h      |  2 ++
> >  xen/include/xen/numa.h      |  2 ++
> >  xen/include/xen/pci.h       |  2 ++
> >  xen/include/xen/pfn.h       |  2 ++
> >  xen/include/xen/spinlock.h  |  2 ++
> >  xen/include/xen/types.h     |  4 +++
> >  12 files changed, 56 insertions(+), 71 deletions(-)
> >  create mode 100644 tools/tests/vpci/.gitignore
> > 
> > diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
> > index daa9e69301e4..26f3d00b5fb9 100644
> > --- a/tools/tests/Rules.mk
> > +++ b/tools/tests/Rules.mk
> > @@ -11,13 +11,16 @@ $(shell sed -n \
> >      's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
> >  endef
> >  
> > +.PHONY: prepare-harness
> > +prepare-harness:
> > +
> >  # Generate mock environment by replicating header file hierarchy;
> >  # each header file will point to a harness header.
> >  #
> >  # $1 target
> >  # $2 list of test harnesses
> >  define emit-harness-nested-rule
> > -$(1): $(2)
> > +$(1): prepare-harness $(2)
> >  	set -e; \
> >  	mkdir -p $$(@D); \
> >  	for i in $(2); do [ -e $$@ ] || ln -s $$$$i $$@; done
> > diff --git a/tools/tests/vpci/.gitignore b/tools/tests/vpci/.gitignore
> > new file mode 100644
> > index 000000000000..d66c2cd56be6
> > --- /dev/null
> > +++ b/tools/tests/vpci/.gitignore
> > @@ -0,0 +1,2 @@
> > +/generated
> > +test-vpci
> > diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
> > index 97359ff67f86..695a275675f8 100644
> > --- a/tools/tests/vpci/Makefile
> > +++ b/tools/tests/vpci/Makefile
> > @@ -1,43 +1,23 @@
> > -XEN_ROOT=$(CURDIR)/../../..
> > -include $(XEN_ROOT)/tools/Rules.mk
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Unit tests for vPCI.
> > +#
> >  
> > -TARGET := test_vpci
> > +TESTS := test-vpci
> >  
> > -.PHONY: all
> > -all: $(TARGET)
> > +XEN_ROOT = $(CURDIR)/../../..
> > +CFLAGS += -DCONFIG_HAS_VPCI
> >  
> > -.PHONY: run
> > -run: $(TARGET)
> > -ifeq ($(CC),$(HOSTCC))
> > -	./$(TARGET)
> > -else
> > -	$(warning HOSTCC != CC, will not run test)
> > -endif
> > +include $(XEN_ROOT)/tools/tests/Rules.mk
> >  
> > -$(TARGET): vpci.c vpci.h list.h main.c emul.h
> > -	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> > +# Do not mock xen/vpci.h header for the test
> > +prepare-harness:
> > +	set -e; mkdir -p $(CURDIR)/generated/xen; \
> > +	ln -sf $(XEN_ROOT)/xen/include/xen/vpci.h $(CURDIR)/generated/xen
> >  
> > -.PHONY: clean
> > -clean:
> > -	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
> > +CFLAGS += -I $(XEN_ROOT)/xen/include/
> >  
> > -.PHONY: distclean
> > -distclean: clean
> > +$(eval $(call vpath-with-harness-deps,vpci.c,$(XEN_ROOT)/xen/drivers/vpci/,emul.h))
> >  
> > -.PHONY: install
> > -install: all
> > -	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> > -	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
> > -
> > -.PHONY: uninstall
> > -uninstall:
> > -	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
> > -
> > -vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
> > -	# Remove includes and add the test harness header
> > -	sed -e '/#include/d' -e '1s/^/#include "emul.h"/' <$< >$@
> > -
> > -list.h: $(XEN_ROOT)/xen/include/xen/list.h
> > -vpci.h: $(XEN_ROOT)/xen/include/xen/vpci.h
> > -list.h vpci.h:
> > -	sed -e '/#include/d' <$< >$@
> > +test-vpci: vpci.o main.o
> > +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
> > diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
> > index dd048cffbf9d..979e86e2692e 100644
> > --- a/tools/tests/vpci/emul.h
> > +++ b/tools/tests/vpci/emul.h
> > @@ -34,8 +34,16 @@
> >  #define ASSERT(x) assert(x)
> >  #define __must_check __attribute__((__warn_unused_result__))
> >  #define cf_check
> > +#define always_inline inline
> >  
> > -#include "list.h"
> > +typedef int64_t s_time_t;
> > +typedef uint8_t nodeid_t;
> > +typedef uint8_t u8;
> > +typedef uint16_t u16;
> > +typedef uint32_t u32;
> > +typedef uint64_t u64;
> > +
> > +#include <xen/list.h>
> >  
> >  typedef bool rwlock_t;
> >  
> > @@ -43,10 +51,6 @@ struct domain {
> >      rwlock_t pci_lock;
> >  };
> >  
> > -struct pci_dev {
> > -    struct vpci *vpci;
> > -};
> > -
> >  struct vcpu
> >  {
> >      struct domain *domain;
> > @@ -57,35 +61,17 @@ extern const struct pci_dev test_pdev;
> >  
> >  typedef bool spinlock_t;
> >  #define spin_lock_init(l) (*(l) = false)
> > -#define spin_lock(l) (*(l) = true)
> > -#define spin_unlock(l) (*(l) = false)
> > -#define read_lock(l) (*(l) = true)
> > -#define read_unlock(l) (*(l) = false)
> > -#define write_lock(l) (*(l) = true)
> > -#define write_unlock(l) (*(l) = false)
> > +#define spin_lock(l) (assert(!*(l)), *(l) = true)
> > +#define spin_unlock(l) (assert(*(l)), *(l) = false)
> > +#define read_lock(l) (assert(!*(l)), *(l) = true)
> > +#define read_unlock(l) (assert(*(l)), *(l) = false)
> > +#define write_lock(l) (assert(!*(l)), *(l) = true)
> > +#define write_unlock(l) (assert(*(l)), *(l) = false)
> >  
> > -typedef union {
> > -    uint32_t sbdf;
> > -    struct {
> > -        union {
> > -            uint16_t bdf;
> > -            struct {
> > -                union {
> > -                    struct {
> > -                        uint8_t func : 3,
> > -                                dev  : 5;
> > -                    };
> > -                    uint8_t     extfunc;
> > -                };
> > -                uint8_t         bus;
> > -            };
> > -        };
> > -        uint16_t                seg;
> > -    };
> > -} pci_sbdf_t;
> > +#define lock_evaluate_nospec(l) (l)
> > +#define block_lock_speculation()
> >  
> > -#define CONFIG_HAS_VPCI
> > -#include "vpci.h"
> > +#include <xen/vpci.h>
> >  
> >  #define __hwdom_init
> >  
> > diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
> > index 2ef8d4e03f1d..3753417e866d 100644
> > --- a/tools/tests/vpci/main.c
> > +++ b/tools/tests/vpci/main.c
> > @@ -189,8 +189,6 @@ main(int argc, char **argv)
> >      uint32_t r24 = 0;
> >      uint8_t r28, r30;
> >      struct mask_data r32;
> > -    unsigned int i;
> > -    int rc;
> >  
> >      INIT_LIST_HEAD(&vpci.handlers);
> >      spin_lock_init(&vpci.lock);
> 
> The patch looks OK but I recommend to split the xen headers changes into
> a separate patch

Will do.

> 
> 
> > diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> > index 6071b00f621e..f7fa1d0fa29b 100644
> > --- a/xen/include/xen/irq.h
> > +++ b/xen/include/xen/irq.h
> > @@ -1,5 +1,6 @@
> >  #ifndef __XEN_IRQ_H__
> >  #define __XEN_IRQ_H__
> > +#ifdef __XEN__
> >  
> >  #include <xen/cpumask.h>
> >  #include <xen/rcupdate.h>
> > @@ -208,4 +209,5 @@ unsigned int arch_hwdom_irqs(const struct domain *d);
> >  void arch_evtchn_bind_pirq(struct domain *d, int pirq);
> >  #endif
> >  
> > +#endif /* __XEN__ */
> >  #endif /* __XEN_IRQ_H__ */
> > diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
> > index 98d8482daba1..06d2fa3aed15 100644
> > --- a/xen/include/xen/list.h
> > +++ b/xen/include/xen/list.h
> > @@ -7,8 +7,10 @@
> >  #ifndef __XEN_LIST_H__
> >  #define __XEN_LIST_H__
> >  
> > +#ifdef __XEN__
> >  #include <xen/bug.h>
> >  #include <asm/system.h>
> > +#endif
> >  
> >  /*
> >   * These are non-NULL pointers that will result in faults under normal
> > diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> > index f6c1f27ca105..80d60fd49178 100644
> > --- a/xen/include/xen/numa.h
> > +++ b/xen/include/xen/numa.h
> > @@ -1,5 +1,6 @@
> >  #ifndef _XEN_NUMA_H
> >  #define _XEN_NUMA_H
> > +#ifdef __XEN__
> >  
> >  #include <xen/mm-frame.h>
> >  
> > @@ -152,4 +153,5 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
> >  
> >  #define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
> >  
> > +#endif /* __XEN__ */
> >  #endif /* _XEN_NUMA_H */
> > diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> > index 130c2a8c1a65..f5965a68ae33 100644
> > --- a/xen/include/xen/pci.h
> > +++ b/xen/include/xen/pci.h
> > @@ -14,7 +14,9 @@
> >  #include <xen/numa.h>
> >  #include <xen/pci_regs.h>
> >  #include <xen/pfn.h>
> > +#ifdef __XEN__
> >  #include <asm/device.h>
> > +#endif
> 
> There seem to be other Xen internal declarations in this header. I am
> not sure what the best policy should be: try to cover them all within
> the #ifdef __XEN__ even thought we don't really have a specific build
> test that needs it, or only fix the specific build issue in this patch.
> 
> I am OK either way but I wanted to mention the possible choice in case
> others have an opinion.

I decided to modify the headers, because I hope is there will be more unit
tests using these headers.

> 
>   
> >  /*
> >   * The PCI interface treats multi-function devices as independent
> > diff --git a/xen/include/xen/pfn.h b/xen/include/xen/pfn.h
> > index 1ca9b095e0df..98ff669d7def 100644
> > --- a/xen/include/xen/pfn.h
> > +++ b/xen/include/xen/pfn.h
> > @@ -1,7 +1,9 @@
> >  #ifndef __XEN_PFN_H__
> >  #define __XEN_PFN_H__
> >  
> > +#ifdef __XEN__
> >  #include <xen/page-size.h>
> > +#endif
> >  
> >  #define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
> >  #define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
> > diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> > index ca9d8c7ec0a1..ad5094c4eb92 100644
> > --- a/xen/include/xen/spinlock.h
> > +++ b/xen/include/xen/spinlock.h
> > @@ -1,5 +1,6 @@
> >  #ifndef __SPINLOCK_H__
> >  #define __SPINLOCK_H__
> > +#ifdef __XEN__
> >  
> >  #include <xen/nospec.h>
> >  #include <xen/time.h>
> > @@ -360,4 +361,5 @@ static always_inline void nrspin_lock_irq(rspinlock_t *l)
> >  #define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
> >  #define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
> >  
> > +#endif /* __XEN__ */
> >  #endif /* __SPINLOCK_H__ */
> > diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> > index 73ddccbbd5dc..e5d702b48ac0 100644
> > --- a/xen/include/xen/types.h
> > +++ b/xen/include/xen/types.h
> > @@ -4,6 +4,7 @@
> >  #include <xen/stdbool.h>
> >  #include <xen/stdint.h>
> >  
> > +#ifdef __XEN__
> >  /* Linux inherited types which are being phased out */
> >  typedef uint8_t u8;
> >  typedef uint16_t u16;
> > @@ -15,6 +16,7 @@ typedef uint64_t u64;
> >  typedef __SIZE_TYPE__ size_t;
> >  
> >  typedef signed long ssize_t;
> > +#endif /* __XEN__ */
> >  
> >  typedef __PTRDIFF_TYPE__ ptrdiff_t;
> >  typedef __UINTPTR_TYPE__ uintptr_t;
> > @@ -33,6 +35,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
> >  #define NULL ((void*)0)
> >  #endif
> >  
> > +#ifdef __XEN__
> >  #define INT8_MIN        (-127-1)
> >  #define INT16_MIN       (-32767-1)
> >  #define INT32_MIN       (-2147483647-1)
> > @@ -52,6 +55,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
> >  #define LONG_MAX        ((long)(~0UL>>1))
> >  #define LONG_MIN        (-LONG_MAX - 1)
> >  #define ULONG_MAX       (~0UL)
> > +#endif /* __XEN__ */
> >  
> >  typedef uint16_t __le16;
> >  typedef uint16_t __be16;
> > -- 
> > 2.52.0
> > 

