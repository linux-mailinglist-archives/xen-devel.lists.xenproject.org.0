Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC96040E19E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 18:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188649.337889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQuNU-0007nv-RT; Thu, 16 Sep 2021 16:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188649.337889; Thu, 16 Sep 2021 16:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQuNU-0007lZ-OC; Thu, 16 Sep 2021 16:36:48 +0000
Received: by outflank-mailman (input) for mailman id 188649;
 Thu, 16 Sep 2021 16:36:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lm3Y=OG=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQuNT-0007lT-C8
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 16:36:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71a7c576-2367-4dc0-8510-543361e13219;
 Thu, 16 Sep 2021 16:36:45 +0000 (UTC)
Received: from AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) by DB9PR08MB7195.eurprd08.prod.outlook.com
 (2603:10a6:10:2ce::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 16:36:43 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::1e) by AM5PR0701CA0014.outlook.office365.com
 (2603:10a6:203:51::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.5 via Frontend
 Transport; Thu, 16 Sep 2021 16:36:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 16:36:42 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Thu, 16 Sep 2021 16:36:40 +0000
Received: from ba851a647237.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65041264-D4B2-4FC6-A3E5-88A493900A93.1; 
 Thu, 16 Sep 2021 16:36:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba851a647237.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 16:36:23 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3303.eurprd08.prod.outlook.com (2603:10a6:209:40::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 16:36:19 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 16:36:19 +0000
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
X-Inumbo-ID: 71a7c576-2367-4dc0-8510-543361e13219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rh5U5jBs7lh719Lm+U+c+VrgWPm2L8w30+OVH8bS7NQ=;
 b=zh1acYIj8fhfHwtz80NdaRl9H/tEK5qb+uGks7e28yGDgubo9Be9uNPY12I0bfysAe9fNjmdKwxpBlGWPHh8pmwmWEaXqponHkiIjTYnSRpGrrGqx61ZALcvZbwmEPCyiS0cpQ+CrSiVuywQJFyFT8PSXG9ey4eCd2mVqHN/Hm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b01904e5e115c3d8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qq8u6PTZUrKX4I3c0QI0owmnhAXTNg//YP4fGSuFkoOGVZd70Hui7cJAW1AQ3gB6NHF7bNM+sXLihpm42eU6jjiMu9HtXLtEwW3/pQumy8n30J/FcQOAE0Tbkhz6Ag4clBnj7EKVKYX2qG+JEB7V+gYFUiYRrcGO5wkYSHgtL/CdNgGz31akOmXruQ0xl8lyv9eamwRj5gqVIIMdmpgmTTUtcVwhkuG+/bDnOhEdd89xlTzUqeBHd18LRY6xpQuRiDzrEESUXracRv/c4Nul2rErfddO9guy8y1Qfaf0yUxs3gjZ5icboC2DUz9lXe4SxoxHELXidPmgJXBK4ukInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Rh5U5jBs7lh719Lm+U+c+VrgWPm2L8w30+OVH8bS7NQ=;
 b=MxEGdEqz8MTu1CA4iT3hYxLjUszzXlwvPgEJbGovA+ln67po4jg5VdMdSFUqeroZf4tajKv29J+WVjPJCNICCUCgHmCgtAi/f04sxR1TG/a3sTULa4MnXsRWeDXHPRSOG/H6REIGzFa24C9yHK7QblftqXlHYq7tr+idEDAXYqfbWr3wr16q19wC0zZFVAQKA6Tfmyvxt/zhlKDr4aTnnQpzs2v65/KSsqpEO9WLS+YxjK9kyG+UTdyx0WoKD6lZthJFBzguEI/4+ZzlaZlGaIIC2QvT31Mm49eP9PvZW7GFvc9lzhdMZxy/vkl2HJkh/ZAprL+m4jFSQUChU5AODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rh5U5jBs7lh719Lm+U+c+VrgWPm2L8w30+OVH8bS7NQ=;
 b=zh1acYIj8fhfHwtz80NdaRl9H/tEK5qb+uGks7e28yGDgubo9Be9uNPY12I0bfysAe9fNjmdKwxpBlGWPHh8pmwmWEaXqponHkiIjTYnSRpGrrGqx61ZALcvZbwmEPCyiS0cpQ+CrSiVuywQJFyFT8PSXG9ey4eCd2mVqHN/Hm8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 14/14] xen/arm: Add linux,pci-domain property for hwdom
 if not available.
Thread-Topic: [PATCH v1 14/14] xen/arm: Add linux,pci-domain property for
 hwdom if not available.
Thread-Index: AQHXlPMDjN8YIk1EsES2o1HUm/aDequclJ+AgApzbQA=
Date: Thu, 16 Sep 2021 16:36:18 +0000
Message-ID: <1A906E81-C6B4-4631-8A40-2B06E2D139EB@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <0b979ccab6a4c9b2070748709f737f41fa108a42.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091758290.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109091758290.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: dd8ad2c4-28ba-4b90-11d7-08d979302a74
x-ms-traffictypediagnostic: AM6PR08MB3303:|DB9PR08MB7195:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB71950BBE9D2E5BCE2A67C7F4FCDC9@DB9PR08MB7195.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZomSBdQBOQRqInV9pep68ErloF6AaxTepghhuyf16G23v1ZufFwnrmCxYCzLwyT/K7PcJpZ0sxDuZH1YKQevRLzC3qHA8uyGoKUA/APQ5ZnDtV6kHkzzY9dPzrh/oVG6xe1zuLiE6HGlXcRbmdw+gHZWt7uN+7idX998/Go2J6QeSy25OiI8z6au5lmDh4GmoQDF7LpZYAC4cPhGeK9HbhWLhe9vSO2lAZhPNnKftPQzPdJs3KeRQrzeEtOhfjrbLxUKvMBp3QirBQlkNA8gMJ6srNtgT3TbtaQhhbYyT3TL3/Rv68zswJdFgu8HWue5Vwbo3AnGlwnf99skewbBXbYyC3LATCDBUW0JQkAq6fYBn+kZ0JKxLcUYtCrM3XpwaRYVvSZ1zg45dm/TBSCBYbR5h+6F+HxLB56OeKoqPP5FCRDYbGd3CBGThpMl3dAmfgnvLoWgt+xF8ArAWBNR4XLsyGG62f79K5hk++HODmFKrRuw/Y/EPaiZC6Df3AHxmVD7jReFhuHah3FP3Lme50mAL/jAbps33gGsDc/SLWpOlifUt6oybIiuq0NUwCkJKuRF4d68PDmevlEib19K43aoqcUKWyR1pAJdCgQwAi7ApsYBH5q3Jt+5GoyBYtEIbtbd/BwKEG7CBb++JBoOHMzULtRtQq2EgE61BTOwrlAYYNGV2vXyy18tiZ2cnwkaJQ2OM4GPar/Arfroe/b+elvcd6Mikl8qLFbDK+i1x4g1KBwWMPl2QqsUHzg22tY8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(54906003)(316002)(4326008)(6486002)(8676002)(8936002)(76116006)(6916009)(86362001)(91956017)(478600001)(38070700005)(2906002)(83380400001)(66946007)(5660300002)(2616005)(64756008)(38100700002)(53546011)(66446008)(26005)(66556008)(122000001)(66476007)(6506007)(6512007)(71200400001)(36756003)(33656002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2B2B4F3B0F74B14EA12DBD4AB9417D01@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3303
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee391fce-5aee-4eda-1485-08d979301c70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8wrGjyISXqTEDLFN4rLaeQ67gjLrmtFhkkdZkeeL/ZMVrZwTa0g+1gkUaMp14Je/v8uBJd+UlStnVDeN+6W7aD1QfrsRWX7NKuU4H+ILVk1UAfWeNzTQpPoYj3AMUHbjKg2xau3sUR0rX98c/Yoy+JiFfI+Psjp7AIoSuDBmoGpxJmWw3koK8b7obwr0p4u04tSPgMk9m+IaG/boQza3lBNBvFM3UDF6lr0g6/IyyeAjRJAKppxHFUM6slxfuq5UWDu5/l5s5/KI/3YXpMzK88u5I89xri0VcPbJZ4V4z2W+ZtZbYeVZNcibHtQTIXhFXmRoNC8OOz5fDDLoAIT90T1b2+OvDwJpnQ/Mpbo82jeB9LhLmKyCBM2Pl3TPE0Zbk1K6KEzdC/VifzwoNdFodqvI46AYmXWeDJajMWQ/74Ya8czMN3LQQNjnMcQ7wPt7jU5pD/pPxnJ+giMxa0w0R2MUi4r+c2DFr0QxfTzxse/M3r8u5K5Y86t/nrWNTTuo21pO4Aav6GzzTPjfB6jcjRZs47YL2VSQWaaEDWwnHCHMhVSl8guBofE1lsLw3X1rEVVeY3mZDkoWv9FC2Tq4qmG+nOUNnAb1lFu2rZKyCoEvXy68jL2Rr9JLSeWRoPRSAwKkjfyek8+NEuW/TX5cOd2QmEJaDb6vs1z4M83IqzrXvXkmk5/zUEqDgivdq/rX8tPsvsYEsRaMmVq199UUQQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966006)(36840700001)(26005)(107886003)(53546011)(6506007)(2616005)(336012)(36756003)(70206006)(70586007)(5660300002)(86362001)(82310400003)(36860700001)(186003)(82740400003)(33656002)(356005)(81166007)(83380400001)(4326008)(2906002)(8936002)(478600001)(6862004)(6512007)(316002)(47076005)(54906003)(8676002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 16:36:42.4747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8ad2c4-28ba-4b90-11d7-08d979302a74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7195

Hi Stefano,

> On 10 Sep 2021, at 2:00 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 19 Aug 2021, Rahul Singh wrote:
>> If the property is not present in the device tree node for host bridge,
>> XEN while creating the dtb for hwdom will create this property and
>> assigns the already allocated segment to the host bridge
>> so that XEN and linux will have the same segment for the host bridges.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/arch/arm/domain_build.c        | 18 ++++++++++++++++++
>> xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
>> xen/include/asm-arm/pci.h          |  3 +++
>> 3 files changed, 42 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 6c86d52781..e0cf2ff19d 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -581,6 +581,24 @@ static int __init write_properties(struct domain *d=
, struct kernel_info *kinfo,
>>             return res;
>>     }
>>=20
>> +#ifdef CONFIG_HAS_PCI
>> +    if ( dt_device_type_is_equal(node, "pci") )
>> +    {
>> +        if ( !dt_find_property(node, "linux,pci-domain", NULL) )
>> +        {
>> +            uint16_t segment;
>> +
>> +            res =3D pci_get_host_bridge_segment(node, &segment);
>> +            if ( res < 0 )
>> +                return res;
>> +
>> +            res =3D fdt_property_cell(kinfo->fdt, "linux,pci-domain", s=
egment);
>> +            if ( res )
>> +                return res;
>> +        }
>> +    }
>> +#endif
>=20
> If param_pci_enable is false it might be possible that Xen didn't
> allocate a segment. In that case, we should just let Linux do whatever
> it wants in terms of segment allocation. So I think the code here should
> not return error if param_pci_enable is false.
> returning an error instead.

Ack. I will modify the code as per your request in next version.

Regards,
Rahul


