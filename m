Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIhLCZWRjmlFDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:51:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532A1327A4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230088.1535695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjGC-0007v0-6v; Fri, 13 Feb 2026 02:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230088.1535695; Fri, 13 Feb 2026 02:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjGC-0007rV-1Y; Fri, 13 Feb 2026 02:50:24 +0000
Received: by outflank-mailman (input) for mailman id 1230088;
 Fri, 13 Feb 2026 02:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gzd=AR=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqjGA-0006yN-1o
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 02:50:22 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbf2dc26-0886-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 03:50:21 +0100 (CET)
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CLDYCa438235
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:19 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c9pkesr2k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:19 +0000 (GMT)
Received: from BY3PR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:217::35)
 by SA5PPFCC01D6535.namprd16.prod.outlook.com
 (2603:10b6:80f:fc04::923) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Fri, 13 Feb
 2026 02:50:15 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::8c) by BY3PR04CA0030.outlook.office365.com
 (2603:10b6:a03:217::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 02:50:10 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Fri, 13 Feb 2026 02:50:14 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CMPDc42547170
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:12 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c6nag5bmq-8
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:12 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id qjFzvwTkjP7uEqjFzvDLNo; Fri, 13 Feb 2026 02:50:12 +0000
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
X-Inumbo-ID: bbf2dc26-0886-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=QZz
	0RdBUzIq+6LfiYUuswSgwU3nj3aTiG/f1W9D2zWY=; b=FqBmqEd7OyO0RtEv17n
	WDISLFtBqzUyMPTsgxq1qj85EcH8JneeVUMh2hox5QnuOoHATg8EoyJ+YCVSFGYl
	LfTA9DZfFKZuUH5GwC6Fe76LZzPXh5fC0ZJ5Nzx45wKj++H/RiWsyW/NwYEFazyD
	dKGi/4/iVBiRtSKArCHLVuiByr4wQxilzgeOHdBiy8OZViWWXHcNNp9mdRH6n2z8
	3m77VUgt2gP+QhfJceoOvNNgvdDKv9l5l0X6srV2pTurzzzLRWuvHOcV4E0jMO89
	7G5YvTadw7IhEgD4LzrG1AwEnGvN93W+s4WEk3edJmewbTCpluUB5v3RBwgm09xl
	Zyw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpNlHX0tSmBCNBBAZjoVGLv0ocJ7D8OV+dApWfL2268/KbLKkrZi2G11AE4xyWummU2SABeY/59rFJJ6g+QCZz92rLKspYSqIddXogHxOq0k6E8QY8F2kj0lYH+1ZN/qCUE0OEQ8zXvFTSPmmepzWXIQINbBV8juiWzwkeCSjrZ0AtERsfW0FMoRHaWy5nQ95sUdVePyKVJkCcxaz4hwKRfV4Vkbjg+veHdTGcWmvkueVW5wTTGOTRJoP+k5lDL4PZPpxuf48vQXDraV22AQxa7T8WNWC7hMaSM+GrRPYHuPDQkb8E18xSrEcxD/fwhTnyiP88XEcjiaMbwStj4KRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZz0RdBUzIq+6LfiYUuswSgwU3nj3aTiG/f1W9D2zWY=;
 b=IkJ6r8my6UU/wbC7R8xGx1XcACiXalRa1QqyuHVB3EtH23McVEt/RJoQdWyjduRaWX5Firb/mXoioc4glWMcDjHCJZdqIB05who7lSZkFQCgUDUce/AjCFjV7I3X00g3UwcRZUdTEXc4Dr5gzfBKfsQOIHbgGWi4lkx2AY6LalFDro8w6uMyh3ZDFmV/QjenCKSEMz74zF9L1BxQHhJIOMSsYlLpg9BiDOHsSnnpixWrqYHslAD7UONETFAJoqN1KXoG/WfK6BAQSsqpRcVi25JER0a5A60/rYKpvzutZ3w/QQdCT1TAtxLB6W7XwOUw6O0ZIz5Lt+KXKTrGU7mAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZz0RdBUzIq+6LfiYUuswSgwU3nj3aTiG/f1W9D2zWY=;
 b=GuKwEnySYp+Hhv86vBjhsKaN0Xl2xpAWUsgSjSJttJKDAs6lZS9TuanUwU33arvz/tQQtAtW7PB540f4SoGk6kQzG2t1bKPpzQg8txFla0K6uBJOWSmAhr9fAz0NVgCfeP+h6uIXiKDRfev3KNlExkt5PmH55XENF6ZKL8sZ5nI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=QZz0RdBUzIq+6LfiYUuswSgwU3nj3aTiG/f1W9D2zWY=; b=
	TWeHJFhkF3hik088K1Y/D+Tefvzq5EPCkzCds+KL4ijJsp98pVeiprHcxW7y4feY
	Sj0yPf1stpAo4vh7yf3IHxIlP90hay4RyP840r4QaRuFZn1rMsJYlutGnDHxcxfB
	t65FzbGn1KwGug7wrUzwwOmY7kurGsxjV13mYTylhl9Y1i02RR5UOtQyXemv4qrs
	ZRn9LLORlmu813CMybLL87mc6oTWhPLGWu/C9eH01Mfv2WKzhWjPPhhVdg5ND8Ro
	zDGGTWrOIXUxCAovwo3ThNr2MjvXlPKHUVXq8pTd659nFmtU3WNC7gAwTK21SOOg
	N3N/kC0u2W7BTYAjZ5Menw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=QZz0RdB
	UzIq+6LfiYUuswSgwU3nj3aTiG/f1W9D2zWY=; b=mlXPrg50fbFssAdD5sUZz2k
	JTHjq+IVpep0rPWBnKfdUZ/GP4+Y1xOeUG1mdnCiT7yEBPXFYP+07Tmvc525HgvL
	LW7S42htqLN7FDO0xFeaAvq4Ad7jIOx9488r2VglB4V1sqJMsmoCZMMq7ygSoxgJ
	tbhzJNb1PnsoVFjsEe/+Ty2RVT8hj41Y981RgYY0/BKBdbkMRYvikXhaXiSTvGTE
	suotkQzOCcliWWsIZdtx+qDtb2w8b0FEvpmawNmB8E3ZzLfn9tF3wokb3u7zi+53
	XIhj+XxUOuHJQigdQQrgVPSJYLY5TbzsM73sAtfAHW9PJoLpVt/IbMdxwKBmwwQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qjFzvwTkjP7uEqjFzvDLNo
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 5/5] tests: use unit test fragment in PDX test
Date: Thu, 12 Feb 2026 18:49:52 -0800
Message-ID: <20260213024952.3270112-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213024952.3270112-1-dmukhin@ford.com>
References: <20260213024952.3270112-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130019
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SA5PPFCC01D6535:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5eaa721b-5007-4da6-eef3-08de6aaa9cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HdDjsgY5Zs9ijPLoVjj0iiYpn9LyINHlATmSYn0KqAVLKu4Y72YMvzpx67eg?=
 =?us-ascii?Q?x0usi+Ktu33urfL7Vvsx8rLEUM/KctaL54UuI2uAAbPmuiAl8256iL5KKH6I?=
 =?us-ascii?Q?lkmKu7rS+41a5a/essP584I5wWQK7Jp5QAvP0kn+STvFzoZUmHDz8Tgshdmg?=
 =?us-ascii?Q?28BYiQKmVljSpH27nj7HwxQcg3/kjyKgDEm7u8dtrfuNr2NmsZcH0uoF66dl?=
 =?us-ascii?Q?0sZMqy5vKM9oSLch8a9c5Tb4MQfaXYQneUJI+SqsQ2DJs4Q41EdQtBfDhrbn?=
 =?us-ascii?Q?J7M8gJ3UD/hJlHBVplojVh5MWnQW/LfSDdDyIclPxB/EuYwqODExrkgzqs7p?=
 =?us-ascii?Q?l1Yt/w6mrli+BY6iqndOxcbKnsP711XTmVGlGeTsEQ4Ult7IY33SXLFc7MGh?=
 =?us-ascii?Q?sLBBHEnCrJuY0uJOnC0XEBd/n7NIFuvFOB49pvO3sb8VJUvdSVayt+M0wjP9?=
 =?us-ascii?Q?PfZ1qj8V49/h2ZkQdx+ixsgOzwQL0tx59uYSORXVrM/f4aLurPxCeQc5o0Pu?=
 =?us-ascii?Q?AT9cdE1BH5NdbEMXyYEyEdJAvxQtRZQd+EVxpZJMbcS0WpKVmVo/5x0KOGVM?=
 =?us-ascii?Q?5gV7d3vWYcgJn2fVGls66DpsMxh3ndNQjeFz9uiFU4VWmX5/YAd13oZMxg9Q?=
 =?us-ascii?Q?rDNWVHQqH2JIgINU/M7EdkZdUZkL/wvSsJnbNS3duo7Pw3DvDrXQ3oGSIdjl?=
 =?us-ascii?Q?s5FtBClLmcjwkfagDE3jU8P75ZkQ2jf7p2thONQ5LSCTaflYv9lIygJa8Qd9?=
 =?us-ascii?Q?c5tqNSM1QpPbF1yHe6Zgh7DWgY0XXCHUQzsI3MIy3tvP9wgpPG21WsKdDfcL?=
 =?us-ascii?Q?TPflD0LlVyDTXmiKEWNudQNpZpchsS/C3LDE2d+ADylPc4QYrsFpZ7pn+YzZ?=
 =?us-ascii?Q?/EHXuGCNVKl2Cn8MqF0TEE+m70akV3WQD5ZGhMXijVF44KXzWm8N4g29udDi?=
 =?us-ascii?Q?uwSFiCMvoVM8XKFnGI8uVBvJlUtLqKKmo7CUB5eQo218PkjX6v6m7NgosRcH?=
 =?us-ascii?Q?DyTLWeJ84TeUVp0817EtPGgNAFl7vwSbKgBjvDbwgJaKR+gW8DYKxpxTrBAQ?=
 =?us-ascii?Q?U2p5PlvptIJW8egdNpKv3qmHwKc8CpBVB/Wc9u6tax7rxXc++9oM1ixiiM5g?=
 =?us-ascii?Q?F5qrQqR+rPxAixQqJiOKIfXsjC+ASLx1UsTUKpXFNOrNcQRVI7RuiBG8GgFx?=
 =?us-ascii?Q?/0narmlwhCH5bOTHgeym4LoqAbVp0XROqJu5l+IuQznXZvhxnvJybXpxSXw+?=
 =?us-ascii?Q?1Sp3N9JnUsnJY9UHny6XKPMOxsUWgeVooaA53E8N5smXn0K09JItQsklG9C1?=
 =?us-ascii?Q?RTnqBNIgkUxk79CuCKf3yGeiGqJ1xxiCAQsguaLcsGv2alX+30BL9t6Kk5eW?=
 =?us-ascii?Q?ng4/sdrMXbdFMOf1uY70N+XqSG1LcR+8YcN/i5XhnyxNQf/fIlQyooM7HRqK?=
 =?us-ascii?Q?cAyLmtM+qDOao0bLa5d0hSCSZ8fg+0KsgYszVMlnEDKTpM3QReACzp+rR9bO?=
 =?us-ascii?Q?34oqlaDs2fw9wbWwYF2THI6CVo+O47eZjcy/DxMdSeP7j/9+9N1IoEFGu8jI?=
 =?us-ascii?Q?/8ZQQ9sFtFMBaVCe1utBDuRjeyJ71YTZ01hiruvueDNWyKQY2ellqfRmiWHv?=
 =?us-ascii?Q?ZuTPDWH8Naj6yc+KeB0NKxkc5Hlvke3Mri4YZMYc1yhtd3V7jnrRUgRGkeiK?=
 =?us-ascii?Q?CHJPyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KqVyl3013furYN8MuHrst47hO/y3uzgNd7fIiAmB91+AiV88nuVJEDkDvMtePWrXTqMnCMmgHsxQuNXVHH3vYSiIPyfuU+7lmdnAMWYjkGX7zQjkosMzCFa/PMxa2LuezRI/TblPJwQnNpYMb0wflY6GLX5HD7bKcBP4zO25W6n6zx0lSDnLbc0tDAMQ2P3qCIAqvf4euRcK3DiPMUXJUBIhPSYgej+7yttgDn3/rXm1I9oUKzsu2SMwNF1E4HNlbxHgbOUivAc6SobXJoUQ8hKw9uDZ6zAudOYFYzybEy3V0Ncp9bJTp3uuSKQLQ4ReEr2Op5FKiCuKTQsZaEn/fbXHtnKt8JvDwh/BQmHNAOIDKEmDkOw6uavvp6bpKTFmBpT09OaUwI16oamviQ87X5ORmhc4wUa0DeR1dYvcuhqsFG/NUVjvFWJIywSwZsUL
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0D68Ne2SBWSnHeSpPvWlj61MTJr6t9IeUETXSd2HBq2xxJWOq53PNYQ4jXCLQAIHlsZMoMI/0nQC2+wLtgO3MaNiE/YDhpCe/GL3oaK6CPK7MzRsznWYdidQb7E17LLM03c3GXXOPU3yy1DeP856VRhLYyC4cXHR8/8sfkDXOwrkgcKiEGho7c2CcBThp5y1RlmFNnzMsQXYNquOxajNx8oDayWEy4rdHisnFk6FcCINo9a0erXgUENvhBFCX98AVUQVLCjrlXsM6ljjU259jMuzsP43rCY0crlwHRgnTMeT86+ByT2uWJ+DXK2Z++9CpMwlaoY4pElJEusXSq4HyrwUWzzCVsrGWJY6q0xWGUg8degOv7r8rCR13YT5ec+RGVNniV3MszgCqv5ZynhFiIFS8HR3ZXTCuXJGAsuFng1FBNBSKMPhDRwI9ScnK14WSfaqRhAh8PMMb2sVUDHl6LsWu3RsantLz6XqUlomldmSc93HAKbHsKF52h68LM4Y3hN4aRLRhAEfGO4WVb9dRfZKK6hZoDwHUvw2yXyHHZCoYTsJzbA39HR1YmTZFNWVB14tOuc2iQvmhUgtYnvPdLHIr6Piu1/83aJWuhL6Lk+WorXVhxso/31JMRASeqFgqIv/UEqTpViwls+VnrJOAQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 02:50:14.0359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaa721b-5007-4da6-eef3-08de6aaa9cf5
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCC01D6535
X-Proofpoint-GUID: 8HwLCm9bgunVaHS0d0Rd1ktgjK_zvRvL
X-Authority-Analysis: v=2.4 cv=Wuwm8Nfv c=1 sm=1 tr=0 ts=698e916b cx=c_pps
 a=BPguv+Q8Nj9xbNSzergmQw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=mDV3o1hIAAAA:8
 a=cbNQJ9GKAAAA:8 a=CTJY7OLnDzyQ9A8_STcA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-ORIG-GUID: 8HwLCm9bgunVaHS0d0Rd1ktgjK_zvRvL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAxOSBTYWx0ZWRfX3ujcxBKhb7rA
 KCaISNmKUNtpyKaTtbzJD7ZbiCeuPswf2Ivf6U+QaG1fy7KQInvyZAUaXNxWmVPooH5TeUzV74U
 kli9kZeflEghIV9sDqzLLI5+i0E+D68SVpT3y59CMqPiSmT89kQRqnVX8gageUeKUovqi4R+cC+
 g4IIS8VQQepe6qtho1Z7OL+JjYPNucNClIivZ9tUxqJjn5lTVKqcimPFFeJ56QUqBvgH6rbCSJj
 +t0EgPdF8i+Idh5jEW+DC8XPjxF0SD1/tgDyt8JDGJjdWMLoeNyRR+VBkQYmnfAuPSrKvQd4lOq
 HA0TurMWAlrL74/wymZhWAseRjpyYUnx9c2MGWsZOtCMD6mfyQkPIxxkDrlgmX7iNR71q1QYTzW
 2/w2mq4imWiurnEDckRyN/27/so6kr/MdMvQpOljLtvCXew1JFmYK9gCMjFnpFF1K0h/uUf6ct4
 n7nx14GjIIhOrvacubA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 6532A1327A4
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Use the new make fragment to generate test harness code for the PDX unit
test.

Add ability to pass custom CFLAGS for mock code and object file suffix.

Move <xen/bitops.h> earlier in xen/common/pdx.c to ensure harness.h is
included before triggering the #ifndef MAX_PFN_RANGES check when building a
unit test.

Additionally, use real <xen/pdx.h> in harness.h instead of a locally copied
version.

Update .gitignore to exclude generated test build-time dependencies.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- added lost -DCONFIG_PDX_OFFSET_COMPRESSION test
---
 tools/tests/Rules.mk       | 19 ++++++++----
 tools/tests/pdx/.gitignore |  2 +-
 tools/tests/pdx/Makefile   | 59 +++++++++++---------------------------
 tools/tests/pdx/harness.h  |  2 +-
 tools/tests/pdx/test-pdx.c |  2 --
 xen/common/pdx.c           |  3 +-
 xen/include/xen/pdx.h      |  2 ++
 7 files changed, 36 insertions(+), 53 deletions(-)

diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
index e8a9e82320cf..dc16926f0591 100644
--- a/tools/tests/Rules.mk
+++ b/tools/tests/Rules.mk
@@ -16,11 +16,13 @@ prepare-harness:
 # Generate mock environment by replicating header file hierarchy;
 # each mock header file will point to a harness header.
 #
+# NB: double-colon rule for mocking environment for multiple tests.
+#
 # $1 Hypervisor header.
 # $2 Test harness header.
 define emit-harness-nested-rule
-$(1): prepare-harness $(2)
-	set -e; \
+$(1):: prepare-harness $(2)
+	@set -e; \
 	mkdir -p $$(@D); \
 	[ -e $$@ ] || ln -s $(2) $$@
 
@@ -30,16 +32,19 @@ endef
 #
 # $1 Hypervisor filename.
 # $2 Harness filename.
+# $3 Extra CFLAGS.
+# $4 Object file suffix.
 define emit-harness-deps
 $(eval c-file := $(abspath $(1)))
 $(eval c-name := $(notdir $(c-file)))
 $(eval c-headers := $(call list-c-headers,$(c-file)))
 $(eval c-deps := $(addprefix $(CURDIR)/generated/,$(c-headers)))
+$(eval c-obj := $(if $(strip $(4)),-$(strip $(4)),))
 $(foreach x,$(c-headers),$(call emit-harness-nested-rule,\
                          $(addprefix $(CURDIR)/generated/,$(x)),\
                          $(2)))
-$(c-name:%.c=%.o): $(c-file) $(c-deps)
-	$(CC) $(CFLAGS) -o $$@ -c $$(firstword $$^)
+$(c-name:%.c=%$(c-obj).o): $(c-file) $(c-deps)
+	$(CC) $(3) $(CFLAGS) -o $$@ -c $$(firstword $$^)
 
 endef
 
@@ -48,10 +53,14 @@ endef
 # $1 Hypervisor filename.
 # $2 Hypervisor source path.
 # $3 Harness header filename (optional).
+# $4 Extra CFLAGS (optional).
+# $5 Object file suffix (optional).
 define vpath-with-harness-deps
 vpath $(1) $(2)
 $(call emit-harness-deps,$(addprefix $(2),$(1)),\
-                         $(strip $(or $(3),$(CURDIR)/harness.h)))
+                         $(strip $(or $(3),$(CURDIR)/harness.h)),\
+                         $(4),\
+                         $(5))
 endef
 
 .PHONY: all
diff --git a/tools/tests/pdx/.gitignore b/tools/tests/pdx/.gitignore
index 1202a531a7fd..1bf9c05985c4 100644
--- a/tools/tests/pdx/.gitignore
+++ b/tools/tests/pdx/.gitignore
@@ -1,3 +1,3 @@
-/pdx.h
+/generated
 /test-pdx-mask
 /test-pdx-offset
diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
index 3c431d7c7822..fa0bea8e1035 100644
--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -1,50 +1,23 @@
-XEN_ROOT=$(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Unit tests for PDX (Page inDeX).
+#
 
-TARGETS := test-pdx-mask test-pdx-offset
+TESTS := test-pdx-mask test-pdx-offset
 
-.PHONY: all
-all: $(TARGETS)
+XEN_ROOT = $(CURDIR)/../../..
 
-.PHONY: run
-run: $(TARGETS)
-ifeq ($(CC),$(HOSTCC))
-	set -e;             \
-	for test in $? ; do \
-		./$$test ;  \
-	done
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
+include $(XEN_ROOT)/tools/tests/Rules.mk
 
-.PHONY: clean
-clean:
-	$(RM) -- *.o $(TARGETS) $(DEPS_RM) pdx.h
+CFLAGS += -I $(XEN_ROOT)/xen/include/
 
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
+$(eval $(call vpath-with-harness-deps,pdx.c,$(XEN_ROOT)/xen/common/,,-DCONFIG_PDX_MASK_COMPRESSION,mask))
+test-pdx-mask.o: test-pdx.c
+	$(CC) -DCONFIG_PDX_MASK_COMPRESSION $(CFLAGS) -o $@ -c $^
 
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests
+$(eval $(call vpath-with-harness-deps,pdx.c,$(XEN_ROOT)/xen/common/,,-DCONFIG_PDX_OFFSET_COMPRESSION,offset))
+test-pdx-offset.o: test-pdx.c
+	$(CC) -DCONFIG_PDX_OFFSET_COMPRESSION $(CFLAGS) -o $@ -c $^
 
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
-
-pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
-	sed -e '/^#[[:space:]]*include/d' <$< >$@
-
-CFLAGS += -D__XEN_TOOLS__
-CFLAGS += $(APPEND_CFLAGS)
-CFLAGS += $(CFLAGS_xeninclude)
-
-test-pdx-mask: CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
-test-pdx-offset: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION
-
-test-pdx-%: test-pdx.c pdx.h
-	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
-
--include $(DEPS_INCLUDE)
+test-pdx-%: test-pdx-%.o pdx-%.o
+	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
index e49d6bcf92c2..4cdda931feb2 100644
--- a/tools/tests/pdx/harness.h
+++ b/tools/tests/pdx/harness.h
@@ -84,7 +84,7 @@ typedef uint64_t paddr_t;
     qsort(elem, nr, size, cmp);                                         \
 })
 
-#include "pdx.h"
+#include <xen/pdx.h>
 
 #endif
 
diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index eefd54c76815..3633c231abaa 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -7,8 +7,6 @@
 
 #include "harness.h"
 
-#include "../../xen/common/pdx.c"
-
 struct range {
     /* Ranges are defined as [start, end). */
     unsigned long start, end;
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 7e070ff962e8..068a2098b41b 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -15,11 +15,12 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/bitops.h>
+
 /* Trim content when built for the test harness. */
 #ifdef __XEN__
 #include <xen/init.h>
 #include <xen/mm.h>
-#include <xen/bitops.h>
 #include <xen/nospec.h>
 #include <xen/param.h>
 #include <xen/pfn.h>
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 856fc3e8a0e6..8b4a8701a25f 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -199,7 +199,9 @@ static inline paddr_t directmapoff_to_maddr_xlate(unsigned long offset)
 
 #elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
 
+#ifdef __XEN__
 #include <xen/page-size.h>
+#endif
 
 #define CONFIG_PDX_NR_LOOKUP (1UL << CONFIG_PDX_OFFSET_TBL_ORDER)
 #define PDX_TBL_MASK (CONFIG_PDX_NR_LOOKUP - 1)
-- 
2.52.0


