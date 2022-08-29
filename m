Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A15A47C4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 13:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394541.633985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oScVw-0007VI-1j; Mon, 29 Aug 2022 11:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394541.633985; Mon, 29 Aug 2022 11:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oScVv-0007SY-V6; Mon, 29 Aug 2022 11:01:07 +0000
Received: by outflank-mailman (input) for mailman id 394541;
 Mon, 29 Aug 2022 11:01:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emil=ZB=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oScVu-0007SS-1E
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 11:01:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df627671-2789-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 13:01:03 +0200 (CEST)
Received: from DU2PR04CA0246.eurprd04.prod.outlook.com (2603:10a6:10:28e::11)
 by VE1PR08MB5759.eurprd08.prod.outlook.com (2603:10a6:800:1b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Mon, 29 Aug
 2022 11:01:00 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e::4) by DU2PR04CA0246.outlook.office365.com
 (2603:10a6:10:28e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21 via Frontend
 Transport; Mon, 29 Aug 2022 11:00:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Mon, 29 Aug 2022 11:00:59 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 29 Aug 2022 11:00:59 +0000
Received: from e54c457a6410.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E358338-E7BD-444E-8287-BB61AD7A4EC3.1; 
 Mon, 29 Aug 2022 11:00:53 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e54c457a6410.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Aug 2022 11:00:53 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB4PR08MB9335.eurprd08.prod.outlook.com (2603:10a6:10:3f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 11:00:49 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 11:00:49 +0000
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
X-Inumbo-ID: df627671-2789-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SlxCmYUJdj3McKug0Ty1C8cXL/t6Lf5TkwAFyy3PgV94fqPmmI81bX3JUERkVlmQzPBQ977YrK9s76LdTx/oLthyO2Cj5CbHcOZRgLN15HwdCsjvaM200FQqYk1MFVQjv1u9ul6a8BaR0Ub4owmby6Z88V7CKiBPNs5gS5miT6azUEq+tgVnKJiX45zW+pV5+rcJPVVqafbFrwlzJbR1ePMGl1zhS/oM2kdLakfQW6qjLqhHXc2GEA04jVm0UV97VeQbJP0Yxq6kN7FQn4UxAAOI7JBZP6Ua/xH9gu92WdCyD3KUSYJKExSIRC7+Oobq0oAMyIAY2D2hJmvVtBx40Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UwQi4O/S8DZ6YGLHN3qRr1q7Iij+fZKO3tGV2Y8x6g=;
 b=h+2RkjdfjfiTzQzlUxgbnSmbGAIoTXmvrv5sAETgl8MLOEqbNAFKcSb7jNNt9Ls8mdcKp2BUV4nUYELhRYyuemjg4QhtPxuenaazyMfldCtJDMR9IqtX6k5pgddgI3BfYY/2Zm8QLQau+5zUCbGAWx+UTLAM/EpCVkkZ0I+jL4xA2e08ymU0V++/i1aLH/sk2EpysEiLrVYU+d9IFKW3rymt+APDqT/IR/Hn9aO2ZcKeXMAz/AweLRHOIoukKW65ZhZdn4ReMdlbJILOHeR72qgh8/Zhy9P5cgRVXeEMVlhcfpr+49IXxggNg8jOgEb4JVUr6iyaQ2s3Bx9JzRndzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UwQi4O/S8DZ6YGLHN3qRr1q7Iij+fZKO3tGV2Y8x6g=;
 b=ViPpWOgFqg4eBroBI5IW3E/bdF7iSB3+2y/csgv08d/C/vj5MEOXP9UAX11zA9Tsfb2Pm5fbsd+pvnHMpu6IPTtZb6HeYIGAA7TvHGS/qSBtcG0/F9VrzGpHVtnZ6nwFZD6/DEO+4wIaLiSwDloZqLI1XW4YXegcFbLzLkqvRXs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUiF5RRKdJIJm/uidyNr/+597hiG7qrMhwjVQ1Xnag5AAH6g8dJXVT380wO+poFk6e2vt/hcGHvq9u8bC29Zck/RNS3JARi7ljl285pKtkUN/kjv2b3slvloZguHnku4uJpAsXtfd3Z8J9M63C14zb2Px9pcZvXMFDM9KlkZBPgwNH86GhUytXcsgNxNhAc5XVT1R2tAARAF3VsokY0sxpGo4hF8wJHBnEZ3OKTJJe6IkHE8vGB8BJsxkZlnIRTQYDJ0w/db1V514fG4qj4gBxrolUv2X0pRrtCrLUvQF1dkzlaopvHz9+gD6IMCuqRME5rRPDZsI9UgkDyvFr8hpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UwQi4O/S8DZ6YGLHN3qRr1q7Iij+fZKO3tGV2Y8x6g=;
 b=DFQPbV1X/7TuaXq9eg39q6jOqbv/ynVE3Z5WYfbpiJ6fSDRlFnwfYO16M0W2s7GQJY8DfpsMzhlGZonQlQPMzDI9MbXYrNOisNma3pKv2/JGStOvkveNNI62vdldn5a1YrurPYYMgZe6mW7trxDucUR++fOruE8quVlUv49acYQ3MEJge/dMuy5Io0atooT2487j7r8x/LX8P88PNYbn6dxlfxmQXGaCgW3c8qW8kh0E3IhaqPMehAv1jqXT9BzOSsbNgMIU8stqm9SgvZ6pjjbb/OL86AQ9PHQnbjxvPcuVShLma2oMbLl7V1FydyeTMNfmD7qqp70Y/NHL1XFV/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UwQi4O/S8DZ6YGLHN3qRr1q7Iij+fZKO3tGV2Y8x6g=;
 b=ViPpWOgFqg4eBroBI5IW3E/bdF7iSB3+2y/csgv08d/C/vj5MEOXP9UAX11zA9Tsfb2Pm5fbsd+pvnHMpu6IPTtZb6HeYIGAA7TvHGS/qSBtcG0/F9VrzGpHVtnZ6nwFZD6/DEO+4wIaLiSwDloZqLI1XW4YXegcFbLzLkqvRXs=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 6/6] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Topic: [PATCH v3 6/6] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Index: AQHYtdM4QhyibxNRjEO8vG7DwdZxva2/myoAgAYjkjA=
Date: Mon, 29 Aug 2022 11:00:49 +0000
Message-ID:
 <PAXPR08MB742006DF3B08D2E74CCAE3AC9E769@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-7-wei.chen@arm.com>
 <33d061fb-5bb9-f9a6-458e-23909d306580@suse.com>
In-Reply-To: <33d061fb-5bb9-f9a6-458e-23909d306580@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C868AA3F2D565E4F990F098E642196EB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 84a8c56a-3317-479b-70e3-08da89adc18e
x-ms-traffictypediagnostic:
	DB4PR08MB9335:EE_|DBAEUR03FT038:EE_|VE1PR08MB5759:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7AukMDOhL+ezONht4hkpBepaBcsQ6A6J+oEBr4tT84xpQc2T+4tVHxj53ZZGFp11DVRJzO94soMaMJaXFkbBt3WZObue62TvYXZ+/z9FppOJTUbtKPT3kk6WOAJJJzXk6DtOCo/Wc8Es8v3FbL2GVXM6wmmdhivm5nA9Lz8k8ORsr9wJw4d4F7F5K6FpXRa4UBBuSU0VZEkBP9GzxRqgW08W2BUSYseb/unnuRlgcVs0pOdZeqJZdf3ZoQXy0Hy9gBNmnb8NDmg46EXew9U+xsUJTzJcIeXEbXfEYW5G1i8s9GmvavjfO29WWh3RR7SptcvtL68s5cbuk8VMgHPL//miGN7b3IBqyEs7lgY+VGGzJejLF9jwoIdnylqPUAAUNbTJVL/GOZEUGsagHjm4y83l3udkaZ0Bst25mOcXK22FknSmTVHyLICxP53koz+zd5/nN50DTUVqEYE9EvXJmzWpU823z2xJ3Tb0F1ahINlpQD3ruCDgqdg+p+a9uWeZ8nUu06up35467HpFgxCDEh+r+ulRmweh/Ecm4qGO0BfAoD4/MT1XxD7nOJXehyCwHGd7mnh1eMdCmqjoIZ1Db+qqzGrQzZr1behQc1RaGeoIQTxmEAUoT+jeGg46JWeb9CSnGcnz/0ODgWx1PnSZwEb+UrAv6frhb+WF7WHE9A2+cWBuIyRWyKNBrTDqgC65bbeV9ILmDjpFF1DFWgTt3VuAGWoowYramEXO5kG/pA3hwcpuEwvDd84hFFS2OG0YFlZ0dqwL8zUYuYPPYuVuqg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(66946007)(8676002)(4326008)(76116006)(66556008)(66446008)(64756008)(122000001)(33656002)(38100700002)(86362001)(38070700005)(83380400001)(186003)(41300700001)(7696005)(53546011)(478600001)(6506007)(26005)(71200400001)(66476007)(316002)(6916009)(9686003)(55016003)(54906003)(2906002)(52536014)(8936002)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9335
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b208eccb-b923-4299-e1d8-08da89adbba2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yLuy6wfzoTv9r/mkGT5j+0jrMzW1lvxh1vrlAYvdQMIjeKRq/njK5mTg3CAnD5YLD1cKzEKlQtM4Axfzju9Ts4OeRmQOUIR4JQk1epqJdUlC026bl1H5ZjvpLvAzQkT3Vew5MlGwVOwbI9U/RkXgWFA2Cq9VLFR9HoagrNz/hUtWt0pNshF0YNbRMREwgGQrV/V336A+4QhAHRBnQddMs8IAlYhI/ZjT3zdHRFsbYIEBN8zIxbtrDXHgXOB8/+iWp/LgOJ8M47TG1GVGu+MFQzpnB3KG+2AZVCjnrM2Hsx259q0UTZ0f7jVcxSKQ/q97ZkFM56y27ziHx/2+Kg6vAdu8U4OFHhpDq6sCVkC4nrv3m8kAFOBUEzLUwiKgpaZzNiH/k1a16MCVWSiB77irsMI9TMBZu62jaslhu2RXuxfRLYSgLshBtUdHBVgphG8JMrL1XPVun5h/+udnvDWVonsrUb0BSwnFZNJgzLMbTV+iuf/dzF/z9uY+d45+BgRYnmDpr/NyySI+C7Li8vM+OS4rNYrUxiFe9Viu8j2z74Jqb+KXcnwQ3lQMLrNxhTWQP5P8tcKAU/YZU52r+O48/Vf07e/MAuM6dl9ZNcduuDE2jeKgGxlVgmBCekCxdGbOPOKmu/GJn3KtBkY0ocsMZsGWEydfd1ZJ/b0XuKSHXfcfvIbLsDEPOBYiZCf1NcabhTQoTraze9fXY5kD5ffWa5kfy0mYYTyQUK+rNj1vmzmTRxWL6voOQDajI2ufvPq0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966006)(36840700001)(82740400003)(316002)(82310400005)(186003)(86362001)(81166007)(356005)(54906003)(55016003)(6506007)(36860700001)(83380400001)(2906002)(53546011)(40480700001)(70586007)(70206006)(8676002)(4326008)(336012)(52536014)(478600001)(7696005)(33656002)(9686003)(47076005)(41300700001)(6862004)(26005)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 11:00:59.6031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a8c56a-3317-479b-70e3-08da89adc18e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5759

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDjmnIgyNeaXpSAyMTowNg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UNCj4gRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjMgNi82XSB4ZW46IGludHJvZHVjZSBhIEtjb25maWcgb3B0aW9uIHRvIGNvbmZpZ3VyZQ0K
PiBOVU1BIG5vZGVzIG51bWJlcg0KPiANCj4gT24gMjIuMDguMjAyMiAwNDo1OCwgV2VpIENoZW4g
d3JvdGU6DQo+ID4gQ3VycmVudCBOVU1BIG5vZGVzIG51bWJlciBpcyBhIGhhcmRjb2RlIGNvbmZp
Z3VyYXRpb24uIFRoaXMNCj4gPiBjb25maWd1cmF0aW9uIGlzIGRpZmZpY3VsdCBmb3IgYW4gYWRt
aW5pc3RyYXRvciB0byBjaGFuZ2UNCj4gPiB1bmxlc3MgY2hhbmdpbmcgdGhlIGNvZGUuDQo+ID4N
Cj4gPiBTbyBpbiB0aGlzIHBhdGNoLCB3ZSBpbnRyb2R1Y2UgdGhpcyBuZXcgS2NvbmZpZyBvcHRp
b24gZm9yDQo+ID4gYWRtaW5pc3RyYXRvcnMgdG8gY2hhbmdlIE5VTUEgbm9kZXMgbnVtYmVyIGNv
bnZlbmllbnRseS4NCj4gPiBBbHNvIGNvbnNpZGVyaW5nIHRoYXQgbm90IGFsbCBhcmNoaXRlY3R1
cmVzIHN1cHBvcnQgTlVNQSwNCj4gPiB0aGlzIEtjb25maWcgb3B0aW9uIG9ubHkgY2FuIGJlIHZp
c2libGUgb24gTlVNQSBlbmFibGVkDQo+ID4gYXJjaGl0ZWN0dXJlcy4gTm9uLU5VTUEgc3VwcG9y
dGVkIGFyY2hpdGVjdHVyZXMgY2FuIHN0aWxsDQo+ID4gdXNlIDEgYXMgTUFYX05VTU5PREVTLg0K
PiANCj4gRXNwZWNpYWxseSB0aGUgdXNlcyBvZiAiTlVNQSBub2RlcyBudW1iZXIiIG1ha2UgdGhp
cyByZWFkIHNvbWV3aGF0DQo+IG9kZC4gSWYgSSB3YXMgdG8gcmUtd3JpdGUgYWxsIG9mIHRoaXMs
IGl0IHdvdWxkIGJlY29tZSBzb21ldGhpbmcNCj4gbGlrZToNCj4gDQo+IEN1cnJlbnRseSB0aGUg
bWF4aW11bSBudW1iZXIgb2YgTlVNQSBub2RlcyBpcyBhIGhhcmRjb2RlZCB2YWx1ZS4NCj4gVGhp
cyBwcm92aWRlcyBsaXR0bGUgZmxleGliaWxpdHkgdW5sZXNzIGNoYW5naW5nIHRoZSBjb2RlLg0K
PiANCj4gSW50cm9kdWNlIGEgbmV3IEtjb25maWcgb3B0aW9uIHRvIGNoYW5nZSB0aGUgbWF4aW11
bSBudW1iZXIgb2YNCj4gTlVNQSBub2RlcyBjb252ZW5pZW50bHkuIEFsc28gY29uc2lkZXJpbmcg
dGhhdCBub3QgYWxsDQo+IGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBOVU1BLCB0aGlzIEtjb25maWcg
b3B0aW9uIGlzIG9ubHkgdmlzaWJsZQ0KPiBvbiBOVU1BIGVuYWJsZWQgYXJjaGl0ZWN0dXJlcy4g
QXJjaGl0ZWN0dXJlcyBub3Qgc3VwcG9ydGluZyBOVU1BDQo+IHN0aWxsIHVzZSAxIGZvciBNQVhf
TlVNTk9ERVMuDQo+IA0KDQpUaGFua3MsIEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBsb2cuDQoN
Cj4gPiBBcyBOT0RFU19TSElGVCBpcyBjdXJyZW50bHkgdW51c2VkLCB3ZSdyZSB0YWtpbmcgdGhp
cw0KPiA+IG9wcG9ydHVuaXR5IHRvIHJlbW92ZSBpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiANCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQoNClRoYW5rcyENCg0KPiBOb3RlIHRoYXQgdGhlcmUn
cyBhbiBhbHRlcm5hdGl2ZSB3aXRoIGxlc3MgI2lmZGVmLWFyeToNCj4gDQo+IGNvbmZpZyBOUl9O
VU1BX05PREVTDQo+IAlpbnQgIk1heGltdW0gbnVtYmVyIG9mIE5VTUEgbm9kZXMgc3VwcG9ydGVk
IiBpZiBOVU1BDQo+IAlyYW5nZSAyIDY0IGlmIE5VTUENCj4gCWRlZmF1bHQgIjEiIGlmICFOVU1B
DQo+IAlkZWZhdWx0ICI2NCINCj4gDQo+IEJ1dCBJIGNhbiBzZWUgcmVhc29ucyB3aHkgb25lIG1p
Z2h0IGRlZW0gaXQgYmV0dGVyIGZvciB0aGVyZSB0bw0KPiBub3QgYmUgYW55IENPTkZJR19OUl9O
VU1BX05PREVTIGluIHRoZSByZXN1bHRpbmcgLmNvbmZpZyB3aGVuDQo+ICFOVU1BLg0KPiANCg0K
SXMgaXQgYmVjYXVzZSB0aGVyZSBhcmUgbWFueSBwbGFjZXMgd2hlcmUgYWx0ZXJuYXRpdmUgcGF0
Y2hlcyBuZWVkIHRvDQpiZSBhZGRlZCBmb3IgI2lmbmRlZiBDT05GSUdfTlJfTlVNQV9OT0RFUz8N
Cg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiBKYW4NCg==

