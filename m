Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952D9BB4CA
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 13:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829989.1244921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7wNJ-0001k0-Mr; Mon, 04 Nov 2024 12:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829989.1244921; Mon, 04 Nov 2024 12:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7wNJ-0001h1-K6; Mon, 04 Nov 2024 12:40:05 +0000
Received: by outflank-mailman (input) for mailman id 829989;
 Mon, 04 Nov 2024 12:40:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8uZz=R7=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1t7wNH-0001JV-RH
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 12:40:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2613::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e647c729-9aa9-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 13:40:00 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6493.eurprd03.prod.outlook.com (2603:10a6:800:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:39:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 12:39:55 +0000
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
X-Inumbo-ID: e647c729-9aa9-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjFmIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImU2NDdjNzI5LTlhYTktMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzI0MDAwLjUwMDI1LCJzZW5kZXIiOiJncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0yhrEzCFMma2GS7dNkCRbgJUBF1ZmeVr/jpjQmghQUBa3PRWyxyMcucYODvNvjcwJCdmytFx0Yh5GKMkprQmJCcjGXlV0nT+m4mykzD7K62t/Whuj75UXWvdsP0+HGDr6jQLzETb0eXVadmdBAzUJkwtVlqvmXr0JLlTEPGQ64J85VmRGDIQ8tHzpxm/43T39UkqH+mOKiQjYGkj7UDkrna/ATEE6PmHxdRxCKD+4La3i357+oLc1BAvmZGEnCBZT0Gv4bTYE1rAmJDUuSa89OtGFbAeANXxnC36Lc/SuVPiaFetznT1cI8Q6NBGYjH+krcmDE3uFU88HeDTRM0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxe8746JWt5nsrEYby1gKXlng+z5IYsOHFyx8daYN6o=;
 b=nfJQwx4B8gMd9zFSRvN6gMyLuffJT5XRlXAI9z3SM0iswJgTqc+eAHPu6o7Xgb8Ik8ySJHNI2s3/W24eH+nC1oHioBD4BL1F1NWRvdsFw+6w5eMdm27MoD+J2AAi+dEiX2UvY5bQn+Rl6+D+kvXzsFhH+Hq+kB5WZ2acyPjoqxhXQ23rcaFM0Z3gIRjA5+eDHfxZPyIOkx7sdMnAwU7ZSb7gJsfs0MYp3RwWGO+q0EbAs0tGTt8KZEWElv6yRADTCnQznqLc2sPOrPljwr/luQkGMxDGC7BnzXx2V/AgZR5i4PJuuzgb7GXb7lPeTFCTNv+s7GRDnJDlqj8kQK1MfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxe8746JWt5nsrEYby1gKXlng+z5IYsOHFyx8daYN6o=;
 b=f3vsgteZogfOe3LUUxiIJB0sQaRwKHjDcxhOC7L1FI1lBNIJTHO+gvK5lxLNI5c4t02lc234QH7dmBsU+j7dAh8uBjxyYl7hl5KkOzohXOa1R+ruIn6HTR3VmT3lbknKzNGh4IOaMbN1iWWnEM6SYca9OLjg3E+5PJdOZztINhxuwA5EyVWAFZG+yf/9Ty+ErkTJdY8DV8egXoFNjLt1Vi2IKnmSeJhozQSHrdDai6brzF1K3gQUZcyXc61Giths0ZqvJP9aiazSE4cJ7hzD3N56EVvx6Oh4nNfeJDJkYjD9Igppa9805paAHJuv+veduDjjrdmkrubPTFY8TXTFnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a127edbb-8006-466d-a529-1b7a80af21b1@epam.com>
Date: Mon, 4 Nov 2024 14:39:52 +0200
User-Agent: Mozilla Thunderbird
From: Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v5 1/3] xen/device-tree: Let DT reserve map entries
 overlap reserved-memory
To: Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
 <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
 <1ae100b3-17f0-4ac5-beb3-fdd2f12adee7@amd.com>
Content-Language: en-US
In-Reply-To: <1ae100b3-17f0-4ac5-beb3-fdd2f12adee7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|VI1PR03MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 90652aa0-559c-46d3-e1b0-08dcfccdc8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bG92dUQ2UkFBUXV3MVVTM3RSaVYvSUJLUWowZXJLNzU4cGF1MnU2L2JuQzVU?=
 =?utf-8?B?U2dRRzJsb1BoZ2t0Z0tuaW42VXBJY1hHMWRPUC9iUDNvQnM4SWRYZk5TMk1N?=
 =?utf-8?B?TVlkUmRKa0Fhd091RlVEdFVwUkVNWm5Na25FRW4vVGI1UGhqaWVxMjFoTVpv?=
 =?utf-8?B?cktLSVpOWnVCdnNWOTA1cXRORzcwRlZndGF0T1Q3U0h0czV4alhSQUVZMVZr?=
 =?utf-8?B?U2E3V3RrSENOb1hWZi83RzFOc1A3MzNTbUI4SGJGaDN6OWJhYmRoL0RiV00v?=
 =?utf-8?B?ZlZGUkl5Y1pjTEh6RnZtcWttMVpNWXdvYXY3ejFSMjBjM3hsbUozcEg2Z2hL?=
 =?utf-8?B?ZFFwNGZSNm5FSDI5Yk5UeWs1VXpGa2dDbTU5cC9MaTA2QmhBODNkd2hPWW9M?=
 =?utf-8?B?YlNOSFY5RkF1RTkxekV5QzIrMXpESU9RRUVjZSthUm5GVFFiWUJFK0FnNTJH?=
 =?utf-8?B?bS9XZ0N2Y3dsQmdza2o3ZTJDRDZpb0srZFVCaFBCMFVnVlZBVjArMW9pcDF5?=
 =?utf-8?B?eS93QnRvUnN2anA4eWZiNFlEbmVibzJqbEdoYllqUDh3Sldyc0tXZlF6UThh?=
 =?utf-8?B?UkZDNmVHS3ZqVmtDeVlCekNVbEsxa29USWFjd25PQituSTFBdVFrSDdMKzdE?=
 =?utf-8?B?OUVXZEZQWmRWQnBpU05CdlVtYzlISGNzSHBuM0YzVXRCMFdzWk0xbkVvSGJH?=
 =?utf-8?B?cjVjM2VaLy9ackVsTkJuNzRBYU5vTGpJRU1zd0k5MWI5VHBRdStxeTd1U2l0?=
 =?utf-8?B?YWpsTmppZ05OTXE1VGFmTVJNK3ZOTXFlTm1jb3BWc2VDSWFyTmhud0tFVGE0?=
 =?utf-8?B?TU1ManZlUzlrTnpEekpNZUtSSFFVc1Bya0NRdzRJWnJuWDhjcDBIY0V6akNi?=
 =?utf-8?B?dVgxVDdabGdkOXN6dEM0RHlkK3gwNGUxcllXUTZqWXA1UTBHOUZLaHJIaTJI?=
 =?utf-8?B?QXNaLy9sdDBPcjQ0MTcrY2F4dm9QZUwxMTV3K0wwQWZ4RFBaWXVTUWdNeTVS?=
 =?utf-8?B?RFlNeW5VZWZxbCtaUjBZSHI3Q1JhYUo4c1FSMmtONis5ajYrVnVqYW9uRFdR?=
 =?utf-8?B?TU5kSXpIUW1pME4zMzRpWWVqVzhTQ3puTmhRaTJCZC9XdVlub2RLcHA0SmxL?=
 =?utf-8?B?OWZud2xFOVd6eExmYVBUemJkaDJlSldvWDlmZGVmSGRCUE13Y3JzNVlCSkdI?=
 =?utf-8?B?NzFIdXdjbEhnSk5pb2t1bmxJQUJCYUxDNERTeEpxQ3VXcDErMkR5dWduMytk?=
 =?utf-8?B?ZCtaaE00amxJZHR5SVBiRFVOTVBsMzNsZk9scDg2NHpodGFrTXhMRklSWjhG?=
 =?utf-8?B?ZU9oY3NIWXZ0Nk9ZejMrZk0xV2grb2RGellmVFYzYlhvN01qaVo5ZTRGcFBj?=
 =?utf-8?B?T0wxUmMrY1dvVkRpRmErMUJDaWpWREMyaGpzVFRJNDdLTDVNOHBCRTJzcXRs?=
 =?utf-8?B?WGhDOG5VS0ZOTldMNzA3VC85R3BUM21rb1FmTXdMWitsWWkxd00rN0diNHdS?=
 =?utf-8?B?OUs1SFV2YUJtQ3J1SmZOQmlEOGg0WE55U3dmYkZEU015Z1FRMW1EZG1NTWky?=
 =?utf-8?B?cERlNUtDSER4aC9qc1JvOHVmZXlFQWFWRXkxUGp1Y3JJcGwxcHNEK0V4cW9G?=
 =?utf-8?B?TTFRYWlJdEZmMHNZdEpMWlJza3NpZjRwWkd2L3Q5YmY0SGg4Qk1kZitlb0ZY?=
 =?utf-8?B?bklkY251elV1b3BIYkRubDdDNU1RdnplR1d4d1ZLclNsWVdqUDdkck1hVnVn?=
 =?utf-8?Q?AZvCgJs8LSX29HtM7NR4KOAovmllWgnhZs1e1cb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0UzR29vSDlDSzUzSzhYRHNLVTg2TEU5TFBQMzVNSlNsVGpvaTc2dEJrUmFj?=
 =?utf-8?B?dE1wbFVnbHZvS0hSTjBOWkVhY2s3WHdUdjhzRDdyYWkxMjhwWXdLOFVpNnc3?=
 =?utf-8?B?dTBraUdyQng2SG1yYjhiYk5tWkhLTWhHK3ZyR21PUmswUHk3VldpUGNvMWVZ?=
 =?utf-8?B?SGNqakJuTnZQUFRMNXA2R2lZRk80U1VMZGYwYy94c3RnVmpjdncwM0ZXdVda?=
 =?utf-8?B?NWdWVlF1ME1DcU04TXRPWXMzYTYxcm95eStuV1dtaXRsRFJic2FvRTZzUWVX?=
 =?utf-8?B?OXlKQno4WFA0SWllQ04ya25xQ2ZLMk9PQW56SThBS3Q1M250Tm5kb0tndzlT?=
 =?utf-8?B?MXFPSGs3R3N6cUN3M2NjN1diQzNVcjJIWHhMbjYxbndVMjVrSXhqbTVCa2JJ?=
 =?utf-8?B?a2hJbFdycjJSdnU1VmVSYzRNZVVRWi9FMXE0eDVnQXg2eE1jTVlIcWZLdWIv?=
 =?utf-8?B?Sm5yK1paWEFFZmdtMjRCS29hSC9DL3NNQ3Vpb0JVbWd2alE2L1dMMzZpSHo4?=
 =?utf-8?B?VnV3ZXlMeHA0NUhocWttK25ad2RIN1k5eERmaEh4WmxCVmRTb0ZoTGRueUhv?=
 =?utf-8?B?YU5RZUFGSlh0c1lpaXBmYlNyTWNrcUZsOW9ucEUwOXF0Yy9jenl3d0hjSTBm?=
 =?utf-8?B?d0QxU0FsNU5QSW5XVTNsYnVKYktRVjlSQUR0MDBwVUE5Rm5GZlJnWVljaFlL?=
 =?utf-8?B?WGFwa0g2eDlWNmZ4ak5pU2hlQkxsVGhxazgrL2EyeHFFRGxkaU1EQVM5em90?=
 =?utf-8?B?WStzVG41aVFZUXBzTFkxb3BELzg3VW52bkVGcjRFV0xuZDcvUkVPZVdrbG5x?=
 =?utf-8?B?UHNMeStHUExHNHJyd0JpQ0hudDZPWXVLYnJ3WElKcDBwL2RBU2tkRTNKdTVR?=
 =?utf-8?B?Qm9OWkpXZXB5azlNM29ZSGtUVzhKVDY4QXZMMkJlNHFFUVdGVmNpWU82cVdr?=
 =?utf-8?B?M3RCOGN3YzBYVW5vZzhtREdTRUJoa1dabUpPa0s4Zm52UnB2VDgyOVZYaThr?=
 =?utf-8?B?VGJPSkFvdGJDZE82T21Cd0NNWG1FL1FSaURqRGNNVEYwdUk1OHBEN3Bjekk2?=
 =?utf-8?B?Sm1McjdVMGRvNENDVE8yTEpDUkJwT2pwd1ZlbHBXUXRoaVhKbW5XN2RGK3c4?=
 =?utf-8?B?bzJZQjNrdzE0TTJVWXpCZ3Y5L0Jka0lYTEJDUW1VcTRTUHpaUEFWZU1aQ3hB?=
 =?utf-8?B?d0E4cmMxRmtKY3hYTDNqOHhlRUdzNlBVTHNJemZ4OTQzaTBUT2d0K2FQNGFX?=
 =?utf-8?B?bTN1UVFzL3pIT0JUZXYwMlRjeE16TzNzRHhSTW9vaEU5SE1WZmcrd3pURTJl?=
 =?utf-8?B?WHZKbW9SR0ZwVkFQdThPWW52R0hJblBnRHpGUE44ZUF5T1dVNkNzMnR5L3ZB?=
 =?utf-8?B?N0hEN3hRR0lZL21qZDFXL25FZm1BSWFUM1VReW03QmZjTHpveWxNUzY1YkVu?=
 =?utf-8?B?Tk1pRXlxL1dUSUNWWmU2WWRsc1E1ODBKd21xMjdSQlNxNkg5ZnRvc2E2bXpB?=
 =?utf-8?B?NyswSE0zbGdnY3hCWXFUSDAyWjdDaW5taTFFOXJDbnVVaXZvVjJCaENMWVhY?=
 =?utf-8?B?UzBGZlVseUx3c0dyYVFIUk14QVpUcktsVlZ4QnpuRndSa2tHblJSNWRGZUlL?=
 =?utf-8?B?VWlkUlVQKzh6Z1hzNFVBMnJDL1lWdWdISC83RkRaWjd6aThsL3B6bVd3NHBS?=
 =?utf-8?B?VmlKbEZSN00rYWhmbGVPdk5MR1Rrbk9yZzRxREtEejg2RVJudkcyVmVPQ1VI?=
 =?utf-8?B?OFRkVms2OFNkcWlZeTZGWjNYeUsrYk5tRVQxWmd2eE5wZlVaeUhCSU5LbGdN?=
 =?utf-8?B?Z055Mk9TbmxIVENMallEM1Zqek02dzQ2NEtqcjVBSTdndFd6dWF4T3dTZER2?=
 =?utf-8?B?WTd1U1F0T2QybUIvSDJyM0J5bXYzT1hERG4wUHZrRmluc2ZCc21wR0pzeEY1?=
 =?utf-8?B?NjA4V09JQWZ1dityY3FRRmthVXhVUkFmSFR6MlI4cG9KMzZMdGVTdHE4Mldj?=
 =?utf-8?B?UldDOTQzR3FubDE3TTJxeHUrYUMzaUJXQTRJQ3lWRU16RXVkVmp5SFY0ZS9M?=
 =?utf-8?B?Ti8wQUFaTFkyMWk4UEdwSHVieU1oYlZMRW1mNzhIVGlaV2xjUUZDbVUwTXpD?=
 =?utf-8?B?OHVlc2ZpY3czL01xdEFNNHhFUHJscmNIMTFOM3FLR1FmeGRVaEhVVnpKWDUv?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90652aa0-559c-46d3-e1b0-08dcfccdc8dd
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 12:39:55.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46rsIMXDlIsVf5tEKF03AKuzW15kB/u5nSdTyIH2JFYVsDaEcFWJ8/7uOCpJ2ZKCvdlsc8eyxZy28/umpfrrlKhhZ5A4X9UgN8ttn8f1zh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6493

Hi All,

On 04.11.24 12:49, Michal Orzel wrote:
> 
> 
> On 27/09/2024 00:24, Shawn Anastasio wrote:
>>
>>
>> Commit 53dc37829c31 ("xen/arm: Add DT reserve map regions to
>> bootinfo.reserved_mem") changes the way reserve map regions are tracked,
>> and as a result broke bootfdt's ability to handle device trees in which
>> the reserve map and the `reserved-memory` node contain the same entries
>> as each other, as is the case on PPC when booted by skiboot.
>>
>> Fix this behavior by moving the reserve map check to after the DT has
>> been parsed and by explicitly allowing overlap with entries created by
>> `reserved-memory` nodes.
>>
>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>   xen/common/device-tree/bootfdt.c  | 28 +++++++++++++++++++++++-----
>>   xen/common/device-tree/bootinfo.c | 11 +++++++++--
>>   xen/include/xen/bootfdt.h         |  3 ++-
>>   3 files changed, 34 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>> index 911a630e7d..2a51ee44a3 100644
>> --- a/xen/common/device-tree/bootfdt.c
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -177,7 +177,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>>       {
>>           device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
>>           if ( mem == bootinfo_get_reserved_mem() &&
>> -             check_reserved_regions_overlap(start, size) )
>> +             check_reserved_regions_overlap(start, size, NULL) )
>>               return -EINVAL;
>>           /* Some DT may describe empty bank, ignore them */
>>           if ( !size )
>> @@ -590,14 +590,36 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>       if ( nr_rsvd < 0 )
>>           panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
>>
>> +    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
> This should be moved before fdt_num_mem_rsv so that the program flow makes sense. In your case nr_rsvd is
> not used immediately after.
> 
>> +    if ( ret )
>> +        panic("Early FDT parsing failed (%d)\n", ret);
>> +
>>       for ( i = 0; i < nr_rsvd; i++ )
>>       {
>> +        const struct membanks *overlap = NULL;
>>           struct membank *bank;
>>           paddr_t s, sz;
>>
>>           if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
>>               continue;
>>
>> +        if ( check_reserved_regions_overlap(s, sz, &overlap) )
>> +        {
>> +            if ( overlap == bootinfo_get_reserved_mem() )
>> +            {
>> +                /*
>> +                 * Some valid device trees, such as those generated by OpenPOWER
>> +                 * skiboot firmware, expose all reserved memory regions in the
>> +                 * FDT memory reservation block (here) AND in the
>> +                 * reserved-memory node which has already been parsed. Thus, any
>> +                 * overlaps in the mem_reserved banks should be ignored.
>> +                 */
>> +                 continue;
> I think this is incorrect. Imagine this scenario:
> /memreserve/ 0x40000000 0x40000000;
> and /reserved-memory/foo with:
> reg = <0x0 0x7FFFF000 0x0 0x1000>;
> 
> You would ignore the entire region described with /memreserve/ even though it overlaps just the last page.
> 
> The problem you're describing is about regions that match 1:1 in /memreserve/ and /reserved-memory/.
> Therefore I think you should check that the overlapped regions match exactly.
> 

I've also discovered an issue with Commit 53dc37829c31 ("xen/arm: Add DT reserve map
regions to bootinfo.reserved_mem") - the bootloader adds Initrd in
FDT reserved map which then conflicts with Initrd module (ARM64).

This patch, as is, doesn't fix an issue for me:

(XEN) Checking for initrd in /chosen
(XEN) Initrd 0000000084000040-0000000086152ac6
(XEN) Region: [0x00000084000040, 0x00000086152ac6) overlapping with mod[2]: [0x00000084000040, 0x00000086152ac6)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FDT reserve map overlapped with membanks/modules
(XEN) ****************************************

So I did fast try of Michal Orzel suggestion and it seems working for me.
And if it's working for PPC - may be that's it (feel free to incorporate). Diff below.

(XEN) Checking for initrd in /chosen
(XEN) Initrd 0000000084000040-0000000086152ac6
(XEN) RAM: 0000000048000000 - 00000000bfffffff
(XEN) RAM: 0000000480000000 - 00000004ffffffff
(XEN) RAM: 0000000600000000 - 00000006ffffffff
(XEN)
(XEN) MODULE[0]: 0000000048080000 - 00000000481ec000 Xen
(XEN) MODULE[1]: 0000000048000000 - 000000004801e080 Device Tree
(XEN) MODULE[2]: 0000000084000040 - 0000000086152ac6 Ramdisk
(XEN) MODULE[3]: 0000000048300000 - 000000004a300000 Kernel
(XEN) MODULE[4]: 0000000048070000 - 0000000048080000 XSM
(XEN)  RESVD[0]: 0000000060000000 - 000000007fffffff
(XEN)  RESVD[1]: 00000000b0000000 - 00000000bfffffff
(XEN)  RESVD[2]: 00000000a0000000 - 00000000afffffff
...
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000048300000
(XEN) Loading ramdisk from boot module @ 0000000084000040
(XEN) Allocating 1:1 mappings totalling 256MB for dom0:
(XEN) BANK[0] 0x00000050000000-0x00000060000000 (256MB)
...


---
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index f2e6a1145b7c..10e997eeca8d 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -124,6 +124,30 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
      return false;
  }
  
+static bool __init meminfo_is_exist(const struct membanks *mem,
+                                         paddr_t region_start,
+                                         paddr_t region_size)
+{
+    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
+    paddr_t region_end = region_start + region_size;
+    unsigned int i, bank_num = mem->nr_banks;
+
+    for ( i = 0; i < bank_num; i++ )
+    {
+        bank_start = mem->bank[i].start;
+        bank_end = bank_start + mem->bank[i].size;
+
+        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
+             region_start >= bank_end )
+            continue;
+
+        if ( region_start == bank_start && region_end  == bank_end)
+            return true;
+    }
+
+    return false;
+}
+
  /*
   * TODO: '*_end' could be 0 if the module/region is at the end of the physical
   * address space. This is for now not handled as it requires more rework.
@@ -154,6 +178,29 @@ static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
      return false;
  }
  
+static bool __init bootmodules_is_exist(struct bootmodules *bootmodules,
+                                             paddr_t region_start,
+                                             paddr_t region_size)
+{
+    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
+    paddr_t region_end = region_start + region_size;
+    unsigned int i, mod_num = bootmodules->nr_mods;
+
+    for ( i = 0; i < mod_num; i++ )
+    {
+        mod_start = bootmodules->module[i].start;
+        mod_end = mod_start + bootmodules->module[i].size;
+
+        if ( region_end <= mod_start || region_start >= mod_end )
+            continue;
+
+        if (region_start == mod_start && region_end == mod_end)
+            return true;
+    }
+
+    return false;
+}
+
  void __init fw_unreserved_regions(paddr_t s, paddr_t e,
                                    void (*cb)(paddr_t ps, paddr_t pe),
                                    unsigned int first)
@@ -201,6 +248,37 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
      return false;
  }
  
+bool __init check_reserved_regions_is_exist(paddr_t region_start,
+                                            paddr_t region_size)
+{
+    const struct membanks *mem_banks[] = {
+        bootinfo_get_reserved_mem(),
+#ifdef CONFIG_ACPI
+        bootinfo_get_acpi(),
+#endif
+#ifdef CONFIG_STATIC_SHM
+        bootinfo_get_shmem(),
+#endif
+    };
+    unsigned int i;
+
+    /*
+     * Check if input region is overlapping with reserved memory banks or
+     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or static
+     * shared memory banks (when static shared memory feature is enabled)
+     */
+    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
+        if ( meminfo_is_exist(mem_banks[i], region_start, region_size) )
+            return true;
+
+    /* Check if input region is overlapping with bootmodules */
+    if ( bootmodules_is_exist(&bootinfo.modules,
+                                   region_start, region_size) )
+        return true;
+
+    return false;
+}
+
  struct bootmodule __init *add_boot_module(bootmodule_kind kind,
                                            paddr_t start, paddr_t size,
                                            bool domU)
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 16fa05f38f38..b8db1335be6c 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -159,6 +159,8 @@ extern struct bootinfo bootinfo;
  
  bool check_reserved_regions_overlap(paddr_t region_start,
                                      paddr_t region_size);
+bool check_reserved_regions_is_exist(paddr_t region_start,
+                                     paddr_t region_size);
  
  struct bootmodule *add_boot_module(bootmodule_kind kind,
                                     paddr_t start, paddr_t size, bool domU);





