Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8F58098F7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 03:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650328.1015776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBQE0-0003l9-BJ; Fri, 08 Dec 2023 02:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650328.1015776; Fri, 08 Dec 2023 02:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBQE0-0003iK-8D; Fri, 08 Dec 2023 02:04:20 +0000
Received: by outflank-mailman (input) for mailman id 650328;
 Fri, 08 Dec 2023 02:04:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBQDy-0003iE-K1
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 02:04:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2059.outbound.protection.outlook.com [40.107.13.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17dda796-956e-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 03:04:17 +0100 (CET)
Received: from AS9PR06CA0624.eurprd06.prod.outlook.com (2603:10a6:20b:46e::27)
 by AS8PR08MB9886.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 02:03:47 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:46e:cafe::76) by AS9PR06CA0624.outlook.office365.com
 (2603:10a6:20b:46e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Fri, 8 Dec 2023 02:03:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 02:03:47 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Fri, 08 Dec 2023 02:03:47 +0000
Received: from 382d63f3655d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C133F798-4A5A-4029-ACAF-23CDFB789EA8.1; 
 Fri, 08 Dec 2023 02:03:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 382d63f3655d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 02:03:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6683.eurprd08.prod.outlook.com (2603:10a6:10:2ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 02:03:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 02:03:38 +0000
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
X-Inumbo-ID: 17dda796-956e-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bFosfbhr+ViiyPW2ku3XkOR9TydiZyS5bdS2ymnoouZaaSULtIJlM+sFZ6LTJwEgI5FzE6K2SXFHWVGpgi1rbTowlQUbmecl3x8SSzjRYyZaImYDd8SpiOMxhMmqF5uZJMoggrPwVjfQOgs3pY5VRd79hMLPrVWQtS5dWdqKrHJf4/OcPHtxkcpw3fUgEdQHXgdorlcDPRxOeSKzlnHb0XpLZExwGE4osf6MUDMi+v+8o8+F4YCLjqPgFx8rOgHg1UA8X/maMQf0ngblScStmlSb1r5mHPeB7Jhwgbl1hhd08HEayjiAtD0q+C8Ay6a6hF6PnJUEjyLpyHEA113lOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yDdnjYY8SRcq+Lgzn0MCbOIasGqyqgSv4HG62GMTAo=;
 b=FjSoVxUedpxX0hnqq23GfU1BZkU4mgwfIVBYCnk+ndkvEtZH5JLTR5ic5TT6Ty2q6rG3UgCB0Uku417s0jlfNoo3TjOPoVOuLeRvklhbZPO19bKfCjxh+3dflwymSUNs7vP/2jjpIkdbvM1ZMaVmAgKWksbGyx/6Ioya94YEQS61VADYbyZhDJXhw40WrDEmg/QLnKpLsaAi36JcdkiWNeeN7nSH+NMNFMgbb+YPnUtEI891pYNRtid9o/dWsJYqTP8PhdyHVpk1/6jZNob6fkYMFUPy5Lo7w8mfHGxvzR0BIG+UiFywvF6npCgp+hnKAhRebQmyiyBwgavS6cl+Bg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yDdnjYY8SRcq+Lgzn0MCbOIasGqyqgSv4HG62GMTAo=;
 b=QPwiEvXkfu0WwWjPe87lbmuvHcm2jxcmZGhwqZ+avJmw6BZwhnOB8nE8M93yQAQp7YANUS56wuC9IvkXwsmJJ4iLEcgRaUY0dg1BvVNp5z+NCccZKuloolL/m7O3Ss7ZBoh+zmOSp15xuesyJKyM59JVd5yNsP4Z4wpvJvm23Ds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09f2e58ba2f59a63
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLA/jpEsF7PpS+Gj9iz95fSFB8UDQo0Zo4WR2GbmSeeRlaJliQ5jQnIbHbkfeqauNgxhrOQk1iXzSOWvj5TGOZJhM5ZSfr+ktW9hzenjhoIsP2zwIblZMdy0PuPDs5j4sjdkQvmnqbSlojQJMVyar3JoHjIFBWn2zOlIVyWfPrdZIiEyPoXRDVI9sxrYJxW1HE3fAnPvzu+WfexwguMLktBu4myAePP75oSUozSpM3TkRmlTlv3Y6Btmy1M5JYr0uTXJ4qqQpmMIabovEPDQtHZCJxEs6tlIiYeWExdtyN4X1D7u0rX/n0f9WQ9Zj3CxuNZIPcNPKWbFSp4pCHnRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yDdnjYY8SRcq+Lgzn0MCbOIasGqyqgSv4HG62GMTAo=;
 b=cDH0PpVkpmrdHJQxYPu+N1MYsnJuBBcouW8ItjRzeN13+U+PscGcqiWX4enhQtIjEmneUhzencn5evg2Nr5O+hsHaNV5ftwcCWzVTbxY3S+newNo40AXLcWKLBVx0YkGROc5vZLhz+PViKJLsLxzmrbJM/sR97pG3TKq0TxEUzq41HtWB4c7dL60MwrHXu6LTJeGz6YDEn+bn8zxHrFAiAVdrnVp91azIHFdLImN1/XqmfvIy6VHkBC/vjb91o/isrvyX7aTxeM527ERU3fsNQJRqD4PKmEqVTiBIkiDeyrKOOMfJ2YxXqab+7f8eQ8dxXKZMZ+SCr1FrkX+R9kLeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yDdnjYY8SRcq+Lgzn0MCbOIasGqyqgSv4HG62GMTAo=;
 b=QPwiEvXkfu0WwWjPe87lbmuvHcm2jxcmZGhwqZ+avJmw6BZwhnOB8nE8M93yQAQp7YANUS56wuC9IvkXwsmJJ4iLEcgRaUY0dg1BvVNp5z+NCccZKuloolL/m7O3Ss7ZBoh+zmOSp15xuesyJKyM59JVd5yNsP4Z4wpvJvm23Ds=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH 3/5] automation: Add the expect script with test case for
 FVP
Thread-Topic: [PATCH 3/5] automation: Add the expect script with test case for
 FVP
Thread-Index: AQHaKRTRSAbthQjm9k2SM6wWsGqHurCenEEAgAAHDIA=
Date: Fri, 8 Dec 2023 02:03:38 +0000
Message-ID: <DDEC86F3-A2AA-4A34-87E5-4E91C2BF99BE@arm.com>
References: <20231207135318.1912846-1-Henry.Wang@arm.com>
 <20231207135318.1912846-4-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2312071736190.1265976@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2312071736190.1265976@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6683:EE_|AMS0EPF00000190:EE_|AS8PR08MB9886:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ef9688-e059-4984-a7e2-08dbf791ea52
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RwPSEno4g2we4oa4KV1fAth7cRf3NP2IozoXUTrpiknNptP78eUZtG4BvsIHWT/7rOxd6Ho82zzsJscygwJCweTisZ5Ts/+dfzgKvTrPodNyk9TRNoignX6orSfK1uodhuyxmEG7swg/5u84T+FvyDm0CaG9oYQ1Qygu8Z/tzh3NlB1QepSD9taKegV413FyQD1NyOY+PUuU/r3Uh2JETa4NvVhPMQN4CQc7WOkfvzS4/JirYEny5Gkr02MRl42Zm+VVkmwXT4CVQ2pNLhieyp2Fb6khKm0wj3ks+E1NvlK+t9N/RncwTug4KOrdjNxoZujmkcBiDyckmVKd+TEIldnZgWm4QH/+ihzOD7tIltI3870LRHZdF+loc3GWu8nnzZHW9jjgUu+qX2wgQYs/Xz7MzAZi85e0KUta9qFOFC7YG6xOKvv5eAXj2U1DuoRlRaZimgIfCotNXTcpybGYmMKUsA77WbIzP+4ekHgAsFJ4nE87ZfPPzRJuAfg/x7x14btM/o47Aa1tPZTUXFD3L4nE7QBWkxxN9/7URC8HBS0+e/rj/p5jVE1bfE4I5QHFx//Z4//eF2hiLx3CEnUUedTKUHMQ8vuLDWcLAj7k/OSxJEkjeownwFJJcxdzQGuV3f3UuNULnXoV9byG9IE8DbPTvxKc1kisLBsTiSG6gPhCGQUOl5lmUGxw2oMa9pul
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6506007)(53546011)(478600001)(6512007)(6486002)(38070700009)(38100700002)(5660300002)(26005)(122000001)(316002)(86362001)(76116006)(54906003)(6916009)(66946007)(64756008)(91956017)(66556008)(66476007)(66446008)(71200400001)(4326008)(2616005)(8676002)(8936002)(33656002)(2906002)(83380400001)(41300700001)(36756003)(45980500001)(139555002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ED8C7BC7134E774BB4325907AD30E3A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6683
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	38415135-3c7d-407c-8359-08dbf791e4d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xy2LmHNt+dOYvwTZJYiu7JWl8uolufC6Stqkv5NICCyP2nA9M4aTHHgwZwiaCIIPZASnXKjSeF1tT2BkBmsv6kkmzsL2zr5Kq8G2h0gJnBLSJF7eO6PyYT+kKyiE2uoF6DHKmqWHG/M3pPFF422NG+0QYB0PUfSKJLJhhMpIeTOzr8Qfbt9TmSGBJargXQCiP61EHdEPVUAeoolAe3Q0yyD/M4kE5YIkC81v62+bTZXkOEU0pk0rWQgI3SIfpLbrkxH56Cfe6ff1V4fSbwY+K1NnR51tmOrzgGEannzhKbgN2DYnB+qwAbXNIphy21A/yUUM5aqnldiAqLx+ucEYz6Wlsb54ELAYnB8o2N4H5SWeFRZ3tOWYdECPv/GY4bKDo/Adn3fqIrDbzfe3ileTibeXSFQ0zrWyPO88+wgUK7nFDzdecQwJtnfe/0Do1XxBxgWK/5GeubCt2Wfa+kGIAZ37S9rUrbtnkFnNdycTQHjUyMwcbyJv7SiWCDolKT4dqborhouZR74BXVGxl99Bl8rb+YXnVk6TEHTV+MVtft6iZNy5EtFRTShAQ84WG4hmEhlcGymkhR356L+68S/YCsebN1q7m+iHTBLzcHTd9NtM/zCt9gAI/lL/LfzvwUQOViqPPxVyVcVHo8NML0fsFPrMCzns+KUeyD8Bmbw8A92+HdTMp4LXBQv09tU9Fd3ksB8UoSmA1W8NW5FRyQaiWz29DKCRayC+/TCWi92rrOMpq41YVvrfOm2odQKHCNdGDEM20wjaOMvH/tAu7EJ7FQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799012)(46966006)(40470700004)(36840700001)(83380400001)(40460700003)(6512007)(2616005)(53546011)(6506007)(26005)(336012)(70586007)(316002)(70206006)(54906003)(40480700001)(41300700001)(5660300002)(33656002)(2906002)(6862004)(86362001)(8936002)(36756003)(8676002)(4326008)(6486002)(81166007)(478600001)(82740400003)(356005)(36860700001)(47076005)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 02:03:47.6192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ef9688-e059-4984-a7e2-08dbf791ea52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9886

Hi Stefano,

> On Dec 8, 2023, at 09:38, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 7 Dec 2023, Henry Wang wrote:
>> To interact with the FVP (for example entering the U-Boot shell
>> and transferring the files by TFTP), we need to connect the
>> corresponding port by the telnet first. Use an expect script to
>> simplify the automation of the whole "interacting with FVP" stuff.
>>=20
>> The expect script will firstly detect the IP of the host, then
>> connect to the telnet port of the FVP, set the `serverip` and `ipaddr`
>> for the TFTP service in the U-Boot shell, and finally boot Xen from
>> U-Boot and wait for the expected results by Xen, Dom0 and DomU.
>=20
> I am not an expert in "expect" but this script looks great

:)

>=20
>=20
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>> .../expect/fvp-base-smoke-dom0-arm64.exp      | 73 +++++++++++++++++++
>> 1 file changed, 73 insertions(+)
>> create mode 100755 automation/scripts/expect/fvp-base-smoke-dom0-arm64.e=
xp
>>=20
>> +
>> +proc test_boot {{maxline} {host_ip}} {
>> +    expect_after {
>> +        -re "(.*)\r" {
>> +            if {$maxline !=3D 0} {
>> +                set maxline [expr {$maxline - 1}]
>> +                if {$maxline <=3D 0} {
>> +                    send_user "ERROR-Toomuch!\n"
>> +                    exit 2
>> +                }
>> +            }
>> +            exp_continue
>> +        }
>> +        timeout {send_user "ERROR-Timeout!\n"; exit 3}
>> +        eof {send_user "ERROR-EOF!\n"; exit 4}
>> +    }
>=20
> Why do we need this "expect_after" ?

It is basically for the error handling. Either there is too many characters=
 triggered
by some misconfiguration of Xen/Kernel leading to Xen/Kernel constantly reb=
oots,
or the code stuck somehow, we have a way to stop the script instead of wait=
ing in
the infinity loop.

>> +    # Extract the telnet port numbers from FVP output, because the teln=
et ports
>> +    # are not guaranteed to be fixed numbers.
>> +    expect -re {terminal_0: Listening for serial connection on port [0-=
9]+}
>> +    set terminal_0 $expect_out(0,string)
>> +    if {[regexp {port (\d+)} $terminal_0 match port_0]} {
>> +        puts "terminal_0 port is $port_0"
>> +    } else {
>> +        puts "terminal_0 port not found"
>> +        exit 5
>> +    }
>> +
>> +    spawn bash -c "telnet localhost $port_0"
>> +    expect -re "Hit any key to stop autoboot.*"
>> +    send -s "  \r"
>> +    send -s "setenv serverip $host_ip; setenv ipaddr $host_ip; tftpb 0x=
80200000 boot.scr; source 0x80200000\r"
>> +
>> +    # Initial Xen boot
>> +    expect -re "\(XEN\).*Freed .* init memory."
>> +
>> +    # Dom0 and DomU
>> +    expect -re "Domain-0.*"
>> +    expect -re "BusyBox.*"
>> +    expect -re "/ #.*"
>=20
> This is clear, excellent
>=20
>> +}
>> +
>> +# Get host IP
>> +spawn bash -c "hostname -I | awk '{print \$1}'"
>> +expect -re {(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})}
>=20
> Why d{1,3}?

I think that is because the IP pattern, we at least have one digit and at m=
ost 3.

>> +set host_ip $expect_out(0,string)
>> +
>> +# Start the FVP and run the test
>> +spawn bash -c "$runcmd"
>> +
>> +test_boot 2000 "$host_ip"
>> +
>> +send_user "\nExecution with SUCCESS\n"
>=20
> Won't this always return SUCCESS even in case of failure?

IMHO, if things fails, we have various exit code (1-5) for each failure cas=
e. For example,
if the FVP port somehow cannot be found, we exit with error code 5. This wi=
ll basically lead
us to the only case where the failure is caused by the script fails to wait=
 for the expected
string/regexp, and this case we have the timeout failure triggered by my ab=
ove-mentioned
expect_after block.

Kind regards,
Henry

>> +exit 0
>> --=20
>> 2.25.1
>>=20


