Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90964365C2E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 17:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113851.216922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsHd-0000wf-DH; Tue, 20 Apr 2021 15:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113851.216922; Tue, 20 Apr 2021 15:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsHd-0000wG-9O; Tue, 20 Apr 2021 15:27:25 +0000
Received: by outflank-mailman (input) for mailman id 113851;
 Tue, 20 Apr 2021 15:27:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IT3j=JR=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lYsHc-0000wB-B1
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 15:27:24 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96b4e718-bc4a-4a72-8fbd-189c89ef4fed;
 Tue, 20 Apr 2021 15:27:22 +0000 (UTC)
Received: from AS8PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:313::15)
 by PR2PR08MB4889.eurprd08.prod.outlook.com (2603:10a6:101:1d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 15:27:19 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::51) by AS8PR04CA0070.outlook.office365.com
 (2603:10a6:20b:313::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Tue, 20 Apr 2021 15:27:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 15:27:18 +0000
Received: ("Tessian outbound 82c2d58b350b:v90");
 Tue, 20 Apr 2021 15:27:18 +0000
Received: from 872fa69dcd09.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12329409-C861-4833-BDF4-6298D854C120.1; 
 Tue, 20 Apr 2021 15:27:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 872fa69dcd09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Apr 2021 15:27:08 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4493.eurprd08.prod.outlook.com (2603:10a6:803:ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 15:27:07 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 15:27:07 +0000
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
X-Inumbo-ID: 96b4e718-bc4a-4a72-8fbd-189c89ef4fed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMgFSJ2DbdCGak6qozq9V8IEU5NJKAZ9i+DXMNUhZnA=;
 b=g5Mz0rk2rO4hISklcrJiU7DtO3txlWm2Z0H8To6pZEtSAzYyH77DTB39x0CNanSv6UClU/9JVNhu3mxhnL/C8Kmf6ahEdVvui1Yes5ZHUZRUs35EZPbzLxzDSkvxK6uSGDzFWrDGuxsvH+R1JMcs4qK8CmU8Xt7C3bDc4FALLY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8bf24576eacf6030
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNV68cRRszVIv/SryDNNNAVzTL3H0ZnNP6vEkyJLkOSHUUX55YV+8lEGdBaObMta724g4JMsB8lbv+TYjGyRtaWbJD4q7TfKlS4LiufZTXCxmEW8sHWbbbKuF87MJQGxmuhEvjr8Ay3gZ1+XLIXfT8CrHcg3DwaNZpIeQmbapaz3H+/e/JCR8Y1JYxNpdDHBmXqotS0VQAomxP8Dr/2HqXxcQ/Xc10dM5Jm0uNcKC4DixMwWXhvFwUS/wVZkEe2Hy6csTVIkFOlDybZOVxMm9S3RQW5Nyc8B24wO711HC3oYtDlDin7xGd+xXvLwmbKno4dGubSSVoMYtaL6zNEcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMgFSJ2DbdCGak6qozq9V8IEU5NJKAZ9i+DXMNUhZnA=;
 b=NGTgmbXWmXdQ3ktoVKfmBB0FH/KssGKW6czb03+F+yH5XRb/A8dCjgGhdvEMLA+O/Zgx1Be/RevCMluEqY0nsfwOPMgNqxdkVWH91sNh1MljoKu2wdb6ELDTNPGwGLAVCYVpmbwopTmNXCmqehHDUHm4Oy6pbAL7gCbjjgZK9Hh0Ie/xOytNvUwf0pjeIUo0JhuUxIPnDm5r28qonf+EOt9Ks4U868BCc4AVkhufRYm19HljApf5RCTrVdvi+mQXC4MmiRpBeYSyn0S6A9orxIYshPoA8kIvtr4C+Zmkwk63Bm2ZhYr4Oz1BTjiuUr7b3EI0d/zmfviYxPRYwj6xDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMgFSJ2DbdCGak6qozq9V8IEU5NJKAZ9i+DXMNUhZnA=;
 b=g5Mz0rk2rO4hISklcrJiU7DtO3txlWm2Z0H8To6pZEtSAzYyH77DTB39x0CNanSv6UClU/9JVNhu3mxhnL/C8Kmf6ahEdVvui1Yes5ZHUZRUs35EZPbzLxzDSkvxK6uSGDzFWrDGuxsvH+R1JMcs4qK8CmU8Xt7C3bDc4FALLY0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xenstored: Remove unused prototype
Thread-Topic: [PATCH] tools/xenstored: Remove unused prototype
Thread-Index: AQHXNev79FvKKrAJ70+ijDo5F6dptaq9h2UA
Date: Tue, 20 Apr 2021 15:27:07 +0000
Message-ID: <80DFE38D-1759-4A07-A320-0B40149CA329@arm.com>
References: <20210420134906.10910-1-julien@xen.org>
In-Reply-To: <20210420134906.10910-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 798bcba4-26c9-429f-9112-08d90410c90c
x-ms-traffictypediagnostic: VI1PR08MB4493:|PR2PR08MB4889:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB48891C5B24435A60816DF2909D489@PR2PR08MB4889.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7I9woHoQZ+wa7FszebqJicJm51JilGkS6+/c2JLOxIwlwhwVEAyOnixgf8BlhB3OVOR7/4/vyAKTI63ya/2l9Vs8+Z4rDT2tJRbiEa/4PD949WGXj7Dmf1V3LLO5bwVI+GvMUuV9Y4yx1XZgtwX7ssRiPAPbYp2Br5ix+9Yh1GAOrGQP6Kq0k5dVV6sad7NXzJF53JST9wtbRz3DHtieGWQ5F5VX6RngMW5O3UfjglXmyu/yeS9QtcQ2CHk4FQ/VJ3svxRSysQ5u8cZY3khoNbG3XUhTg1DtbG60Dv2l4Tq3b19CJCT6RD/UbFdSUWAzTbE1BnabRcL1e6roSRUcun8U1/bMSq4NxVnYtv5TrrJAqjST+MazCl7HjkKpz6Fyi6kl9Wa1/eEmUrWIvDBJBEcaUdf2pco8bG2zqAxEQ3J4ElD+jjRj1UztEej8Ql/0gtuhjs6binjwBI/4R7S0mYfueETjS9vKOSoXDCW0UFaNuhF/PojmV+5kMmaYyRMy4Lz7ho3pu87p/WRh7AYeIPT6nUanDXU8nMSIo/XgIHZxHhAmI18i5uSjqyhe4kfbae9+Y4dsbsOSWpFYdVWOp7RN4dTTQifSe4Afx3YgaHAPxYvqKOmGw2pVI7aHcQ8dFAVFZXTA3VTUZVdUpFhsGabki8FzlMpPADsyVh62Mjc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39850400004)(86362001)(6916009)(33656002)(66946007)(2906002)(4326008)(186003)(8936002)(478600001)(4744005)(53546011)(54906003)(38100700002)(6512007)(122000001)(6506007)(91956017)(71200400001)(64756008)(2616005)(6486002)(26005)(66476007)(83380400001)(66556008)(66446008)(76116006)(5660300002)(8676002)(36756003)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?wMRsUXR1m+DlJRXIvERTBcsefh7y62kZcEStu8uHRaNGnW6HNmFiU4onWVMd?=
 =?us-ascii?Q?Ob4IRar5QdtkhXKMx7ocfmgc6GFQB/NfWNIgOhQrci+4it5YNnoPxxM1pQLr?=
 =?us-ascii?Q?eUiadHy4Ns8owUfU5JzZP3zLp/mdfbmARxok0+5pMlg0d2UFKjYnhOdXNz6V?=
 =?us-ascii?Q?MsaB5OUn6OtxqC6yVDuk0FqmN4JpPuTd62/WYAQ8w7Vp9tQduKP45/WlaTqD?=
 =?us-ascii?Q?4v9kX6x4bp65HZkEBShsaoe9sBszP8TmBiCO0ILAMxzV7v1kARFRGfFL/5Lh?=
 =?us-ascii?Q?hidqH3M1LcYVCqzfG25fCOEyMhXtHIGmaiFI0Hdob9cucwwriDrpIftCkT9d?=
 =?us-ascii?Q?JlRXaytjtLCXAhpprYhAYIG5ilhp04V7LutEH7wcFhzDbhkUzijnaTRura43?=
 =?us-ascii?Q?6MRtmBubdaF96NwkrybasvFUh1KmKQmUsXHG26+mWMbDH2JVRazuSdGsoXbB?=
 =?us-ascii?Q?IroIsTl8qIjRVrv/pio4ZWnxLdJo6NvlUKgniEABUwy+5NbdwqMIXaPY0stl?=
 =?us-ascii?Q?aXw51yqN8aLBO604Xj5D7DuOsXyvX3sjSS3yB3pIK3yXOVBz09b148gz7Z7j?=
 =?us-ascii?Q?4Cq8pBTWauh3WdGG/c6wJ6kALLwh2fP/Qp591uCVCcjhC/U5tOU3mxYKYIMq?=
 =?us-ascii?Q?oHvyQOzjAGccCJYo+8ACHrhZCCYBLK8K5KcM7IvL1gL6kcuLsWdbLFZzI7bv?=
 =?us-ascii?Q?c+yN6Mvx6+PagL5n6fO5BkfiCXGTy6j7A2vwA73tpvbPDQ7+Z5Ks8A3bm9lF?=
 =?us-ascii?Q?07rpXsdRx3TM8wGlX3epAPP8wqVCEdJTkKOV0YLSU/9yFEVpbyeJClVssS51?=
 =?us-ascii?Q?jIefmTChGsSr3qx0OkhnqfPBm8tstE/DggVJPOmtGO2YruMIuNvRoMdJ7sNd?=
 =?us-ascii?Q?/5gvfk+vsuSk3L6w5xLJ3F6ou+Hnb9ALLlkV/538RKGVa+xxQcO+fP+CH7EN?=
 =?us-ascii?Q?VO4fzhI9mBQxUkkKPy1SwznGrwqAuMX9hUFfVOOhAXu/3M1a5MGgqpXq29Nk?=
 =?us-ascii?Q?PlsF5Xxqo38EvayLM6APGxwhPYFwf+p/pLGQnDOI4AfHRlexzPl4LAzB2yGx?=
 =?us-ascii?Q?Zt54RDRCxZVd/d/eMnlbE2GyFDfi7vGlTDnA/x1O7WR9Mlx9dUJoROF+AUTd?=
 =?us-ascii?Q?5JI3YFWi1wK37J21aYeGe6pc7zsA5hUQySOjtqbs8hVe3fPNq7SA+xDK6ZPk?=
 =?us-ascii?Q?hSvU55C7PyBuetG73Hodp5fcxW6Piypunfxj5N/rK7aLxFqkpwT1ax8HcOAN?=
 =?us-ascii?Q?ia2deRNPmCVlS0a6pFxMpFpDiQBWQweTDykFl57ndSmH+TGS3W8Zp3isuppq?=
 =?us-ascii?Q?XbH7PZuJUg7JIhoIoD3Gg9kDqKKYtXorNcPlZ5TcMsCamQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_80DFE38D17594A07A3200B40149CA329armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4493
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea018341-f606-4ac2-4d2c-08d90410c26f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z8hGvOR0xCZJT6paMyE4AG2ikyLjnoAMUw3lnIYa2dX3CMXslfvU2U8TsSKGNSZon2xAsqd9sjLGDRfMwBCQu7fJGNvtQXTIf3HlxSmAdJQ/jAnmc6YCqgL++WIVl7XVU4CMD7M0BCXdy8V0VCRhPoNa1O9IIyvj4wIP7R8+77nNNs6R8ru5P0QcpfuSoIQO/kQltNm9leJS6gjuGm1C6fSqMctJjoPBh7QIVT6FSxt7yeoDbsqS/UG6zeQ3HT3hh4O1BmHrY3EzNoHA6vNOLHy8Cp2V2mihHSHp0E2ihooMtptH+ZOLm/Itb5aHu0wF51G/MOq37tykGv+elmudwPokXnNZuoCndXVXZpt72G/oeK1TBm2kFBbsVK48GLaEXhl+1gDwv4alQEvM494V3NBLQC970EzvEwav/2UZBpPItKtP6Ed8gYtPVBc9qn6mhKggdLeHTSUx2a7K6kc8Gi0LClVkX2sUSWxmk/u7UfcfQSjG/2Se2BUXHdyC2OaXHUVK24kbvzi6E/LejCi3s0WVNKPwxcvAYYa6aqJV59HKN3Nuh0tPakgVYuFM5GK4FWxaGGAPK87wsNq/9g75LIwiflAGN67OjgJ65oMTQe1b1+Er4g/TRnDpluoh7JSBJoVr0iQjr4Ku2D0ym8Mp/Kg0DbN0uZ6ulPpx6VedyLM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(396003)(46966006)(36840700001)(70586007)(8936002)(336012)(186003)(45080400002)(4326008)(83380400001)(54906003)(70206006)(6862004)(53546011)(356005)(6506007)(107886003)(82740400003)(6512007)(36860700001)(47076005)(26005)(82310400003)(478600001)(2616005)(81166007)(316002)(6486002)(5660300002)(8676002)(86362001)(36756003)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 15:27:18.8157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798bcba4-26c9-429f-9112-08d90410c90c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4889

--_000_80DFE38D17594A07A3200B40149CA329armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On 20 Apr 2021, at 14:49, Julien Grall <julien@xen.org<mailto:julien@xen.or=
g>> wrote:

From: Julien Grall <jgrall@amazon.com<mailto:jgrall@amazon.com>>

A prototype for dump_conn() has been present for quite a long time
but there are no implementation. Even, AFAICT in the patch that
introduced it. So drop it.

Signed-off-by: Julien Grall <jgrall@amazon.com<mailto:jgrall@amazon.com>>

Agree, no implementation of this exists so:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>

Cheers
Bertrand

---
tools/xenstore/xenstored_core.c | 1 -
1 file changed, 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_cor=
e.c
index d54a6042a9f7..591b28e4552f 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2085,7 +2085,6 @@ static struct option options[] =3D {
#endif
{ NULL, 0, NULL, 0 } };

-extern void dump_conn(struct connection *conn);
int dom0_domid =3D 0;
int dom0_event =3D 0;
int priv_domid =3D 0;
--
2.17.1




--_000_80DFE38D17594A07A3200B40149CA329armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <AD64F7F85124FD4898A8C124C4630D69@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
Hi Julien,<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 20 Apr 2021, at 14:49, Julien Grall &lt;<a href=3D"mailt=
o:julien@xen.org" class=3D"">julien@xen.org</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">From: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com"=
 class=3D"">jgrall@amazon.com</a>&gt;<br class=3D"">
<br class=3D"">
A prototype for dump_conn() has been present for quite a long time<br class=
=3D"">
but there are no implementation. Even, AFAICT in the patch that<br class=3D=
"">
introduced it. So drop it.<br class=3D"">
<br class=3D"">
Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" class=
=3D"">jgrall@amazon.com</a>&gt;<br class=3D"">
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>Agree, no implementation of this exists so:</div>
<div>Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@a=
rm.com" class=3D"">bertrand.marquis@arm.com</a>&gt;</div>
<div><br class=3D"">
</div>
<div>Cheers</div>
<div>Bertrand</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div class=3D"">---<br class=3D"">
tools/xenstore/xenstored_core.c | 1 -<br class=3D"">
1 file changed, 1 deletion(-)<br class=3D"">
<br class=3D"">
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_cor=
e.c<br class=3D"">
index d54a6042a9f7..591b28e4552f 100644<br class=3D"">
--- a/tools/xenstore/xenstored_core.c<br class=3D"">
+++ b/tools/xenstore/xenstored_core.c<br class=3D"">
@@ -2085,7 +2085,6 @@ static struct option options[] =3D {<br class=3D"">
#endif<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>{ NULL, 0, =
NULL, 0 } };<br class=3D"">
<br class=3D"">
-extern void dump_conn(struct connection *conn); <br class=3D"">
int dom0_domid =3D 0;<br class=3D"">
int dom0_event =3D 0;<br class=3D"">
int priv_domid =3D 0;<br class=3D"">
-- <br class=3D"">
2.17.1<br class=3D"">
<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_80DFE38D17594A07A3200B40149CA329armcom_--

