Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E464B7443
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 19:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273516.468731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK2Eu-0005px-Tr; Tue, 15 Feb 2022 18:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273516.468731; Tue, 15 Feb 2022 18:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK2Eu-0005n6-Qh; Tue, 15 Feb 2022 18:07:48 +0000
Received: by outflank-mailman (input) for mailman id 273516;
 Tue, 15 Feb 2022 18:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nK2Et-0005n0-0r
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 18:07:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c802dbe-8e8a-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 19:07:45 +0100 (CET)
Received: from DB6PR0601CA0043.eurprd06.prod.outlook.com (2603:10a6:4:17::29)
 by AM0PR08MB3313.eurprd08.prod.outlook.com (2603:10a6:208:5b::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 18:07:42 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::55) by DB6PR0601CA0043.outlook.office365.com
 (2603:10a6:4:17::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Tue, 15 Feb 2022 18:07:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 18:07:42 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Tue, 15 Feb 2022 18:07:42 +0000
Received: from 4766961b5fc3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E78D100C-7772-4F25-AB0C-4DF61E4E8629.1; 
 Tue, 15 Feb 2022 18:07:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4766961b5fc3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Feb 2022 18:07:35 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by DB8PR08MB5401.eurprd08.prod.outlook.com
 (2603:10a6:10:f9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 18:07:04 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 18:07:03 +0000
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
X-Inumbo-ID: 2c802dbe-8e8a-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szVxqRYqApVF4U9mQMR3Hj8x4A4y+hkIF5dfR//gidc=;
 b=2N3FQwLGts9kaQCzkmK+fLUYqRI8HHcXs4fS0+HIAEuwgEdE1Vcc6l/tjUCLytJeUkivyTcePvbYlwVy7jxcb0b94MFLcVczdv76lP0rOIG1iJzru2W1/2M8l6TrTYC2sGVAB7/njOCjiDW6QzOoHHlyVvNHVa0vPtcaEg8qpjI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca4dd0c44a9648d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzxnvNHfRjF5KzRj599BAEfIO3tdpfO39vERQCU6YC42FuFekt6eWdkHyNUAW5+3LLknXv8IbwlCFEepqXrvDenIvYZRs3tPF1dNqpgshXMt3Z2dGbbZG1xOUDqH2n+3ekyXaDKUvTJQvkzMfA0c3UViH4M0L+1yRS93xe+FuYkHL56zN1tg+vTBAp/tYhW+3qoWUsPU7yp/x6DZ9NbkUTJMi0zm59PPajrF8YH61JHSkWp1ejN+sE8V2HNyLTL8aqx9oZXvyVAPmTTGiLZH8ifHqgOOpiBW9obGHWqEE10ukVnGTtTd+h+Fj48TOO/RpNy/+F6HxE1KMSVm0U1w0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szVxqRYqApVF4U9mQMR3Hj8x4A4y+hkIF5dfR//gidc=;
 b=bfN+EKoSTl1mvfBR9TdG7Rl1sj6X8CLFxE4kSCA5ahokln8QzeYIVEZZcHf21Z51PknwYcH5NLbnDWTWrSgpInNq5UTkQgy8p0rXIJRldVVuc+g4VbagCZfbjX5cLcS+2UyeRXr0y2x9Y6yDEQDiFl/CtucXJeCpOWQOtbVBi0wU5lx3XhJvyCRYguvmIQLqZ5lxegdoWA/xgliw0NossdvVPsb03gP9ftnbIPOzWaDBU6x8Wt0Y1dDSSrBQBQQKacvcfVVNr4L/H/i5p8AtpSZVv2sGQiLmcwGFBeZH8tHX+HhSdM25VifOxkefWo7pdGn8yZqcnIpYXxbgDjLo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szVxqRYqApVF4U9mQMR3Hj8x4A4y+hkIF5dfR//gidc=;
 b=2N3FQwLGts9kaQCzkmK+fLUYqRI8HHcXs4fS0+HIAEuwgEdE1Vcc6l/tjUCLytJeUkivyTcePvbYlwVy7jxcb0b94MFLcVczdv76lP0rOIG1iJzru2W1/2M8l6TrTYC2sGVAB7/njOCjiDW6QzOoHHlyVvNHVa0vPtcaEg8qpjI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 5/5] arm/dom0less: assign dom0less guests to cpupools
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <812858d6-3f39-87ed-b495-a15d34f6e930@suse.com>
Date: Tue, 15 Feb 2022 18:06:58 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C5131247-1F1D-49EB-8D4C-CD7998479ACC@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-6-luca.fancellu@arm.com>
 <812858d6-3f39-87ed-b495-a15d34f6e930@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO2P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::19) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 310c6a3e-60e8-4f26-5b38-08d9f0ae0f52
X-MS-TrafficTypeDiagnostic:
	DB8PR08MB5401:EE_|DB5EUR03FT028:EE_|AM0PR08MB3313:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3313903E0B475F0ECB1E6799E4349@AM0PR08MB3313.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ELSmZz6PsE4xRxAuK5m59YAYWPu0p0vhySebPOwjV5n5RneNYFlCVC8sbtRhgL1zg6BxYeMh9nqtqPQSuarc44CisSyLkA7f84593GB8XhG5qVvqn5wA7Xo656mG4PTdf1peqXIqTcnS17a0PU6omOh/X/fKvXUljfCsHE5ybXbSvBjuZkkMeRkbSpD+Gtlfa3n3KhGw0Txrhre4SwQF1wJYrzEQp5bg3w3zk4Zlhnsy1I1dpz351lf8Zg3o8tahRkvnB8IaK1GOpwlKrdtzNn0LVyGbpGnkDXmguXWhyNXl3OREPClw+JlqAn/uK0G0x9uQe0weTaHOvTA2Y3qLI4pn0uNT398sDn43KLME9ZRF7wBdHhqCKFqSIcucUKiy2vwvrCj7nm2iwNy0lucEYwLeWZUHjK3C10cxQIe4XzmHkLpwQ4HolVr5nz1chflxBWhdl30IwzLK8En4+OyTw9Uf6LL1GmoQE4jU0K18hrUvMSOTzlqdRjmFRi9DKzlm2jaq9zE6C78L/xYd7Mjbebf7Gr8g7WvyLdU03Go48qeuca6UXwE0CuI18wn7Px4ZNlEO44PFLmoTJR7JzhRQ3Tm38lG/0QxlWRaiT2cTk3E1aJ/jrV8xgfhKRy/MQDPHxfdU447S2xgOt5QawHdBfvynMFDhPcGnrLNeXNnQPT68gcCUZ2pHThZ83tTmRwaJNLzJo3nWiXRzqi71U+HRCNNP6MoCZ7manRlYtOo/0EUZS7/Vvh1Icn+I3FPUYpbzJVfzPXF/ck6xgd/36XvLVw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(6512007)(6506007)(6666004)(52116002)(508600001)(36756003)(53546011)(44832011)(33656002)(2906002)(5660300002)(7416002)(8936002)(4326008)(8676002)(316002)(66946007)(66556008)(66476007)(54906003)(6486002)(2616005)(26005)(186003)(86362001)(6916009)(38100700002)(38350700002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5401
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc533a3c-db61-4e1a-fe82-08d9f0adf868
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dxm9MLjeN6VtO+lfRF/SF5RjhrI4eLP+1LGHYDQZKyyRTtUS4QPdjBoA1LbAEiuXZIsHDdYOE/B7Du9TmhSXIbb+wlKJZDrzezdH7F0H2ciHYGaaX5KeFHYZFVmT4se7/yUVEuFXB2nII7RDSkOuYAmeROko+0J2HXEs7OQcNLegn4stTgDF9ec6rmuqn2xt3OkxXj1LbTx58dZu9kcJ+DK5UBHWk7o7vn13AG1u7XIogIhXFS9xPHUsysedMgCtbzvASwuDHv+6mYtChEGKjdkVwHKCIrmNZo07cNUJewxxTsmvXh3KktVfdTpUtJbxyAowdYgtq9xJfj5dnY/yHhXIfd5TOxsSq/zbWF51ciAc/C8WkU496MxebQWNOBrKiHk6QYG8hwp/+m0Ul9oyyl995zFCnQsG9seLTHwhFvtBRH+saqqn0L0+fhH7uJxpz1LWUYdOMkAoPdTD6fEkGjBvBwAcR8MPV7n784beZNoU4LCfrgysYzl3Pzzy8zkDbAzGz5Q9HO2HtH388AfO7gPMPaUfDRSCcivyogMMD2FIKiYmnd5xpS3y2niYtbFEdf6uC/tQJTNTFnJ/nl5xG/+nqVfuFFzBJ0Ko0cXT0iE+lQzE/wIpOrVgmF5TZRL8rPWpR7Xy3aRvKsGlxQn3lgD9NxHrn7RQo0T4DtiJvBCTe2KiP6lptuSuRPmIgBDisWoglJjcu5RLZfqJtrWO2Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(8936002)(70586007)(82310400004)(44832011)(2906002)(6862004)(26005)(70206006)(356005)(81166007)(40460700003)(4326008)(107886003)(186003)(86362001)(8676002)(6506007)(53546011)(336012)(508600001)(6512007)(6486002)(6666004)(36860700001)(2616005)(47076005)(83380400001)(33656002)(36756003)(54906003)(316002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 18:07:42.1587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 310c6a3e-60e8-4f26-5b38-08d9f0ae0f52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3313



> On 15 Feb 2022, at 10:56, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 15.02.22 11:15, Luca Fancellu wrote:
>> Introduce domain-cpupool property of a xen,domain device tree node,
>> that specifies the cpupool device tree handle of a xen,cpupool node
>> that identifies a cpupool created at boot time where the guest will
>> be assigned on creation.
>> Add member to the xen_arch_domainconfig public interface so the
>> XEN_DOMCTL_INTERFACE_VERSION version is bumped.
>> Update documentation about the property.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  docs/misc/arm/device-tree/booting.txt | 5 +++++
>>  xen/arch/arm/domain.c                 | 6 ++++++
>>  xen/arch/arm/domain_build.c           | 9 ++++++++-
>>  xen/arch/x86/domain.c                 | 6 ++++++
>>  xen/common/domain.c                   | 5 ++++-
>>  xen/include/public/arch-arm.h         | 2 ++
>>  xen/include/public/domctl.h           | 2 +-
>>  xen/include/xen/domain.h              | 3 +++
>>  8 files changed, 35 insertions(+), 3 deletions(-)
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 71895663a4de..0f1f210fa449 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -182,6 +182,11 @@ with the following properties:
>>      Both #address-cells and #size-cells need to be specified because
>>      both sub-nodes (described shortly) have reg properties.
>>  +- domain-cpupool
>> +
>> +    Optional. Handle to a xen,cpupool device tree node that identifies =
the
>> +    cpupool where the guest will be started at boot.
>> +
>>  Under the "xen,domain" compatible node, one or more sub-nodes are prese=
nt
>>  for the DomU kernel and ramdisk.
>>  diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 92a6c509e5c5..be350b28b588 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -788,6 +788,12 @@ fail:
>>      return rc;
>>  }
>>  +unsigned int
>> +arch_get_domain_cpupool_id(const struct xen_domctl_createdomain *config=
)
>> +{
>> +    return config->arch.cpupool_id;
>> +}
>> +
>=20
> I don't see why this should be arch specific.
>=20
>>  void arch_domain_destroy(struct domain *d)
>>  {
>>      /* IOMMU page table is shared with P2M, always call
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 6931c022a2e8..4f239e756775 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3015,7 +3015,8 @@ static int __init construct_domU(struct domain *d,
>>  void __init create_domUs(void)
>>  {
>>      struct dt_device_node *node;
>> -    const struct dt_device_node *chosen =3D dt_find_node_by_path("/chos=
en");
>> +    const struct dt_device_node *cpupool_node,
>> +                                *chosen =3D dt_find_node_by_path("/chos=
en");
>>        BUG_ON(chosen =3D=3D NULL);
>>      dt_for_each_child_node(chosen, node)
>> @@ -3053,6 +3054,12 @@ void __init create_domUs(void)
>>                                           GUEST_VPL011_SPI - 32 + 1);
>>          }
>>  +        /* Get the optional property domain-cpupool */
>> +        cpupool_node =3D dt_parse_phandle(node, "domain-cpupool", 0);
>> +        if ( cpupool_node )
>> +            dt_property_read_u32(cpupool_node, "cpupool-id",
>> +                                 &d_cfg.arch.cpupool_id);
>> +
>>          /*
>>           * The variable max_init_domid is initialized with zero, so her=
e it's
>>           * very important to use the pre-increment operator to call
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index ef1812dc1402..3e3cf88c9c82 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -880,6 +880,12 @@ int arch_domain_create(struct domain *d,
>>      return rc;
>>  }
>>  +unsigned int
>> +arch_get_domain_cpupool_id(const struct xen_domctl_createdomain *config=
)
>> +{
>> +    return 0;
>> +}
>> +
>>  void arch_domain_destroy(struct domain *d)
>>  {
>>      if ( is_hvm_domain(d) )
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 2048ebad86ff..d42ca8292025 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -665,6 +665,8 @@ struct domain *domain_create(domid_t domid,
>>        if ( !is_idle_domain(d) )
>>      {
>> +        unsigned int domain_cpupool_id;
>> +
>>          watchdog_domain_init(d);
>>          init_status |=3D INIT_watchdog;
>>  @@ -698,7 +700,8 @@ struct domain *domain_create(domid_t domid,
>>          if ( !d->pbuf )
>>              goto fail;
>>  -        if ( (err =3D sched_init_domain(d, 0)) !=3D 0 )
>> +        domain_cpupool_id =3D arch_get_domain_cpupool_id(config);
>> +        if ( (err =3D sched_init_domain(d, domain_cpupool_id)) !=3D 0 )
>>              goto fail;
>>            if ( (err =3D late_hwdom_init(d)) !=3D 0 )
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm=
.h
>> index 94b31511ddea..2c5d1ea7f01a 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -321,6 +321,8 @@ struct xen_arch_domainconfig {
>>      uint16_t tee_type;
>>      /* IN */
>>      uint32_t nr_spis;
>> +    /* IN */
>> +    unsigned int cpupool_id;
>=20
> As said above: why is this arch specific? Moving it to the common part
> would enable libxl to get rid of having to call xc_cpupool_movedomain()
> in libxl__domain_make().

I=E2=80=99ve put it in arch because it=E2=80=99s only modified by the arm c=
ode, but if you think it=E2=80=99s ok
to have it in struct xen_domctl_createdomain, I don=E2=80=99t see any probl=
em.
My knowledge of the tool stack is limited so I didn=E2=80=99t know about th=
e advantages
of that change.

Cheers,
Luca

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


