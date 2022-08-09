Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBB758DBDF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 18:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383075.618182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLS3j-0007hb-VE; Tue, 09 Aug 2022 16:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383075.618182; Tue, 09 Aug 2022 16:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLS3j-0007en-SS; Tue, 09 Aug 2022 16:26:23 +0000
Received: by outflank-mailman (input) for mailman id 383075;
 Tue, 09 Aug 2022 16:26:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEZx=YN=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oLS3i-0007e1-1B
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 16:26:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130072.outbound.protection.outlook.com [40.107.13.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffb33fd8-17ff-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 18:26:19 +0200 (CEST)
Received: from AS8PR07CA0044.eurprd07.prod.outlook.com (2603:10a6:20b:459::17)
 by DB9PR08MB7051.eurprd08.prod.outlook.com (2603:10a6:10:2be::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 16:26:17 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::4b) by AS8PR07CA0044.outlook.office365.com
 (2603:10a6:20b:459::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.9 via Frontend
 Transport; Tue, 9 Aug 2022 16:26:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 16:26:16 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 09 Aug 2022 16:26:16 +0000
Received: from 536ec0c140d1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F8F375F-1C8A-40F6-AFC1-C83DF74042ED.1; 
 Tue, 09 Aug 2022 16:26:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 536ec0c140d1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Aug 2022 16:26:09 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI1PR08MB3501.eurprd08.prod.outlook.com (2603:10a6:803:85::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 16:26:07 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 16:26:07 +0000
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
X-Inumbo-ID: ffb33fd8-17ff-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RuuOASsLL07GgiIjHnF9O8BSwDKL0y+CRhVAzTy1qPhZ1KmQhDnWzNludExj4OZ1bA36aRUHb4Jfyz2WHRpvlXkoBb+U8Bu9mlmwJDwl7hz5aFoEW0a56kIW6kSDeAMyiqG0jhN19ZBlTanhBlZZ83q/sW8fILSbskRfE55PcH7LgiDiqAyiBgVajrQu2gEUCIyO9HUXNZOuMjUHZmi8wPfXpC2O7ML1e8zocazA2GTVdbEmZm1FJqhBhy+7eRY/fdbMmFoTK5rqblvEnlu1J3aDMo//dxBKqnpH1aEuKrNCA1gAM+kCi6PlEeDbSza8n9uhqf1PPg7mMVgRkeHsuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX80v2nt/z5wq8hiKScglfEvqL9+M79h/DzART4GQDU=;
 b=ODAT/hag/lCmFKA+zKqM2awrRT6VkHBrDqksadJYCEChmrV03lWn2Jjbi35ARePLrxmYw/R0741xUI86m2YFSj93okXTFycJgzt3bBgOXjXZnkjXjLYIAttIq53PrbbnlUEn1aDE0RmuwO/VheajnwJKNrmOl9y0ELISbWfMZO+GFbXJD+AKu6T8lpljWuGljoOoFCVde2ss9npsGORn+tTAE1pr9WscwjMx7iSDg/KfUXONbdtJu/W6yVoXg0YqCaJdf082lNz9cJeE1XlBo8JmD9+vz0U8Vqj+znaXZBWzXVrxOHvPdVNLUeEQbcP84wjzd87ZmgTJQLlj801PGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX80v2nt/z5wq8hiKScglfEvqL9+M79h/DzART4GQDU=;
 b=1VKMv2k7dCLl3hv+oKN9TKxr0Va+5r7amjfc7f0DN31jfGtwGbxZDRi+6mhN5P+Ej58y2gbYgVjQdCCDQNnsYIwDOApeLh1yJt3RUfH2fSdNW4tWOQBz7C99bum+M7pgEcFTivcukDFJ6ZL2rYaV0J//bYgWnBChjsi6SObzUyw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba0b1f94a670760d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW/TzKWIxvkyw+1s8CjVRG2zb0ha6Eq7Kj1hG+IttMCR1K9Rr1RuVkQla1A/mv0IrFIrCE2Z7saQU7tOVPXv6CDsWY1m4u7IPowRD2H8YbykM0M1qnjZlT9VQ7cZfYiC+0hBMs29Kxxby/VoL8Wd2PTyTeSoNuhpENvEj987DkA0KSUGukHrw+4vbzCad8R8qoi9ycdspgS3limpACps5SQjEUBRZunGvKJ2LFnk2bLtGE7caeQWSF4+CiD9u+q50Qfw/moZguF7ycTds96VMvLppT5jrW461TQ08JVcnGV2cUuQ4cgnQiaeDv/X5uxkaFiHK/d/qRjlCln3Vcignw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX80v2nt/z5wq8hiKScglfEvqL9+M79h/DzART4GQDU=;
 b=CA6DTWK+wIMxaOphSq44YVecxTRxJcYkLbG0NcZ6DTL5niAo2B4aLMDccHzvKf1ajHOcbMCDQvSKJvgZ40poDRuIyteL/biDXpF6HZvZqEYghqaagLJk1Ck0MZEiv2BbTHGzW0S18Q0MdlBC1QrRUw4kYizh09W9mT3+CAr5wjWV0/Q9sLahvYXQGfvdOMgBuvP0Nc9ac25eZOisdlPnnKoitZLTMb1KOTGvyrnwTBVwT8wu+9DtOUv6v5Eu56RUhlgnlUPyEm2A1kesrZbsTgxYVpS7Vifl+o2EU+JalhRAOKMDC3vAWyge143ikcWeUzAGeycRATgec6+vfgKilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX80v2nt/z5wq8hiKScglfEvqL9+M79h/DzART4GQDU=;
 b=1VKMv2k7dCLl3hv+oKN9TKxr0Va+5r7amjfc7f0DN31jfGtwGbxZDRi+6mhN5P+Ej58y2gbYgVjQdCCDQNnsYIwDOApeLh1yJt3RUfH2fSdNW4tWOQBz7C99bum+M7pgEcFTivcukDFJ6ZL2rYaV0J//bYgWnBChjsi6SObzUyw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr <olekstysh@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] xen/pci: replace call to is_memory_hole to pci_check_bar
Thread-Topic: [PATCH] xen/pci: replace call to is_memory_hole to pci_check_bar
Thread-Index: AQHYqOJykksEC+xLCUihSPiXurK3kK2lJb0AgAGQGQCAAAa6gIAACx4A
Date: Tue, 9 Aug 2022 16:26:07 +0000
Message-ID: <AADD096D-DA41-4B11-A869-85FC86BAA1A3@arm.com>
References:
 <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <d5590d91683f2dddb3836b1afb444f30c2f5a7fb.1659713855.git.rahul.singh@arm.com>
 <5e762a42-d0d5-86be-e3cd-64bde82c8b47@gmail.com>
 <43039C71-D661-4C8D-A132-9E020D0D1013@arm.com>
 <ebed1aff-c758-f3ee-7483-fadd28a6cb6b@xen.org>
In-Reply-To: <ebed1aff-c758-f3ee-7483-fadd28a6cb6b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 055218be-afba-435b-ea44-08da7a23e25c
x-ms-traffictypediagnostic:
	VI1PR08MB3501:EE_|VE1EUR03FT049:EE_|DB9PR08MB7051:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FjG02QS9w114my9L/BiQuAj1ZphDoZ8OLv1AmPYBSJ068QuX9Cv5sMOWME3MWJDZl2cCITKDIcBJdTzp+iKEzXf05jpweYRGOicVC8w7SqgA0j/X8j6b+cVePGVi5TNfdJrLwHer2wbMD9TL19NszngBIrgODUTbRWFUCcXlreQoAtxM9UXB3mwP/0CSoCchq9fZQZAWQNjGPOG9pzggZProp1cIyPLzNdqnt7bE92PIxB98TtRtVQvjUOKk7Zpa90oaU09iC7PD0sA6VrHW3dmsfHsnWHg+6db8WVeRUZIdHNfN8LIDdieGguHxdP/dX8yhAqmvNsnssd61sfGD/02s2gJcAtlKdgvIeOD7AzPBan6fXVrpz+tO5HE38G9MCbYNv/ZbIhlTwZs5fbY+cwcqJ3LmI4Wd9pkVOrMTZ/RzSzcwW4lpIOxowP0saZDd7tcK+413szvvLeF6nb4mgpGaHCou0oPTLnVGtQvBB88gz8H63WXLe/9d33CCvRUnARUJpaopQi5MjA8qQ0Q4V2FfiItbJbOS6zIBTRyZeWuIl02FJChkRcQzhXuLWgfHTa/AT+TVXPdVRTNEtmj3g8NjiLTEbBbp/VpCd1SScX5ZJDyomNyINChbpH9n4s5NSUz5fSP2IXg8aoQW8akXZiBC9C3B1/TZbRnM1gQkeW+w6Ok4yvsk+nre0GOzgQaIKpUt5KmON/aDjlOh+e/9f/aStHKb/0DNilJMW+NhTFa6F1fGl1G1Ufp/73w1vTNGaSoVNa/DCmZF5ipXZc6O7LYkVdxajcoR56RiC9mycxMRUSa5NqxA3XjrWqLZiaGNqqG3URIhaoVY/XBb1zEcPw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(38100700002)(38070700005)(186003)(2616005)(6486002)(26005)(6506007)(71200400001)(53546011)(41300700001)(478600001)(6512007)(36756003)(86362001)(91956017)(5660300002)(66446008)(4326008)(66946007)(6916009)(8676002)(66556008)(316002)(64756008)(66476007)(76116006)(122000001)(2906002)(83380400001)(33656002)(54906003)(8936002)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DF07042423CED4D807BEE3BA831C1D6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3501
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14c7a427-900e-4a92-89a4-08da7a23dcca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xINhtDtk6F9Z6aIRNieGGA/67pEYjg4KRXQICdzv4obdwDplNpGt5Hbv58UPNPHC3raUxakLWQTouNkVdQWXOCR8awdZK0/Zj6H6zQbPwNZnIYmXxcOmzOQMBhxny5WrxAAMqdWWsSpdyL1HUdzCf9xZ2H+5+ziQ8UKdUUHl8UXRxf5pFuxmfVq/bAcFIfxMHKfRJ2C9jvYcDXKJbFsfO3DkBonCCodO+x18hNsrYWg7fmSRt8LfAB9eEkH1DuBhFSklbYJSdLGNo3LhkNYEw5SMD96QzV7dANd32QDXlIqxqFR09cntq+W+Vmt3QnxnMRaOwGaKu6J1/HY86Dx7Tsm20TyJQ+yH4iGg9MBlNEia5x6TpTC6GinoS8tKWDz9ti8gGXC1yx2St3DSAaiTh3AwciheGpbjmxB9du1rtMHHaxuuRji37aS3vIyD872l6kILyWIhaMf/YRRBnRSbmBLLN45VDniSzOGR5M7aO2G0owRq0656Hui8erKvnLLmuwLH2yi6E6JkPafWHBR6kgaaaLMDYbRir1QX9U9H5HHRUri1Sfg7ynf0sU53creu8inqsg5ferb3QMeNswWwasJZ3MgF4e3f5GSWkODat7RFUTNpGNG9mXtbJ7ayjbdhMywObJW1WaGP5s6XhT3K2KGsbrDI6e+3dne8mKEfSRlHNIBvZwX+NO7VAaeoTkYuorqo8v8iM7SOrD6MTmTeULcf4R3d/GkBcxs/lve060Ln9yuUG9t7ZrQGaaBaFcznUmTJ1PdxkV45J6wSUfqVD4gPCHV6H8lO4sEnlAtE9ThoOzVWBe7xkh4O+2i8S1w8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(40470700004)(46966006)(356005)(6512007)(26005)(53546011)(82740400003)(36756003)(478600001)(5660300002)(33656002)(41300700001)(40480700001)(336012)(6506007)(2906002)(81166007)(70586007)(8936002)(82310400005)(4326008)(70206006)(8676002)(6862004)(83380400001)(2616005)(36860700001)(86362001)(54906003)(6486002)(40460700003)(316002)(186003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 16:26:16.5436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 055218be-afba-435b-ea44-08da7a23e25c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7051

SGkgSnVsaWVuLA0KDQo+IE9uIDkgQXVnIDIwMjIsIGF0IDQ6NDYgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgUmFodWwsDQo+IA0KPiBUaGlzIHBhdGNo
IHNlZW1zIHRvIGhhdmUgYmVlbiBzZW50IGluLXJlcGx5LXRvIHRoZSBTTU1VdjEgcGF0Y2guIFdh
cyBpdCBpbnRlbmRlZD8NCg0KVGhhdCB3YXMgYnkgbWlzdGFrZSBJIHdhbnQgdG8gc2VuZCBhbGwg
dGhlIHBhdGNoZXMgaW5kZXBlbmRlbnRseSBidXQgc29tZWhvdyBJIHNlbmQgaXQgDQpmcm9tIHNp
bmdsZSBnaXQgInNlbmQtZW1haWzigJ0gY29tbWFuZCBiZWNhdXNlIG9mIHRoYXQgSSB0aGluayB0
aGlzIHBhdGNoIGNvbWVzIGluLXJlcGx5LXRvIA0KU01NVXYxIHBhdGNoLg0KDQo+IA0KPiBPbiAw
OS8wOC8yMDIyIDE2OjIyLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBPbiA4IEF1ZyAyMDIyLCBh
dCA0OjMwIHBtLCBPbGVrc2FuZHIgPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+PiAr
Ym9vbCBwY2lfY2hlY2tfYmFyKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBtZm5fdCBzdGFy
dCwgbWZuX3QgZW5kKQ0KPj4+PiArew0KPj4+PiArICAgIGludCByZXQ7DQo+Pj4+ICsgICAgc3Ry
dWN0IGR0X2RldmljZV9ub2RlICpkdF9ub2RlOw0KPj4+PiArICAgIHN0cnVjdCBkZXZpY2UgKmRl
diA9IChzdHJ1Y3QgZGV2aWNlICopcGNpX3RvX2RldihwZGV2KTsNCj4+PiANCj4+PiANCj4+PiBU
aGUgY2FzdCBpcyBwcmVzZW50IGhlcmUgYmVjYXVzZSBvZiB0aGUgY29uc3Q/DQo+PiBZZXMgeW91
IGFyZSByaWdodCwgY2FzdCBpcyBiZWNhdXNlIG9mIHRoZSBjb25zdC4NCj4+PiANCj4+PiBJIHdv
dWxkIGNvbnNpZGVyIHBhc3NpbmcgImNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2IiBpbnN0ZWFk
IG9mICJzdHJ1Y3QgZGV2aWNlICpkZXYiIHRvIHBjaV9maW5kX2hvc3RfYnJpZGdlX25vZGUoKSBh
bmQgZHJvcHBpbmcgY29udmVyc2lvbiAocGNpPC0+ZGV2KSBpbiBib3RoIGZ1bmN0aW9ucy4NCj4g
DQo+IEl0IGxvb2tzIGxpa2UgdGhpcyBmdW5jdGlvbiB3YXMgYWRkZWQgd2l0aG91dCBhbnkgY2Fs
bGVycy4gVGhlIGNvbW1pdCBtZXNzYWdlIGNsYWltIHRoZXJlIHdpbGwgYmUgc29tZS4gQ2FuIHlv
dSAob3IgT2xla3NhbmRyKSBjb25maXJtIHRoaXMgaXMgbm90IGdvaW5nIHRvIGJlIHByb2JsZW0g
Zm9yIGZ1dHVyZSBwYXRjaGVzPw0KDQpJIGNoZWNrZWQgdGhlIHdob2xlIFBDSSBwYXNzdGhyb3Vn
aCBmZWF0dXJlIGJyYW5jaCB0aGlzIGZ1bmN0aW9uIHdpbGwgYmUgdXNlZCB3aGVuDQp3ZSBhZGQg
aW9tbXUgc3VwcG9ydCBmb3IgUENJIGRldmljZS4gIA0KDQo+IA0KPiBUaGF0IHNhaWQsIEkgYWdy
ZWUgdGhhdCB0aGUgY29udmVyc2lvbiBwY2kgLT4gZGV2IC0+IHBjaSBpcyBwb2ludGxlc3MuIFNv
IEkgd291bGQgc2F5IGlmIHRoZXJlIGFyZSB1c2UgY2FzZSB3aGVyZSB3ZSBvbmx5IGhhdmUgYSAn
ZGV2JyBpbiBoYW5kLCB0aGVuIHdlIGNvdWxkIGFzayB0aGUgY2FsbGVyIHRvIGRvIHRoZSBjb252
ZXJzYXRpb24gb3Igd2UgcHJvdmlkZSBhbiBoZWxwZXIgaWYgdGhlcmUgYXJlIHRvbyBtYW55IGNh
c2VzLg0KPiANCj4+IFllcyBtYWtlIHNlbnNlLiBJIHdpbGwgZG8gdGhhdCBpbiBuZXh0IHZlcnNp
b24uDQo+IA0KPiBXaGlsZSB5b3UgYXJlIG1vZGlmeWluZyB0aGUgcHJvdG90eXBlIGZvciBwY2lf
ZmluZF9ob3N0X2JyaWRnZV9ub2RlKCkgY2FuIHlvdSBjb25zaWRlciB0byBhbHNvIGNvbnN0aWZ5
IHRoZSByZXR1cm4gKGl0IHNob3VsZCBub3QgYmUgbW9kaWZpZWQpPw0KDQpBZ3JlZSwgSSB3aWxs
IGNvbnN0aWZ5IHRoZSByZXRydW4gYWxzby4gDQoNCj4gDQo+IEluIGFueSBjYXNlLCB0aGUgY2hh
bmdlIHN1Z2dlc3RlZCBieSBPbGVrc2FuZHIgc2hvdWxkIHByZWZlcmFibHkgYmUgc2VwYXJhdGUg
dG8gdGhpcyBwYXRjaCBhbmQgYWRkZWQgYmVmb3JlLg0KDQpBY2suIA0KDQpSZWdhcmRzLA0KUmFo
dWwNCg0K

