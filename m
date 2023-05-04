Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B656F63EB
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 06:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529539.824007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQJV-0000W4-1m; Thu, 04 May 2023 04:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529539.824007; Thu, 04 May 2023 04:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQJU-0000TQ-Ur; Thu, 04 May 2023 04:11:28 +0000
Received: by outflank-mailman (input) for mailman id 529539;
 Thu, 04 May 2023 04:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABSM=AZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1puQJT-0000T9-JW
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 04:11:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bceb1300-ea31-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 06:11:26 +0200 (CEST)
Received: from DB3PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:8::20) by
 AS8PR08MB8969.eurprd08.prod.outlook.com (2603:10a6:20b:5b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 04:11:22 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::89) by DB3PR08CA0007.outlook.office365.com
 (2603:10a6:8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 04:11:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20 via Frontend Transport; Thu, 4 May 2023 04:11:21 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 04 May 2023 04:11:21 +0000
Received: from f58563182d46.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3930B08-7ACF-4A63-923B-820A0CEB416C.1; 
 Thu, 04 May 2023 04:11:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f58563182d46.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 04:11:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9318.eurprd08.prod.outlook.com (2603:10a6:20b:59a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 04:11:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 04:11:13 +0000
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
X-Inumbo-ID: bceb1300-ea31-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxay42dSdmjWN8IT6/RlKiEPIPktamK7xVeI87saUeg=;
 b=qrEwkInrCzW9aNRH/D2CbUoY8lTIBEDk2gqRTy0YTZgc7qpEGR5EGA6h3MkaqB0yLWNM7FSraWf7kxwHIch+Tgg3iwbGDMpT3EcWRvmiC/dTqg0GMeq83Zaw8uapYhGjBDSEN/Nae9foIZpO0mhCTJYRDqsjKyN1f6pAp+QIb50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGFou6L6yyLFXannkGB0McshBhr7X1odx48U/zRMDhhL8c/bTrW3VP0LH/uJsgG2qXfPjiL74GwaPJn/np8LCif9kHsd6p5Pg9zVWEbIuk3pOQhaZi6wPN8TJdaNtRrWakIt383+Hy9lUy5tPYA4uAijQttmdAKnslYBpG7NF8+tY+kJ/VcGyFxCDYA1+gkW3GxOzXONGOMYOehoU9vxyXis5PayngUIeryzqegVY/0m3fKv3Zm+XLC/C+vwrV9sj2NvnFk3pfzee/XARLqEEMMZ+5i1qCRM6tbS//XACLkpltA7DaF0rmXJPcBwC+YQ9JxhXEpHgi/211xgKQ49Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxay42dSdmjWN8IT6/RlKiEPIPktamK7xVeI87saUeg=;
 b=j/pbfzpj9dEqabyTCIhH3VR1nNp5cETezwcRjnBEYEaQ2U7rXRSXFpU9Mi8HvW7HByzRrlXxOAoq15JSHi++W3ugS/aKQbjlm6ELgaSAx6LSLII0wHdGP8r5vaocj1fVAmMiyYj5Eyr0IDdSab6gJaksGc6sC3sNP1Ko/S4FjUsv0sT/ekhhfNmpzcDx/LC0nAbtEEMR6Lh0iNWWHPbV9EsSfCDAqXNGB9JU/BEwADCFphAGvgR4uJH2VEJmxmoPuHLk5vXSTJmatzDSibOUWvfckNa8Zv1gk7eNOfEkzU1z6QMNoLA5/Vs+9c4ae9Cg7gFNI0f7G92PwSX6oDF4cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxay42dSdmjWN8IT6/RlKiEPIPktamK7xVeI87saUeg=;
 b=qrEwkInrCzW9aNRH/D2CbUoY8lTIBEDk2gqRTy0YTZgc7qpEGR5EGA6h3MkaqB0yLWNM7FSraWf7kxwHIch+Tgg3iwbGDMpT3EcWRvmiC/dTqg0GMeq83Zaw8uapYhGjBDSEN/Nae9foIZpO0mhCTJYRDqsjKyN1f6pAp+QIb50=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [XEN][PATCH v6 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Thread-Topic: [XEN][PATCH v6 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Thread-Index: AQHZfU8esEuGfevR30ChHQjU9+v2dq9JgYNw
Date: Thu, 4 May 2023 04:11:12 +0000
Message-ID:
 <AS8PR08MB799123AE54B0ABE907F2FBB8926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-6-vikram.garhwal@amd.com>
In-Reply-To: <20230502233650.20121-6-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 97A432DCC59437498D34F28A40C1798E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9318:EE_|DBAEUR03FT020:EE_|AS8PR08MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: e56dfe3e-d323-4327-94e2-08db4c559e6c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tInXyNO8hj44Vsiq4fqyQS6PWbzKj3/Y8i+FU7ZJZejnEodZx5228Og0CFwpo8MxUoXgO3SeAlzm1fhZDJxOrYNgzC6TSNpdb763BdmhIBaN0PXiu4VTvyuPZPB+ahgzoc7+DqM8hZ8KMKQ269ultHN+B+cCKJDokX65GQx6hR29wcYLqncFIGF4MKVJnAMjUux0GLbpGM8V1fg/LvhUT/bTrPmrtjIrdEhkDG5NBZ03cdDvuzzfFR26b8LqQVz5rYm5S5BUFzjCQhc2J+MyskBnZDKQ/1NRZ4E/KFgkntJXMCUZPsaNWHDc1h9oV+zCsCt7d0sya3hXiUjCZj+N04XHQqmYi7sp7EhTFL0i/hdP/P3Kk6HZcArkE0OzxLLOYOvYlF+nvgQ28zz68hg/cGtSxULjAJ44xbqYmRU0OCPZyrjUJi07Yx/XdRjLfDmm4G07XhJMWtViB6i9NIccvfOHxRplwzmn4qjEuEiiTrFSrQyTmE8VUvWCxR1ibbcGBFsc3nWoQi7XvGSkFaQMz8X3t6K00JDxf6bgjn8Qr1XbN2brjuWnKzVqPa9/ZT8bcKZq7Sz2UxQZ1V06JtOwIbG47NwzLyGLVVAsieJKiiQkiQHC4XLze4kcIlyaHJmb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(38070700005)(7416002)(478600001)(122000001)(55016003)(52536014)(8676002)(5660300002)(8936002)(38100700002)(110136005)(71200400001)(54906003)(6506007)(86362001)(66946007)(66556008)(76116006)(66476007)(7696005)(4326008)(83380400001)(64756008)(26005)(66446008)(316002)(186003)(33656002)(9686003)(41300700001)(2906002)(4744005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9318
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	124e434a-952d-438d-4aab-08db4c559936
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D6G+VX+dKBTBdUcjDsvD+R6/kXGYFuI88hRAsT8hopAzHcb78bIPoeIpUg/OMtfqF7Ke4oYFtApsexvsVCHI2zWF3y49FQ6GYASaySANkPreyUGAqKP5+vl1b/IJaryQ7vRNBj0qYUFrbghXI0x4kRTMo513UU1S6V9Tn0y7Vp8NbzJW6ygI9QZYRTRUtlKGWWXx3ApIQcD+ubOeAqSvcPv/GDm1t4McCSyB4ZbrD2gPaFlHyYqt56cqhKFuLNDjyin9th9i7UquAwN/oL49gyOvDLy2tPBAR7dNSo4zaca5e51jgET35S/CcSf7vOoocN8Ui7m/r0NYRkXXuvwu1mpxCRDRUAnjs2296jqRJX9PrODa8Y5b8abEAPLR7DQYHXcPzWrJsUIoUsNDlbHKZqV9Zw8cZmdwWWcL5RG4XBj6fxzdhPhvPrxEy8o6vYuefgCnugFsc7Kfj/EP6eNPQ9n9a6sMOT1yQWP03OQOCSADsLOg2sQ8WHhHlFiC+oZUJ0ULyUoXq6ORfRSJ4emVa+CC1CHGF1+A0Ukm4+j+2OltRAdnymlN0KSCUB87hy6mEN0EWK0ptromh9yE/9mGlcpeNII11OlQ89FJ4RoyEM1K1XeGbfzilnT2k3f0hawI5FGSRi3quCe/dJ2RWep01qgCRYQc1ndqSgVA1Aq28DvoNpP6VcnqA/S/vHfZ2hN6raQkT/F7iOULn35ediebxzVvXfz4W1cCc+VxeqaiRg8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(70586007)(41300700001)(83380400001)(40480700001)(336012)(33656002)(4744005)(2906002)(316002)(34020700004)(55016003)(5660300002)(478600001)(52536014)(4326008)(86362001)(82740400003)(70206006)(356005)(81166007)(110136005)(54906003)(7696005)(47076005)(40460700003)(36860700001)(186003)(107886003)(6506007)(26005)(9686003)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 04:11:21.6591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e56dfe3e-d323-4327-94e2-08db4c559e6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8969

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v6 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
>=20
> Introduce a config option where the user can enable support for
> adding/removing
> device tree nodes using a device tree binary overlay.

May I please also suggest adding a CHANGELOG entry in the "### Added"
section? I personally think this series deserves a CHANGELOG entry but I
am open to others' opinion though. Thanks!

Kind regards,
Henry

