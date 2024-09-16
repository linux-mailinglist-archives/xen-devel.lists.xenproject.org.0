Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBB979B3A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799150.1208995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5Mf-0001aW-Vs; Mon, 16 Sep 2024 06:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799150.1208995; Mon, 16 Sep 2024 06:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5Mf-0001Yk-TC; Mon, 16 Sep 2024 06:37:37 +0000
Received: by outflank-mailman (input) for mailman id 799150;
 Mon, 16 Sep 2024 06:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+/Y=QO=epam.com=prvs=598934fd5b=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sq5Me-0001Ye-5Q
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:37:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c72dc3-73f6-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 08:37:35 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FNZ2fZ009139;
 Mon, 16 Sep 2024 06:37:24 GMT
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013009.outbound.protection.outlook.com [40.93.64.9])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 41n4cvb01t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2024 06:37:23 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PA4PR03MB7023.eurprd03.prod.outlook.com (2603:10a6:102:ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 06:37:20 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 06:37:20 +0000
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
X-Inumbo-ID: 27c72dc3-73f6-11ef-a0b6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUQdXI1kmzkS+oR81+ms8gNHoCJ3AlUSzK+2BrO64eyDuQYuis/JF4mpKhtNterXPcMtMISfX3FTmBLSJXkjOb9hpN4YWlPyynygODYUwo0hutYuFRcIVa6l2V9mc0yw6QH9NueHltjBM7QqchsGUVdeAhYwkSmhjWsVGiuZtpga1C2OS3RNWuWPE+1CHOIQZmaVfHp8xGN7eXBW02TBoyheVLVY/EX2EqfmTaoahhtEyiVhK+XariknwGeqNvIRCNHXwXoJnVUtV04DD059QYZY1NWgGGvVLW0KwhyQABCa0b0TjZXzcBESQxb2VF2Wr1bHyzkVoIpTtSxhZjsmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d7cX+3A/htRLNBjNu9E2wctn5b6vTZ7x8LlaZI0ddc=;
 b=CdLJ1pJOc/at6VHm0voAOlRfmgTC221prqoIbpN7RHoNCp4ZVMorKKcw42+q9WhQ+vO+l3Zk4QgxF+CZQ36C4s9h6Xc/VsevF9t6Csa7VVRg5D92aghWuJLPnS3F35BsK0idXSxC2tRhytGvQYJ0VGwWcMCEhZm3yzimyTnpyAhzLCsGyVStx6mY4EGTsxll3LFXyb2vu+EbNpDaez2mQQGdJk+rLk4S8DHVFMGddXBqQZZgSA1PxO2VjNlTf4OvDty/SOlNtRtPNts0rRgf66I8HYizXcY1ryslZYUtGV0dAAC00x3Hzz2w845phJUrPcuIAXe8o+4yBmBN9oApYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1d7cX+3A/htRLNBjNu9E2wctn5b6vTZ7x8LlaZI0ddc=;
 b=S0wWgCub5ahXQt+Uh4XOSZy2gCqvfB1099eAhwyEq70AjRjja1CPoaRR1OeElXRYTZr/aTuzX5kIg2X/QKVi0ou/i+uebALP5Dguj/OmwqYle/v5bzVj7mDarVupXqU/N4Gf6e81Yhh/k7vCummqbnxpqnQcrxg4WqcLoY9+BtNCSS5EVD5ufyctRN+VSDnlTWAbOdb57nfVa+R7xGCtUqCrc9YmU70s2hFqcuHz62OV76lAh7jg6VY2TXTR4fK/AtTluB/wXL1P1LqAgAw2+6H3+hcr88geJHOtsLXOmNgFs9BAhwZrUrcTsrSdVfW+be3l/raFj59er/Buzb6Kxw==
Message-ID: <0f256ef4-2059-4068-a38d-1293efbb35ca@epam.com>
Date: Mon, 16 Sep 2024 09:37:16 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make stdvga support optional
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <20240912085709.858052-1-Sergiy_Kibrik@epam.com>
 <ZuKxEVsbV0MqLrtb@macbook.local>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <ZuKxEVsbV0MqLrtb@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PA4PR03MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf6addb-ba73-46ec-36ad-08dcd61a03b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dS9MQ2JZVHd1UkswY01Cc1dQYmQ2c0ErSkEzUC9uVlFLY2F6OGZwNkMzVHhz?=
 =?utf-8?B?cjRHNFBoc0NxYWsrTU4vTk5JTEU1YlhpRytQTFNWckhWRTdlN3hFd0JjZGJj?=
 =?utf-8?B?TlRnQWsrZ1c1Q2NOOVZwUG1UbEYzRnhzS1d1RXBoWmFmNmpLWWgxVXAvQkt6?=
 =?utf-8?B?QnlGaE9yckdDOXp5N3RrQ3hLTzRod3MzTXdraDBhR2RQZVJhUkw3bitsRmhK?=
 =?utf-8?B?eTBhVEk3Y2hoOGpCMEk1YUViU3pVVWFReXhHSlhUemNrdk9wb2FUd1lvQ2cw?=
 =?utf-8?B?aE1ZSVNCVExnSXlpcXl1YnlhUThNS3hSQ01RNFZDTyticVV5YlRWZjkwNEdV?=
 =?utf-8?B?cld0Y2M0QmtSdUdLUytQYlRBeTk0UmIwR2prbzAzRUlLOEN5eXNjKzRpYk9n?=
 =?utf-8?B?VmdXTG5RQjBVUE9SUE9jV2tyQ1JuOFB6enpiM3k4a1BrY0xCeDByYVBOb3U3?=
 =?utf-8?B?MURFc280cGlBaEtYdVpBYWRxUVdxanUrbkRLQzBWSk4rYWhyVmJuK3lmR0pQ?=
 =?utf-8?B?NzM2ZC9HVk9YZWNrTTRBUlVrOFBCYVVrQ1BmUU0zcXBZN3dXN3l0SGJObld6?=
 =?utf-8?B?ZXIzSGo4czJtZFM5YXFmeUJjTmduNjBnTFZoa1NYWGhIYWtDd2FtN0hqT2ln?=
 =?utf-8?B?SEtyZGR3d1dpWnRDZDBrUCtidDlEcmUwS3o3MlJJRG02bmFKN3ZrMzV1RE1z?=
 =?utf-8?B?TVI0ZTJHaGhTRFd0RGVKKzN5S3Y1ZjJBQXM1ckRhWldTM0RvT3lobEtjRE90?=
 =?utf-8?B?TVdmWktYUGhzYnNLY3dBNmNrMXVZb0M5M01OUXZWeG9hV2lOTmJVT2dodUhz?=
 =?utf-8?B?YzlpS0x2Wmg0ZGJUQXRKa3M2NGppYll5anludHBrMU1FdXRuNWZ3Mk95WjJY?=
 =?utf-8?B?L3ZXc0dvcGIydHVUN0J0Zlg3c1pNTDNVWlBVdE13SUJvb2hEQXRnZ29yVHZP?=
 =?utf-8?B?akNKbXR5a1N5Y0w4UlhJTjlvOUpDU09Ic1hBeVZRdXhXOU1VL29MdDd0RXhr?=
 =?utf-8?B?UGN1YUU0bXNCcC9sRjd2YytadDMwWWhGMDgyZVJxN21sbGpRZUFWaVpoaVRp?=
 =?utf-8?B?WDB3SlhDK2xzRnBBSnhVd0tJZ0ZzRy9xcmJjR0xRY3VwbTFRYUNaRHpKTEpV?=
 =?utf-8?B?UUFBYWYrSmhqbG51OU9TNy8waEtSZ3ZWVTR6VHZZUGRCL2ltQ29ETEVmM3Jw?=
 =?utf-8?B?RC8yeU9LVjIvcjVmM0t6aTZLOFg1OEhGaHR3VzN0UGpBakRDWEUrZ3o5MzJ2?=
 =?utf-8?B?RDdhYlk3UDVkZjVRWEJtMUJkN3ZDZVlkeWk4Q2U0NjNIU3FVV1BiTWp6Sy8v?=
 =?utf-8?B?K0Yvbm9zeHdKK1YxQ2FMclBQZE9heTlxRUJGZkk4Q2RXWjdNVmh0SFBiTWg2?=
 =?utf-8?B?dzZ0TVBNMUJRZkVTNVEzeWdldTJXRFpsYzRKSGxuL1BUVVk0Z0d0VW5EV2dS?=
 =?utf-8?B?WElsaDhhUjRFMERhYmhjaDBYTmRjVHVKN3loaVRCTUN0VUFDTUFscFllNUdV?=
 =?utf-8?B?SnRqYVppYzR3RGhVLzUvVVZuTTlxSktacVkyQVUvaDdwVUJST1hqeFJSam50?=
 =?utf-8?B?TWd6Rlh2Rk05V0RjSGFxdkVVd29xdTh0MzJSa3JNbG9CWUJEc2R3aDZaK1hM?=
 =?utf-8?B?VmpGUzN4TldpM3FxdUpJRGprLzJIbWhWMFp3a0VEbVE5ODBwcy9qSHJZMGJk?=
 =?utf-8?B?VFZLbENlQ0MrRXJPVDM2TEhwblZGRGlIaFU0Mlg0UDBuSDV2SVJobnNOYWRw?=
 =?utf-8?B?T2I4S1ZEU2VvcU1lQ21LRUVnZXhpSGdVS2FNMVlHdVN6RlRmaHowTUxPZnNk?=
 =?utf-8?B?dzhkNHA3YkxacUdKbjFWUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjI0THVoMisrb1cvbVVLOHRWRFFZbXFHS212UHh2SzJnNy9IeUl5VVNkbUFK?=
 =?utf-8?B?akRQa0xKT3FWT3VLU0Z2eUpmazdrUXc0djN5UkFyTk5Ybm5YVHpEQXl5NzZn?=
 =?utf-8?B?Q1pRL204NS9TNGxoZ25MUGcrZHhsbVh4aG50QkdHamJhRGQ3M1lOY1hzclcv?=
 =?utf-8?B?cllPM282U2ptaGs5NHFMVklxYnBZTVdncTZaL3VrQzd0NGRaeWo4d0RjaDdU?=
 =?utf-8?B?OW82QkFkMXlnYzhEVW1Fdlg3M1NGV2xLQmdLY1FzdzdRYURWZGxieW1xWmhE?=
 =?utf-8?B?a2hnczM3d3VrcnRTYnBBV0pIMnNCWDFaSTF3YlBaYk9zSkJBRjR6NVU1bnEy?=
 =?utf-8?B?WHRIMHVWd1pvV0RONUZVZlhFb3I3MzQ0NDBGYTV5RUxRbUFCb1hiTmJIOWRP?=
 =?utf-8?B?Y2xUWlFxQ3dZTXM0cXo4QVhGTlE5SW1NOGRLVHNkVUhGMW5iNDdaREpwcFFE?=
 =?utf-8?B?dWJsandiTENwTkIwRmtKWHhhd29aaWR5NGl4ekZ2Zi9yZm9lcHpqU0xybmp2?=
 =?utf-8?B?Z09LaEI3cEV0ZlpQRkxqY2Q3ayt3TVVDZDRPMVc3VFNXSWZVMEZ4OEFiTGJ2?=
 =?utf-8?B?clRTZGgwa2NibzNSMFF5YmhENzJvZDYwb3ROYUJTVW53Q3B5bGFYZEFmelh1?=
 =?utf-8?B?RlpyOTlCZnZjS2Y5T0xQOE9NU3lhd2R1YUl4SmNrb3QxSmRTMDFhYi9KT3VF?=
 =?utf-8?B?ai81VEJWSHRMOWdmZzVpcjNybTFpd1Q5OEVHMjdXMVU5UC9KbFZxaXBJcTZh?=
 =?utf-8?B?KzYwVk9mWlpuN24zOW8wbXlMWmlwd0dNcEcyUnpNbnpEVVdFTjZpT2VPM0Nh?=
 =?utf-8?B?dldadTdFVFJITHBYNllaYWJFWFNtVWthNENlUUI2UlFicHoxcDFHM1VScGJt?=
 =?utf-8?B?d2YrajVvSi93ZkFycmw5eG43ZFFwOFZjVCtSWW9mbmU5TGNNNFFDZmpXaXNo?=
 =?utf-8?B?dEtNdld4bnZLNU1jalVqZ29UTkZ5TWRSWGpjbktHZFpaT1NCUWtvdEdVeVVX?=
 =?utf-8?B?M29UbUdvc3dDQUFhRXFZVGpZY0pmdDBSMkx6b1FTVGtFcmRjNE1hdjZocjFD?=
 =?utf-8?B?UzFIU0xUMkpPNndidTZHdGVKcUNEenlZb21zMjBiR3hTdzVscm12UWFUdzEz?=
 =?utf-8?B?enYxb2FmRlZ1TTVVSC9uY0R4SGUwWDZrNCt1MitmMEZ1NlY1SGRiVGllY3B0?=
 =?utf-8?B?ZE95aFNLVHlnbDJNSmlFbFBncjFpRlpySUV2R1p3emdUendqUDVNZGsyQ21j?=
 =?utf-8?B?UjRDUXdnRzcxcnl0dElLTXNhekttRWVxZmhBd3JMSXlLenNWS2Q0UzYwbGdp?=
 =?utf-8?B?OThmN1VkNVVnOW1mbUhVT0NHeWluTVBrdHpSSmo3ZzBEMmVmcGVGL01rZVRG?=
 =?utf-8?B?MzVraEEwTWhrQkdDc2xpMnRXa0l5NGF4VEd3a3U5eWVFellTeTdnRkUvbkYw?=
 =?utf-8?B?Z3o1UnNQTllRd0xHSUt5eFFDeDVpakRLUjNWam5VdkVtRHROVHlxd2NmM1g4?=
 =?utf-8?B?T1RhckNzellpNDRGNjIyNkthdnI3b0dTVTBrRit1UG1kR0xlSmtEeUZ2dzB0?=
 =?utf-8?B?c1JvY0IrSklHRERyVzljNFloRmZTbkp4ZWt0VDAvQTRLM1dpYW9UNE53d1I5?=
 =?utf-8?B?azdCVXNXWngya05Ed2d4aVJicGFuM1ZMVEl4MWs1NDk3NlBzSzdEeEpWRUxW?=
 =?utf-8?B?OEhoenA5MFg0VWFpbWFTWmVzRlZhSWY1dlQzbXNxVWZkbzc0Mlh0cWNTeDJS?=
 =?utf-8?B?cUJ0THY3Y2l3MkU2MzJqUXVleHVOcHlqSFJ6WFp3WW8wWnBOVjR2NFZyL0VF?=
 =?utf-8?B?Nk5CR2t0UHphZURKSlZSZDdoNVpyaHNJNXNMazgwQUZEWUxiWUR5NFVCRVVl?=
 =?utf-8?B?VllERyt4bk9KVTYzMXJPL0FodGpldGlFSk9YQjNEcGx4bTJRaENUbTdVUlNZ?=
 =?utf-8?B?MHpjNWF1MkdabUphRFg4M2xrdW82cVBQQVoycmZ1QklvN2ZUQXFDaFFlZm1r?=
 =?utf-8?B?MUhzSHE4anoxUmZ0S3ZKbEZVN2oxSEhGa2pGNm1vd2RTMW9IeW5lWWhnZW5x?=
 =?utf-8?B?c09kZ2xndmFFWEgzKzA0MlFtK3lyazNtenB5cUkzaU96N2FCYXY3RDNiTUZW?=
 =?utf-8?Q?3AR6SPB/a90qk58X6B2JOQmez?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf6addb-ba73-46ec-36ad-08dcd61a03b2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 06:37:20.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+XcIJMWtfw0Y8oucutYC3RbrmJpw9pFeDcfJpAGmgeMw1JW5+LOCO4K+RYWV/w9xQ3Fh5bOLaFgm2n7J3as+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7023
X-Proofpoint-ORIG-GUID: ovrLFeSLpdThrr1HcTLm_1QlUbM-BOlC
X-Proofpoint-GUID: ovrLFeSLpdThrr1HcTLm_1QlUbM-BOlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=624
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160040

12.09.24 12:14, Roger Pau Monné:
> Shouldn't Xen report an error if a user attempts to create a domain
> with X86_EMU_VGA set in emulation_flags, but stdvga has been built
> time disabled?

I'm afraid this can accidentally render the system unbootable, because 
it looks like toolstack always sets X86_EMU_VGA flag.

   -Sergiy

