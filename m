Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A216B42FA56
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 19:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211005.368066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbR5d-0006FM-72; Fri, 15 Oct 2021 17:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211005.368066; Fri, 15 Oct 2021 17:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbR5d-0006D0-3E; Fri, 15 Oct 2021 17:33:53 +0000
Received: by outflank-mailman (input) for mailman id 211005;
 Fri, 15 Oct 2021 17:33:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbR5b-0006Cu-Nv
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 17:33:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e8b40bb-2dde-11ec-824b-12813bfff9fa;
 Fri, 15 Oct 2021 17:33:50 +0000 (UTC)
Received: from AM6PR10CA0063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::40)
 by DB8PR08MB5372.eurprd08.prod.outlook.com (2603:10a6:10:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 17:33:48 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::46) by AM6PR10CA0063.outlook.office365.com
 (2603:10a6:209:80::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 17:33:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 17:33:46 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Fri, 15 Oct 2021 17:33:46 +0000
Received: from c9330f0657f9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2876D7B0-E2F8-43DA-A934-B564E54DBF49.1; 
 Fri, 15 Oct 2021 17:33:35 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9330f0657f9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 17:33:35 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0802MB2184.eurprd08.prod.outlook.com (2603:10a6:4:83::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Fri, 15 Oct
 2021 17:33:30 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 17:33:30 +0000
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
X-Inumbo-ID: 0e8b40bb-2dde-11ec-824b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NS8KAcOWF2xF+shDD8oVA0iXat1AOs8G2IynsaTEqM0=;
 b=1vS/i2BKYyA39yrE+hzXSXaEq+M2k4xk5z6Ov/oA9SlLxlBjfwjvrwkPstG6y6joQBke4J3wZXTREj49zrXTpB6tywbimsk/kRN+gSd116/bkct8ZExhuKUaGrKrZAhiBVLmMhX7pkPAUzM3EK5xZzqfeLs6r0OP7BIxC+WJmp0=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10ce6eb8437c2f31
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gL+HamsuZtbX9xkuTYEz4dEva8MGvYiMdMpJA3BvL5iDTnJamScoA4BSo0kqLEd+i4hV+B0z60zqlLSmVgWIt6OzPoyZ5p2vctSbJV7VlTCgUBJhuSUo6lOMowIfD/rTHGzeGUgUSMDLmrE03v02PSuzDU3i8a2zf/7mlQBNIy5PfClhsl6J6/xTJmMdv/JDrz9Y9QkoHRYQFyenGNCUNFldVapGFCechVrHCw0SCDlCCBW01RL/DVUIbUh3Zn7jSpJNiVzc80DXbObSC6RVvll0RGD1lQ1kMx+TUa1ciMTUWtIGyg789sh/Sb/065zBk4+EYv8az1/I1m806ZtNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS8KAcOWF2xF+shDD8oVA0iXat1AOs8G2IynsaTEqM0=;
 b=PJXQBKv8Jy/VUkADUAMkYBjAwiW3KCtCCE8xVywuXVLxLg+nLoMo8XdxvRNwEbSQ33wor3vMzBIVjcojzwhJfr+DzjDaPUgHxjV1UvJ/OCuTx0XWdOE+q/6I+c4SV0C0eX+c7CMjpgMi2qywZzgy7X36XETcQwX/5kZTwPBcobgYswg1OIDYPQ9ppUgCf3CtKSGWYv6k4YcBqVSs5lgBgjH14XOCEgZp8ZHuIEPsRWFxUVEpu9zZxHYCv7ZtySkKZUvsSIZ7iryKoH52V/DUKG1/rcom0ki0fDTFmsgSWo6SL7ZkqhU+BFGPTOIaqjPhQC0Aqc/Q9dAzBGGp28NeXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NS8KAcOWF2xF+shDD8oVA0iXat1AOs8G2IynsaTEqM0=;
 b=1vS/i2BKYyA39yrE+hzXSXaEq+M2k4xk5z6Ov/oA9SlLxlBjfwjvrwkPstG6y6joQBke4J3wZXTREj49zrXTpB6tywbimsk/kRN+gSd116/bkct8ZExhuKUaGrKrZAhiBVLmMhX7pkPAUzM3EK5xZzqfeLs6r0OP7BIxC+WJmp0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	Rahul Singh <Rahul.Singh@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXweULx+Lzp09rU0elFmx0jxVt5qvUT3iAgAACRwA=
Date: Fri, 15 Oct 2021 17:33:30 +0000
Message-ID: <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
In-Reply-To: <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8c1d6db0-4e32-4100-28d8-08d99001f132
x-ms-traffictypediagnostic: DB6PR0802MB2184:|DB8PR08MB5372:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB537239D156A9F2245E1B19B09DB99@DB8PR08MB5372.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a95dD96Bvl9VrHsNI5dwx88VGNbLtyp0Qc4naH7S2lvdnRhoq2ADfoO9Qd5RWuh27QI7oArAvc7JQtNyb850MJ5YT4yZAK4tY2uIW9EIKLLuj0qoDLFY50g7PSdp+5rRHmZRHsK2G+bXycKidCKi/SdBxvSn4U4RlSRBdv42/zh4bX9VaBHv+EJQC6B/GTNgfv8Cy+wyn0ebX4uXa6+IsPJFhGFmYf5G1ykScllT9p8yS3zJzAKdZfVi0ARY2JltKzEJj4LoSsOh16i6gSoK8kKEyWl31xpmk0rS0v/v4LoupzLwLdF+qu44VJqcmSi9HPZexbIaAiAYMzLkN/Ply/B4IVQspQQnKjaQhDfV75abIf4fy5Jm7BvNCpf/u8DM325AH04wMXF5bKBe4jzNtPLVcJjIk67kVXNZaGOx4XTOpa3gcNMtXABpK7ro42gM0Mzqw6mAO32Ydf8kWRYkrPUVihul2wc85a1YpWJnXz2opmwLoOsz/EARzVvlosleKqb1dF5nZssPuwZuNxz3DtAeIS1SG87xabu8TaVJOezjYGG5Lj9zbOY2wasneq4vKUhTRP/bsyoJpasqRxDl/9bYQsUe6BkbSrXBKgKDYIbtTi2JfZ392JihTGt23YC4nhM+8JQs/1K7ftr69XHn9sC4nVK+HJ8n0dAPObroyanqODSF13YI0IuNO7BFXoxHNyF2m7rV5glds/RDOd2rkkh3zxoEl9s/vwQkMfhrIjuX4Bu/YNSRWbnRVgMAscwL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(8936002)(64756008)(33656002)(2616005)(6916009)(8676002)(5660300002)(66946007)(76116006)(4326008)(2906002)(86362001)(91956017)(66556008)(38070700005)(54906003)(38100700002)(316002)(122000001)(66446008)(6486002)(6506007)(53546011)(186003)(71200400001)(26005)(36756003)(7416002)(508600001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <058A6F800BCFDD4A96D6FA07646F6054@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2184
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3dfc17f-8f61-437b-04a0-08d99001e79d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vtCdAZ9GceyiMa7cA8oWlD4oVVdj+Flt/SNnMcWq3KXr16iFBKmp/Fni1oXuCcmp5d5RWzCSbKQKbN8NfLnzMvyNrzFOLo7wGWqg8LNlfkxsaApwLjP+5+beK4kczu5ANCkStLRkZq5WR6DGU2tm8OG8RWDcebRJDmzCgx/qYAzOMjt5Qdv4JcNiyvjE0KRiiWrn1xM739sJ5AWGrvvWvRE3xhaD098hkB8jhizZEK0+EE+czwZd4taLiKhSCS6CHTU/Se/vBM0aZz/tNAvU91VEihq0aQL5S+weJ3SFBU/ne2W6ZRVz2VW+gwCyRXDDlZGeG2ePW1DSrNrNehH5FXOsVDxCogkwHWaP5YOm22iym9v5ftppO/vtQdZT6BpxcVuV3U/YGmMBUjgeI9WKiJzI6npY52wLTjNyA6+Fw3qDf4ue40XjXT+UBcDETNqTHyOSJLXOLB9Vpp0IK/WCyVTXpmj648myFR7DYC7Lw8vPRQyEIF4LmGnKx8FUS4Z2PzJDQNvUji6tarjMlyGmDu8koTfl496L6obMmFMCTkPO9CIPB9gGvnBF6yKFqdtwpYZP4fPHAyDc6HhRSolmye0yGN4HN4131sXkcyIV9v7U7mn6pVgOHep3WYJF8J0HbXiB8IXq9alN9TA7uc3IX6QQasYd+ZhMsdRZ0aH6nugo9MePoBKl+gOpTBkUDlP27d35LUi9mDnrJuS3DAb2OVD7qd5ST0ILAcE7cCgz3AQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(47076005)(82310400003)(8936002)(63370400001)(508600001)(6486002)(4326008)(70206006)(5660300002)(2906002)(63350400001)(107886003)(36756003)(6512007)(70586007)(186003)(2616005)(53546011)(6506007)(316002)(6862004)(54906003)(8676002)(356005)(33656002)(81166007)(36860700001)(86362001)(336012)(26005)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 17:33:46.4529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1d6db0-4e32-4100-28d8-08d99001f132
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5372

Hi Julien,

> On 15 Oct 2021, at 18:25, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 15/10/2021 17:51, Bertrand Marquis wrote:
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci=
.c
>> index 3aa8c3175f..35e0190796 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>      if ( !pdev->domain )
>>      {
>>          pdev->domain =3D hardware_domain;
>> +#ifdef CONFIG_ARM
>> +        /*
>> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci =
handler
>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>> +         */
>> +        ret =3D vpci_add_handlers(pdev);
>=20
> I don't seem to find the code to remove __init_hwdom in this series. Are =
you intending to fix it separately?

Yes I think it is better to fix that in a new patch as it will require some=
 discussion as it will impact the x86 code if I just remove the flag now.


>=20
> With that addressed:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20

Thanks
Bertrand

> Cheers,
>=20
>=20
> --=20
> Julien Grall


