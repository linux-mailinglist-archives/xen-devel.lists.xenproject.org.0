Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66156FFEF3
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 04:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533675.830521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxISV-0003py-Na; Fri, 12 May 2023 02:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533675.830521; Fri, 12 May 2023 02:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxISV-0003ml-KY; Fri, 12 May 2023 02:24:39 +0000
Received: by outflank-mailman (input) for mailman id 533675;
 Fri, 12 May 2023 02:24:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yer8=BB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pxIST-0003md-Rz
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 02:24:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2088.outbound.protection.outlook.com [40.107.13.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 238cb901-f06c-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 04:24:36 +0200 (CEST)
Received: from AM7PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:20b:100::21)
 by VE1PR08MB5728.eurprd08.prod.outlook.com (2603:10a6:800:1a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 02:24:06 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::e0) by AM7PR02CA0011.outlook.office365.com
 (2603:10a6:20b:100::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22 via Frontend
 Transport; Fri, 12 May 2023 02:24:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.22 via Frontend Transport; Fri, 12 May 2023 02:24:05 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Fri, 12 May 2023 02:24:05 +0000
Received: from beae77381aa4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 531E9221-B98E-44A4-9282-2D50403542FA.1; 
 Fri, 12 May 2023 02:23:59 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id beae77381aa4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 May 2023 02:23:59 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by AM0PR08MB5522.eurprd08.prod.outlook.com (2603:10a6:208:18c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Fri, 12 May
 2023 02:23:58 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::b95e:f68f:2747:5b86]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::b95e:f68f:2747:5b86%5]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 02:23:57 +0000
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
X-Inumbo-ID: 238cb901-f06c-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb7tjz3QY1WBFKT272NHsZ3wggB2VB3aucIwPEG2eHY=;
 b=v0N7MwbPaR7dGS23JrGL8exw7Fe8HsnfLVkISfSMWY9EquAtWuiV3eDmKFe5u/Fil4bwYUbAFgNyw5MrsV7iaFXqyK1cwVO1J4v7bMiMd2KCXNwXp0aLG7Jx0xUA9LHSfSjYH6l6dKUttLv9PcJS7duqI8nTrTrsPfok5jgtc58=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhAY4fN8vLaxY2aVHGK5tJ/kBFqWmnU4Ej3mV1ipY7sX/46+bCdiBXNVait65d21SRlv2qYAHo8eSzDLX0FNStCcVClsGlin1vp6MoB6Nkobgy0aPAOdjKiH/wDJQHc2I4S7OgPfkOQOg68esPs5NZRu+slVFQjUCrKGP9sXIBc/nDyFVEDcBX+/mfBlP/Wovmv+MYoLUi+dUk8/ohJF5gM0gPyJiSgUQbQnVIADraME9gLhF31fagac4PTrTl9hCFuf2DKCkdfbgWOLDsj8J++3fxQnXHiBO76EM1C188c/WcgHFEuInjmBhfwwI1Qt6KjjuLvHLisnFASoY5EX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yb7tjz3QY1WBFKT272NHsZ3wggB2VB3aucIwPEG2eHY=;
 b=mQzSjswNJUHjeKRQOCG4Qs1uKpZIsl9u0PXk7T0Gv5QoZLY1w4K+lKdc5YXLPvyJFlT1Z3QY//A/sqy8Jp3Vt1apVU4JD0t/a7HEcts6qUNQGMhA9cYx5UoyrgVH0TBi6iy9SBRvnMT6YQtEwlyBKUnnt01hh+z1+0mp6e5mVZoACOzmrScJN9mLwe1pY5PrSFdgg0g2jodq9OivYIe3yvsewLUgbSrdnD/zRg3yPhh8F9N7Lf0qbG3njsXB3l2p2DOdhkDDHv/Tl+8c07EhJurOjWM3p8bbRmsmDRwGXGWlS62bgqGuwQPcF3W4ujpzcjzavErs//cDthDy349wTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb7tjz3QY1WBFKT272NHsZ3wggB2VB3aucIwPEG2eHY=;
 b=v0N7MwbPaR7dGS23JrGL8exw7Fe8HsnfLVkISfSMWY9EquAtWuiV3eDmKFe5u/Fil4bwYUbAFgNyw5MrsV7iaFXqyK1cwVO1J4v7bMiMd2KCXNwXp0aLG7Jx0xUA9LHSfSjYH6l6dKUttLv9PcJS7duqI8nTrTrsPfok5jgtc58=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 2/2] xen/arm: domain_build: Fix format specifiers in
 map_{dt_}irq_to_domain()
Thread-Topic: [PATCH v2 2/2] xen/arm: domain_build: Fix format specifiers in
 map_{dt_}irq_to_domain()
Thread-Index: AQHZhAjssQBtAk/jHUK6Bly1mxSXQK9V6XHg
Date: Fri, 12 May 2023 02:23:57 +0000
Message-ID:
 <GV2PR08MB80015FF39CBE6D4DBCDA358092759@GV2PR08MB8001.eurprd08.prod.outlook.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
 <20230511130218.22606-3-michal.orzel@amd.com>
In-Reply-To: <20230511130218.22606-3-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0FEA23880DCBC94AA481157902BB48B7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|AM0PR08MB5522:EE_|AM7EUR03FT009:EE_|VE1PR08MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 01db313a-76ea-4d11-72b2-08db528ff598
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IhzCWRDP0ue0mkD3eev51rgFnDO4FiIcMt0vFQ42QBOCU+R1dWZ2uxvBHdjQzX8/Uct1ogRKcORE4efTH1DDnSO+ExTNIGJXy3VXYuz/3HXfLnaGKGE+MUC6CLjnD1u/1ngqUOvR3/9T3NNIDfNbEO2qofzuNH9kMDVJPVuktBo/BrORYPlR/3fvrDgD/X+R/M3QwJ4KLwVgQMZmsi2bCkwLzWNZ4QqVxM+CyTaN6vsLMpmbC/l44D5NVkGLTbfQDMFiYHkwdDhx7OErBzte2RpO0JLThOtrva4ZzDgoRdZnQKZ5GZbWO3JQVYRqN2y9s8LH5AO40zW4nZng0na9E8WBt3UgX6SefYiUFa5dWjdw6MDmBIw57SGVD25UOzybLZH2ZZZdlBu1RjAAvMbXAcilb0Icenq1IiKR7ULlHPsqCLYq0kfHZXKp6CscU/LBBxLC3I7+x7AUqKQFD2EE+3ULAET8sJZYS6TPuVSfEdSE2aTQIccrpPMa9VBejPU4OdTIADyeaZ1MzDNKcsETVNWTVCDiOhxEwBFuZU8GDQ3zQSdFGNQ85mC+MU/eRdMLSYfJMqoUnU3ajQVaustF/+wtfyzkPxy/vL9zl3qfi0aloIId2IbKc0gynKM4nLvk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199021)(83380400001)(2906002)(4744005)(186003)(9686003)(71200400001)(64756008)(66946007)(66556008)(41300700001)(66446008)(316002)(4326008)(54906003)(66476007)(110136005)(76116006)(5660300002)(478600001)(52536014)(6506007)(26005)(8676002)(8936002)(7696005)(55016003)(38070700005)(38100700002)(33656002)(122000001)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5522
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c423f20-3ada-4a04-7dd2-08db528ff0c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	025+IckRu+1n+ptMLmRoaRGNdWKcsSjnqVgY+ARfLeNdDSN/9jnm1Au01dX3SD0BY2UZRY9PVHUaddwONm5AdHQYlDyNclajZnnvsO9IGW0jNPueVcynFReTcqoyxWQvV8bCsUffey5M8XnVdyU8qWhF6rX93gPAkOxqvThwAw0T5IDYFGSG49JH635vqX9mRP+UNPyxSrhahTY3L+3XqpHtmzuqVlHe9Skrlr21dL3Lic4DsF+/ntK8xbzMUumPBlMY/75OmOADgLGcmUCMO+5lxE7aNkoC29F39LvtCkO5U2sMZSfNgpKw0BVlJVHvNlR1hnllIt2X4cBx6MSfYf1AKne2ra2PBsqzyG3CqVcYsC1tjoyzkG1N4qfPVb17JWMSMEqi84vtmmQOSmE2R61S9Rg9Xx4j/GwYIVTrXtQ5TFQZsL4iZcQ2G34Djup9zEmxPGitw39REYQxZBLaaL0QV/GCw6bo7UKo+lS/eEoqAp5RJ1G8Je5tdZLxpxKN4rXTNu+uX5wOc4476L1+u7ztC3r603WWYZqb5XOZcykRnNaZ0VfOAmim0Vo+bI+54uXnOd4Gj5MGDSXOND7EZmi5r3wOyKZo4lHZ0k0ME2WgHj74TSS0UgjfGSN3kYBma7Bsa1IpsiiHi8AWH0wztRD4OmyxzAbk1SnsZ62RFm19lfLOu1/T4wcVlzaUfui0r7jeW3sUv9ADJmGB+ZAuOSnkAeXXMca14E7t9HJl8LcA7z+VfZ4MXPm/b7tKg+gMGQqwZezp/eSSbWd0pVtg3A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(186003)(86362001)(4744005)(83380400001)(2906002)(356005)(55016003)(81166007)(41300700001)(107886003)(26005)(47076005)(336012)(9686003)(36860700001)(6506007)(110136005)(54906003)(33656002)(40460700003)(5660300002)(8676002)(8936002)(52536014)(7696005)(82310400005)(478600001)(4326008)(316002)(82740400003)(70206006)(70586007)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 02:24:05.6641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01db313a-76ea-4d11-72b2-08db528ff598
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5728

Hi Michal,

> -----Original Message-----
> Subject: [PATCH v2 2/2] xen/arm: domain_build: Fix format specifiers in
> map_{dt_}irq_to_domain()
>=20
> IRQ is of unsigned type so %u should be used. When printing domain id,
> %pd should be the correct format to maintain the consistency.
>=20
> Also, wherever possible, reduce the number of splitted lines for printk()=
.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

