Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH0BK2NrhmnwMwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 23:29:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3292103CE8
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 23:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223990.1531321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voUKd-0006nt-NT; Fri, 06 Feb 2026 22:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223990.1531321; Fri, 06 Feb 2026 22:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voUKd-0006lG-KT; Fri, 06 Feb 2026 22:29:43 +0000
Received: by outflank-mailman (input) for mailman id 1223990;
 Fri, 06 Feb 2026 22:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voUKc-0006l8-4W
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 22:29:42 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 537eaa60-03ab-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 23:29:40 +0100 (CET)
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616IO8R4022777
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 22:29:39 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c1wnnbdew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 22:29:39 +0000 (GMT)
Received: from CH0P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::6)
 by BN7PPFBC519E732.namprd16.prod.outlook.com (2603:10b6:40f:fc02::723) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 22:29:36 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::7) by CH0P221CA0026.outlook.office365.com
 (2603:10b6:610:11d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend
 Transport; Fri, 6 Feb 2026 22:29:32 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 22:29:35 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616J8Rbo3941138
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 17:29:34 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c2127xpxv-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 17:29:34 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id oUKSvAVXJP7uEoUKTvKCR3; Fri, 06 Feb 2026 22:29:34 +0000
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
X-Inumbo-ID: 537eaa60-03ab-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=DCpJL48mHSGuimrJ3uKpy6OQ6Zz
	ZTNdC3hoqo6FRy7I=; b=Og+gkzzndrLARnJJzJh85UWQdXOVu/w01gO4ZShNz42
	HT4EAWYbiCFV/2W0lHnUdSJQ+XDJ9jpoFtg3RQqmto18UAButCCUr9vSnJX0zHOa
	B+EkgDsZ4JbtPeO6f4pCps4BIPCtGjLej7TCZJGhPz8qpKOd61y/Ty8R2xpRl1lv
	n2eDvRy7Qf/30kdfXcrshcBVcDzcNz6xII+BuHc5tmvndogERaKrjJXkv0tL/EoL
	d+hH1kMfMHiS0u7ncA5Eiza2pdZwwUaGgcQXwGdsuvCGckjBmByzELI+DcsxqVYu
	6jnsjEgQhNVisKFmF+ixdMl98kbWw/AEGv0v38OJApQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHwMLtB2rinTHATegU/tPnRnMK0lZRDncsjdvWJG/HoFhctBtE9EezPSgOZlSWKLHaOh305QQO1j93Tt14lCiLeWBgANgi4PIuaSy7MO5ilGaZBAsiaQA8RDv1oR40zwJAI4QVeAt7PlapxLtSIcMmJsd+KPH/OSNqMfyUpyp1GdmAKGB5E7j4I7j3gsWLLwyRlApH+U544/j5FrgXBkeBF19SLuo1nLENlPRqbsFJFXRRmJfxmjpsUX25SYusGDOgomQcNFReo1FpVqmDyCzXqq504wZl6rn5Y1IZJGNDew1kA974O/7/diraL4hoVp0glSO3avYVMSd2dOW4sKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCpJL48mHSGuimrJ3uKpy6OQ6ZzZTNdC3hoqo6FRy7I=;
 b=HrwDzywb1zjrYhtY4ckkWCAbo7EwjezxxpMYtF1DNux3NUWzbAatHEoYwnoUtjst2FT++P7+XQ1KwFR9TIQAXC/26OressEMTxUfSJu3j4fX0OpSVVSH+lb8x3xI5XdZ/frkUYEX9oGALnqDogxTkFNqlsMArNMxi4SqUpkvwSUeSMXRupEbAl3fwmQrPNcjuq85j8iI8RCYgsPRgia4/M/T0pgIrc6kNpXIwdW7e9XscvqTdvBL9CcxP/gKKLIbtBzVRS73bydk1ZpSdHew4645vLcy+akfoVPzerb8n/aTX+ekKHlkBtD43NdjAK07WXdX5WnXP4BqyCsDcNhV5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCpJL48mHSGuimrJ3uKpy6OQ6ZzZTNdC3hoqo6FRy7I=;
 b=h2FVd+Y2uBdYN5Pdr3+fwoqhGDTaMMXFdEnSkeve/zk5L/rEjfAMcB0TqUVdKteYXNEod+yrZryUB9eMhY6Q0Pal3GMPhJ1QIMMTSRd96HzSs4rbcKs5ibHWEtI7HF4JAqSLlWwn/80kPjcuQVpkRTc7Q4QaTYWBsLr1wv5PT18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=DCpJL48mHSGuimrJ3uKpy6OQ6ZzZTNdC3hoqo6FRy7I=; b=X4IKp+iXvbCq
	h8cbQsfBAtxJQGtx/MrHQs8o8uKXIqDJKhQnL7h9HQYQMVS7gyQIXNvKgk5Sz7vy
	/E6VMPpK7WI8DpDvzF007eCNSIFf1wdM+WvDgJsHVRlQz8wP6d9+2h0iw7UcfXzT
	uCru6fHI5Idklhn55hYplGQm6UEIuWChAN/IlNUwogko/QxeGm3erjqoDS+cl78j
	ZD4QNyQUVfrDppI5EdntBT8FeyvyAoA/9aCtM5EBPlso17+77HTDkdgt+nmEl3dp
	3GjzKcnBWoCo1hhVWQZBucg3m6t+Ocsl2gVbM+9e/zF7gqb7SqazCI/Q28bofhx6
	Dq9CPQ3+qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=DCpJL48mHSGuimrJ3uKp
	y6OQ6ZzZTNdC3hoqo6FRy7I=; b=APVfLtKoodBj/BsGWb658XkyIWWJ30GAhpus
	eovU71TSgBIC+X4lPrgWFK0jj5k7BIDjzXYHjuJhOPUcxxW3aS3MnOgjpwquqj6V
	YRZ5QfNUd2migwQUpYEirJmGWVLTgoa9wh8xYFfsy3apP55DNioevk5so3FjK2Vq
	Bw3iX8sdO8yZaycjM/i/Fgx2t00lzE/I/m7i3MQiMshPxSYwvGqhmb960O/cRQTx
	5sy6hS20p4sB18IduzhuF++eZ+17NwPq3yP/1a8w33Tz4oby7ukQUfyBXq0RzYco
	KZVK14ATFoJuGWecKl8aqfEOlPV9fVJe1YxQ0ncUbDBP+VeGDA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oUKSvAVXJP7uEoUKTvKCR3
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 6 Feb 2026 14:29:32 -0800
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, grygorii_strashko@epam.com,
        anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
        roger.pau@citrix.com, jason.andryuk@amd.com, victorm.lira@amd.com,
        andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org
Subject: Re: [PATCH v10 4/5] xen/console: handle multiple domains using
 console_io hypercalls
Message-ID: <aYZrTF3uWiZLsjOB@kraken>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-4-stefano.stabellini@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204233712.3396752-4-stefano.stabellini@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060166
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|BN7PPFBC519E732:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e3cae3-e114-403b-f894-08de65cf3517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yaMuWqN0aHF2+5TKMqWnmG+xTKNoShirhogeAGwaewXefAKUbVkjd3ja4/SA?=
 =?us-ascii?Q?9EUx9TiJbekUWIIqee+0yAabuH9FkJ7+vGmAP9u981lX5V7Bcdpz7bMV4mkP?=
 =?us-ascii?Q?F1PlJk/+1M8lihqAQ9MpHTBanw0r6G0oyRhXFTl8jlL9BuWLZaS5+0E7n/tQ?=
 =?us-ascii?Q?eHfV8KSDAOD/NpIVgXlS0MPeqjXs7zhJqLLFOBVZND3YERqK3ciN5HgHQF4t?=
 =?us-ascii?Q?JRmHLG4ti09IB9tPNTPck/ztHcJiiMa4mTQ3hJiiKapK1m+SwuLP7cVUyUwW?=
 =?us-ascii?Q?s8iqMBvQVEq4aWFVdhh1RmdHNUdBZy95FKAO+/txwSLqimFISF9DTJ/Wx5+b?=
 =?us-ascii?Q?s+4RKaxJXhFSDWXcl28dZw48rIrR1i4noL8cRGW8IrdzBUkGYsekWMiZhEQt?=
 =?us-ascii?Q?h5eY++I2TVQK8EE0kf9Zvcy42EsFAcz2FLHNwOFnqlzD/AC+Oa43wXj+bLRr?=
 =?us-ascii?Q?NLuzXxeR1YEScK45g09BX/2UEta8QX/BbNRbq9F0pHZ8xzL9tzEiqoIEgw68?=
 =?us-ascii?Q?coEy7wZmDcZ0fftG1eewVSmN1ai59HUg17KkogrQW3Ue1quS/ZTf0wOGt+dB?=
 =?us-ascii?Q?LNQciioTnRliS2um1sCaFYGPKFQ3N81hShGitNUiiQqkReRDTd9l/p1Y0Q+R?=
 =?us-ascii?Q?HJEi1WvxV5jK97oj01tHEnn3cVTjCXMO6zR0lADi0+YMiiV+DPzDwjpxemlN?=
 =?us-ascii?Q?+9DnFdt0O2342Ba0nRLHUzeoPwk6nbvkt2Rk/bwRTW8MtEOGjE0xRJCnHrsa?=
 =?us-ascii?Q?fC4inEX8mdeZ0hbtIo2vbaTkM0WsMLIDX8K9CFpEuMeXqGwb9XB+hRoE2OA+?=
 =?us-ascii?Q?Oq7qnVLnSDiuHoNTYVECZYbgHq/P672ngquRUXabl4mAouiuzYGkcjw+eh8A?=
 =?us-ascii?Q?3joX9Dm7XPVogXPfeWzhafLTYYXEKVXupzKndXoU0iyUYiJU4a2KW7e70AFD?=
 =?us-ascii?Q?Wy3z2YQD1Su77vs+E0dcKQmscQ0MCCM8tOfQuxaPdlK0tSEuuMvwwIF6Z1Uw?=
 =?us-ascii?Q?XhVDXwn/u74HiX8oe4eP/zrwFQv53bX0y0BA9VWHBW6N6CVVb+d04lzOwy3h?=
 =?us-ascii?Q?Qe1ox36+2dZnoAHfdR38iAiHpeDy7dS1SFz+pWbgCh1NvrYX4Ph4c0HDhzBa?=
 =?us-ascii?Q?3S9cD+r8jshfeYVCaIL4gbTpXDC40c2QePQs71gXjjWDmDnPtdh3FoG9ECcA?=
 =?us-ascii?Q?nLI4BgVOQeDXgbxYZpos0D5+amc9z5GkXAbbDRspMLi+QEey8UCZwErHqLCN?=
 =?us-ascii?Q?QlY/FUu992GnGAXBEb8d3OIQnLYzRGbO29gPvhpA9k/a5iKleD0UaYmV6wmx?=
 =?us-ascii?Q?mNS7M9syxeAu0UQl+HmfQTPwkgWG+bbG0PxBdtyORKpC9n/kuoJm1EZzOE/6?=
 =?us-ascii?Q?5Z3T/55//PGqzcbyKkLZ/VIGb4On+z+GxoRHeRy4hFcuG/9p6Lz+bkV5tx/n?=
 =?us-ascii?Q?DOV3xIvOqPgrog+aS5EPKB2FBd/Hzq5RFIYgGLwy59uToyI9IUsXpHzq4ljH?=
 =?us-ascii?Q?H1XICyh2GMuFzE35VLFgwOFd9tQTPuzuGvnju1r14s8DNxdIhBEYoP3miOxH?=
 =?us-ascii?Q?AkeFATF5B6dBArZe07JSUAQtZ3OyYwj7Ok628Wnkia+gpDx/Hst7uN4UsV7e?=
 =?us-ascii?Q?9VS4gnns1Fe1oXiBCyPoeREd+iqM3DCzXaBWzT2E1CGaDdAocAi0afl3HE+Q?=
 =?us-ascii?Q?Za7vVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YFgWZhPNgLPomT03OzcRLfT7oFgWFvM6d3Zpmqf0CYCTBzAmitU33BqhyJ5ACbqAQJxeUXAoEnzLfZDy8KisDXocRIk2aBJxI9G+VmkifWPtqKeeLQuM7+yFXE2eQ133oOSwJzGYVgkao9eO4mGtlU/3ubpKdOSD1lkjuJNI1hI3xlZUCDe1NTo30lGr4bj2fbrbXe6iGBbH8OXbMjVXCgFw+S5fVd59RNUaTOUNx5Hy3L9/zQ6ofJGYEDOyf+Ke9M+NK2aVWid3rM1QWAkw8OhGgmcGfRpzIB2a7f0J0zimP+GSWL4ayAVHHSSMMNeU7GEAzz4F1iew1Nm9RPuX8CsvqknS3Pm81o0Cc2WdF13AmpT4ikioYw2hdng4tNjgDXDMJloFT1DTHwLBy0R2KvHX9fOK0Hu3SmDTpNuQeXzLdqFIX4zKzxOPl3+cvcQU
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8QuokZlwZtHpOYcV+EjjYxlbsiNIPKLCeBO7zPPc0SaRSK1aX/sNCMKRnYZbwQM6Yce8i7WjrM+HzNQaFoofkn2B5Z6TgMr+e3Ju+0ksLV+5tM/0mPOlQ5+rp1kXrIIZ3lkULW6XWnyqG/jixQMLPbOnr9cBXyL7vkPavgybXbHOzoNOwOG31N9ffau4EMrSNyekLx1SGiL3USL7rKdLSWK7/A6H7SkWIRxtRGc3+Rk2Wi1pF17vbIFw96QBleqFUBE9NECRTIa0p4nBVxEQZavTbd5GuZ31vXZOZQ7ddyujC+SCByXCBj9QMpVg/WADb2cz9zodrP7O30GWEHSxRT+QXwywXWEVrU0vZPMvUscO+JFAcXatNqSelEa25cbeZMdwsqx6x09n3aUN1W5rP++23tPN3bpa94ecQSLKKHeVi181YjHp3XngLyBrLxUpjq2oEsqNOdfUucQ1TDrg3PwhS+F3IakdY0BMSHhJtwG2CzhR9Kmw2+XSiNTl4Ba+hQH0OWQvSSwwZZsxd7WN6kPMBlcRfjs0ghiXXZNo/o3n7E4fLDgmEk1UlRbtCZ/bUABPChPWmQAvUkXnmjHRFYfDjnliKB0sZKxBS1IZgAUl/L9+GbpxIloCjDxv6mAZFk8T0dLd6qEF/rUMGtJ96g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 22:29:35.4269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e3cae3-e114-403b-f894-08de65cf3517
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFBC519E732
X-Proofpoint-ORIG-GUID: Mv3KU8iUADS61HDtd41IEwFCqu7-qYQO
X-Authority-Analysis: v=2.4 cv=U/CfzOru c=1 sm=1 tr=0 ts=69866b53 cx=c_pps a=rl9QZQJB4f+cLtFzzj7oTw==:117 a=lOEMawUel/sSvQipkIvNbg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=zd2uoN0lAAAA:8 a=cbNQJ9GKAAAA:8 a=VoHnIRGKSVmt8-PxNDkA:9 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: Mv3KU8iUADS61HDtd41IEwFCqu7-qYQO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE2NiBTYWx0ZWRfX//0taBXQbxmj 21FlJwNhGHWl2gWwCFnn90Z3wMZ1lSTUVB9nBrkWg/Eip85PnqalUaeymnOyq+/qj+tGAAnfHHp 1bdzjMCRWEtSmcEp59BXAyb0PU2/BN1XQT+NkxaGZUnCz360gvCUmnCtzmvfLrd1CQlwPeSpxwS
 zvQ32TPDndhE9lCRubJDtNM2rrcp8p6nLDpbnCVcFPb7Re5SaZUIu6OIgg8kOWVM2VRxIvVU5Gl bmUfpJy+G6MmyttSyeOFQ4HJSQ3Kg/7XuREj/SHuOg3gZaSF2Hje4Vs85QoJde4dqua+SR4xVCD mCsPUiJ6iDp2DBF8tiWqnkxf8AAH7i9as9R/qVeLX562sAmhOAuvyDmF9LLxOJIlWI+j18S3Kb9
 wVNCiEhqwRu54AAFzyRFsMjKHyx670unQ0v6uHOiF5ST9AgIXNeAEex69wZMu5/QjTVtlEWrekw RGCJfbqRLUxNp8+i9kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060166
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,saarlouis.ford.com:dkim,ford.com:email,ford.com:dkim]
X-Rspamd-Queue-Id: F3292103CE8
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 03:37:11PM -0800, Stefano Stabellini wrote:
> Allow multiple dom0less domains to use the console_io hypercalls to
> print to the console. Handle them in a similar way to vpl011: only the
> domain which has focus can read from the console. All domains can write
> to the console but the ones without focus have a prefix. In this case
> the prefix is applied by using guest_printk instead of printk or
> console_puts which is what the original code was already doing.
> 
> When switching focus using Ctrl-AAA, discard any unread data in the
> input buffer. Input is read quickly and the user would be aware of it
> being slow or stuck as they use Ctrl-AAA to switch focus domain.
> In that situation, it is to be expected that the unread input is lost.
> 
> The domain writes are buffered when the domain is not in focus. Push out
> the buffer after the domain enters focus on the first guest write.
> 
> Locking updates:
> 
> - Discard unread input under the lock when switching focus (including
>   when returning to Xen) so that cross-domain reads can't see stale data
> 
> - Require is_focus_domain() callers to hold console_lock, and re-check
>   focus after each chunk in the CONSOLEIO_read loop so a focus change
>   simply stops further copies without duplicating or leaking input
> 
> - Hold cons->lock while flushing buffered writes in the focus path so
>   the direct-write fast path does not race buffered guests or HVM debug
>   output
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

