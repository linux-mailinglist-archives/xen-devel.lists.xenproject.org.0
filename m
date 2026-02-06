Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBIjEF5qhmnwMwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 23:25:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0D103C2C
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 23:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223974.1531310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voUFh-0005zi-21; Fri, 06 Feb 2026 22:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223974.1531310; Fri, 06 Feb 2026 22:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voUFg-0005xT-VQ; Fri, 06 Feb 2026 22:24:36 +0000
Received: by outflank-mailman (input) for mailman id 1223974;
 Fri, 06 Feb 2026 22:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voUFf-0005xC-Kz
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 22:24:36 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98ff9403-03aa-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 23:24:27 +0100 (CET)
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616IO9dK022793
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 22:24:26 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011032.outbound.protection.outlook.com [52.101.62.32])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c1wnnbcbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 22:24:26 +0000 (GMT)
Received: from DS7PR03CA0148.namprd03.prod.outlook.com (2603:10b6:5:3b4::33)
 by DM6PR16MB3685.namprd16.prod.outlook.com (2603:10b6:5:2b8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 22:24:21 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:3b4:cafe::f5) by DS7PR03CA0148.outlook.office365.com
 (2603:10b6:5:3b4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 22:24:07 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via
 Frontend Transport; Fri, 6 Feb 2026 22:24:20 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616I1kxx1197779
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 17:24:19 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c21ngxgjk-12
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 17:24:19 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id oUFNvw8XOV4jQoUFNvPcdJ; Fri, 06 Feb 2026 22:24:19 +0000
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
X-Inumbo-ID: 98ff9403-03aa-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=jvRfC2O/mNe4IS70swksiJIxQzf
	BIUtBFytrUnAMVCM=; b=eJZRF29ppn4JwMibCS3L2xEwOHsC8qNiPWjBGDqIQX2
	nb7Iwmv3FjZlW0pUpbOHTjkw2a4B2bj/XpZe/3dcwV3zS/qsTVpE7WhBU1luCdoQ
	uQeQShCLuYTNCyj1yEpPHJXBdTexBYBVNLcbr2uuCdcCYacJeXMNBPFFZEi/M/dz
	utJg6Sm45F+HSk6vmZ2La7tOSgQegTtOj38sWWx2Sud2kFSXQ3000qZHvpRusK7R
	np8f/OfuewiUEk0KXOVxq/WNulerSbjRRo1yT8vPiEgKspVUuUSaTjV2Xn1g4xYa
	0SH+xNQ/Whw2wb9kck2RvZs4V+YL3cQKdcup6TZY/CQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fApHTIzm/Yp8ErgWTub6r+lNXlA162moVIrLcMeubsRrgZbbyrrmQcLXR2SfGBYggSd01tVxkDC0JPcfX0m0YHyE1SsBVt+67fnmiWReyCYKoux0w9xcBIlVEevQMniDk4BkpeZiEZTguGdnKTB1qt7ylO51HEbA6dHGtG2ph2SYW+mHJ/SbLqlAN87jjl5mh7b8LO2Q3xjaFqUniGT8U+iqLrpgb/01n40FMBWx9+HbjB9kxzSfHHFws+DiXgLkzLkt4IfYkatXWYUFc5cBPDY9/KyNCY2T2PXCaSkyRmfIgeTdP4eV6oYoe39NsPtrIa/OanY5kPjDs4R+9vfmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvRfC2O/mNe4IS70swksiJIxQzfBIUtBFytrUnAMVCM=;
 b=SEPIza8C9tppSK0aBvPqyI52TtUsOxNpr6w2HTWEbB3meo3Ac3NhdMYw9bgCyJ9G/34SHNBkMx9mgYKKi8wumJPI+SMSLDIqcvWK8vyKYCqiQmAocuRzdg0bcPZsydduCCalMVgJ4XPNC+Qq/aI3E2CcGGfaEqdma7j9Ask92K7Vrr6Om1114nVn697W/iF3Yp3PxnFQkbf+cpjzkJfBizO21ohqbZMQ8WVHmIi5ukGBTPtk2LkixfYEVXgf8uXBroLrBJvIqO82vLcnS6t95lJMdIKE8HkASDy1UrTzThlqPmRNfai0AP7djlGVye4V4TgFiEHJrq/JQ64OMJSl0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvRfC2O/mNe4IS70swksiJIxQzfBIUtBFytrUnAMVCM=;
 b=GMCSkpu4OPdaplC/pN0UCVZiAQ/SPbZTnVCRxDRn8Az2hDAL7dnTiz6FwxZFnA3qZrlmQ2s/kCEJXxBFf8+t+dhmgTixDAqg0Ko8oBGFxFwA3E+e8Pirb/eDXVmJnJ/GJ+mtwWEpGP28eKjcyG+JhH5HtLTh+tFcUEx9WgZUgvQ=
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
	 bh=jvRfC2O/mNe4IS70swksiJIxQzfBIUtBFytrUnAMVCM=; b=Qy66d36bdJiS
	88zGoY9MdqeY/NlZU2VLInitUgPKZq9Soi/QDfet+771wvUdHq7oYFVjbLk8f4LY
	zh+J7Jr/uQ4nfBdYhc9or5eG/dyXr0FvwBvPvpIF6RV0fjVwg+Sdxglqu1WIxCvH
	NdDUzr5NxVeRoid29b1htOPEd3FsoivIFNDNjoonyx7Q7yljWJD09tX7wDzIqOY6
	fEIVjyn5+bohs5bFo+I3Fuc9LGo4mgA/f8SPzpaLK65xQT6q1WnS5zHS/RaWaZgu
	QzTQPjUPcdd+k85YZMypq+Q/iIJAgdHTeCvkDmqf7SblU5f08UQ4RFmKw/aSh787
	49rRyr5/0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=jvRfC2O/mNe4IS70swks
	iJIxQzfBIUtBFytrUnAMVCM=; b=H7bGrcL5+GuAus6dFJnL8RKPR15o3vm6rdIn
	obLLGG9KkAYp5tZOjkg+cyfS5o9b6cfXwlVtCHAvmpNV9gUrfdUBpPIDF4Hsh/lA
	P2khTtlk94XAgpPOMW82NGWVL+bNRiPfXZXXp4mflLsFyE0bqyGdtsKMYRlEKEFL
	dqXDwBRG8WVv6/gNjFXbt3Wzpl4/RJe12ruX2sFpv6ahf0OJmPPXpNoQ4A627khi
	0udu0+ahQnLNebzrCuOk0MKqW1FL5YtD9wqN/j505mg8cw+EoKOb9WSWnnUGogd/
	N+3MCzZH3BBTVkQu4STshXtmkuanoNraKVmP1W0FKfVNbs81tg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oUFNvw8XOV4jQoUFNvPcdJ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 6 Feb 2026 14:24:16 -0800
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, grygorii_strashko@epam.com,
        anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
        roger.pau@citrix.com, jason.andryuk@amd.com, victorm.lira@amd.com,
        andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org
Subject: Re: [PATCH v10 3/5] xen/console: add locking for serial_rx ring
 buffer access
Message-ID: <aYZqEBz9ERuOZf+D@kraken>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-3-stefano.stabellini@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204233712.3396752-3-stefano.stabellini@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060165
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|DM6PR16MB3685:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a59678-edaa-497c-74c5-08de65ce7982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FKh7+Km0j3Uqsr1tHiBnR2QwgBdZVXd62prIJTUCfOdNoBWdpZ3RSzbWqZvp?=
 =?us-ascii?Q?KhKGFyxQzLIo4eFwScsmM7ER0M6URU34SBJZ5uKMkCDmJ9xrGhc6YhGvPSv0?=
 =?us-ascii?Q?EkmHJhX7Rej293aw/3asg/ont4L43zGMPbvvBu4oESMg/AYK9F6MoBwdw5n/?=
 =?us-ascii?Q?r5JWfMDdhqb6bCVD0wSZX2hutiUg5J2QnBeTeB22RxOAUL17iXF284VeMx2P?=
 =?us-ascii?Q?+szAZv+r2wN0TunVqwzRHCTcJiiypgPBoxBHc+RX1UcxcvIsfccCu1ANWRVM?=
 =?us-ascii?Q?PCXhbLyYSoo+bq6rCU4e9D88YZAYoKQLEqe9xaGVz6Bpt9OTV7QDa1alkMdi?=
 =?us-ascii?Q?CpVV58yx5uKUJrSBwz/WD2UI91O4D1rG+FV+aBup5qex8Qvzuf8FpvMdDhyi?=
 =?us-ascii?Q?HBvfh+10BB88CoWBVxc2ot024vKF2IRxpxpdXTArk7eWnTkQPO10DS4U8WFc?=
 =?us-ascii?Q?oDnC7J3YyzT8hEynoL0adfiwQ4/EhN2xJSwppufr3hfrYVmLWICUgSPuY5kh?=
 =?us-ascii?Q?9d7GHOhDKbaYLJQ9ZA9BY3rtOLNyYhV0QWApxLK6cUfRQD/3+2lnwaJQ3UgT?=
 =?us-ascii?Q?I+9Nsyrxn+AAfVczs/P6LPqfzn7A2uwzxfuahUUH6GUwtBYAg1KKVERQIZvo?=
 =?us-ascii?Q?Szqn+jHBAn4TaOXQSkwpoI2PEcPcPxpKbyIcjqhpdHxxoe7EN3UjUeJU5XEG?=
 =?us-ascii?Q?Yn/OK6+GX8OqyPN+0RRi8XBg3rDgk/e+2+/s/JlRU6WTS4qk5+gYXf83CdW/?=
 =?us-ascii?Q?OxuPRvu+81N+4g/4+MKnmQUWNUwQu40XKYzmL5xUoqo8s3oWtcw9Nnca8gni?=
 =?us-ascii?Q?57zG4LNAh/V7jqLrrKMMM4k9OqNxbDrS+oV+CPs75dVIKxcW74YxnP2YfCiD?=
 =?us-ascii?Q?ikj2ntzzz8j6o9wTBAvCtylcyg1iY36uAv+2n9gagdSEeZiji8/vDfO9EdBL?=
 =?us-ascii?Q?ufL2XGGZ0Ml4ggfKq6sNkIl3hq52lTsBTNRavXfaQoq3fyZZ0AbiQBnntfIO?=
 =?us-ascii?Q?zKBxcx0E216ApJYYmKPcuSsoyiqvIZFH6cIe8zChGb98vQ7hahYyvjGSuXUX?=
 =?us-ascii?Q?uo5bSgc/1rhllunwiufDihoDZSzKgcfXxt0h5t0K0ju4SLzCa3Jy3dFYBqr6?=
 =?us-ascii?Q?hLXVQa8EllXTo9CiMA82ulzQ2iDd3PndT2T+Zx7K2P45xBFoR6Gk7cE9Wp6R?=
 =?us-ascii?Q?6WidNAEIH1ucKOJxHeLo3cTKF44kIzbqCfldJBKZJ4FhC57j/oUQj87/bM9d?=
 =?us-ascii?Q?eu7YYokZPXbsCFRjIG5ntjVjtc5rF8ox50rAlTrRmXDPcoaFAkOaoaZuvR4t?=
 =?us-ascii?Q?n/pZVf0Im5hUP0CdUorsuIEmMO4NNSkFPwsdOVpJxER3eYzknaTNBM6rm1vo?=
 =?us-ascii?Q?TijJlnhkjHmAGpz21RgjH1wG5d/xrT7Y8o+86MkEtgRHG4FcPy17kJWcR2ag?=
 =?us-ascii?Q?En3QX/3AzQJPahU3WYPdqyJqDVL7j2FzyHOLK2KlVL/JaxAKA4pCW7PQ1D/M?=
 =?us-ascii?Q?oRPnEVIMtcsaxrWEWqt8HlUUTM/3SqmLEK7qZQB2j4lBwE3h4m/795EuF5Yj?=
 =?us-ascii?Q?CRp86A6i8gZ7NQvLHbC9pnitz2gKHVdgmxL7Mnqq5jEsuyKZkml+NAQd9uL0?=
 =?us-ascii?Q?z9GXQvmWXqgJMRW9kGTk35I35PcWfyRoSQcWm+g/TXUsAopSeAzjjv4z4lSs?=
 =?us-ascii?Q?/ldANg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oPVBGjhh4uBNUwGmfK6+eIjVx5KdaUZ2BTruhD3FTnbGq0QdKsqb3/In1kMB5XwbZ6E4EMm/NKZVd6lpzaimdFuVv2ZvPComUgPzDOHwwWxk91EMsAa2TMswOVXXMCkPCoQylY3hutfgRUiJeiBTdWDR+WO/QKs+MHtnYQo6DeeEtPa3ezMkcHHw9rPiZUJofNUCtLOKHCaLzhz7H/9r/tZMdDatDRUJ6nJShY/47s5vIXOs0P7RqxB4nLP3FHQnJHX3IXoeLhtAMWyzlVOUxYgyF8XBDs4XRCziS8egWhR1takNolzO+xw+a42RplPgOjhodBZ6bABRwkwvyZJP3b9KWR6uX53uDTgxcz0OLJL61pqnD7AIH1LR56rbpVxUfpDhQrVqK4Ydkwx5CUiO9zBnJ0gdfPA5wBMGdwl0bUcl17wb78BSvCrOw/M0iXot
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RsObQ4ke0jMzlmhDMah2QFC5mNJ4x8cfNlTjH7n1B8N2Ks3+U53inrEV/zBRDs/ZSuBRlf5F02PmF62lHH9LDXC4HzzbMlW3lxG9NQg3lNm+5aoucAD64K2QswZES6zt02S5J3NOqOrgWy/GvQ1ncAcvy35XARvBbc/SrE2e5Ck30gMkVgZ1UK4m4vCFikoZ5gyxzPLX7AHkNYXwrLK9GxUSjiVPFCokLwKwj+1KoqNng0fgJXW/4ppVBYO8+s6Bj6W+cGC7scBpcTY9wBWsQ2p/RXWoq5E42Rs+Plm1Effqy6tG6wfVgqaQjz8kE3pAqueTPSrd4oGJj3egQhcobP9w9mAQRVTjMI1+8sLW1ff29ibxWV2C47qjUpgkkC25MBM2mo5NtQ7WZsHUj437yBmFwsZYLvNa4SQQOaK0ZsCixst38yO5Erwyq+cL+rMHCWsm5l6CtyhphZ1VNCzxNuCCb0u7/KB2BsrQGmwwrrUqm1oGkDA3weqYYHrrDOJq4BwZ62uCOPDHMhP4q+fnkgSFBXXvUGfN3pGUIU9AWmOPzxXa6pTvwVBFhpslWMV1U5zZt3oVaJCRmQYC/Xvn9sW15sITQ06GhC6Q+iTfyU5wtd073Oxeyk5CAIGhsD4uYku7QXzfVGmC457zQ4fNNw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 22:24:20.7563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a59678-edaa-497c-74c5-08de65ce7982
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB3685
X-Proofpoint-ORIG-GUID: 3afUeVPM_PjOHA56xcF9XZVziw6Kp72z
X-Authority-Analysis: v=2.4 cv=U/CfzOru c=1 sm=1 tr=0 ts=69866a1a cx=c_pps a=j/UUtXukZThXjipu8qKQYQ==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=zd2uoN0lAAAA:8 a=cbNQJ9GKAAAA:8 a=dEE_NiS0NobiUu1PXT0A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: 3afUeVPM_PjOHA56xcF9XZVziw6Kp72z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE2NSBTYWx0ZWRfX/UKCdfq/EC9j X+1oHe+6VcIHBYvvnit3CEudvn+5+jg1j1+ysJVfLB55xJwpuaZYz5/KnZOnHEPNTNIBB4DV9is /RcpKz4kXAhkiDLKAq/mK9+pRN3n3HGSU72y5Jsv0+Zczd5KbXcWC90qnVwoaPBUz+xCqf+9FGF
 YFef6aQScx+uIlH10p589NZMIAme2F93cAnDNtRjVob5wyWvKk0knnObkGec0avfR9elSOt6+Oe sQvAkE13uYDYeBAtjXWfytej83yVeYYVUoQLDcNrAzRyVIb8qfm33/OJs5CjwXasc6w8Yjd4EO5 Tooxb2AtKOJeCX+bScj+ziW8KX03XHzdpK5Hf+U6momr8gUjDDPxE2YHY0pzG4Rboyp7nqJ6M6E
 bMEZMeER0Ozb41rlpcsV/m6dF/RjM/YdsmfJCPJlSkYyELSYGIwX7E/4AwjwN0YNX7KAoqJlcTo sdpCsjWPcvpnKjlEVHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060165
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 1EE0D103C2C
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 03:37:10PM -0800, Stefano Stabellini wrote:
> Guard every mutation of serial_rx_cons/prod with console_lock so that
> cross-domain reads can't see stale data:
> 
> - In console_switch_input(): protect console_rx assignment with the lock
>   using irqsave/irqrestore variants since this can be called from
>   interrupt context
> 
> - In __serial_rx(): protect the ring buffer write operation when
>   delivering input to the hardware domain
> 
> - In do_console_io() CONSOLEIO_read: hold the lock around the entire
>   read loop, using a local buffer copy to avoid holding the lock during
>   copy_to_guest_offset()
> 
> This is preparatory work for allowing multiple domains to use the
> console_io hypercalls where proper synchronization is required.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

