Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002398AA9FE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 10:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708849.1108011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxjTR-0002M6-5Q; Fri, 19 Apr 2024 08:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708849.1108011; Fri, 19 Apr 2024 08:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxjTR-0002Ka-2B; Fri, 19 Apr 2024 08:19:57 +0000
Received: by outflank-mailman (input) for mailman id 708849;
 Fri, 19 Apr 2024 08:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iezf=LY=epam.com=prvs=0839d8b339=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rxjTP-0002KU-Eh
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 08:19:55 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9879a3fb-fe25-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 10:19:53 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J89Qk9000903; Fri, 19 Apr 2024 08:19:48 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3xk6k5t2md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 08:19:48 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI0PR03MB10252.eurprd03.prod.outlook.com (2603:10a6:800:1b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 08:19:44 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 08:19:44 +0000
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
X-Inumbo-ID: 9879a3fb-fe25-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rtvka9jD8hS/8MzYOrg31lGUYRNJHmZZTXicP+YriTnA/ITO+vj8ofnYNF/ZrNY5uP2nig6LLjzKsY8ujx8QXOebDiz4uveKvpSPwfNdKWMsmlcM7vDGJt11oGHuEcRMKmMc4QZDXD77C/tW9SiopMBQpmWJbmGthWywiEsiVLXRmOxJH+KL4zEZ8oHFKg4jTpkWMJ0nzFJmf+vcBz58orDaMDVSFKbu9v31EPgYGy/y0fKqIOOoE4fR7X6BmvzaViuw4ItCvOWZB+N2QW3MIeNjSeb5hwA+KQ2Q1OL1jl6gnJnW8YwVJEFy+rQDjmTXBOiKGMg87myU+Sl27vP0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlvDNNYdA1pnh2e+ORuh+D4Dlzq9N5H+cqFTU7kvdhU=;
 b=OTWKE4nGbQot3KUxIMnZph7raM6s5BeOX26APHQT79+bREdBKs9tHCXRWAcm7m3r+t1UAlkqwD3cgw2CxUigK/133AvJJ5tgvGt1SsNVnx18xjbFFkHn2SkF7VMp/dJa1s2D9xiPNBtyEXpszTvyrLdOUZ9LgZ70Qan94MuBbme7wo523peq9Z5FVO4upVceZB69jI4qbrZRv033SlSrR6++jPTymFYZyLXuogqsoaJhxWEd0xjnRsZGoNH+ve4pqMKOnCHXkx8CWEHIaP6OFyEzAUP/4KQqdRileO7srq7FWlE01AE3C8LBWsw7hd5WoMTVZlfHFt9Ju4INSyCB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlvDNNYdA1pnh2e+ORuh+D4Dlzq9N5H+cqFTU7kvdhU=;
 b=JBgF6bbyJG4M6/TmJ7XBu9jDqBS123HZvD5J+flAlO+e/keFRKjHj7k14q2wLnPi/SIXMn+F0xDhVEXPhmh+35+SJ2SxY5jepiKBN/1n5zEYS1I4C2W6ThWjn82kjlK2GDDoPXelIKxtX4EmZmlPpi0wVrH/TCw0klVgMfaUsPebwdtGUaYpV/KNOifXLBXwgKrIcC3zseyINzSZyy/oPS/0lA5EC7dv3V4tZQkvwb4ZAaoOkgeUpfFuxtWDJI7SWuZX1AuHwZusO2smcvDWxnbUr5YwkLvFT6m2Cq/f3aO2C+/bTjMRLX3qNipKZPMS2MJIh06F/NW4v+wsWVRyIA==
Message-ID: <f791e8e0-0769-48e0-8bd4-5c23881709fe@epam.com>
Date: Fri, 19 Apr 2024 11:19:42 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 02/15] x86/hvm: guard AMD-V and Intel VT-x
 hvm_function_table initializers
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <20240416062258.3468774-1-Sergiy_Kibrik@epam.com>
 <8fbd604e-5e5d-410c-880f-2ad257bbe08a@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <8fbd604e-5e5d-410c-880f-2ad257bbe08a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|VI0PR03MB10252:EE_
X-MS-Office365-Filtering-Correlation-Id: ef07a156-67bf-4d86-e2eb-08dc60497839
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cE1pSDVGQVZkUGplSWtDbUxTbUd5aUlaVW9jV01YU2pxa2lXcHNVVm9XQ00y?=
 =?utf-8?B?SGxPd09LNGxYL3FhSnFBNXJ1amVwZUdCMWthd3ZvUGRSREs4bEMzVDRXN3Yv?=
 =?utf-8?B?Mlp1NU55bVRyTjI0SG5hK0EwNnBWWHRyTTE1OUpqMkxGOXAzbUIyQ3JVL2tz?=
 =?utf-8?B?czJSQnRucGlkNHBRZi9aMWV5eng1c0Z4VnFkZVJIaHRRQ2ZRbnJMa1hUSFZU?=
 =?utf-8?B?aklYaVY0V2pWWDljTUNkQ0p0Y0hzVmt6azJFNUJDTm8relp2YXNvU3RaZ01j?=
 =?utf-8?B?K2NYZmxDRE84SGltU2RuZkZzUE1aaWNhRVZtT1lZVUc5Y0ZHMU03M01GV3Rs?=
 =?utf-8?B?YkF0cWtUTU9qdkFYVnM3Q3p1WkoxNUtxMTc4VzdnMnJQQXJ1UHFpN3ZXeWJH?=
 =?utf-8?B?TXEzVitlem16T1h2V3dMczBqUStpSWpnRVE4akM5RWE3TU05UFZGdC9sbG5X?=
 =?utf-8?B?SEpUUC9IVlNRaytmOVU2VXVNKzNyREdNQ2RWOCtpejVpMnEvMVJRR1BQMjlV?=
 =?utf-8?B?TTZMUktzZTJ3TXgzcXNNeUg1UXVReElVWWh6SzJVWWpkVlFQNjlwT1l1MXRp?=
 =?utf-8?B?UnI1WDdySlE1eUR5Mi9Bb3VrQlMwRUlhMFRUaGVnL1dFME1SS0MrVmx0Vi9C?=
 =?utf-8?B?M1p4R3JUbWdEbWVDYXRYSGtuWFlOZE0rdjZ4NldxdEVhNmtKNmVTZDk3Nmo1?=
 =?utf-8?B?bGZmR0VUMitoY21PMStQMUprOXk4Z3B1YnFUUkhoc3pjTGQ5NDhmRG80Tk93?=
 =?utf-8?B?Y3FzVEFWVDkxV3ZJT1dXRGowb1N4aEswU3VtL0N6aVpTa3NXelN4ZjZqaHk2?=
 =?utf-8?B?alhIWUY2QnZCTktXUC8vNkZkTktQVjRla05LZ2JySHNJRGEvZ1hBQmw3Ry9K?=
 =?utf-8?B?QmVqcVpVaE9QbjhCaW5hc2x6V2ZRbllOOHpJRlJBdWdocTc4dExMSzBXbkJN?=
 =?utf-8?B?WmhocG5QdDBjdVBSUnFiT0JVWXNxR2hQSDVkTFlHakJzTmViZEY4NXdnbkl2?=
 =?utf-8?B?eW84ZUxqYXIwK2RYZHppQ0xWckcxNzB0V3BvbEZnUGF2b2xqdFpwY1VhT2J2?=
 =?utf-8?B?cEU0WnVkbzNWT0FkR0hySFo1SXNROFMzUjFlYkJsd1JUeFcxcnhZNEF4L2dM?=
 =?utf-8?B?Mi9lclYrNzllNDZDTXlaTWJRMmdtYVBHRFpRKzdCdC8vUjlrVzNZVnNEMzRk?=
 =?utf-8?B?dlJtSnlnVlNiRHFFNXFEZnNEWjN0RkhDMzJUOEo2cVRJVkdTSDJ3WjFQejdr?=
 =?utf-8?B?VzFwSm1sL2MwalVNZUJSSzM5VFlEQUg0Q0xwelFGb1h3ZlBKTTMvdVBydGFL?=
 =?utf-8?B?ZTNhWGVUQklMZVVsd2txRGlMNkFYQTVhOHBIMkN3SEhqdnhGY2JCUFF2dEZO?=
 =?utf-8?B?UWhqaW9hZGhDd28yMDlxMjllUTRXS1JNbXRYRm9YYUh6V0E5QWRnU01ia0VZ?=
 =?utf-8?B?Z1FPOVhFMHp0Qm9MZmtEdWF1UE0xWmltb2Y2YzFiYkcwVHhialhTS2k3QS9o?=
 =?utf-8?B?MG9xc053YWRSOHpnaWFaNWZPOXZwN1ZlOFhtM1VhUnRJRFRCNDRNcEkvNHI3?=
 =?utf-8?B?VTJmM3lHSWl5RE8rL1F1REVWSnYxbUNDYVoyMXlqc25lbjFWejEyTzQwZHRT?=
 =?utf-8?B?SzFQS28zajdkUmxnRk0zNEQ1TEg4Lys1ME9kZmNOU3h0aWFWeGRNOHZFSjU0?=
 =?utf-8?B?ODRxckRaRjhla1Q5QzJmeURnSXRERElWZ1ZMMnJRemFFR3h0YmprUThnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MnhQMW1ZWGRTTkN4ZVF0cWFSSXJQSmhzVFQ3UktrblRsRFI2ZTFhbWpUb3ZW?=
 =?utf-8?B?MEllVzk4OTdiRlVzck9WdWVLdTJPaWZMaUVmMHQxZVQ1V3A2RW1URkhieGE2?=
 =?utf-8?B?WTFMV08zcWxqVFE2M211YitxbmZUdTQ1UHNwN0pNR0ZlK2R0MFI3by9qQzh0?=
 =?utf-8?B?bDU4aUV1UjJtSHRVTWIyZGEvY0VMT0ZZWVpKUWt6UnNDYnNLNXFWamdzYVcz?=
 =?utf-8?B?d1plcUFFdVlCSlN5Znptdm5DTm15Q1JDVy9YT0UwekswS28vb0xTQVN2VGNm?=
 =?utf-8?B?WDZWM0Z1YVFXZ2xIWU4vWXU0NXU1bjhkb0E5bUhZb2dYZ2grTVNwVHZmMDBs?=
 =?utf-8?B?WTk2TUVoeTdhSklSakxTWTczb0hJSGs5bkIrcVY2YnJPZ1JKTW9DOVN0a21z?=
 =?utf-8?B?TlFKQWRZcFgzdEtPMEhZS3hHbEhvRkVYUG41RWRRMk40K3phQ1hORk1KdkhI?=
 =?utf-8?B?ZEJtM0h2TEpYZ2w2YnhONWFyeXN5SEpzTG44NFdBSEpKcVczQzdPbUc3UjUx?=
 =?utf-8?B?VE9zdlNacGQ4V0FpNzJxN1ZZYTNobmJXYkVSUkpFV1FYQXByTGhuTnh6Zzh2?=
 =?utf-8?B?VDd3aVRQL21nMzZDc09jaFJNVUhTaWduYVQ4R01TamlidzdWZXl0TGg4bXoz?=
 =?utf-8?B?VjZrdVdpcGxVVXM0UUVqTTVGb2lTZnY0Q2o1TDR3L2c2allQQTZCanhFVTBw?=
 =?utf-8?B?QkZaQUpFbnAvdytYTy9SR0lOaVhoZXpwbVRvRVV2U3RrUmVrNmdLaDZZSUhF?=
 =?utf-8?B?ZnVwV29MQjhWalpYb2M3MUFmZmxBcHVzMDBUWFNhdkhvaUszQWtVd3l6d2pp?=
 =?utf-8?B?UjVLNEVtTExYUHlFZERDMlNJSGNHQ2FZOW92UWlIem42b2RyYlI2cHZFVUhB?=
 =?utf-8?B?ZWZMSDNqVnVLWS8yYTdjYXRtQ3JCSFdTbHU3cVk5em5WQlYzZXNrbjVCenNB?=
 =?utf-8?B?d3BlSXUrcVNuKzc5ZldKRUQyQk1zZ3hSZ1BGMkxtRVFGRjlXNU9KdWJpN2M3?=
 =?utf-8?B?dGtoVXRLa3lROEFEUFgrQUtFNDZ2MWgrU3JvV0MrWDd1VU56RFJMYzgxVWxh?=
 =?utf-8?B?RmxiaWxvWnJBS2RpZHc2ZEUyZWF6cWM4K2JPdHZtU25kMUJoZ2VWSHVEQ2kr?=
 =?utf-8?B?dHBSc21Vb2pULzFHQVRWZzNGd3dOWlRrci94MUFablhuS3ZuQ0RKc28zVnFN?=
 =?utf-8?B?S3U0ZWpCdDFyWEQvSnhselFzQjFzWWh5M1VqakYxcUZyTnVzSFE0SlFZYUlK?=
 =?utf-8?B?VVZKUU5KQ2VSQVZXc2xBKzdVUU1KWit1aHVoa21kZFYydktVczdRcEpING56?=
 =?utf-8?B?Ty8zNzNBRldqdmJHUVJkUzd6amxNdzJkVG1rY0VJYWdrTmpBUDRBUDdDbEM5?=
 =?utf-8?B?S2YvS1N5Mks2Y3NTTmNBeVFLZmVaN0x3MUhRd1VEb0JlcENQZmdEdERlSHdu?=
 =?utf-8?B?MVJURlNWZ1FsNFNQV0JSdVpIWitrMVZxZk1YSDd0bGE1cjN0d1NJeHNNMGx1?=
 =?utf-8?B?a3B4bTI2eC9iZURoVkJOcWdVZ2FMNkFUYytpM0xtS0loTFJxajRVSzlvdmNn?=
 =?utf-8?B?ajVXNndFeTNyT0VFbm5LdmdNYjJkYjE4RFVYWGtBMTN6QUllYm5HNGRyTDJW?=
 =?utf-8?B?UnozL2EvN3UzS1BZTVB2WDRHS0pWWkVlSFpXcEwzcVAzUEVuS09kQzIweUFI?=
 =?utf-8?B?Q25HUGJvSkNsakx3UDNjbWx3aXJ3Tk0vOG1kakVQL2FzR2YzdkwwUEVEdEdr?=
 =?utf-8?B?RmZGcWNHSzV1TS9xTW5MTTAzaUZBaHhlMHNJd3RGdEpScjlEWGgwdkxYTVNp?=
 =?utf-8?B?aHZFd1NlSDdZMk1mSnlEVnhXWFhGMjRIeG03Tmd4Tm5kSUNrbFlkd2h1LzJU?=
 =?utf-8?B?dHRHUjhDMndYd1hVTkpBMDYwdVNkTUFSME5MMVdISHNxWDNzbDN1VEFXQ2VE?=
 =?utf-8?B?VzRNSytsWjM4RlFXdEJGMGxTNHRUSGN6b3RaVnJ0WFhTcHVRQkkzV1U3eGwz?=
 =?utf-8?B?UWFrcU9UQ1pJelVnK2IyUndtdzNSYnM0RHVEdEt0OUQ3bWRKaVhOdHB0T3hQ?=
 =?utf-8?B?Wjdka1RpNVVzVGh3YXhjc2J1aDN0cDV6Q1Q3bGpsdXFDb2FCTC9lejRZSit3?=
 =?utf-8?B?RmpESjdiUjdnL2s0WFN1UldkeXF0a0wrVGlOREhObzlHQmM0ZjhGUnB6eFpP?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef07a156-67bf-4d86-e2eb-08dc60497839
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 08:19:44.7080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8n3IXa2xTdt/Sao3EtZd0E1dzXx3iGBe3FGCtZ/Wd5vmFEzqJT6ZilzWwHP7akVQ78VWzBcPboLCQRYSG/SCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10252
X-Proofpoint-ORIG-GUID: lF6MZ8Ws8BbGdZVKKuZ-WuKeVV5y7ZiP
X-Proofpoint-GUID: lF6MZ8Ws8BbGdZVKKuZ-WuKeVV5y7ZiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_05,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190061

18.04.24 14:18, Jan Beulich:
> On 16.04.2024 08:22, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -156,9 +156,9 @@ static int __init cf_check hvm_enable(void)
>>   {
>>       const struct hvm_function_table *fns = NULL;
>>   
>> -    if ( cpu_has_vmx )
>> +    if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx )
>>           fns = start_vmx();
>> -    else if ( cpu_has_svm )
>> +    else if ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm )
>>           fns = start_svm();
> 
> Do we have or do we foresee any uses of cpu_has_{vmx,svm} that are relevant
> when CONFIG_{VMX,SVM}=n respectively? If not, I'd prefer if the IS_ENABLED()
> would be folded right into the definitions of cpu_has_{vmx,svm}, as is
> already done for a few other CONFIG_*.
> 
> Jan

looks nice, will do it

   -Sergiy

