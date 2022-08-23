Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4459DAB6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 12:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391877.629888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQRF2-0001ih-5c; Tue, 23 Aug 2022 10:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391877.629888; Tue, 23 Aug 2022 10:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQRF2-0001g9-2z; Tue, 23 Aug 2022 10:34:40 +0000
Received: by outflank-mailman (input) for mailman id 391877;
 Tue, 23 Aug 2022 10:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jact=Y3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQRF0-0001g3-SE
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 10:34:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f1769b1-22cf-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 12:34:36 +0200 (CEST)
Received: from AM5PR0601CA0052.eurprd06.prod.outlook.com (2603:10a6:206::17)
 by AM0PR08MB4081.eurprd08.prod.outlook.com (2603:10a6:208:12b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 10:34:30 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::99) by AM5PR0601CA0052.outlook.office365.com
 (2603:10a6:206::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17 via Frontend
 Transport; Tue, 23 Aug 2022 10:34:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 10:34:30 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 23 Aug 2022 10:34:30 +0000
Received: from 0de31e3b57c3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB7DA802-760B-46F6-B48A-A0B0303F51DC.1; 
 Tue, 23 Aug 2022 10:34:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0de31e3b57c3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 10:34:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6132.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 10:34:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 10:34:22 +0000
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
X-Inumbo-ID: 2f1769b1-22cf-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lQlYmxqPu93r3WJMz3dPuJsCHziyDmnANc9TJxD4cqRY1SS2zncUyq2YKP+ZZEY9kGTbmkg6XUJcVzQ2dwWCX56XEMR2rYu3HvzSCJmBBSc6Fh/GU8VFmyOfIfhngzIyn5y3H8aqDuY+Zy+NF/RmwMBNxnutp4PshNi5XD2lB3DE+NXL4t52NZP2JScTIWOmXy9prX5v5DtHIy7UlqYQOBSu1HZ84+RpynxCY0+ggQHgZvEn188j8KtndwWuqqUVKjgQTozX129LXuQOCgr/0DJOL/SZDxER5uAuJTCqR/4ir9knKq/bhT/I/4uKNtPPVvC8iqU6S5VsMMdzD1zL1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ei3CUA46LlszbbGhslBtbz7x4GzxZs5jC5SmUadZR0=;
 b=Jj1tR7ypLrSHd/BINFHswPXUX5jCkD7SW5+sHOQBGiOK/iYkYyQPwRWxIjrnTyf3iMMidikuFHsorJm/oDxytVoTDF5KJUCmJJ0JqC+DgAGnJDakTZYR3ECZ7bc+gN4NuB5ztw//l/8oxB2ALTgdM/75TeeIU6g2amyLp2gJXp5Rul1y2VxL+71CQNpGRM+o5C3D4hQ4oNFXUMgletx8E8TNI+SuIYoIvJ0JKji9gTP6sQ6337Y3Nwcj4LrwB85/rkOXCw0kngE+YTtDghpQ1WaeuKG6GtrQ1Sg8WHCFrTUA3fp6wpSfM4+RIvLw6jsrx9NnddeQZfZELDyjLnqsVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ei3CUA46LlszbbGhslBtbz7x4GzxZs5jC5SmUadZR0=;
 b=pUk5OuwLq7DXckyM7JuPL8tK+gflBHWSID3J2or9yKqbvUO+xqpmf1zDD9n+bjOZVZwgifT3vr47bDgrwZUzmciwH8pHy4sCx312dO2gOmQJ3/vTO/ZWyW/54ZoCB91Jt3l16vHnbW65kCSK7gzU4CJPZq+haSGmf5mbc2ulHY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d44179c6c285c16
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSX1sTyx6A+4vPoVW1qVc6IhczkjhLzkwFDo0I+Q01BjCte9exSe+lLUy5mdgvlwLUjmdK32rnB4UsCk9FzW9pUZkSsmra+TTBSMRM/IEAdTxR8DZKhd80z/Z65v72jFE8V541TFkPWUR8Otjsx3waedvE/utFxIobyo60BB/LnR5kNrUcAlnRKBwC8EDHakcMXEqt1puY7XPr3Kn8Aqsn4yX1ySrzjpnpv0HwvPFeaMWgIrjWRhQ/48rOiaff4vgnSQCeFby0sGKvc4u23lGwqwvQcopmg+ZQadB4nTfPGYbspAeGSf0Fn53rG6jFm8MVCct8ytJfd+0S+rs/86pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ei3CUA46LlszbbGhslBtbz7x4GzxZs5jC5SmUadZR0=;
 b=PmGlq+xUShQJGw9hVSPr4cjb6t6RXiKLhO4UhmiSwMDPxeeA6SayJ/r++EK11ivcXu7GmoXFF6xNZgetloR/bPHM1wsqNCqPyAj81WvcmaoFldpFeA6y5uFER99t6HRhO235mW8W+Sukvj2aOpAA6WkCn+q24rKMY8Zd4yvQ6tfMSND8L+vxthjtJj0baesGXegbBD9UTYrQHCpJb475rZ9pgrTXnEeefQGBiNnefSgnlUFvre0yNip2F/c0OfI/zGVs3gKzDE7qdMQdHwAbNKgbHdEbzPID5T+fyadKhUB+HYOB2/nGr59hP5X4f9OiW6xPkYEyR3LTYFr90LrP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ei3CUA46LlszbbGhslBtbz7x4GzxZs5jC5SmUadZR0=;
 b=pUk5OuwLq7DXckyM7JuPL8tK+gflBHWSID3J2or9yKqbvUO+xqpmf1zDD9n+bjOZVZwgifT3vr47bDgrwZUzmciwH8pHy4sCx312dO2gOmQJ3/vTO/ZWyW/54ZoCB91Jt3l16vHnbW65kCSK7gzU4CJPZq+haSGmf5mbc2ulHY0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: smmu: Set s2cr to type fault when the devices
 are deassigned
Thread-Topic: [PATCH v2] xen/arm: smmu: Set s2cr to type fault when the
 devices are deassigned
Thread-Index: AQHYrZj1WX2EfvXPyEi5kwWRf4bDsK2q/YiAgBFfFYA=
Date: Tue, 23 Aug 2022 10:34:21 +0000
Message-ID: <098BFF1B-DE23-4ACB-A968-12D0B96CB217@arm.com>
References:
 <3d254f1c7045bc212c5700c1becde458174e5bf3.1660232299.git.rahul.singh@arm.com>
 <77f76e28-a397-ffc5-5e6e-e286878f4070@xen.org>
In-Reply-To: <77f76e28-a397-ffc5-5e6e-e286878f4070@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 206f81d1-3ab6-4964-4a65-08da84f30fd4
x-ms-traffictypediagnostic:
	AM9PR08MB6132:EE_|AM7EUR03FT026:EE_|AM0PR08MB4081:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ImyNZnc3BA+gu5V3gRStJwc7DEThO24pKkwR3lDhCgEwDdepFD+lLBtf3Sw1filXjzCRkq99oWT9r73BHPKOxg6WEERbP/n5ND+yXxXgP5AHZss9ZKekHV/pEIzM4b3j9kOXttstpCuzDB0ubA1avZ68V/KzhrPqEdEnIbw/5zvH6hwex1basE1HEvXlXIIg5/Nh7p3FhU3rieyVlBN/67B+MsgwMq+R1BV4QOyxre5YhOM3bDfIwpYyWYJv6QMECyNedWJOUxY3Qw6d2M6e621W7Jx3dOt5XUAnVKIlGwmms6Ye8A/PsIc7K1Ps5fOy5a9lt79siW2bHp9ZiREpmgXjFFZVVJYyX8qgIPkFfenIuLNM0hBgzb4CeS86hh/CSjGsXduVICeDaDBsVPISavFId+mttubmTn3OCqIruFaRj73IiBOiTG/+zK4aGVIP/tkO7kLmZ+pFhxrw+lfD9etVClzelqaL0d18OyHOMkXP3YoRweX1TcnkChX/+tzhbvDlqRWK4ZdU5FCvzu7fby9+a48Rr6x/LV8rFvPX1NuifewbByXJw9QPYyMIWF6/woKgfD98IhJHZE6VWG6ijvgEYMI88y7C5eXlspOBjp8kMYwkdi/VMuhW3zLEiOCdsFyfCSSSs22u7TMrll9mQoShT/eNAqLxX4J0qvj+HH9AAVr/2vRu6BjPB5jZMxFQgnSxJuXV3gYOyhLLYCfeib2qog7QWVAd4qTv5GGC9aVI9HF940o1DpV+Pc/nqghKEHvdRbEDoypW0wYqouH6VncyusR0AQqJlFmyN2PebW4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(2906002)(36756003)(4326008)(5660300002)(8676002)(66556008)(91956017)(64756008)(66446008)(66476007)(66946007)(76116006)(316002)(33656002)(6506007)(6916009)(54906003)(41300700001)(71200400001)(53546011)(6486002)(478600001)(26005)(6512007)(38100700002)(38070700005)(186003)(86362001)(2616005)(122000001)(4744005)(8936002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9E92291B28CB0646BE4F02B37F9140D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6132
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40c5b295-f3ff-48cc-2bdf-08da84f30ac6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GFgOMJ7i1//HJsMSZJg4Oo9Rggkq70fqK1hH8njA4HFr5L+iCMSqgulb16FRBO4rG135ej0FtVHlKV4hs70Jk0d03V1mhrmPLNLkz2F5wDpLMpm4KZ3gfigvEI1YsDHU1P5dPcznGJhZmCkHl+O1Jg/04FjxlvuRkV6UMBzEv+mZsSnksteh6sQyKDoLpbxN0x0TTbvYBjS291VPSzx4R4jPa1bXymlqOxGowBML8kEk63GGVisXbnCXRhshYTzymmam/dgXIjZ7MV0qMMriLxwaQser50cEwoFrelIjZhoENXGDOTtM6xWP1+9nsuZKndNYLuZsYQTn/bipTZeRfnkr4y6awj2w0cNkMfTksb61OLry5IIzVr1gKx2dla9voCJMRukO1Ac/WT+E8v5tldAm+fnGKtIxJuwy/4Zzj6gxQ15LtVJJ7RZd8ScZ7XJM+SZ1wDMz/P3MR+lj3t7Gclb/ceONDXb5MHcdVWYGIs11qVR9Sit4VB1BbEpZSEJTQh2n9aCCIpZvKITn0e7Yw7W+t8omIE8f3XTN8/ThfxawspDCVpgfL9qUiOkMvQxlo25hD+Kvv0VyMrCwrbu5NYtJvYzbmqGy4LfSFdj+ukm23xsOE0/2IG5ZjMPuAwUlmxJgvUpnr58szDxFV3+bKHstHRGRnLafd41kJz1DnPDNzX38XXZ5VFj5OL5OLq5wjq6prQ3VuFo8p0++pDIFwtQcCBECD6FMzHMKtHOJyknq32nsViNaBwjAr8PDiPCh+RiulnEu4HenIx4+TJVPRg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(36840700001)(40470700004)(70206006)(316002)(6486002)(70586007)(8676002)(8936002)(6862004)(41300700001)(107886003)(54906003)(83380400001)(53546011)(2906002)(336012)(6506007)(6512007)(4326008)(478600001)(47076005)(36756003)(26005)(2616005)(5660300002)(186003)(40480700001)(33656002)(40460700003)(86362001)(356005)(36860700001)(82310400005)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:34:30.3211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 206f81d1-3ab6-4964-4a65-08da84f30fd4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4081



> On 12 Aug 2022, at 10:17, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 11/08/2022 16:42, Rahul Singh wrote:
>> When devices are deassigned/assigned, SMMU global fault is observed
>> because SMEs are freed in detach function and not allocated again when
>> the device is assigned back to the guest.
>> Don't free the SMEs when devices are deassigned, set the s2cr to type
>> fault. This way the SMMU will generate a fault if a DMA access is done
>> by a device not assigned to a guest.
>> Remove the arm_smmu_master_free_smes() as this is not needed anymore,
>> arm_smmu_write_s2cr will be used to set the s2cr to type fault.
>=20
> NIT: I would write arm_smmu_write_s2cr() so it is consistent with the lin=
e above.
>=20
>> Fixes: 0435784cc75d ("xen/arm: smmuv1: Intelligent SMR allocation")
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

@Julien: could you fix the NIT on commit ?

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


