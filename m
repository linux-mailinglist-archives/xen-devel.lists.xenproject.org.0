Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9155FB42
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 11:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357691.586424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Tbx-0003QC-Ti; Wed, 29 Jun 2022 09:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357691.586424; Wed, 29 Jun 2022 09:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Tbx-0003NS-QG; Wed, 29 Jun 2022 09:03:49 +0000
Received: by outflank-mailman (input) for mailman id 357691;
 Wed, 29 Jun 2022 09:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DiI7=XE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6Tbw-0003NM-T5
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 09:03:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62fee4ef-f78a-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 11:03:48 +0200 (CEST)
Received: from AM6PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:20b:b2::24)
 by AM6PR08MB4935.eurprd08.prod.outlook.com (2603:10a6:20b:d5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 09:03:39 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::7f) by AM6PR08CA0012.outlook.office365.com
 (2603:10a6:20b:b2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Wed, 29 Jun 2022 09:03:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 09:03:39 +0000
Received: ("Tessian outbound 4748bc5c2894:v121");
 Wed, 29 Jun 2022 09:03:38 +0000
Received: from 10fdb726acf2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 582CE289-96DC-47C7-8267-42205B524180.1; 
 Wed, 29 Jun 2022 09:03:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10fdb726acf2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 09:03:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB4201.eurprd08.prod.outlook.com (2603:10a6:10:a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 09:03:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Wed, 29 Jun 2022
 09:03:26 +0000
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
X-Inumbo-ID: 62fee4ef-f78a-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lFOKF82+Ccpc2XKxJOTymJDPTLvmZSGCR9BO+3inUHHrVUsrjvTB8AB3f5DLEiwx2DJi7+9Qn/HqtiDK/QqEw22EP8AAY0GWjmFB4BPAELZySxuLUWzHvjVX8nD7y4Jp8wIz0065hnrjX7N3AXf/rPhTs47g8as0QEJ+alNNVWYPI6smg/TRNEtU2/TaMc/MjLCEGozm731c8FhMHr0BTIeNlKpJP9vSaGlT6TW/T/clVrP1K57kTaZZ9IwnddGBT3ZI1EvdNrkiqS1MCIeYyRUJuCHJTP8dwJ2xRUX2aTRQ4aWEQIg3VY/7ztcgbB+A0h2l9KK3tl52hMdARmtmjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSk1Zu5fOg8U/urVtk/KJpmPDHRMBlo3TzNdLX3+2V0=;
 b=XXsKs7wSOZbkqmuFGAj9JfxeDjo5waDVm5GmbmLmFfPFjHwcCt+tCehGRnZF+9WogPjScZFiijWFEomKuJEEG6SxxB05whtO8ga7ZOaDDiquBQhwKEIgYUmmxi+I7awKJKvpb4Qr176rQCEmVVmD1RE9VWwI54R8sSKfGwOndF9qJKgIZvUPhXAQbUuR94lk5Wf0luHVsMW9ndepmtU2rsZ/WKLi2TYYTPYy7OUJEZGCl7OQpOXkX7DuVGRZMG5kRVvIP5+uHfwwI2tqu4+YKI/hzwM1A2r0ih/uaAGgFT3TfVPbv2i9ddIlmpZS1orLQUTu4M/wyafXZKB5FnIrbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSk1Zu5fOg8U/urVtk/KJpmPDHRMBlo3TzNdLX3+2V0=;
 b=4jz3jco5Y+LoKWiVQI5GGuoDz0+uVUTFYzudLNLtwxgpMH1qN68hlThnCYvT/cpMXSqKANSm2j0Z2bLWo6m7RaBsNvgtW1X6K56s02+VbUT17Gn5gDwMsVJJxvaBfcpP+31r+MF9RizpH5yN3+o4xsVY6syCTiBSZkSfXCUnbRo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 717b301f47cfab62
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiChj5tQy4Hpu8NRIHW3EgVMkjoN3D0K8k9P5QFV/AjCfHrK/guQJVMb3MTTwFG90D28SM+xgnd3yc2l0zlR4nnohYe/jre8nZnyP60X1bcAW1KBxfZbVCeNIV/J4EODqcDrHpsS42OeZHcqggyEUce6iXXThqHv3ln9lRnJ0NVeIvj2TM5Z3bWy2Jng2ch+5qY5CjiYjF6jph87Awl49RutMooXUWW4MJo8PT3RVswL2xR0KuySR0i1bs6MoFvDRXjkvXcVCYF1OiQ0zAqUb0ZrCz1SKNdwuOBhvfDn+LV69rYWoDZFOGpuvZq12wGovc7ec9qeiMOcERojHfHBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSk1Zu5fOg8U/urVtk/KJpmPDHRMBlo3TzNdLX3+2V0=;
 b=EUUJL5GeMNJZltLFcXuQOics4YGDsyed0JbG6rzsAwv7R02Zwj/V5Rn8UHRM+d8GD/PDRlmzii/oSa3T82SoJyetKG7WC4EtPpJsfzdx/PIVuefKR8K1PgN9IKMEzG3OgqF6fqXxkNZPUb+t211vsjGNJuPVD/0adktuFX5gHlDyqQ3cnoHQFGiin7qL43YjHygDL/k6M7phR35pLetyvwQkzBpGTx1MLg2neQA03edWbS9xDZ3nsTKphgmUT14cyLhVq3WIOVCIFo/0MkeGCdZZoCcFjSUJt8aCJyxDMw73fOSqkE3OtI9foL15KtaUZQuxNhHuHJUFYi8H+BXHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSk1Zu5fOg8U/urVtk/KJpmPDHRMBlo3TzNdLX3+2V0=;
 b=4jz3jco5Y+LoKWiVQI5GGuoDz0+uVUTFYzudLNLtwxgpMH1qN68hlThnCYvT/cpMXSqKANSm2j0Z2bLWo6m7RaBsNvgtW1X6K56s02+VbUT17Gn5gDwMsVJJxvaBfcpP+31r+MF9RizpH5yN3+o4xsVY6syCTiBSZkSfXCUnbRo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: xenia <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Thread-Topic: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Thread-Index: AQHYiwEFKAxihkpP+kCxp/TNi89h5q1l/I6AgAAZcwCAAAIrgA==
Date: Wed, 29 Jun 2022 09:03:25 +0000
Message-ID: <D8C0B798-C736-45CC-A723-1535131F1323@arm.com>
References: <20220628150851.8627-1-burzalodowa@gmail.com>
 <BF0AB23A-DB4B-4DA3-9E4C-C15FAD360247@arm.com>
 <1b28f8b2-2153-61f6-515f-b2ed880f84b6@gmail.com>
In-Reply-To: <1b28f8b2-2153-61f6-515f-b2ed880f84b6@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 534e5fc9-b656-4ef4-36c0-08da59ae41eb
x-ms-traffictypediagnostic:
	DB8PR08MB4201:EE_|AM5EUR03FT056:EE_|AM6PR08MB4935:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6eOrqt80QuEe9a5VSucjdknInMRsdtFTtRxQHb0tg07MvTnNEjxXvCV45vE0OFdZIsoa/QPIMQLSb7Yo+zTEd0WdepfNO77tWMjMw9dgy0bI8aHfNgt1YF7GAACUvdWzc9RHtFanpRGQ78Qik7A698hXg+lC+Uct9GjFptbmkpYjQd11ybc52/mMLpx5J6l/RuTGoR0avi3Kb+BqzySQ1sPXexe2090ZcSlWe1ef1XXEieSi8ycn9HVqFsK/PySzaJNY9X9t3rrq5axIp9BV7y2Wu1enLwrLjA9VeOwjU2t0TlJbARYP/TaSjsQvSSJ240WZx/BiOECFRySUxegqysOo5hUc4H7ec36l3wmcy1XhIpdfqLvBmuQ/L5vT6If2Tzj4mTyLWGV82V8Do/cCwechwC6xQROBta8dO0tH6WjWg7wRHnS70G9Z2KpwOAlZK77ljyNXFxN/udT7a9ScsReWmHwyWekTuTY7l/9LsShaBaMnqpyOmS/dSu2BT4C8zOJ4Rt1I/i+5oUwCBB/azoGUF4VfrdBxxzUIqMTHoCDV5aGNnLm4uvuq8QgViepwq6SGIi/qaxy26AF5ZapIir5XmssmBVkSVyDWpMDH7lpifdFy3v/3s35Gqhdsotk0GfDbkTuS/OihjGayM7JxjFUs4N9AfuRV1h1gawPVTXF7NWsT6vu798t+f6ZrHG1Z9RRoD81Vu0S7RWuEw+5tju2d4fjP+owLHOCteEQ5zAorZ/PhY+HCInj22eJpyuoYFFNorQVQihoPze5K6CcW+VY815ZCbFhnijXu8ljeSneC2DAsVvwT9KofXQuQl9MIkkjX7E9sgCqc5VHAq60gbw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(6486002)(53546011)(6512007)(41300700001)(26005)(478600001)(54906003)(36756003)(8936002)(83380400001)(6506007)(38070700005)(71200400001)(2616005)(186003)(2906002)(6916009)(33656002)(4326008)(91956017)(122000001)(66946007)(66446008)(76116006)(5660300002)(86362001)(66556008)(64756008)(38100700002)(8676002)(66476007)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5D0ACE7525C3D4888508C7C4E58DCE2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4201
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f08d5cc-eb81-4de8-f2f6-08da59ae3a19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y56Ok6OFZD4XuYhfdedhL0G+rNcPuGa4h6dMdYAsbHA+6zENG6FYdfkTFEe9kcK52pCulAdGjmjE0MgxX9idzVxYJdmUos9QWcbU3rNue5/Tu93/XZp5qiNErgHvOSyDdDiBPcXdBiPb+ZFfMQAYg+L3Z8J+P6WX+OB4uLkX8/syDr3Lh+Ewu5ecQjQUpBCGGfpd7xYwMfdFVTH+Pae7B3xroklHM9jZ3dRmv8LfWsT90bWsIRgBRTeHh7P1kkdohdjMS95A7RsOXJQFV+UD/K3R6rPsqqoQcPaqL6k2sXUzYqjputhjTFIe5YpL4csi/D90vkSDeUp0dSsNbSl/TFWRX0pTrOlz3W74oxE6wzUzIVgjEWnSHIvEgxYXgYMTRfBmaenvQQGouATzBO2tQ4xzjMharXJ+HOxgLk9Vgg7OJdD/LKD8iI8L9lxAZye380wvntyNmalKmtHebugMEQFP98yAIvE75kr1cEjGySTmO9TJctx1/eBBRdMfOdwXA81YUGusgafXPl/VPLoN3G1nxTWyw8ZwkUgZrdidwSEgv/OnA1dr2Y8hTU/rgM2yo61uOIImiYeV4+XaPUFS9KG9Y2+7rMixQVYeoLpu0vEuWdtj36EE8bNhAOZZUDSnSGHyll9xbtMlW0YACNYVJlJlWj/Gblah5o1jnVl6tPVIOhf8Ds7QERGTM7GtOaV94pkMNjbGz/U9mKlcOamEpwhAQnuC+0Jfz1XO9ujplLBLmKzaWZCT4+9f2+UQeot80o5tPEinCKEJD58utmTDQ14O7zEFhgqXfI/Cl545GNU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(40470700004)(36840700001)(46966006)(316002)(107886003)(40480700001)(5660300002)(36756003)(81166007)(6512007)(33656002)(82310400005)(2616005)(54906003)(26005)(70586007)(70206006)(36860700001)(356005)(82740400003)(6486002)(86362001)(53546011)(4326008)(8676002)(40460700003)(186003)(6506007)(2906002)(41300700001)(6862004)(478600001)(8936002)(83380400001)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 09:03:39.0818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 534e5fc9-b656-4ef4-36c0-08da59ae41eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4935

Hi Xenia,

> On 29 Jun 2022, at 09:55, xenia <burzalodowa@gmail.com> wrote:
>=20
> Hi Bertrand,
>=20
> On 6/29/22 10:24, Bertrand Marquis wrote:
>> Hi Xenia,
>>=20
>>> On 28 Jun 2022, at 16:08, Xenia Ragiadakou <burzalodowa@gmail.com> wrot=
e:
>>>=20
>>> The expression 1 << 31 produces undefined behaviour because the type of=
 integer
>>> constant 1 is (signed) int and the result of shifting 1 by 31 bits is n=
ot
>>> representable in the (signed) int type.
>>> Change the type of 1 to unsigned int by adding the U suffix.
>>>=20
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>> Q_OVERFLOW_FLAG has already been fixed in upstream kernel code.
>>> For GBPA_UPDATE I will submit a patch.
>>>=20
>>> xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
>>> index 1e857f915a..f2562acc38 100644
>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>> @@ -338,7 +338,7 @@ static int platform_get_irq_byname_optional(struct =
device *dev,
>>> #define CR2_E2H				(1 << 0)
>>>=20
>>> #define ARM_SMMU_GBPA			0x44
>>> -#define GBPA_UPDATE			(1 << 31)
>>> +#define GBPA_UPDATE			(1U << 31)
>>> #define GBPA_ABORT			(1 << 20)
>>>=20
>>> #define ARM_SMMU_IRQ_CTRL		0x50
>>> @@ -410,7 +410,7 @@ static int platform_get_irq_byname_optional(struct =
device *dev,
>>>=20
>>> #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
>>> #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
>> Could also make sense to fix those 2 to be coherent.
> According to the spec, the maximum value that max_n_shift can take is 19.
> Hence, 1 << (llq)->max_n_shift cannot produce undefined behavior.

I agree with that but my preference would be to not rely on deep analysis o=
n the code for those kind of cases and use 1U whenever possible.

What other maintainers think on this ?

>=20
> Personally, I have no problem to submit another patch that adds U/UL suff=
ixes to all shifted integer constants in the file :) but ...
> It seems that this driver has been ported from linux and this file still =
uses linux coding style, probably because deviations will reduce its mainta=
inability.
> Adding a U suffix to those two might be considered an unjustified deviati=
on.

At this stage the SMMU code is starting to deviate a lot from Linux so it w=
ill not be possible to update it easily to sync with latest linux code.
And the decision should be are we fixing it or should we fully skip this fi=
le saying that it is coming from linux and should not be fixed.
We started to have a discussion during the FuSa meeting on this but we need=
 to come up with a conclusion per file.

On this one I would say keeping it with linux code style and near from the =
linux one is not needed.
Rahul, Julien, Stefano: what do you think here ?

Cheers
Bertrand

>>> -#define Q_OVERFLOW_FLAG			(1 << 31)
>>> +#define Q_OVERFLOW_FLAG			(1U << 31)
>>> #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
>>> #define Q_ENT(q, p)			((q)->base +			\
>>> 					 Q_IDX(&((q)->llq), p) *	\
>> Cheers
>> Bertrand


