Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B48B963A
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 10:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715641.1117412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2RZq-0001FX-V9; Thu, 02 May 2024 08:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715641.1117412; Thu, 02 May 2024 08:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2RZq-0001E1-Rj; Thu, 02 May 2024 08:14:02 +0000
Received: by outflank-mailman (input) for mailman id 715641;
 Thu, 02 May 2024 08:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7KU=MF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s2RZp-0001Dv-Ag
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 08:14:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe02::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eceeb89b-085b-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 10:13:58 +0200 (CEST)
Received: from AM6PR0202CA0068.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::45) by AM8PR08MB6529.eurprd08.prod.outlook.com
 (2603:10a6:20b:354::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Thu, 2 May
 2024 08:13:56 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:3a:cafe::6) by AM6PR0202CA0068.outlook.office365.com
 (2603:10a6:20b:3a::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29 via Frontend
 Transport; Thu, 2 May 2024 08:13:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Thu, 2 May 2024 08:13:55 +0000
Received: ("Tessian outbound af213ececc3d:v315");
 Thu, 02 May 2024 08:13:55 +0000
Received: from df9133db84a9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5DFEA3C2-BEBA-4BFF-904C-43ABFFA09603.1; 
 Thu, 02 May 2024 08:13:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df9133db84a9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 May 2024 08:13:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBBPR08MB5964.eurprd08.prod.outlook.com (2603:10a6:10:20c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Thu, 2 May
 2024 08:13:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 08:13:46 +0000
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
X-Inumbo-ID: eceeb89b-085b-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RPbx0lNRbqCgn6scOdjUhrH4opZ7S5FDa+0st5LjEQbUke4hLE30zRT/+NXiE66MtouJ1DKqttoj8S1LKCsdqZ80x8elDqnFC+tJzlfw98RQg6+Z3uyD9xvkcUIhaXSejR8nXOHWQ5QkfZRCIg25CK0ZuXTIor+WaYuN9GIqDNOGdpx3/hTu1HFPx4Wvpn6SSxarj1M0ygTxA/2uOUqWtJF8DduzM10DrhCOxb6XeEdV39MuSISkQv1fmNI4mF9olAFW4lm1SSLmk3vm3GnB1PNG4egFhLgTOXBeIup5uqLrwG5eWBDPdv1DS5tsAiOpKCqNCUXglM+dPKP/6TlHtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAUECygnRCTvIC2GrB7oVlQdHqf7g+0FQEkkv0kuxuU=;
 b=EXTzPtkjXI3kEuMXovBwDD8CvLQKdllPdy4Bu8pbgw3DbkdA8vTTJ0zFR601FemeCVUnt1cI1el8llsRQ/v8f/5/KxAHFiT+RIAcA2kzJaxnuFRm4xg9Xp56DjBICD3uk8iH1325OeEl59LmT6NZyG0a+2RwnqZbVdOq7a5BtrE8AosO/KcK2sx69FV8gYrp8aZ0xfWoOsm36nuyebsoCnVl0b0tGMI9iNbpbGFoZmoTRSThOZun3F39S79lqDlRTbFmErVfNpo0OgiM5LjiyUefA3dqRQpdG5hpt4vRE+Eg6gn8ASV58+UrUJ5EoViyf9ixelXgYkmnr+2SCe0i/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAUECygnRCTvIC2GrB7oVlQdHqf7g+0FQEkkv0kuxuU=;
 b=l4ZEFx3lwm2esztVOwZ+EfjUoHlR6nL7LxfCeLGvQXyvovv7qiCJ/hVtOsW+HwvcJQJ22YQ2yrXfHENmYadVet3LP6zN5icQEs3n/fufnaxLz51bZ1I+ZejmlSkuNEXKSG0Cx2mamxofx/bXrWKqQPFNMCjzRkVNhBBm4qxbFQE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89316e26dcd4cc90
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgmemJqaOA3YdFbaPnAbcXOYHrY/fq7PLevpALvqgzIQCUGAMekR63F8xBP3pG3vuPr2xtAK3MTPZVY9HAtGatMHk16nPrIMD1dJ363n68/IUWZ066EGKw1OJii6i/XxUfbOs6gbXlhDBc8L794tl51+cP38oOhcDCGOyXwYUIgTGg0/YOOEXXUSgWWdiMkyxAEnKpaxqG029BpXT94YfqeDWeSBuoBdewWRLUEJNiogT5YbIzgr4Quie2N8t3EBoSqKgG9neMurOqhcuXdw7jEPuBNCz8ZRAvRp4Ycms29XKRvCpsS5SAqt5ubNjk7Asa59VfTy6mokkhm0tFII2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAUECygnRCTvIC2GrB7oVlQdHqf7g+0FQEkkv0kuxuU=;
 b=c+myNK9NQpRZ4UwreT5KlSYy7z6/fj6suwBYdA8kovsIf0eIJ4mkgsvqhO115UXKtuyUeLoDxwWI8wVdridYjIGu8ZisZBkR9F37zX0SMkSePTXkH5dlErd2tTSvZq65xmf1ZwdpxaLLg6GDpkNOU37/PMwuuUF4VnHYFJ+Kj4GYmd1fz8d0XBjtXg+92u1OkY50lP0qZB5/XewYRNy2oYdAZci92xIWPFnxS5evOumz1d7HSnbKSjc5npmys9WxBUbGyVma7x/NZY8L9lpU90wAhJXlg44SF5PqCl/cZuhWzJB0vwgiV5ag+YVBTYPWXQarJKikvARBBIqf7UfCiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAUECygnRCTvIC2GrB7oVlQdHqf7g+0FQEkkv0kuxuU=;
 b=l4ZEFx3lwm2esztVOwZ+EfjUoHlR6nL7LxfCeLGvQXyvovv7qiCJ/hVtOsW+HwvcJQJ22YQ2yrXfHENmYadVet3LP6zN5icQEs3n/fufnaxLz51bZ1I+ZejmlSkuNEXKSG0Cx2mamxofx/bXrWKqQPFNMCjzRkVNhBBm4qxbFQE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "consulting @ bugseng . com" <consulting@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Thread-Topic: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible
 array member not at the end
Thread-Index:
 AQHamu72Eq1RpEGs60mNp9DIfY8mn7GAr6+AgAFEGQCAAYYzgIAABVAAgAACyoCAABlOgA==
Date: Thu, 2 May 2024 08:13:46 +0000
Message-ID: <2DF15520-B0A4-4972-92F6-FCB6BB852292@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
 <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
 <de09e134-0150-49ca-8338-a0f4759c218b@suse.com>
 <29573F6B-BE27-4A65-A310-35883A39F989@arm.com>
 <af1116ad-6401-403b-a3b8-abe421e2e3da@suse.com>
In-Reply-To: <af1116ad-6401-403b-a3b8-abe421e2e3da@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBBPR08MB5964:EE_|AMS0EPF000001A0:EE_|AM8PR08MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 302f8565-b9e9-40e6-62ae-08dc6a7fcfc8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T3UxMWg0NmZQYzVXbVE0U2toT3E3TndmMzRQc3ltK3hUa1l2Z29hblROcE5Y?=
 =?utf-8?B?bzBWbGowelpjR3VqcWsycW56ajEvc3ZFYjA3RkZvRForZ3NRbnU0WTBzeDVv?=
 =?utf-8?B?UUpDWHFtZTg4WkgwU0FrTThISkFhQmlHV1VxbW51bnJJcVNiMGpMbTdHZUxx?=
 =?utf-8?B?ZkFpamNYNCt0c3EvK1Y5ZkpJL2hqdXVXTDlYMEdMd2FieURnYXk0cFlOQnN2?=
 =?utf-8?B?TEpZYTN0cTFteEZYVkpZN1FlSTR3ZTFmWFNuRSt5QlhoeDBkWFVXelc5Rkx0?=
 =?utf-8?B?b2VyZzNsTnhPVFMrajJmc2Q4U0lXZXk4RGJSN3J0dEhoZVN3ajdNR1N1RHR0?=
 =?utf-8?B?TzhnV2tmd1RiK1Rxb0xYWU9qRC9RNVZrNTUxelNNWmxCeU5XZW9EMUpQREJa?=
 =?utf-8?B?U0ZkYy8yR0EwU1RnaEg3VXpWb2U3USs0MGZjQk15WnIyVHdGTmQxVTMwOFVO?=
 =?utf-8?B?UC9NQVQ2UFRRdXFPMS95cGxpTTkydDdvYkVwK3RKODJrc01iYkRsSFY3Q0Jn?=
 =?utf-8?B?RVhNc1RKZ3k1VHl0dlR2aUtjeUVsdGkxZ05qODVXd2c1RWI4cDc4aUpGd0dU?=
 =?utf-8?B?T3NvN1FkQXM3YXprVjVNeHBZcHk0Tmg0NUdiYy90ZnZUTDNIUVdVUS9EeTMr?=
 =?utf-8?B?NDBGR1laVnY4UnUraTZLMm83MjgxeCtUWmczUDJ6L3FwUVlGMDU0b2h3SWNm?=
 =?utf-8?B?Z1Z6NEt1T2t3aTlpVU5qb01Nd29aU2FZSTZ1TWo5bmxPVGZwZWpneXcvNEhi?=
 =?utf-8?B?OUFTOUMwd2hIT3lnVi9JTlFLeGdmNU5LNDVpWWtqc2ZWMGxLRldQMm1IWDN1?=
 =?utf-8?B?RGRCVVlGdTljTjZrZkZjOHkyT0dFYXRvWDdLb3BNTU9sdFhsQW9RenRhVG43?=
 =?utf-8?B?RVlQV1U0MGZjYkMwVVRGZHd3ZWdyMVRwdFhJUGhaRGRUWlhGQUZJQW4zQXlQ?=
 =?utf-8?B?eW1XRlB3dkJnRHkzc0hSY1lUMDRoYW9SQ1ZDUU9CRTEwRCtvL2QzUU9nenln?=
 =?utf-8?B?RjZNRVNWS3FORVB1NWR4c1FlRGZ5Rks3bmlrSGJSMzVKTXBJZXhvWHRZeUJz?=
 =?utf-8?B?TExoSzMwWE9vTzVHOTVSVUllYXVrQlBiREkxR25JM2ljbWhUaS9wQXdyZVdW?=
 =?utf-8?B?SGhVeENka0Y0MEVMa3I4WEt0cXdhNjE3eXlkZC92elgyekhVYVUzRzhLN2da?=
 =?utf-8?B?NW15MTlXcnNMQmMvcE1IenlWUVdLZGhrTGMxS3RNa2Z4TlF3Z080N0lGWk5X?=
 =?utf-8?B?NW0yUk5yVExEak4xOTlDd1dJcEhGOEQzYUMvcTNqcHZESXJlbmFwaHI0UUgy?=
 =?utf-8?B?UFRLeE9YSDI0aHU3T2lUdmZVemFqVnhkdklYMnRYeG1Tbm9aTklCbEFqUE54?=
 =?utf-8?B?ejRFdUlNbnZ5YnJ1a2lrSlA2ZEM2cVo5cWN3V0xYeTh0L0o4UURwUURoeDI0?=
 =?utf-8?B?eVJ1Rkhuak54cmtHMFlrSTlqckxmdjRndVdJTktYT2pYa1BxZk5jbUVMaTVD?=
 =?utf-8?B?ZjNNdnVxSHMxU0k3RUpHUkdkZEtQSE8zVjlZdHlzWElVUGMzZUdjbGdaZzNv?=
 =?utf-8?B?M2ZlQ2ErbGpXR0pYNTM4Sjg1VEhRNEc4Vk43TjhrZ1RRVjhrVVlqMExXOEFx?=
 =?utf-8?B?WTdud0M2dFAyS05QSjRaU3NYT2NkRXlYSHdrYlZLQ1V5aktKNy9aSWtSWkdq?=
 =?utf-8?B?aUY4dkRRZU9XdFlpTXdOQVZzVlhwYzNoc3l5TDBtL2wxSy9HVnNxQkZWMis4?=
 =?utf-8?B?R1lYK2ZIN1hneWF3dTRSR0drTTZIaGVxbGZ1VW11VDVUWjNsajNZYWRoNS9H?=
 =?utf-8?B?cTdjWjVSQTRZVkE3TG03UT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E48870000489764E9C951580C2DA0AD2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5964
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c60fd3c2-ef00-46c8-618f-08dc6a7fca2a
X-Microsoft-Antispam: BCL:0;ARA:13230031|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVo1a0JvTWx0UGlqZXFJZG1zeG0wbDVzbUpQcjM5cjhoK29SODdQSW9tZlBi?=
 =?utf-8?B?blRxSDl2citWc2FyeU1EUmF6NS9OOWlrNWVUWlpSMUhIRzZvUDRuNUdBczZo?=
 =?utf-8?B?WkZYeEk3aUwrT2NjKy9XZVphR2RtdmJvallMQVVJTUhlZ1hWcU9pRm9hM1FS?=
 =?utf-8?B?a0pLVDRzblF0RXdRRWlMd1J2SFhxb2FLbWkzaXQ2STVucVFGc0toUk5PbU9J?=
 =?utf-8?B?REtqNGlnRzBKdzVuRjJQdWNydXl1Z3dtY3RIbWxONmdYeUdvNEFPVzhMT08v?=
 =?utf-8?B?TzVqYk5JeFdjcUJ0djZnaWhrajdlUlk3aWpIbzBPRzVDSTZwVTFwQ25qYmYx?=
 =?utf-8?B?R1NkRUpaZi9XcGtPTG42QWVVQ2YrTHRiRGlwbjQvNUZqSWs3TUc3WVVZYktq?=
 =?utf-8?B?S0N1aHZDbkZLUzRRcVY5N2NtbVE5V0VmOVU5Q3g2c1ZLNHNockZBaWNMWnRE?=
 =?utf-8?B?clpVNGJFY3ZSNUlPbGVXQ0VnNVRaNER5dm5WanFqeER1VURMYnpNLzVtWUt1?=
 =?utf-8?B?eG5MZG1STkF6Sm9XcE81V0NCand3clB1cFNaU3JybXJXT05Dd0FoQUlwMHN6?=
 =?utf-8?B?Tks5WjNlZjN0WEVzWTAxdUhHalh2OUR0dTUzd0ZnYzZDUmV6bUxUdXhMT2Rr?=
 =?utf-8?B?MFUzVlBqd0hMMjRpL2pLMEFMZG1DcDZvSWNpNzZndTB2WWo5YmZCeWExNkVM?=
 =?utf-8?B?SldVVjhPY08reVlCZmY3VEQ2UHN5TEtqcWt0Q1JKa0d2RWVRVS91VDZ1a0Yr?=
 =?utf-8?B?Y3FnSmZ5VVVDSHZrNDJXSFNDTUREQkVyNit2TEE5YTE0aHhQMWdjdkJZVCtP?=
 =?utf-8?B?cHdLQi91dUlSclR5bmV5RWhaL283V1EreEdTY2tDMVRaY2Y3V3dMWU5ueW9Q?=
 =?utf-8?B?cmYxWVkzVHg5LzVRRytNL1Q4bGFpdnVVeFFjeUdVaklWVGFpTUFUY2wzcTlU?=
 =?utf-8?B?YlBWQi9MV24vQUo0VDlEQ2c2TkVzL3FSanNsV3hjSmdWZkMxbzVKWGxXZGt6?=
 =?utf-8?B?ckNqVmJOeHRnY0NkQk9hTldNUHQzZWlQcjJYYUJ6WllsT2xHMWJ2WExSOXVQ?=
 =?utf-8?B?bTJLN2N5N09uMS9CZm1XZTRLY1JVaGQ5a1JySGZ2VkxhK3NxQkVNRUI4TjFN?=
 =?utf-8?B?N0Z3dFRpaEd4WlZwOFJIZzRqZzd3ZmNFRFM2NEFzN0FJdGl2NE1QQmRGaVBk?=
 =?utf-8?B?UEdhektqMXRaSkd2b2R4YVVGeGxHaWprOUlrMm1iYkM2aVVmb1ZLekVkSllC?=
 =?utf-8?B?cGhDT0ZiY3M0dmZBSVl4Rk5ZN2svSnp1Z01NVzErb2tTaHJJTFZqU0lIL3p1?=
 =?utf-8?B?ZmJDU0YySVpQN2pSMEtUY1hBK2hQYzV1eG1DeXZuMGh3bm9NODJYUHM5aVZ6?=
 =?utf-8?B?Q2NWTVZlVUtlUmFKelkya3c4YXJ5cHkxeno1MXFYTkF1T3hlRGhaZ0xXNWUz?=
 =?utf-8?B?bldNbThGOVJHY0F3UStLQ054VytqOGhTbi9vOTVLQjdEajZqeHV2eE1jdEtB?=
 =?utf-8?B?REs2TjU1dVhSWkhGTVhRTkpCc29YYmxSK0psaXRTSjh0dVVwNmpIV3hSUnJJ?=
 =?utf-8?B?QjhDeENFVzBnaXV4SWF4dHdiZVFTV2t5UmVBV3B1RkRwbFpVblBIZm5xeEFV?=
 =?utf-8?B?UEIrd1Y5RlB6b3JnWTR2MjhtMDVGdkYxREV4dytGeUZiTzgrQkVNVXVEUGs4?=
 =?utf-8?B?UHowMFhaOG03MEtsU01mQU5Jbm5VV2xjTnE0YjRuaXBILzgybDdMNjVtUWp0?=
 =?utf-8?B?TnZMdVlIcmdPOEdpaHlvSDhMRlRnUHJFYzFaMXVraXpSeXU1dzZjUEo5bnRl?=
 =?utf-8?B?azREczZWVjZGYlMveVpYSFpOVVZwWnMwQnpqK3NMaXFWd2lvWnNGZTZVdk1D?=
 =?utf-8?Q?P18OS1pZ9Zhg1?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 08:13:55.8393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 302f8565-b9e9-40e6-62ae-08dc6a7fcfc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6529

DQoNCj4gT24gMiBNYXkgMjAyNCwgYXQgMDc6NDMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMi4wNS4yMDI0IDA4OjMzLCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gDQo+PiANCj4+PiBPbiAyIE1heSAyMDI0LCBhdCAwNzoxNCwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwMS4wNS4yMDI0IDA4OjU3
LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiBIaSBKYW4sDQo+Pj4+IA0KPj4+Pj4gT24gMzAg
QXByIDIwMjQsIGF0IDEyOjM3LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Og0KPj4+Pj4gDQo+Pj4+PiBPbiAzMC4wNC4yMDI0IDEzOjA5LCBMdWNhIEZhbmNlbGx1IHdyb3Rl
Og0KPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+Pj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmgNCj4+Pj4+PiBAQCAtNjQsMTgg
KzY0LDIwIEBAIHN0cnVjdCBtZW1iYW5rIHsNCj4+Pj4+PiB9Ow0KPj4+Pj4+IA0KPj4+Pj4+IHN0
cnVjdCBtZW1iYW5rcyB7DQo+Pj4+Pj4gLSAgICB1bnNpZ25lZCBpbnQgbnJfYmFua3M7DQo+Pj4+
Pj4gLSAgICB1bnNpZ25lZCBpbnQgbWF4X2JhbmtzOw0KPj4+Pj4+ICsgICAgX19zdHJ1Y3RfZ3Jv
dXAobWVtYmFua3NfaGRyLCBjb21tb24sICwNCj4+Pj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQg
bnJfYmFua3M7DQo+Pj4+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IG1heF9iYW5rczsNCj4+Pj4+
PiArICAgICk7DQo+Pj4+Pj4gICBzdHJ1Y3QgbWVtYmFuayBiYW5rW107DQo+Pj4+Pj4gfTsNCj4+
Pj4+IA0KPj4+Pj4gSSdtIGFmcmFpZCBJIGNhbid0IHNwb3Qgd2h5IF9fc3RydWN0X2dyb3VwKCkg
aXMgbmVlZGVkIGhlcmUuIFdoeSB3b3VsZCBqdXN0DQo+Pj4+PiBvbmUgb2YgdGhlIHR3byBtb3Jl
IHN0cmFpZ2h0Zm9yd2FyZA0KPj4+Pj4gDQo+Pj4+PiBzdHJ1Y3QgbWVtYmFua3Mgew0KPj4+Pj4g
IHN0cnVjdCBtZW1iYW5rc19oZHIgew0KPj4+Pj4gICAgICB1bnNpZ25lZCBpbnQgbnJfYmFua3M7
DQo+Pj4+PiAgICAgIHVuc2lnbmVkIGludCBtYXhfYmFua3M7DQo+Pj4+PiAgKTsNCj4+Pj4+ICBz
dHJ1Y3QgbWVtYmFuayBiYW5rW107DQo+Pj4+PiB9Ow0KPj4+Pj4gDQo+Pj4+IA0KPj4+PiBBdCB0
aGUgZmlyc3Qgc2lnaHQgSSB0aG91Z2h0IHRoaXMgc29sdXRpb24gY291bGQgaGF2ZSB3b3JrZWQs
IGhvd2V2ZXIgR0NDIGJyb3VnaHQgbWUgYmFjayBkb3duIHRvIGVhcnRoDQo+Pj4+IHJlbWVtYmVy
aW5nIG1lIHRoYXQgZmxleGlibGUgYXJyYXkgbWVtYmVycyBjYW7igJl0IGJlIGxlZnQgYWxvbmUg
aW4gYW4gZW1wdHkgc3RydWN0dXJlOg0KPj4+PiANCj4+Pj4gL2RhdGFfc2RjL2x1Y2ZhbjAxL2dp
dGxhYl9taWNrbGVkb3JlX3hlbi94ZW4veGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmg6
NzA6NjogZXJyb3I6IGRlY2xhcmF0aW9uIGRvZXMgbm90IGRlY2xhcmUgYW55dGhpbmcgWy1XZXJy
b3JdDQo+Pj4+IDcwIHwgfTsNCj4+Pj4gfCBeDQo+Pj4+IC9kYXRhX3NkYy9sdWNmYW4wMS9naXRs
YWJfbWlja2xlZG9yZV94ZW4veGVuL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oOjcx
OjIwOiBlcnJvcjogZmxleGlibGUgYXJyYXkgbWVtYmVyIGluIGEgc3RydWN0IHdpdGggbm8gbmFt
ZWQgbWVtYmVycw0KPj4+PiA3MSB8IHN0cnVjdCBtZW1iYW5rIGJhbmtbXTsNCj4+Pj4gfCBefn5+
DQo+Pj4+IFsuLi5dDQo+Pj4gDQo+Pj4gU2luY2UgZm9yIHBhdGNoIDEgeW91IGxvb2tlZCBhdCBM
aW51eCdlcyB1YXBpL2xpbnV4L3N0ZGRlZi5oLCB0aGUgc29sdXRpb24NCj4+PiB0byB0aGlzIGxp
ZXMgdGhlcmUsIGluIF9fREVDTEFSRV9GTEVYX0FSUkFZKCkuIEFsb25nc2lkZSBvciBpbnN0ZWFk
IG9mDQo+Pj4gYm9ycm93aW5nIF9fc3RydWN0X2dyb3VwKCksIHdlIGNvdWxkIGNvbnNpZGVyIGJv
cnJvd2luZyB0aGlzIGFzIHdlbGwuIE9yDQo+Pj4gb3Blbi1jb2RlIGl0IGp1c3QgaGVyZSwgZm9y
IHRoZSB0aW1lIGJlaW5nIChwZXJoYXBzIG15IHByZWZlcmVuY2UpLiBZZXQNCj4+PiBpdCdzIG5v
dCBjbGVhciB0byBtZSB0aGF0IGRvaW5nIHNvIHdpbGwgYWN0dWFsbHkgYmUgZW5vdWdoIHRvIG1h
a2UgdGhpbmdzDQo+Pj4gd29yayBmb3IgeW91Lg0KPj4gDQo+PiBJIGxvb2tlZCBhbHNvIGludG8g
X19ERUNMQVJFX0ZMRVhfQVJSQVkoKSwgYnV0IHRoZW4gZGVjaWRlZCBfX3N0cnVjdF9ncm91cCgp
DQo+PiB3YXMgZW5vdWdoIGZvciBteSBwdXJwb3NlLCBjYW4gSSBhc2sgdGhlIHRlY2huaWNhbCBy
ZWFzb25zIHdoeSBpdCB3b3VsZCBiZSB5b3VyDQo+PiBwcmVmZXJlbmNlPyBJcyB0aGVyZSBzb21l
dGhpbmcgaW4gdGhhdCBjb25zdHJ1Y3QgdGhhdCBpcyBhIGNvbmNlcm4gZm9yIHlvdT8NCj4gDQo+
IEkgZG9uJ3QgbGlrZSBlaXRoZXIgY29uc3RydWN0IHZlcnkgbXVjaCwgYnV0IG9mIHRoZSB0d28g
X19ERUNMQVJFX0ZMRVhfQVJSQVkoKQ0KPiBsb29rcyBzbGlnaHRseSBtb3JlICJuYXR1cmFsIiBm
b3Igd2hhdCBpcyB3YW50ZWQgYW5kIGhvdyBpdCdzIGRvbmUuDQo+IF9fc3RydWN0X2dyb3VwKCkg
aW50cm9kdWNpbmcgdHdpY2UgdGhlIChlZmZlY3RpdmVseSkgc2FtZSBzdHJ1Y3R1cmUgZmVlbHMN
Cj4gcHJldHR5IG9kZCwgZm9yIG5vdyBhdCBsZWFzdC4gSXQncyBub3QgZXZlbiBlbnRpcmVseSBj
bGVhciB0byBtZSB3aGV0aGVyIHRoZXJlDQo+IGFyZW4ndCBwaXRmYWxscywgc2VlaW5nIHRoYXQg
dGhlIEMgc3BlYyBkaWZmZXJlbnRpYXRlcyBuYW1lZCBhbmQgdW5uYW1lZA0KPiBzdHJ1Y3QgZmll
bGRzIGluIGEgZmV3IGNhc2VzLiBGb3IgX19ERUNMQVJFX0ZMRVhfQVJSQVkoKSwgb3RvaCwgSSBj
YW4ndA0KPiBwcmVzZW50bHkgc2VlIGFueSByZWFzb24gdG8gc3VzcGVjdCBwb3NzaWJsZSBjb3Ju
ZXIgY2FzZXMuDQo+IA0KPiBZZXQgYXMgc2FpZCBiZWZvcmUgLSBJJ20gbm90IHN1cmUgX19ERUNM
QVJFX0ZMRVhfQVJSQVkoKSBhbG9uZSB3b3VsZCBiZSBlbm91Z2gNCj4gZm9yIHdoYXQgeW91IHdh
bnQgdG8gYWNoaWV2ZS4NCg0KTW1tIHllcywgSSB0aGluayBJIHdvdWxkIHN0aWxsIGhhdmUgcHJv
YmxlbXMgYmVjYXVzZSBjb250YWluZXJfb2Ygd2FudHMgYSBuYW1lZCBtZW1iZXIsDQpzbyBfX0RF
Q0xBUkVfRkxFWF9BUlJBWSgpIGRvZXNu4oCZdCBoZWxwIG11Y2ggYWxvbmUsIGlmIEnigJltIG5v
dCBtaXNzaW5nIHNvbWV0aGluZyBvYnZpb3VzLg0KSWYgeW91IGJlbGlldmUgaG93ZXZlciB0aGF0
IGltcG9ydGluZyBfX3N0cnVjdF9ncm91cCgpIG9ubHkgZm9yIHRoaXMgaW5zdGFuY2UgaXMgbm90
IGVub3VnaCB0byBqdXN0aWZ5DQppdHMgcHJlc2VuY2UgaW4gdGhlIGNvZGViYXNlLCBJIGNvdWxk
IG9wZW4tY29kZSBpdCwgcHJvdmlkZWQgdGhhdCBtYWludGFpbmVycyBhcmUgb2sgd2l0aCB0aGF0
Lg0KDQpJbiBhbnkgY2FzZSBpdCB3b3VsZCBiZSB1c2VkIHNvb24gYWxzbyBmb3Igb3RoZXIgYXJj
aGl0ZWN0dXJlcyB1c2luZyBib290aW5mby4NCg0K

