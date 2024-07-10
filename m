Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9E92CEEF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756757.1165487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUS1-0002Ol-Sm; Wed, 10 Jul 2024 10:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756757.1165487; Wed, 10 Jul 2024 10:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUS1-0002MC-P5; Wed, 10 Jul 2024 10:21:29 +0000
Received: by outflank-mailman (input) for mailman id 756757;
 Wed, 10 Jul 2024 10:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O6Uk=OK=epam.com=prvs=39211ffd58=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sRURz-0002M4-TT
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:21:27 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29b97bca-3ea6-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 12:21:26 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A8JbJ9017344;
 Wed, 10 Jul 2024 10:21:22 GMT
Received: from eur02-am0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2233.outbound.protection.outlook.com [104.47.11.233])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 4092yscypf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2024 10:21:22 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 10:21:18 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 10:21:18 +0000
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
X-Inumbo-ID: 29b97bca-3ea6-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGgskRLoDqfPrDfZ/wjo9fJTNnyWqYwUATFqjjN5XCh+Sw3VHyvYXRgmAw79oisbopuqWIH6XV7Rvyh3c77gTi/qMSh7y0m43rwMQC2whhqgegoM9cEHni2Cku1HWxr1XM4jhCkuTDUPMX4B0KMT3jc5ABU953huE9zk65PNGLXYgt+7aI689h40UFIm/NoGxXsKgZTzbZ3vMGhVrcWvSH++cT+X1YEjgTnl9PMZ7f+WEJ/TxnnzVg2K6FRqgAjxL8GIn+eGb9+xNIzhsAKS6aMyPbx9DxB76EkwU95UKs82IT/G11oBPcHtR1ibRAc3zxU+IeUhBVpt0aIVy3/9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWaIlKug7fTA+tijgNdX9gRmchErnYHIisUgkULEaTw=;
 b=c9BXJbFHez6ewAAQw928c4v9teD4ihhPngyiGj3D/XaPvTsBhiy4dkVud//cyRcxB32tl8uwngwBhxjvw7jQykjyfPGhvnH21mQWUJf8+7CDlJIDmjas8BSiW//td2K5dCmW0N4+5VF/14/VAtK9rh2U3MYju/5dMFD/2+WGTbDipDKF9oNHyuyyBllyFONjD0pejHr2kWn8pEdkkvQAZAQJ/bf4H4fucmnGJPm2wvNT1N37ov4UJGeY6c6K5Xk6gVYqtPHiSevylFSANnZqGc5X/uIZ06nob2TqJcihRTl5rmXdhzdWAhGQ3MwURmymA02mFClU+1l1fbsduxz8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWaIlKug7fTA+tijgNdX9gRmchErnYHIisUgkULEaTw=;
 b=W9WbemhILKqR80DPFzwaSNU1rxo8SJXcVGsCPwAk7tS4sJVNZMRU2H/0sHyqMM8pODJ9Jkpk1kzB4/O/cq/isrhQ6ZA3Dc1kSE7Zyw1mSaN99zbIZmst4dxmrWm72kYpKjWqtoJri9QhRlw1XtgnZT1dUPXbdM6vIVjKjmlzeRkPUee2ECl1o5yMjfO1bUQA2nA3jZ0t6aoZDANeA7KwgiGhdvo6TWwxiuB6w/j/NnRs7jyeJxfS7Mu4KkiSDYyYKeOlnsc+yBevb/PtwwFLm8JnDYqliTdEOzhHVForTHjpZsxiIvPIh6827W9YhyvYyVdBtC6Sqt8O1w+anUxstw==
Message-ID: <7051c9cd-4db5-4f99-91f2-eebe480ec4b4@epam.com>
Date: Wed, 10 Jul 2024 13:21:16 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 01/14] x86: introduce AMD-V and Intel VT-x Kconfig
 options
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <f6bfed3cd9e9fff25cbe0c5e16d8d88541be212f.1720501197.git.Sergiy_Kibrik@epam.com>
 <1d3476db-019f-4e5e-ad5f-381fe1e5b1c6@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <1d3476db-019f-4e5e-ad5f-381fe1e5b1c6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU0PR03MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: d393f529-6b12-48ab-c599-08dca0ca0921
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SUd4Q2RuSDBEa0JtbWRVU1h6anJCeFE0WGdTRnFwcnhKcTVUTVBHejAyRGJy?=
 =?utf-8?B?WGZ1SEYxU2kxM2xJT2VGUXk5bmk4bjd2REpvalF5N1ZCSG1hNWtmRmh1OS9w?=
 =?utf-8?B?VHRxZVZOckR1dFJteURFMW1HM0VtQjNoa0hKSTJJdGMxNmxrb0lpYitxTmpN?=
 =?utf-8?B?SnFWRk03WHNsMHdRVFo4ZzlIaXJVVmZDWFdYZVJJTFdPTDVhVnVtY2VzdStT?=
 =?utf-8?B?VE9CSkQ2VllHdGhVNmFkdVpvZ003SnZycFBLM1ZqU0J6bUdmYjZPM0Mxb2lX?=
 =?utf-8?B?OFEraG9OTCtLYTdFbFVjbjBhNXN0ODhncWVOaXJRRE5VNnZIcVhrT3R4by9X?=
 =?utf-8?B?VndjS3hCd1lvdmNmb05pU2dTN1ZaS3dicFA4b1B0NklDSVBITVR1RmgyUGFI?=
 =?utf-8?B?S3ZrTjJoN1Fqc3p5ZzlYTm8vQ05oY1FsM3o1VHdwZHN4TXFXUFcva3FUSGVD?=
 =?utf-8?B?RjJYMzZrL01xcDBIa1lvd3I0WFVIN3BUQ2dNeElHVmVwK3lra09NMUd0VkxC?=
 =?utf-8?B?ZFM0Wkw1QmM0d1UyaHEyNkhmekJEZkNvaWc3aE91aU84NnpnaG5lcGpjK0pU?=
 =?utf-8?B?TytLb1dwdkdVeHhOWk5NcUZNWkdjVWdUcDNnRndpN1FNT2dRaHlHaTRmUGg4?=
 =?utf-8?B?STRWWXBmalByMmdwZ044VDhJMlo5am5BdDN6RFc3M3ZZaXA3MkMxZkVrZ2R5?=
 =?utf-8?B?Wlc0SzdtbVJ1dFZST1YrUk55dFNsR0VjZkI1MWsvdFpLL1RKYXl3akp4emJT?=
 =?utf-8?B?aGJIWjVEUlJqK0FCMEVQdi8wanNCcXpJL2ZiSkdocThjSVRURjNGWjJBU1VH?=
 =?utf-8?B?eGZtdmF4ZUVPM1dvRVN5cGhCajVpRElncng5b2toRnI4bytVTzBYWVZTRVRM?=
 =?utf-8?B?MkM5SmpVT0tLTk9VWk9Nci91LzhlcVhuVEdiUGFhM2pXVTRVWGFGaEpOeTFq?=
 =?utf-8?B?cnpqT2djYjhtOEdROGc3Z3hoUTk4ZW9uZnh0RXZnb29vRVplek9MbHBpV2VL?=
 =?utf-8?B?aWVGVE1DTFFuczNUaVcxUGc0RlNsOUdRN1hRR2VxMlNjV0ZQNDJDR04rVkgx?=
 =?utf-8?B?S0x3Yk1yUzRMdEJHVDZKUURNYnFwbFpnbjRLeU5hdktyRVgwZUIzQ01HQ0ZY?=
 =?utf-8?B?OE1ncEg0eUoxUHBTRm1aNDJ6T0dwbTBuWWR2Vi85WHM4ZWNha0NLNFEvSG5R?=
 =?utf-8?B?Z0UzVGFXK1ArTGs1V1hxdDB5WFVqbS9WRTk1YkpFZFl4OWFSeXVnRlJONUxI?=
 =?utf-8?B?bXh0ajNoNktxY0NTT3p4a1BnRytQcXJFdVVvd0JkZzNyTVhuYUNCYTBYYVN2?=
 =?utf-8?B?WkFDTHJGaC9jMEMrVVIyMlBSR0l3SG4ybGF2YkNYUTg3K1BoeG9aSm10dUYz?=
 =?utf-8?B?VHJKemFlWXQ3Wi8rSk94RDU4T0t4SU5ack1ubUhrdWpYTVNMNi9WQ0tRcUNV?=
 =?utf-8?B?UDhzcEw4YUR2bXkrZ3NEdlZmcUNKVHA0N3oyKzBrODI0VlFGeG1Nc3RhZ3pi?=
 =?utf-8?B?YTJIVmEydkcxQjFFazBlcWJkT0dVK2VEbkQ2S2FaVWFOZWNEZGhaUjZpazBw?=
 =?utf-8?B?ZTB0QXhjTEE1ckkwdEthUUFZYkUvOXYvWjczRWQxQkdGMUswUE1xOUUzbnlM?=
 =?utf-8?B?VW1GeXEwMUJneGtnMTU2VXFBekJZT29ISGtLSlNlbTFDOEJBeWgxUDdJbnE5?=
 =?utf-8?B?KzM4UFcyeEVkMm42TlZtVFZCZlAvVlo0SEkvNmtvWXFabkNMK0VCak1TOHVJ?=
 =?utf-8?B?d1g5V1hYd0FTMk1qYXRFQVBDMlgyTzYvdWpxQUhDWVFsbXVZOEl5L1V2T1NJ?=
 =?utf-8?B?c0hWcWYvZThpTmhjU2llQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TW9mQk0raFlrbWlnSGd1UWxDQjJ1S1cwbVo4dWhITWlUSjR6ZkVYT25IaU9u?=
 =?utf-8?B?dlRxOWJRRDJReXYxUkNIK1BTQVk4Mm5XT0xpSG53WXp4MDlmM3RDV1l2R011?=
 =?utf-8?B?OEsvVkJGY1A3c2YraXFEMXFaU1Q1M09JdVdWaEsxSFdMVlFidXJEWjlrUlJl?=
 =?utf-8?B?SVFGdGNDM0xUVzRocWEwTitmdTQ3LzRDcit5VWNLWEpYYlhCUXRuSVI0L3dz?=
 =?utf-8?B?OEpNdk9JQjM3TXRLMXRmZ0dqb0o4bTh5MTZiSjd6SHVpMzVmbVEzcFRUc1hD?=
 =?utf-8?B?UER0UXJocGhrK3lBM3krblpNTEg2RTZiWHhxc1JUUUpBYmNXcGNrTEFyamNr?=
 =?utf-8?B?bjJ1VmpIM29ud2dJZnU2eG1PWjNzdmZFSjBkVklaa1VPc3U5cjhGekZSa3Y1?=
 =?utf-8?B?ZEsyclpCVzlXUWNVMDVTd0l1OEVDRkI3M0dESmh1WHZVVzg0dm5UajRySnBk?=
 =?utf-8?B?cmRxOGFUQUNIWXpyWDZianEzczN2SHRUako5M2w2TUVOZmw0ZlViNlRvWitD?=
 =?utf-8?B?YW9Zcm5ESW16K3Bqc0RWMjJ3Y0c2MW5vb0JUczV0Q3djRUZBTmkzTDFsbXkw?=
 =?utf-8?B?bUJnQnhNNkZOdVBhQVM3SUwzOWMzTzl2NHVVMnJMS3J3cE9JSktsblZ6VEZ4?=
 =?utf-8?B?WUR0S0lEcUVHVU9WbkQ4TGk5ejFvcDFGNFE1aGtVZ1BKQkQyRTVBK3JqOVc0?=
 =?utf-8?B?dkNlNDc0NTM1UUxNNjJCVWtyQmhzSi92S2JORk1jb2h4L0xyVHVES3BMcDYv?=
 =?utf-8?B?WUF4THlSajA0VUVGazR4bTluYnVWM3h4akxnRzFwUjlVc281Vjk5bFk1Q0pE?=
 =?utf-8?B?dGg4T1ZyM2c4RXMvQVRZeTJxNGgzTWsxRGdOZGYzYVlMR0dMQWxVUUVENDlu?=
 =?utf-8?B?ejJoc1FmRFp2NTcrUkVIU2JabCt0bXFveDJ6VTExZXA0a1VRNkFNR2NNUFQx?=
 =?utf-8?B?eVduVkJnTzhuUFR4WVNiY0Uwb1BjTzFQVUloNDZWMStVRW85c245blF2MkFv?=
 =?utf-8?B?enJIdkQrK1VJTG4wbEpCc09kK0EwcTNtQTVvRFptTmROdSsyaWFzNERjSURI?=
 =?utf-8?B?blEvelNLRGI5eTFiK3ZqM2FJV2Y5OXhVN3FtckU0TE9qMGt5QUpTcnlzOEww?=
 =?utf-8?B?VmQzV1JIazVtWTM5TWcvRURXT3VDK3V4c1hZMTkxVlRVL0RWczV3TUNMN3VO?=
 =?utf-8?B?WWhyL3JoV2h2YWYwNllQU0pRTndGUzJZUXZ0NHdGd1AxSG1uZkNaQWRKWnhn?=
 =?utf-8?B?NFNlQy81RVNKTGhGTy9GY2liWktDY2l3azFHVEViZDEzN3l5TVY1WWIyTGd3?=
 =?utf-8?B?UTVlUk9Ea3FZRmZmaE9XaC9zcDFkREZZcTQ2S3IxUG9vb1FERUl6Smo3bXJm?=
 =?utf-8?B?bzQzRDQwd0lQbjJ6a2hHODdEQWtXbXU2TjM2RWlwakJ3ci9YQkNJMlNZOHJD?=
 =?utf-8?B?VSt2WGtZa0FrR3V3Z0czdThXRGFJeW11ZWk4TlZNNytvaEtZWmRuVmFkQW15?=
 =?utf-8?B?d3YvclI2TlRaYjNack5PYWhsNlk2VnN3M0x2NU93My9aTVhVZ0VFYzVndm0w?=
 =?utf-8?B?YVoxWlY2Q1BndlNTeWZFRlE4NGhaTk0zN2QzZFBwQmdBOGU3dWRvVFN2MEFk?=
 =?utf-8?B?ODc1NnNtbEZrRnVOcUl0aXNKQkhvUjI3VmpoWFBzTzk2MDM5d3BIbmUwQmor?=
 =?utf-8?B?ZnNmU3JCQUVFK1o5MVRvc1B4bU51dHRlNUF2cm5IM1Yzak9ON3R6REJKb0hK?=
 =?utf-8?B?eSs5QkRJblkxY05oMWVJME5MVjNEbmNscnRRY1EwSXowQThqclNra0swc2dF?=
 =?utf-8?B?b3JERW10cGNzUHZ3VXppcHFlMEtwN0NEM0NMbktpVkFnM0pIUDdzckJBYmpF?=
 =?utf-8?B?U2czajJMSlVwamdkVnJ1WWNPWVJhNlZsaEs0cEgwTmpEVTQrcTZkbVM3Y3Nj?=
 =?utf-8?B?TXAydkJPdGZoQi9pWmNNOFBDVlNXQW1RRy85SUxPK1lFaktkSHZ2NnhmTUNE?=
 =?utf-8?B?V0RhYXR2ZVNGWFRpMlVNMVBSVzl5TUlmRi9yMm94eEh3eUZTdy9BbjVpb3Qx?=
 =?utf-8?B?UnRoRlY1MWxHQW1lR0M3a1dQUTg1QnJlQVdTNkdtNkFCSHhCeFV6U3NMejRy?=
 =?utf-8?Q?y0nauUUF0dtZ5U1sPVO3pehtU?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d393f529-6b12-48ab-c599-08dca0ca0921
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 10:21:17.9435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sIGhOKTNtnG+QYXwjSVcpPONujYjuHAhAbc9GZORQAzNJ2Dxyh5+QDn4vaqWK8GRy8Vu0cWRK2kT6SEDcbViQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9566
X-Proofpoint-ORIG-GUID: yOvhDXgzC5H0h26gAicMrqKi_Hr6PaQA
X-Proofpoint-GUID: yOvhDXgzC5H0h26gAicMrqKi_Hr6PaQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_06,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100070

09.07.24 10:11, Jan Beulich:
> On 09.07.2024 07:45, Sergiy Kibrik wrote:
>> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>>
>> Introduce two new Kconfig options, SVM and VMX, to allow code
>> specific to each virtualization technology to be separated and, when not
>> required, stripped.
>> CONFIG_SVM will be used to enable virtual machine extensions on platforms that
>> implement the AMD Virtualization Technology (AMD-V).
>> CONFIG_VMX will be used to enable virtual machine extensions on platforms that
>> implement the Intel Virtualization Technology (Intel VT-x).
>>
>> Both features depend on HVM support.
>>
>> Since, at this point, disabling any of them would cause Xen to not compile,
>> the options are enabled by default if HVM and are not selectable by the user.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> ---
>> changes in v3:
>>   - tag added
> 
> And then removed again in v4? My prior ack stands, but - as before - conditional
> upon us being certain that we want to go with the ambiguous ...
> 
>> changes in v2:
>>   - simplify kconfig expression to def_bool HVM
>>   - keep file list in Makefile in alphabetical order
>> changes in v1:
>>   - change kconfig option name AMD_SVM/INTEL_VMX -> SVM/VMX
> 
> ... result of this change (firmly ambiguous for SVM, latently for VMX).
> 

I've put my thoughts about naming in the series' cover letter, however 
I'm not strongly preferring current naming and if it finds no advocates 
I'll rename it in next series.

   -Sergiy

