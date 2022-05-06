Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D2B51CF25
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 05:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322496.543808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmoBr-0002vM-4F; Fri, 06 May 2022 02:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322496.543808; Fri, 06 May 2022 02:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmoBr-0002sq-13; Fri, 06 May 2022 02:59:35 +0000
Received: by outflank-mailman (input) for mailman id 322496;
 Fri, 06 May 2022 02:59:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5MfP=VO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmoBp-0002sk-TR
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 02:59:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d38e226-cce8-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 04:59:31 +0200 (CEST)
Received: from AS8PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:20b:310::15)
 by AM9PR08MB6673.eurprd08.prod.outlook.com (2603:10a6:20b:307::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 02:59:29 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::99) by AS8PR04CA0010.outlook.office365.com
 (2603:10a6:20b:310::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Fri, 6 May 2022 02:59:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 02:59:28 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Fri, 06 May 2022 02:59:28 +0000
Received: from c91061c06ad6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7013265-B0AA-4429-A8CC-47403CB3C494.1; 
 Fri, 06 May 2022 02:59:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c91061c06ad6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 May 2022 02:59:18 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by PR3PR08MB5802.eurprd08.prod.outlook.com (2603:10a6:102:8a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 02:59:16 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Fri, 6 May 2022
 02:59:16 +0000
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
X-Inumbo-ID: 8d38e226-cce8-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dFeD6UxjPW5hpZkbqGRygnO7yskpvf/e3q6QAvjHOmp49hlrTfMdaKdcSKSK2Hgz3KmHen7O98tSNB3qWgg7M6jtG15cvkEqfX4gfrn3nLCwhNk1V34/5zVE42NbAmfby/r7lbaUPAnt6QKzQr+t3G42YqwjrP0vTbzyhRGWkNvskBFpyAQFDimG8t149xrkx99py3v7ZTKxLARB2FZ1vFp5nFxzgdOBS9vwxCantZTs35Qe2T9xA//SWu0HN48Tppn7k2kRBAa9keQU6xoNouj5l2UzyOalANUBy8ppLHuymWEC1bwFVvAHCMHiz87H5u1voC2eRC5xDlQ3Zl8JWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doKwwuTrT5tguvTxwBYs13QeXQqQ9/7oI9wx9CW+Kww=;
 b=BHIa8Q5GEOQ7wdyCvXdI+r4wV6gI9ZzWQCuWklj8o3Il3upK2VIX1rS5VhY2T8bk8uQrpl2ySxPq/Klc6xkosJOX4+Ub7voThWmxcsJp0ctNUmf/Upinqy5S97K2pSPadGxwfIIz/SCeOR4w9eHseNWfu5o+IvGQvy4sixtD2CoSfXuDikuq0/qOQtQS0SmDgXB7Rq1+h++Ysj5Dczu2/hDYlbTlXmRs05qvjt43cU5FqcwX0u1V/iZsfNLtIQ1NRJxko59GjLQPs5cMtQApg4QBJbQSkrwpj/yxjfmCIgNFI2ohl2LBunP+loPBkiztJYGcM7ULm7FX1ksSQCZNZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doKwwuTrT5tguvTxwBYs13QeXQqQ9/7oI9wx9CW+Kww=;
 b=7DrQa8oSZsslZ8ceQYuMVk2yVDyjaHK7pFSFLZpWXw1ZuFf5YmwnX+DV8lfQSnalm8HtugAx2mgAF1c6xmAjGl/fYwoggRL4VPlqVF0Bmkk704115BUYbzG2NHDgD6uV7BJSpBxHIDQZmHONs0kZlC0gw3n8IN8JjPk399L70qg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muLQIFPgaPXvY5qMMGXJDJyW+TgAryxPSqO+TUPDxemf90dP55sLISdtrluzZ6IZPm6KJII5ASEn/ODrreETwyDIMIqSoty7SOb55Apu0bgAwt39yPT0pJp0wYjcKkyYl6hg1dAObOnIg2FRC6gqwkJetDS8FWJ66z+1svBnp/NOSiVWSH+rijgNHLlW5Lys4p81sh8z0YYjUIJDIp2XYo063AnGJLymq75AYE5GhqD+i9Di1gLtESBnlZHgjw0BMImABBDqMFGxy8zDMwt3XAxj5+lcQO9yafQO7frYVqg256LSmBnnL1xT/QidAmwfU9dm8/mbKSgaLIdCIgXg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doKwwuTrT5tguvTxwBYs13QeXQqQ9/7oI9wx9CW+Kww=;
 b=NI6jK89UhRisb8ZjxmXDwPArL9rwnGZlZzv5XkyEFaCNKv+Mbdp3Gveb7sao7XzArvVDlGfwR/OOODedW9dkbmwvTYjFWsnufn+hhcl2m98NG2jBl7qc/agwkuOJ6zY2AB/T1MTeYF5SJNYX8UHeyVBIP2eIt548OODWUNKyE1zTmdyQVYgDlV5NwVcxVd/gyLr8MPPDmD3V4GaUS7/n4zSCjUuyvKF1LGYJ10+V/AHSEUxUJIU3D0jK/rkRTZXtlqULVfrUqLA4P9lzekKNkdHWFEA09WZ1cJaN805//o7qcoh0ILA2Rj4AjHBHx6iPJsauRFI2cODn1QbjoGXz4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doKwwuTrT5tguvTxwBYs13QeXQqQ9/7oI9wx9CW+Kww=;
 b=7DrQa8oSZsslZ8ceQYuMVk2yVDyjaHK7pFSFLZpWXw1ZuFf5YmwnX+DV8lfQSnalm8HtugAx2mgAF1c6xmAjGl/fYwoggRL4VPlqVF0Bmkk704115BUYbzG2NHDgD6uV7BJSpBxHIDQZmHONs0kZlC0gw3n8IN8JjPk399L70qg=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Index:
 AQHYWhlFOdBlNRd7J0aYNs5h64D4UK0OxgEAgAEVjwCAABi4gIAAB8rggAAKIYCAAAcaUIAAL5+AgAAR4BCAABRbgIAA0kVw
Date: Fri, 6 May 2022 02:59:16 +0000
Message-ID:
 <DU2PR08MB732520F0DC6CC52DD00FE481F7C59@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
 <DU2PR08MB732544E17B308416A77C97E0F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6ee0b5b6-e099-c17f-48df-58ba1deb4066@suse.com>
 <DU2PR08MB7325CBB8EFD65D2BB64E92EBF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <306532fc-939d-efdf-047c-7b8556d40738@suse.com>
In-Reply-To: <306532fc-939d-efdf-047c-7b8556d40738@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 293709D9FBE14C4DB06254B893466E23.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fa37f831-95b5-4344-890f-08da2f0c6fc4
x-ms-traffictypediagnostic:
	PR3PR08MB5802:EE_|AM5EUR03FT030:EE_|AM9PR08MB6673:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6673E4084F65604FACF7B6CBF7C59@AM9PR08MB6673.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bE9PzUA+m5mCInEOrSEuLNHzlLe3t/ucvhg/Fs3CcCKI+G1f59ZdZqyFxhjPMsMKqRkZMpt5Y88FV5wvjJSbbwkTQUZdFql4ZNPlC/pjW/Xg5tC6ICVm1Tm3Gq+sqSuX63955QhTljAgMDjFg8ZutZ3Hn0u1BYP4NiVCIgl0H84Hfle8GyjunTazpMN7Mj6AY5nK+DNVZymOfmis8YGnnEo+C7/M+wFugqsWdGjlXs1x9gY5RoF30am1qaJxdelVEbmH3B2WbJXaadDI1DqIKCaDvtihDNOFgOgRe4NrBm0G50iAV/n2KDBuWVkJ1iNarkv9C56/sVJaZHJpNn2yARRU+1AgjKtVGS0yx544PsUejmIo4pTmJ2llVHPHo4SKe8p6Ajmv+btW46dsiyk5Wz5GS6ZonH3vE0WlHJZybzv5pOpC2/uYTrGhHpDf6kejURXysOGuCSqU39DajhvqGabw3VBpSOl9taC3OOYmOM9inNBGr9VN8cXq2GvKnw33wo8hB7o4v3zW+9K8W2ITSHKuiDlnKjd/9wR7Y3NAkwNQt1hOqMntDAR1fmeTy83dQ/j/nbuZtp+X8nTfrO/Xdq6KRsn78Lfoyz4+RxHBaq8XfRVKPDt2AEZ3qjFylVlXmPqLHurwE3OrWpj8Gxsbsw3bWrjbvi882lNmSZdlABvaIaCfjKrfrsMuoFmN0MPdl3bbnK4PP8r5YV3L+dhQSkZBXiy21s8d/K48ZWhh8Pg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(7696005)(6506007)(9686003)(2906002)(53546011)(33656002)(86362001)(122000001)(38100700002)(38070700005)(83380400001)(55016003)(8936002)(316002)(6916009)(71200400001)(52536014)(508600001)(54906003)(5660300002)(64756008)(4326008)(66446008)(66946007)(8676002)(76116006)(66476007)(66556008)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5802
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	03bf6b2f-e7d5-4502-1fa8-08da2f0c6852
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZbH0u77rXfWwUmJKbdrDicOphobB2HOgriLp/8DkZ/O/1JG697tHybZvYP6gUNN8vbZQ7Ft5ECAw/5rquuTt36g4l+v3w8+2+CGmyCZkO2WVbsm98u7+wOgNFTg7lR+JLTYXX+zxRl70Q48LqOeXnI9U5YREhVWXqC+YJRKcAbklIRFEqB+yG7UmSZnQkXJN2w/5E7xPM3VywX0WiI+aQsLTIHF7wHeXkho6V4gYcbPy6DpI96Wk5OSQWiOiIFjT2M6l9UfFiQuytArkpPdZxjIDEAmD6RYj5Rij4pdIW8L9eWXUw5K6g+TSQAsNU1pnMopFuap2SKOqiGxqc6eU38UTIYls+v21MdsmJiG7yBBHAe1r2NGmfDf+KXUQZIIp37/DNcK1pe4uEVoiBoLOx5zUYeffpnDBxSrfntvMqpIp7fuDi/3zgms6dyMW4l8BHLADX5pBuhPTlMUJAmzdm9GDpUf1aGaDhNthh4qV7xIc4WRcUdKFagssPsqtTVMQE2XN8cIUbpsMaPgNPmkpjLnTHKSEmR+QqDaMSKChM+sS+87qTQr+7WrXmmH5ziOBVf78I+dVgegx7D+ZSFMLAFbZPx+b5yP8Ubl0xB9HsRg+iiX7YWwrcIY9Mhwbdk1gOiKzYeqPYt4N1TCInqcWLkWlE+bH9ORomgIWCaCTiuw4OF8Hz2J5zKZbXlXZLv+FlZxiMkVVGk21MWrAOZcOHA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(5660300002)(33656002)(81166007)(53546011)(508600001)(6506007)(54906003)(336012)(8936002)(47076005)(52536014)(83380400001)(26005)(356005)(36860700001)(9686003)(2906002)(55016003)(8676002)(40460700003)(7696005)(4326008)(6862004)(86362001)(70206006)(70586007)(82310400005)(316002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 02:59:28.6985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa37f831-95b5-4344-890f-08da2f0c6fc4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6673

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDUsIDIwMjIgMTA6
MjMgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzogV2Vp
IENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+
Ow0KPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1
bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNi82XSB4ZW46IHJldHJpZXZlIHJlc2VydmVkIHBh
Z2VzIG9uIHBvcHVsYXRlX3BoeXNtYXANCj4gDQo+IE9uIDA1LjA1LjIwMjIgMTU6NDQsIFBlbm55
IFpoZW5nIHdyb3RlOg0KPiA+IEkgbWlzdW5kZXJzdGFuZCB3aGF0IHlvdSBzdWdnZXN0ZWQgaGVy
ZSwgSSB0aG91Z2h0IHlvdSB3ZXJlIHN1Z2dlc3RpbmcNCj4gPiBhIHdheSBvZiBzdHViIGZ1bmN0
aW9uIHdoaWNoIGNvdWxkIGJyaW5nIHNvbWUgb3B0aW1pemF0aW9uLg0KPiA+IFRoZSByZWFzb24g
SSBpbnRyb2R1Y2VkIGZyZWVfc3RhdGljbWVtX3BhZ2VzIGFuZCBhY3F1aXJlX3Jlc2VydmVkX3Bh
Z2UNCj4gPiBoZXJlIGlzIHRoYXQgd2Ugbm93IHVzZWQgdGhlbSBpbiBjb21tb24gY29kZSwgYW5k
IGlmIHRoZXkgYXJlIG5vdA0KPiA+IGRlZmluZWQodXNpbmcgc3R1Yikgb24gIUNPTkZJR19TVEFU
SUNfTUVNT1JZLCB3ZSB3aWxsIGhhdmUgIiBoaWRkZW4NCj4gc3ltYm9sIGB4eHgnIGlzbid0IGRl
ZmluZWQgIiBjb21waWxhdGlvbiBlcnJvci4NCj4gDQo+IFRoaXMgaXMgd2hhdCBJJ3ZlIGFza2Vk
IGZvciBjbGFyaWZpY2F0aW9uIGFib3V0OiBJZiBzdWNoIGVycm9ycyBzdXJmYWNlLCBJJ2QgbGlr
ZSB0bw0KPiB1bmRlcnN0YW5kIHdoeSB0aGUgcmVzcGVjdGl2ZSBjYWxsIHNpdGVzIGFyZW4ndCBE
Q0UtZWQgYnkgdGhlIGNvbXBpbGVyLg0KPiANCg0KQmVjYXVzZSBib3RoIGRlZmluaXRpb24gb2Yg
UEdDX3Jlc2VydmVkIGFuZCBpc19kb21haW5fdXNpbmdfc3RhdGljX21lbW9yeSBhcmUNCm5vdCBn
dWFyZGVkIGJ5IENPTkZJR19TVEFUSUNfTUVNT1JZIGluIHRoZSBmaXJzdCBwbGFjZSBpbiBhcm0t
c3BlY2lmaWMgZmlsZS4NCg0KPiBKYW4NCg0K

