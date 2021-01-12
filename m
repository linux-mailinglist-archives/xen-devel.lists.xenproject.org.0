Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932E32F2B83
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 10:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65547.116155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzGB6-0003yP-Kc; Tue, 12 Jan 2021 09:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65547.116155; Tue, 12 Jan 2021 09:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzGB6-0003y0-G6; Tue, 12 Jan 2021 09:41:28 +0000
Received: by outflank-mailman (input) for mailman id 65547;
 Tue, 12 Jan 2021 09:41:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0QE=GP=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kzGB5-0003xv-20
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 09:41:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18a1e073-80d0-45cb-a490-7850e78fe938;
 Tue, 12 Jan 2021 09:41:22 +0000 (UTC)
Received: from MR2P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::17) by
 AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9; Tue, 12 Jan 2021 09:41:19 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::c0) by MR2P264CA0178.outlook.office365.com
 (2603:10a6:501::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8 via Frontend
 Transport; Tue, 12 Jan 2021 09:41:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:41:18 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Tue, 12 Jan 2021 09:41:17 +0000
Received: from c59b13ae0cca.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E742951-4723-4E45-9DA3-07695B57D2E2.1; 
 Tue, 12 Jan 2021 09:41:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c59b13ae0cca.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 09:41:12 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3881.eurprd08.prod.outlook.com (2603:10a6:10:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:41:09 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:41:09 +0000
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
X-Inumbo-ID: 18a1e073-80d0-45cb-a490-7850e78fe938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiulSQb4sQHNa9psZi8GRvDQYxZCBBfzcopfIYeDQNE=;
 b=RD/vCVFHPxb41m11/85WSp8Xio/Htzt0m8Z68oGSDL+W8RL1XtM0QR4K8120G6ZlEaTieZZYlnBtyccIwE2wtJrL+QSLjVXm9pL36N8XnQBlKuRxnL4LVsgXnNwKF8M4MOJtXzK+SPNMi68edWs0JJKjkOPSdrZFCNG2/F27PE8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95079138408157da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5C6UY8bLW5/CRqmW9zWAu65V2ItX1fiKCjY05U7QV2xogsKhZuCYtBVqjtR7oY9Szs1WSxM9AujXoaLzLOsEPfNdnB5R+A1Udc4GkGGhRIC6RfFHbYMqwEO0OE3Yo2X3KBZRqsaqt4wicPJIsqKzINAozZVqivAF7n3JWwVm0OhJ1V5SkwTbxH9iFMI9vEEi5YCyCtEH8ziFJR2kfazqIR/k9+IWG/LCoeGYsn6EuSWu7rE6i13m9J51BEdtWBVyu+qcHpeHMhN9pB2uVqdjNL5zZg5CR+digxctyf5wZ7uZ2hCtO9E8f+h2G5BV6mcFRK7EW4/ousJXFXCeLitBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiulSQb4sQHNa9psZi8GRvDQYxZCBBfzcopfIYeDQNE=;
 b=VeGN4kx9158blJYb3efJ5D4udTGezEeH8ikYCWPzXxcaN8nfQKxMePfHnoU23Ja5gnbGJEkVTMeuT59X7y9qJ3VO7hx1Xy1SKHfuyTR807btv4rpxK9A0W327BEv0D28w96acIZfOo8mtN1kqCf+wNRUIwjViZFX+yq42CvdwDH7G2V/DeqHjkD930WmKzfxSYcW7CNv+rTKTI5WOX7cTnaj4l5P3DDsNIbnxHnwFxi/lpw0sBAbQDHhwNV/U5AZtUIScrl7n3KwKTgYsAI/Fepo3keZvp6SAXAD0ZE5aV9q2OEBQyBxG/x8pDdWXOgPFw6vvLFVb/X/TKOQn0wjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiulSQb4sQHNa9psZi8GRvDQYxZCBBfzcopfIYeDQNE=;
 b=RD/vCVFHPxb41m11/85WSp8Xio/Htzt0m8Z68oGSDL+W8RL1XtM0QR4K8120G6ZlEaTieZZYlnBtyccIwE2wtJrL+QSLjVXm9pL36N8XnQBlKuRxnL4LVsgXnNwKF8M4MOJtXzK+SPNMi68edWs0JJKjkOPSdrZFCNG2/F27PE8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index: AQHW5c4BALh9w79bakGJi7B8FnwYpqoinLCAgAElzwA=
Date: Tue, 12 Jan 2021 09:41:09 +0000
Message-ID: <A92B97AF-953C-4523-A438-CED1D8C1F1AC@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
 <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
In-Reply-To: <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0a51d3b-2cf9-4971-4b4a-08d8b6de366f
x-ms-traffictypediagnostic: DB7PR08MB3881:|AS8PR08MB6168:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6168A4ABD36A0F46AC41CE2DFCAA0@AS8PR08MB6168.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 E0Mcvt+7SJQE93/gW2cedJmDTyihKQDcB9FcmOs6dHYOXjoAcr27krAy5BNxR2QpNp6jbdfxXx9M6YKKJn8SAStm/fcoPFQ3oMwR3J3YdroaLfYhBW2lBBVOY7k6pHW6zMvZLqGKgvvwASg/Z8+7z7HBG0Gb+RUnsa8YZZgx4dQgNJfh8ZGbxQ8W3O+30f1su/mbwr1lSaSKGVCjWdZw/WzLOYBDAxF5XhPr9LiyFaWvo/DsDzOcYXPtpKjBfA+ulT3BYTv6pefv2mFomutthcCk7taya7BSMO3REnHTuUvjhwqTQpUAa+XjRYQKfHOYDm1XoHBo//C22yaaHkJ/rI0NaQBVV9126k1VqYA2jYrbD5KPU75fueqgUfWd9c7VPZHsQGO5T12oLGiAjr4DZfpUbdw1AQTcGA9I8DeZstJvYtyR0ajlUoMYWlSwY2Hs3bHjTO5KA07oUngBhoJhWcKnstmFKpXpjt0JniiC111/B2uL+VdTi1QEE59ibJmKVHK/943Ics2jtpDQ89ZxipnZtzLKF9HW0vB4NnnEHfAm9S2UqJjMTUttu74+A4VM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(30864003)(33656002)(66946007)(54906003)(478600001)(316002)(86362001)(83380400001)(71200400001)(76116006)(36756003)(26005)(66556008)(66476007)(66446008)(64756008)(53546011)(186003)(6512007)(4326008)(2616005)(6506007)(91956017)(7416002)(5660300002)(6916009)(8676002)(2906002)(8936002)(2004002)(45980500001)(559001)(579004)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?agw+om87WfbZIrrwkc0jQnCQucVmL2ablEBqowqfZNrH+QMB92I8XpLf48nU?=
 =?us-ascii?Q?+63BJIMbIpGlckGkJY6MpvxJDWOg6qghF8KQGcW1nOd9TDVIsEV2dnWYnKHj?=
 =?us-ascii?Q?Pc7JuGNL+vOQxk19hgtmCxDWdH4jCZDXBYxbVQf2KI+eQLB+wrg3gVGMnzJv?=
 =?us-ascii?Q?uBeRC+Nt31eG3bccGNl5PLA/0FN01QGXb9JkSoQNsp28k9UKA8PJbYo57KbG?=
 =?us-ascii?Q?CXjFdA1Z7RXVpNnMJ04aCaKP9IJqpwRtgGwL1S8K6Fw4FCYO5Th5MUJKO7WL?=
 =?us-ascii?Q?UWpCR/PvMqw3IiCk1P1oQwcRKT7PgT2soSrVSppBLFRSdiD4JyorOzkUrxBR?=
 =?us-ascii?Q?R5BFlusb+sqlqgkahbWXd7CVy+D+wkAwPo6UellG3xCP/LLAqAYekmVqz6zI?=
 =?us-ascii?Q?fI/WR1/ZRSChz8MY516Xg/SQZ0/MInw7ykGcpqG4DBO9XZ7nzz9VQ2hvpNXL?=
 =?us-ascii?Q?Kjq/fZR1n67O5Fjxe/bwqEvVtgHGSppSbP2iBt46fE9Mk7nrvF0Jbb0l/WVV?=
 =?us-ascii?Q?+HxafbQzz5ZnMu4+SpNIyg8AmmS2A9kc4MSk61jSgo3FQvywBHwYx8TU4XFe?=
 =?us-ascii?Q?h3rif16monAwfIuwk757K1VCWeNIw29oLSYwbkJoHc0jvIgG6cB/aDqkzRmc?=
 =?us-ascii?Q?X4+jQSd5YTdEWqmKUfmHWNUbD9ot5VI+TYxLHsDJfiWmEJoww180JjRZ315L?=
 =?us-ascii?Q?uXOkNcMUaZDM8u/aT6lO2Z2ZqWKtweqDpiq3f+uJeF3aXldbGtuqULdbZYxc?=
 =?us-ascii?Q?TwCyrOk5l96RDpmCRa8YuAkjRoJxHUXPfMhsgmN41MAH+6jokuDkAoMSZtkt?=
 =?us-ascii?Q?AiELTaCtq76xx23GVajWZ+QuMHhcnDKhx2G0V0vYBwXMN60nMYk0K8rqZjSH?=
 =?us-ascii?Q?ZGkPe6pmxwu3LNKpJLowPj5lCytPMcmG9MpWsXRH4kE6uIMqZ9gUOGILaIV0?=
 =?us-ascii?Q?Q4MToqJyalkaltWkd7sIzBVwHyFza2hvovfXIkMZqcyty5nMuSWWmkB1N/rl?=
 =?us-ascii?Q?BhPd?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62CF5E4BEA2CAB4FB676A80B5258936B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3881
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	731d4c3d-1941-4162-d59b-08d8b6de310c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q5Xr6YiZbEGpqmeslx6Epq/BmUEYNBbKX/a/sLYFNaqQmHXP1aQAizgAYWTyDwIV0UXrwCoxXAA+PVYBYiiZ4Kl5p95hJ6yOt7d9goW8gsAaHDbzQYsM4BWQm0GPJboJg7XbSd7qWisG4NMiLUQpbxpkTlFgIy0aH00GpaXJJLcMZH9svGyL2BhUfLaMl+JT7tPtoag4oqENiE8VE8VAh7u6E8Thywu3V674ehAwfwaGYaiaUt2C0Ia5rJXnowkIKS2Bj2gCgHkExTLK+xEOa3Nlh/B9YptpuQNU6vSErUZRWLzJcEG3vhB0znqrQesySdlG45J3imv+qZOydSPUuP6cisy6ynL7/27qrAleTrLGXznXUAtxQdc/FX2i+53la0jK8B4vRM8lKUBUJcwhhePMU4LciZqHP06OG5Uom2mo2338Km49Wev9WadiB8UPxeZPDBzc6+vw99RMkIzNoDATiVEK05s3DuAD85O0lk4GjrmOCP1TkR+6LI6O2yrTMm9pOFLYTautgNulSKJLPiuin3rud2MHtiz8EzaTCM+zk+oGePqGs9MyOhtyoMN5ILNpvwHl6h7nz+s1ZcdwVyYqalPNpJEOmTTmRQER+qA71GzYxdK9LLqUf5NrBZ7p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(4326008)(316002)(81166007)(5660300002)(356005)(70586007)(34020700004)(82740400003)(6512007)(82310400003)(86362001)(2906002)(47076005)(54906003)(186003)(336012)(2616005)(83380400001)(6506007)(53546011)(8676002)(36756003)(30864003)(6486002)(8936002)(33656002)(26005)(6862004)(107886003)(478600001)(70206006)(2004002)(579004)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:41:18.3464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a51d3b-2cf9-4971-4b4a-08d8b6de366f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168

Hello Oleksandr ,

Thanks for reviewing the code.

> On 11 Jan 2021, at 4:09 pm, Oleksandr <olekstysh@gmail.com> wrote:
>=20
>=20
> On 08.01.21 16:46, Rahul Singh wrote:
>=20
> Hi Rahul
>=20
>> Add support for ARM architected SMMUv3 implementation. It is based on
>> the Linux SMMUv3 driver.
>>=20
>> Driver is currently supported as Tech Preview.
>>=20
>> Major differences with regard to Linux driver are as follows:
>> 2. Only Stage-2 translation is supported as compared to the Linux driver
>>    that supports both Stage-1 and Stage-2 translations.
>> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>>    capability to share the page tables with the CPU.
>> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>>    and priority queue IRQ handling.
>> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>>    access functions based on atomic operations implemented in Linux.
>>    Atomic functions used by the commands queue access functions are not
>>    implemented in XEN therefore we decided to port the earlier version
>>    of the code. Atomic operations are introduced to fix the bottleneck
>>    of the SMMU command queue insertion operation. A new algorithm for
>>    inserting commands into the queue is introduced, which is lock-free
>>    on the fast-path.
>>    Consequence of reverting the patch is that the command queue
>>    insertion will be slow for large systems as spinlock will be used to
>>    serializes accesses from all CPUs to the single queue supported by
>>    the hardware. Once the proper atomic operations will be available in
>>    XEN the driver can be updated.
>> 6. Spin lock is used in place of mutex when attaching a device to the
>>    SMMU, as there is no blocking locks implementation available in XEN.
>>    This might introduce latency in XEN. Need to investigate before
>>    driver is out for tech preview.
>> 7. PCI ATS functionality is not supported, as there is no support
>>    available in XEN to test the functionality. Code is not tested and
>>    compiled. Code is guarded by the flag CONFIG_PCI_ATS.
>> 8. MSI interrupts are not supported as there is no support available in
>>    XEN to request MSI interrupts. Code is not tested and compiled. Code
>>    is guarded by the flag CONFIG_MSI.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in V3:
>> - added return statement for readx_poll_timeout function.
>> - remove iommu_get_dma_cookie and iommu_put_dma_cookie.
>> - remove struct arm_smmu_xen_device as not required.
>> - move dt_property_match_string to device_tree.c file.
>> - replace arm_smmu_*_thread to arm_smmu_*_tasklet to avoid confusion.
>> - use ARM_SMMU_REG_SZ as size when map memory to XEN.
>> - remove bypass keyword to make sure when device-tree probe is failed we
>>   are reporting error and not continuing to configure SMMU in bypass
>>   mode.
>> - fixed minor comments.
>> Changes in V4:
>> - Fixed typo for CONFIG_MSI
>> - Added back the mutex code
>> - Rebase the patch on top of newly added WARN_ON().
>> - Remove the direct read of register VTCR_EL2.
>> - Fixed minor comments.
>> ---
>>  MAINTAINERS                           |   6 +
>>  SUPPORT.md                            |   1 +
>>  xen/drivers/passthrough/Kconfig       |  11 +
>>  xen/drivers/passthrough/arm/Makefile  |   1 +
>>  xen/drivers/passthrough/arm/smmu-v3.c | 808 ++++++++++++++++++++++----
>>  5 files changed, 715 insertions(+), 112 deletions(-)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6dbd99aff4..d832e8fd65 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -249,6 +249,12 @@ F:	xen/include/asm-arm/
>>  F:	xen/include/public/arch-arm/
>>  F:	xen/include/public/arch-arm.h
>>  +ARM SMMUv3
>> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
>> +M:	Rahul Singh <rahul.singh@arm.com>
>> +S:	Supported
>> +F:	xen/drivers/passthrough/arm/smmu-v3.c
>> +
>>  Change Log
>>  M:	Paul Durrant <paul@xen.org>
>>  R:	Community Manager <community.manager@xenproject.org>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index ab02aca5f4..5ee3c8651a 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -67,6 +67,7 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>>      Status, Intel VT-d: Supported
>>      Status, ARM SMMUv1: Supported, not security supported
>>      Status, ARM SMMUv2: Supported, not security supported
>> +    Status, ARM SMMUv3: Tech Preview
>>      Status, Renesas IPMMU-VMSA: Supported, not security supported
>>    ### ARM/GICv3 ITS
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/K=
config
>> index 0036007ec4..341ba92b30 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -13,6 +13,17 @@ config ARM_SMMU
>>  	  Say Y here if your SoC includes an IOMMU device implementing the
>>  	  ARM SMMU architecture.
>>  +config ARM_SMMU_V3
>> +	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
>> +	depends on ARM_64
>> +	---help---
>> +	 Support for implementations of the ARM System MMU architecture
>> +	 version 3. Driver is in experimental stage and should not be used in
>> +	 production.
>> +
>> +	 Say Y here if your system includes an IOMMU device implementing
>> +	 the ARM SMMUv3 architecture.
>> +
>>  config IPMMU_VMSA
>>  	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
>>  	depends on ARM_64
>> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthro=
ugh/arm/Makefile
>> index fcd918ea3e..c5fb3b58a5 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -1,3 +1,4 @@
>>  obj-y +=3D iommu.o iommu_helpers.o iommu_fwspec.o
>>  obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
>>  obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
>> +obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 2dfadc6a65..e53f9f4c21 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -2,37 +2,263 @@
>>  /*
>>   * IOMMU API for ARM architected SMMUv3 implementations.
>>   *
>> + * Based on Linux's SMMUv3 driver:
>> + *    drivers/iommu/arm-smmu-v3.c
>> + *    commit: ab435ce49bd1d02e33dfec24f76955dc1196970b
>> + * and Xen's SMMU driver:
>> + *    xen/drivers/passthrough/arm/smmu.c
>> + *
>> + * Major differences with regard to Linux driver are as follows:
>> + *  1. Driver is currently supported as Tech Preview.
>> + *  2. Only Stage-2 translation is supported as compared to the Linux d=
river
>> + *     that supports both Stage-1 and Stage-2 translations.
>> + *  3. Use P2M  page table instead of creating one as SMMUv3 has the
>> + *     capability to share the page tables with the CPU.
>> + *  4. Tasklets are used in place of threaded IRQ's in Linux for event =
queue
>> + *     and priority queue IRQ handling.
>> + *  5. Latest version of the Linux SMMUv3 code implements the commands =
queue
>> + *     access functions based on atomic operations implemented in Linux=
.
>> + *     Atomic functions used by the commands queue access functions are=
 not
>> + *     implemented in XEN therefore we decided to port the earlier vers=
ion
>> + *     of the code. Atomic operations are introduced to fix the bottlen=
eck of
>> + *     the SMMU command queue insertion operation. A new algorithm for
>> + *     inserting commands into the queue is introduced, which is
>> + *     lock-free on the fast-path.
>> + *     Consequence of reverting the patch is that the command queue ins=
ertion
>> + *     will be slow for large systems as spinlock will be used to seria=
lizes
>> + *     accesses from all CPUs to the single queue supported by the hard=
ware.
>> + *     Once the proper atomic operations will be available in XEN the d=
river
>> + *     can be updated.
>> + *  6. Spin lock is used in place of Mutex when attaching a device to t=
he SMMU,
>> + *     as there is no blocking locks implementation available in XEN.Th=
is might
>> + *     introduce latency in XEN. Need to investigate before driver is o=
ut for
>> + *     Tech Preview.
>> + *  7. PCI ATS functionality is not supported, as there is no support a=
vailable
>> + *     in XEN to test the functionality. Code is not tested and compile=
d. Code
>> + *     is guarded by the flag CONFIG_PCI_ATS.
>> + *  8. MSI interrupts are not supported as there is no support availabl=
e
>> + *     in XEN to request MSI interrupts. Code is not tested and compile=
d. Code
>> + *     is guarded by the flag CONFIG_MSI.
>> + *
>> + * Following functionality should be supported before driver is out for=
 tech
>> + * preview
>> + *
>> + *  1. Investigate the timing analysis of using spin lock in place of m=
utex
>> + *     when attaching devices to SMMU.
>> + *  2. Merged the latest Linux SMMUv3 driver code once atomic operation=
 is
>> + *     available in XEN.
>> + *  3. PCI ATS and MSI interrupts should be supported.
>> + *  4. Investigate side-effect of using tasklet in place of threaded IR=
Q and
>> + *     fix if any.
>> + *
>>   * Copyright (C) 2015 ARM Limited
>>   *
>>   * Author: Will Deacon <will.deacon@arm.com>
>>   *
>> - * This driver is powered by bad coffee and bombay mix.
>> + * Copyright (C) 2020 Arm Ltd
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>> + *
>> + */
>> +
>> +#include <xen/acpi.h>
>> +#include <xen/config.h>
>> +#include <xen/delay.h>
>> +#include <xen/errno.h>
>> +#include <xen/err.h>
>> +#include <xen/irq.h>
>> +#include <xen/lib.h>
>> +#include <xen/list.h>
>> +#include <xen/mm.h>
>> +#include <xen/rbtree.h>
>> +#include <xen/sched.h>
>> +#include <xen/sizes.h>
>> +#include <xen/vmap.h>
>> +#include <asm/atomic.h>
>> +#include <asm/device.h>
>> +#include <asm/io.h>
>> +#include <asm/iommu_fwspec.h>
>> +#include <asm/platform.h>
>> +
>> +
>> +#define ARM_SMMU_VTCR_SH_IS		3
>> +#define ARM_SMMU_VTCR_RGN_WBWA		1
>> +#define ARM_SMMU_VTCR_TG0_4K		0
>> +#define ARM_SMMU_VTCR_PS_32_BIT		0x0ULL
>> +#define ARM_SMMU_VTCR_PS_36_BIT		0x1ULL
>> +#define ARM_SMMU_VTCR_PS_40_BIT		0x2ULL
>> +#define ARM_SMMU_VTCR_PS_42_BIT		0x3ULL
>> +#define ARM_SMMU_VTCR_PS_44_BIT		0x4ULL
>> +#define ARM_SMMU_VTCR_PS_48_BIT		0x5ULL
>> +#define ARM_SMMU_VTCR_PS_52_BIT		0x6ULL
>> +
>> +/* Linux compatibility functions. */
>> +typedef paddr_t		dma_addr_t;
>> +typedef paddr_t		phys_addr_t;
>> +typedef unsigned int		gfp_t;
>> +
>> +#define platform_device		device
>> +
>> +#define GFP_KERNEL		0
>> +
>> +/* Alias to Xen lock functions */
>> +#define mutex spinlock
>> +#define mutex_init spin_lock_init
>> +#define mutex_lock spin_lock
>> +#define mutex_unlock spin_unlock
>> +
>> +/* Device logger functions */
>> +#define dev_name(dev)	dt_node_full_name(dev->of_node)
>> +#define dev_dbg(dev, fmt, ...)			\
>> +	printk(XENLOG_DEBUG "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +#define dev_notice(dev, fmt, ...)		\
>> +	printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +#define dev_warn(dev, fmt, ...)			\
>> +	printk(XENLOG_WARNING "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS_=
_)
>> +#define dev_err(dev, fmt, ...)			\
>> +	printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +#define dev_info(dev, fmt, ...)			\
>> +	printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +#define dev_err_ratelimited(dev, fmt, ...)			\
>> +	printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +
>> +/*
>> + * Periodically poll an address and wait between reads in us until a
>> + * condition is met or a timeout occurs.
>> + *
>> + * @return: 0 when cond met, -ETIMEDOUT upon timeout
>> + */
>> +#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us) \
>> +({ \
>> +	s_time_t deadline =3D NOW() + MICROSECS(timeout_us); \
>> +	for (;;) { \
>> +		(val) =3D op(addr); \
>> +		if (cond) \
>> +			break; \
>> +		if (NOW() > deadline) { \
>> +			(val) =3D op(addr); \
>> +			break; \
>> +		} \
>> +		udelay(sleep_us); \
>> +	} \
>> +	(cond) ? 0 : -ETIMEDOUT; \
>> +})
>> +
>> +#define readl_relaxed_poll_timeout(addr, val, cond, delay_us, timeout_u=
s)	\
>> +	readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us, timeout_u=
s)
>> +
>> +#define FIELD_PREP(_mask, _val)			\
>> +	(((typeof(_mask))(_val) << (ffsll(_mask) - 1)) & (_mask))
>> +
>> +#define FIELD_GET(_mask, _reg)			\
>> +	((typeof(_mask))(((_reg) & (_mask)) >> (ffsll(_mask) - 1)))
>> +
>> +/*
>> + * Helpers for DMA allocation. Just the function name is reused for
>> + * porting code, these allocation are not managed allocations
>>   */
>> +static void *dmam_alloc_coherent(struct device *dev, size_t size,
>> +				paddr_t *dma_handle, gfp_t gfp)
>> +{
>> +	void *vaddr;
>> +	unsigned long alignment =3D size;
>> +
>> +	/*
>> +	 * _xzalloc requires that the (align & (align -1)) =3D 0. Most of the
>> +	 * allocations in SMMU code should send the right value for size. In
>> +	 * case this is not true print a warning and align to the size of a
>> +	 * (void *)
>> +	 */
>> +	if (size & (size - 1)) {
>> +		printk(XENLOG_WARNING "SMMUv3: Fixing alignment for the DMA buffer\n"=
);
>> +		alignment =3D sizeof(void *);
>> +	}
>> +
>> +	vaddr =3D _xzalloc(size, alignment);
>> +	if (!vaddr) {
>> +		printk(XENLOG_ERR "SMMUv3: DMA allocation failed\n");
>> +		return NULL;
>> +	}
>> +
>> +	*dma_handle =3D virt_to_maddr(vaddr);
>> +
>> +	return vaddr;
>> +}
>> +
>> +
>> +/* Xen specific code. */
>> +struct iommu_domain {
>> +	/* Runtime SMMU configuration for this iommu_domain */
>> +	atomic_t		ref;
>> +	/*
>> +	 * Used to link iommu_domain contexts for a same domain.
>> +	 * There is at least one per-SMMU to used by the domain.
>> +	 */
>> +	struct list_head		list;
>> +};
>>  -#include <linux/acpi.h>
>> -#include <linux/acpi_iort.h>
>> -#include <linux/bitfield.h>
>> -#include <linux/bitops.h>
>> -#include <linux/crash_dump.h>
>> -#include <linux/delay.h>
>> -#include <linux/dma-iommu.h>
>> -#include <linux/err.h>
>> -#include <linux/interrupt.h>
>> -#include <linux/io-pgtable.h>
>> -#include <linux/iommu.h>
>> -#include <linux/iopoll.h>
>> -#include <linux/module.h>
>> -#include <linux/msi.h>
>> -#include <linux/of.h>
>> -#include <linux/of_address.h>
>> -#include <linux/of_iommu.h>
>> -#include <linux/of_platform.h>
>> -#include <linux/pci.h>
>> -#include <linux/pci-ats.h>
>> -#include <linux/platform_device.h>
>> -
>> -#include <linux/amba/bus.h>
>> +/* Describes information required for a Xen domain */
>> +struct arm_smmu_xen_domain {
>> +	spinlock_t		lock;
>>  +	/* List of iommu domains associated to this domain */
>> +	struct list_head	contexts;
>> +};
>> +
>> +
>> +/* Keep a list of devices associated with this driver */
>> +static DEFINE_SPINLOCK(arm_smmu_devices_lock);
>> +static LIST_HEAD(arm_smmu_devices);
>> +
>> +static inline void *dev_iommu_priv_get(struct device *dev)
>> +{
>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> +
>> +	return fwspec && fwspec->iommu_priv ? fwspec->iommu_priv : NULL;
>> +}
>> +
>> +static inline void dev_iommu_priv_set(struct device *dev, void *priv)
>> +{
>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> +
>> +	fwspec->iommu_priv =3D priv;
>> +}
>> +
>> +static int platform_get_irq_byname_optional(struct device *dev,
>> +				const char *name)
>> +{
>> +	int index, ret;
>> +	struct dt_device_node *np  =3D dev_to_dt(dev);
>> +
>> +	if (unlikely(!name))
>> +		return -EINVAL;
>> +
>> +	index =3D dt_property_match_string(np, "interrupt-names", name);
>> +	if (index < 0) {
>> +		dev_info(dev, "IRQ %s not found\n", name);
>> +		return index;
>> +	}
>> +
>> +	ret =3D platform_get_irq(np, index);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to get irq index %d\n", index);
>> +		return -ENODEV;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/* Start of Linux SMMUv3 code */
>>  /* MMIO registers */
>>  #define ARM_SMMU_IDR0			0x0
>>  #define IDR0_ST_LVL			GENMASK(28, 27)
>> @@ -402,6 +628,7 @@ enum pri_resp {
>>  	PRI_RESP_SUCC =3D 2,
>>  };
>>  +#ifdef CONFIG_MSI
>>  enum arm_smmu_msi_index {
>>  	EVTQ_MSI_INDEX,
>>  	GERROR_MSI_INDEX,
>> @@ -426,6 +653,7 @@ static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSI=
S][3] =3D {
>>  		ARM_SMMU_PRIQ_IRQ_CFG2,
>>  	},
>>  };
>> +#endif /* CONFIG_MSI */
>>    struct arm_smmu_cmdq_ent {
>>  	/* Common fields */
>> @@ -613,8 +841,13 @@ struct arm_smmu_device {
>>  		u64			padding;
>>  	};
>>  -	/* IOMMU core code handle */
>> -	struct iommu_device		iommu;
>> +	/* Need to keep a list of SMMU devices */
>> +	struct list_head		devices;
>> +
>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>> +	struct tasklet		evtq_irq_tasklet;
>> +	struct tasklet		priq_irq_tasklet;
>> +	struct tasklet		combined_irq_tasklet;
>>  };
>>    /* SMMU private data for each master */
>> @@ -646,6 +879,9 @@ struct arm_smmu_domain {
>>  	enum arm_smmu_domain_stage	stage;
>>  	struct arm_smmu_s2_cfg	s2_cfg;
>>  +	/* Xen domain associated with this SMMU domain */
>> +	struct domain		*d;
>> +
>>  	struct iommu_domain		domain;
>>    	struct list_head		devices;
>> @@ -984,6 +1220,7 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu=
_device *smmu,
>>  	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>>  }
>>  +#ifdef CONFIG_MSI
>>  /*
>>   * The difference between val and sync_idx is bounded by the maximum si=
ze of
>>   * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithmet=
ic.
>> @@ -1027,6 +1264,13 @@ static int __arm_smmu_cmdq_issue_sync_msi(struct =
arm_smmu_device *smmu)
>>    	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
>>  }
>> +#else
>> +static inline int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device=
 *smmu)
>> +{
>> +	return 0;
>> +}
>> +#endif /* CONFIG_MSI */
>> +
>>    static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>>  {
>> @@ -1069,7 +1313,7 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct =
arm_smmu_strtab_l1_desc *desc)
>>  	val |=3D desc->l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
>>    	/* See comment in arm_smmu_write_ctx_desc() */
>> -	WRITE_ONCE(*dst, cpu_to_le64(val));
>> +	write_atomic(dst, cpu_to_le64(val));
>>  }
>>    static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u=
32 sid)
>> @@ -1184,7 +1428,7 @@ static void arm_smmu_write_strtab_ent(struct arm_s=
mmu_master *master, u32 sid,
>>  						 STRTAB_STE_1_EATS_TRANS));
>>    	arm_smmu_sync_ste_for_sid(smmu, sid);
>> -	WRITE_ONCE(dst[0], cpu_to_le64(val));
>> +	write_atomic(&dst[0], cpu_to_le64(val));
>>  	arm_smmu_sync_ste_for_sid(smmu, sid);
>>    	/* It's likely that we'll want to use the new STE soon */
>> @@ -1231,7 +1475,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu=
_device *smmu, u32 sid)
>>  }
>>    /* IRQ and event handlers */
>> -static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>> +static void arm_smmu_evtq_tasklet(void *dev)
>>  {
>>  	int i;
>>  	struct arm_smmu_device *smmu =3D dev;
>> @@ -1261,7 +1505,6 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, v=
oid *dev)
>>  	/* Sync our overflow flag, as we believe we're up to speed */
>>  	llq->cons =3D Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>>  		    Q_IDX(llq, llq->cons);
>> -	return IRQ_HANDLED;
>>  }
>>    static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *ev=
t)
>> @@ -1302,7 +1545,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_de=
vice *smmu, u64 *evt)
>>  	}
>>  }
>>  -static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
>> +static void arm_smmu_priq_tasklet(void *dev)
>>  {
>>  	struct arm_smmu_device *smmu =3D dev;
>>  	struct arm_smmu_queue *q =3D &smmu->priq.q;
>> @@ -1321,12 +1564,12 @@ static irqreturn_t arm_smmu_priq_thread(int irq,=
 void *dev)
>>  	llq->cons =3D Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>>  		      Q_IDX(llq, llq->cons);
>>  	queue_sync_cons_out(q);
>> -	return IRQ_HANDLED;
>>  }
>>    static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
>>  -static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>> +static void arm_smmu_gerror_handler(int irq, void *dev,
>> +				struct cpu_user_regs *regs)
>>  {
>>  	u32 gerror, gerrorn, active;
>>  	struct arm_smmu_device *smmu =3D dev;
>> @@ -1336,7 +1579,7 @@ static irqreturn_t arm_smmu_gerror_handler(int irq=
, void *dev)
>>    	active =3D gerror ^ gerrorn;
>>  	if (!(active & GERROR_ERR_MASK))
>> -		return IRQ_NONE; /* No errors pending */
>> +		return; /* No errors pending */
>>    	dev_warn(smmu->dev,
>>  		 "unexpected global error reported (0x%08x), this could be serious\n"=
,
>> @@ -1369,26 +1612,44 @@ static irqreturn_t arm_smmu_gerror_handler(int i=
rq, void *dev)
>>  		arm_smmu_cmdq_skip_err(smmu);
>>    	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
>> -	return IRQ_HANDLED;
>>  }
>>  -static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>> +static void arm_smmu_combined_irq_handler(int irq, void *dev,
>> +				struct cpu_user_regs *regs)
>> +{
>> +	struct arm_smmu_device *smmu =3D dev;
>> +
>> +	arm_smmu_gerror_handler(irq, dev, regs);
>> +
>> +	tasklet_schedule(&(smmu->combined_irq_tasklet));
>> +}
>> +
>> +static void arm_smmu_combined_irq_tasklet(void *dev)
>>  {
>>  	struct arm_smmu_device *smmu =3D dev;
>>  -	arm_smmu_evtq_thread(irq, dev);
>> +	arm_smmu_evtq_tasklet(dev);
>>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>> -		arm_smmu_priq_thread(irq, dev);
>> +		arm_smmu_priq_tasklet(dev);
>> +}
>> +
>> +static void arm_smmu_evtq_irq_tasklet(int irq, void *dev,
>> +				struct cpu_user_regs *regs)
>> +{
>> +	struct arm_smmu_device *smmu =3D dev;
>>  -	return IRQ_HANDLED;
>> +	tasklet_schedule(&(smmu->evtq_irq_tasklet));
>>  }
>>  -static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>> +static void arm_smmu_priq_irq_tasklet(int irq, void *dev,
>> +				struct cpu_user_regs *regs)
>>  {
>> -	arm_smmu_gerror_handler(irq, dev);
>> -	return IRQ_WAKE_THREAD;
>> +	struct arm_smmu_device *smmu =3D dev;
>> +
>> +	tasklet_schedule(&(smmu->priq_irq_tasklet));
>>  }
>>  +#ifdef CONFIG_PCI_ATS
>>  static void
>>  arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>>  			struct arm_smmu_cmdq_ent *cmd)
>> @@ -1495,6 +1756,7 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu=
_domain *smmu_domain,
>>    	return ret ? -ETIMEDOUT : 0;
>>  }
>> +#endif /* CONFIG_PCI_ATS */
>>    static void arm_smmu_tlb_inv_context(void *cookie)
>>  {
>> @@ -1525,7 +1787,7 @@ static struct iommu_domain *arm_smmu_domain_alloc(=
void)
>>  	 * We can't really do anything meaningful until we've added a
>>  	 * master.
>>  	 */
>> -	smmu_domain =3D kzalloc(sizeof(*smmu_domain), GFP_KERNEL);
>> +	smmu_domain =3D xzalloc(struct arm_smmu_domain);
>>  	if (!smmu_domain)
>>  		return NULL;
>>  @@ -1563,7 +1825,7 @@ static void arm_smmu_domain_free(struct iommu_dom=
ain *domain)
>>  	if (cfg->vmid)
>>  		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
>>  -	kfree(smmu_domain);
>> +	xfree(smmu_domain);
>>  }
>>    @@ -1576,6 +1838,44 @@ static int arm_smmu_domain_finalise_s2(struct =
arm_smmu_domain *smmu_domain,
>>  	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
>>  	typeof(&arm_lpae_s2_cfg.vtcr) vtcr =3D &arm_lpae_s2_cfg.vtcr;
>>  +	vtcr->sh =3D ARM_SMMU_VTCR_SH_IS;
>> +	vtcr->irgn =3D ARM_SMMU_VTCR_RGN_WBWA;
>> +	vtcr->orgn =3D ARM_SMMU_VTCR_RGN_WBWA;
>> +
>> +	BUILD_BUG_ON(PAGE_SIZE !=3D SZ_4K);
>> +	vtcr->tg =3D ARM_SMMU_VTCR_TG0_4K;
>> +
>> +	switch (smmu->oas) {
>> +	case 32:
>> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_32_BIT;
>> +		break;
>> +	case 36:
>> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_36_BIT;
>> +		break;
>> +	case 40:
>> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_40_BIT;
>> +		break;
>> +	case 42:
>> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_42_BIT;
>> +		break;
>> +	case 44:
>> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_44_BIT;
>> +		break;
>> +	case 48:
>> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_48_BIT;
>> +		break;
>> +	case 52:
>> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_52_BIT;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	vtcr->tsz =3D 64 - p2m_ipa_bits;
>> +	vtcr->sl =3D 2 - P2M_ROOT_LEVEL;
>> +
>> +	arm_lpae_s2_cfg.vttbr  =3D page_to_maddr(smmu_domain->d->arch.p2m.root=
);
>> +
>>  	vmid =3D arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>>  	if (vmid < 0)
>>  		return vmid;
>> @@ -1589,6 +1889,11 @@ static int arm_smmu_domain_finalise_s2(struct arm=
_smmu_domain *smmu_domain,
>>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
>>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
>>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
>> +
>> +	printk(XENLOG_DEBUG
>> +		   "SMMUv3: d%u: vmid 0x%x vtcr 0x%"PRIpaddr" p2maddr 0x%"PRIpaddr"\n=
",
>> +		   smmu_domain->d->domain_id, cfg->vmid, cfg->vtcr, cfg->vttbr);
>> +
>>  	return 0;
>>  }
>>  @@ -1650,6 +1955,7 @@ static void arm_smmu_install_ste_for_dev(struct a=
rm_smmu_master *master)
>>  	}
>>  }
>>  +#ifdef CONFIG_PCI_ATS
>>  static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
>>  {
>>  	struct device *dev =3D master->dev;
>> @@ -1748,6 +2054,23 @@ static void arm_smmu_disable_pasid(struct arm_smm=
u_master *master)
>>    	pci_disable_pasid(pdev);
>>  }
>> +#else
>> +static inline bool arm_smmu_ats_supported(struct arm_smmu_master *maste=
r)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline void arm_smmu_enable_ats(struct arm_smmu_master *master) =
{ }
>> +
>> +static inline void arm_smmu_disable_ats(struct arm_smmu_master *master)=
 { }
>> +
>> +static inline int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>> +{
>> +	return 0;
>> +}
>> +
>> +static inline void arm_smmu_disable_pasid(struct arm_smmu_master *maste=
r) { }
>> +#endif /* CONFIG_PCI_ATS */
>>    static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>>  {
>> @@ -1830,8 +2153,10 @@ static bool arm_smmu_sid_in_range(struct arm_smmu=
_device *smmu, u32 sid)
>>    	return sid < limit;
>>  }
>> +/* Forward declaration */
>> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev);
>>  -static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>> +static int arm_smmu_add_device(u8 devfn, struct device *dev)
>>  {
>>  	int i, ret;
>>  	struct arm_smmu_device *smmu;
>> @@ -1839,14 +2164,15 @@ static struct iommu_device *arm_smmu_probe_devic=
e(struct device *dev)
>>  	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>>    	if (!fwspec)
>> -		return ERR_PTR(-ENODEV);
>> +		return -ENODEV;
>>  -	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
>> -		return ERR_PTR(-EBUSY);
>> +	smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev);
>> +	if (!smmu)
>> +		return -ENODEV;
>>  -	master =3D kzalloc(sizeof(*master), GFP_KERNEL);
>> +	master =3D xzalloc(struct arm_smmu_master);
>>  	if (!master)
>> -		return ERR_PTR(-ENOMEM);
>> +		return -ENOMEM;
>>    	master->dev =3D dev;
>>  	master->smmu =3D smmu;
>> @@ -1881,17 +2207,36 @@ static struct iommu_device *arm_smmu_probe_devic=
e(struct device *dev)
>>  	 */
>>  	arm_smmu_enable_pasid(master);
>>  -	return &smmu->iommu;
>> +	return 0;
>>    err_free_master:
>> -	kfree(master);
>> +	xfree(master);
>>  	dev_iommu_priv_set(dev, NULL);
>> -	return ERR_PTR(ret);
>> +	return ret;
>>  }
>>  -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_arg=
s *args)
>> +static int arm_smmu_dt_xlate(struct device *dev,
>> +				const struct dt_phandle_args *args)
>>  {
>> -	return iommu_fwspec_add_ids(dev, args->args, 1);
>> +	int ret;
>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> Please bear in mind I am not familiar with the SMMU, but don't we need to=
 perform a some kind
> of sanity check of passed DT IOMMU specifier here?

I checked the code follow we will never hit the dt_xlate without IOMMU spec=
ifier but anyway I will add the sanity check.=20
>=20
>=20
>> +
>> +	ret =3D iommu_fwspec_add_ids(dev, args->args, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (dt_device_is_protected(dev_to_dt(dev))) {
>> +		dev_err(dev, "Already added to SMMUv3\n");
>> +		return -EEXIST;
>> +	}
>> +
>> +	/* Let Xen know that the master device is protected by an IOMMU. */
>> +	dt_device_set_protected(dev_to_dt(dev));
>> +
>> +	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
>> +			dev_name(fwspec->iommu_dev), fwspec->num_ids);
>> +
>> +	return 0;
>>  }
>>    /* Probing and initialisation functions */
>> @@ -1972,7 +2317,7 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu=
_device *smmu)
>>  	size_t size =3D sizeof(*cfg->l1_desc) * cfg->num_l1_ents;
>>  	void *strtab =3D smmu->strtab_cfg.strtab;
>>  -	cfg->l1_desc =3D devm_kzalloc(smmu->dev, size, GFP_KERNEL);
>> +	cfg->l1_desc =3D _xzalloc(size, sizeof(void *));
>>  	if (!cfg->l1_desc) {
>>  		dev_err(smmu->dev, "failed to allocate l1 stream table desc\n");
>>  		return -ENOMEM;
>> @@ -2118,6 +2463,7 @@ static int arm_smmu_update_gbpa(struct arm_smmu_de=
vice *smmu, u32 set, u32 clr)
>>  	return ret;
>>  }
>>  +#ifdef CONFIG_MSI
>>  static void arm_smmu_free_msis(void *data)
>>  {
>>  	struct device *dev =3D data;
>> @@ -2188,6 +2534,9 @@ static void arm_smmu_setup_msis(struct arm_smmu_de=
vice *smmu)
>>  	/* Add callback to free MSIs on teardown */
>>  	devm_add_action(dev, arm_smmu_free_msis, dev);
>>  }
>> +#else
>> +static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { =
}
>> +#endif /* CONFIG_MSI */
>>    static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>>  {
>> @@ -2198,9 +2547,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_=
smmu_device *smmu)
>>  	/* Request interrupt lines */
>>  	irq =3D smmu->evtq.q.irq;
>>  	if (irq) {
>> -		ret =3D devm_request_threaded_irq(smmu->dev, irq, NULL,
>> -						arm_smmu_evtq_thread,
>> -						IRQF_ONESHOT,
>> +		ret =3D request_irq(irq, 0, arm_smmu_evtq_irq_tasklet,
>>  						"arm-smmu-v3-evtq", smmu);
>>  		if (ret < 0)
>>  			dev_warn(smmu->dev, "failed to enable evtq irq\n");
>> @@ -2210,8 +2557,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_=
smmu_device *smmu)
>>    	irq =3D smmu->gerr_irq;
>>  	if (irq) {
>> -		ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
>> -				       0, "arm-smmu-v3-gerror", smmu);
>> +		ret =3D request_irq(irq, 0, arm_smmu_gerror_handler,
>> +						"arm-smmu-v3-gerror", smmu);
>>  		if (ret < 0)
>>  			dev_warn(smmu->dev, "failed to enable gerror irq\n");
>>  	} else {
>> @@ -2221,11 +2568,8 @@ static void arm_smmu_setup_unique_irqs(struct arm=
_smmu_device *smmu)
>>  	if (smmu->features & ARM_SMMU_FEAT_PRI) {
>>  		irq =3D smmu->priq.q.irq;
>>  		if (irq) {
>> -			ret =3D devm_request_threaded_irq(smmu->dev, irq, NULL,
>> -							arm_smmu_priq_thread,
>> -							IRQF_ONESHOT,
>> -							"arm-smmu-v3-priq",
>> -							smmu);
>> +			ret =3D request_irq(irq, 0, arm_smmu_priq_irq_tasklet,
>> +							"arm-smmu-v3-priq", smmu);
>>  			if (ret < 0)
>>  				dev_warn(smmu->dev,
>>  					 "failed to enable priq irq\n");
>> @@ -2254,11 +2598,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_de=
vice *smmu)
>>  		 * Cavium ThunderX2 implementation doesn't support unique irq
>>  		 * lines. Use a single irq line for all the SMMUv3 interrupts.
>>  		 */
>> -		ret =3D devm_request_threaded_irq(smmu->dev, irq,
>> -					arm_smmu_combined_irq_handler,
>> -					arm_smmu_combined_irq_thread,
>> -					IRQF_ONESHOT,
>> -					"arm-smmu-v3-combined-irq", smmu);
>> +		ret =3D request_irq(irq, 0, arm_smmu_combined_irq_handler,
>> +						"arm-smmu-v3-combined-irq", smmu);
>>  		if (ret < 0)
>>  			dev_warn(smmu->dev, "failed to enable combined irq\n");
>>  	} else
>> @@ -2287,7 +2628,7 @@ static int arm_smmu_device_disable(struct arm_smmu=
_device *smmu)
>>  	return ret;
>>  }
>>  -static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool by=
pass)
>> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>>  {
>>  	int ret;
>>  	u32 reg, enables;
>> @@ -2297,7 +2638,7 @@ static int arm_smmu_device_reset(struct arm_smmu_d=
evice *smmu, bool bypass)
>>  	reg =3D readl_relaxed(smmu->base + ARM_SMMU_CR0);
>>  	if (reg & CR0_SMMUEN) {
>>  		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
>> -		WARN_ON(is_kdump_kernel() && !disable_bypass);
>> +		WARN_ON(!disable_bypass);
>>  		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
>>  	}
>>  @@ -2401,11 +2742,14 @@ static int arm_smmu_device_reset(struct arm_smm=
u_device *smmu, bool bypass)
>>  		return ret;
>>  	}
>>  -	if (is_kdump_kernel())
>> -		enables &=3D ~(CR0_EVTQEN | CR0_PRIQEN);
>> +	/* Initialize tasklets for threaded IRQs*/
>> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
>> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
>> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_taskle=
t,
>> +				 smmu);
>>    	/* Enable the SMMU interface, or ensure bypass */
>> -	if (!bypass || disable_bypass) {
>> +	if (disable_bypass) {
>>  		enables |=3D CR0_SMMUEN;
>>  	} else {
>>  		ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
>> @@ -2470,8 +2814,10 @@ static int arm_smmu_device_hw_probe(struct arm_sm=
mu_device *smmu)
>>  	if (reg & IDR0_SEV)
>>  		smmu->features |=3D ARM_SMMU_FEAT_SEV;
>>  +#ifdef CONFIG_MSI
>>  	if (reg & IDR0_MSI)
>>  		smmu->features |=3D ARM_SMMU_FEAT_MSI;
>> +#endif
>>    	if (reg & IDR0_HYP)
>>  		smmu->features |=3D ARM_SMMU_FEAT_HYP;
>> @@ -2496,7 +2842,7 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
>>  		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;
>>    	if (!(reg & IDR0_S2P)) {
>> -		dev_err(smmu->dev, "no translation support!\n");
>> +		dev_err(smmu->dev, "no stage-2 translation support!\n");
>>  		return -ENXIO;
>>  	}
>>  @@ -2593,8 +2939,12 @@ static int arm_smmu_device_hw_probe(struct arm_s=
mmu_device *smmu)
>>  		smmu->oas =3D 48;
>>  	}
>>  +	smmu->oas =3D min_t(unsigned long, PADDR_BITS, smmu->oas);
>>  	smmu->ias =3D max(smmu->ias, smmu->oas);
>>  +	/* Xen: Set maximum Stage-2 input size supported by the SMMU. */
>> +	p2m_restrict_ipa_bits(smmu->ias);
>> +
>>  	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
>>  		 smmu->ias, smmu->oas, smmu->features);
>>  	return 0;
>> @@ -2645,7 +2995,7 @@ static inline int arm_smmu_device_acpi_probe(struc=
t platform_device *pdev,
>>  static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>>  				    struct arm_smmu_device *smmu)
>>  {
>> -	struct device *dev =3D &pdev->dev;
>> +	struct device *dev =3D pdev;
>>  	u32 cells;
>>  	int ret =3D -EINVAL;
>>  @@ -2658,7 +3008,7 @@ static int arm_smmu_device_dt_probe(struct platfo=
rm_device *pdev,
>>    	parse_driver_options(smmu);
>>  -	if (of_dma_is_coherent(dev->of_node))
>> +	if (dt_get_property(dev->of_node, "dma-coherent", NULL))
>>  		smmu->features |=3D ARM_SMMU_FEAT_COHERENCY;
>>    	return ret;
>> @@ -2672,63 +3022,49 @@ static unsigned long arm_smmu_resource_size(stru=
ct arm_smmu_device *smmu)
>>  		return SZ_128K;
>>  }
>>  -static void __iomem *arm_smmu_ioremap(struct device *dev, resource_siz=
e_t start,
>> -				      resource_size_t size)
>> -{
>> -	struct resource res =3D {
>> -		.flags =3D IORESOURCE_MEM,
>> -		.start =3D start,
>> -		.end =3D start + size - 1,
>> -	};
>> -
>> -	return devm_ioremap_resource(dev, &res);
>> -}
>> -
>>  static int arm_smmu_device_probe(struct platform_device *pdev)
>>  {
>>  	int irq, ret;
>> -	struct resource *res;
>> -	resource_size_t ioaddr;
>> +	paddr_t ioaddr, iosize;
>>  	struct arm_smmu_device *smmu;
>> -	struct device *dev =3D &pdev->dev;
>> -	bool bypass;
>>  -	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>> +	smmu =3D xzalloc(struct arm_smmu_device);
>>  	if (!smmu) {
>> -		dev_err(dev, "failed to allocate arm_smmu_device\n");
>> +		dev_err(pdev, "failed to allocate arm_smmu_device\n");
>>  		return -ENOMEM;
>>  	}
>> -	smmu->dev =3D dev;
>> +	smmu->dev =3D pdev;
>>  -	if (dev->of_node) {
>> +	if (pdev->of_node) {
>>  		ret =3D arm_smmu_device_dt_probe(pdev, smmu);
>> +		if (ret)
>> +			return -EINVAL;
>>  	} else {
>>  		ret =3D arm_smmu_device_acpi_probe(pdev, smmu);
>>  		if (ret =3D=3D -ENODEV)
>>  			return ret;
>>  	}
>>  -	/* Set bypass mode according to firmware probing result */
>> -	bypass =3D !!ret;
>> -
>>  	/* Base address */
>> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	if (resource_size(res) < arm_smmu_resource_size(smmu)) {
>> -		dev_err(dev, "MMIO region too small (%pr)\n", res);
>> +	ret =3D dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
>> +	if (ret)
>> +		return -ENODEV;
>> +
>> +	if (iosize < arm_smmu_resource_size(smmu)) {
>> +		dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
>>  		return -EINVAL;
>>  	}
>> -	ioaddr =3D res->start;
>>    	/*
>>  	 * Don't map the IMPLEMENTATION DEFINED regions, since they may contai=
n
>> -	 * the PMCG registers which are reserved by the PMU driver.
>> +	 * the PMCG registers which are optional and currently not supported.
>>  	 */
>> -	smmu->base =3D arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
>> +	smmu->base =3D ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
>>  	if (IS_ERR(smmu->base))
>>  		return PTR_ERR(smmu->base);
>>  -	if (arm_smmu_resource_size(smmu) > SZ_64K) {
>> -		smmu->page1 =3D arm_smmu_ioremap(dev, ioaddr + SZ_64K,
>> +	if (iosize > SZ_64K) {
>> +		smmu->page1 =3D ioremap_nocache(ioaddr + SZ_64K,
>>  					       ARM_SMMU_REG_SZ);
>>  		if (IS_ERR(smmu->page1))
>>  			return PTR_ERR(smmu->page1);
>> @@ -2765,14 +3101,262 @@ static int arm_smmu_device_probe(struct platfor=
m_device *pdev)
>>  		return ret;
>>    	/* Reset the device */
>> -	ret =3D arm_smmu_device_reset(smmu, bypass);
>> +	ret =3D arm_smmu_device_reset(smmu);
>>  	if (ret)
>>  		return ret;
>>  +	/*
>> +	 * Keep a list of all probed devices. This will be used to query
>> +	 * the smmu devices based on the fwnode.
>> +	 */
>> +	INIT_LIST_HEAD(&smmu->devices);
>> +
>> +	spin_lock(&arm_smmu_devices_lock);
>> +	list_add(&smmu->devices, &arm_smmu_devices);
>> +	spin_unlock(&arm_smmu_devices_lock);
>> +
>>  	return 0;
>>  }
>>  -static const struct of_device_id arm_smmu_of_match[] =3D {
>> +static const struct dt_device_match arm_smmu_of_match[] =3D {
>>  	{ .compatible =3D "arm,smmu-v3", },
>>  	{ },
>>  };
>> +
>> +/* Start of Xen specific code. */
>> +static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
>> +{
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +	struct iommu_domain *io_domain;
>> +
>> +	spin_lock(&xen_domain->lock);
>> +
>> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>> +		/*
>> +		 * Only invalidate the context when SMMU is present.
>> +		 * This is because the context initialization is delayed
>> +		 * until a master has been added.
>> +		 */
>> +		if (unlikely(!ACCESS_ONCE(to_smmu_domain(io_domain)->smmu)))
>> +			continue;
>> +
>> +		arm_smmu_tlb_inv_context(to_smmu_domain(io_domain));
>> +	}
>> +
>> +	spin_unlock(&xen_domain->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t df=
n,
>> +				unsigned long page_count, unsigned int flush_flags)
>> +{
>> +	return arm_smmu_iotlb_flush_all(d);
>> +}
>> +
>> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev)
>> +{
>> +	struct arm_smmu_device *smmu =3D NULL;
>> +
>> +	spin_lock(&arm_smmu_devices_lock);
>> +
>> +	list_for_each_entry(smmu, &arm_smmu_devices, devices) {
>> +		if (smmu->dev  =3D=3D dev) {
>> +			spin_unlock(&arm_smmu_devices_lock);
>> +			return smmu;
>> +		}
>> +	}
>> +
>> +	spin_unlock(&arm_smmu_devices_lock);
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
>> +				struct device *dev)
>> +{
>> +	struct iommu_domain *io_domain;
>> +	struct arm_smmu_domain *smmu_domain;
>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +	struct arm_smmu_device *smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev=
);
>> +
>> +	if (!smmu)
>> +		return NULL;
>> +
>> +	/*
>> +	 * Loop through the &xen_domain->contexts to locate a context
>> +	 * assigned to this SMMU
>> +	 */
>> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>> +		smmu_domain =3D to_smmu_domain(io_domain);
>> +		if (smmu_domain->smmu =3D=3D smmu)
>> +			return io_domain;
>> +	}
>> +	return NULL;
>> +}
>> +
>> +static void arm_smmu_destroy_iommu_domain(struct iommu_domain *io_domai=
n)
>> +{
>> +	list_del(&io_domain->list);
>> +	arm_smmu_domain_free(io_domain);
>> +}
>> +
>> +static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>> +		struct device *dev, u32 flag)
>> +{
>> +	int ret =3D 0;
>> +	struct iommu_domain *io_domain;
>> +	struct arm_smmu_domain *smmu_domain;
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +
>> +	spin_lock(&xen_domain->lock);
>> +
>> +	/*
>> +	 * Check to see if an iommu_domain already exists for this xen domain
>> +	 * under the same SMMU
>> +	 */
>> +	io_domain =3D arm_smmu_get_domain(d, dev);
>> +	if (!io_domain) {
>> +		io_domain =3D arm_smmu_domain_alloc();
>> +		if (!io_domain) {
>> +			ret =3D -ENOMEM;
>> +			goto out;
>> +		}
>> +		smmu_domain =3D to_smmu_domain(io_domain);
>> +		smmu_domain->d =3D d;
>> +
>> +		/* Chain the new context to the domain */
>> +		list_add(&io_domain->list, &xen_domain->contexts);
>> +	}
>> +
>> +	ret =3D arm_smmu_attach_dev(io_domain, dev);
>> +	if (ret) {
>> +		if (io_domain->ref.counter =3D=3D 0)
>> +			arm_smmu_destroy_iommu_domain(io_domain);
>> +	} else {
>> +		atomic_inc(&io_domain->ref);
>> +	}
>> +
>> +out:
>> +	spin_unlock(&xen_domain->lock);
>> +	return ret;
>> +}
>> +
>> +static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
>> +{
>> +	struct iommu_domain *io_domain =3D arm_smmu_get_domain(d, dev);
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(io_domain);
>> +	struct arm_smmu_master *master =3D dev_iommu_priv_get(dev);
>> +
>> +	if (!smmu_domain || smmu_domain->d !=3D d) {
>> +		dev_err(dev, " not attached to domain %d\n", d->domain_id);
>> +		return -ESRCH;
>> +	}
>> +
>> +	spin_lock(&xen_domain->lock);
>> +
>> +	arm_smmu_detach_dev(master);
>> +	atomic_dec(&io_domain->ref);
>> +
>> +	if (io_domain->ref.counter =3D=3D 0)
>> +		arm_smmu_destroy_iommu_domain(io_domain);
>> +
>> +	spin_unlock(&xen_domain->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
>> +				u8 devfn,  struct device *dev)
>> +{
>> +	int ret =3D 0;
>> +
>> +	/* Don't allow remapping on other domain than hwdom */
>> +	if (t && t !=3D hardware_domain)
>> +		return -EPERM;
>> +
>> +	if (t =3D=3D s)
>> +		return 0;
>> +
>> +	ret =3D arm_smmu_deassign_dev(s, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (t) {
>> +		/* No flags are defined for ARM. */
>> +		ret =3D arm_smmu_assign_dev(t, devfn, dev, 0);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>> +{
>> +	struct arm_smmu_xen_domain *xen_domain;
>> +
>> +	xen_domain =3D xzalloc(struct arm_smmu_xen_domain);
>> +	if (!xen_domain)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&xen_domain->lock);
>> +	INIT_LIST_HEAD(&xen_domain->contexts);
>> +
>> +	dom_iommu(d)->arch.priv =3D xen_domain;
>> +	return 0;
>> +
>> +}
>> +
>> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>> +{
>=20
> Both SMMUv2 and IPMMU perform some actions here. Any reason we don't need=
 to do the same here?
>=20
>     /* Set to false options not supported on ARM. */
>     if ( iommu_hwdom_inclusive )
>         printk(XENLOG_WARNING
>         "map-inclusive dom0-iommu option is not supported on ARM\n");
>     iommu_hwdom_inclusive =3D false;
>     if ( iommu_hwdom_reserved =3D=3D 1 )
>         printk(XENLOG_WARNING
>         "map-reserved dom0-iommu option is not supported on ARM\n");
>     iommu_hwdom_reserved =3D 0;
>=20
>     arch_iommu_hwdom_init(d);

I will add the above code for SMMUv3 also.

Regards,
Rahul

>> +}
>> +
>> +static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>> +{
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +
>> +	ASSERT(list_empty(&xen_domain->contexts));
>> +	xfree(xen_domain);
>> +}
>> +
>> +static const struct iommu_ops arm_smmu_iommu_ops =3D {
>> +	.init		=3D arm_smmu_iommu_xen_domain_init,
>> +	.hwdom_init		=3D arm_smmu_iommu_hwdom_init,
>> +	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
>> +	.iotlb_flush		=3D arm_smmu_iotlb_flush,
>> +	.iotlb_flush_all	=3D arm_smmu_iotlb_flush_all,
>> +	.assign_device		=3D arm_smmu_assign_dev,
>> +	.reassign_device	=3D arm_smmu_reassign_dev,
>> +	.map_page		=3D arm_iommu_map_page,
>> +	.unmap_page		=3D arm_iommu_unmap_page,
>> +	.dt_xlate		=3D arm_smmu_dt_xlate,
>> +	.add_device		=3D arm_smmu_add_device,
>> +};
>> +
>> +static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>> +				const void *data)
>> +{
>> +	int rc;
>> +
>> +	/*
>> +	 * Even if the device can't be initialized, we don't want to
>> +	 * give the SMMU device to dom0.
>> +	 */
>> +	dt_device_set_used_by(dev, DOMID_XEN);
>> +
>> +	rc =3D arm_smmu_device_probe(dt_to_dev(dev));
>> +	if (rc)
>> +		return rc;
>> +
>> +	iommu_set_ops(&arm_smmu_iommu_ops);
>> +
>> +	return 0;
>> +}
>> +
>> +DT_DEVICE_START(smmuv3, "ARM SMMU V3", DEVICE_IOMMU)
>> +.dt_match =3D arm_smmu_of_match,
>> +.init =3D arm_smmu_dt_init,
>> +DT_DEVICE_END
>=20
> --=20
> Regards,
>=20
> Oleksandr Tyshchenko


