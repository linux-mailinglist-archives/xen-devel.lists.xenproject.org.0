Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fL/kIDJOhmk4LwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19664103165
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223852.1531247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNn-0000Mj-2U; Fri, 06 Feb 2026 20:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223852.1531247; Fri, 06 Feb 2026 20:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNm-0000Js-Rl; Fri, 06 Feb 2026 20:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1223852;
 Fri, 06 Feb 2026 20:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voSNk-0007sY-FS
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:24:48 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de7e6e86-0399-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 21:24:43 +0100 (CET)
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616IOGEJ000612
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 20:24:41 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c1way2guf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 20:24:41 +0000 (GMT)
Received: from SJ0PR05CA0135.namprd05.prod.outlook.com (2603:10b6:a03:33d::20)
 by DS0PR16MB5392.namprd16.prod.outlook.com (2603:10b6:8:156::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 20:24:30 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::4f) by SJ0PR05CA0135.outlook.office365.com
 (2603:10b6:a03:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 20:24:29 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 20:24:29 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616J8RBF3941138
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 15:24:28 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c2127xjkm-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 15:24:28 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id oSNOvB1fl4XAgoSNPvvjiz; Fri, 06 Feb 2026 20:24:28 +0000
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
X-Inumbo-ID: de7e6e86-0399-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=WXOe7x/puaksRUf8rmIsWMRfc
	lVPj0Uj2TcLoptzsdY=; b=sdg+YZB0AInLZizskn/Aj1llQcAA53U75DHeHqR46
	0BJTvlIvWfSwwsn08ThjOG97kdEwuga5kJE96oL7kTypIPGysHQVW7jYm0AjPd6o
	QhZ0gcT3TFBZC5f/GxXl3t44CgKl9n6Y5IgXDw1Y9jCZsGkZtsRrHXw2RvXnTWgd
	u82tIDl+ndGlE5OQMn53Ojnqs8CCXsbC4aHVnXVSNTKKpQgZOukTOkT2pgZA0iWw
	T9TBtJLoqy0OIb2G7AnX5qi3b8SLihKdGxPqR9LFnJ5J1LkGJNQNjcI0sDLVeEew
	Tp9BbsmZfdBlb4EMVak22pTkdC72Q6glJSgj7aHrObSbw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nU4aNXiqciSnyL2/yTOT09490bVd1jQ+juvdVLPKy5GjNKubhR3uacd7a7m4uQCOzfkKIhG2dA/eXLi0eIaSe0WvMP/zihEqNA+3Nu4Qz/2pbhRlymvZL2Fbq5TeZaEm7D8/vSqExfjrrZT0XFLgNTGYBS0reokTi2pVuBz7f6UlqnmSBAHWi55Z9JXqmLBMtBeSIP9tPm8hT80FwyaI6FImsZsmJU1uDDLKLGuUCisLSyVFcoo2hQEpTecxOlVugb0g1nfjtw17KIpF1ovsX/ul/+7fPxQ7J3ANbsjJqZkM3zXUMt+pHTc8LKvZEqrXzRn8jibor1tH7OrVN3zjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXOe7x/puaksRUf8rmIsWMRfclVPj0Uj2TcLoptzsdY=;
 b=MCqsM9JTSmHsbCqvmFBO0i3EXqFQGz5NGakEngJ5ByQBwv3/jaQoTLUF/uK3Lau0ImTN8rEVwLNrDGGZVMI/XKgxE43IIdBnsZDajP+DL4NMKvlu5GZevDj92Qs0BM15PZ0xUr9JzPz1l0rqEBUgQDs1rw4f26wUqZK5o9Qty9adDLFNnVnTPlXMIrfG/5fqQqupCU7GUcN8dz8lJA2ctJt4AY1fhA5iV51Lntnir0Lvz9dT3yO41Zo3z5euGCC5Zeyr7TDacYovHZnNlV7jfaxVWHYo1nO3GQk4D8KhBUu3jPw/4b6ZORZ0bq90wzJw/4H9uS/4LDfi8jybOgXjJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXOe7x/puaksRUf8rmIsWMRfclVPj0Uj2TcLoptzsdY=;
 b=glj9Osi9TCy0DYSZ0SN4bU8R6Gk8GMl0a3vRcDSGoQDlPyB/TGvb4755Mk46AmgV6a7tzitvs0845ssxfaLnQ05B3vmG/t1pCOjwjANesUbF/3mNwMePpLtSG3sLKG361MNlOlK2Z24s8FgM48auMRsagWsCqNsNTG6ndoDxUtE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=WXOe7x/
	puaksRUf8rmIsWMRfclVPj0Uj2TcLoptzsdY=; b=J60LHh+NHQqmJI1odjU0GkP
	0ONL6DRLzT/ta8LlqQ0CYRnu5VVWZvdcDdteQhcrWMY7gkkaDk2cuJvaOWYWk480
	4E2nQWBmggodH17b19pJZyS6Q31dwH9VGVU59dWRbjyG5Ny2Wigs7DcJu+JGkFAS
	udoeap+lte2mFl30z2U46yRUcDmPDJn5Raz3Vsr3CwAAgR909FzQ6UKFHF9wQzEh
	6Y1qUFZqOc4Vo9vRFzovjMTo0fu7tSQBjYypzjQCekWGD1WrKNyqixguLPhYmxs+
	dMqYBMREJFYhZQgGYkhX8Rw97A5v8SfpnPnNzUo0OkzIOqylPt3Apzy6xcP22/g=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=WXOe7x/puaksRUf8rmIsWMRfclVPj0U
	j2TcLoptzsdY=; b=Nap9RnTcROlrJyMd4GjWcefH4k3lkgRfu0jbCbjXMYCtMA1
	KDnQ2ueWBlMPLCYMM/Gt7P5sOUdVpDbuoWOChAkRm5IgD4CTK0sQpcC5OcGKKb4L
	uiGQWRq60KDaSZzyeFhgoXT9C6auaJME6XDyit3P5UJ1JF3+3tZDNdpHaBKQSOV6
	9WsnN4FEiWtvwA8ppNaVyYe3c/tRVTyrhUFxIM7ha0B4+6Mdqe/gh3g4sOcwzvqR
	Ib8+Lf7Hh/hWxZY4G3p6T8JR+ZFveyvfwMw+jLBzydANxQdyPENmMwAvng9aRn6T
	uleeY6Qm9V98RVCKCj1LTnWJbYvaa8tU6hIZd2Q==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oSNOvB1fl4XAgoSNPvvjiz
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 0/7] xen/console: updates to rate-limiting
Date: Fri,  6 Feb 2026 12:24:17 -0800
Message-ID: <20260206202424.2054758-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060151
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|DS0PR16MB5392:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e0269ab-de28-46c6-d941-08de65bdbad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TN+Hu8vYnMgB3eoajViAxRdzVCLgV8F01CFQuj+VPBYvbhvqSC6uUn3x+45l?=
 =?us-ascii?Q?PtceTZRh47ZpIIxSy1RaKvPne5WnHes6hwm6QmIC621+SpBpKQLUiliurc5k?=
 =?us-ascii?Q?9jxcSdJULYmYTpSoUnPF3snifGu0jsJR1D0WOl2XNddR5wAm+6UjP8eRPydH?=
 =?us-ascii?Q?l22twcg65bz+WymH1G0um1Dpu6VGaAR0Ywp7iZy+HQ7rn/o0DM/xKM3Qp06R?=
 =?us-ascii?Q?a8y5ASOVn+K+/EvMK+JYF5EraIZ7d1kVL9OeB+eJ+6tIxhUFEoK0YMcFZrmJ?=
 =?us-ascii?Q?M3yRdbhWG8HYcf6pn/oXlsF3RG4Q4Gd9I1c1++AoAXjQXlwazYvtBTVKwe03?=
 =?us-ascii?Q?yxVyoYbMvZitnbcbYHBf8MAs4ciap04sHc7Iio+tezeitIiz34wtKnbEi6td?=
 =?us-ascii?Q?lVWCO4ZMT0bIHrXukWHASAmmHez2A1yvXlmZ9W4eZ9yY0H0MfIpgzDxtEWXV?=
 =?us-ascii?Q?6UUlqsLszhBaUOxy2gslPCtWSPk4ijh34NhCh8j42JzfRPwJ/p0HyH5jNvtN?=
 =?us-ascii?Q?EiJOyHSOIwFPGAoLgfMOtmk6sSCsouIDe7ckpeGtS0w6LwC9PeGWE9sxsqKk?=
 =?us-ascii?Q?9zTmWd82OESD4DC7gpana1fvk/ReE5Wo/NASXUdwY3Yw01AZ11JL7W0fKsVc?=
 =?us-ascii?Q?TA9A+g/qAGNn/rPu5KBJE5l+4ItoGRmeY71pjUbUFmMN/Hta3xj7tgpOPpX1?=
 =?us-ascii?Q?RS/Og1t7OYklNveyLZECdnveIpRSRGOR37oIzmZ0+5XfeIz5/hHpQOS0TUnk?=
 =?us-ascii?Q?egWv04CREW1L2pw87+ox1yq5KC5noNOg+7J1JEmpfxEeo4piOTY4E6MEyll5?=
 =?us-ascii?Q?CFIBfF5dj0KxS6Yt7rYDEAzLFuLWKsMKfAYXd74OMTpEwjPX3n4LUHgu3oAh?=
 =?us-ascii?Q?iNSrqyLBdKDg/Uz8gVtkJfEDcC3VW1TbHKgcAwinJ3IqT3P4CE0mv0ObCY89?=
 =?us-ascii?Q?4aHOSulAg3gMl4X6k0JdFW32HOVzEDKLBEtuzsKz+n/sUQe5nbylfaWEF3JU?=
 =?us-ascii?Q?x0/GE8FsKSIKK7LKZmZ5xP14ljpRtSvMUibGL6rbb5Ww3BgtR4rkZELFAsFi?=
 =?us-ascii?Q?Z69l7B8iOHv6XwLKudCc7jO57M7Doci8B3V+Gc0E6KB6GsnLzer1Mq6pDOH9?=
 =?us-ascii?Q?sEgghwRrFP1+Q8iBWXBtzxj5radW4FYL9dwEHlQflibWo10q/pGYItq/LnZB?=
 =?us-ascii?Q?B9qJRCEq2rhGIKN/DCEYk7oqZhW3j8pHlOSpAFHmo+bjyfitjwa1lc088jlM?=
 =?us-ascii?Q?dA3XT6wb0mgtzHnBpiP+vsNVOiqDEmOmrKuy1H0S8A+jJbZh/UUbtw37Z4sD?=
 =?us-ascii?Q?8STF1OG+MbvMk3QdjQPai8JSMETb6fkUXRS5zTlCSO80CUlC2z5ssu3fM5tv?=
 =?us-ascii?Q?J1SokQPqU0zpNs3uls1AKcUVEXCmquoKR0paYs26V0coss0xFrpq7D72wxTG?=
 =?us-ascii?Q?sFv6heMpjGLEDenH0NZysEB0N+SKhzdKXHTBBRbIXTrRKfKSfVJB7mldyCFj?=
 =?us-ascii?Q?LhQcsi3b6salRGcdjrNk74DP1nWkkzluWr3PDGyVI0hWiQJvgOYxWzdA6Arj?=
 =?us-ascii?Q?4w7nqCjrD7DuGkw3QCFkXnrTJT51VpZC9YkA/P/NqaY0QBviOLHridmbedrx?=
 =?us-ascii?Q?QY8JcOiy0EnUv/nmiIg7shntYGxfkOiTIPjf4KxXO1DwbSNANTrpIgdnKouT?=
 =?us-ascii?Q?5/o4TQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZzaeIT2iXKRbDD44SyT2kegnBrhARIHZvkaNQk+/P3IK2wOe51uVlBPE19e52DYyjWHIqch8g5A0SXENUwDJnV9eqvCYfKqESf4JzSMDXEmSWsKaB0BIg2/cFzIO/pTBFztLp58cqgUyHjIX4erw/nd606YavHEDx+mZ21tM22tciWhP9AhLCaeUahfNcQUaKW0P1Ba1pJ9WURduP5raxxlUwU1uNQRyzLx4HFxCa+mgF/iimDprW0tEO8Vik79DbAzmU1IbPAIZRYEfWVminEo5YTLwRCv7qVjpZI/dvZmNM/zwe1Shn+YXUZzx6b3wbTTdnNvvV9am/0Az71T05UU2jVd/8k3xLcSDFCMfREHstog73L1nnFrpJbdL3ICKsxpQXvaRIf70rPhs/4GYOxC8ZDoGnFwApc3Azx4ucerGNGyyVMJLZwVu21PQFgy/
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	muhajrjo5kQp3zug+obrJfRtV3bN6aMi77h/+d7xi0TgjcmxDgOHf51VZEH1NyiZu/gzSyiAaLeKbraI7Do5pdQGeCdlhrrH3C1r66hwuhd+aejV+v3ote60Ig9GaSEu/Rh3XrMQdLntkAwUBedrqmvxThQNFVuskadxzMwNDgSgqtbxXgdAdXZoiQTq5SyW04T/4gJ9kfoZoetkwNtllNxieQCzyhqdBCGOmIdzdpm39D8Q88joLvVyzLfDowvLmRd/NYO6tLHwtGSAqRzsn4dfDWQEZawyMZzEbvI410c/xsnF2feDUdcwxxSfXpTnWCVXNdM6bHMcL8nP5y1Havb/3ymDI3Lf05a9jYsXOenhZD3h0MALIlS+r9Ymfwbv32BZcX8yD7jOruhdXP3LzOx8+kQxhQfFNQeiBvBtMyef47tGoyH3N6yDgZSp1JwH4WbDgafhftp5/lWkJ0Q7dzHHFr3N6YkWFE0h/6PH87H2L6lcTKKdkEOj38ObczUK9XIu5hJOGcIyuquU+W9TGOY/9j6Vu3jhh+9nDy5hQHDWMjUrslnLHAQOUaP/nM0H1c3npeouzeFUQicE6hWhbtWQGqGRCCh/z8/T0zHREn3NuJRU61Kj27CGZLPBBQVA
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:24:29.0315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0269ab-de28-46c6-d941-08de65bdbad2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR16MB5392
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MCBTYWx0ZWRfXxr6O7QK5qZUL spsZlgaYuvNIyzS/oF3hsfiyfAMRdcW/6C9WvHtdtLk+ZHIo4D36Gwf8JmkaVTH8/IYORkeHkpe 83nZb4rtGMLskJSxLT/2prtAFwodA2fhf3FOzSM0Y2eIjIScUhBN8QVjf6nOyyVlqOmEj3xFAWh
 JRw5P2RdmnARPELfa3SPvG5N8BbxU0xkAwsJ61dO5wdEzvTImQtbsMU/81SsgkRmCCzPawVzgcP 2X7qT1oifHGFpzM8PhJjzeFFhr3SzJhR5RoRRkWE7+VRB2pyrfW3IEStsmWzGZXrEUHctvBttfA aiU5See1WzVCNWijobIfGwoWje4oqAiEGhscwVdvKHrr17lAJdXfIN2BpJDAHEg4Ee2qYFLARAk
 lFne8Msabl7E9CtVs0oWvsQeAeLLxwckIXCSYGcxYfm+N03yKsIti9befz8EEPuR0wBWJl1c92A LaalyPWK9Mx7HcADHiw==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69864e09 cx=c_pps a=4YDC/s56AEiJKWlPnw2jOg==:117 a=lOEMawUel/sSvQipkIvNbg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=_6ByI0yGj-vICIXCAFgA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: 9wXk-qr7bMORXKKzeJ-QnoHW-lx-GPQc
X-Proofpoint-GUID: 9wXk-qr7bMORXKKzeJ-QnoHW-lx-GPQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602060150
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
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:mid,ford.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 19664103165
X-Rspamd-Action: no action

The series introduces compile- and runtime-configuration for diagnostic
messages rate-limiting.

Patches 1-2, 6-7 are tiny cleanups.
Patch 3 introduces build-time rate-limiting controls.
Patch 4 introduces run-time rate-limiting controls.
Patch 5 is a fixup for the rate-limiter to adjust to new user-defined
rate-limiting parameters.

[1] Link to v1: https://lore.kernel.org/xen-devel/20250725212235.753363-1-dmukhin@ford.com/
[2] CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2311064179

Denis Mukhin (7):
  xen/console: remove __printk_ratelimit() from lib.h
  xen/console: use bool as return value from printk_ratelimit()
  xen/console: add build-time rate-limiting controls
  xen/console: add run-time rate-limiting controls
  xen/console: correct leaky-bucket rate limiter
  xen/console: use s_time_t for time accounting in do_printk_ratelimit()
  xen/console: simplify printouts in do_printk_ratelimit()

 docs/misc/xen-command-line.pandoc | 27 ++++++++++++++
 xen/drivers/char/Kconfig          | 25 +++++++++++++
 xen/drivers/char/console.c        | 62 ++++++++++++++++++-------------
 xen/include/xen/lib.h             |  4 +-
 4 files changed, 90 insertions(+), 28 deletions(-)

-- 
2.52.0


