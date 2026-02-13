Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aibBC5WRjmlbDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:51:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13121327A9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230084.1535654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjG8-000702-Kc; Fri, 13 Feb 2026 02:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230084.1535654; Fri, 13 Feb 2026 02:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjG8-0006yb-Gm; Fri, 13 Feb 2026 02:50:20 +0000
Received: by outflank-mailman (input) for mailman id 1230084;
 Fri, 13 Feb 2026 02:50:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gzd=AR=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqjG6-0006yN-I2
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 02:50:19 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8f5c4f1-0886-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 03:50:16 +0100 (CET)
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CLDfkm438691
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:14 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010012.outbound.protection.outlook.com
 [40.93.198.12])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c9pkesr2c-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:13 +0000 (GMT)
Received: from CH0PR04CA0081.namprd04.prod.outlook.com (2603:10b6:610:74::26)
 by IA3PR16MB6725.namprd16.prod.outlook.com (2603:10b6:208:520::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 02:50:08 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::47) by CH0PR04CA0081.outlook.office365.com
 (2603:10b6:610:74::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend
 Transport; Fri, 13 Feb 2026 02:50:01 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Fri, 13 Feb 2026 02:50:07 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61D2GRnp2516936
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:07 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c6mq5denq-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:06 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id qjFtvl2OM4XAgqjFtvcAUl; Fri, 13 Feb 2026 02:50:06 +0000
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
X-Inumbo-ID: b8f5c4f1-0886-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=D+K
	4AlEnp22qTNZLqCdKEdqhzmvY/R2xKikFORG7B4I=; b=efJbAw6dMBfJTpVc0LF
	wX7c8akTh/6UE2DzI6y7d9vV/VgUZrm3dDhbt8K+4GoDqkF4lfccjbDPM7p49Pey
	0I+SRjQm6Fxt9ou+COtdauglqQMFFew6Nd1yVnrXKaMMlwvPjSjp2DtvCNhHwx2T
	jDjyGf/tn9+EZw/0bUH+MUN4Vruc/FeTmRQQ9sRdstjUXj8Mvi9iYitZGwEzrKSL
	LWgnmggaX5HvJmnm1BERXGC0GhEHM/ys7Ctrhpe3xydb9uJRFZeKV2ZqZXlhJZyC
	aFTdxzdoKGqS0WF5pl/vD9wSXEUytJGHqxO/j0ffBmPZ5WkvEGYgGOAnOmXrCP7s
	Fhw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBSew6fgw5NjfL4W+q28Ftnwbma1Ss/K17Ot7XvWmOM1iGKOExcl7vVmlkDf8P/rvKh36s4FVPf1TG6IFnnBMhI6QgPIbAJqqHfvNzQ95KWL25QwTYzI+TignZmbQGtC+KHRdivezMkSVjO1NELIw5etiDOtJ3JsdbdD7hWKLhMOEccSq4+yAzBg9lzvUIEkHnvUUHCJkLuS+iH9PYLwNxlKT5IBpJir6b329zVXTEWMN2B1LiVb7H2SZm0Td6MgBcENcnRD9qIQLpJLVm+nTqlULjxKLMTHOJXeVowe5ieKcIx6BffnQhc+QQlUXkiOMZo9i0shRD900SCUiv33SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+K4AlEnp22qTNZLqCdKEdqhzmvY/R2xKikFORG7B4I=;
 b=EckWBDaOzH6xxGzFtvnOeGmnwDI60KnMXHVAayFaYcuydNG0POgTuqvoKAR2PNbY5+VnamM+OQkulMtEfFweaTN3uvSQErecBsWwTiyPDNMDe2GR6vYo/VQIkLXMCqriR8sAhH70I7LHqxXap8jp/00i8rYGxKXpzgCAtIwKL2ZtbFLqr9ZTYf3KO4hIHvyjyl5XZftl4AiiZBuFMOqjv8nktpoVT08NVn/irRi4kcX7//M7scYyL8tAM+CVrMtbUURzBdmC8fMjFw4jjx9VDTihjwsDYwZqKXGgH17Lvq+JeOpLqevSXT1F1NObaJ+m342LXAWkZsRE6e9lcy4CRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+K4AlEnp22qTNZLqCdKEdqhzmvY/R2xKikFORG7B4I=;
 b=ikdlWV8viCwPLzcQaBaNuFrXQKAZDZ7s6IPbGCZxVBIGswP06cdJR81M/lGYqKjxwx17RwuiEeOAMfGr0RslVXNtmRuuBzf+aD2bvOU9I5GtLfsjmh3Wl4fiURLVcyYJwspZ3M4EosFOYiVVFbEsiNbdvGE10aY0cLgIWW6pG7A=
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
	ppserprodsaar; bh=D+K4AlEnp22qTNZLqCdKEdqhzmvY/R2xKikFORG7B4I=; b=
	Q0wmPxyG2NNp7o07niA0EhjPSGUyBYl3mJ0HUNbMZaECemDDC4oV1XjfEob8g1Ba
	K8xD/ijYWF9dU+D6HkUFuqYJKNkKzQ2u936dc8OsWAox53TESQZEhpQUP4yINDqs
	eNrLXWcJpSOgBPz02x0Z3uMARvLaJ1ykJnDT8XYu/B25aKUTksBhZFsMdQe4+vsN
	vAsTNhZ/ujtUGkvTsRdrTER7zVAEYpxw6jvv2K1gB70qtVOeDZLWfLnIVEEpokTj
	v1ShjOFqiKjrgk8Mgj4Uiuf4I5aJXquaxDr+I/WtdUfyR0iEbuYfptitREsZqYaF
	Evfb73b0DFIjOP6iczuRGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=D+K4AlE
	np22qTNZLqCdKEdqhzmvY/R2xKikFORG7B4I=; b=LUfQyG38sPwFZ4jsxihM0YM
	ru2YljJK8NiGiXS7IN2OwNMy86HfZlIqGAR32YTDv7H+Fpx1G8rj9VZ1UPerAkYZ
	eDpz0nsdufCptd3LCIESYYDC9/Z0Cp1H/hIJawCKBO9SavZ/RfFLOlxo48Q7HDjg
	3cvSWtmgcKy4dpRyMkdFdc8e4z76j1dfS7/400ix43/Eb16F/ZmDUMjacl6TJJXU
	IB6+rMGOogD2YK+YFyaZuH7HWAv0aH/34+DlqxhCicFbx1YFiqkFpL8UMrfKs04m
	11laPQPUqR+22rbHlcseGIem+rQ40zSKynrbGu5yP2CrnN3E/PetiQNTeviCbkg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qjFtvl2OM4XAgqjFtvcAUl
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 2/5] tests: use unit test fragment in domid test
Date: Thu, 12 Feb 2026 18:49:49 -0800
Message-ID: <20260213024952.3270112-3-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|IA3PR16MB6725:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05d4fe57-cb57-46fd-c0ba-08de6aaa993c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dYS1LUEVjXJE1r/AeAJftHUyXmaHAqcSGFn8ZfKcNZBaNk33zkDkBgSaXcMU?=
 =?us-ascii?Q?YpriShHl8E5W0UufoOC2e3Cm+06hbOGByeFOBVZcvXgg/1mA1/Dth0ophA9A?=
 =?us-ascii?Q?WSrAaL/8t4ccdtBuEBcMIv+UlzPbvicP05Il2CEwlxHBdLZ2N2hq4/ei1yzG?=
 =?us-ascii?Q?Op/g/S2zDx6X5UJQPyGkgPEHYgyLcaSQT27++xwrrWvacxjvrF1q0papfQYm?=
 =?us-ascii?Q?mUq4Ojtj7dXAMgFaekx863hc5OyC9f2+TzoSlj7VfTBedXlKjkO+Yuf36WwL?=
 =?us-ascii?Q?DBJN9GWyDwcdsM7pX/hAnd4Z67rjVByARSuZHIXBA84CgO78s/g64PQihS/s?=
 =?us-ascii?Q?aDe3add49BFsY1Ql+THpSI3DitrQlj3BJpYNVlgWQLmEaipxZ593xrForUcq?=
 =?us-ascii?Q?MNtCOI9Pnx8IfqeEXE0tz3icyFwFhx8133O19KGf1K678w3BV8zsVqEwCyCX?=
 =?us-ascii?Q?v1jzX/dcJn2c70Z92gWZOkATQJ7LFqUrrS3nDrjG5wrWzg//KHoe5Am4Y+SA?=
 =?us-ascii?Q?rkeA1IkBcSK/tQvTb49HBfpdiRQ9jNHdyzGKV1Pvc3I5O3Q1F9cZd+CFwhE/?=
 =?us-ascii?Q?yq094n5MDijcNFs8hw+sogULyqdE8Kvf0Fm3NqGY8Uz6vu//XoWDCj95E5/N?=
 =?us-ascii?Q?m4G9xHjRZyq1JN4mFKiy22jWM8WYgsQpVWuC9RqYesAXnB99PtZnhSD4F4kS?=
 =?us-ascii?Q?CosBRoKbZWm/d16ZjOSUnr/2e8xH0KU/dLp+GX6SBzDkpfbmgnk3+KrFql7E?=
 =?us-ascii?Q?oARqLmmflCD4lgkL0Cgx4gfnshG/XW6GYtgUhN0p4eTb66VF3xT92EXSp+3F?=
 =?us-ascii?Q?e4IUcsTlESCBqzlnzPllddqoUEHtSuHpnP10FldDShmbTsMz2Tl26bw6qZR4?=
 =?us-ascii?Q?iAwHTsUI/+A9C8gQeT7WN3RRftnB8NlAxpPTB9KksVgZsACl4keu+DiK4uQm?=
 =?us-ascii?Q?23MxyBOPbs0nAbJPEMRKgLu58OLEyITFKOJqqnMx1APxMwRf1gyG00SKerp8?=
 =?us-ascii?Q?KpcAxhTcqTwXkQ94LTRSuQUnv9Nj+x3tyJhlQ6DOmI8azsSVOoiUMlwQVx2T?=
 =?us-ascii?Q?AePudwHpFYk/0geWhblM3MSiEyAuAQrQS0ABvywf13mD0kgX4zgyZMIcFcWw?=
 =?us-ascii?Q?EamV011frlSgI0caqSFRnPX5mEzpv3vFJWd4xo8BktBFgU54jy2Irinpx2ya?=
 =?us-ascii?Q?ydqX7gEYckY+B1Wu4rTp+s7qV2NmKDE1Lsfp8BsN3kX7CTjNM6V9V2KrWwPK?=
 =?us-ascii?Q?/QOJZET+23CD4G/nzBH80NIZO0JNYBYYLIbvTlaWHOm2C53tdOJ5Vtdr5Z5f?=
 =?us-ascii?Q?7z2AfkuOs29YtkDNRjq9HRLqag0l90nBbN7BKNW6fO5njqJL87OjWB3yqUG7?=
 =?us-ascii?Q?f92ykw9lYyFCSdyZspMF9gQUG41tOTKDX2J/fnEAuuForxR2aiJ0vqHLdY7F?=
 =?us-ascii?Q?eDzgF+MmKo2JOVoE+sb/E59RYfTe2SSvyUh5S2FLBV3I2uCodV4MV2P0OOlD?=
 =?us-ascii?Q?ajdNYu5sE5GEYa3BjU5Stgb44VRBUXOqW03FRQhgqQu6hMyrwvGgtpjANF/H?=
 =?us-ascii?Q?oxY7Rf5H0J1lqLqPsoWdikDugRvxZ16Zm6XXCLBgN5kR+T+v1BGw9zOz96LF?=
 =?us-ascii?Q?8Ak6YM6WMd69B/lamP3Ei8hMS4lSQWYGn/Gu3UF2phXWikrnFWLPZ20xqcAC?=
 =?us-ascii?Q?q8OK1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vCoCItotyctSe8lnd6oJmcHqMXLtYe+4eH9pbPmy239kXgUmRXYP/FEfiGoZPRzgNxBBGNicFUI3R3aAROHUpnvQGJcCYLEzT3zIrikP9QKY6GgyAEqbDub2eW69c/wFtZVwzeR4hilCjUzyoFaWBhwnpyXFJE7zV0Xt62R+QS/Fz2NKGyr8bScWY4O/npCQ8xIkQ9GeGZddXF6wkFzmUpeYsiEjmXtypjdcrXlhFhom3SawtpdvJwNC9/Gb57cGcJz+5yfSb5QFPBFtpddhSluuyxo3ZVFy2eECMyl56sjmZMt7GlublGdhdIhBp6KQb5KU43h0Jrqh6oqi4eI55gmw+RVHsBl5F0gbIGj3KkkCt5fOCvoOTEhHK4dcqQYe3706bWdL5VK2r7a/voIB7WEHqKGv1MYVmDwhnmFddYioB/ryDbQs0KZxAW8flthx
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AOL7KYMduhxHOlUdgpsQE13wQL0cVsISYhWAf0expwyxNkAndF2UNAmSSIgMY5+pALanF8FJZApX0Tl92wBSP5jpUy5ybbqCMnTDnZIui+PROnmvVHh3NUshOVlOSjJCCKGv1aEF02162diMzMuSwsCmwdhDDKWJh11iYqiep/Q1m3aJ4sbKvX7cA8OilXIEFe0J8zwAUWdNQMgcMnDaRceW8NWqBuSlejTJ50mrcyGftfGXl6H0iHPdEhTvoD5NkOo6qtenJJtfS5O4+rYIhdwIQ6Td0j9x+wsXupcH7vWudY0Send9LFTca+NTocScpwhAO5WPp6MGw0yOZeTReFou+/SQanUmcyPO66RY4PnYD12FYxSZKsvcvO67/BfAZDWhPwAxULMVFa1A2Nns90FyLvDyIlp/Rk1FvkGpg78N0EM/yQslgkL2DxUbPW6Ht3h42LBh4lTvP7yx7z+d1F27f+DSjbyn1t1nwiL+IUeuF9Rv5T0tiT8NaAX597jRaxmjFuSFdC8XCPN1tZFFNWgzbaTBJtTUSd3Sx1xHALzX/P/U8ctfz1Xw2/HTGLnrYlvBSjpiuOtO470FN8pimFwfTEzVHSPTSrJCS9vJ6qPKBYzPGH6cJRxXmDDddyAiok52MEI3DBq2xAK2cxIJbg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 02:50:07.9024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d4fe57-cb57-46fd-c0ba-08de6aaa993c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR16MB6725
X-Proofpoint-GUID: HNWxEtJkl6nMP74S7BA4n4T3HKI3w2PZ
X-Authority-Analysis: v=2.4 cv=Wuwm8Nfv c=1 sm=1 tr=0 ts=698e9166 cx=c_pps
 a=Ho/Krdd5x/ljPkV1+9yTnA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8
 a=yHvfKUB0eRiEYTVKTk8A:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: HNWxEtJkl6nMP74S7BA4n4T3HKI3w2PZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAxOSBTYWx0ZWRfXyoCexlBTaylw
 7PqM1PJQY9kx20MDqT3Dhkh8piOIfjXT4wEFC8EnzYK1JP/QL9YnRL2Qtg82fXbujz5bOW4u04S
 L+t+/lqAJKheuTFXcvaVNQu9+ovuM5JVHdgN6uWMyZRHWIxn9z8EJbkVnjIOdhD2hI8K8kvo8Jm
 hJoXOqO0P1lAiRNw8ivZiKdP/8ngrmh4Ds5UxStpqBNwyExPV9fziNVtjMYDrGELXXTa0nJKjlr
 ZdqZQIaOh7RShvqc2a/CwotyY4pR7vaLDDcSnbkJhRMpZk/tHQ4bINlS6ysyjesrQaOsn9TiwPx
 +SjRAdjcerFzOzDn/SbkDcAvWQtL/rZLFYB63U+8OFMdk0MSNU2liroYWobj8A5JH0K+k6AduH+
 YgNxa41aBHd39JH9kZ94Jm3xDiaVH1Ukj18F2D+jdXZ3N8Brwo7cZ3mMfQJx0/lfcccUlqRzMvl
 Qh86pteJdUHsPHvwzzQ==
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
X-Rspamd-Queue-Id: A13121327A9
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Introduce common fragment for unit tests to minimize some code
duplication.

Use the new make fragment to generate test harness code for the domain
ID allocator unit test.

Introduce CFLAGS dedicated for find-next-bit.c only to avoid contaminating
global CFLAGS.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- honor LDFLAGS
---
 tools/tests/Rules.mk       | 93 +++++++++++++++++++++++++++++++++++++
 tools/tests/domid/Makefile | 95 ++------------------------------------
 2 files changed, 98 insertions(+), 90 deletions(-)
 create mode 100644 tools/tests/Rules.mk

diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
new file mode 100644
index 000000000000..8c4881e35da1
--- /dev/null
+++ b/tools/tests/Rules.mk
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Common unit test fragment.
+#
+
+include $(XEN_ROOT)/tools/Rules.mk
+
+define list-c-headers
+$(shell sed -n \
+    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
+endef
+
+# Generate mock environment by replicating header file hierarchy;
+# each mock header file will point to a harness header.
+#
+# $1 Hypervisor header.
+# $2 Test harness header.
+define emit-harness-nested-rule
+$(1): $(2)
+	set -e; \
+	mkdir -p $$(@D); \
+	[ -e $$@ ] || ln -s $(2) $$@
+
+endef
+
+# Helper function to emit mock hypervisor code dependencies.
+#
+# $1 Hypervisor filename.
+# $2 Harness filename.
+define emit-harness-deps
+$(eval c-file := $(abspath $(1)))
+$(eval c-name := $(notdir $(c-file)))
+$(eval c-headers := $(call list-c-headers,$(c-file)))
+$(eval c-deps := $(addprefix $(CURDIR)/generated/,$(c-headers)))
+$(foreach x,$(c-headers),$(call emit-harness-nested-rule,\
+                         $(addprefix $(CURDIR)/generated/,$(x)),\
+                         $(2)))
+$(c-name:%.c=%.o): $(c-file) $(c-deps)
+	$(CC) $(CFLAGS) -o $$@ -c $$(firstword $$^)
+
+endef
+
+# Emit dependencies for mock hypervisor code.
+#
+# $1 Hypervisor filename.
+# $2 Hypervisor source path.
+define vpath-with-harness-deps
+vpath $(1) $(2)
+$(call emit-harness-deps,$(addprefix $(2),$(1)),\
+                         $(CURDIR)/harness.h)
+endef
+
+.PHONY: all
+all: $(TESTS)
+
+.PHONY: run
+run: $(TESTS)
+ifeq ($(CC),$(HOSTCC))
+	set -e; $(foreach t,$(TESTS),./$(t);)
+else
+	$(warning HOSTCC != CC, will not run test)
+endif
+
+.PHONY: clean
+clean:
+	$(RM) -r generated
+	$(RM) -- *.o $(TESTS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
+	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
+
+.PHONY: uninstall
+uninstall:
+	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
+
+CFLAGS += -D__XEN_TOOLS__
+
+# Honor mock hypervisor headers over tools/include/xen
+CFLAGS += -I$(CURDIR)/generated/
+CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += $(APPEND_CFLAGS)
+
+LDFLAGS += $(APPEND_LDFLAGS)
+
+ifeq ($(filter clean distclean,$(MAKECMDGOALS)),)
+-include $(DEPS_INCLUDE)
+endif
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index 74cadab25b2e..b6ba0c4e14ee 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -4,101 +4,20 @@
 #
 # Copyright 2025 Ford Motor Company
 
-XEN_ROOT=$(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
-
 TESTS := test-domid
 
-define list-c-headers
-$(shell sed -n \
-    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
-endef
-
-# Generate mock environment by replicating header file hierarchy;
-# each mock header file will point to a harness header.
-#
-# $1 Hypervisor header.
-# $2 Test harness header.
-define emit-harness-nested-rule
-$(1): $(2)
-	set -e; \
-	mkdir -p $$(@D); \
-	[ -e $$@ ] || ln -s $(2) $$@
-
-endef
-
-# Helper function to emit mock hypervisor code dependencies.
-#
-# $1 Hypervisor filename.
-# $2 Harness filename.
-define emit-harness-deps
-$(eval c-file := $(abspath $(1)))
-$(eval c-name := $(notdir $(c-file)))
-$(eval c-headers := $(call list-c-headers,$(c-file)))
-$(eval c-deps := $(addprefix $(CURDIR)/generated/,$(c-headers)))
-$(foreach x,$(c-headers),$(call emit-harness-nested-rule,\
-                         $(addprefix $(CURDIR)/generated/,$(x)),\
-                         $(2)))
-$(c-name:%.c=%.o): $(c-file) $(c-deps)
-	$(CC) $(CFLAGS) -o $$@ -c $$(firstword $$^)
-
-endef
-
-# Emit dependencies for mock hypervisor code.
-#
-# $1 Hypervisor filename.
-# $2 Hypervisor source path.
-define vpath-with-harness-deps
-vpath $(1) $(2)
-$(call emit-harness-deps,$(addprefix $(2),$(1)),\
-                         $(CURDIR)/harness.h)
-endef
-
-.PHONY: all
-all: $(TESTS)
-
-.PHONY: run
-run: $(TESTS)
-ifeq ($(CC),$(HOSTCC))
-	set -e; $(foreach t,$(TESTS),./$(t);)
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
-
-.PHONY: clean
-clean:
-	$(RM) -r generated
-	$(RM) -- *.o $(TESTS) $(DEPS_RM)
-
-.PHONY: distclean
-distclean: clean
-	$(RM) -- *~
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
-
-.PHONY: uninstall
-uninstall:
-	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/tests/Rules.mk
 
 # find-next-bit.c
-CFLAGS += '-DEXPORT_SYMBOL(x)=' \
+CFLAGS-find-next-bit.c += '-DEXPORT_SYMBOL(x)=' \
           -Dfind_first_bit \
           -Dfind_first_zero_bit \
           -Dfind_next_bit \
           -Dfind_next_bit_le \
           -Dfind_next_zero_bit_le
 
-CFLAGS += -D__XEN_TOOLS__
-
-# Honor mock hypervisor headers over tools/include/xen
-CFLAGS += -I$(CURDIR)/generated/
-CFLAGS += $(CFLAGS_xeninclude)
-CFLAGS += $(APPEND_CFLAGS)
-
-LDFLAGS += $(APPEND_LDFLAGS)
+find-next-bit.o: CFLAGS += $(CFLAGS-find-next-bit.c)
 
 vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
 
@@ -108,8 +27,4 @@ vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
 $(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
 
 test-domid: domid.o find-next-bit.o test-domid.o
-	$(CC) $^ -o $@ $(LDFLAGS)
-
-ifeq ($(filter clean distclean,$(MAKECMDGOALS)),)
--include $(DEPS_INCLUDE)
-endif
+	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
-- 
2.52.0


