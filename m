Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF0654C653
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349983.576211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QOf-0001t0-Ew; Wed, 15 Jun 2022 10:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349983.576211; Wed, 15 Jun 2022 10:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QOf-0001q8-BR; Wed, 15 Jun 2022 10:37:13 +0000
Received: by outflank-mailman (input) for mailman id 349983;
 Wed, 15 Jun 2022 10:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dio+=WW=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o1QOe-0001q2-4i
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:37:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ca634fd-ec97-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:37:11 +0200 (CEST)
Received: from DB6PR07CA0192.eurprd07.prod.outlook.com (2603:10a6:6:42::22) by
 AM0PR08MB3316.eurprd08.prod.outlook.com (2603:10a6:208:5f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.14; Wed, 15 Jun 2022 10:37:04 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::58) by DB6PR07CA0192.outlook.office365.com
 (2603:10a6:6:42::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.6 via Frontend
 Transport; Wed, 15 Jun 2022 10:37:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 10:37:04 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Wed, 15 Jun 2022 10:37:04 +0000
Received: from 5b950c15e590.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CB7F00D-3EBC-44CC-91BA-80F4033F9532.1; 
 Wed, 15 Jun 2022 10:36:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5b950c15e590.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Jun 2022 10:36:53 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB4099.eurprd08.prod.outlook.com (2603:10a6:208:12a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 15 Jun
 2022 10:36:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::7da8:5168:ad86:7178]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::7da8:5168:ad86:7178%7]) with mapi id 15.20.5353.013; Wed, 15 Jun 2022
 10:36:51 +0000
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
X-Inumbo-ID: 1ca634fd-ec97-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=V3RrgsWW7rs/tt4uUU7AwvomHZWaD0D089fNBI/UXx3AGwq6DPCo4YQC/UaUaa1Z5+HO4cJ+zE4Ejz9th1U57Q0gcZFT+1p6eShM/Aryo+lFZebsj+5CvcfsIwh5wEQ8X5yMyoJhjJiy98yoJMEAUM6GrSvvZln4u37zF07G+OGf3pVT7i14hC7w/wkRW9jKe3GDlAYZV9rZko5d/br0/Kfn6lktmeRbq2lUW1Vo0tleNIPLBqBSs2KAo8EolX2hLcSHvw4DT9vkGTHKm/+lVtge3uohe8W1a67WhXQxcBtTpNAwcIA/6BMfyIV8C8dnWxa4xVj5FaDpZ3LFaApl8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF6nkyADRZPAd/nl+T3h6ASr7u7DpDEePS/gSzT2PIg=;
 b=hLrr86ynyNpn8XfzezdyRMX2DfagmWMCsgirxG3pqXWwsMy9DQ46ek4k+LUAiLbeGC22Mvo4KTJYGjGCdACl7nIbR/+wSXL8QUuh2JzwH98OGIb8hKpMvHADqhecFis5udMHQ1FNhGm3sH7Jj1OoJAA9/zn5/tqhfwyxEl4nV1TQwzt4vGujbrjo6mgL9MbvpMAVaYBOMVWcO+c7aTbXlDakJ5L/q55bJ6/RdA109V1VrGvFv/ZspI3oF3TcFlWDGRAutrh8JqeeWUh1I4LcCEV8O4H68HDVjle5QJoD/yz1qYlDIvdcw8JF2qCuUP5m3c5NQsJaEHr8nYsQH/HGng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DF6nkyADRZPAd/nl+T3h6ASr7u7DpDEePS/gSzT2PIg=;
 b=HnTlUyNf93x76nYi2WKb4xLZDiZ54R4eO9ArLswDNFkQxxX26IPKnoYxzFhsC9SWwqChFRoWDUQ13TfG+t+KXmulZecwu20op/urv/N+JSpYaT+YYvILbL50/YnvUqk6hKUamyHZQduO5S+Bg7UqgVPxBBgnjdNeNOz0zO4XzGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYAnj0bhnkmaGFjzB7oAA9xu4R8+od+EeOkjDp1FEo+t6eHOrptjvpTyndffpwX2bJKIQUlJCWx6kNX/QiGoh2xswfD06Ou6+xL3utuiGLWcPbPbNJteeA6EC/tbhZqpxLmhTSfp/xNtWh6l2ep3QIVAgtKLMfezlOKYx0kUxwx5AGYjWVYahrkDLPXOaIWvhSXPLBzxsFOivlbgYxQkBe6RYeTloTKk3GJVXwJAJ/m4k3xqIFtIXQO5FAfOB3HaBiFYQCX3//2zDPJBsGtZ/K4WvX0RNtIYMj1UXq8UtJd89luoEiiunArQP0YF2IyErev9i2uJhODrSIH7aH0cfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF6nkyADRZPAd/nl+T3h6ASr7u7DpDEePS/gSzT2PIg=;
 b=Cppwx+SBZUDy6dLUkZWybsaQ7cVa6kW02U59YgZBdtKhHKEgV29ffJdIkxYvYAzxbxIG1iarx03iy8x/68M+M22Pt/3nBn0zSf4wwOLRD24i3iq/qPRH9OLd/zOkJd4orptU0y2euqx/XdeS4bqoQraD3QxwxSRqWoMyT7IsuUCXo5cW98PfokxVpr1bR1q/v0p38PFlXeDqV1jtYcdqDC5me1Ld8MhLUNQhLEmw/+SNuKSMdzqLBT5ZLi9J/VQ2ry9dxxH5Mh8gZLdVMGBIespfaEvG5yx3zlbUpU2hI05w+AYjbYLqGClZVrgm4FnGta3BY/oAgGpLKK09atrTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DF6nkyADRZPAd/nl+T3h6ASr7u7DpDEePS/gSzT2PIg=;
 b=HnTlUyNf93x76nYi2WKb4xLZDiZ54R4eO9ArLswDNFkQxxX26IPKnoYxzFhsC9SWwqChFRoWDUQ13TfG+t+KXmulZecwu20op/urv/N+JSpYaT+YYvILbL50/YnvUqk6hKUamyHZQduO5S+Bg7UqgVPxBBgnjdNeNOz0zO4XzGM=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: avoid vtimer flip-flop transition in context
 switch
Thread-Topic: [PATCH] xen/arm: avoid vtimer flip-flop transition in context
 switch
Thread-Index: AQHYgFjGGQRmuhVkyUGP4eiVYzlBr61QOR4AgAABKRA=
Date: Wed, 15 Jun 2022 10:36:51 +0000
Message-ID:
 <PAXPR08MB7420FDB50DA7265956A3B0BC9EAD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220615013909.283887-1-wei.chen@arm.com>
 <c48bb719-8cc6-ea8d-291d-4e09d42f93c2@xen.org>
In-Reply-To: <c48bb719-8cc6-ea8d-291d-4e09d42f93c2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5DA9E8E59638924AAC5283D0AF5B4515.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: da56f7e4-dd53-4d56-a7ec-08da4ebafd0f
x-ms-traffictypediagnostic:
	AM0PR08MB4099:EE_|DBAEUR03FT025:EE_|AM0PR08MB3316:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB331699DA4D5BDE51822D27E89EAD9@AM0PR08MB3316.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AxpPc/lmQZcGWzHr9i4OPBwgx2XDmSSC28oih1pyFFVHopQpTg5SEyiepeOAJdLygEfTQQr+oVTXTRmRNGNcoROnh4U4HZ+89jzlKyylcjRzHfKDnelH5nL1OGm4PknAmS1AyZ29IvdC8dsgdJaGuYK0Zk7XzouhbsMxdxxnbASjRwmlhGjOQygFB7vpnlJaAGZPBPBCA89dUbQM25KazTLpBgEJL3OX2sWLH5PXR/dc9ZvxGr9hR1unpFewT0kjryi3TgFFQM6UxANYviAeSqwtT0deRru3RdufRf2b0uMi3Tuj452zOH+7P02NyZtOFxD3xcdof4CT7xy6mpwXS8wn+tIDdwchvm2AteacA4T5hjQM/8khiwNyy64TYzp+BCo4JBEUpE4rUF83C1bky2YH/Jpta5z9o9FiQvsVYv24AaCOB1UMYUX7mcekVp6Q9/jirlS2InqGGWxJTuimIvf10IWOBfHG0S3NyTfQU4uayq4cIAfQAh6BKZQXzFXPhwTxq+gQX9JgFc/Swgyqy+7wX4p2CeNNyUsEUKqfvplODpBrG9LeZpP0Bibui4mIKn1REECt1JXQRbZkSYlIp/ACHyY4L2UP/0tCDOoidsQIStLYy3F4ARaiU8MVUj0RK0O4bR65oHi32q79zus2IPLnHlsVbfr4VuJLZiICW6G4s0+tuKAGsmU1GKQqlzk+UDrXDCyq3KAiw//lBVwv+g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(5660300002)(52536014)(66476007)(66556008)(66946007)(33656002)(55016003)(66446008)(316002)(2906002)(8936002)(86362001)(64756008)(6506007)(122000001)(38070700005)(9686003)(76116006)(4326008)(71200400001)(38100700002)(110136005)(186003)(83380400001)(508600001)(8676002)(54906003)(7696005)(26005)(53546011);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4099
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccad0ed5-9e7a-4b86-85d9-08da4ebaf556
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GgN18aeHmR0Za9ofoqKd491R6P7kQRJxKxVWFJRjJLkcovvNIOpSgEW4zVY1q9lCstOrpIHaZ9TQM6nNzzc0t7rkPxjsDWq43ALa3xPN7Qnb5GikzrrvMHcTDIBeXaB3wV7FQjjWwM9i130BHybhxS4/5MxvKRVyqfehWCXNamKAMxqaB6K4DLKSnh8GOg6R4Zowtcwe3fJfTkYH+X4zHKCmP4WNa8G7AfJq4wouW4lUogyjOk8Xj3Vnngo+lGgLBHaCLNutKcRM8et3L7PC1ATxFGhQQe9inZ1SeQTcgXpV6arN7vmmweaMB9SjHxNLz47GP+wSW0Y75n05VYyuU0Hl5EdcO8H/Eu+wsGCHeifGgHcM41U5p70iAReaI5hN+GTsDZ7V13a+WyAQM5Wj02nROsUcMuNYHTJJ2WgoxBj17ytlvgmGypGTvrikghuqpfAzxqJMmSYvNmwSgQZ/+zd4EE2FCF0qcSr6lu7rfhmkeXLXbyKd6/ghgyHUAMrn/WpmSV6UTTOLgJ3BtLJlSroZ6/mKOGtVLbTsOz8/axFGbMj3I+tDgdwdmpTwGGNkHB6Od53Fg1oizR2qjxbRe2zIdbq7hSKDob1TL+At151HC474vC05LB9ruD0TH+dnClKMwoFhVPV9rPW2QqLo6ZHkmm6NkCn+wsj2QSXM3b0yOqAViHD1JdG89sN+Eaga
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(8936002)(2906002)(40460700003)(26005)(9686003)(52536014)(316002)(356005)(508600001)(86362001)(33656002)(82310400005)(47076005)(4326008)(70206006)(70586007)(107886003)(336012)(83380400001)(54906003)(110136005)(55016003)(8676002)(81166007)(186003)(7696005)(53546011)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:37:04.2735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da56f7e4-dd53-4d56-a7ec-08da4ebafd0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3316

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQ25pyIMTXml6UgMTc6NDcN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1
aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVuL2FybTogYXZvaWQgdnRpbWVyIGZsaXAt
ZmxvcCB0cmFuc2l0aW9uIGluIGNvbnRleHQNCj4gc3dpdGNoDQo+IA0KPiBIaSBXZWksDQo+IA0K
PiBUaXRsZTogSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gYnkgImZsaXAt
ZmxvcCB0cmFuc2l0aW9uIi4NCj4gDQoNClNvcnJ5IGZvciB0aGUgbm8gYWNjdXJhdGUgd29yZHMu
IEkgbWVhbiB0aGUgdGltZSByZWFjaGVzIHRvIHRoZSBNQVggdWludDY0X3QNCmFuZCBjb250aW51
ZSBmcm9tIDAuIE1heWJlIGFuICJvdmVyZmxvdyIgYmUgYmV0dGVyIGZvciB0aGlzIGRlc2NyaXB0
aW9uLiANCg0KPiBPbiAxNS8wNi8yMDIyIDAyOjM5LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiB2aXJ0
X3Z0aW1lcl9zYXZlIGlzIGNhbGN1bGF0aW5nIHRoZSBuZXcgdGltZSBmb3IgdGhlIHZ0aW1lciBh
bmQNCj4gPiBoYXMgYSBwb3RlbnRpYWwgcmlzayBvZiB0aW1lciBmbGlwIGluOg0KPiA+ICJ2LT5h
cmNoLnZpcnRfdGltZXIuY3ZhbCArIHYtPmRvbWFpbi0+YXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zm
c2V0DQo+ID4gLSBib290X2NvdW50Ii4NCj4gPiBJbiB0aGlzIGZvcm11bGEsICJjdmFsICsgb2Zm
c2V0IiBjb3VsZCBtYWtlIHVpbnQ2NF90IG92ZXJmbG93Lg0KPiA+IEdlbmVyYWxseSBzcGVha2lu
ZywgdGhpcyBpcyBkaWZmaWN1bHQgdG8gdHJpZ2dlci4NCj4gPiBCdXQgdW5mb3J0dW5hdGVseQ0K
PiA+IHRoZSBwcm9ibGVtIHdhcyBlbmNvdW50ZXJlZCB3aXRoIGEgcGxhdGZvcm0gd2hlcmUgdGhl
IHRpbWVyIHN0YXJ0ZWQNCj4gPiB3aXRoIGEgdmVyeSBodWdlIGluaXRpYWwgdmFsdWUsIGxpa2Ug
MHhGMzMzODk5MTIyMjIzMzMzLiBPbiB0aGlzDQo+ID4gcGxhdGZvcm0gY3ZhbCArIG9mZnNldCBp
cyBvdmVyZmxvd2luZyBhZnRlciBydW5uaW5nIGZvciBhIHdoaWxlLg0KPiANCj4gSSBhbSBub3Qg
c3VyZSBob3cgdGhpcyBpcyBhIHByb2JsZW0uIFllcywgdWludDY0X3Qgd2lsbCBvdmVyZmxvdyB3
aXRoDQo+ICJjdmFsICsgb2Zmc2V0IiwgYnV0IEFGQUlLIHRoZSBvdmVyYWxsIHJlc3VsdCB3aWxs
IHN0aWxsIGJlIGNvcnJlY3QgYW5kDQo+IG5vdCB1bmRlZmluZWQuDQo+IA0KDQpZZXMsIGp1c3Qg
YXMgeW91IHNhaWQsIGV2ZW4gb3ZlcmZsb3csIGJ1dCB0aGUgcmVzdWx0IGlzIHN0aWxsIGNvcnJl
Y3QuDQpJIGhhZCBqdXN0IG5vdGljZWQgdGhlIG92ZXJmbG93LCBidXQgdGhvdWdodCBpbiBhIHdy
b25nIHdheS4NCg0KV2UgaGF2ZSBlbmNvdW50ZXJlZCB0aGlzIG92ZXJmbG93IGluIG9uZSBSVE9T
IGd1ZXN0Og0KUENOVDogICAgICAweGYzM2FkNDUzNjdlNGE0ZmYNCkVMMl9PRkY6ICAgMHhmMzMz
MzMzMzU5ZTI5YTdmDQpCT09UX1RJQ0s6IDB4ZjMzMzMzMzM1OWUwMDAwMA0KVkNOVDogICAgICAw
eDAwMDdhMTIwMGUwMjBhODANCklmIHRoZXJlIGlzIG5vIHRpbWVyIGluIGxpc3QsIFJUT1Mgd2ls
bCBjYWxjdWxhdGUgYSBodWdlIG51bWJlciBmb3INCiJpbmZpbml0ZSB3YWl0IiwgZm9yIGV4YW1w
bGU6DQpWQ0FMOiAgICAweDBmZjdhMTIwMGUwMjBhODANCkVMMl9PRkYgKyBWQ0FMIC0gQk9PVF9U
SUNLID0gMHgwMzJhZDQ1MzY3ZTRhNGZmIC0gMHhmMzMzMzMzMzU5ZTAwMDAwID0gMHhGRjdBMTIw
MEUwNEE0RkYNCkVMMl9PRkYgLSBCT09UX1RJQ0sgKyBWQ0FMID0gMHgyOWE3ZiArIDB4MGZmN2Ex
MjAwZTAyMGE4MCA9IDB4RkY3QTEyMDBFMDRBNEZGDQoNCg0KPiA+DQo+ID4gU28gaW4gdGhpcyBw
YXRjaCwgd2UgYWRqdXN0IHRoZSBmb3JtdWxhIHRvIHVzZSAib2Zmc2V0IC0gYm9vdF9jb3VudCIN
Cj4gPiBmaXJzdCwgYW5kIHRoZW4gdXNlIHRoZSByZXN1bHQgdG8gcGx1cyBjdmFsLiBUaGlzIHdp
bGwgYXZvaWQgdGhlDQo+ID4gdWludDY0X3Qgb3ZlcmZsb3cuDQo+IA0KPiBUZWNobmljYWxseSwg
dGhlIG92ZXJmbG93IGlzIHN0aWxsIHByZXNlbnQgYmVjYXVzZSB0aGUgKG9mZnNldCAtDQo+IGJv
b3RfY291bnQpIGlzIGEgbm9uLXplcm8gdmFsdWUgKmFuZCogY3ZhbCBpcyBhIDY0LWJpdCB2YWx1
ZS4NCj4gDQoNClllcywgR3Vlc3RPUyBjYW4gaXNzdWUgYW55IHZhbGlkIDY0LWJpdCB2YWx1ZSBm
b3IgdGhlaXIgdXNhZ2UuDQoNCj4gU28gSSB0aGluayB0aGUgZXF1YXRpb24gYmVsb3cgc2hvdWxk
IGJlIHJld29ya2VkIHRvLi4uDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4g
PHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vdnRpbWVyLmMg
fCA1ICsrKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92dGltZXIuYyBiL3hl
bi9hcmNoL2FybS92dGltZXIuYw0KPiA+IGluZGV4IDViYjU5NzBmNTguLjg2ZTYzMzAzYzggMTAw
NjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3Z0aW1lci5jDQo+ID4gKysrIGIveGVuL2FyY2gv
YXJtL3Z0aW1lci5jDQo+ID4gQEAgLTE0NCw4ICsxNDQsOSBAQCB2b2lkIHZpcnRfdGltZXJfc2F2
ZShzdHJ1Y3QgdmNwdSAqdikNCj4gPiAgICAgICBpZiAoICh2LT5hcmNoLnZpcnRfdGltZXIuY3Rs
ICYgQ05UeF9DVExfRU5BQkxFKSAmJg0KPiA+ICAgICAgICAgICAgISh2LT5hcmNoLnZpcnRfdGlt
ZXIuY3RsICYgQ05UeF9DVExfTUFTSykpDQo+ID4gICAgICAgew0KPiA+IC0gICAgICAgIHNldF90
aW1lcigmdi0+YXJjaC52aXJ0X3RpbWVyLnRpbWVyLCB0aWNrc190b19ucyh2LQ0KPiA+YXJjaC52
aXJ0X3RpbWVyLmN2YWwgKw0KPiA+IC0gICAgICAgICAgICAgICAgICB2LT5kb21haW4tPmFyY2gu
dmlydF90aW1lcl9iYXNlLm9mZnNldCAtIGJvb3RfY291bnQpKTsNCj4gPiArICAgICAgICBzZXRf
dGltZXIoJnYtPmFyY2gudmlydF90aW1lci50aW1lciwNCj4gPiArICAgICAgICAgICAgICAgICAg
dGlja3NfdG9fbnModi0+ZG9tYWluLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgLQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib290X2NvdW50ICsgdi0+YXJjaC52aXJ0
X3RpbWVyLmN2YWwpKTsNCj4gDQo+IC4uLiBzb21ldGhpbmcgbGlrZToNCj4gDQo+IHRpY2tzX3Rv
X25zKG9mZnNldCAtIGJvb3RfY291bnQpICsgdGlja3NfdG9fbnMoY3ZhbCk7DQo+IA0KPiBUaGUg
Zmlyc3QgcGFydCBvZiB0aGUgZXF1YXRpb24gc2hvdWxkIGFsd2F5cyBiZSB0aGUgc2FtZS4gU28g
aXQgY291bGQgYmUNCj4gc3RvcmVkIGluIHN0cnVjdCBkb21haW4uDQo+IA0KDQpJZiB5b3UgdGhp
bmsgdGhlcmUgaXMgc3RpbGwgc29tZSB2YWx1ZXMgdG8gY29udGludWUgdGhpcyBwYXRjaCwgSSB3
aWxsDQphZGRyZXNzIHRoaXMgY29tbWVudCA6ICkNCg0KDQpUaGFua3MsDQpXZWkgQ2hlbg0KDQo+
IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

