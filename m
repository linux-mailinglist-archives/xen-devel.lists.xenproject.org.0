Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8695B0209
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401203.642994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsZ3-00005a-8p; Wed, 07 Sep 2022 10:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401203.642994; Wed, 07 Sep 2022 10:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsZ3-0008Uj-5X; Wed, 07 Sep 2022 10:45:49 +0000
Received: by outflank-mailman (input) for mailman id 401203;
 Wed, 07 Sep 2022 10:45:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gDT=ZK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVsZ1-0008Ub-GC
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:45:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a6ef1a0-2e9a-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 12:45:46 +0200 (CEST)
Received: from DB6PR0801CA0056.eurprd08.prod.outlook.com (2603:10a6:4:2b::24)
 by AS2PR08MB9427.eurprd08.prod.outlook.com (2603:10a6:20b:5e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 10:45:43 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::e4) by DB6PR0801CA0056.outlook.office365.com
 (2603:10a6:4:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 10:45:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 10:45:42 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 07 Sep 2022 10:45:42 +0000
Received: from 9ca911001989.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B3F5E63-865C-4CF5-A92C-4368EB932A67.1; 
 Wed, 07 Sep 2022 10:45:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ca911001989.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 10:45:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8314.eurprd08.prod.outlook.com (2603:10a6:10:3de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 10:45:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 10:45:34 +0000
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
X-Inumbo-ID: 3a6ef1a0-2e9a-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LyXtsKQJZSQhf6Glz4n4fQf6uTUwODkKg46zip9+jSM7tAGDutJblS9V5hwXZd2dYNHXMDMBSeMJ8tGBdjkGM9MhGe6Td8nul0kKu0sYcrMhblKMrQXVgRJnI0vv7lKSApRzR3lSki5BrNQUPfsE+QiHWscWbxNm6EzxG52756wAKlt2Q5RZZx4vtdGUa6GXxMvswWL2Zy6FJq9AYzBnsEeSZd4RQFhal4G45mFOovI74D4SDpaFPwJaKKD2pQAQ9itHPgrhJa889jDE3z6evwzMyVgAYzCBfT2KWoA944xAkq8tN+js6AzunexHMc5CYSKcYWmoyfYhiEzfrAED8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVS6KWJ3EQcyzPz7EYIqtfvTRq7OQDT6ANZPuue9gFA=;
 b=ZiMMTZUFGIVSWZSoPsLysOS8OHfS5HRlivLXGnINuPxMJxvKikLMxKQii6LXbb6pgNYk0toJCw5lJQ3XZR9IaMnZA2iueRCtUp2G6Dj9tpod/EzkfmQXfVny8+IiqVvqP3FAh2VHzqyOtBlsm9MoyK9BnFzD0MzhmuLVCd5ozpu8ML6hzNrUSYA6iNTzYZleWxJi7/EFuCmgZnJB5+91JQ3FSKLiTkByUZ2jRtsFe4EjrurRvNzKhOd3sLgGZdE82mohknF4EvSc6k4B8BwL+6+puCdTuWNjsWpSKPCRb+HYx4g7RuNrofU9t755IpK5YtX4nVnK5X4B+q+9G9Zd3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVS6KWJ3EQcyzPz7EYIqtfvTRq7OQDT6ANZPuue9gFA=;
 b=xsCpz7Blk64wDju11MFWo5lc13akMBr3hGBmahgBS73lFIVEEQ/WuPQYBPlUIUc+zEFjQwMOJJxjyAqXMC9wUkcpAeIVFYWcwOgjMZAsZ82aIuGFa4ZC2dnMiRzfaug9w0oJxlgHSpcFguQIsFPKBkgRaCRVcp/zr9IBC4MiJD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1IzgoHmrWw27ITnbq37ZECZxFYV8b2fL0ZAwf2EtmYya+lbtHv+V8qgnrXcSoCes326Ak171jmlnpMtLliyunM5sSHsBt5+OUkOGLIeQ5DhcwTcU9jYQQ2arxQnYWNhU1L8CMm39iH4qxLlT9Vik+Jpa53/hAo8PV0qhpqZcSCay8bU122V6EeP8x/UzZJntz5Up9L33HLR3F8nZRcgZCW6pw442dI2cbsfbs2yEoaHAV33y2e0L5/5t8/kcl98epFjxqfiVUl6bQ9imo/a6Xj/f6v4ZJmqsERLuxeirLlVIgJmmd/DpNoqFgXfCGqCH+Df4p0svqoqPvAcDK84Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVS6KWJ3EQcyzPz7EYIqtfvTRq7OQDT6ANZPuue9gFA=;
 b=RSioXe5rd4nNsmcBLDozeTxw7iI7MLEckWID5Z5hFbEkWBW0x9+kkyzTSS0DGX2gPOmKfTCI6BR48iOPsa5OOYAQtbUeNcVvRyV2UCLZdtgFTGggLXeIOVFhwOzqEyJGEnv+DYrZXAn762XJvCcJLoRAZhlTvTW7U/yvceDugVfOWjZJmaVoG1+BoMHqLGXz17b49ZCkQSYg0pQE8KPoBV+S/o+/XKrkTTGxIgdYQ0feR30b5YhI1qvdtiwZPwx+PaD/M0bXurPGlb7DT0TA0miQsD3HgbX/RZ2hB4s1mTtCBLX4wVrLru9HqDmq905oyi8jjt0yJ6N6Ee4YwR473Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVS6KWJ3EQcyzPz7EYIqtfvTRq7OQDT6ANZPuue9gFA=;
 b=xsCpz7Blk64wDju11MFWo5lc13akMBr3hGBmahgBS73lFIVEEQ/WuPQYBPlUIUc+zEFjQwMOJJxjyAqXMC9wUkcpAeIVFYWcwOgjMZAsZ82aIuGFa4ZC2dnMiRzfaug9w0oJxlgHSpcFguQIsFPKBkgRaCRVcp/zr9IBC4MiJD8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index: AQHYwpUJ7IYztv5II0KGaSuPgw9aFq3Twt6AgAAE4DA=
Date: Wed, 7 Sep 2022 10:45:34 +0000
Message-ID:
 <AS8PR08MB7991B7BF6CC5C7D8C63B61AE92419@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <80aa7dad-1507-d132-3652-dc65ef999ff8@xen.org>
In-Reply-To: <80aa7dad-1507-d132-3652-dc65ef999ff8@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 29FA3675AE30E14DAE1775F792351A7B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e4fa4c04-1805-4616-7c0e-08da90be1cce
x-ms-traffictypediagnostic:
	DB9PR08MB8314:EE_|DBAEUR03FT062:EE_|AS2PR08MB9427:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r51jeC/mA6hLCRjEqD9tCD/6HUioPp9msIhXdiEmNrkkGwLWfWpav6nCvoE9Lpifc3XFRmd++457FFe5m+1gbBUTscrW57sdOqmZotAi2FKj9l0d9/vF8Eib7+on1/CuG17iF60F6F5HDX5rSorzzQ8KilgHoc7GjnqAU7QUGgIE+j4Cwtd6LeT0tTAUh+qwNjjA5B+AayliuTYQDDKoI05JWnwcfV+ar2apqdKPfNdgBrvDtNV1cCvwbaO+kqYvsT3Q2dF0DBe08QZCRRWlA/EytbFGI4NQGWg7z3Me6HoPdigeDqZXWfC1fMhZ1cXfGCbhUgdmu/lVWjE6dijKeHEwj52jMT7gf9NRuAS43heLGXeR879BCjp1PRNc3sKJlK8+km27wONWvgsbqjjlAYQC0XjAjgJF/AnQ5bFdkjPz9+78hIWX+O2gf6KhwZGmMx3dTSA03rHx1jNgLfIJINl6PBKzPgj0/1+gAC2jOWb7NOcSekjqRG0OtTDzC1cNBJTWRr6zkWqRxo1xXBJ+Oed8QsZJCXaSDSskdJSDljsEpNrNjh3Hr+tt+P1FbWT1BO+PhJZeWkEwfVXQjJAVA3oq+lBGZPgtfSMe07MTn/wGoSEIE9C7wqeSBSPmqI50zfX0egGCGmf37NoGUVS+1PDGXJepKf+wNUFH7HDRp6J1wPj5gNzZ+4XbkRyKn6OTuI+hCnOB29RTmqwInp6IkjgjjnSdIb+keN5g8P26e8xDXAlL4hqu5ALprUuGrJxaQ3z5GztLD/RtCy55RAFJYg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(38070700005)(5660300002)(26005)(41300700001)(86362001)(7696005)(9686003)(6506007)(38100700002)(122000001)(83380400001)(186003)(71200400001)(52536014)(8936002)(4326008)(55016003)(110136005)(66476007)(66556008)(66446008)(64756008)(8676002)(2906002)(76116006)(66946007)(478600001)(33656002)(54906003)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8314
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9cc9310-5a71-4907-1163-08da90be17bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j92INaV53KaviKuXilZCtHjj4PmX3EtXdL7QE/SMcurvToIJqiYOsUXDyYdzo65OvuBV+iugoFqg1XWAbzoTRyMl6Nvezou3lCguS1XqdgWkNFXkoh5EKejzBeyquMl6hyp1nBTcl4dzb7zMTXwCeSXq6IdFxlsBPrnyj5soFmuuq6ID4S81h9nOZrm1VynW4EUIvoEW32lflOmAhN1ZuB+owIDs6v5V2E30ngvrhJk0bkZqKySHFFwPM74halUaNf/yG5kN1WfzOIE9N4KPkTbr9YqfHG4OOUdMlYA8f4p4QvO2mz1Hce6KcyImqrTPH8giiRw2NTcLhY3BY8xG28bsejo4IeEw+Ekg/UJyvCF0+Ob6/HJjeGPUuaorjW1xbgrvp9oDNtTEd2OM7265mESGx7S+tzaWxr7npWgDy04Oexd8H3J39Q9mdBC2fuHXS6v1h0wD2HKCOFfYs0zeu2NgEbmKTlg8XADeVdIRBpigulEfDGKO+YlQ7LvZoHjoMhVkc1SQB7vp1CKx4RjiFO6N3/rhzqMPpRQKKpJfB+tzgc/ADGdhTM6R1GHjO5rrEEZAp2JkRhUU6FxMfOU2aeaJFH9ZMh68O9aqEx5Q2rnqIk77SGbxJOU6h8MGSGfWfVqTjs++1JLU0LAcqvC6oHtXgazXbK3EmT5U2NRplJEsEg4C/C/Y7sWssjYyLYa6FmjIgxCzi3EsTxIMPOZEEsMRDvpZvz4NuVoz5ZGgCzKe9Thz6UggTPf3CpOq99vh4ejD1iWi+efOaYGcKYc1dg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966006)(40470700004)(36840700001)(41300700001)(336012)(26005)(6506007)(7696005)(316002)(9686003)(478600001)(83380400001)(47076005)(2906002)(82310400005)(8936002)(52536014)(5660300002)(54906003)(40480700001)(55016003)(110136005)(40460700003)(186003)(4326008)(8676002)(70586007)(70206006)(36860700001)(82740400003)(33656002)(86362001)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 10:45:42.7670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fa4c04-1805-4616-7c0e-08da90be1cce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9427

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4gLSAgICAvKiBmaW5kIGZpcnN0IG1lbW9yeSBy
YW5nZSBub3QgYm91bmQgdG8gYSBYZW4gZG9tYWluICovDQo+ID4gLSAgICBmb3IgKCBpID0gMDsg
aSA8IG1lbS0+bnJfYmFua3MgJiYgbWVtLT5iYW5rW2ldLnhlbl9kb21haW47IGkrKyApDQo+ID4g
KyAgICAvKiBmaW5kIGZpcnN0IG1lbW9yeSByYW5nZSBub3QgYm91bmQgdG8gYSBYZW4gZG9tYWlu
IG5vciBoZWFwICovDQo+IA0KPiBUaGlzIGNvbW1lbnQgY291bGQgYmVjb21lIHN0YWxlIGlmIHdl
IGFyZSBhZGRpbmcgYSBuZXcgdHlwZS4gU28gaG93IGFib3V0Og0KPiANCj4gLyogZmluZCB0aGUg
Zmlyc3QgbWVtb3J5IHJhbmdlIHRoYXQgaXMgcmVzZXJ2ZWQgZm9yIGRldmljZSAob3IgZmlybXdh
cmUpICovDQoNCk9rLCB3aWxsIHVzZSB0aGlzIG9uZS4NCg0KPiANCj4gPiArZW51bSBtZW1iYW5r
X3R5cGUgew0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIFRoZSBNRU1CQU5LX0RFRkFVTFQgdHlw
ZSByZWZlcnMgdG8gZWl0aGVyIHJlc2VydmVkIG1lbW9yeSBmb3INCj4gdGhlDQo+ID4gKyAgICAg
KiBkZXZpY2UgKG9yIGZpcm13YXJlKSBvciBhbnkgbWVtb3J5IHRoYXQgd2lsbCBiZSB1c2VkIGJ5
IHRoZSBhbGxvY2F0b3IuDQo+IA0KPiBJIHJlYWxpemUgdGhlIHBhcnQgb2YgdGhlICdvcicgaXMg
d2hhdCBJIHN1Z2dlc3RlZC4gSG93ZXZlciwgSSB3YXNuJ3QNCj4gY29ycmVjdCBoZXJlIChzb3Jy
eSkuDQoNCk5vIHByb2JsZW0sIGFjdHVhbGx5LCBJJ3ZlIGxlYXJuZWQgYSBsb3QgYWJvdXQgaG93
IFhlbiBkb2VzIHRoZSBtZW1vcnkNCm1hbmFnZW1lbnQgZnJvbSB5b3VyIGNvbW1lbnRzLiBTbyBJ
IHNob3VsZCBzYXkgdGhhbmsgeW91Lg0KDQo+IA0KPiBJbiB0aGUgY29udGV4dCBvZiAnbWVtJyB0
aGlzIGlzIHJlZmVycmluZyB0byBhbnkgUkFNLiBUaGUgc2V0dXAgY29kZQ0KPiB3aWxsIHRoZW4g
ZmluZCB0aGUgbGlzdCBvZiB0aGUgcmVnaW9ucyB0aGF0IGRvZXNuJ3Qgb3ZlcmxhcCB3aXRoIHRo
ZQ0KPiAncmVzZXJ2ZWRfbWVtJyBhbmQgdGhlbiBnaXZlIHRoZSBwYWdlcyB0byB0aGUgYm9vdCBh
bGxvY2F0b3IgKGFuZA0KPiBzdWJzZXF1ZW50bHkgdGhlIGJ1ZGR5IGFsbG9jYXRvcikuIEFsc28u
Li4NCj4gDQo+ID4gKyAgICAgKiBUaGUgbWVhbmluZyBkZXBlbmRzIG9uIHdoZXJlIHRoZSBtZW1v
cnkgYmFuayBpcyBhY3R1YWxseSB1c2VkLg0KPiANCj4gLi4uIHRoaXMgZG9lc24ndCB0ZWxsIHRo
ZSByZWFkZXIgd2hpY2ggbWVhbnMgYXBwbGllcyB3aGVyZS4gU28gSSB3b3VsZA0KPiBzdWdnZXN0
IHRoZSBmb2xsb3dpbmc6DQo+IA0KPiBUaGUgTUVNQkFOS19ERUZBVUxUIHR5cGUgcmVmZXJzIHRv
IGVpdGhlciByZXNlcnZlZCBtZW1vcnkgZm9yIHRoZQ0KPiBkZXZpY2UvZmlybXdhcmUgKHdoZW4g
dGhlIGJhbmsgaXMgaW4gJ3Jlc2VydmVkX21lbScpIG9yIGFueSBSQU0gKHdoZW4NCj4gdGhlIGJh
bmsgaXMgaW4gJ21lbScNCg0KT2sgd2lsbCBmb2xsb3cgdGhhdC4NCg0KPiANCj4gVGhlIHJlc3Qg
b2YgdGhlIGNvZGUgbG9va3MgZ29vZCB0byBtZS4gU28gb25jZSB3ZSBzZXR0bGVkIG9uIHRoZSB0
d28NCj4gY29tbWVudHMgYWJvdmU6DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4NCg0KVGhhbmtzIQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

