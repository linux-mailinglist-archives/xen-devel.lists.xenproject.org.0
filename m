Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C868954EF73
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 05:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350986.577467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o22eD-0008D4-8Z; Fri, 17 Jun 2022 03:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350986.577467; Fri, 17 Jun 2022 03:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o22eD-0008AY-5i; Fri, 17 Jun 2022 03:27:49 +0000
Received: by outflank-mailman (input) for mailman id 350986;
 Fri, 17 Jun 2022 03:27:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAhX=WY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o22eB-0008AP-Pp
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 03:27:47 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe05::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74802f9d-eded-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 05:27:46 +0200 (CEST)
Received: from AS9P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::14)
 by AS4PR08MB8167.eurprd08.prod.outlook.com (2603:10a6:20b:58e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 03:27:43 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::a4) by AS9P251CA0012.outlook.office365.com
 (2603:10a6:20b:50f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 17 Jun 2022 03:27:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 03:27:42 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Fri, 17 Jun 2022 03:27:42 +0000
Received: from ebf5bae1dc83.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6C4F512-6CB7-4A0E-9E55-304DF5848B2E.1; 
 Fri, 17 Jun 2022 03:27:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebf5bae1dc83.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jun 2022 03:27:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5071.eurprd08.prod.outlook.com (2603:10a6:803:111::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 17 Jun
 2022 03:27:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%7]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 03:27:28 +0000
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
X-Inumbo-ID: 74802f9d-eded-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Tsa1Neqb8w84xP0+ZQ6/EIH1TggbSRC8YlSHoSW9PoI1ef7iyyyYJCjegldRBmWyGEMuvmYhXKlRmceZVEs0o8scdA61hzNzpeQplr/Bc6amqJmT59hHhFI+iZ90+Pmp6KQ+vi1lhIVPxFh7F0b9/km5mdC6Lz1vfBHo5XDNeh7TPxkdJu+AMfYSv9AkYX6WBzu9kCzcUgOBpLuOMsmys13fY+7EpjRonKMlio6BsImlZ8C6wv8wmTZHaf1pTLcHJLUR5NY0UGLHzFY57QVl7ow99KxZZWK6sPybmLh0xdH06aSkf4k6nwEIK4ZhL950pTRb8aT3gyJ6q47jgxlzNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFevtssOANJP6LvxXC7jOz2yGPru9RJwznpKXFf3yRY=;
 b=iWvYLGJZZgkDLlvWRv+uT4nYuUGsOCn+0l5THYTWq0LceERvj9dfVlTHB64jXfDO/IPyIBpLaRaoLdhMDGu0glXel37HKUF1AW5ci0sEBsdxb011lpXCRyIb8ejn4X6+6mD+ukIP63tyu6QIpBYtwMjDZIjVTXmkEM2K8GHOOojvmjq9F734Mdh63rx6kJYMtsqAladsP5IgEBCSLBWnCa8s4q9UoJKRwDyRoI5YtS2HapgJDCMvJR06OfFp7sl/oza0J9lBP5+cvmZyWYMw8MdeeFbtzL4NFsNycAvffGjgwo3PlKbPj+kR8XtNsF9EjRijEmTUEFc6CkTUxB4q3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFevtssOANJP6LvxXC7jOz2yGPru9RJwznpKXFf3yRY=;
 b=G4DamrJTfAXdoUR+lMu93YWMPw8gLv35F3BAtf9lDQZtsHTYiGgMOWCA1KFID2kCYy1aktkBW/au7mIK2nylWZwlKZaEMukDKt+nDz2xdi9HJWSEWX45fHILpW4Q7obVcpzeS7JjvFBLWjYuV8y0rXoGbnrXps8RnzyBpnuQPmo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJi7X6UAdxNuzh61YDNPRV6ag5QxQGzLul6pYB7V3POrfjHjpZCYT6wNAPHQY/REm+qWYopGH0CYB+MeiNRap2wt1WJBssk2zuvglTKBt0v/z5RmTknSBoAtQrw7A0OPitIZMOFhyRp6lhPoSaMNLZZtHLxu0i4ckaI16t7NroASla/JP89LfoHp5rK3qtyVDcRAtCLBJy60mTneUq+R6EiDO/m2snlIGdJPdktb6miXJwhaCdtGgYGeUrepx2umwwD0Kjb839/njgO+x/ed/5TEWzB9dnsfSCJYNDyEKlihlhOLMRfLutGSYlj5ex+ZODk62tDFqFnFmzjAYA85pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFevtssOANJP6LvxXC7jOz2yGPru9RJwznpKXFf3yRY=;
 b=Gom5gqESgHR0m2WstdyKhm9QajSZfDRiCplDos7dreVWGkn/sr1lF7rWWJPHHlZVHyKDiZ1jRt7VzJ7/+xzHf22vX2ykuYqkIcdjA8V91FgmZMvwTZGiU2DhII5m8r3azfFyVe0zGqWVZaunJzcJc3r3AR2JZd/SlyzgLXCD3yyBIWsSe5xmo/gptCKBT5AO0CcQDVY0odnH/DRhxmf4tpYQu8OQ+imf0pEM5E8Ja6ahzftRRqCNY7TJCKhKbCEuaRXVZYz5azgi7xn4fno0X0CnE4O8DHpvF/1Gfn0zrLgijAyrIh3j3s+87StxROVKrXy5bDc1kflxO20AhoNaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFevtssOANJP6LvxXC7jOz2yGPru9RJwznpKXFf3yRY=;
 b=G4DamrJTfAXdoUR+lMu93YWMPw8gLv35F3BAtf9lDQZtsHTYiGgMOWCA1KFID2kCYy1aktkBW/au7mIK2nylWZwlKZaEMukDKt+nDz2xdi9HJWSEWX45fHILpW4Q7obVcpzeS7JjvFBLWjYuV8y0rXoGbnrXps8RnzyBpnuQPmo=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>,
	"jandryuk@gmail.com" <jandryuk@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: RE: [PATCH v8 0/2] Adds starting the idle domain privileged
Thread-Topic: [PATCH v8 0/2] Adds starting the idle domain privileged
Thread-Index: AQHYdP8PDf+BmAUrf0GccQQ+1OW0J61S/+BQ
Date: Fri, 17 Jun 2022 03:27:28 +0000
Message-ID:
 <AS8PR08MB7991ACC81637588D09EDB4BF92AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220531145646.10062-1-dpsmith@apertussolutions.com>
In-Reply-To: <20220531145646.10062-1-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F65B8D5316620945AA15A8B124A00B8B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: be6b4acf-0182-4180-f22b-08da501156f7
x-ms-traffictypediagnostic:
	VE1PR08MB5071:EE_|VE1EUR03FT020:EE_|AS4PR08MB8167:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR08MB8167E59BC0E7695AF903909B92AF9@AS4PR08MB8167.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dVFf9/LcKfgUfLkkKLp+Z24DMdIU7zh8t0Pj7WUG62GMt61RmYndvlzMDh0XDqADk5QtSfw0J2T7572AkLxySVvpObyhrrsUd3McZNLBgML5J7GpyJLywlBGP4RTDmKtyG3UGYLhIbvOvu34GQ7F89ZrETAV1ulAz+/YqcCM6XlKs5pNnItyp70e5v1U+Wwd4sU2HySPvokP5V5x2V4LS1Jw599Y2pWG++AW0EYhjr0c9gFRRNS7H1ENfllsIuZ/uawyhoNcxvT+vUq3jcUNp6e6D2FzlYRJy0+alYHasfJmRNoMQubqsitRp3ecm3xNkGv8mmp7+1y6UgEeBSPzNjNlxYyQFnVLZs8AqVOlhTcy8IKQd8XCU4esFOPw7LdbUC9wxlY9WidXrocHZomQqDnUoBjpTC64Tr/SaCEBuGMCb++5P/Y2CyOeLc1iR06UwyjDenQx0FPOBmyW8kQ7AJdcqNRT7p9uwhUmlJzHiOABh3Aw7/wT97W4LX6AJrmyUlHy6f8jdVY1JyXLgnfJ/wkGMw41MGz6/LGX1JFhjdIAm65+4Dr3zyaiI39iew2wwqqPdYKK2hoZ+zck8csvaD1ZDuT3CJGIG11L9zvpK1LmOKj91FI5B30i3SCHSyn3mCO50CKYcYZNvp58qTqHZOuBKzz0ZdK1gF4qlhZzApK7vXZ5avGEuXyF425Nz4NxUnNp/EwVTYIjgSqxj/Eu9rFHCPzzBe07k5uG/pacg9Ecb9rf2c8e/PxJw4MzVjaqWgA4Mzp5UJtuqjp+dYfmc6ENfySTLI44IYlmAM5LcxDdP0QeNsc2681kjK0fynHohumQ+kh1LIjcmLmXOPK+bg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(66476007)(66446008)(8676002)(66556008)(64756008)(966005)(4326008)(76116006)(71200400001)(86362001)(54906003)(508600001)(186003)(83380400001)(316002)(8936002)(55016003)(52536014)(122000001)(33656002)(2906002)(5660300002)(6506007)(9686003)(7696005)(110136005)(26005)(38100700002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a7b0b73-860c-4beb-b96c-08da50114e4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K6Kiqujeyok3pm53UqLhLrgtDSdrdQebI7pBEozvLTEYCiSfWQ2QHXOb0tvjjV+F0p/G1bpvCQ5fXUdO2pBMgCWS9KlD/MNQEwkcmUKjUKVboNuh3fQdmjM2mCa6tn02vRd/Jrr6j9+CBRCShfeIDsFM9ATiF2ofbltOAi4aWDkMzkybz+W7AXg31iZKF6OTAZaaDyU+TNNMKF4CfBXay89fq5U4b852Mo5oZqiWiS+qnIvbAVMFIszHLNcNdLv0+Mj5V9ekGSp/J0cxDNjsRa8fI1/0Fu7OpD0S27wLloQedZZT9FAuxjpD8rLaV59gVbQlKwUua96XM6Zxo2FxY2DF3f8i1FeA++pvGbMJLDISG1eg32+3usLCY0jBXwyHqRzv5Q3rw/LrJLEDvWFCiwFmjamXnSBUB+PkqlMaCBclX+vg2pXF9MSaco/o7CC3aW7ayTXt63OwH0UauyHWek34foFJuhvB9k+bb/o/Lve/rZZ6y6sV68lRkRptqVFheDlnz5GCsQtoUyd56wLfY7YBarSBWp6kcuGHI8s/l6va7E1XasoGMzuonasgb4/UArShi0w61Obse7iCnIpqNDitA3X5WIfEMJLq9kS/LgGHwLT14aqHmJXJ5JmnSVoU3+DM7wLQ/izKGU6W9RCYjVtYo93hVBD328Y4Q6HX3rndWEo3STocVretIzn+AunOAX5Hl9xiMfti3F7Ar/4lfFgNqBZzPgIlW0CZin0rYk8UyQOPNQohyptJBLu96K0RN1fheQnagAdIhSS3+AeJSu+43wsV34vAB5W+wToiiXyVcz2zyoryKSifDIDIy+ei
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(46966006)(40470700004)(9686003)(81166007)(2906002)(186003)(82310400005)(6506007)(8676002)(110136005)(7696005)(26005)(54906003)(47076005)(40460700003)(83380400001)(356005)(5660300002)(336012)(52536014)(33656002)(316002)(966005)(55016003)(4326008)(8936002)(498600001)(86362001)(70206006)(70586007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 03:27:42.8989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be6b4acf-0182-4180-f22b-08da501156f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8167

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgaXMgc3RhbGUgZm9yIGEgd2hpbGUgd2l0
aCBhdXRob3IncyBhY3Rpb24gbmVlZGVkIGZvcg0KUGF0Y2gjMSBbMV0gKGFuZCBwcm9iYWJseSBh
bHNvIG5lZWQgYWNrIGZyb20gZmxhc2sgbWFpbnRhaW5lciBmb3IgWzJdKS4gU28gdGhpcyBlbWFp
bA0KaXMgYSBnZW50bGUgcmVtaW5kZXIgYWJvdXQgdGhpcyBzZXJpZXMuIFRoYW5rcyENCg0KWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAy
MjA1MzExNDU2NDYuMTAwNjItMi1kcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tLw0KWzJdIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAyMjA1
MzExNDU2NDYuMTAwNjItMy1kcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tLw0KDQpLaW5kIHJl
Z2FyZHMsDQpIZW5yeQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhl
bi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFs
ZiBPZg0KPiBEYW5pZWwgUC4gU21pdGgNCj4gU3ViamVjdDogW1BBVENIIHY4IDAvMl0gQWRkcyBz
dGFydGluZyB0aGUgaWRsZSBkb21haW4gcHJpdmlsZWdlZA0KPiANCj4gVGhpcyBzZXJpZXMgbWFr
ZXMgaXQgc28gdGhhdCB0aGUgaWRsZSBkb21haW4gaXMgc3RhcnRlZCBwcml2aWxlZ2VkIHVuZGVy
IHRoZQ0KPiBkZWZhdWx0IHBvbGljeSwgd2hpY2ggdGhlIFNJTE8gcG9saWN5IGluaGVyaXRzLCBh
bmQgdW5kZXIgdGhlIGZsYXNrIHBvbGljeS4gSXQNCj4gdGhlbiBpbnRyb2R1Y2VzIGEgbmV3IG9u
ZS13YXkgWFNNIGhvb2ssIHhzbV90cmFuc2l0aW9uX3J1bm5pbmcsIHRoYXQgaXMNCj4gaG9va2Vk
DQo+IGJ5IGFuIFhTTSBwb2xpY3kgdG8gdHJhbnNpdGlvbiB0aGUgaWRsZSBkb21haW4gdG8gaXRz
IHJ1bm5pbmcgcHJpdmlsZWdlIGxldmVsLg0KPiANCj4gQ2hhbmdlcyBpbiB2ODoNCj4gLSBhZGp1
c3RlZCBwYW5pYyBtZXNzYWdlcyBpbiBhcm0gYW5kIHg4NiBzZXR1cC5jIHRvIGJlIGxlc3MgdGhh
biA4MGNvbHMNCj4gLSBmaXhlZCBjb21tZW50IGxpbmUgdGhhdCB3ZW50IG92ZXIgODBjb2wNCj4g
LSBhZGRlZCBsaW5lIGluIHBhdGNoICMxIGNvbW1pdCBtZXNzYWdlIHRvIGNsYXJpZnkgdGhlIG5l
ZWQgaXMgZm9yIGRvbWFpbg0KPiAgIGNyZWF0aW9uDQo+IA0KPiBDaGFuZ2VzIGluIHY3Og0KPiAt
IGFkanVzdGVkIGVycm9yIG1lc3NhZ2UgaW4gZGVmYXVsdCBhbmQgZmxhc2sgeHNtX3NldF9zeXN0
ZW1fYWN0aXZlIGhvb2tzDQo+IC0gbWVyZ2VkIHBhbmljIG1lc3NhZ2VzIGluIGFybSBhbmQgeDg2
IHNldHVwLmMgdG8gYSBzaW5nbGUgbGluZQ0KPiANCj4gQ2hhbmdlcyBpbiB2NjoNCj4gLSByZWFk
ZGVkIHRoZSBzZXR0aW5nIG9mIGlzX3ByaXZpbGVnZWQgaW4gZmxhc2tfc2V0X3N5c3RlbV9hY3Rp
dmUoKQ0KPiAtIGNsYXJpZmllZCBjb21tZW50IG9uIGlzX3ByaXZpbGVnZWQgaW4gZmxhc2tfc2V0
X3N5c3RlbV9hY3RpdmUoKQ0KPiAtIGFkZGVkIEFTU0VSVCBvbiBpc19wcml2aWxlZ2VkIGFuZCBz
ZWxmX3NpZCBpbiBmbGFza19zZXRfc3lzdGVtX2FjdGl2ZSgpDQo+IC0gZml4ZWQgZXJyIGNvZGUg
cmV0dXJuZWQgb24gQXJtIGZvciB4c21fc2V0X3N5c3RlbV9hY3RpdmUoKSBwYW5pYw0KPiBtZXNz
YWdlDQo+IA0KPiBDaGFuZ2VzIGluIHY1Og0KPiAtIGRyb3BwZWQgc2V0dGluZyBpc19wcml2aWxl
Z2VkIGluIGZsYXNrX3NldF9zeXN0ZW1fYWN0aXZlKCkNCj4gLSBhZGRlZCBlcnIgY29kZSByZXR1
cm5lZCBieSB4c21fc2V0X3N5c3RlbV9hY3RpdmUoKSB0byBwYW5pYyBtZXNzYWdlDQo+IA0KPiBD
aGFuZ2VzIGluIHY0Og0KPiAtIHJld29yZGVkIHBhdGNoIDEgY29tbWl0IG1lc3NhZ2VkDQo+IC0g
Zml4ZWQgd2hpdGVzcGFjZSB0byBjb2Rpbmcgc3R5bGUNCj4gLSBmaXhlZCBjb21tZW50IHRvIGNv
ZGluZyBzdHlsZQ0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZW5hbWVkICpfdHJhbnNpdGlv
bl9ydW5uaW5nKCkgdG8gKl9zZXRfc3lzdGVtX2FjdGl2ZSgpDQo+IC0gY2hhbmdlZCB0aGUgWFNN
IGhvb2sgc2V0X3N5c3RlbV9hY3RpdmUoKSBmcm9tIHZvaWQgdG8gaW50IHJldHVybg0KPiAtIGFk
ZGVkIEFTU0VSVCBjaGVjayBmb3IgdGhlIGV4cGVjdGVkIHByaXZpbGVnZSBsZXZlbCBlYWNoIFhT
TSBwb2xpY3kNCj4gZXhwZWN0ZWQNCj4gLSByZXBsYWNlZCBhIGNoZWNrIGFnYWluc3QgaXNfcHJp
dmlsZWdlZCBpbiBlYWNoIGFyY2ggd2l0aCBjaGVja2luZyB0aGUNCj4gcmV0dXJuDQo+ICAgdmFs
dWUgZnJvbSB0aGUgY2FsbCB0byB4c21fc2V0X3N5c3RlbV9hY3RpdmUoKQ0KPiANCj4gQ2hhbmdl
cyBpbiB2MjoNCj4gLSByZW5hbWVkIGZsYXNrX2RvbWFpbl9ydW50aW1lX3NlY3VyaXR5KCkgdG8g
Zmxhc2tfdHJhbnNpdGlvbl9ydW5uaW5nKCkNCj4gLSBhZGRlZCB0aGUgbWlzc2VkIGFzc2lnbm1l
bnQgb2Ygc2VsZl9zaWQNCj4gDQo+IERhbmllbCBQLiBTbWl0aCAoMik6DQo+ICAgeHNtOiBjcmVh
dGUgaWRsZSBkb21haW4gcHJpdmlsZWdlZCBhbmQgZGVtb3RlIGFmdGVyIHNldHVwDQo+ICAgZmxh
c2s6IGltcGxlbWVudCB4c21fc2V0X3N5c3RlbV9hY3RpdmUNCj4gDQo+ICB0b29scy9mbGFzay9w
b2xpY3kvbW9kdWxlcy94ZW4uaWYgICAgICB8ICA2ICsrKysrDQo+ICB0b29scy9mbGFzay9wb2xp
Y3kvbW9kdWxlcy94ZW4udGUgICAgICB8ICAxICsNCj4gIHRvb2xzL2ZsYXNrL3BvbGljeS9wb2xp
Y3kvaW5pdGlhbF9zaWRzIHwgIDEgKw0KPiAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAg
ICAgICAgICAgfCAgMyArKysNCj4gIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICAg
ICAgIHwgIDQgKysrKw0KPiAgeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgICAgICAgICAgICAgICAg
fCAgNyArKysrKy0NCj4gIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5oICAgICAgICAgICAgICAgIHwg
MTcgKysrKysrKysrKysrKysNCj4gIHhlbi9pbmNsdWRlL3hzbS94c20uaCAgICAgICAgICAgICAg
ICAgIHwgIDYgKysrKysNCj4gIHhlbi94c20vZHVtbXkuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKw0KPiAgeGVuL3hzbS9mbGFzay9ob29rcy5jICAgICAgICAgICAgICAgICAgfCAzMiAr
KysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgeGVuL3hzbS9mbGFzay9wb2xpY3kvaW5pdGlh
bF9zaWRzICAgICAgfCAgMSArDQo+ICAxMSBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi4yMC4xDQo+IA0KDQo=

