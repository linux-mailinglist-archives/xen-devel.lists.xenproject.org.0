Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0E5B0221
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401217.643016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsge-0002De-8T; Wed, 07 Sep 2022 10:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401217.643016; Wed, 07 Sep 2022 10:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsge-0002BP-5T; Wed, 07 Sep 2022 10:53:40 +0000
Received: by outflank-mailman (input) for mailman id 401217;
 Wed, 07 Sep 2022 10:53:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gDT=ZK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVsgd-0002BJ-9k
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:53:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140073.outbound.protection.outlook.com [40.107.14.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53d72082-2e9b-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 12:53:38 +0200 (CEST)
Received: from DB6PR0301CA0025.eurprd03.prod.outlook.com (2603:10a6:4:3e::35)
 by PAWPR08MB9760.eurprd08.prod.outlook.com (2603:10a6:102:2ea::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 10:53:36 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::5b) by DB6PR0301CA0025.outlook.office365.com
 (2603:10a6:4:3e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 10:53:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 10:53:35 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 07 Sep 2022 10:53:35 +0000
Received: from 63eed57b8d15.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F43CD61-FAD4-415A-851A-D55D5005E15F.1; 
 Wed, 07 Sep 2022 10:53:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 63eed57b8d15.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 10:53:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7670.eurprd08.prod.outlook.com (2603:10a6:102:244::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 10:53:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 10:53:23 +0000
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
X-Inumbo-ID: 53d72082-2e9b-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YJeaJG2rjR8p5tITeRE85b36kEdpUQRlcb2urinBsNAQzAceffHP51mGZB5bsuaP7PgDgEKw4PutA1ceoN01vmQwdHPmM2+v4Ii9opVTHDKYGuIc8sJjADRYiJWpbtqZrJVHrW36Un6J3UuCoX7Zf8yZVtUUp3FQ1DBkuUZWtqrrKWiRPvHGziqEg5LjmJHSMjJxVXbUB7deReTbeEodjUl4BaGixcM8LHe+L16qLTt/NxmVX64krx52BOTeCv7edqLAOuuK6vE1BViym0ziO0hIEE7t+D1YXzizAfunM+86vfVAhx5mjltQamtwppcTvp3EBM9BBxW8DQJ4Ws06EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb/XEvmuxNWXiPnyUv/3Sruj6Sd9xw1voR7XZPSYG0o=;
 b=D1UhnOa7Gi8GHX7mrZwxPPvJL3JGzjJx85uzgW3GmskNSrgRMNWcAT33w+M1oFcaG5rHFtG4iStx8sxBIdMcof6DXiI/KRY17t4pnLMFqw2/IPbmVbjRyIo4o+8z2xJmUDkrsyntHqnctK3cPkkoc/QJtjyyw7WHYUdhNcOcLMp5MFSzEaNRS0HEyUw4LFjspfZTiF26MGAU134IpZfWrJasLWzPig48cVlaWM5UZBdAC6U+kCtn9pTNwWRYliuY8myEtc3iK1zwgsjT26vr6izhaNKjiZ1zhAtbQIooT/6sni9c2ZZhD4YLeVhLr9U+Jd6bWIVTcDhbChgV9vt5eA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fb/XEvmuxNWXiPnyUv/3Sruj6Sd9xw1voR7XZPSYG0o=;
 b=dJeCjFZLkJKHRrNF4REkXx4frtX7Zu1Hwk7MuwD5Llf59dOP9/4AJzfHsPy3vKlK39xECBp7po10Zv8IJcygkJMI7UVRrFhQC8M8cp7E6jiIQlqAeUaWn5x7CRAwM14PZCA+78JmsftpsMeCm4SDVY2vAzVG7TBOuTQwanlLm7A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFi7qdCkqQdCz0DsonLfKLpdK1oNqhmQYfV4H3UTphzu/7i/6XrVI4erNhMYf+pYynpm0cy6IVS5GL1thBDYhDVNqNQMGFkQlYoiaXxhyCtb/a6e3+5wFyVqnW8PA2YNJKGzYwTg9bSYXs3hmgAsh6Z93mE1g5bZd9ggOpYd/MCT0cU7R4r8+YleHGR+o2o5t2ehMMhHAii+xwqC05bwUfYCxSUf0LWasKuXgI6YG8R/Pu4KHX5GNjLEhV1HE79+rDA8SNdpgo9PF37DVfj0FThJi3CeZIEa0oTX4ZNPaqTbey/AOflAx8rMugQ842AQtiea7BSiRvn93A+ZEN0vdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb/XEvmuxNWXiPnyUv/3Sruj6Sd9xw1voR7XZPSYG0o=;
 b=WdOSS4EElH0jNtZp23tGlQ075OpG1f2qolez3bmQZT9tfm7wnAO48sZBr7Mqo5hnOOyYCxLq5AMSG0Lv4CDu+B0wJAOq6/coAU2tuX4z1STTicPtsZNi5fZjruTtAD9fqgAOPeMjTM/oJPWSZhDKPaAMRRByUzKJ2q1oLpP+RAqZyVQF8dZNOSqNPeHd/IMwn3hxWdY6uQiOU8bJsC+5YSmfRDU8sMEfu3s05cJ83tmuT1l0G9+6LQbO0sfjoS717Lsvrjhs2QyuuMus1do7uW3AEG6Lgbh22C+SLeQXVPnVOtmasSknkSq4Qx0JMxEXQhOwz70ztGP8pV0KAsKk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fb/XEvmuxNWXiPnyUv/3Sruj6Sd9xw1voR7XZPSYG0o=;
 b=dJeCjFZLkJKHRrNF4REkXx4frtX7Zu1Hwk7MuwD5Llf59dOP9/4AJzfHsPy3vKlK39xECBp7po10Zv8IJcygkJMI7UVRrFhQC8M8cp7E6jiIQlqAeUaWn5x7CRAwM14PZCA+78JmsftpsMeCm4SDVY2vAzVG7TBOuTQwanlLm7A=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3 3/4] xen/arm: mm: Rename xenheap_* variable to
 directmap_*
Thread-Topic: [PATCH v3 3/4] xen/arm: mm: Rename xenheap_* variable to
 directmap_*
Thread-Index: AQHYwpULGFLWtgCBlkSkZYDaahDS7q3TxKQAgAAEM/A=
Date: Wed, 7 Sep 2022 10:53:23 +0000
Message-ID:
 <AS8PR08MB799170866BCA3237738B4DE992419@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-4-Henry.Wang@arm.com>
 <9234b0da-01c6-dafc-8e62-c7e497f8f146@xen.org>
In-Reply-To: <9234b0da-01c6-dafc-8e62-c7e497f8f146@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D525D76B850BA44084D0882D03840286.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5adc593d-7c45-4aad-7a37-08da90bf36bf
x-ms-traffictypediagnostic:
	PAXPR08MB7670:EE_|DBAEUR03FT049:EE_|PAWPR08MB9760:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jYcpHKyPUgbZ/pbqsRA/+eiEFZdt5nQGzE6FoLngXvoa1gXtyrlOiiYqpTpPVJKsqB5Uo17O4vJAJyW8XjGDqI9ZJp0lm5RJFyfX81QXa6ESe5+wYJRkjhCSbRF2O92gX2oxxR1HVGLOi3xiMc8tn2OGM8+PnPhUb2JVP7CD1MlXlH3d9ZOoF4a4LCpDxd51kP2sZoS478CgJuHGteChDPyNC7tauuhVp+ldJ/9MDTXfFJJTrVD2K/JV08AfigDW/ohEoHfo4tVRRlRllJ4pzyA2OgiqeSsKXuFk2b7FwT8FKMkl9tfxPRhxAJRQLL4gEC/LTUYjZ41ev5JCpSPna9D94e8NUzCPFu9iZKYgnzvVR4bog/tSm4d+MteUZ8C5Kz751CVqquSJQuJ8/C8KdnkUYoNqKEsSlKYN2sA2dw7Bu8UEzR1i33yRYsL2YxUDb5POGaYxHJ5gXRiZ2J8IjTb+q87eFIN7R5UkpidaLI8UsZV0BhtjKufp+FNoYfqDNtQ7l8wgIaI/8VDOYush6vQrE33l0NIOy1ITj1WXR51ftQfTaX4BFIVNajZQiqOOkZHD/uYDKfOBfcBeyhlxAVu1/KP9QfqGATh664bTJzcvS1k0jPACvtZip0H4bSfRF90rQRfMBNz3JL9wiqT0YphflWUN49Ol/JywzF5LHtEvSaKMKI36kPjwu8xgN3HqAixNewMQC5OZE6JUPuM85qYHyQ55B3jWrvbpJbFR0a74c5dGKyu9hqKttv8JrJmEd/lJB5vfGOV4UlSVenXY4g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(38070700005)(83380400001)(33656002)(4326008)(76116006)(66556008)(122000001)(8676002)(66446008)(2906002)(38100700002)(64756008)(66946007)(66476007)(186003)(5660300002)(316002)(52536014)(8936002)(86362001)(55016003)(478600001)(9686003)(6506007)(41300700001)(71200400001)(53546011)(26005)(7696005)(110136005)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4285c8f3-fe35-40e0-ed21-08da90bf2fa1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	16JQso7R/8+XVHvYCOIDCOSWTFrS9DNmSVEPYd8vN7IOM7K9k4UV5vfugv9TyqAUhqGwkiumFxQ7X8Ml2u1FQZklp3hbPEyPL/Wq++xDom/4BMrbyrO0TP62fnjVy0pJX3c8Epxwjf9lYgp8XH2bhO+y4iCaeePBACfL8LQxOAmNDWgZdA13FLFmhD/jDnLq8PB0PCrSepVZLblYLPenPRvlBt7QliX/pd7VYQ7N9+jLPrNN+pIIYqT4EUwd+SY084y3+dnPyaaXzRdq5r9g7PFGQcXrtHZ2thMCy6H75BSzpNeZ+z7AxoHRd4VVX+BTjcnTREqshV97gYoK9jQ+TbsMblN2ddnOSx+tKSABQfNsPmWceNfigCXa5romOc0qjv5/d802sfkxxmmPPvqF9hBjeqEC9Vfn/3YeNnkDlCiuq00jz8PRRQYP3ypvi0gvQZ7OmyK5X0LNP865UaDVPxONasBFR06kOG39awIvrNOjhCGP0wZF/S/XbG58lTmI6MIzZSloR+dSqxxacbNgrks3r3BoAuVse3BhbS3YPMYbF3pn7oKHfhdvngBfWAIrVF1+3YO40QcrE3fU1iQnqdIdok+fRqX2lc7kS3PIaIbLtS3C0OsXLneRApg9Db7XIGezkHi1/+GnJCXHAjU44rVb2miu/zeadxfIYBkSzpbd9Zem7gpBIhiVl8WjbfYNu2M8ZJWIxiGgGzg4Qc+duvvTbg11s1wsAvl6amiPkdtztUIr2sSR0Od6WrIIj5tdqn7GaJIGL8fb70rkDDZ2hQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(40470700004)(33656002)(40460700003)(83380400001)(54906003)(36860700001)(8936002)(478600001)(8676002)(110136005)(4326008)(55016003)(82310400005)(70586007)(82740400003)(40480700001)(52536014)(86362001)(316002)(53546011)(356005)(107886003)(9686003)(2906002)(26005)(7696005)(6506007)(70206006)(41300700001)(47076005)(186003)(81166007)(336012)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 10:53:35.8018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adc593d-7c45-4aad-7a37-08da90bf36bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9760

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy80XSB4
ZW4vYXJtOiBtbTogUmVuYW1lIHhlbmhlYXBfKiB2YXJpYWJsZSB0bw0KPiBkaXJlY3RtYXBfKg0K
PiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAwNy8wOS8yMDIyIDA5OjM2LCBIZW5yeSBXYW5nIHdy
b3RlOg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9t
bS5jDQo+ID4gaW5kZXggN2Y1YjMxN2QzZS4uNGE3MGVkMjk4NiAxMDA2NDQNCj4gPiAtLS0gYS94
ZW4vYXJjaC9hcm0vbW0uYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+ID4gQEAgLTEz
MiwxMiArMTMyLDEyIEBAIHVpbnQ2NF90IGluaXRfdHRicjsNCj4gPiAgIHN0YXRpYyBwYWRkcl90
IHBoeXNfb2Zmc2V0Ow0KPiA+DQo+ID4gICAvKiBMaW1pdHMgb2YgdGhlIFhlbiBoZWFwICovDQo+
ID4gLW1mbl90IHhlbmhlYXBfbWZuX3N0YXJ0IF9fcmVhZF9tb3N0bHkgPSBJTlZBTElEX01GTl9J
TklUSUFMSVpFUjsNCj4gPiAtbWZuX3QgeGVuaGVhcF9tZm5fZW5kIF9fcmVhZF9tb3N0bHk7DQo+
ID4gLXZhZGRyX3QgeGVuaGVhcF92aXJ0X2VuZCBfX3JlYWRfbW9zdGx5Ow0KPiA+ICttZm5fdCBk
aXJlY3RtYXBfbWZuX3N0YXJ0IF9fcmVhZF9tb3N0bHkgPSBJTlZBTElEX01GTl9JTklUSUFMSVpF
UjsNCj4gPiArbWZuX3QgZGlyZWN0bWFwX21mbl9lbmQgX19yZWFkX21vc3RseTsNCj4gPiArdmFk
ZHJfdCBkaXJlY3RtYXBfdmlydF9lbmQgX19yZWFkX21vc3RseTsNCj4gPiAgICNpZmRlZiBDT05G
SUdfQVJNXzY0DQo+ID4gLXZhZGRyX3QgeGVuaGVhcF92aXJ0X3N0YXJ0IF9fcmVhZF9tb3N0bHk7
DQo+ID4gLXVuc2lnbmVkIGxvbmcgeGVuaGVhcF9iYXNlX3BkeCBfX3JlYWRfbW9zdGx5Ow0KPiA+
ICt2YWRkcl90IGRpcmVjdG1hcF92aXJ0X3N0YXJ0IF9fcmVhZF9tb3N0bHk7DQo+ID4gK3Vuc2ln
bmVkIGxvbmcgZGlyZWN0bWFwX2Jhc2VfcGR4IF9fcmVhZF9tb3N0bHk7DQo+ID4gICAjZW5kaWYN
Cj4gPg0KPiA+ICAgdW5zaWduZWQgbG9uZyBmcmFtZXRhYmxlX2Jhc2VfcGR4IF9fcmVhZF9tb3N0
bHk7DQo+ID4gQEAgLTYwOSw3ICs2MDksNyBAQCB2b2lkIF9faW5pdCBzZXR1cF94ZW5oZWFwX21h
cHBpbmdzKHVuc2lnbmVkDQo+IGxvbmcgYmFzZV9tZm4sDQo+IA0KPiBJIHRoaW5rIHRoZSBmdW5j
dGlvbiBhbHNvIHdhbnQgdG8gYmUgcmVuYW1lZCB0byBtYXRjaCB0aGUgY29kZSBiZWxvdy4NCg0K
SG1tbSwgcmVuYW1pbmcgdGhlIG5hbWUgdG8gInNldHVwX2RpcmVjdG1hcF9tYXBwaW5ncyIgd291
bGQNCnNvbWVob3cgbGVhZCBtZSB0byB0aGluayBvZiB3ZSBhcmUgZ2V0dGluZyByaWQgb2YgdGhl
IG5hbWUgInhlbmhlYXAiDQpjb21wbGV0ZWx5IGluIHRoZSBjb2RlLCB3aGljaCBzZWVtcyBhIGxp
dHRsZSBiaXQgc2NhcnkgdG8gbWUuLi4NCg0KQnV0IEkganVzdCBjaGVja2VkIHRoZXJlIGlzIGEg
Y29tbWVudA0KIi8qIFNldCB1cCB0aGUgeGVuaGVhcDogdXAgdG8gMUdCIG9mIGNvbnRpZ3VvdXMs
IGFsd2F5cy1tYXBwZWQgbWVtb3J5LiINCmFib3ZlIHRoZSBmdW5jdGlvbiBhbmQgdGhlIGRlY2xh
cmF0aW9uIHNvIEkgZ3Vlc3Mgd2UgYXJlIGZpbmU/DQoNCj4gDQo+ID4gICAgICAgICAgIHBhbmlj
KCJVbmFibGUgdG8gc2V0dXAgdGhlIHhlbmhlYXAgbWFwcGluZ3MuXG4iKTsNCj4gDQo+IExpa2Vs
eSwgSSB0aGluayB0aGlzIHdhbnRzIHRvIGJlIHMveGVuaGVhcC9kaXJlY3RtYXAvDQoNCk9rLg0K
DQo+IA0KPiA+DQo+ID4gICAgICAgLyogUmVjb3JkIHdoZXJlIHRoZSB4ZW5oZWFwIGlzLCBmb3Ig
dHJhbnNsYXRpb24gcm91dGluZXMuICovDQo+IA0KPiBTYW1lIGhlcmUgYmVjYXVzZSB5b3Ugc2V0
IGRpcmVjdG1hcF92aXJ0X2VuZC4NCg0KT2suDQoNCj4gDQo+ID4gLSAgICB4ZW5oZWFwX3ZpcnRf
ZW5kID0gWEVOSEVBUF9WSVJUX1NUQVJUICsgbnJfbWZucyAqIFBBR0VfU0laRTsNCj4gPiArICAg
IGRpcmVjdG1hcF92aXJ0X2VuZCA9IFhFTkhFQVBfVklSVF9TVEFSVCArIG5yX21mbnMgKiBQQUdF
X1NJWkU7DQo+IA0KPiBJIHdvdWxkIGJlIE9LIHRvIGtlZXAgIlhFTkhFQVBfKiIgZm9yIG5vdy4N
Cg0KVGhhbmtzIGZvciB5b3VyIGNvbmZpcm1hdGlvbi4NCg0KPiANCj4gPiAgIH0NCj4gPiAgICNl
bHNlIC8qIENPTkZJR19BUk1fNjQgKi8NCj4gPiAgIHZvaWQgX19pbml0IHNldHVwX3hlbmhlYXBf
bWFwcGluZ3ModW5zaWduZWQgbG9uZyBiYXNlX21mbiwNCj4gPiBAQCAtNjE4LDEyICs2MTgsMTIg
QEAgdm9pZCBfX2luaXQgc2V0dXBfeGVuaGVhcF9tYXBwaW5ncyh1bnNpZ25lZA0KPiBsb25nIGJh
c2VfbWZuLA0KPiA+ICAgICAgIGludCByYzsNCj4gPg0KPiA+ICAgICAgIC8qIEZpcnN0IGNhbGwg
c2V0cyB0aGUgeGVuaGVhcCBwaHlzaWNhbCBhbmQgdmlydHVhbCBvZmZzZXQuICovDQo+IA0KPiBz
L3hlbmhlYXAvZGlyZWN0bWFwLyBJIGhhdmVuJ3QgbG9va2VkIGlmIHRoZXJlIGFyZSBvdGhlciBp
bnN0YW5jZXMgaW4NCj4gdGhlIGZ1bmN0aW9uLg0KDQpEb24ndCBib3RoZXIsIEkgd2lsbCB0YWtl
IGNhcmUgb2YgdGhlIHJlc3QuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

