Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9015259C6
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 04:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328182.551138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npLG4-0004yX-7h; Fri, 13 May 2022 02:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328182.551138; Fri, 13 May 2022 02:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npLG4-0004wb-2W; Fri, 13 May 2022 02:42:24 +0000
Received: by outflank-mailman (input) for mailman id 328182;
 Fri, 13 May 2022 02:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=994T=VV=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1npLG3-0004wV-0J
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 02:42:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe05::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5010f069-d266-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 04:42:21 +0200 (CEST)
Received: from DB6PR07CA0181.eurprd07.prod.outlook.com (2603:10a6:6:42::11) by
 AM9PR08MB6273.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 02:42:18 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::b6) by DB6PR07CA0181.outlook.office365.com
 (2603:10a6:6:42::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.5 via Frontend
 Transport; Fri, 13 May 2022 02:42:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 02:42:18 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Fri, 13 May 2022 02:42:18 +0000
Received: from 9eb195115555.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D537B42A-F7A2-4CA1-9F75-E91FC6876180.1; 
 Fri, 13 May 2022 02:42:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9eb195115555.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 May 2022 02:42:12 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by GV2PR08MB8194.eurprd08.prod.outlook.com (2603:10a6:150:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Fri, 13 May
 2022 02:42:10 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%4]) with mapi id 15.20.5227.023; Fri, 13 May 2022
 02:42:10 +0000
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
X-Inumbo-ID: 5010f069-d266-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ex8yfYye9ucAgMOT+T9EsuC0YtV4k7kkrMrBCy0TCvCV+nvUINs7yKIazfOqtBegwrCnvwdiT7LRDzICJeSh+Nx86BQnAukY4CrWOG93bHtXEvb2onDQD3nbFwp59DFqYljS3uy6B9kD1uX0Qf9/Jfys+YlXepr1PvjzTlQymAwqjB6xUtvCLo0h7B+AOWTBbXprQiz5q/qI9w4bVLpDbTk8r3wTlxgnAbYirIbvdzKoMktgLhGoR0KXZ3+7Fe6h7uboocFP26KWS+DtfwdOpbvfwXq+ei0p1m6o+7c0+E7oORSI76D/8eDR0vB/EMmrfyyHq5jYD1AcjPwRra4xfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YhhWiMDlK172WESsK+wdy5yEx61PMBjjPC0aN5sFxI=;
 b=h9Z3Q3YyEsUd/oy0ltbXTmD+CYgCQuIzUQ55xtLL8gx9pPLZSxf91HXEcVKWc1fk9UudwNjKVD4nsK9BIYJLAimj2Oxs8IykBEFXUF9zzkNCQB0wPqR0EpSOggYgEB4jS4TnhhnRmGBGcSPus1yxackgf8R1AISyuLkD3I1lx8t4gpx5s1tMU/lkFuGutGSrb1yfnHX9sAU7z5B4HQLYx/Ab5JysZc34qbDOyevqpyGHahTnsNBBVYZsrPlzvWpyZfY1RN+J/nbn/Vq56G8fwV7cht4yB8IjheWsRRSI16Dn0iNT2FkQkCiCGb6cWmAxMTfbRRXHiuXrbIuMl7Wajw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YhhWiMDlK172WESsK+wdy5yEx61PMBjjPC0aN5sFxI=;
 b=biKndOkeNmy6SY9tumjSypT1SJ87fIugRGl4S839krLqaLQjEdznx/hhh5mOIYR5/3ILlPhk2xScWzci12FUs/6u13c9DCgtfq5191/VcM+6ZIPHtuSV+bQvir5Xr/bT3XCac41R0it5QqWGr3QM8Lv4bADeLr+9wlwI+OIMuDo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEtryKVLgStzm1C8JkJ5sGn6OwHgneIt7r0raTqLCNZJax0PA+B7/ozPFvHmvfDYVRGXYKy3xdGwo/d/3FPwTtDOQhIEijROcAdICYauOuPCzMc714/1KW4f78vfTB39WVWrVDiNa/RSJkfgU4/o42+gMtDiv7KImXG8d3E9K0yP1Nc6s1ze2rgGidT1Dt4gb06etlpuYVBgEKiMtHl6/Uw7sJvxCzZDkS51cPO+T0x3qSORjBjY90ZcRqKILp61DH5TudAPOeg3zXpdeJmTSElsHZzylBoC5q+Ke6XOQmLia3653pquc8R+yhhxJQj5fqDmcY0BrdFCCiHKOKNVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YhhWiMDlK172WESsK+wdy5yEx61PMBjjPC0aN5sFxI=;
 b=lMh4BSd5knt5EaUeWDvWJ23GFixQ5JPUJ5/tJkHlCXIgEcmNWOh2q4HYRCAY7CSJ5mKZxR0UiTyXR/3iowDYkT0i4ra3TVI3/UOMBahG7RiFfFLAfDf3An3qoFLlxSDQZQ4OCMjHYamVuuS5zb9sYAZxKCdtoqcC/5nnfY6naiXELrt2wcNMWePE9JG446uK/coQ+r2UGahHTSpjqvNOw/TyQMs8AmmmFyPMI8+rzIHrS/9qxTw6NCrQNcucgU5mvrTrpLxvDdE5+Fzkz79W9sXvu0IFf1fYtlDT4Jylag7zxOj2VAwmqEhriW4JcAcJE8mAWTVKsttyUWrl89Smgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YhhWiMDlK172WESsK+wdy5yEx61PMBjjPC0aN5sFxI=;
 b=biKndOkeNmy6SY9tumjSypT1SJ87fIugRGl4S839krLqaLQjEdznx/hhh5mOIYR5/3ILlPhk2xScWzci12FUs/6u13c9DCgtfq5191/VcM+6ZIPHtuSV+bQvir5Xr/bT3XCac41R0it5QqWGr3QM8Lv4bADeLr+9wlwI+OIMuDo=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3 5/8] xen/arm: Add additional reference to owner domain
 when the owner is allocated
Thread-Topic: [PATCH v3 5/8] xen/arm: Add additional reference to owner domain
 when the owner is allocated
Thread-Index: AQHYZeBsChCHxU3E+kiLDNmMZ1+Ip60bEXqAgAD3CMA=
Date: Fri, 13 May 2022 02:42:09 +0000
Message-ID:
 <DU2PR08MB7325F1127BE32FDCFAEA5FBEF7CA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
 <20220512091129.2802997-6-Penny.Zheng@arm.com>
 <32b425e9-2430-8525-913e-6626efbec415@xen.org>
In-Reply-To: <32b425e9-2430-8525-913e-6626efbec415@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5277031DC0D25847835A923FE708E5E1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 18f13235-6f90-4a11-21d2-08da348a3266
x-ms-traffictypediagnostic:
	GV2PR08MB8194:EE_|DBAEUR03FT033:EE_|AM9PR08MB6273:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6273872610385C569688AF45F7CA9@AM9PR08MB6273.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cKaSaohGBo0xx1t2l7GkXFCJcBHnnhFeifpjeFvZsPyyesV3p7m++doD726Z9hLUSbHfzo/f7dKelmsOYPSIz4/fp6HUtnIZqIXuHxsRjr6ky6JGOZGQ7j8XY8LA7L0JYauuzqvGuOESI8WnAdnkupQrWaO8N1ta8Y5zqVa0jJPyoLnPcx0E0zR3juwvzJ1T7kbo9mGSHr7OTr8g4YgjWpB59KRYdEc0MEalYRcirjp8oj7IDYSle41Tqmnkael5Oo4wX22lDr6MJP1aN5I0AbUeLJ1uAHz++ToHkAbpbguJtzuS+Ip6AZ9cm4dp8L4dLGv1AYR4zdKpFNGRnX2Orh7pJSzjGQ3Z8FCdwkKgYbN6EQGLFuii3vPYdCs/oxt4YcG/B/eR+ut4lQbV7c0KZVDEe5zHHyUS0UA+k1MFOUD9IssAkOOwywelcGYKAVMavh8hokyGb6TbYAvEMqw6ya5bksa1HHdjW3C/ZtN4J0VcSw1T8c8W8UWrMoy/V21h9e2p4feK8uWHri1yUgcCQ4iXey3H9Rg8vrIqn256usiOuhE1aqWxMVTnlKpasnN8rFCpBGVUSmH4rpx8Gl3Q1XxpbdVB8nBckB2Edq6To+zkUIBnamhyitTUawvumTkZXQMoTcTwR68B5aejIUwj16KnpzNTgWpJN7vw79fE36DQbWj0HLskB/csWEzE/WCjAWhK+c8gkCPlujlmM1XqFw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8936002)(55016003)(52536014)(33656002)(5660300002)(66476007)(64756008)(66556008)(66946007)(66446008)(8676002)(76116006)(4326008)(38100700002)(86362001)(38070700005)(54906003)(83380400001)(186003)(110136005)(9686003)(6506007)(26005)(7696005)(53546011)(316002)(122000001)(508600001)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8194
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	935a15cc-d793-408c-ecda-08da348a2d88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PzjmN4zG7LdRMVAk+n8f5Myp0BZ6bl49LXIUqs1QR2NhRB0+G5RlWjMBv+yVRZDQvKkSC9mJ4LAI+zrHcRidZiv2/8Vyg2zQdFjeCbf7AnQRgbfR27z/sIqcJdxsyRaDEo/IXGVRO1x96jS/QRraehiOtsTYATXmXt+Khjh2HnqVkL5ckSq26gLDv0qdpih/CdJlH+sbQxcfpgPnYfEB14JOBa2OMt8olJyWURgO09xqoazpg+a0B86j4adyfIbedYdjXW6kqrboE0h0EVAH/qJ8NYeJYEAsUAAdqPMgZ0F2v8pIZke2+05QaSQcnfxoMtODnLwH8PUbFvUdJh+YAX6R+zJKQb7pY0dZtXnRQiDKLLLj/Z/2dNql7SCCtpujypqT561DVSfY8RrhEuXadgX4zsyEzBZ+IptVRw/IxPQPd+OKM+JOXFH5ExSgEnZnkvv7JCMj6cOUbybGGx2xgK11aB7/7TpAByfDMZ2MmpdtrxfaHWRuJ0PST3jgS4EMdDeFQtzzrM1gxROzodvCFNElRIhlWe8WurxSEUrOPHrCX1Sd9LxXgJNQ5by2Z73qEUJMdhlj6Uuabi0NU+S3etRj6zbjiacG4tzFxnOg5vxS2wnQTmlUpNn+zbpyt9199QqwdjQHg8em4RT2KVVEkJCzByp4hQWdzLfGjqVkDwzV2Cki8eYvvCc3rLiSXX6R
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(186003)(83380400001)(336012)(53546011)(6506007)(26005)(9686003)(7696005)(107886003)(36860700001)(47076005)(2906002)(8936002)(52536014)(5660300002)(55016003)(82310400005)(40460700003)(54906003)(508600001)(70206006)(110136005)(70586007)(316002)(4326008)(8676002)(33656002)(356005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 02:42:18.1875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f13235-6f90-4a11-21d2-08da348a3266
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6273

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE1heSAxMiwgMjAyMiA2
OjU0IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+
OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFu
ZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1
ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
NS84XSB4ZW4vYXJtOiBBZGQgYWRkaXRpb25hbCByZWZlcmVuY2UgdG8gb3duZXINCj4gZG9tYWlu
IHdoZW4gdGhlIG93bmVyIGlzIGFsbG9jYXRlZA0KPiANCj4gDQo+IA0KPiBPbiAxMi8wNS8yMDIy
IDEwOjExLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBAQCAtODI3LDYgKzg1OCwzNyBAQCBzdGF0
aWMgaW50IF9faW5pdCBhbGxvY2F0ZV9zaGFyZWRfbWVtb3J5KHN0cnVjdA0KPiBkb21haW4gKmQs
DQo+ID4gICAgICAgICAgIH0NCj4gPiAgICAgICB9DQo+ID4NCj4gPiArICAgIC8qDQo+ID4gKyAg
ICAgKiBHZXQgdGhlIHJpZ2h0IGFtb3VudCBvZiByZWZlcmVuY2VzIHBlciBwYWdlLCB3aGljaCBp
cyB0aGUgbnVtYmVyIG9mDQo+ID4gKyAgICAgKiBib3Jyb3cgZG9tYWlucy4NCj4gPiArICAgICAq
Lw0KPiA+ICsgICAgcmV0ID0gYWNxdWlyZV9ucl9ib3Jyb3dlcl9kb21haW4oZCwgcGJhc2UsIHBz
aXplLCAmbnJfYm9ycm93ZXJzKTsNCj4gPiArICAgIGlmICggcmV0ICkNCj4gPiArICAgICAgICBy
ZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBJbnN0ZWFkIG9mIGxl
dCBib3Jyb3dlciBkb21haW4gZ2V0IGEgcGFnZSByZWYsIHdlIGFkZCBhcyBtYW55DQo+ID4gKyAg
ICAgKiBhZGRpdGlvbmFsIHJlZmVyZW5jZSBhcyB0aGUgbnVtYmVyIG9mIGJvcnJvd2VycyB3aGVu
IHRoZSBvd25lcg0KPiA+ICsgICAgICogaXMgYWxsb2NhdGVkLCBzaW5jZSB0aGVyZSBpcyBhIGNo
YW5jZSB0aGF0IG93bmVyIGlzIGNyZWF0ZWQNCj4gPiArICAgICAqIGFmdGVyIGJvcnJvd2VyLg0K
PiA+ICsgICAgICovDQo+ID4gKyAgICBwYWdlID0gbWZuX3RvX3BhZ2Uoc21mbik7DQo+IFdoZXJl
IGRvIHlvdSBjaGVjayB0aGF0IHRoZSByYW5nZSBbc21mbiwgc21mbiArIG5yX3BhZ2VzXSBpcyBh
Y3R1YWwgUkFNPw0KPiBJZiB0aGVyZSBhcmUgbm9uZSwgdGhlbiB5b3Ugc2hvdWxkIHVzZSBtZm5f
dmFsaWQoKSBmb3IgZWFjaCBtZm4gdG8gZW5zdXJlDQo+IHRoZXJlIHdpbGwgYmUgYSBzdHJ1Y3Qg
cGFnZSBmb3IgaXQuDQo+DQoNCkFjdHVhbGx5LCBiZWZvcmUgdGhpcywgaW4gYWNxdWlyZV9zaGFy
ZWRfbWVtb3J5X2JhbmssIHdlIHdpbGwgZmluYWxseSBjYWxsIGludG8NCmFjcXVpcmVfc3RhdGlj
bWVtX3BhZ2VzIHRvIGFjcXVpcmUgW3NtZm4sIHNtZm4gKyBucl9wYWdlc10sIGFuZCBpbiB0aGVy
ZSwgd2UNCndpbGwgZG8gdGhlIGNoZWNrLiBTZWUgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmM6YWNx
dWlyZV9zdGF0aWNtZW1fcGFnZXM6MjY3Ng0KIA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxp
ZW4gR3JhbGwNCg==

