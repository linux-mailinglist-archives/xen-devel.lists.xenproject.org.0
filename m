Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063FF7F32AE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:48:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637927.994034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SzQ-0003ib-Em; Tue, 21 Nov 2023 15:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637927.994034; Tue, 21 Nov 2023 15:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SzQ-0003fL-Bc; Tue, 21 Nov 2023 15:48:40 +0000
Received: by outflank-mailman (input) for mailman id 637927;
 Tue, 21 Nov 2023 15:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+4w=HC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r5SzP-0003Bn-EE
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:48:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eed820f-8885-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:48:37 +0100 (CET)
Received: from AS8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:310::17)
 by AM9PR08MB6657.eurprd08.prod.outlook.com (2603:10a6:20b:308::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 15:48:33 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:310:cafe::73) by AS8PR04CA0012.outlook.office365.com
 (2603:10a6:20b:310::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 15:48:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 15:48:33 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Tue, 21 Nov 2023 15:48:33 +0000
Received: from acce25e3130d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4B5B3CD-6B17-4CF6-AE5B-42808E32EBB7.1; 
 Tue, 21 Nov 2023 15:48:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id acce25e3130d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Nov 2023 15:48:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB8005.eurprd08.prod.outlook.com (2603:10a6:10:38f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 15:48:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%6]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 15:48:24 +0000
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
X-Inumbo-ID: 6eed820f-8885-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cq3WOlGJipK+tkvRSdH5FSZ2aOqGW/M8f4XIJV13sieaKcGOKYSpZD5XRUbwQGR/NFNOU5ZeL2Xvhif4JoDxhtm4KnJt6UGvnIDhOGQGyaxZogzxDagffGcZyDkPFMY1y5fmer78JZRQDzICR092y1BonHapJotnRgZHjWBn0Rs9NcMJrdyxZyNTqfWiyIhoGMtLgWTJ3+u7n8zcbih3Jre0ZuqkYf42YnKZCx6XEHjjcMDU2t5J4qL2gBOgulJKjTQBWBCED4ezJFsxSgSOsOkat9oxFQdJt1gFcGQYtGmj4XUwxy216St91QDUtfYx6olL448wvVV3kFaVnWl/0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m76lJLSH6aD07eGDeHvC7c73SwE8YmWn99suPYmv2YA=;
 b=cqwpEMiEJb0MWIoLn+GQr21/ud868f+Kow8Rv7dnSMBjOCNW2kbFVRvS6tUDLRhYcCS3napQCl//J+frDyyDF0EGLOc1bqYfo7HuyQzEaghxj+Ckq6WCwiX/J7YdUb9dgv1erltOZIhoODWe2xGV0c3VrD8W6tHm46cU9Xbp+C+mdpNE6nImqPDhRvs4l45jkyHolbJCN1YrWeS5eeN8ANDtClDNh4h3a6AnMwdplMEZQw2GZoJXJVJTtnRzw0ncrEt3M+RRGgSXyvLkLEP0Ysh+4KlvxXqRpbJgieE4mgDpabdd2BPt8MeH00d6la5uNS87/4yQN4yfmnw95xh3fA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m76lJLSH6aD07eGDeHvC7c73SwE8YmWn99suPYmv2YA=;
 b=6n1Pau4dWIPY80e+QDcZf4RcEEpEE6tN6El8+ScepIMrlECKqj+FELzOKcDITF5FlY1ozeFTh0scd2PdUwdJVHb5cs4cSOAR1C5vTsPcuHLn6nF0Njudo6qPo/PqNivaB+b6Pkm8QIB0ScbK1ypWF7cThxO1f+9JS7d10DS19kM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 743943516cf1ae76
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzTnzwvlG7XzQR+7sTUk2bfcYSiKaCLBgWNRQmIT+TI4eaVx4+BZxWNhVPbzuu0AUZtDPBcnDCjda77whDDlzJfv9g32+ew9abSo+DY6rZKWIY03sTqz4avvIgSoA6FUErx3TRAtwNlT4FcB2YG7CuthEIVAAEV3cXjhC86aWakM1ecMe8+shExsiO/QV5uDB9eel/EOQJemH8aQKdCAAAJ+WVtrq89428IrFpMrjdb1Ne3H/esojUsTiir3yujPYKK/eaN8Qb0FTyZjyk8y0Kof0qowFPVz0Z87ywsR0pyGpSpRw1c3+aTzTrmJBvAldl/1a+gR3Kuvrwt9F3CWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m76lJLSH6aD07eGDeHvC7c73SwE8YmWn99suPYmv2YA=;
 b=gavrI+IVwhvCMO+zlDYUP7SpTYW7hEksI/lZGFtgFItVo8SXUquwTcgee2qH921WUsvY92Ql4LmN2MvOckoNJGqW/Vqs+c1ROtzzDUJKn8jH9mKEpjlH0c63o+X2ND5LW29zPwDJkTTMO4jbZP3OaFcqpd9fSaPojT3zo2ja/ZPRgHsAnVZWqOZ1CjaWHzOZOkRIuEHrmRTNvv5DoFMWgjt+BFw+gqoCy3wBCxyM6NyEt5uuN3JhErCTB/ppwmOhCkOxHHoY2ZOhYvYOPQ0+Zius+2i0VWaUGcGda3LZvDe9d3SGGbwRLrUgmDRDTU3n1G1Sotap1ktbytRos3AsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m76lJLSH6aD07eGDeHvC7c73SwE8YmWn99suPYmv2YA=;
 b=6n1Pau4dWIPY80e+QDcZf4RcEEpEE6tN6El8+ScepIMrlECKqj+FELzOKcDITF5FlY1ozeFTh0scd2PdUwdJVHb5cs4cSOAR1C5vTsPcuHLn6nF0Njudo6qPo/PqNivaB+b6Pkm8QIB0ScbK1ypWF7cThxO1f+9JS7d10DS19kM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm64: head: Move earlyprintk 'hex' string to
 .rodata.str
Thread-Topic: [PATCH 1/3] xen/arm64: head: Move earlyprintk 'hex' string to
 .rodata.str
Thread-Index: AQHaHF+ZLfO2ZZCzYUW7XLxi+lBn+LCE64WA
Date: Tue, 21 Nov 2023 15:48:24 +0000
Message-ID: <C751BB71-A166-4485-B7AC-75304764997B@arm.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-2-michal.orzel@amd.com>
In-Reply-To: <20231121094516.24714-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB8005:EE_|AMS0EPF000001B0:EE_|AM9PR08MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b19f00e-98a9-4f73-a72f-08dbeaa95125
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NTBTspH2uxFq4KQgIcuaG4c/QpuOcS2csfAgTvB4zZ6KKdmnCp4+E/jrX02pZx27mhgbpZ8zht5qPiwk2YOtkAOJnp+ogCZs0WV7h4kb11MTWpvRKFyac+ACLnAWLfQzrxjtnWvNZEOp2RnyWr79Le1EYMRdCmntca0xysUu0ctmJUYhTaEj9j2SKS81e2UPlneam1lKwOZ5N9O1i+3tbhk3Tiam+9w+DtX4kZqqr6JBIi5SxGG+Uv5cC2v09pW6DKogUVGm83HcOYiScvwhx6rKBXlJS4lSbVSIl8jhaLlKP3RUOqmo9LzJFAxthyO0Ekw2dj3MC16wrEWjfMpXASoe5/QL7ehJ44nPH7MvBUugfnXd7oNIvYQVNdeSq02C6coPhkBb1o8pOZ9r5fldxLpA2OP7d4q12+rua+eLvvd9zGPaKyi3cdCMC0eZYASyqBTdUrWpZzowRh3WsKj/nllIgTAvYc6bJZScQZQ3RgFkj7iACZ+e6M1XtUnJMrhnOqnNe8M98rZWX8jTvuQzHcz9Tt+jkNTwJ/w65aWi8F+lHPJbEYB6aWKbsxgES6iVtoVvEptK9f1Ne+wzz8rnX72p+kOUIWTbk7gHvTUeUD1fmlEF+5jXQYEhPgK2FKm+6VyCPpwdTSzueSWTKoYD8goBaXvGUo/oAA6FYo3297KPU0UH9+Y9V62RodWSro7Q
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39850400004)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(38100700002)(38070700009)(36756003)(33656002)(86362001)(122000001)(6916009)(76116006)(66946007)(91956017)(66556008)(66476007)(66446008)(64756008)(54906003)(4326008)(8676002)(8936002)(316002)(41300700001)(5660300002)(4744005)(2906002)(53546011)(6512007)(26005)(2616005)(6486002)(71200400001)(478600001)(6506007)(142923001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34BEF732DA26134D8895B231D035058D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8005
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	932469c3-51bf-42f9-4510-08dbeaa94bb7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oL0XXpfJKf6SwZsvWtG0ZAL0RsF65qwSj9ri+r5v+zXAS/AGdtlabpXITV2RUfO/KLmW8smWOj7dfe4JmXTqxynTa8dd0KQiYq3MxVZ5jRto64Vjdy4EzyKUtqO/3gtuHop4/iXEIYSZfNrG9aTYvclQ0JskfnQDaed/H8MAKq1CReZBD1B6H1uF4IDdeN8F08XV0hbeuUoG4KlACeBRub4rGQLaepNNaVdtQ3nh6hxBDJtxZSfblTx8RqoScsgvEFUkUrqwuJYlSsu37zs4D6LimSDMpbotVz2AOxuT6kcLMKnTH2MrZNQCtXz6kmN9Rt2qQXxih1w5OzR7v7MkpF1S4KUBH9dD6YnD68Hp2qktcqKXIQGCKmW+CJ+cBWHyTB4mGfkoqVeAVwcqiCcYVdQc4GwMmfNBZTSbtYh36aSmNl4A7+sOZY/s1dv60MvzSJMY+zb08Cr/8+JcNdGrMvdPrzeLpddJxqMQ8EzNOAjLToczqA/DOKMirgr3QuJHrt430lNTdvBLOaLUXnldzXy2m93/MiP1LfdoLGAX3pCWSsK7rP/64nza/fZ0Ofuuu5piZvlpdtnumJaBpsdZ4Y1vGJWrK1t7x8lt67jLKSDwEJl48OCfL8BB/ULdFv+biMa7UJeMbVa9JzY9yIfmfosGdWJv7Nvkyn5q1qEtCbuVyMFWM1lpfRQDsXSp3wOCKjNeX/pYSBiMO5ge/wrz/ksIpG4X4R1O9OAio5mBl7jnK3bg6T/D34hr106tCqdcSTkH+OEdGz6eF+Eoim8EsQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(82310400011)(451199024)(1800799012)(64100799003)(186009)(46966006)(36840700001)(40470700004)(41300700001)(33656002)(36756003)(40460700003)(4744005)(2906002)(86362001)(5660300002)(81166007)(47076005)(356005)(40480700001)(107886003)(2616005)(26005)(478600001)(6512007)(6486002)(83380400001)(336012)(82740400003)(8936002)(8676002)(6862004)(4326008)(316002)(54906003)(53546011)(70206006)(70586007)(6506007)(36860700001)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:48:33.4383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b19f00e-98a9-4f73-a72f-08dbeaa95125
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6657

DQoNCj4gT24gMjEgTm92IDIwMjMsIGF0IDA5OjQ1LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEF0IHRoZSBtb21lbnQsIHRoZSAnaGV4JyBzdHJpbmcg
aXMgcGxhY2VkIHJpZ2h0IGFmdGVyIHRoZSAncHV0bicNCj4gZnVuY3Rpb24gaW4gdGhlIC50ZXh0
IHNlY3Rpb24uIFRoaXMgaXMgYmVjYXVzZSBvZiB0aGUgbGltaXRlZCByYW5nZQ0KPiAoKy8tIDFN
Qikgb2YgUEMgcmVsYXRpdmUgJ2FkcicgaW5zdHJ1Y3Rpb24gJ3B1dG4nIHVzZXMuIE1vZGlmeSBp
dCB0byB1c2UNCj4gJ2Fkcl9sJyBpbnN0ZWFkIChyYW5nZSBleHRlbmRlZCB0byArLy0gNEdCKSBh
bmQgbW92ZSB0aGUgc3RyaW5nIHRvDQo+IC5yb2RhdGEuc3RyLiBUaGlzIHdheSBhbGwgdGhlIGVh
cmx5cHJpbnRrIG1lc3NhZ2VzIHdpbGwgYmUgcGFydCBvZiAucm9kYXRhDQo+IGFuZCB0aGUgYmVo
YXZpb3Igd2lsbCBiZSBjb25zaXN0ZW50IHdpdGggd2hhdCB3ZSBhbHJlYWR5IGRvIG9uIGFybTMy
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4NCg0KSGkgTWljaGFsLA0KDQpJ4oCZdmUgYWxzbyB0ZXN0ZWQgb24gRlZQDQoNClJldmlld2Vk
LWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0ZWQtYnk6IEx1
Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KDQo=

