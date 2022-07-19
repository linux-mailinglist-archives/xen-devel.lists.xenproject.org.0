Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85FA57930C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370350.602049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgbG-0000g6-8J; Tue, 19 Jul 2022 06:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370350.602049; Tue, 19 Jul 2022 06:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgbG-0000eI-4E; Tue, 19 Jul 2022 06:20:54 +0000
Received: by outflank-mailman (input) for mailman id 370350;
 Tue, 19 Jul 2022 06:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P/02=XY=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oDgbF-0000eC-1h
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:20:53 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00059.outbound.protection.outlook.com [40.107.0.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef4c3733-072a-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:20:50 +0200 (CEST)
Received: from DB6PR0201CA0003.eurprd02.prod.outlook.com (2603:10a6:4:3f::13)
 by DBBPR08MB4251.eurprd08.prod.outlook.com (2603:10a6:10:d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Tue, 19 Jul
 2022 06:20:45 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::2e) by DB6PR0201CA0003.outlook.office365.com
 (2603:10a6:4:3f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Tue, 19 Jul 2022 06:20:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Tue, 19 Jul 2022 06:20:44 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 19 Jul 2022 06:20:44 +0000
Received: from fd439ccb24db.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2330313C-D0F4-46FC-B84F-1409CCEDD593.1; 
 Tue, 19 Jul 2022 06:20:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd439ccb24db.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Jul 2022 06:20:37 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB7PR08MB3451.eurprd08.prod.outlook.com (2603:10a6:10:49::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Tue, 19 Jul
 2022 06:20:36 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:20:36 +0000
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
X-Inumbo-ID: ef4c3733-072a-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hyucavG9sL5B23ZBgVWFiWrc7IK1TYO+pEoM+HbBXNo4xLeq6cmXkOPLi3Go4PAlyRJIrMO/XK3uNsGhyijzHfl81TzBYh/KQ/QxxuPHEjasNKC9MzZ3Vw/fxCVTm0N9UD4X15K8XVPSM1mA/HUIlqxQ8t515L3Giu54P8f4XJS3qASPERcAwxboGFNTSU5wJiSakAF+ZvAqoOT+KmDOKK1DgL62lmPfPi+9HXDRZSxHiBdrbPYvThCSltiASecqSBqjLsF0m8tIF2RqBfA+G0OhINDXauWdeyf2/mBBO3bycu7KmsVbPQMVdKyrkYvXWLOvLjd2R6EEz4TzEqF10A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtRjFiW1AfgmSvZaCYkGvgrGtvipb+RsPJ4GAoae4AU=;
 b=PawqjOfnMYVarVm47DTFpUn+W0jGmY31fLJpPJ4MBCCCPXuCTBMxGIzKTA/KyhsqnnMLyeRNNFQfg1R1ORmHBY2ZofxdCKSebGoUOU0TCbLEPoDtTyHuFnqBsZvueep9jATdrmuPhsmDyUA2nPSHz5rxD1agb8g1Biz7BbFzrCQRhG5uQBuVkFDqWGVd0AiYuXVyij9h5druZMF1z/BFakdVmRvz1ftH0/ltllMTrFR+hGsDQxUCdGH/L5Rm2i+4lw3Q9hdVUO5AMSObeUojLejoX0DxdCxWtznUW+DxYtmaO6Ld4vXbe5XziaJfovl1l5sQKNW8gUesUFEtj+9SIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtRjFiW1AfgmSvZaCYkGvgrGtvipb+RsPJ4GAoae4AU=;
 b=zPyOfAsl8JL2izPnCAkYJA3lNRj8vvuFF7ohaqMxQgpbF4w4/I1yl0kaMOTyyHl1xT7f0S6lxn1NtxMOopXfmDTH1oV9l9kQ3oJBjU3NGVTD6rAXDdq07SgTbBPTWDWF6MED/Y59FI7tBA6SUjOZV2FSu5fCKWz2sLcU1A8Y0/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f3b3b7a3a808798
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h67VteHR6Sp+f+BHoAXvruTJLMNYDlgN44IPF9jOw4+Zr7LI/k38stZvP7tLwKQN1MNXaW5aw+PPLTwkDS9OpcVmPeGhJT675jfiFdZlQ4fERH71QCCJ5VEB4Y+GrglZRTX6AKsh6EJwfwO2VQnZkI3qZlKWmCb40PQbFz4gfruULaYjLNkYV1sLq8ABt2fNBHdj8n6mw6rOHaKNFLfrhv1VnBA4lnVHEzcjeZEfh27cyI2hU6KekAsvFk7Ee1oYYDQPbtvQy6EVCwrCIw9IZZEKRum4yfFhsBjD6s6/rfQNi5SjnArzE37ZCx8ahMGiUxyH65YS9c+ASl7d9RFb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtRjFiW1AfgmSvZaCYkGvgrGtvipb+RsPJ4GAoae4AU=;
 b=RN3zFiPAXo6Ees+nVpklzg8R3BsdwckSgYKXe35Qc8jGGubL9Qp92Adpp1UyCMN8hxtlhn3GSdeIMCCQAGnsO2pMsnjDevSH7iqz/5HARMx4UuhrSzbji7cb1KNwYL2/6yyUljs/ZKx/hzBaROwbL8m8C6PvO26YMrIrlxFrSgtE3ywcK1lH6TdcswDPoeOxkg94Niegs2JoS26hMb+HX8ipVGDmXEkS0kXFSBeH2PiyxQ/wUqmQMg6NXs6Ih6YKqg2CfmgteatlgLrs0BwakgYQ0Yji8Emw3eyo7jgSLz8TiCXLR/+pUsdZKcaX2iCAbCkTfC/YETkJkcj5MxpCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtRjFiW1AfgmSvZaCYkGvgrGtvipb+RsPJ4GAoae4AU=;
 b=zPyOfAsl8JL2izPnCAkYJA3lNRj8vvuFF7ohaqMxQgpbF4w4/I1yl0kaMOTyyHl1xT7f0S6lxn1NtxMOopXfmDTH1oV9l9kQ3oJBjU3NGVTD6rAXDdq07SgTbBPTWDWF6MED/Y59FI7tBA6SUjOZV2FSu5fCKWz2sLcU1A8Y0/g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <0f8da611-0825-91ca-b1eb-dfbe0fb709f1@arm.com>
Date: Tue, 19 Jul 2022 14:20:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] pci: add rwlock to pcidevs_lock machinery
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-2-volodymyr_babchuk@epam.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220718211521.664729-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 21d531fc-ab2b-42c0-7d1a-08da694ed014
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3451:EE_|DBAEUR03FT032:EE_|DBBPR08MB4251:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mj8jvFR51X9HKNeJHJ91IOhiWsOfPmnjc8PJcYomhQfM2yHkcx+MGgD54nxiBbrdqx3Lpd0N8A+GL4ZiMB52Yyq4ytcrR2meVPnxVzE5QeFXNx02kFwB7ggDX2xjWpPIdwoZBYbAk5G+22ihqw3oVs5C66wHWFjr2vPTxWnku4nOhm0VTw9LND0Elhb41R8CJxzKS9MvpE4tb91Y0oC6fLcJf/r0aWR/SKXBS4Lb+ozLXcyuH9zakWIJww1ZB/KQEJggBjEsQztMNxOAK0e9DrKXiCdT19j/3yYNEjKVNl7rOE0t1XZE7peQ99aFNxhgauF46LlKKbkdmYSjiq0XGncUJKVONRvejR86PuPWD+HEz5R68eRJpQzxq06ImekunYeafm+dq+5TT/qha1XaWIYgyHWiFhplwlj2TF5zoTUke2QY0Hu0+9l+sG5MgQ3jHSfLNYXup9MTN8WXKAd1MW1HaKBDFytKiNU7J1cnvc39pA3osFYuJ9l7CFBPqYjIcO7NVwbRh2sltQXIYriZDJ8rrKV57Cpm9zFv+3OTWuvJ0EzRvq6k5HY1s+70SnDPyV1JYCaOtQX0XovAMzx8/6N6bjVzpBfBEkV+kRBvTQ23F1GevL4cjelENr+pXNELp2lHgIjcIPtLTfFxF4ZZHXzdUjSXV5LkcqwoJU8NAPy+bEqzhYjTuxN6Jb1s8ObnXG3aOACHRljDeISk7UedeGfm/Z+iV15XP/Rt2zvlh86zVDA9ueLgmQajY1LhdJDmTY3eEXLvP9rHq4jEqmibDz2zau7otdqm/nxenRktu6qjVIY4JsqL+IX0shn0+/oKzrW5ShZ7Wz1QaeC7TdOwDSBAZMOEUcZFYMBOuoy1i+8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(2616005)(66476007)(66556008)(2906002)(41300700001)(4326008)(31696002)(478600001)(8676002)(5660300002)(6666004)(86362001)(66946007)(186003)(110136005)(6486002)(7416002)(8936002)(26005)(6512007)(53546011)(54906003)(6506007)(31686004)(316002)(36756003)(38100700002)(83380400001)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3451
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4fd6f35-b16f-496a-0126-08da694ecb1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F0/azdG2x5aVzb4E5l3ONu8vrul1NtukelL128bknRhoGqJ4XAEZI78Q/SbkJEndTAskG9TS78hClxQTGXCKh3/vG7eF2ZtDCZEygeSN8qR6fMN8s9yfoNQGTtM37+JyfjetAnz5twsNSsgTmXshX8AebMghuI4W5EOavG+q5PEgZhyd2oNzcyDZtf3SMKVRW8nG29Tk9HzI+UhVDXdXt5v44/PKxundZza3YKdoSjQbmdsuWHAdCJUNqBYWFj1SpUXgwdYiQJgMW19JiLkEyOgojxnGtsVatO7AeIsFHfFxFLmk+Dm1FxxE1ESBAHLE2UPfA7XRRrwjTMWQbq7GsrllSBtgNBvz4fagpaZJQuA8kH9Ig/PFqriWaM59DhHUxwvGDya4/cLWilSezjDgxio5xE1+i2uMwtxAVzlOAfEPYN6Fz7JbS8NJfdZ17uSXEXTJpT/w+RatjeN+Jp00leOtoaPdoytaa73HNlkxUzPaRxG+FKzfyohRMDm4hEFHI24dOHNlxjR3M5vcyjy7CnzPs3MgP4vsnKdBznwK2ozR6/2I4TfdATXosQF5Bzk7kz4e0rRPUhl1XYbusyd5Y5bZnmbUhCM2LdwUIPOeurboic3zA+EJExKvx/yYRnFRRo1xCc8XxH9UP4NJ4vpMXbOMgNaOEYBkhiDgeE8js8q7L635K5yemCVuwhg11bGyP1RuYdYmAKUDEtz5yZFj4vg0DtNz4VHjprSVMw+bhtDjbZIqLocRryfSxkpICLrPzRJmbxXV8E3PRfZhbkC6hb2800eHjg6ml37B+zoM9G7oHkIUjxXluqn6kC8kpooWEL5v9ztNrnxsPsYpMqAGYjKYO69h2DxYM1I8KtvF8o4NxUxZYEPqH4kKXqSTf2TB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(40470700004)(46966006)(83380400001)(2616005)(47076005)(336012)(186003)(36860700001)(5660300002)(81166007)(356005)(8936002)(82740400003)(31686004)(82310400005)(53546011)(6666004)(40480700001)(26005)(2906002)(6486002)(70586007)(478600001)(41300700001)(316002)(40460700003)(70206006)(4326008)(54906003)(8676002)(110136005)(86362001)(31696002)(6512007)(36756003)(6506007)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:20:44.5715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d531fc-ab2b-42c0-7d1a-08da694ed014
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4251

Hi Volodymyr,

On 2022/7/19 5:15, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

>   
>       if ( !use_msi )
>           return -EOPNOTSUPP;
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 938821e593..f93922acc8 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -50,21 +50,74 @@ struct pci_seg {
>       } bus2bridge[MAX_BUSES];
>   };
>   
> -static spinlock_t _pcidevs_lock = SPIN_LOCK_UNLOCKED;
> +static DEFINE_RWLOCK(_pcidevs_rwlock);
> +static DEFINE_PER_CPU(unsigned int, pcidevs_read_cnt);
> +static DEFINE_PER_CPU(unsigned int, pcidevs_write_cnt);
>   
>   void pcidevs_lock(void)
>   {
> -    spin_lock_recursive(&_pcidevs_lock);
> +    pcidevs_write_lock();
>   }
>   
>   void pcidevs_unlock(void)
>   {
> -    spin_unlock_recursive(&_pcidevs_lock);
> +    pcidevs_write_unlock();
>   }
>   
> -bool_t pcidevs_locked(void)
> +bool pcidevs_locked(void)
>   {
> -    return !!spin_is_locked(&_pcidevs_lock);
> +    return pcidevs_write_locked();
> +}
> +
> +void pcidevs_read_lock(void)
> +{
> +    if ( this_cpu(pcidevs_read_cnt)++ == 0 )
> +        read_lock(&_pcidevs_rwlock);
> +}
> +

For my understanding, if pcidevs_read_cnt > 0, pcidevs_read_lock
will be unblocked.I am not sure if this behavior is consistent with
the original lock? According to my understanding, the original spinlock 
should be blocked all the time, if the lock is not acquired. Maybe
I have misunderstanding something, I am not very familiar with PCI
subsystem.

Cheers,
Wei Chen

> +int pcidevs_read_trylock(void)
> +{
> +    int ret = 1;
> +
> +    if ( this_cpu(pcidevs_read_cnt) == 0 )
> +        ret = read_trylock(&_pcidevs_rwlock);
> +    if ( ret )
> +        this_cpu(pcidevs_read_cnt)++;
> +
> +    return ret;
> +}
> +
> +void pcidevs_read_unlock(void)
> +{
> +    ASSERT(this_cpu(pcidevs_read_cnt));
> +
> +    if ( --this_cpu(pcidevs_read_cnt) == 0 )
> +        read_unlock(&_pcidevs_rwlock);
> +}
> +
> +bool pcidevs_read_locked(void)
> +{
> +    /* Write lock implies read lock */
> +    return this_cpu(pcidevs_read_cnt) || this_cpu(pcidevs_write_cnt);
> +}
> +
> +void pcidevs_write_lock(void)
> +{
> +    if ( this_cpu(pcidevs_write_cnt)++ == 0 )
> +        write_lock(&_pcidevs_rwlock);
> +}
> +
> +void pcidevs_write_unlock(void)
> +{
> +    ASSERT(this_cpu(pcidevs_write_cnt));
> +
> +    if ( --this_cpu(pcidevs_write_cnt) == 0 )
> +        write_unlock(&_pcidevs_rwlock);
> +}
> +
> +bool pcidevs_write_locked(void)
> +{
> +    return rw_is_write_locked(&_pcidevs_rwlock);
>   }
>   
>   static struct radix_tree_root pci_segments;
> @@ -581,7 +634,7 @@ struct pci_dev *pci_get_pdev(int seg, int bus, int devfn)
>       struct pci_seg *pseg = get_pseg(seg);
>       struct pci_dev *pdev = NULL;
>   
> -    ASSERT(pcidevs_locked());
> +    ASSERT(pcidevs_read_locked());
>       ASSERT(seg != -1 || bus == -1);
>       ASSERT(bus != -1 || devfn == -1);
>   
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index f34368643c..052b2ddf9f 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -158,7 +158,15 @@ struct pci_dev {
>   
>   void pcidevs_lock(void);
>   void pcidevs_unlock(void);
> -bool_t __must_check pcidevs_locked(void);
> +bool __must_check pcidevs_locked(void);
> +
> +void pcidevs_read_lock(void);
> +void pcidevs_read_unlock(void);
> +bool __must_check pcidevs_read_locked(void);
> +
> +void pcidevs_write_lock(void);
> +void pcidevs_write_unlock(void);
> +bool __must_check pcidevs_write_locked(void);
>   
>   bool_t pci_known_segment(u16 seg);
>   bool_t pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);

