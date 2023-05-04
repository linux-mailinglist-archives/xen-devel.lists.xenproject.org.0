Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968336F63F0
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 06:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529542.824016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQMG-00015v-Er; Thu, 04 May 2023 04:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529542.824016; Thu, 04 May 2023 04:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQMG-00014E-Bt; Thu, 04 May 2023 04:14:20 +0000
Received: by outflank-mailman (input) for mailman id 529542;
 Thu, 04 May 2023 04:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABSM=AZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1puQME-000140-HR
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 04:14:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22ca196c-ea32-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 06:14:17 +0200 (CEST)
Received: from AS4P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::8)
 by PAWPR08MB10017.eurprd08.prod.outlook.com (2603:10a6:102:34e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.36; Thu, 4 May
 2023 04:13:48 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5e2:cafe::41) by AS4P195CA0001.outlook.office365.com
 (2603:10a6:20b:5e2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25 via Frontend
 Transport; Thu, 4 May 2023 04:13:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 04:13:47 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 04 May 2023 04:13:47 +0000
Received: from 935fa7e549fd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 382A2462-025A-48FB-86A2-9B54290EC670.1; 
 Thu, 04 May 2023 04:13:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 935fa7e549fd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 04:13:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9318.eurprd08.prod.outlook.com (2603:10a6:20b:59a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 04:13:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 04:13:39 +0000
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
X-Inumbo-ID: 22ca196c-ea32-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3kU+1WbGesUTX/nZUfvqnyHgj4JvcY4aYWwS7cXBno=;
 b=PZNlDyRsB1aXaOVAURS+iO17+j2kjnu9+KEp+JAu+1ajgtnE9nO7PVD5zhYoFmPlyUK45QcwFhECAqViRNorNyjDuViMplurl3sQZYoN/3ckXwJ/DUbyEmsM3SvPQFAA7o23LKgj5eCSrzrWD3lOx2+9yFgPSFRMQoQ5AXgYsFI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLxvT5ggCmmSVQy73NC25iTWkS6CNVZKgNxn8nc8oeaphV7pt9H4cZInVKCLpBgi/mptK4YNAqwEkbGFDNuOIQDA2tu8dmm1zlX0HIEx9UfnqoRbClFwPtupflpSkXlsDlpJt7ifCCWFX20PwkT3YTxGbadCGc4ZEzzeUhKg2bYzfHvZny6Q7UwHIQ/X7SIWAhb9pXfxVZc6ljfImL0zZihn1/vAopDmba7gmS+RP79FOASdUk6rvntlcR8cjbhgS/Um9r3PM07LPO/CAHG4t1j+ynrDYgug8EfhBp7C7t5elhwF2Slq8fVFqGq4VS1xDCICo1FyT8Y10oX/VJMgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3kU+1WbGesUTX/nZUfvqnyHgj4JvcY4aYWwS7cXBno=;
 b=XiFy/0yq9tZ2OdxoG/ghQk8trvww9wKWpprYaQ3QfC8TbfEL0T4m6J887eF3umlxcMZVs2MpdAXqZ5slxQvhUgw5Tmk9ZzVOacsAKN8ZZTFfcgSVzUshyJmDawvBbuFjJ9duTsLoKoSx5UJidNh3xP+dfU0FZp3+XuAQwsivCbFksWg/OL01nV4gVkW3G67ODNzyrpbfW54oYo4CFt6mGaVL94HPriYzYqwzfvCn/ym3dWcuB2ajmRx3lhPpTy/U5vbKQUAD3Txuvq27+l8onjQo9jWunMG6gJnTa6q1E/C4/crM5OqxxUdoLcLXCt/ebaVG4+jqljwiTWdxqJOnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3kU+1WbGesUTX/nZUfvqnyHgj4JvcY4aYWwS7cXBno=;
 b=PZNlDyRsB1aXaOVAURS+iO17+j2kjnu9+KEp+JAu+1ajgtnE9nO7PVD5zhYoFmPlyUK45QcwFhECAqViRNorNyjDuViMplurl3sQZYoN/3ckXwJ/DUbyEmsM3SvPQFAA7o23LKgj5eCSrzrWD3lOx2+9yFgPSFRMQoQ5AXgYsFI=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [XEN][PATCH v6 07/19] libfdt: overlay: change
 overlay_get_target()
Thread-Topic: [XEN][PATCH v6 07/19] libfdt: overlay: change
 overlay_get_target()
Thread-Index: AQHZfU8lidJvDau6tkqOqDCcDCOd6K9JgsNA
Date: Thu, 4 May 2023 04:13:39 +0000
Message-ID:
 <AS8PR08MB79916EBA9A9AD2540BDB6676926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-8-vikram.garhwal@amd.com>
In-Reply-To: <20230502233650.20121-8-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8EB2B4542D95134BB0A71869053B359A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9318:EE_|AM7EUR03FT046:EE_|PAWPR08MB10017:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a288c1-5c2c-4909-0948-08db4c55f565
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3IKUGnKAyCG4He4Cr6wW2BGCouWJapks1E2DlcMKUo3mPAuAQWlhjjKOIo5YwEKaGI+qhkFs6yAgRupFKP1O83heVP/DwouEtf8d6IDX64Obkpq50eNITM6MsTIHoGqn/VU/HQTv9hUeo+XhTyDod31YKxruu2GMV7782nPRY+bRIDL7I9JI0BcV5ciP2Tc78WRuExApvb1hYB8v0trB7xB/roWWKDFqDRLqj2iYORQ4dnU0+ChLa3MYH7iiS/CgjfWnyO8ZSyqajrUAN0Yiu9uysn3VRjbQa+a9Z5sHGKJyQiFSM+gWnyoJrpgAaqhQp6ohicGUcDSYoRO9fPtNaeEb3U8dUKFp9Cf+Ais/XRMt+3RifymEKehCxV8iI2Fg4DA6KJXfEt/jtCEEK0+2z9tpCwg8v/LF3HrtZ0WRi75WdDY8OEHrZFd0Xg0X6o5Rhgbb23ddvPcTimn7gkRjiA7tVI3KfXnrgwl6LTcQB2/dxtA6LV5J0RDF8pg90vLzslQUbO3SgxfKQbpRQmu3HD64rgc/2hhOs1yx6O+rR0yPh14VOfmpjN1CgsBt2fkW4P2y3GsSA00bqcAnTc+gkxzXoXMXXLI6I+7mZRNqfZi09C6bRm0c5XeRWMyfyOtJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(38070700005)(478600001)(122000001)(55016003)(52536014)(8676002)(5660300002)(8936002)(38100700002)(110136005)(71200400001)(54906003)(6506007)(86362001)(66946007)(66556008)(76116006)(66476007)(7696005)(4326008)(83380400001)(64756008)(26005)(66446008)(316002)(186003)(33656002)(9686003)(41300700001)(2906002)(4744005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9318
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b518887-47c0-47d0-fc2c-08db4c55f06d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JD/dNjjbdY3Uww9hh/hSZZCW3QTbUvU0tLUnE4sG7Tixy+GdJYavXCmdcx3nLV4uRA/xdtoZo3BKRgPgck6MNiiS0Ze7If308hZyneI019uUViqv0IV1lugBp0mBw1apDfrdVqyfSQGcxjVI4maPvu4DOSfgtQkdXclgUdv1ZhLUIYCrMHUBZHbDJMkdOlT8vLdA+3Q+sv2pOCa9FsXpKvzZFe6t212C7Eeya6UZgUX3fD36jrS+XNBWDa5+ejg+Fv/XQ/7vra4Ifx8jKFmmhWsRubUiA+vkUSSIyRh6BomG2I+GiOjRrin06RiXCWkXBKb6C9kP+5YXlaiBWpX2sK8wtgOC+e/BE/L0Y23C08Ch1pI9+bS6I/5fIxdenFPqVp035BuwwwUwomXlMLL6s76kjLBLh442adbgHs96DJJQWn6A6mEd1LheyXI3tv15xOFX6dK80FebR2AAB4F8j9x9DYYfwoxv2cytFkFqxzadvzDEmXsxSQG0clnq5ckthbOT016ufmnjDaCxWLevrgXM4iXUC0S96MB5iGjijGelr0LGzJBvWEi0yLH7qFgQop6mHxPmyv5Ua04Pf/PRTJr7se+J9MlOACRZ9yfTPgX70PKJJZbTXfyz4WjezDy01nVkX67OFbdc0DcNm2Na0czDgHukNgv+HxffZpn7KPS5qMj+Nwj3MRK6p/TH7Dsb6msyAYS0111EWPbhTSDiXcxAFNWy74SxAdA5/LgVeR0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(40480700001)(34020700004)(478600001)(356005)(81166007)(55016003)(52536014)(82740400003)(8936002)(5660300002)(8676002)(40460700003)(86362001)(7696005)(54906003)(82310400005)(26005)(2906002)(6506007)(70206006)(47076005)(70586007)(336012)(107886003)(83380400001)(4326008)(33656002)(316002)(186003)(9686003)(41300700001)(4744005)(110136005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 04:13:47.5402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a288c1-5c2c-4909-0948-08db4c55f565
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10017

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v6 07/19] libfdt: overlay: change overlay_get_target=
()
>=20
> Rename overlay_get_target() to fdt_overlay_target_offset() and remove sta=
tic
> function type.
>=20
> This is done to get the target path for the overlay nodes which is very u=
seful
> in many cases. For example, Xen hypervisor needs it when applying overlay=
s
> because Xen needs to do further processing of the overlay nodes, e.g.
> mapping of
> resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables,
> etc.
>=20
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Message-Id: <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Origin: git://git.kernel.org/pub/scm/utils/dtc/dtc.git 45f3d1a095dd
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

